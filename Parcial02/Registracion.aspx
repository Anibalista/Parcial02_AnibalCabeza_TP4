<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Maestro.master" AutoEventWireup="true" CodeBehind="Registracion.aspx.cs" Inherits="Parcial02.Registracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row justify-content-center align-items-center">
        <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-4">
            <div class="card p-2">
                <div class="card-title text-center">
                    <asp:Label ID="Label1" runat="server" Text="Registrar Usuario" CssClass="display-3 mb-1"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" />
                </div>
                
                <div class="mb-3">
                    <asp:Label ID="LabelMail" runat="server" Text="Correo electrónico:" CssClass="form-label"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Debe ingresar un correo electrónico" 
                    ControlToValidate="txtMail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegExValidatorMail" runat="server" ErrorMessage="El correo debe tener un formato válido" 
                    ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ControlToValidate="txtMail" 
                    Display="Dynamic">*</asp:RegularExpressionValidator>
                    <div class="input-group">
                        <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" ToolTip="ejemplo@mail.com"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3">
                    <asp:Label ID="LabelUsername" runat="server" Text="Nombre de Usuario:" CssClass="form-label"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredUser" runat="server" ErrorMessage="Debe ingresar nombre de usuario" 
                    ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div class="input-group">
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" ToolTip="Los espacios serán eliminados"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3">
                    <asp:Label ID="LabelEdad" runat="server" Text="Edad:" CssClass="form-label"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredEdad" runat="server" ErrorMessage="Debe ingresar edad" 
                    ControlToValidate="txtEdad" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="validarEdad" runat="server" ControlToValidate="txtEdad" Display="Dynamic"
                    ErrorMessage="Debe ser mayor de 15 años" ForeColor="Red" OnServerValidate="validarEdad_ServerValidate">*</asp:CustomValidator>
                    <div class="input-group">
                        <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control" ToolTip="Mayor a 15 años" MaxLength="3" TextMode="Number"></asp:TextBox>    
                    </div>
                </div>

                <div class="mb-3">
                    <asp:Label ID="LabelPassword" runat="server" Text="Contraseña:" CssClass="form-label"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" ErrorMessage="Debe ingresar una contraseña" 
                    ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div class="input-group">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" ToolTip="Los espacios serán eliminados" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-4">
                    <asp:Label ID="LabelPassword2" runat="server" Text="Repetir contraseña:" CssClass="form-label"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredPassword2" runat="server" ErrorMessage="Debe repetir la contraseña" 
                    ControlToValidate="txtPassword2" ForeColor="Red" Display="Dynamic" CssClass="invalid-feedback"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="ComparePassword" runat="server" ControlToValidate="txtPassword2" ControlToCompare="txtPassword" 
                    ErrorMessage="Las contraseñas no coinciden" ForeColor="Red" Display="Dynamic">*</asp:CompareValidator>
                    <div class="input-group">
                        <asp:TextBox ID="txtPassword2" runat="server" CssClass="form-control" TextMode="Password" ToolTip="Los espacios serán eliminados"></asp:TextBox>
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-success m-3" OnClick="btnRegistrar_Click" OnClientClick="return confirmGuardar();" />
                    <asp:Button ID="btnCerrar" runat="server" Text="Cancelar" CssClass="btn btn-danger m-3" OnClick="btnCerrar_Click" OnClientClick="return confirmCancelar();" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
