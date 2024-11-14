using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02
{
    public partial class GestionArchivos : System.Web.UI.Page
    {
        protected string nombreUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                nombreUsuario = Session["Usuario"].ToString();
            }
            if (!IsPostBack)
            {
                if (Session["Usuario"] != null)
                {
                    Label1.Text += nombreUsuario;
                    VerificarOCrearCarpetaUsuario();
                    cargarGrilla();
                }
                else
                {
                    Response.Redirect("index.aspx");
                }
            }
        }

        protected void mensajeMostrar(string color, string msg)
        {
            string div = $"<div class='alert alert-{color} alert-dismissible fade show' role='alert'>"
                        + $"{msg}"
                        + "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>";
            lblMensaje.Text = div;
            lblMensaje.Visible = true;
        }

        protected void limpiarError()
        {
            lblMensaje.Text = "";
            lblMensaje.Visible = false;
        }

        private void VerificarOCrearCarpetaUsuario()
        {
            string rutaUsuario = $"{Server.MapPath(".")}/Archivos/{nombreUsuario}";
            if (!Directory.Exists(rutaUsuario))
            {
                Directory.CreateDirectory(rutaUsuario);
            }
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFiles)
            {
                mensajeMostrar("danger", "Seleccione un archivo primero");
                return;
            }
            limpiarError();
            string mensaje = "";
            try
            {
                string color = "success";
                string rutaUsuario = $"{Server.MapPath(".")}/Archivos/{nombreUsuario}";
                foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                {
                    string reemplazo = "";
                    string rutaArchivo = Path.Combine(rutaUsuario, archivo.FileName);
                    if (archivo.ContentLength > 5000000)
                    {
                        mensaje += $"El archivo {archivo.FileName} supera los 5Mb ¡DENEGADO! <br />";
                        color = "warning";
                    }
                    else
                    {
                        if (File.Exists(rutaArchivo))
                        {
                            reemplazo = " (Reemplaza a otro existente)";
                        }
                        FileUpload1.SaveAs(rutaArchivo);
                        mensaje += $"El archivo {archivo.FileName} se agregó correctamente{reemplazo} <br />";
                    }
                }
                mensajeMostrar(color, mensaje);
                cargarGrilla();
            }
            catch (Exception ex)
            {
                mensajeMostrar("danger", "Error al subir el archivo: " + ex.Message);
            }
            
        }

        protected void cargarGrilla()
        {
            string rutaUsuario = $"{Server.MapPath(".")}/Archivos/{nombreUsuario}";
            string[] archivos = Directory.GetFiles(rutaUsuario);
            List<Archivo> lista = new List<Archivo>();
            foreach (string archivo in archivos)
            {
                var nuevoArchivo = new Archivo(Path.GetFileName(archivo), archivo);
                lista.Add(nuevoArchivo);
            }
            GridView1.DataSource = lista;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                GridViewRow fila = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string ruta = fila.Cells[2].Text;
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(ruta));
                Response.TransmitFile(ruta);
                Response.End();
            }
        }
    }
}