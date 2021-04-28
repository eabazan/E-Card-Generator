<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Card_Generator.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Greeting Card Maker</title>
    <style type="text/css">
        .myStyle {
            position: absolute;
            top: 8px;
            left: 291px;
            height: 483px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 280px; background-color:aquamarine">
            <br />
            Choose a background color:<br />
            <asp:DropDownList ID="lstBackColor" Width="194px" Height="22px" runat="server"></asp:DropDownList><br /><br />
            Choose a font:<br />
            <asp:DropDownList ID="lstFontName" Width="194px" Height="22px" runat="server"></asp:DropDownList><br /><br />
            Specify a numeric font size:<br />
            <asp:TextBox ID="txtFontSize" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFont" ControlToValidate="txtFontSize" Text="It has to be a numeric value"  runat="server"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rvFontSize" ControlToValidate="txtFontSize" Type="Integer" MinimumValue="1" MaximumValue="200" ErrorMessage="The value has to be between 0 and 200." runat="server">*</asp:RangeValidator>
            <asp:ValidationSummary runat="server" /><br /><br />
            Choose a border style:<br />
            <asp:RadioButtonList ID="lstBorder1" Width="177px" Height="59px" runat="server" /><br /><br />
            <asp:CheckBox ID="chkPicture" Text="Add the default picture." runat="server" /><br /><br />
            Enter the greeting text below:<br />
            <asp:TextBox ID="txtGreeting" Width="240px" Height="85px" TextMode="MultiLine" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="cmdUpdate" Width="71px" Height="24px" Text="Update" OnClick="cmdUpdate_Click" runat="server" />
            
        </div>
        <!--Here is the card-->
        
            <asp:Panel ID="pnlCard" Width="339px" Height="510px" CssClass="myStyle" HorizontalAlign="Center" runat="server">
                <br />&nbsp;
                <asp:Label ID="lblGretting" Width="256px" Height="150px" runat="server"></asp:Label><br /><br /><br />
                <asp:Image ID="imgDefault" Width="212px" Height="160px" runat="server" />
            </asp:Panel>          

    </form>
</body>
</html>
