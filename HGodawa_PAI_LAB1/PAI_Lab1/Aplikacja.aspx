<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aplikacja.aspx.cs" Inherits="PAI_Lab1.Aplikacja" EnableViewState="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form" ID="form" draggable="auto" runat="server" style="background-color: #FFFFFF; align-items: center; justify-content: center; text-align: center; border: 1px solid #aaa;">
            Wprowadz imie i nazwisko
            <br />
            <asp:TextBox ID="InputNameField" runat="server" Text=""></asp:TextBox>
            <br />
            <asp:Button ID="InputNameButton" runat="server" Text="Submit" onClick="InputNameButton_Click"></asp:Button>
            <br />
            <asp:RequiredFieldValidator ID="RequiredNameValidator" runat="server" 
                ControlToValidate="InputNameField" ErrorMessage="Name is required" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="RegexNameValidator" runat="server" 
                ControlToValidate="InputNameField" ErrorMessage="Invalid name format" 
                ValidationExpression="^[A-Z][a-z]{2,}\s[A-Z][a-z]{2,}$" Display="Dynamic" />
        </div>
        <div class="main" ID="main" runat="server">
            <div class="Workspace" draggable="auto" style="background-color: #FFFFFF; align-items: center; justify-content: center; text-align: center;">
                Określ rozmiar rysunku:
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="84px" style="margin: auto;" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Mały" Value="1" />
                    <asp:ListItem Text="Średni" Value="2" />
                    <asp:ListItem Text="Duży" Value="3" Selected="True"/>
                </asp:RadioButtonList>
                Określ układ rysunków:
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Piątka" Value="1" />
                    <asp:ListItem Text="Przekątna lewa" Value="2" />
                    <asp:ListItem Text="Przekątna prawa" Value="3" />
                    <asp:ListItem Text="Linia pozioma" Value="4" />
                    <asp:ListItem Text="Linia pionowa" Value="5" />
                </asp:DropDownList>
                <br />
                Minimaly czas odpowiedzi:
                <br />
                <asp:Label ID="LabelMinTime" runat="server" Text="" ForeColor="Red" ReadOnly="true"></asp:Label>
                <br />
                Maksymalny czas odpowiedzi:
                <br />
                <asp:Label ID="LabelMaxTime" runat="server" Text="" ForeColor="Red" ReadOnly="true"></asp:Label>
                <br />
                <br />
                Nazwa użytkownika:
                <br />
                <asp:Label ID="LoggedUser" runat="server" Text="" ForeColor="Red" ReadOnly="true"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                <br />
                <br />
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DefaultMode="Insert" CssClass="custom-detailsview">
                    <Fields>
                        <asp:TemplateField HeaderText="Ile Zmian Aktywnego Rysunku">
                            <ItemTemplate>
                                <asp:Label ID="TextBoxField1" runat="server" Text="0" CssClass="right-column"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ile Zmian Rozmiaru Rysunków">
                            <ItemTemplate>
                                <asp:Label ID="TextBoxField2" runat="server" Text="0" CssClass="right-column"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ile Zmian Układu Rysunków">
                            <ItemTemplate>
                                <asp:Label ID="TextBoxField3" runat="server" Text="0" CssClass="right-column"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ilu Użytkowników">
                            <ItemTemplate>
                                <asp:Label ID="TextBoxField4" runat="server" Text="0" CssClass="right-column"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>


            </div>
            <div class="GridContainer">
                <div class="GridContent">
                    <div class="box" id="box1">
                        <asp:ImageButton ID="ImageButton1" runat="server" data-index="0" onClick="Button_Click"></asp:ImageButton>
                    </div>
                    <div class="box" id="box2">
                        <asp:ImageButton ID="ImageButton2" runat="server" data-index="1" onClick="Button_Click"></asp:ImageButton>
                    </div>
                    <div class="box" id="box3">
                        <asp:ImageButton ID="ImageButton3" runat="server" data-index="2" onClick="Button_Click"></asp:ImageButton>
                    </div>
                </div>
                <div class="GridContent">
                    <div class="box" id="box4">
                        <asp:ImageButton ID="ImageButton4" runat="server" data-index="3" onClick="Button_Click"></asp:ImageButton>
                    </div>
                    <div class="box" id="box5">
                        <asp:ImageButton ID="ImageButton5" runat="server" data-index="4" onClick="Button_Click"></asp:ImageButton>
                    </div>
                    <div class="box" id="box6">
                        <asp:ImageButton ID="ImageButton6" runat="server" data-index="5" onClick="Button_Click"></asp:ImageButton>
                    </div>
                </div>
                <div class="GridContent">
                   <div class="box" id="box7">
                        <asp:ImageButton ID="ImageButton7" runat="server" data-index="6" onClick="Button_Click"></asp:ImageButton>
                    </div>
                    <div class="box" id="box8">
                        <asp:ImageButton ID="ImageButton8" runat="server" data-index="7" onClick="Button_Click"></asp:ImageButton>
                    </div>
                    <div class="box" id="box9">
                        <asp:ImageButton ID="ImageButton9" runat="server" data-index="8" onClick="Button_Click"></asp:ImageButton>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
