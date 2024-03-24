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
                                    <h3>Student Login</h3>
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
                                    <label for="txtMemberID" class="form-label">Student ID:</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtMemberID" runat="server" placeholder="Member ID"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="txtPassword" class="form-label">Password:</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="form-group d-grid gap-2">
                                        <asp:Button class="btn btn-success" ID="btnLogin" runat="server" Text="Login" />
                                    </div>
                                </div>


                                <div class="d-grid gap-2">
                                    <a class="d-grid gap-2 text-decoration-none" href="usersignup.aspx">
                                        <input id="btnSignup" class="btn btn-info text-white" type="button" value="Sign Up" /></a>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>



                <div class="row mt-3 mb-3">
                    <a class="text-black-50 text-decoration-none" href="homepage.aspx">Back to Home Page</a>
                </div>

            </div>

        </div>

    </div>

</asp:Content>
