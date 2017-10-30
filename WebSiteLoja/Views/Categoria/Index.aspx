<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Views_Categoria_Index" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Filtro</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <asp:Label Text="Nome" runat="server" />
                    <div>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCategoria" />
                    </div>
                </div>
                <div>
                    <asp:Button CssClass="btn btn-primary" runat="server" Text="Pesquisar"  />
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Categorias</h3>
            </div>
            <div class="panel-body">
                <a href="Form.aspx" title="Nova Categoria"  class="btn btn-primary">Nova Categoria</a>
                <br />
                <br />
                <asp:GridView ID="GridView1" EmptyDataText="Nenhuma categoria encontrada :(" runat="server" DataKeyNames="Id" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="Editar" runat="server" Text="Editar" CssClass="btn btn-info btn-xs"
                                     CausesValidation="false"  PostBackUrl='<%# string.Format("~/Views/Categoria/Form.aspx?id={0}", Eval("Id")) %>'  ></asp:LinkButton>
                                <asp:LinkButton ID="Remover" runat="server" Text="Remover" CommandName="Delete" CssClass="btn btn-danger btn-xs" OnClientClick="return confirm ('Deseja realmente excuir?')"
                                    CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="ListarCategoria" TypeName="CategoriaController" DataObjectTypeName="LojaDepartamentoModel.Categoria" DeleteMethod="Deletar" OnSelecting="ObjectDataSource1_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCategoria" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>

