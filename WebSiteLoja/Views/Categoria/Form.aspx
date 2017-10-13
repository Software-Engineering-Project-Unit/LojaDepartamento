<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Views_Categoria_Form" %>

<%@ MasterType VirtualPath="~/Views/MasterPage/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Categoria</h3>
            </div>
            <div class="panel-body">
                <asp:FormView ID="fvwCategoria" DefaultMode="ReadOnly" EmptyDataText="Não há categoria com o código especificado" Width="100%" DataKeyNames="Id" runat="server" DataSourceID="ObjectDataSource1" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="fvwCategoria_ItemInserted">
                    <EditItemTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Nome" runat="server" />
                                    <div>
                                        <asp:TextBox Text='<%# Bind("Nome") %>' runat="server" ID="tbxNome" CssClass="form-control" />
                                        <asp:RequiredFieldValidator CssClass="error-message" runat="server"
                                            ControlToValidate="tbxNome" ErrorMessage="Campo obrigatório" ForeColor="Red" EnableClientScript="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Nome:
                        <asp:TextBox Text='<%# Bind("Nome") %>' runat="server" ID="NomeTextBox" /><br />
                        <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Nome:
                        <asp:Label Text='<%# Bind("Nome") %>' runat="server" ID="NomeLabel" /><br />
                        <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;
                        <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" OnClientClick="return confirm ('Deseja realmente excuir?')" />
                    </ItemTemplate>

                </asp:FormView>


                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="Obter" TypeName="CategoriaController" DataObjectTypeName="LojaDepartamentoModel.Categoria" DeleteMethod="Deletar" InsertMethod="Inserir" UpdateMethod="Atualizar">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="id" Name="Id" Type="Int32"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>

</asp:Content>

