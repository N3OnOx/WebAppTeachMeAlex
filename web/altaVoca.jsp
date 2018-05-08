<%@ page import="java.util.ArrayList" %>
<%@ page import="teachmealex.BDController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="routes/header.jsp"%>

<body>
<%
    ArrayList<String> categorias = new ArrayList<String>();
    BDController bdController = new BDController();
    categorias = bdController.dameCategorias();
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