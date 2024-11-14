using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02
{
    public partial class Registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            
            if (!this.Page.IsValid)
            {
                ValidationSummary1.ShowMessageBox = true;
                return;
            }

            this.Session["Usuario"] = txtUsername.Text.Trim();
            HttpCookie password = new HttpCookie("Password", txtPassword.Text)
            /*Seguridad extra si se quiere { 
                HttpOnly = true, Secure = true
            }  */  ;
            this.Response.Cookies.Add(password);
            Response.Redirect("GestionArchivos.aspx");
        }


        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void validarEdad_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (int.TryParse(args.Value, out int val))
            {
                args.IsValid = val > 15;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}