using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class contact_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Contact_Email(Object sender, EventArgs e)
    {
        String msgTo = ContactEmailID.Text;
        string body = "<h3>" + "Valued Customer," + "</h3>" + "<br>";
        body += "Thank you for contacting us. One of our customer service representatives will be contacting you within the next 24 hours. " + "<br><br>";
        body += "Thankyou.";
        body += "<h4>" + "Delivery Service - Customer Service Team" + "</h4>";
        String msgSubject = "We have received your message !";

        MailMessage objet_mail = new MailMessage();
        objet_mail.From = new MailAddress("uhclpre@gmail.com");
        objet_mail.To.Add(new MailAddress(ContactEmailID.Text.ToString()));
        objet_mail.Subject = msgSubject;
        objet_mail.Subject = body;

        SmtpClient client = new SmtpClient();
        client.Port = 587;
        client.EnableSsl = true;
        client.Host = "smtp.gmail.com";
        client.Timeout = 10000;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.Credentials = new System.Net.NetworkCredential("uhclpre@gmail.com", "uhclpre123");

        try
        {
            client.Send(objet_mail);
            string script = "<script type=\"text/javascript\">alert('Customer service mail is sent');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
        catch (Exception)
        {
            string script = "<script type=\"text/javascript\">alert('Error');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }

    }
}