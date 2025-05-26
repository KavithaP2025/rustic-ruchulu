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
	public partial class cart : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        [WebMethod]
        public static string UpsertCartItem(int CartID, int UserID, int ItemID, int CategoryID, int ItemCount)
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                SqlConnection con = new SqlConnection(dbconn);
                SqlCommand cmd = new SqlCommand("UpsertCartItem", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", CartID);
                cmd.Parameters.AddWithValue("@UserID", UserID);
                cmd.Parameters.AddWithValue("@ItemID", ItemID);
                cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
                cmd.Parameters.AddWithValue("@ItemCount", ItemCount);
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
        public static string GetCartItemsByUser(int UserID)
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                SqlConnection con = new SqlConnection(dbconn);
                SqlCommand cmd = new SqlCommand("GetCartItemsByUser", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", UserID);
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