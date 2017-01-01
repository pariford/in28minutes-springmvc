<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>

<link href="<c:url value="/resources/jquery.bootgrid-1.3.1/jquery.bootgrid.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>"rel="stylesheet">
<script type="text/javascript"	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

</head>
<body>

	<div class="container">

		
		<div id="toolbar">
		<select class="form-control">
				<option value="">Export Basic</option>
				<option value="all">Export All</option>
				<option value="selected">Export Selected</option>
		</select>
		</div>	
		<table id="grid-selection" class="table table-condensed table-hover table-bordered">
		    <thead>
		        <tr style = "font-size:12px; ">
		            <th data-column-id="id" data-type="numeric" data-identifier="true">ID</th>
		            <th data-column-id="user" >User</th>
		            <th data-column-id="desc" >Description</th>
		            <th data-column-id="targetDate" data-order="desc">Target Date</th>
		            <th data-column-id="done" data-formatter="isDone">Done</th>
		            <th data-column-id="link" data-formatter="link" data-sortable="false">Link</th>
		            <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
		        </tr>
		    </thead>
		    <tbody style = "font-size:12px; ">
		    </tbody>
		</table>
		
	</div>


	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="resources/jquery.bootgrid-1.3.1/jquery.bootgrid.js"></script>
	
	<script type="text/javascript">
	
	$(function() {
	    console.log( "ready!" );
	    
	    var v_header = ' <div class="actionBar"> '
	    	+ '<div class="input-group ">'
			+ '   <input type="text" class="form-control" placeholder="User"> '
			+ '   <input type="text" class="form-control" placeholder="Description" > '
	  		+ '</div> '
	  	    + '</div> ';
	    
	  
	  console.log(v_header);
	    
	    var grid = $("#grid-selection").bootgrid({
	        ajax: true,
	        templates: {
	            header: "<div id=\"{{ctx.id}}\" class=\"{{css.header}}\"><div class=\"row\"><div class=\"col-sm-12 actionBar\"><div class=\"input-group input-group-sm\"><input type=\"text\" class=\"form-control\" placeholder=\"User\"><input type=\"text\" class=\"form-control\" placeholder=\"Description\" > </div> <p class=\"{{css.search}}\"></p><p class=\"{{css.actions}}\"></p></div></div></div>"       
	        },
	        css: {
	        	pagination: 'pagination pagination-sm'
	        },
	        post: function ()
	        {
	            /* To accumulate custom parameter with the request object */
	            return {
	                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
	            };
	        },
	        url: "boot1data",
	        selection: true,
	        multiSelect: true,
	        formatters: {
	        	"isDone": function (column,row)
	        	{
	        		var cellValue = row[column.id];
	        	  	if (cellValue == "false")
		        	  	return "NO";
		        	else
		        		return "YES";
		        	  		
	        	},
	            "link": function(column, row)
	        	{
	                return "<a href=\"#\">" + column.id + ": " + row.id + "</a>";
	            },
	            "commands": function(column, row)
	            {
	                return "<div style=\"text-align:center\"><button type=\"button\" class=\"btn btn-xs btn-success command-edit\" data-row-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-pencil\"></span></button> " + 
	                    "<button type=\"button\" class=\"btn btn-xs btn-danger command-delete\" data-row-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-remove\"></span></button></div>";
	            }
	        }
	    }).on("selected.rs.jquery.bootgrid", function(e, rows)
	    {
	        var rowIds = [];
	        for (var i = 0; i < rows.length; i++)
	        {
	            rowIds.push(rows[i].id);
	        }
	        alert("Select: " + rowIds.join(","));
	    }).on("deselected.rs.jquery.bootgrid", function(e, rows)
	    {
	        var rowIds = [];
	        for (var i = 0; i < rows.length; i++)
	        {
	            rowIds.push(rows[i].id);
	        }
	        alert("Deselect: " + rowIds.join(","));
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	        /* Executes after data is loaded and rendered */
	        grid.find(".command-edit").on("click", function(e)
	        {
	            alert("You pressed edit on row: " + $(this).data("row-id"));
	        }).end().find(".command-delete").on("click", function(e)
	        {
	            alert("You pressed delete on row: " + $(this).data("row-id"));
	        });
	    		});
	});
		
	
	
	</script>

</body>
</html>
