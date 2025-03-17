<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý người dùng</title>
<style>
.td-text {
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
</style>
<!-- Include DataTables CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

<!-- Include jQuery (required for DataTables) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include DataTables JS -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<jsp:include page="layout/header.jsp" />

		<!-- Card for User Form -->
		<div class="card mt-4" >
			<div class="card-header bg-primary text-white">
				<h4>Quản lý người dùng</h4>
			</div>
			<form class="card-body">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="id" placeholder="Username" name="id" required value="${user.id}">
					<label for="id">Tên đăng nhập</label>
					<span class="text-danger">${messError}</span>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="password" placeholder="Password" name="password" required value="${user.password}">
					<label for="password">Mật khẩu</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="fullname" placeholder="Fullname" name="fullname" required value="${user.fullname}">
					<label for="fullname">Họ tên</label>
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="email" placeholder="Email" name="email" required value="${user.email}">
					<label for="email">Địa chỉ email</label>
				</div>

				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="admin" ${user.admin ? 'checked' : ''} id="inlineRadio1" value="true">
					<label class="form-check-label" for="inlineRadio1">Quản trị viên</label>
				</div>
				<div class="form-check form-check-inline mb-3">
					<input class="form-check-input" type="radio" name="admin" ${!user.admin ? 'checked' : ''} id="inlineRadio2" value="false">
					<label class="form-check-label" for="inlineRadio2">Người dùng</label>
				</div>

				<span class="text-success">${messSuccess}</span>

				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button formaction="${pageContext.request.contextPath}/admin/userManager/create" formmethod="post" class="btn btn-primary mb-2" type="submit">Create</button>
					<button formaction="${pageContext.request.contextPath}/admin/userManager/update" formmethod="post" class="btn btn-warning mb-2" type="submit">Update</button>
					<button formaction="${pageContext.request.contextPath}/admin/userManager/delete" formmethod="post" class="btn btn-danger mb-2" type="submit">Delete</button>
					<button class="btn btn-light border mb-2" type="reset">Resert</button>
				</div>
			</form>
		</div>

		<!-- Table for displaying users -->
		<!-- Table for displaying users -->
<div class="card mt-4">
    <div class="card-header bg-secondary text-white">
        <h5>Danh sách người dùng</h5>
    </div>
    <div class="card-body">
        <table id="abc" class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên đăng nhập</th>
                    <th scope="col">Họ tên</th>
                    <th scope="col">Vai trò</th>
                    <th scope="col">Email</th>
                    <th scope="col">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" varStatus="loop" items="${listUsers}">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${user.id}</td>
                        <td>${user.fullname}</td>
                        <td>${user.admin ? "Quản trị viên" : "Người dùng"}</td>
                        <td>${user.email}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/userManager/update?id=${user.id}" class="btn btn-warning btn-sm">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


		
		<jsp:include page="layout/footer.jsp" />
	</div>
	<script type="text/javascript">
    $(document).ready(function() {
        // Initialize DataTable with options
        $('#abc').DataTable({
            "paging": true,            // Enable pagination
            "lengthChange": false,     // Disable option to change number of rows per page
            "searching": false,       // Disable search box (optional)
            "ordering": true,         // Enable sorting
            "info": true,             // Show info (number of items, page)
            "autoWidth": false,       // Disable auto width adjustment
            "responsive": true,       // Make the table responsive
            "pageLength": 7,          // Set default number of rows per page
        });
    });
</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
