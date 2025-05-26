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
	public partial class adminItems : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        [WebMethod]
        public static string UpsertItem(int CategoryID, int ItemID, string ItemName,
        string ItemDescription, string ItemImage, decimal OriginalPrice, decimal DiscountPercentage, int IsActive)
        {
            try
            {
                string dbconn = ConfigurationManager.AppSettings["dbConn"];
                using (SqlConnection con = new SqlConnection(dbconn))
                {
                    using (SqlCommand cmd = new SqlCommand("UpsertItem", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@CategoryID", CategoryID);
                        cmd.Parameters.AddWithValue("@ItemID", ItemID);
                        cmd.Parameters.AddWithValue("@ItemName", ItemName);
                        cmd.Parameters.AddWithValue("@ItemDescription", ItemDescription);
                        cmd.Parameters.AddWithValue("@ItemImage", ItemImage);
                        cmd.Parameters.AddWithValue("@OriginalPrice", OriginalPrice);
                        cmd.Parameters.AddWithValue("@DiscountPercentage", DiscountPercentage);
                        cmd.Parameters.AddWithValue("@IsActive", IsActive);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        return JsonConvert.SerializeObject(ds);

                    }
                }
            }
            catch (Exception ex)
            {
                // Optionally log ex.Message here
                return "0";
            }
        }

    }
}