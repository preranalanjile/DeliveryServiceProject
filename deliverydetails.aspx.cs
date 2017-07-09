using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class deliverydetails : System.Web.UI.Page
{
    SqlConnection cnn;
    protected void Page_Load(object sender, EventArgs e)
    {
        string email = (string)(Session["currentuserEmail"]);
        if (email != null)
        {
            WelcomeText.InnerHtml = "Welcome " + (string)(Session["FullName"]);
            string connetionString = null;

            connetionString = "Data Source=dcm.uhcl.edu;Initial Catalog=c432016sp02lanjilep;User ID=lanjilep;Password=1419625";
            cnn = new SqlConnection(connetionString);
        }
        else
        {
            Response.Redirect("login.aspx");

        }
    }

    protected void Log_Out(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("login.aspx");
    }

    protected void SubmitRequest(object sender, EventArgs e)
    {

        string email = (string)(Session["currentuserEmail"]);
        string phone = (string)(Session["currentPhone"]);
        if (email != null)
        {
            DeliveryDetail delivery = new DeliveryDetail();
            List<User> users = Application["AllUsersList"] as List<User>;
            User loggein;
            DeliveryDetail[] deliveryservices;
            foreach (var ob in users)
            {

                loggein = ob;
                deliveryservices = loggein.DeliveryDetails;
                List<DeliveryDetail> DeliveryDetailList = new List<DeliveryDetail>();
                if (deliveryservices != null)
                {
                    for (int i = 0; i < deliveryservices.Length; i++)
                    {
                        DeliveryDetailList.Add(deliveryservices[i]);
                    }
                    DeliveryDetailList.Add(delivery);
                }
                else
                {
                    DeliveryDetailList.Add(delivery);
                }
                loggein.DeliveryDetails = DeliveryDetailList.ToArray();
            }
            cnn.Open();

            string query = "insert into LanjileP_WADsp16_delivery_requests VALUES (@pickup_address, @recipient_address, @recipient_phone, @description, @request_date, @access_code, @user_email_address)";

            SqlCommand que = new SqlCommand(query, cnn);
            que.Parameters.AddWithValue("@pickup_address", pickupAddress.Text);
            que.Parameters.AddWithValue("@recipient_address", recipientAddress.Text);
            que.Parameters.AddWithValue("@recipient_phone", recipientPhone.Text);
            que.Parameters.AddWithValue("@description", deliveryDescription.Text);
            que.Parameters.AddWithValue("@request_date", DateTime.Now.ToString("MM/dd/yyyy"));
            que.Parameters.AddWithValue("@access_code", Session["currentAccess"]);
            que.Parameters.AddWithValue("@user_email_address", email);
            que.ExecuteNonQuery();
            cnn.Close();

            string script = "<script type=\"text/javascript\">alert('Thank you for submitting a delivery request. We are more than happy to serve you. An invoice email has been sent to the email address in our file.');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);

            // Send delivery creation mail
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
            objeto_mail.To.Add(new MailAddress(email));
            objeto_mail.Subject = "Delivery Service Registration Confirmation New Request Confirmation";
            string body = "Valued Customer" + (string)(Session["FullName"]) + "<br>";
            body += "You have requested a new delivery. Details shown below." + "<br><br>";
            body += "Pickup Address :" + pickupAddress.Text + ", ";
            body += "Recepient Address :" + recipientAddress.Text + ", ";
            body += "Description :" + deliveryDescription.Text + ". ";
            body += "Please note that any modifications made after 2 hours of submission of the original request shall be rejected." + "<br><br>";
            body += "Sincerely";
            body += "<h4>" + "Delivery Service - Team" + "</h4>";
            objeto_mail.Body = body;
            try
            {
                client.Send(objeto_mail);

            }
            catch (Exception)
            {
                
            }

            pickupAddress.Text = "";
            recipientAddress.Text = "";
            recipientPhone.Text = "";
            deliveryDescription.Text = "";
        }
        else
        {
            string script = "<script type=\"text/javascript\">alert('Please login');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
            Response.Redirect("login.aspx");
        }

    }


}