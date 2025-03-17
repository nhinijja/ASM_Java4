<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý video</title>
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <div class="container">
        <jsp:include page="layout/header.jsp" />

        <!-- Form Quản lý video -->
        <div class="card mt-4"">
            <div class="card-header bg-primary text-white">
                <h4>Quản lý video</h4>
            </div>
            <form class="card-body">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="id" name="id" placeholder="Youtube ID" required value="${video.id}">
                    <label for="id">ID</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="title" name="title" placeholder="Video Title" required value="${video.title}">
                    <label for="title">Video Title</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="poster" name="poster" placeholder="Video Poster" required value="${video.poster}">
                    <label for="poster">Link</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" step="1" min="0" name="views" class="form-control" id="views" placeholder="Views" required readonly value="${video.views}">
                    <label for="views">View Count</label>
                </div>
                <div class="form-check form-check-inline mb-3">
                    <input class="form-check-input" type="radio" ${!video.active ? 'checked' : ''} name="active" id="inactive" value="false">
                    <label class="form-check-label" for="inactive">Inactive</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" ${video.active ? 'checked' : ''} name="active" id="active" value="true">
                    <label class="form-check-label" for="active">Active</label>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" name="description" id="description" rows="3">${video.description}</textarea>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button formaction="${pageContext.request.contextPath}/admin/videoManager/create" formmethod="post" class="btn btn-primary mb-2" type="submit">Create</button>
                    <button formaction="${pageContext.request.contextPath}/admin/videoManager/update" formmethod="post" class="btn btn-warning mb-2" type="submit">Update</button>
                    <button formaction="${pageContext.request.contextPath}/admin/videoManager/delete" formmethod="post" class="btn btn-danger mb-2" type="submit">Delete</button>
                    <button formaction="${pageContext.request.contextPath}/admin" class="btn btn-light border mb-2" type="reset">Reset</button>
                </div>
            </form>
        </div>

        <!-- Table danh sách video -->
        <div class="card mt-4">
            <div class="card-header bg-secondary text-white">
                <h5>Danh sách video</h5>
            </div>
            <div class="card-body">
              <table id="abc" class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">ID</th>
                            <th scope="col">Video Title</th>
                            <th scope="col">View Count</th>
                            <th scope="col">Status</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="video" varStatus="loop" items="${listVideo}">
                            <tr>
                                <td>${loop.index + 1}</td> <!-- Thêm cột STT -->
                                <td>${video.id}</td>
                                <td>${video.title}</td>
                                <td>${video.views}</td>
                                <td>${video.active ? "Active" : "Inactive"}</td>
                                <td>
                            
                                    <a href="${pageContext.request.contextPath}/admin/videoManager/update?id=${video.id}" class="btn btn-warning btn-sm">Edit</a>
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
    <!-- Script AJAX để tăng View Count -->
    <script>
        function increaseView(videoId) {
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/videoManager/increaseView",
                type: "POST",
                data: { id: videoId },
                success: function () {
                    alert("View count increased!");
                    location.reload(); // Reload trang để cập nhật view count
                },
                error: function (err) {
                    alert("Error increasing view count.");
                    console.error(err);
                }
            });
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
