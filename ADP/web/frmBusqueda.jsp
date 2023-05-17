<%-- 
    Document   : index
    Created on : May 13, 2023, 12:34:43 PM
    Author     : Rocio Abrego
--%>

<%@page import="Modelo.Damage"%>
<%@page import="Modelo.State"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.AMarca"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ADPDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <title>JSP Page</title>
        
        <script type="text/javascript">
        
        function MarcaOnChange(){
            var marcaid = $("#marca").val();
            
            $.ajax({
                type: "POST",
                url: "modelos.jsp",
                data: "marcaid="+marcaid,
                cache: false,
                success: function(response)
                {
                    $('#modelo').empty();
                    $("#modelo").html(response);
                }
            });
        }
        
        
    </script>
    </head>
    <body>
        <%
        //allow access only if session exists
        String UserName = null;
        if(session.getAttribute("UserName") == null || session.getAttribute("UserName") == "" ){
                response.sendRedirect("/ADP/index.jsp");
        }

        %>
        
        <h1>Titulo</h1>
        <form action="Controller" method="post">
        <div class="form-group m-2">
            <label for="exampleInputEmail1">Marca</label>
            <select class="form-control form-control-lg" id="marca" name="marca" onchange="MarcaOnChange()">
                <option value="0" selected="selected">-- Seleccione una marca --</option>
                <%
                    ADPDAO dao=new ADPDAO();
                    List<AMarca>list=dao.listarMarca();
                    Iterator<AMarca>iter=list.iterator();
                    AMarca marca=null;
                    while(iter.hasNext()){
                    marca=iter.next();
                %>
                <option value="<%= marca.getId()%>"><%= marca.getDescripcion()%></option>
                <%}%>
            </select>
        </div>
        <div class="form-group m-2">
            <label for="exampleInputEmail1">Modelo</label>
            <select class="form-control form-control-lg" id="modelo" name="modelo">
                <option value="0" selected="selected">-- Seleccione un modelo --</option>
            </select>
        </div>
        <div class="form-group m-2">
            <label for="exampleInputEmail1">Año</label>
            <select class="form-control form-control-lg" id="anio" name="anio">
                <option value="2022" selected="selected">2022</option>
                <option value="2021">2021</option>
                <option value="2020">2020</option>
                <option value="2019">2019</option>
                <option value="2018">2018</option>
            </select>
        </div>
        <div class="form-group m-2">
            <label for="exampleInputEmail1">Color</label>
            <select class="form-control form-control-lg" id="color" name="color">
                <option value="negro" selected="selected">Negro</option>
                <option value="blanco">Blanco</option>
                <option value="azul">Azul</option>
                <option value="rojo">Rojo</option>
            </select>
        </div>
        <div class="form-group m-2">
            <label for="exampleInputEmail1">Tipo de daño</label>
            <select class="form-control form-control-lg" id="damage" name="damage">
                <option value="0" selected="selected">-- Seleccione un tipo de daño --</option>
                <%
                    List<Damage> damageList = dao.damageList();
                    Iterator<Damage> iDamage = damageList.iterator();
                    Damage damage=null;
                    while(iDamage.hasNext()){
                    damage=iDamage.next();
                %>
                <option value="<%= damage.getId()%>"><%= damage.getDescripcion()%></option>
                <%}%>
            </select>
        </div>
        <div class="form-group m-2">
            <label for="exampleInputEmail1">Estado</label>
            <select class="form-control form-control-lg" id="state" name="state">
                <option value="0" selected="selected">-- Seleccione un estado --</option>
                <%
                    List<State> list_state =dao.listarEstados();
                    Iterator<State> iState =list_state.iterator();
                    State state=null;
                    while(iState.hasNext()){
                    state=iState.next();
                %>
                <option value="<%= state.getId()%>"><%= state.getDescripcion()%></option>
                <%}%>
            </select>
        </div>
        <div class="form-group m-2 d-flex justify-content-center">
            <button type="submit" class="btn btn-primary btn-lg">Submit</button>
        </div>
            
        </form>
    </body>
    
</html>
