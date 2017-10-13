using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Categoria_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == null)
            {
                fvwCategoria.ChangeMode(FormViewMode.Insert);
                fvwCategoria.DataBind();
            }

        }
    }

    protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            Master.SetMessage("Categoria excluída com sucesso!", MasterPage_MasterPage.TipoMensagem.Sucesso);
            Response.Redirect("~/Views/Categoria/Index.aspx");
        }
        else
        {
            e.ExceptionHandled = true;
            Master.SetMessage("Erro inesperado. :(", MasterPage_MasterPage.TipoMensagem.Erro);
        }
    }

    protected void fvwCategoria_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            Master.SetMessage("Categoria cadastrada com sucesso!", MasterPage_MasterPage.TipoMensagem.Sucesso);
            Response.Redirect("~/Views/Categoria/Index.aspx");
        }
        else
        {
            e.ExceptionHandled = true;
            Master.SetMessage("Erro inesperado. :(", MasterPage_MasterPage.TipoMensagem.Erro);
        }
    }
}