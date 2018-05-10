<%@ page import="teachmealex.BDController" %>
<!DOCTYPE html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/login.css">
</head>
<body>

<%
    String completeURL = request.getRequestURL().toString() + "?" + request.getQueryString();
    BDController bdController = new BDController();
    String user = "";
    String display = "none";
    String password = "";
    int codUser;
    String display2 = "none";
    bdController.status0();
    if (!completeURL.contains("null")){
        if (completeURL.contains("register")) {
            user = request.getParameter("usuario");
            password = request.getParameter("pass");
            codUser = bdController.ultimoCodUser() + 1;
            display="block";
            display2="none";
            bdController.altaUsuario(user, password, codUser);
        }
    }

    if (!completeURL.contains("null")){
        if (completeURL.contains("Entrar")) {
            user = request.getParameter("usuario");
            password = request.getParameter("pass");
            if (bdController.existeUsuario(user, password)) {
                int cod = bdController.codUser(user);
                bdController.status(cod, user);
                response.sendRedirect("index.jsp");
            } else if (!bdController.existeUsuario(user, password)) {
                display2 = "block";
            }
        }
    }


%>

<div class="container">
    <div class="row">

        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <img id="img" src="img/english/logo.png"/>
                        <div class="col-xs-6 bajar">
                            <a href="#" class="active" id="login-form-link">Acceder</a>
                        </div>
                        <div class="col-xs-6 bajar">
                            <a href="#" id="register-form-link">Registro</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="login-form" action="#" role="form" style="display: block;">
                                <div class="form-group">
                                    <input type="text" name="usuario" id="username" tabindex="1" class="form-control" placeholder="Usuario" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="pass" id="password" tabindex="2" class="form-control" placeholder="Contrase&ntilde;a">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Entrar">
                                        </div>
                                    </div>
                                </div>
                                <div id="loginError" style="display: <%out.print(display2);%>;" class="alert alert-danger" role="alert">
                                    Datos incorrectos
                                </div>
                                <div id="registroExitoso" style="display: <%out.print(display);%>;" class="alert alert-success" role="alert">
                                    Registro correcto, puede logearse!
                                </div>
                            </form>
                            <form id="register-form" action="#" role="form" style="display: none;">
                                <div class="form-group">
                                    <input type="text" name="usuario" id="usuario" tabindex="1" class="form-control" placeholder="Usuario" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="pass" id="pass" tabindex="2" class="form-control" placeholder="Contrase&ntilde;a">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Registrar">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {

        $('#login-form-link').click(function(e) {
            $("#login-form").delay(100).fadeIn(100);
            $("#register-form").fadeOut(100);
            $('#register-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });
        $('#register-form-link').click(function(e) {
            $("#register-form").delay(100).fadeIn(100);
            $("#login-form").fadeOut(100);
            $('#login-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });

    });

</script>
</body>
</html>