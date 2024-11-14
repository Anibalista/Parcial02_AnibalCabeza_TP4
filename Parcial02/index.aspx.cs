using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool inactivo = Session["Usuario"] == null;
            if (inactivo)
            {
                mensajeError("warning", "Recuerde registrarse para acceder a la gestion de archivos");
            }
            lblError.Visible = inactivo;
            ImageButton2.Enabled = !inactivo;
        }
        protected void mensajeError(string color, string msg)
        {
            string div = $"<div class='alert alert-{color} alert-dismissible fade show' role='alert'>"
                        + $"{msg}"
                        + "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>";
            lblError.Text = div;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Registracion.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            bool inactivo = Session["Usuario"] == null;
            if (inactivo)
            {
                mensajeError("warning", "Recuerde registrarse para acceder a la gestion de archivos");
                lblError.Visible = inactivo;
                return;
            }
            Response.Redirect("GestionArchivos.aspx");
        }
    }
}