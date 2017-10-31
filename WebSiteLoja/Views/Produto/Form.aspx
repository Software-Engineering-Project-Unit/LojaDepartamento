<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Views_Produto_Form" %>

<%@ MasterType VirtualPath="~/Views/MasterPage/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Produto</h3>
            </div>
            <div class="panel-body">
                <asp:FormView ID="fvwProduto" DefaultMode="Insert" DataKeyNames="Id" EmptyDataText="Não há produto com o código especificado" Width="100%" runat="server" DataSourceID="ObjectDataSource1" OnItemUpdated="fvwProduto_ItemUpdated" OnPageIndexChanging="fvwProduto_PageIndexChanging">

                    <EditItemTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    Quantidade:
                                    <div>
                                        <asp:TextBox Text='<%# Bind("Quantidade") %>' runat="server" ID="QuantidadeTextBox" />
                                    </div>
                                    Preco:
                                    <div>
                                        <asp:TextBox Text='<%# Bind("Preco") %>' runat="server" ID="PrecoText" />
                                    </div>
                                    Nome:
                                    <div>
                                        <asp:TextBox Text='<%# Bind("Nome") %>' runat="server" ID="NomeText" />
                                    </div>
                                    Categoria:
                                    <div>
                                        <asp:DropDownList runat="server" ID="DdlCategoria" DataSourceID="odsCategoria" DataTextField="Nome" DataValueField="Id" SelectedValue='<%#  Bind("IdCategoria") %>'>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="odsCategoria" OldValuesParameterFormatString="original_{0}" SelectMethod="ListarCategoria" DataObjectTypeName="LojaDepartamentoModel.Categoria" TypeName="CategoriaController"></asp:ObjectDataSource>
                                    </div>
                                    Departamento:
                                    <div>
                                        <asp:DropDownList runat="server" ID="DdlDepartamento" AppendDataBoundItems="true" DataTextField="Nome" DataValueField="Id" DataSourceID="odsDepartamento" SelectedValue='<%# Bind("IdDepartamento") %>'>
                                            <asp:ListItem Text=":: Selecione ::" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="odsDepartamento" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="DepartamentoController"></asp:ObjectDataSource>

                                    </div>
                                    <div>
                                        <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="lbtAtualizar"  />&nbsp;
                                        <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCanceln" CausesValidation="False" />
                                    </div>
                                </div>
                            </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    Quantidade:
                                    <div>
                                        <asp:TextBox Text='<%# Bind("Quantidade") %>' runat="server" ID="QuantidadeTextBox" />
                                    </div>
                                    Preco:
                                    <div>
                                        <asp:TextBox Text='<%# Bind("Preco") %>' runat="server" ID="PrecoText" />
                                    </div>
                                    Nome:
                                    <div>
                                        <asp:TextBox Text='<%# Bind("Nome") %>' runat="server" ID="NomeText" />
                                    </div>
                                    <%--IdCategoria:
                                    <div>
                                        <asp:TextBox Text='<%# Bind("IdCategoria") %>' runat="server" ID="IdCategoriaTex" />
                                    </div>--%>
                                    Categoria:
                                    <div>
                                        <asp:DropDownList runat="server" ID="DdlCategoria" AppendDataBoundItems="true"  >
                                            <asp:ListItem Text=":: Selecione ::" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <%--<asp:TextBox Text='<%# Bind("IdDepartamento") %>' runat="server" ID="IdDepartamentoText" />--%>
                                    </div>
                                    Departamento:
                                    <div>
                                        <asp:DropDownList runat="server" ID="DDlDepartamento" AppendDataBoundItems="true" DataTextField="Nome" DataValueField="Id" SelectedValue='<%# Bind("IdDepartamento") %>' DataSourceID="odsDepartamento">
                                            <asp:ListItem Text=":: Selecione ::" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <%--<asp:TextBox Text='<%# Bind("Departamento") %>' runat="server" ID="DepartamentoTex" />--%>
                                        <asp:ObjectDataSource runat="server" ID="odsDepartamento" OldValuesParameterFormatString="original_{0}" SelectMethod="Listar" TypeName="DepartamentoController"></asp:ObjectDataSource>
                                    </div>
                                    <div>
                                        <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;
                                       <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                                    </div>
                                </div>
                            </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    Quantidade:
                                    <div>
                                        <asp:Label Text='<%# Bind("Quantidade") %>' runat="server" ID="QuantidadeTextBox" />
                                    </div>
                                    Preco:
                                    <div>
                                        <asp:Label Text='<%# Bind("Preco") %>' runat="server" ID="PrecoText" />
                                    </div>
                                    Nome:
                                    <div>
                                        <asp:Label Text='<%# Bind("Nome") %>' runat="server" ID="NomeText" />
                                    </div>
                                    Categoria:
                                    <div>
                                        <asp:Label Text='<%# Bind("Categoria.Nome") %>' runat="server" ID="IdCategoriaTex" />
                                    </div>
                                    Departamento:
                                    <div>
                                        <asp:Label Text='<%# Bind("Departamento.Nome") %>' runat="server" ID="IdDepartamentoText" />
                                    </div>
                                    <div>
                                        <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                                    </div>
                                </div>
                            </div>
                    </ItemTemplate>
                </asp:FormView>


                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="Obter" TypeName="ProdutoController" DataObjectTypeName="LojaDepartamentoModel.Produto" DeleteMethod="Deletar" InsertMethod="Inserir" UpdateMethod="Atualizar">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="id" Name="Id" Type="Int32"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>

</asp:Content>

