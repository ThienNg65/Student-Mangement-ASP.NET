<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Lab11_Student_Managment.HomePage" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$(".table").dataTable();

        });
    </script>

    <style>
        .dataTables_filter {
            margin-bottom: 15px
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row mt-1">
            <div class="col">
                <br />
            </div>
        </div>

        <div class="row">
            <div class="col">

                <div class="card">

                    <div class="card-body">

                        <div class="row mt-1">
                            <div class="col">
                                <center>
                                    <h4>Thông tin Cán bộ</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-4">
                                <label class="form-label">Mã cán bộ</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="maCB" runat="server" placeholder="ID" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label class="form-label">Tên cán bộ</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="tenCB" runat="server" placeholder="Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>

        <div class="row mt-1">
            <div class="col">
                <br />
            </div>
        </div>

        <div class="row">
            <div class="col">

                <div class="card">

                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Thông tin học phần giảng dạy</h4>
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
                                <asp:GridView class="table table-striped table-bordered" 
                                    OnSelectedIndexChanged="gvCourse_SelectedIndexChanged"
                                    ID="gvCourse" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="MaMon" HeaderText="Mã môn học" ReadOnly="True" SortExpression="MaMon" >
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="TenMon" HeaderText="Tên môn học" SortExpression="TenMon" >
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:CommandField HeaderText="Chi tiết" SelectText="Xem chi tiết" ShowSelectButton="True">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>

    </div>

</asp:Content>
