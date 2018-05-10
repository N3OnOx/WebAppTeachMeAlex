<%@ page import="java.util.ArrayList" %>
<%@ page import="teachmealex.BDController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="routes/header.jsp"%>

<body>
<%
    String completeURL = request.getRequestURL().toString() + "?" + request.getQueryString();
    ArrayList<String> categorias = new ArrayList<String>();
    BDController bdController = new BDController();
    if (bdController.getStatus() == 0){
        response.sendRedirect("login.jsp");
    }
    categorias = bdController.dameCategorias();
    String error = "";
    String display = "none";
    boolean check = true;
    if (!completeURL.contains("null")){
        String category = request.getParameter("category");
        String esp = request.getParameter("esp");
        String ing = request.getParameter("ing");
        String cat = request.getParameter("cat");

        if (!completeURL.contains("specialWord")) {
            if (category.equalsIgnoreCase("Selecciona...")) {
                error = "Tienes que seleccionar una categoría";
                display = "block";
                check = false;
            } else if (category.equalsIgnoreCase("0") && cat.equalsIgnoreCase("")) {
                error = "Tienes que escribir una nueva categoría";
                display = "block";
                check = false;
            }

            if (!bdController.existePalabraEsp(esp)) {
                error = "No existe esa palabra en español";
                display = "block";
                check = false;
            } else if (!bdController.existePDiccionario("ding", ing)) {
                error = "No existe esa palabra en ingles";
                display = "block";
                check = false;
            }

            if (check) {
                if (category.equalsIgnoreCase("0") && !cat.equalsIgnoreCase("")){
                    bdController.insertarPalabra(esp,ing,cat, bdController.codUser(bdController.nameUser()));
                }else if (!category.equalsIgnoreCase("0")){
                    bdController.insertarPalabra(esp,ing,category, bdController.codUser(bdController.nameUser()));
                }
            }
        }else{
            if (category.equalsIgnoreCase("Selecciona...")) {
                error = "Tienes que seleccionar una categoría";
                display = "block";
                check = false;
            } else if (category.equalsIgnoreCase("0") && cat.equalsIgnoreCase("")) {
                error = "Tienes que escribir una nueva categoría";
                display = "block";
                check = false;
            }
            if (check) {
                if (category.equalsIgnoreCase("0") && !cat.equalsIgnoreCase("")){
                    bdController.insertarPalabraEspecial(esp,ing,cat, bdController.codUser(bdController.nameUser()));
                }else if (!category.equalsIgnoreCase("0")){
                    bdController.insertarPalabraEspecial(esp,ing,category, bdController.codUser(bdController.nameUser()));
                }
            }
        }
    }
%>
<div class="wrapper">
    <%@include file="routes/navbar.jsp"%>
        <!-- Page Content Holder -->
    <div id="content">
        <div class="imgresponsive"><img src="img/english/logo.png" id="logoresponsive"></div>
        <nav class="navbar navbar-default">
            <div class="container-fluid fixed-top">
                <div class="navbar-header">
                    <button type="button" id="sidebarCollapse" class="btn btn-dark navbar-btn">
                        <i class="glyphicon glyphicon-menu-hamburger"></i>
                        <span></span>
                    </button>
                    <span>
                        <nav aria-label="breadcrumb">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="carteraVoc.jsp">Vocabulario</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Alta</li>
                          </ol>
                        </nav>
                    </span>
                </div>
            </div>
        </nav>

        <h2>Alta de palabra</h2>
        <p>Vamos a introducir palabras en nuestra cartera de vocabulario. Para ello, especifica el significado en español, asímismo en Inglés y por último, escribe o selecciona una categoría de la lista de categorías</p>
        <div style="display: <%out.print(display);%>" class="alert alert-danger" role="alert" id="#errorForm">
            ¡<%out.print(error);%>!
        </div>
        <form action="altaVoca.jsp">
            <div class="form-group row">
                <label for="inputEsp" class="col-sm-2 col-form-label">Español</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="esp" id="inputEsp" placeholder="Escriba la palabra en español">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEng" class="col-sm-2 col-form-label">Ingles</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="ing" id="inputEng" placeholder="Escriba la palabra en ingles">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label" for="getFname">Categoría</label>
                <div class="col-sm-10">
                <select name="category" class="form-control" id="getFname" onchange="admSelectCheck(this);">
                    <option selected>Selecciona...</option>
                    <option id="admOption" style="font-weight: bold" value="0">Nueva</option>
                    <%
                        for (int i = 0; i < categorias.size(); i++){
                            out.print("<option value=\""+categorias.get(i)+"\">"+categorias.get(i)+"</option>");
                        }
                    %>
                </select>
                </div>
            </div>
            <div class="form-group row" id="admDivCheck" style="display: none;">
                <label for="inputCat" class="col-sm-2 col-form-label">Nueva categoria</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cat" id="inputCat" placeholder="Escriba una nueva categoría">
                </div>
            </div>
            <div class="custom-control custom-checkbox my-1 mr-sm-2">
                <input type="checkbox" name="specialWord" class="custom-control-input" id="customControlInline">
                <label data-toggle="tooltip" title="Alta" class="custom-control-label" for="customControlInline">Palabra especial</label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-danger">Alta palabra</button>
                </div>
            </div>
        </form>
        <div class="line"></div>
    </div>
</div>


<script type="text/javascript">
    function admSelectCheck(nameSelect)
    {
        if(nameSelect){
            admOptionValue = document.getElementById("admOption").value;
            if(admOptionValue == nameSelect.value){
                document.getElementById("admDivCheck").style.display = "block";
            }
            else{
                document.getElementById("admDivCheck").style.display = "none";
            }
        }
        else{
            document.getElementById("admDivCheck").style.display = "none";
        }
    }

</script>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- Bootstrap Js CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
</body>
</html>