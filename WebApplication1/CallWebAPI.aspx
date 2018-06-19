<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallWebAPI.aspx.cs" Inherits="WebApplication1.CallWebAPI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        EmployeeId :- <input type="text" name="name" id="empid" />
        Name :- <input type="text" name="name" id="empname" />

        Address:- <input type="text" name="surname" id="empaddress" />

        Department:- <input type="text" name="surname" id="empDeptname" />        
    </div>
    </form>
</body>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#Save").click(function () {                

                var employee = new Object();
                employee.EmployeeId = $('#empid').val();

                employee.EmployeeName = $('#empname').val();

                employee.Address = $('#empaddress').val( );

                employee.Department = $('#empDeptname').val( ); 

                $.ajax({

                    url: 'http://localhost:49962/employee/GetAllEmployees',

                    type: 'POST',

                    dataType: 'json',

                    data: employee.EmployeeId,

                    success: function (data, textStatus, xhr) {

                        console.log(data);

                    },

                    error: function (xhr, textStatus, errorThrown) {

                        console.log('Error in Operation');

                    }              
                });

                $.ajax({
                    url: 'http://localhost/49962/employee/GetEmployeeDetails',
                    type: 'GET',
                    dataType: 'json',
                    success: function (EmployeeId) {
                        WriteResponse(employee);
                    },
                    error: function (x, y, z) {
                        alert(x + '\n' + y + '\n' + z);
                    }
                
            });

            function productDelete(id) {
                var id = $('#empid').val();

                $.ajax({
                    url: 'http://localhost/49962/employee/SetEmployeeDetails' + id,
                    type: 'PUT',
                    success: function (product) {
                        $(ctl).parents("tr").html();
                    },
                    error: function (request, message, error) {
                        handleException(request, message, error);
                    }
                });
            }

            function productDelete(id) {
                var id = $('#empid').val();

                $.ajax({
                    url: 'http://localhost/49962/employee/DeleteEmployee' + id,
                    type: 'DELETE',
                    success: function (product) {
                        $(ctl).parents("tr").remove();
                    },
                    error: function (request, message, error) {
                        handleException(request, message, error);
                    }
                });
            }
            });
        });        
    </script>
</html>
