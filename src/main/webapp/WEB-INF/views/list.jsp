<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Manager List</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
</head>
<body>

	<div class="container">
		<h1>Student Manager</h1>
		<table class="table table-bordered">
			<thead class="thead-light">
				<tr>
					<th scope="col" colspan="5">Student List</th>
				</tr>
				<tr>
					<td colspan="5"><a class="btn btn-secondary" href="new">New...</a>
						<button id="delete" class="btn btn-secondary">Delete</button></td>
				</tr>
			</thead>
			<thead class="thead-light">
				<tr>
					<th scope="col">Edit</th>
					<th scope="col">Selected</th>
					<th scope="col">StudentID</th>
					<th scope="col">Name</th>
					<th scope="col">Birthday</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="p">
					<tr>
						<td><a href="edit?id=${p.id}" class="btn btn-secondary">Edit...</a>
						</td>
						<td><input name="Item" class="text-center" type="checkbox" value="${p.id}" /></td>
						<td><a href="detail?id=${p.id}">${p.id}</a></td>
						<td>${p.name}</td>
						<td><fmt:formatDate value="${p.birthDay}"
								pattern="dd/MM/yyyy" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery.nice-select.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/jquery.slicknav.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		
		$('#delete').bind('click', function(){
			var selected = [];
			$('input[type=checkbox]').each(function() {
			       if ($(this).is(":checked")) {
			           selected.push($(this).val());
			       }
			    });
		    
		    console.log(selected);
			$.post('checkDelete', {'myArray': selected}, function (data) {
            	location.reload();
            });
		});
				
	</script>
</body>
</html>