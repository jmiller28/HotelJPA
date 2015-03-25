<%-- 
    Document   : index
    Created on : Feb 11, 2015, 8:30:57 PM
    Author     : John
--%>
<%--
    Object objData = request.getAttribute("hotels");
    if (objData == null) {
        response.sendRedirect("hotel");
    }
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Hotels</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <c:choose>
            <c:when test="${viewForm == null}">
                <c:set var="formVisible" value="display:none;" />
            </c:when>
            <c:otherwise>
                <c:set var="formVisible" value="display:visible;" />
            </c:otherwise>
        </c:choose>

        <div class="container-fluid">
            <h2>Hotel Manager</h2>
            <form class="form-horizontal" id="hotelForm" name="rectangleForm" method="POST" 
                  action="hotelPU?action=editHotel" style="${formVisible}">
                <div class="table-responsive">
                    <button class="btn btn-info" type="button" id="hotelId" name="hotelId"  
                            onclick="location.href = 'hotel?action=addForm'">Add Hotel</button>
                    <table class="sortable table">
                        <thead>
                        <th>Name</th>
                        <th>Street Address</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Zip</th>
                        <th>Notes</th>
                        <th colspan="1"></th>
                        </thead>
                        <tbody>
                            <c:forEach var="hotel" items="${hotels}" >
                                <tr>
                                    <td id ="id" class ="hidden">${hotel.hotelId}</td>
                                    <td>${hotel.hotelName}</td>
                                    <td>${hotel.streetAddress}</td>
                                    <td>${hotel.city}</td>
                                    <td>${hotel.state}</td>
                                    <td>${hotel.postalCode}</td>
                                    <td>${hotel.notes}</td>
                                    <td><button class="btn btn-success" type="button" id="hotelId" name="hotelId"  
                                                onclick="location.href = 'hotel?action=editForm&value=${hotel.hotelId}'">Edit Hotel</button></td>
                                    <td><button class="btn btn-danger" type="button" id="hotelId" name="hotelId"  
                                                onclick="location.href = 'hotel?action=deleteHotel&value=${hotel.hotelId}'">Delete Hotel</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table><button class="btn btn-info" type="button" id="hotelId" name="hotelId"  
                                    onclick="location.href = 'hotel?action=addForm'">Add Hotel</button>
                </div>
            </form>
            <c:choose>
                <c:when test="${editForm == null}">
                    <c:set var="editFormVisible" value="display:none;" />
                </c:when>
                <c:otherwise>
                    <c:set var="editFormVisible" value="display:visible;" />
                </c:otherwise>
            </c:choose>
            <form class="form-horizontal" id="hotelForm" name="rectangleForm" method="POST" 
                  action="hotel?action=editHotel" style="${editFormVisible}">
                <fieldset>
                    <legend>Edit Hotel</legend>
                </fieldset>

                <input class="form-control" id="hotelId" name="hotelId" type="text" 
                       placeholder="${hotelId}" value="${hotelId}" style="display:none;" />
                <div class="form-group">
                    <label for="hotelName" class="col-sm-2 control-label">Hotel Name: </label>
                    <div class="col-sm-3">
                        <input class="form-control" id="hotelName" name="hotelName" type="text" 
                               placeholder="${hotelName}" value="${hotelName}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="streetAddress" class="col-sm-2 control-label">Street Address: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="streetAddress" id="streetAddress" 
                               placeholder="${streetAddress}" value="${streetAddress}"/>           
                    </div>
                </div> 
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">City: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="city" id="city" 
                               placeholder="${city}" value="${city}"/>           
                    </div>
                </div>
                <div class="form-group">
                    <label for="state" class="col-sm-2 control-label">State: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="state" id="state" 
                               placeholder="${state}" value="${state}"/>           
                    </div>
                </div>
                <div class="form-group">
                    <label for="postalCode" class="col-sm-2 control-label">Zip: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="postalCode" id="postal"  value="${postalCode}"/>           
                    </div>
                </div>
                <div class="form-group">
                    <label for="notes" class="col-sm-2 control-label">Notes: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="notes" id="notes"  value="${notes}"/>           
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input class="btn btn-warning" type="submit" name="submit" id="submit" value="Save" />           
                        <button class="btn btn-primary" type="button" id="hotelId" name="hotelId"  
                                onclick="location.href = 'hotel?action=cancel'">Cancel</button>
                    </div>
                </div> 
            </form>
            <c:choose>
                <c:when test="${addForm == null}">
                    <c:set var="formVisible" value="display:none;" />
                </c:when>
                <c:otherwise>
                    <c:set var="formVisible" value="display:visible;" />
                </c:otherwise>
            </c:choose>
            <form class="form-horizontal" id="hotelForm" name="rectangleForm" 
                  method="POST" action="hotel?action=addHotel" style="${formVisible}">
                <fieldset>
                    <legend>Add New Hotel</legend>
                </fieldset>
                <div class="form-group">
                    <label for="hotelName" class="col-sm-2 control-label">Hotel Name: </label>
                    <div class="col-sm-3">
                        <input class="form-control" id="hotelName" name="hotelName" type="text" value=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="streetAddress" class="col-sm-2 control-label">Street Address: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="streetAddress" id="streetAddress" value=""/>           
                    </div>
                </div> 
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">City: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="city" id="city" value=""/>           
                    </div>
                </div>
                <div class="form-group">
                    <label for="state" class="col-sm-2 control-label">State: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="state" id="state" value=""/>           
                    </div>
                </div>
                <div class="form-group">
                    <label for="postalCode" class="col-sm-2 control-label">Zip: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="postalCode" id="postalCode"  value=""/>           
                    </div>
                </div>
                <div class="form-group">
                    <label for="notes" class="col-sm-2 control-label">Notes: </label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" name="notes" id="notes" value=""/>           
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input class="btn btn-warning" type="submit" name="submit" id="submit" value="Save" />           
                        <button class="btn btn-primary" type="button" id="hotelId" name="hotelId"  
                                onclick="location.href = 'hotel?action=cancel'">Cancel</button>
                    </div>
                </div> 
            </form>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="scripts/bootstrap-sortable.js"></script>
    </body>
</html>

