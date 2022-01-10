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
<title>Show Product</title>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>




<h1 class="m-4">Product: ${product.name}</h1>  
<h4 class="m-4">${product.description}</h4>
<h4 class="m-4 ">$${product.price}</h4>
<a href="/" class="m-4">Home</a>
<hr>



<h2 class="m-4">Add a Category: to help people find your Product</h2>
<form method="POST" action="/products/add/${product.id}">
<select class="m-4" name="categories">
    <c:forEach items="${notACat}" var="cat"> 
        <option value="${cat.id}">${cat.name}</option>
    </c:forEach>
</select>
<button>Add Category</button>


<table class="m-2 table table-hover">
    <thead>
        <tr>
            <th>Category Name</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${product.categories}" var="category">
        <tr>
            <td><a href="/categories/${category.id}"><c:out value="${category.name}"/></td>
        </tr>
        </c:forEach>
    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>
</html>