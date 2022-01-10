<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
                crossorigin="anonymous">
<meta charset="UTF-8">
<title>Show Category</title>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>




<h1 class="m-2">Category: ${category.name}</h1> 
<a href="/" class="m-4">Home</a>
<hr>





<h4 class="m-4">Add a Product to this Category</h4>
<form method="POST" action="/categories/add/${category.id}">
<select class="m-4" name="products">
    <c:forEach items="${notAProd}" var="product"> 
        <option value="${product.id}">${product.name}</option>
    </c:forEach>
</select>
<button>Add Product</button>


<table class="m-2 table table-hover">
    <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${category.products}" var="product">
        <tr>
            <td><a href="/products/${product.id}">${product.name}</td>
            <td>${product.description}</td>
            <td>$${product.price}</td>
        </tr>
        </c:forEach>
    </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>
</html>