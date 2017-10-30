using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Produto_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                fvwProduto.ChangeMode(FormViewMode.ReadOnly);
                fvwProduto.DataBind();
            }
        }

    }

    protected void fvwProduto_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            Master.SetMessage("Produto atualizado com sucesso!", MasterPage_MasterPage.TipoMensagem.Sucesso);
            Response.Redirect("~/Views/Produto/Index.aspx");
        }
        else
        {
            e.ExceptionHandled = true;
            Master.SetMessage("Erro inesperado ao atualizar. :(", MasterPage_MasterPage.TipoMensagem.Erro);
        }
    }
}