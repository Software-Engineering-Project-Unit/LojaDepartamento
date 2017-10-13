using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_MasterPage : System.Web.UI.MasterPage
{
    public enum TipoMensagem { Sucesso, Erro };



    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public bool getAccess()
    {
        return false;
    }

    public void SetMessage(String mensagem, TipoMensagem tipoMensagem)
    {
        if (tipoMensagem == TipoMensagem.Sucesso)
        {
            Session["flash_message"] = mensagem;
        }
        else if (tipoMensagem == TipoMensagem.Erro)
        {
            Session["error_message"] = mensagem;
        }
    }
}
