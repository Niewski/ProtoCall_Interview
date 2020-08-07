<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="People.aspx.cs" Inherits="People" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LocalSQLServer" KeyFieldName="Id" CssClass="grid" >

        <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" HeaderStyle-CssClass="grid-header" ShowEditButton="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" HeaderStyle-CssClass="grid-header">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EntityId" VisibleIndex="2" HeaderStyle-CssClass="grid-header">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="3" HeaderStyle-CssClass="grid-header"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="4" HeaderStyle-CssClass="grid-header"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PreferredName" VisibleIndex="5" HeaderStyle-CssClass="grid-header"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="6" HeaderStyle-CssClass="grid-header"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="PrimaryPhoneNumber" VisibleIndex="7" HeaderStyle-CssClass="grid-header"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SecondaryPhoneNumber" VisibleIndex="8" HeaderStyle-CssClass="grid-header"></dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="LocalSQLServer" ConnectionString='<%$ ConnectionStrings:masterConnectionString_Local %>' 
        SelectCommand="SELECT * FROM [People]" 
        DeleteCommand="DELETE FROM People WHERE (Id = @Id)" 
        UpdateCommand="spUpdatePerson" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:FormParameter DefaultValue="NULL" FormField="Id" Name="@Id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int64" />
            <asp:Parameter Name="FirstName" Type ="String" />
            <asp:Parameter Name="LastName" Type ="String" />
            <asp:Parameter Name="PreferredName" Type ="String" />
            <asp:Parameter Name="BirthDate" Type = "DateTime" />
            <asp:Parameter Name="PrimaryPhoneNumber" Type ="String" />
            <asp:Parameter Name="SecondaryPhoneNumber" Type ="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

