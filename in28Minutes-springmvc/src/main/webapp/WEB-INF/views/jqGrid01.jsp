<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
	
	<link href="<c:url value="/resources/Flexigrid-master/css/flexigrid.pack.css"/>" rel="stylesheet"> 
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="resources/Flexigrid-master/js/flexigrid.pack.js"></script>
  
	<script>
	
	/*
	{
                "page":"1",
                "total":57,
                "rows":[
                                                {
                                                                "id":"1",
                                                                "employee_name":"Tiger Nixon",
                                                                "employee_salary":"320800",
                                                                "employee_age":"61",
                                                                "profile_image":"images\/default_profile.png"
                                                }
                ]
}
	*/
	
	/*
	
{"page":"1","total":57,"rows":[{"id":"1","employee_name":"Tiger Nixon","employee_salary":"320800","employee_age":"61","profile_image":"images\/default_profile.png"},{"id":"2","employee_name":"Garrett Winters","employee_salary":"434343","employee_age":"63","profile_image":"images\/default_profile.png"},{"id":"3","employee_name":"Ashton Cox","employee_salary":"86000","employee_age":"66","profile_image":"images\/default_profile.png"},{"id":"4","employee_name":"Cedric Kelly","employee_salary":"433060","employee_age":"22","profile_image":"images\/default_profile.png"},{"id":"5","employee_name":"Airi Satou","employee_salary":"162700","employee_age":"33","profile_image":"images\/default_profile.png"},{"id":"6","employee_name":"Brielle Williamson","employee_salary":"372000","employee_age":"61","profile_image":"images\/default_profile.png"},{"id":"7","employee_name":"Herrod Chandler","employee_salary":"137500","employee_age":"59","profile_image":"images\/default_profile.png"},{"id":"8","employee_name":"Rhona Davidson","employee_salary":"327900","employee_age":"55","profile_image":"images\/default_profile.png"},{"id":"9","employee_name":"Colleen Hurst","employee_salary":"205500","employee_age":"39","profile_image":"images\/default_profile.png"},{"id":"10","employee_name":"Sonya Frost","employee_salary":"103600","employee_age":"23","profile_image":"images\/default_profile.png"},{"id":"11","employee_name":"Jena Gaines","employee_salary":"90560","employee_age":"30","profile_image":"images\/default_profile.png"},{"id":"12","employee_name":"Quinn Flynn","employee_salary":"342000","employee_age":"22","profile_image":"images\/default_profile.png"},{"id":"13","employee_name":"Charde Marshall","employee_salary":"470600","employee_age":"36","profile_image":"images\/default_profile.png"},{"id":"14","employee_name":"Haley Kennedy","employee_salary":"313500","employee_age":"43","profile_image":"images\/default_profile.png"},{"id":"15","employee_name":"Tatyana Fitzpatrick","employee_salary":"385750","employee_age":"19","profile_image":"images\/default_profile.png"}]}	
	*/
	
	  $(document).ready(function(){
	$("#employees").flexigrid({
        //url : 'todos',
        dataType : 'json',
        method: 'GET',
        colModel : [ 
                     {
			            display : 'ID',
			            name : 'id',
			            width : 90,
			            sortable : true,
			            align : 'center'
			            }, 
			         {
		                display : 'Name',
		                name : 'employee_name',
		                width : 120,
		                sortable : true,
		                align : 'left'
		            }, 
		            {
		                display : 'Salary',
		                name : 'employee_salary',
		                width : 120,
		                sortable : true,
		                align : 'left'
		            }, 
		            {
		                display : 'Age',
		                name : 'employee_age',
		                width : 80,
		                sortable : true,
		                align : 'left'
		            } 
		         ],
	    buttons : [
			{name: 'Edit', bclass: 'edit', onpress : doCommand},
			{name: 'Delete', bclass: 'delete', onpress : doCommand},
			{separator: true}
			],		         
		searchitems : [
				{display: 'First Name', name : 'first_name'},
				{display: 'Surname', name : 'surname', isdefault: true},
				{display: 'Position', name : 'position'}
			],
        sortname : "iso",
        sortorder : "asc",
        usepager : true,
        title : 'Employees',
        useRp : false,
        rp : 15,
        showTableToggleBtn : true,
		height:'auto',
        striped:true,
        width : 550,
        singleSelect: true
    });
	
	
	  });
	
	
	function doCommand(com, grid) {
		if (com == 'Edit') {
		$('.trSelected', grid).each(function() {
		var id = $(this).attr('id');
		id = id.substring(id.lastIndexOf('row')+3);
		alert("Edit row " + id);
		});
		} else if (com == 'Delete') {
		$('.trSelected', grid).each(function() {
		var id = $(this).attr('id');
		id = id.substring(id.lastIndexOf('row')+3);
		alert("Delete row " + id);
		});
		}
		}
	
	
	</script>
</head>
<body>

		
		<table id="employees" style="display: none">
			<tbody>
                <tr>
                    <td>1</td>
                    <td>Sanjin</td>
                    <td>100000</td>
                    <td>39</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Stef</td>
                    <td>100000</td>
                    <td>38</td>
                </tr>
			</tbody>
		</table>
		
		<table class="flexme">
            <thead>
                <tr>
                    <th width="100">Col 1</th>
                    <th width="100">Col 2</th>
                    <th width="100">Col 3 is a long header name</th>
                    <th width="300">Col 4</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>This is data 1 with overflowing content</td>
                    <td>This is data 2</td>
                    <td>This is data 3</td>
                    <td>This is data 4</td>
                </tr>
                <tr>
                    <td>This is data 1</td>
                    <td>This is data 2</td>
                    <td>This is data 3</td>
                    <td>This is data 4</td>
                </tr>
                <tr>
                    <td>This is data 1</td>
                    <td>This is data 2</td>
                    <td>This is data 3</td>
                    <td>This is data 4</td>
                </tr>
               
            </tbody>
	</table>
	
	<table class="flexme3" style="display: none"></table>
		
</body>
</html>
