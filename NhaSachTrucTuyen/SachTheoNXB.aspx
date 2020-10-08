<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SachTheoNXB.aspx.cs" Inherits="NhaSachTrucTuyen.SachTheoNXB" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Nhà xuất bản
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="TenNXB" DataValueField="MaNXB">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT [TenNXB], [MaNXB] FROM [tNhaXuatBan]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT [MaSach], [TenSach], [DonVi], [DonGia] FROM [tSach] WHERE ([MaNXB] = @MaNXB)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tSach] WHERE [MaSach] = @original_MaSach AND (([TenSach] = @original_TenSach) OR ([TenSach] IS NULL AND @original_TenSach IS NULL)) AND (([DonVi] = @original_DonVi) OR ([DonVi] IS NULL AND @original_DonVi IS NULL)) AND (([DonGia] = @original_DonGia) OR ([DonGia] IS NULL AND @original_DonGia IS NULL))" InsertCommand="INSERT INTO [tSach] ([TenSach], [DonVi], [DonGia]) VALUES (@TenSach, @DonVi, @DonGia)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tSach] SET [TenSach] = @TenSach, [DonVi] = @DonVi, [DonGia] = @DonGia WHERE [MaSach] = @original_MaSach AND (([TenSach] = @original_TenSach) OR ([TenSach] IS NULL AND @original_TenSach IS NULL)) AND (([DonVi] = @original_DonVi) OR ([DonVi] IS NULL AND @original_DonVi IS NULL)) AND (([DonGia] = @original_DonGia) OR ([DonGia] IS NULL AND @original_DonGia IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_MaSach" Type="Int32" />
                <asp:Parameter Name="original_TenSach" Type="String" />
                <asp:Parameter Name="original_DonVi" Type="String" />
                <asp:Parameter Name="original_DonGia" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TenSach" Type="String" />
                <asp:Parameter Name="DonVi" Type="String" />
                <asp:Parameter Name="DonGia" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="MaNXB" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenSach" Type="String" />
                <asp:Parameter Name="DonVi" Type="String" />
                <asp:Parameter Name="DonGia" Type="Decimal"  />
                <asp:Parameter Name="original_MaSach" Type="Int32" />
                <asp:Parameter Name="original_TenSach" Type="String" />
                <asp:Parameter Name="original_DonVi" Type="String" />
                <asp:Parameter Name="original_DonGia" Type="Decimal"  />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSach" DataSourceID="SqlDataSource2" Width="100%">
            
            <Columns>
                <asp:TemplateField HeaderText="STT">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                
                <asp:BoundField DataField="TenSach" HeaderText="Tựa sách" SortExpression="TenSach" />
                <asp:BoundField DataField="DonVi" HeaderText="Đơn vị" SortExpression="DonVi" />
                <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" SortExpression="DonGia" DataFormatString="{0:#,###đ}" />
                <asp:CommandField  ButtonType="Link" CancelText="Hủy" DeleteText="Xóa" EditText="Sửa" HeaderText="Sửa" InsertText="Chèn" NewText="Mới" SelectText="Chọn" ShowCancelButton="False" ShowEditButton="True" ShowHeader="True" UpdateText="Cập nhật" />
            </Columns>
            <AlternatingRowStyle BackColor="White" />
            <HeaderStyle BackColor="CornflowerBlue" ForeColor="White" />
            <RowStyle BackColor="#CCFF99" />
            <PagerStyle BackColor="cornflowerblue" ForeColor="White" HorizontalAlign="Center" />
    
        </asp:GridView>
    </p>
</asp:Content>
