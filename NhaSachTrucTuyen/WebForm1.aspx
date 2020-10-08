<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="NhaSachTrucTuyen.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Image ID="Image1" runat="server" />
    <asp:FileUpload ID="FileUpload1" runat="server" OnDataBinding="FileUpload1_DataBinding" OnLoad="FileUpload1_Load" />

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

</asp:Content>
