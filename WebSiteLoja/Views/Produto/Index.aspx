<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Views_Produto_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Filtro</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <asp:Label Text="Nome" runat="server" />
                    <div>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtProduto" />
                    </div>
                </div>
                <div class="form-group">
                    
                    <div><asp:Label Text="Preço" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtPreco" Width="15%" />
                        <asp:CompareValidator ID="CompareValidator1" CssClass="error-message" EnableClientScript="true" Display="Dynamic" runat="server" ControlToValidate="txtPreco" Type="Currency" ErrorMessage="*" ToolTip="Preço inválido" Operator="DataTypeCheck" SetFocusOnError="True" ForeColor="Red"></asp:CompareValidator>
                    </div>
                </div>

                 <div class="form-group">
                    <asp:Label Text="Categoria" runat="server" />
                    <div>
                        <asp:DropDownList runat="server" ID="ddlCategoria" Width="15%" DataSourceID="obsCategoria" DataTextField="Nome" DataValueField="Id"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="obsCategoria" OldValuesParameterFormatString="original_{0}" SelectMethod="ListarCategoria" TypeName="CategoriaController"></asp:ObjectDataSource>
                    </div>
                </div>
                <div>
                    <asp:Button CssClass="btn btn-primary" runat="server" Text="Pesquisar"  />
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Produtos</h3>
            </div>
            <div class="panel-body">
                <a href="Form.aspx" title="Novo Produto"  class="btn btn-primary">Novo Produto</a>
                <br />
                <br />
                <asp:GridView ID="GridView1" EmptyDataText="Nenhum produto encontrado :(" runat="server" DataKeyNames="Id" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
                        <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" SortExpression="Quantidade"></asp:BoundField>
                        <asp:BoundField DataField="Preco" HeaderText="Preco" SortExpression="Preco"></asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblCategoria" runat="server" Text='<%# Bind("Categoria.Nome")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="Editar" runat="server" Text="Editar" CssClass="btn btn-info btn-xs"
                                     CausesValidation="false"  PostBackUrl='<%# string.Format("~/Views/Produto/Form.aspx?id={0}", Eval("Id")) %>'  ></asp:LinkButton>
                                <asp:LinkButton ID="Remover" runat="server" Text="Remover" CommandName="Delete" CssClass="btn btn-danger btn-xs" OnClientClick="return confirm ('Deseja realmente excuir?')"
                                    CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="ListarProduto" TypeName="ProdutoController" OnSelecting="ObjectDataSource1_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtProduto" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>

