<%@ Page Title="Parcial 02 Anibal Cabeza" Language="C#" MasterPageFile="~/Maestro.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Parcial02.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4 col-12">Bienvenido al Sistema de Gestión de archivos</h2>
        <asp:Label ID="lblError" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <div class="row justify-content-center">
            <!-- Tarjeta de Registro -->
            <div class="col-12 col-sm-10 col-md-5 col-lg-4 m-4">
                <div class="card h-100 shadow-sm hover-card" style="cursor: pointer;">
                    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="card-img-top" ImageUrl="~/imagenes/user.png" OnClick="ImageButton1_Click" />
                    <div class="card-body text-center">
                        <h5 class="card-title">Registro de Usuario</h5>
                        <p class="card-text">Crea una nueva cuenta para acceder al sistema de archivos</p>
                    </div>
                </div>
            </div>

            <!-- Tarjeta de Gestión de Archivos -->
            <div class="col-12 col-sm-10 col-md-5 col-lg-4 m-4">
                <div class="card h-100 shadow-sm hover-card" style="cursor: pointer;">
                    <asp:ImageButton ID="ImageButton2" runat="server" CssClass="card-img-top" ImageUrl="~/imagenes/archivero.png" OnClick="ImageButton2_Click" />
                    <div class="card-body text-center">
                        <h5 class="card-title">Gestion de archivos</h5>
                        <p class="card-text">Sube y descarga archivos a tu cuenta</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .hover-card {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .hover-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2) !important;
        }

        .card {
            border-radius: 10px;
            overflow: hidden;
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            background-color: #f8f9fa;
        }

        .card-title {
            color: #2c3e50;
            font-weight: 600;
        }

        .card-text {
            color: #6c757d;
        }
    </style>
</asp:Content>