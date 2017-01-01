<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>

<link href="<c:url value="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>"rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/jsgrid-1.5.3/jsgrid.min.css" />">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/jsgrid-1.5.3/jsgrid-theme.min.css" />">


</head>
<body>

	<div class="container">

		
		<div id="jsGrid"></div>
		
	</div>


	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/jsgrid-1.5.3/jsgrid.min.js"></script>
	<script type="text/javascript">
	
	$(function() {
	    console.log( "ready!" );
	   
	    var clients = [
	                   { "Name": "Otto Clay", "Age": 25, "Country": 1, "Address": "Ap #897-1459 Quam Avenue", "Married": false },
	                   { "Name": "Connor Johnston", "Age": 45, "Country": 2, "Address": "Ap #370-4647 Dis Av.", "Married": true },
	                   { "Name": "Lacey Hess", "Age": 29, "Country": 3, "Address": "Ap #365-8835 Integer St.", "Married": false },
	                   { "Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true },
	                   { "Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false },
	                   { "Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true },
	                   { "Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false },
	                   { "Name": "Connor Johnston", "Age": 45, "Country": 2, "Address": "Ap #370-4647 Dis Av.", "Married": true },
	                   { "Name": "Lacey Hess", "Age": 29, "Country": 3, "Address": "Ap #365-8835 Integer St.", "Married": false },
	                   { "Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true },
	                   { "Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false },
	                   { "Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true }
	               ];
	            
        var countries = [
            { Name: "", Id: 0 },
            { Name: "United States", Id: 1 },
            { Name: "Canada", Id: 2 },
            { Name: "United Kingdom", Id: 3 }
        ];
	            
        $("#jsGrid").jsGrid({
            width: "100%",
            height: "400px",
     
            autoload: true,
            paging: true,
            pageLoading: true,
            pageSize: 5,
            pageIndex: 1,
            
            filtering:true,
            inserting: true,
            editing: true,
            sorting: true,
    

            pageButtonCount: 5,
            
            data: clients,
     
            controller: {
                loadData: function(filter) {
                    var startIndex = (filter.pageIndex - 1) * filter.pageSize;
                    return {
                        data: clients.slice(startIndex, startIndex + filter.pageSize),
                        itemsCount: clients.length
                    };
                }
            },
            
            fields: [
                { name: "Name", type: "text", width: 150, validate: "required" },
                { name: "Age", type: "number", width: 50 },
                { name: "Address", type: "text", width: 200 },
                { name: "Country", type: "select", items: countries, valueField: "Id", textField: "Name" },
                { name: "Married", type: "checkbox", title: "Is Married", sorting: false },
                { type: "control" }
            ]
        });
	    
	     
	});
		
	
	
	</script>

</body>
</html>
