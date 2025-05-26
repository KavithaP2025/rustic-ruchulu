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
	public partial class register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        [WebMethod]
        public static string Register(string UserName, string UserEmail, string UserPhone)
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                SqlConnection con = new SqlConnection(dbconn);
                SqlCommand cmd = new SqlCommand("InsertNewUser", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", UserName);
                cmd.Parameters.AddWithValue("@PhoneNumber", UserPhone);
                cmd.Parameters.AddWithValue("@Email", UserEmail);
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