<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report</title>
 <style>
        .td-text {
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
 <div class="container">
        <jsp:include page="layout/header.jsp" />

     	<div class="mx-auto mt-3" style="width: 600px;">
            <nav class="nav nav-pills flex-column flex-sm-row mb-3">
               <a class="flex-sm-fill text-sm-center nav-link active" href="${pageContext.request.contextPath}/admin/reportFavorites">Favorites</a>
               <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportFavoriteUser">Favorites Users</a>
               <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportShareFriend">Shared Friend</a>
            </nav>
              <table class="table">
                <thead>
                    <tr>
                      <th scope="col">Video title</th>
                      <th scope="col">Favorite count</th>
                      <th scope="col">Latest date</th>
                      <th scope="col">Oldest date</th>
                    </tr>
                  </thead>
                  <tbody>
                   
                  </tbody>
              </table>
        </div>
        
         <jsp:include page="layout/footer.jsp" />
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</body>
</html>