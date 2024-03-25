<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScoreUpdatePage.aspx.cs" Inherits="Lab11_Student_Managment.ScoreUpdatePage" %>

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

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Thông tin Lớp học phần</h4>
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
                                    OnRowEditing="gvStudent_RowEditing"
                                    OnRowUpdating="gvStudent_RowUpdating"
                                    OnRowCancelingEdit="gvStudent_RowCancelingEdit"
                                    DataKeyNames="MSSV"
                                    ID="gvStudent" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="MaMon" HeaderText="Mã môn học" ReadOnly="True" SortExpression="MaMon">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="TenMon" HeaderText="Tên môn học" SortExpression="TenMon">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MSSV" HeaderText="Mã sinh viên" SortExpression="MSSV">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="HoTen" HeaderText="Tên sinh viên">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MaLop" HeaderText="Mã lớp">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Diem" HeaderText="Điểm">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:CommandField HeaderText="Cập nhật điểm" SelectText="" CancelText="Hủy" DeleteText="" EditText="Cập nhật" InsertText="" NewText="" ShowEditButton="True" UpdateText="Lưu">
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
