<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="routes/header.jsp"%>
<%@ page import="teachmealex.*" %>
<%@ page import="java.util.ArrayList" %>
<body>
<%
    BDController bdController = new BDController();
    if (bdController.getStatus() == 0){
        response.sendRedirect("login.jsp");
    }
    ArrayList<Verbo> verbos= new ArrayList<Verbo>();
    verbos = bdController.dameVerbos();

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
                                <li class="breadcrumb-item active" aria-current="page">Verbos</li>
                            </ol>
                        </nav>
                    </span>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><i data-toggle="tooltip" title="Alta" class="glyphicon glyphicon-plus-sign"></i></a></li>
                        <li><a href="#"><i data-toggle="tooltip" title="Baja" class="glyphicon glyphicon-minus-sign"></i></a></li>
                        <li><a href="#"><i data-toggle="tooltip" title="Modificación" class="glyphicon glyphicon-pencil"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <h2>Mi cartera de verbos<img src="img/english/verbs.png" id="logoverb"></h2>
        <ul class="nav navbar-nav navbar-right" id="modificaciones">
            <li><a href="#"><i class="glyphicon glyphicon-plus-sign"></i></a></li>
            <li><a href="#"><i class="glyphicon glyphicon-minus-sign"></i></a></li>
            <li><a href="#"><i class="glyphicon glyphicon-pencil"></i></a></li>
        </ul>
        <table class="table table-hover">
            <thead>
            <tr class="danger">
                <th scope="col">Español</th>
                <th scope="col">Presente</th>
                <th scope="col">Pasado</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < verbos.size(); i++){
                    out.print("<tr>");
                    for (int j = 0; j < 3; j++){
                        if (j == 0){
                            out.print("<td>"+verbos.get(i).getVerb()+"</td>");
                        }else if (j == 1){
                            out.print("<td>"+verbos.get(i).getPresent()+"</td>");
                        }else if (j == 2){
                            out.print("<td>"+verbos.get(i).getPast()+"</td>");
                        }
                    }
                    out.print("</tr>");
                }
            %>
            </tbody>
        </table>
        <p><br><strong><i class="glyphicon glyphicon-plus-sign"></i></strong> Para añadir una nueva palabra, recuerda, escribir la categoria a la que pertenece. No se preocupe si no la encuentra, existe la posibilidad de crearla!<br></p>
        <p><i class="glyphicon glyphicon-minus-sign"></i> Para eliminar una palabra de su vocabulario.<br></p>
        <p><i class="glyphicon glyphicon-pencil"></i> Para editar una palabra ya existente.</p>
        <div class="line"></div>
</div>





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
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>