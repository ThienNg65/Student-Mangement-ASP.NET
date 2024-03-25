<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Lab11_Student_Managment.LoginForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">

            <div class="col-md-6 mx-auto">

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">                   
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Đăng nhập</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="mb-3">
                                    <label for="txtMemberID" class="form-label">Mã cán bộ: </label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtMaCB" runat="server" placeholder="Mã cán bộ"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="txtPassword" class="form-label">Mật khẩu:</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtMK" runat="server" placeholder="Mật khẩu"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="form-group d-grid gap-2">
                                        <asp:Button class="btn btn-success" ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>

</asp:Content>
