<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListofEmployees.aspx.cs" Inherits="EmpSalMgntSystem.ListofEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Empid,EmpID"
         OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
        <Columns>
            <asp:TemplateField HeaderText="Id" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("Empid") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtid" runat="server" Text='<%# Eval("Empid") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("EmpName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("EmpName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Department" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblDept" runat="server" Text='<%# Eval("EmpDept") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDept" runat="server" Text='<%# Eval("EmpDept") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sex" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblSex" runat="server" Text='<%# Eval("EmpSex") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtSex" runat="server" Text='<%# Eval("EmpSex") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Marital Status" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("EmpMaritalStatus") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtStatus" runat="server" Text='<%# Eval("EmpMaritalStatus") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("EmpAddress") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("EmpAddress") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Salary" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("EmpSalary") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtSalary" runat="server" Text='<%# Eval("EmpSalary") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                ItemStyle-Width="150" />
        </Columns>
    </asp:GridView>
    </div>
        </form>
</body>
</html>
