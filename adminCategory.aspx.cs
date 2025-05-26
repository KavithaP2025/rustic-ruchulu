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
	public partial class adminCategory : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        [WebMethod]
        public static string GetCategories()
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                SqlConnection con = new SqlConnection(dbconn);
                SqlCommand cmd = new SqlCommand("GetCategories", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
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
        public static string UpsertCategory(int CategoryID, string CategoryName,
            string CategoryDescription, string CategoryImage, int SortOrder, int IsActive)
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                SqlConnection con = new SqlConnection(dbconn);
                SqlCommand cmd = new SqlCommand("UpsertCategory", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
                cmd.Parameters.AddWithValue("@CategoryName", CategoryName);
                cmd.Parameters.AddWithValue("@CategoryDescription", CategoryDescription);
                cmd.Parameters.AddWithValue("@CategoryImage", CategoryImage);
                cmd.Parameters.AddWithValue("@SortOrder", SortOrder);
                cmd.Parameters.AddWithValue("@IsActive", IsActive);
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