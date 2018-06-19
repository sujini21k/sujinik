using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class employeeController : ApiController
    {
        IList<employee> employees = new List<employee>()
        {
            new employee()
                {
                    EmployeeId = 1, EmployeeName = "Mukesh Kumar", Address = "New Delhi", Department = "IT"
                },
                new employee()
                {
                    EmployeeId = 2, EmployeeName = "Banky Chamber", Address = "London", Department = "HR"
                },
                new employee()
                {
                    EmployeeId = 3, EmployeeName = "Rahul Rathor", Address = "Laxmi Nagar", Department = "IT"
                },
                new employee()
                {
                    EmployeeId = 4, EmployeeName = "YaduVeer Singh", Address = "Goa", Department = "Sales"
                },
                new employee()
                {
                    EmployeeId = 5, EmployeeName = "Manish Sharma", Address = "New Delhi", Department = "HR"
                },
        };
        [HttpPost]
        public IList<employee> GetAllEmployees()
        {
            //Return list of all employees  
            return employees;
        }
        
        [HttpGet]
        public employee GetEmployeeDetails(int id)
        {
            //Return a single employee detail  
            var employee = employees.FirstOrDefault(e => e.EmployeeId == id);
            if (employee == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
            return employee;
        }
        [HttpPut]
        public void SetEmployeeDetails(int id, string department)
        {
            var updateemp = (from x in employees where x.EmployeeId == id select x).FirstOrDefault();
            if (updateemp == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
            updateemp.Department.Replace("IT", department);
        }
        [HttpDelete]
        public void DeleteEmployee(int id)
        {
            var employee1 = (from x in employees where x.EmployeeId == id select x).FirstOrDefault();
            if (employee1 == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
            //employee1.RemoveAll(x => setToRemove.Contains(x));
            employees.Remove(employee1);
        }
    }
}
