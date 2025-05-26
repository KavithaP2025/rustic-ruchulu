using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web;

public class EmailHelper
{
    public static bool SendEmail(string ToEmail, string UserName, string InitialPIN)
    {
        try
        {
            string SenderEmail = ConfigurationManager.AppSettings["SenderEmail"];
            string SenderPassword = ConfigurationManager.AppSettings["SenderPassword"];
            // mail body
            string CompanyName = ConfigurationManager.AppSettings["CompanyName"];
            string CopyRightsYear = ConfigurationManager.AppSettings["CopyRightsYear"];
            string SupportContactNumber = ConfigurationManager.AppSettings["SupportContactNumber"];

            string filePath = HttpContext.Current.Server.MapPath("wwwroot/Templates/Send_OTP_Template.html");
            string emailBody = File.ReadAllText(filePath);


            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(SenderEmail);
            mail.To.Add(ToEmail);
            mail.Subject = "OTP Verification";
            mail.Body = emailBody.Replace("{{UserName}}", UserName)
                .Replace("{{InitialPIN}}", InitialPIN)
                .Replace("{{CompanyName}}", CompanyName)
                .Replace("{{CopyRightsYear}}", CopyRightsYear)
                .Replace("{{SupportContactNumber}}", SupportContactNumber);
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential(SenderEmail, SenderPassword);
            smtp.EnableSsl = true;
            smtp.Send(mail);
            return true;
        }
        catch (Exception ex)
        {
            // Log or handle error
            Console.WriteLine("Email Error: " + ex.Message);
            return false;
        }
    }
}
