<%@ Page Title="Gestión de Archivos" Language="C#" MasterPageFile="~/Maestro.master" AutoEventWireup="true" CodeBehind="GestionArchivos.aspx.cs" Inherits="Parcial02.GestionArchivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentMain" runat="server">
    <!-- Contenido principal de la página de gestión de archivos -->
    <div class="row align-items-center text-center">
        <asp:Label ID="LabelTitulo" runat="server" Text="Gestión de Archivos" CssClass="display-3 mb-1"></asp:Label>
        <asp:Label ID="lblMensaje" runat="server" Visible="False"></asp:Label>
        <div class="col-10 text-start">
            <asp:Label ID="Label1" runat="server" Text="Usuario activo: "></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Seleccione el archivo a subir:" CssClass="form-label"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control col-6" AllowMultiple="True" />
            <br />
            <br />
            <asp:Button ID="btnSubir" runat="server" Text="Subir Archivo" OnClick="btnSubir_Click" CssClass="btn btn-success" />
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-dark table-striped" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Descargar" HeaderText="Descargar Archivo" ShowHeader="True" Text="Descargar">
                    <ControlStyle CssClass="btn btn-primary" />
                    <ItemStyle CssClass="col-2 text-center align-items-center" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
            <br />
        </div>
    </div>
</asp:Content>
