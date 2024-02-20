<%@ page import="model.Items" %>
<%@ page import="java.util.List" %>
<%@ page import="db.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@ include file="navbar.jsp"%>
    <br>
    <h1 class="text-center">Welcome to BITLAB SHOP</h1>
    <p class="text-center" style="">Electronic devices with high quality and service</p>
    <br><br>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <strong>+ADD ITEMS</strong>
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">ADD ITEM</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/addItem" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label  class="form-label">Name:</label>
                            <input name="name" type="text" class="form-control"  placeholder="Name">
                        </div>
                        <div class="mb-3">
                            <label  class="form-label">Description:</label>
                            <input name="description" type="text" class="form-control" placeholder="Description">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price:</label>
                            <input name="price" type="number" class="form-control" placeholder="Price">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <br><br>

    <div class="row">
        <%
            List<Items> itemsList = DBManager.getItems();
            for (Items item : itemsList){
        %>
        <div class="col-4">
            <div class="card text-center mb-3" style="width: 18rem;">
                <div class="card-header"><%=item.getName()%></div>
                <div class="card-body">
                    <h5 class="card-title"><%=item.getPrice()%></h5>
                    <p class="card-text"><%=item.getDescription()%></p>
                    <a href="/details?id=<%=item.getId()%>" class="btn btn-primary">DETAILS</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</div>

</body>
</html>
