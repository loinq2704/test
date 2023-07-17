<%-- 
    Document   : ProductManager
    Created on : Jul 14, 2023, 2:15:55 PM
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
        <!--List all Product-->
        <c:if test="${not empty allProducts}">
            <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                Products Manager
            </h1>
            <a class="btn btn-block btn-primary my-3 py-3" 
               style="transform: translateX(25vw); width: 25%;"
               href="manageProduct?service=requestInsert"
               >
                Insert a new Product
            </a>
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Unit Price</th>
                            <th>Quantity In Stock</th>
                            <th>Release Date</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>                                       
                    <tbody class="align-middle">
                        <c:forEach items="${allProducts}" var="product">
                            <tr>
                                <td class="align-middle">${product.id}</td>
                                <td class="align-middle">
                                    <img src="${product.image_url}" alt="" style="width: 50px" />
                                    ${product.name}</td>
                                <td class="align-middle">${product.price}</td>
                                <td class="align-middle">${product.quantity}</td>
                                <td class="align-middle">${product.release_date}</td>
                                <td><a href="manageProduct?service=requestUpdate&productId=${product.id}">Update</a></td>
                                <td><a href="manageProduct?service=requestDelete&productId=${product.id}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <!--List all Product End-->

        <!--Update Product-->
        <c:if test="${UpdateDone ne null}">
            <h3 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                ${UpdateDone}
            </h3>
        </c:if>
        <c:if test="${productUpdate ne null}">
            <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                Update Product 
            </h1>
            <form action="manageProduct" id="updateProduct">
                <input type="hidden" name="service" value="sendUpdateDetail" />
                <div class="col-lg-12 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Unit Price</th>
                                <th>Quantity In Stock</th>
                                <th>Release Date</th>
                            </tr>
                        </thead>                                       
                        <tbody class="align-middle">
                            <tr>
                                <td class="align-middle">
                                    <input type="text" name="id" value="${productUpdate.id}" size="1" readonly />
                                </td>
                                <td class="align-middle">
                                    <input type="text" name="name" value="${productUpdate.name}" size="55"/>
                                </td>
                                <td class="align-middle">
                                    <input type="number" name="price" value="${productUpdate.price}" style="width: 80px"/>
                                </td>
                                <td class="align-middle">
                                    <input type="number" name="quantity" value="${productUpdate.quantity}" style="width: 80px"/>
                                </td>
                                <td class="align-middle">
                                    <input type="text" name="release_date" value="${productUpdate.release_date}" size="8"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <button class="btn btn-block btn-primary my-3 py-3" 
                        style="transform: translateX(50vw); width: 15%;"
                        onclick="document.getElementById('updateProduct').submit();" >
                    Update
                </button>
            </form>
        </c:if>
        <!--Update Product End-->

        <!--Insert Product-->
        <c:if test="${InsertDone ne null}">
            <h3 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                ${InsertDone}
            </h3>
        </c:if>
        <c:if test="${insertProduct ne null}">
            <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                Insert a new Product 
            </h1>
            <form action="manageProduct" id="insertProduct">
                <input type="hidden" name="service" value="sendInsertDetail" />
                <div class="col-lg-12 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Product Name</th>
                                <th>Unit Price</th>
                                <th>Quantity In Stock</th>
                                <th>Description</th>
                                <th>Image Url</th>
                                <th>Brand</th>
                                <th>Release Date</th>
                            </tr>
                        </thead>                                       
                        <tbody class="align-middle">
                            <tr>
                                <td class="align-middle">
                                    <input type="text" name="name" size="55"/>
                                </td>
                                <td class="align-middle">
                                    <input type="number" name="price" style="width: 80px"/>
                                </td>
                                <td class="align-middle">
                                    <input type="number" name="quantity" style="width: 80px"/>
                                </td>
                                <td class="align-middle">
                                    <input type="text" name="description" size="15"/>
                                </td>
                                <td class="align-middle">
                                    <input type="text" name="image_url" size="15"/>
                                </td>
                                <td>
                                    <select name="brand">
                                        <c:forEach items="${allBrands}" var="brand">
                                            <option value="${brand.id}">${brand.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="align-middle">
                                    <input type="text" name="release_date" size="8"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <button class="btn btn-block btn-primary my-3 py-3" 
                        style="transform: translateX(50vw); width: 15%;"
                        onclick="document.getElementById('insertProduct').submit();" >
                    Add
                </button>
            </form>
        </c:if>
        <!--Insert Product End-->

    </body>
</html>
