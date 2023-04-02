using CabReservationSystem.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CabReservationSystem.Controllers
{
    [Authorize]
    public class CabReservationController : Controller
    {
        string Connection = "server=localhost;uid=root;" + "database=DB_CAB_RESERVATION_SYSTEM; SslMode = none";
        // GET: Login

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(Login obj)
        {
            DataSet ds = new DataSet();
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(Connection))
            {
                MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter("select * from TBL_USER_REGISTRATION o where o.UName= @UName and o.Password= @pwd", conn);
                da.SelectCommand.Parameters.AddWithValue("@UName", obj.userName);
                da.SelectCommand.Parameters.AddWithValue("@pwd", obj.password);
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    FormsAuthentication.SetAuthCookie(ds.Tables[0].Rows[0]["UName"].ToString(), false);
                    Session["ID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                    Session["UserRoles"] = ds.Tables[0].Rows[0]["UserRoles"].ToString();
                    return RedirectToAction("Index");
                }

            }
            return View();
        }

        [AllowAnonymous]
        public ActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Registration(RegistrationDetails obj)
        {
            int count = 0;
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(Connection))
            {
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select Count(*) from TBL_USER_REGISTRATION o where o.UName = @UName and o.Password = @pwd", conn);
                cmd.Parameters.AddWithValue("@UName", obj.Name);
                cmd.Parameters.AddWithValue("@pwd", obj.Password);
                conn.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
                if (count > 0)
                {
                    ViewBag.Message = "User Already Exist.";
                }
                else
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("insert into TBL_USER_REGISTRATION(UName,FirstName,LastName,Email,PhoneNO,Password,UserRoles) values(@UName,@FirstName,@LastName,@Email,@PhoneNO,@pwd,@UserRoles)", conn);
                    cmd1.Parameters.AddWithValue("@UName", obj.Name);
                    cmd1.Parameters.AddWithValue("@FirstName", obj.FirstName);
                    cmd1.Parameters.AddWithValue("@LastName", obj.LastName);
                    cmd1.Parameters.AddWithValue("@Email", obj.Email);
                    cmd1.Parameters.AddWithValue("@PhoneNO", obj.Phone);
                    cmd1.Parameters.AddWithValue("@pwd", obj.Password);
                    cmd1.Parameters.AddWithValue("@UserRoles", obj.Roles); 
                    conn.Open();
                    count = cmd1.ExecuteNonQuery();
                    conn.Close();
                    if (count == 0)
                    {
                        ViewBag.Message = "Error While inserting Data.";
                    }
                    else
                    {
                        return RedirectToAction("Login", "CabReservation");
                    }
                }
            }
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CabDetails()
        {
            List<CabDetails> lstCabDetails = new List<CabDetails>();
            DataSet ds = new DataSet();
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(Connection))
            {
                MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter("select * from tbl_CAB_DET", conn);
                da.Fill(ds);

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    CabDetails CabDetails = new CabDetails();
                    CabDetails.ID = dr["ID"].ToString();
                    CabDetails.ImagePath = dr["ImagePath"].ToString();
                    CabDetails.VehicleName = dr["VehicleName"].ToString();
                    CabDetails.Description = dr["Description"].ToString();
                    lstCabDetails.Add(CabDetails);
                }
            }
            return View(lstCabDetails);
        }

        [AllowAnonymous]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}