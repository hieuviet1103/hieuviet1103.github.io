<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CapNhatSach.aspx.cs" Inherits="NhaSachTrucTuyen.CapNhatSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" DeleteCommand="DELETE FROM [tSach] WHERE [MaSach] = @MaSach" InsertCommand="INSERT INTO [tSach] ([TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB]) VALUES (@TenSach, @DonVi, @DonGia, @MoTa, @Hinh, @MaCD, @MaNXB)" SelectCommand="SELECT [MaSach], [TenSach], [DonVi], [DonGia], [MoTa], [Hinh], [MaCD], [MaNXB] FROM [tSach]" UpdateCommand="UPDATE [tSach] SET [TenSach] = @TenSach, [DonVi] = @DonVi, [DonGia] = @DonGia, [MoTa] = @MoTa, [Hinh] = @Hinh, [MaCD] = @MaCD, [MaNXB] = @MaNXB WHERE [MaSach] = @MaSach">
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
<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="MaSach" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" OnItemInserting="DetailsView1_ItemInserting" OnItemUpdating="DetailsView1_ItemUpdating" Width="100%">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
    <EditRowStyle BackColor="#2461BF" />
    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" Width="120px" />
    <Fields>
        <asp:BoundField DataField="MaSach" HeaderText="MaSach" InsertVisible="False" ReadOnly="True" SortExpression="MaSach" />
        <asp:BoundField DataField="TenSach" HeaderText="TenSach" SortExpression="TenSach">
        <ControlStyle Width="100%" />
        </asp:BoundField>
        <asp:BoundField DataField="DonVi" HeaderText="DonVi" SortExpression="DonVi" />
        <asp:BoundField DataField="DonGia" HeaderText="DonGia" SortExpression="DonGia" DataFormatString="{0:#,###đ}" />
        <asp:TemplateField HeaderText="MoTa" SortExpression="MoTa">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Rows="5" Text='<%# Bind("MoTa") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Rows="5" Text='<%# Bind("MoTa") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("MoTa") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle Height="100%" Width="100%" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hình" SortExpression="Hinh">
            <EditItemTemplate>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:FileUpload ID="FileUpload2" runat="server" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh", "~/Images/Books/{0}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="MaCD" HeaderText="MaCD" SortExpression="MaCD" />
        <asp:BoundField DataField="MaNXB" HeaderText="MaNXB" SortExpression="MaNXB" />
        <asp:CommandField ButtonType="Button" CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" InsertText="Thêm" NewText="Thêm" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" UpdateText="Lưu" />
    </Fields>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
</asp:DetailsView>

</asp:Content>
