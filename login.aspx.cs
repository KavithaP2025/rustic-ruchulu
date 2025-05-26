using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RusticRuchulu
{
	public partial class login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            //SendMail();
        }

        [WebMethod]
        public static string CheckEmailAndGenerateCode(string email)
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                SqlConnection con = new SqlConnection(dbconn);
                SqlCommand cmd = new SqlCommand("CheckEmailAndGenerateCode", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", email);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                return JsonConvert.SerializeObject(ds);
            }
            catch (Exception ex)
            {
                return "0";
            }
        }



        [WebMethod]
        public static bool SendMail(string email, string code, string username)
        {
            string ToEmail = "ravi8179586384@gmail.com";
            string UserName = "Ravi";
            string InitialPIN = "123456";
            bool isSent = EmailHelper.SendEmail(email, username, code);
            if (isSent)
            {
                Console.WriteLine("Email sent successfully!");
            }
            else
            {
                Console.WriteLine("Email failed to send.");
            }
            return isSent;
        }

        [WebMethod]
        public static string ValidateEmailAndPin(string PIN, string Email)
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                SqlConnection con = new SqlConnection(dbconn);
                SqlCommand cmd = new SqlCommand("ValidateEmailAndPin", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@PIN", PIN);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                return JsonConvert.SerializeObject(ds);
            }
            catch (Exception ex)
            {
                return "0";
            }
        }
    }
}