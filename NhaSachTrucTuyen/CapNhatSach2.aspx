<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CapNhatSach2.aspx.cs" Inherits="NhaSachTrucTuyen.CapNhatSach2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" DeleteCommand="DELETE FROM [tSach] WHERE [MaSach] = @MaSach" InsertCommand="INSERT INTO [tSach] ([TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB]) VALUES (@TenSach, @DonVi, @DonGia, @MoTa, @Hinh, @MaCD, @MaNXB)" SelectCommand="SELECT tSach.MaSach, tSach.TenSach, tSach.DonVi, tSach.DonGia, tSach.MoTa, tSach.Hinh, tChuDe.TenCD, tNhaXuatBan.TenNXB FROM tSach INNER JOIN tChuDe ON tSach.MaCD = tChuDe.MaCD INNER JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB" UpdateCommand="UPDATE [tSach] SET [TenSach] = @TenSach, [DonVi] = @DonVi, [DonGia] = @DonGia, [MoTa] = @MoTa, [Hinh] = @Hinh, [MaCD] = @MaCD, [MaNXB] = @MaNXB WHERE [MaSach] = @MaSach">
    <DeleteParameters>
        <asp:Parameter Name="MaSach" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="TenSach" Type="String" />
        <asp:Parameter Name="DonVi" Type="String" />
        <asp:Parameter Name="DonGia" Type="Decimal" />
        <asp:Parameter Name="MoTa" Type="String" />
        <asp:Parameter Name="Hinh" Type="String" />
        <asp:Parameter Name="MaCD" Type="Int32" />
        <asp:Parameter Name="MaNXB" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="TenSach" Type="String" />
        <asp:Parameter Name="DonVi" Type="String" />
        <asp:Parameter Name="DonGia" Type="Decimal" />
        <asp:Parameter Name="MoTa" Type="String" />
        <asp:Parameter Name="Hinh" Type="String" />
        <asp:Parameter Name="MaCD" Type="Int32" />
        <asp:Parameter Name="MaNXB" Type="Int32" />
        <asp:Parameter Name="MaSach" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [tChuDe]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT [MaNXB], [TenNXB] FROM [tNhaXuatBan]"></asp:SqlDataSource>
<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="MaSach" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
    <EditRowStyle BackColor="#2461BF" />
    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" Width="125px" />
    <Fields>
        <asp:BoundField DataField="MaSach" HeaderText="Mã sách" InsertVisible="False" ReadOnly="True" SortExpression="MaSach" />
        <asp:BoundField DataField="TenSach" HeaderText="Tên sách" SortExpression="TenSach" />
        <asp:BoundField DataField="DonVi" HeaderText="Đơn vị" SortExpression="DonVi" />
        <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" SortExpression="DonGia" />
        <asp:TemplateField HeaderText="Mô tả" SortExpression="MoTa">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Height="150px" Text='<%# Bind("MoTa") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Height="150px" Text='<%# Bind("MoTa") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("MoTa") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hình">
            <EditItemTemplate>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:FileUpload ID="FileUpload2" runat="server" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh", "~/images/books{0}") %>' />
            </ItemTemplate>
            <ItemStyle Height="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chủ đề" SortExpression="TenCD">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenCD" DataValueField="MaCD">
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenCD" DataValueField="MaCD">
                </asp:DropDownList>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("TenCD") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nhà xuất bản" SortExpression="TenNXB">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="TenNXB" DataValueField="MaNXB">
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="TenNXB" DataValueField="MaNXB">
                </asp:DropDownList>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("TenNXB") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ButtonType="Button" CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" InsertText="Thêm" NewText="Thêm" SelectText="Chọn" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" UpdateText="Cập nhật" />
    </Fields>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
</asp:DetailsView>
</asp:Content>
