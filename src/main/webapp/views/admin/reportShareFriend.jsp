<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý user</title>
<style>
.td-text {
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<jsp:include page="layout/header.jsp" />

		<div class="mx-auto mt-3" style="width: 700px;">
			<nav class="nav nav-pills flex-column flex-sm-row mb-3">
				<a class="flex-sm-fill text-sm-center nav-link"
					href="${pageContext.request.contextPath}/admin/reportFavorites">Favorites</a>
				<a class="flex-sm-fill text-sm-center nav-link"
					href="${pageContext.request.contextPath}/admin/reportFavoriteUser">Favorites
					Users</a> <a class="flex-sm-fill text-sm-center nav-link active"
					href="${pageContext.request.contextPath}/admin/reportShareFriend">Shared
					Friend</a>
			</nav>
			<form id="videoForm"
				action="${pageContext.request.contextPath}/admin/reportShareFriend"
				method="post" class="mb-3">
				<select class="form-select" aria-label="Default select example" name="id"
					onchange="submitForm()">
					<option selected disabled>Choose video</option>
					<c:forEach var="item" varStatus="loop" items="${listVideo}">
						<option ${video.id == item.id ? 'selected': '' } value="${item.id }">${item.title }</option>
					</c:forEach>
				</select>
			</form>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Sender name</th>
						<th scope="col">Sender email</th>
						<th scope="col">Receiver email</th>
						<th scope="col">Favorite date</th>
						<th scope="col">Sent date</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty listReportFavoriteUser}">
							<c:forEach var="item" varStatus="loop" items="${listReportFavoriteUser}">
								<tr>
									<td>${item.fullname}</td>
									<td>${item.email}</td>
									<td>${item.receiverEmail}</td>
									<td>
										<fmt:formatDate pattern="dd-MM-yyyy" value="${item.favoriteDate}" />
									</td>
									<td>
										<fmt:formatDate pattern="dd-MM-yyyy" value="${item.sentDate}" />
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="text-center">Không có dữ liệu</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<jsp:include page="layout/footer.jsp" />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
		function submitForm() {
			document.getElementById("videoForm").submit();
		}
	</script>
</body>
</html>