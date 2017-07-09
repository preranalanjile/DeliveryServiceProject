using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Data.SqlClient;

public partial class forgotpswd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    string regEmail = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
    int isValidMail(String s)
    {
        Regex Reg = new Regex(regEmail);
        if (Reg.IsMatch(s))
            return 1;
        else
            return 0;
    }

    protected void recover_pwd(object sender, EventArgs e)
    {
        if ((isValidMail(ForgotPswdEmail.Text) == 1))
        {

            string connetionString = null;

            connetionString = "Data Source=dcm.uhcl.edu;Initial Catalog=c432016sp02lanjilep;User ID=lanjilep;Password=1419625";
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            var query = "select * from LanjileP_WADsp16_Users  where email_address = @email ";
            SqlCommand que = new SqlCommand(query, cnn);
            que.Parameters.AddWithValue("@email", ForgotPswdEmail.Text);
            SqlDataReader data = que.ExecuteReader();
            int counter = 0;
            while (data.Read())
            {
                counter++;
            }
            cnn.Close();
            if (counter > 0)
            {
                MailMessage objeto_mail = new MailMessage();
                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.EnableSsl = true;
                client.Host = "smtp.gmail.com";
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("uhclpre@gmail.com", "uhclpre123");
                objeto_mail.From = new MailAddress("uhclpre@gmail.com");
                objeto_mail.To.Add(new MailAddress(ForgotPswdEmail.Text));
                objeto_mail.Subject = "We have recovered your Access Code !";
                cnn.Open();
                data = que.ExecuteReader();

                while (data.Read())
                {
                    string body = "<h3>" + "Valued Customer," + "</h3>" + "<br>";
                    body += "Thank you for contacting us. Your access code is " + data["access_code"].ToString() + "<br><br>";
                    body += "<h4>" + "Thankyou." + "</h4>" + "<br>";
                    body += "<h4>" + "Delivery Service - Security Team" + "</h4>";
                    objeto_mail.Body = body;
                }
                cnn.Close();
                string script = "<script type=\"text/javascript\">alert('Your access code has been sent to the email address in file');</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
                client.Send(objeto_mail);

               
            }
            else
            {
                string script = "<script type=\"text/javascript\">alert('We don't have this mail in our system.');</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
            }

        }
        else
        {
            string script = "<script type=\"text/javascript\">alert('Not a valid Email Address.');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
    }

}