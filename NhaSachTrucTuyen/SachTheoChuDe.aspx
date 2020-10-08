<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SachTheoChuDe.aspx.cs" Inherits="NhaSachTrucTuyen.SachTheoChuDe" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT [MaSach], [TenSach], [DonVi], [DonGia], [Hinh] FROM [tSach] WHERE ([MaCD] = @MaCD)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="MaCD" QueryStringField="MaCD" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [tChuDe]"></asp:SqlDataSource>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSach" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" PageSize="5" Width="100%">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
       <asp:TemplateField HeaderText="STT" InsertVisible="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        <asp:ImageField DataImageUrlField="Hinh" DataImageUrlFormatString="~/images/Books/{0}" HeaderText="Hình" >
        <ControlStyle Height="80px" />
        </asp:ImageField>
        <asp:HyperLinkField DataNavigateUrlFields="MaSach" DataNavigateUrlFormatString="~/ChiTietSach.aspx?MaSach={0}" DataTextField="TenSach" HeaderText="Tên Sách" SortExpression="TenSach" />
        <asp:BoundField DataField="DonVi" HeaderText="Đơn Vị" />
        <asp:BoundField DataField="DonGia" HeaderText="Đơn Giá" SortExpression="DonGia" DataFormatString="{0:#,###đ}" />
    </Columns>
    <HeaderStyle BackColor="CornflowerBlue" ForeColor="White" />
    
    <RowStyle BackColor="#CCFF99" />
    <PagerStyle BackColor="cornflowerblue" ForeColor="White" HorizontalAlign="Center" />
    
</asp:GridView>
</asp:Content>
