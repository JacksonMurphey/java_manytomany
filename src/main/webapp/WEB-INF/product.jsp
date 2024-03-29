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
<title>New Product</title>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>


<form action="/jumptoproduct" class="m-4">
    <select name="product">
        <c:forEach items="${products}" var="product"> 
            <option value="${product.id}">${product.name}</option>
        </c:forEach>
    </select>
    <input type="submit" class="btn btn-primary" value="Jump to a Product"/>
</form>  
<hr>

<h1 class="m-2">New Product</h1>  
<a href="/" class="m-4">Home</a>


<div class="container">
<form:form action="/products/new" method="post" modelAttribute="product" class="m-4">
    <p>
        <form:label path="name">Name:</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="description">Description:</form:label>
        <form:errors path="description"/>
        <form:input type="text area" path="description"/>
    </p>
    <p>
        <form:label path="price">Product Price:</form:label>
        <form:errors path="price"/>
        <form:input type="number" min="1" step="any" path="price"/>
    </p>  
    <input type="submit" value="Submit"/>
</form:form>   
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>
</html>