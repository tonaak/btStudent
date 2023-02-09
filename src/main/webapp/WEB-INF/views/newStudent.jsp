<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>
    <title>New Student</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <style type="text/css">
    	#id-result p, #date-result p{
    		margin-bottom: 0;
    	}
    	
    	.highlight {
    		border-color: red;
    	}
    	
    	input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
  			-webkit-appearance: none;
  			margin: 0;
		}
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">New Student</h2>
    <form:form id="form" action="new" method="post" modelAttribute="student">
        <table class="table table-sm table-borderless w-auto m-auto">
            <tbody>
            <tr>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            <tr>
                <td>
                    <span>*</span>StudentID:
                </td>
                <td>
                    <form:input type="number" path="id" id="id" required="true" />
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td style="height:35px">
            		<span id="id-result"></span>
            	</td>
            </tr>
            <tr>
                <td>
                    <span>*</span>Name:
                </td>
                <td>
                    <form:input type="text" path="name" required="true" />
                </td>
            </tr>
            <tr>
                <td>
                    Male:
                </td>
                <td>
                    <form:checkbox path="male"/>
                </td>
            </tr>
            <tr>
                <td>
                    Birthday:
                </td>
                <td>
                    <form:input id="txtDate" path="birthDay" required="true" />
                    <span>yyyy-mm-dd</span>
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td style="height:35px">
            		<span id="date-result"></span>
            	</td>
            </tr>
            <tr>
                <td>
                    Place of birth:
                </td>
                <td>
                    <form:input type="text" path="placeOfBirth"/>
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td>
                <td>
                    <form:input type="text" path="address"/>
                </td>
            </tr>
            <tr>
                <td>
                    Department:
                </td>
                <td>
                    <form:select path="depName">
                        <form:option value="Tin học" label="Tin học" />
                        <form:option value="Anh văn" label="Anh văn" />
                        <form:option value="Kinh tế" label="Kinh tế" />
                        <form:option value="Hóa học" label="Hóa học" />
                        <form:option value="Sinh vật học" label="Sinh vật học" />
                        <form:option value="Vật lý" label="Vật lý" />
                    </form:select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <form:button id="btnSubmit" class="btn btn-secondary" path="submit">Submit</form:button>
                    <a class="btn btn-secondary" href="list">Cancel</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>

<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.nice-select.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/jquery.slicknav.js" type="text/javascript"></script>

<script type="text/javascript">
	
    $(document).ready(function () {
        var x_timer;
        $("#id").keyup(function (e) {
            clearTimeout(x_timer);
            var id = $(this).val();
            x_timer = setTimeout(function () {
                check_id_ajax(id);
            }, 500);
        }); 

        function check_id_ajax(id) {
            $("#id-result").html('<p>Loading...</p>');
            $.post('check', {'id': id}, function (data) {
            	if(data == "<p style=\"color:red\">Not available</p>") {
                	$('#btnSubmit').attr('disabled','disabled');
                } else {
                	$('#btnSubmit').removeAttr('disabled');
                }
            	
                $("#id-result").html(data); 
            });
        }
        
    });

    $(function() {
        $('#txtDate').bind('keyup', function(){
            var txtVal =  $('#txtDate').val();
            if(isDate(txtVal)) {
                $('#txtDate').removeClass('highlight');    
            	$('#btnSubmit').removeAttr('disabled');
            	$('#date-result').html("");
            } else {
            	$('#txtDate').addClass('highlight');
            	$('#btnSubmit').attr('disabled','disabled');
            	$('#date-result').html("<p style=\"color:red\">Must be yyyy-mm-dd</p>");
            }          
        });

	    function isDate(txtDate) {
	        var currVal = txtDate;
	        if(currVal == '')
	            return false;
	
	        var rxDatePattern = /^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$/; //Declare Regex
	        var dtArray = currVal.match(rxDatePattern); // is format OK?
	
	        if (dtArray == null) 
	            return false;
	
	        //Checks for dd/mm/yyyy format.
	        dtDay = dtArray[1];
	        dtMonth= dtArray[3];
	        dtYear = dtArray[5];        
	
	        if (dtDay < 1 || dtDay > 31) 
	            return false;
	        else if (dtMonth < 1 || dtMonth> 12) 
	            return false;
	        else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31) 
	            return false;
	        else if (dtMonth == 2) 
	        {
	            var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
	            if (dtDay> 29 || (dtDay ==29 && !isleap)) 
	                    return false;
	        }
	        return true;
	    }
    });
 
</script>

</body>
</html>