<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="People.aspx.cs" Inherits="People" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LocalSQLServer" KeyFieldName="Id">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EntityId" VisibleIndex="1"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PreferredName" VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="5"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="PrimaryPhoneNumber" VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SecondaryPhoneNumber" VisibleIndex="7"></dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="LocalSQLServer" ConnectionString='<%$ ConnectionStrings:masterConnectionString_Local %>' SelectCommand="SELECT * FROM [People]"></asp:SqlDataSource>
</asp:Content>

