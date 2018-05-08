<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="routes/header.jsp"%>

<body>
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
                            <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="#">Vocabulario</a></li>
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
                <label for="inputCategory" class="col-sm-2 col-form-label">Categoría</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cat" id="inputCategory" placeholder="Escriba la categoría">
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