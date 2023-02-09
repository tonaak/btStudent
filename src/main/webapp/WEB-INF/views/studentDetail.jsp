<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>
    <title>Student Detail</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>
<body>

<div class="container">
    <h2 class="text-center">Student Detail</h2>
    <table class="table table-sm table-borderless w-auto m-auto">
        <tbody>
        <tr>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        <tr>
            <th scope="row">StudentID</th>
            <td>${student.id}</td>
        </tr>
        <tr>
            <th scope="row">Name</th>
            <td>${student.name}</td>
        </tr>
        <tr>
            <th scope="row">Male</th>
            <td>
                <c:if test="${student.male}">
                    <input type="checkbox" onclick="return false;" checked />
                </c:if>
                <c:if test="${!student.male}">
                    <input type="checkbox" onclick="return false;" />
                </c:if>
            </td>
        </tr>
        <tr>
            <th scope="row">Birthday</th>
            <td>${student.birthDay}</td>
        </tr>
        <tr>
            <th class="pr-3" scope="row">Place of birth</th>
            <td>${student.placeOfBirth}</td>
        </tr>
        <tr>
            <th scope="row">Address</th>
            <td>${student.address}</td>
        </tr>
        <tr>
            <th scope="row">Department</th>
            <td>${student.depName}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>
                <a class="btn btn-secondary" href="list">Student List</a>
            </td>
            <td>
                <a class="btn btn-secondary" href="edit?id=${student.id}">Edit...</a>
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>