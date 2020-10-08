<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChiTietSach.aspx.cs" Inherits="NhaSachTrucTuyen.ChiTietSach" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT tSach.MaSach, tSach.TenSach, tSach.DonVi, tSach.DonGia, tSach.MoTa, tSach.Hinh, tChuDe.TenCD, tNhaXuatBan.TenNXB FROM tSach INNER JOIN tChuDe ON tSach.MaCD = tChuDe.MaCD INNER JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB WHERE(tSach.MaSach = @MaSach) " >
                <SelectParameters>
            <asp:QueryStringParameter Name="MaSach" QueryStringField="MaSach" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"  CellPadding="4" DataKeyNames="MaSach" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Horizontal" Height="50px" Width="100%" HeaderText="Chi tiết sách" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="MaSach" HeaderText="Mã sách" InsertVisible="False" ReadOnly="True" SortExpression="MaSach" />
            <asp:BoundField DataField="TenSach" HeaderText="Tên sách" SortExpression="TenSach" />
            <asp:BoundField DataField="DonVi" HeaderText="Đơn vị" SortExpression="DonVi" />
            <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" SortExpression="DonGia" DataFormatString="{0:#,###đ}"/>
            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" SortExpression="MoTa" />
            <asp:ImageField   DataImageUrlFormatString="~/Images/Books/{0}" HeaderText="Hình" DataImageUrlField="Hinh">
            </asp:ImageField>
            <asp:BoundField DataField="TenCD" HeaderText="Chủ đề" SortExpression="TenCD" />
            <asp:BoundField DataField="TenNXB" HeaderText="Nhà xuất bản" SortExpression="TenNXB" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>

</asp:Content>
