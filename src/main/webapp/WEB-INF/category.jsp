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
<title>New Category</title>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>


<form action="/jumptocategory" class="m-4">
    <select name="category">
        <c:forEach items="${categories}" var="category"> 
            <option value="${category.id}">${category.name}</option>
        </c:forEach>
    </select>
    <input type="submit" class="btn btn-warning" value="Jump to a Category"/>
</form>  
<hr>

<h1 class="m-2">New Category</h1>  

<a href="/" class="m-4">Home</a>

<div class="container">
<form:form action="/categories/new" method="post" modelAttribute="category" class="m-4">
    <p>
        <form:label path="name">Name:</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <input type="submit" value="Submit"/>
</form:form>   
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>
</html>