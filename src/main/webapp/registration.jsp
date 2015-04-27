<%-- 
    Document   : registration
    Created on : Apr 10, 2015, 1:33:28 PM
    Author     : mdeboer1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link href="css/management.css" rel="stylesheet" type="text/css"/>
        <title>Registration</title>
    </head>
    <body>
        <header id="header"><br>
            <h1>Enter in the information below to create a new account</h1>
        </header>
        <div id="container">
            <div id="userInfo" class="col-md-6">
                <form id="userInteractionPanel" name="userInteractionPanel" 
                          method="POST" action='<%= 
                                  response.encodeURL("registrationcontroller")%>'>
                    <label for="firstName">First Name</label>
                    <input id="firstName" name="firstName" type="text" class="form-control">
                    <label for="lastName">Last Name</label>
                    <input id="lastName" name="lasttName" type="text" class="form-control">
                    <label for="address">Address</label>
                    <input id="address" name="address" type="text" class="form-control">
                    <label for="city">City</label>
                    <input id="city" name="city" type="text" class="form-control">
                    <label for="state">State</label>
                    <input id="state" name="state" type="text" class="form-control">
                    <label for="zipCode">Zip Code</label>
                    <input id="zipCode" name="zipCode" type="text" class="form-control">
                    <label for="email">Email</label>
                    <input id="email" name="email" type="text" class="form-control"><br>
                    <button id ="register" name="register" class="btn btn-default" type="submit">Submit</button>
                </form>
            </div>
        </div>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>            
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="resources/js/bootstrap-sortable.js"></script>
        <script src="js/hotel.js" type="text/javascript"></script>
    </body>
</html>
