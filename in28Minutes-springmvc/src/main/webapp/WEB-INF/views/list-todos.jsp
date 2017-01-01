<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

	<div class="container">


		<table class="table table-striped">
			<caption><spring:message code="todo.caption"></spring:message></caption>
			<thead>
				<tr>
					<td>Description</td>
					<td>Target Date</td>
					<td>Is Done</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${todos}" var="todo">
					<tr>
						<td>${todo.desc}</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${todo.targetDate}"/></td> 
						<td>${todo.done}</td>
						<td>
							<a href="update-todo?id=${todo.id}" class="btn btn-success">Update</a>
							<a href="delete-todo?id=${todo.id}" class="btn btn-danger">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<a class="btn btn-success" href="add-todo">Add</a>
		</div>
	</div>
<%@ include file="common/footer.jspf" %>
