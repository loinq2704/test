<%-- 
    Document   : CustomerManager
    Created on : Jul 14, 2023, 1:28:41 PM
    Author     : Van Minh Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
            Customers Manager
        </h1>
        <div class="col-lg-12 table-responsive mb-5">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Banned</th>
                        <th>Ban this user?</th>
                    </tr>
                </thead>                                       
                <tbody class="align-middle">
                    <c:forEach items="${allCustomers}" var="customer">
                        <tr>
                            <td class="align-middle">${customer.id}</td>
                            <td class="align-middle">${customer.username}</td>
                            <td class="align-middle">${customer.password}</td>
                            <td class="align-middle">${customer.fullname}</td>
                            <td class="align-middle">${customer.email}</td>
                            <td class="align-middle">${customer.phone}</td>
                            <td class="align-middle">${customer.address}</td>
                            <td class="align-middle">
                                <c:if test="${customer.banned == 1}">X</c:if>
                                </td>
                                <td class="align-middle"><a href="manageCustomer?service=ban&id=${customer.id}"><button class="btn btn-sm btn-primary">
                                        <i class="fa fa-times"></i>
                                    </button></a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
