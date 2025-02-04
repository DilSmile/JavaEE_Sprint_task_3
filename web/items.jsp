<%@ page import="java.util.List" %>
<%@ page import="servlets.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BITLAB SHOP</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">BITLAB SHOP</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/items">Все товары</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Логин</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="text-center mb-4">Welcome to BITLAB SHOP</h2>
    <div class="row">
        <% List<Item> items = (List<Item>) request.getAttribute("items"); %>
        <% for (Item item : items) { %>
        <div class="col-lg-4 col-md-6 col-sm-12 d-flex align-items-stretch">
            <div class="card mb-4 shadow-sm w-100">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= item.getName() %></h5>
                    <p class="card-text"><%= item.getDescription() %></p>
                    <p class="card-text text-success fw-bold">$<%= item.getPrice() %></p>
                    <a href="#" class="btn btn-success">Buy Now</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
