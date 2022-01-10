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
<title>Category Search</title>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>




<form action="/search/categories" class="m-4">
        <input type="text" name="name"/>
        <input type="submit" value="New Search"/>
</form>   
<a href="/" class="m-4">Home</a>
<hr>



<h1 class="m-2">Category Searched: <c:out value="${name}"/> </h1>  


<table class="m-2 table table-hover">
    <thead>
        <tr>
            <th>Name</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${categories}" var="category">
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