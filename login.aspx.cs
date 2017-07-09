using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Net.Mail;


public partial class login : System.Web.UI.Page
{
    SqlConnection cnn;

    string regEmail = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
    string regPhone = @"^[0-9]{3}-[0-9]{3}-[0-9]{4}$";

    protected void Page_Load(object sender, EventArgs e)
    {
        string connetionString = null;

        connetionString = "Data Source=dcm.uhcl.edu;Initial Catalog=c432016sp02lanjilep;User ID=lanjilep;Password=1419625";
        cnn = new SqlConnection(connetionString);

        //Necessary to stop creating new code on click of "Create Button"
        if (!IsPostBack)
        {
            var r = new Random();
            // print random integer > 99999 and < 1000000
            var a = r.Next(99999, 1000000);
            string randNumber = a.ToString();
            RandomNumber.Text = randNumber;
        }
        radio_forms(sender, e);
    }

    // Radio button actions
    protected void radio_forms(Object sender, EventArgs e)
    {

        if (radio_one.Checked)
        {

            NoAccount.Visible = false;
            FirstActPage.Visible = true;

        }
        if (radio_two.Checked)
        {

            FirstActPage.Visible = false;
            NoAccount.Visible = true;
        }

    }



    // Login Button action Start
    protected void LogIn(Object sender, EventArgs e)
    {
        if ((isValidMail(Email.Text) == 1) && (Pswd.Text != ""))
        {
            List<User> allUsersList = Application["AllUsersList"] as List<User>;
            int counter = 0;
            cnn.Open();
            var query = "select * from LanjileP_WADsp16_Users where email_address = @email and access_code = @password ";
            SqlCommand que = new SqlCommand(query, cnn);
            que.Parameters.AddWithValue("@email", Email.Text);
            que.Parameters.AddWithValue("@password", Pswd.Text);
            SqlDataReader data = que.ExecuteReader();

            while (data.Read())
            {
                counter++;
                Session["FullName"] = data["full_name"];
            }
            cnn.Close();
            if (counter > 0)
            {
                Session["currentuserEmail"] = Email.Text;
                Session["currentAccess"] = Pswd.Text;
                Response.Redirect("deliverydetails.aspx");
            }
            else
            {
                string script1 = "<script type=\"text/javascript\">alert('You are not  Registerd. Please Register First.');</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script1);
            }

        }
        else
        {
            string script = "<script type=\"text/javascript\">alert('Login credentials are invalid');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }

    }

    // Create new account button starts
    protected void validate_new_account(Object sender, EventArgs e)
    {
        int emailValidator = isValidMail(EmailField.Text);
        int phoneValidator = isValidPhone();

        if (FullNameField.Text == "" || MailField.Text == "" || PhoneField.Text == "" || EmailField.Text == "" || CodeField.Text == "")
        {
            string script = "<script type=\"text/javascript\">alert('Please fill all required(*) fields');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);

        }
        else if (CodeField.Text != RandomNumber.Text)
        {
            string script = "<script type=\"text/javascript\">alert('Please enter correct Access code');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
        else if (emailValidator == 0 && phoneValidator == 1)
        {
            string script1 = "<script type=\"text/javascript\">alert('Entered email is not valid mail');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script1);
        }
        else if (emailValidator == 1 && phoneValidator == 0)
        {
            string script1 = "<script type=\"text/javascript\">alert('Entered Phone number is not valid phone number');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script1);
        }
        else if (emailValidator == 0 && phoneValidator == 0)
        {
            string script1 = "<script type=\"text/javascript\">alert('Entered email and phone number are not valid');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script1);
        }
        else
        {
            createuser();

        }

    }


    public void createuser()
    {

        if (Page.IsValid)
        {

            List<User> allUsersList = Application["AllUsersList"] as List<User>;
            if (allUsersList == null)
            {
                allUsersList = new List<User>();

            }
            User newUser = new User();
            newUser.FullName = this.FullNameField.Text;
            newUser.Company = this.CompanyField.Text;
            newUser.MailAddress = this.MailField.Text;
            newUser.PhoneNumber = this.PhoneField.Text;
            newUser.EmailAddress = this.EmailField.Text;
            newUser.AccessCode = Convert.ToInt32(this.CodeField.Text);


            int counter = 0;
            cnn.Open();
            var query = "select * from LanjileP_WADsp16_Users where email_address = @email ";
            SqlCommand que = new SqlCommand(query, cnn);
            que.Parameters.AddWithValue("@email", EmailField.Text);
            SqlDataReader data = que.ExecuteReader();

            while (data.Read())
            {
                counter++;
            }
            cnn.Close();

            if (counter > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Your email address is already registered.');", true);
            }
            else
            {
                allUsersList.Add(newUser);
                Application["AllUsersList"] = allUsersList;
                cnn.Open();

                query = "insert into LanjileP_WADsp16_Users VALUES (@access_code, @full_name, @company, @mailing_address, @phone_number, @email_address)";

                que = new SqlCommand(query, cnn);
                que.Parameters.AddWithValue("@access_code", Convert.ToInt32(CodeField.Text));
                que.Parameters.AddWithValue("@full_name", FullNameField.Text);
                que.Parameters.AddWithValue("@company", CompanyField.Text);
                que.Parameters.AddWithValue("@mailing_address", MailField.Text);
                que.Parameters.AddWithValue("@phone_number", PhoneField.Text);
                que.Parameters.AddWithValue("@email_address", EmailField.Text);

                que.ExecuteNonQuery();
                cnn.Close();

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Thank you for registering. You can now log in.');", true);

                Application["AllUsersList"] = allUsersList;
                Session["currentuser"] = newUser;
                Session["currentuserEmail"] = newUser.EmailAddress;
                Session["currentAccess"] = newUser.AccessCode;
                Session["FullName"] = this.FullNameField.Text;

                // Send account creation mail
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
                objeto_mail.To.Add(new MailAddress(EmailField.Text));
                objeto_mail.Subject = "Delivery Service Registration Confirmation";
                string body = "<h3>" + "Valued Customer," + "</h3>" + "<br>";
                body += "Thank you for registering with Delivery Service. You can start using your account to request us to deliver your goods." + "<br><br>";
                body += "Looking forward to business with you." + "<br><br>";
                body += "Thank you again for keeping trust on us." + "<br><br>";
                body += "<h4>" + "Sincerely" + "</h4>" + "<br>";
                body += "<h4>" + "Delivery Service - Security Team" + "</h4>";
                objeto_mail.Body = body;
                try
                {
                    client.Send(objeto_mail);
                    string script = "<script type=\"text/javascript\">alert('Thank you for registering.');</script>";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
                }
                catch (Exception)
                {
                    
                }

                Response.Redirect("deliverydetails.aspx");
            }

        }
        else
        {

            string script = "<script type=\"text/javascript\">alert('Entered data is not valid.');</script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }

    }

    int isValidMail(String s)
    {
        Regex Reg = new Regex(regEmail);
        if (Reg.IsMatch(s))
            return 1;
        else
            return 0;
    }
    int isValidPhone()
    {
        Regex Reg = new Regex(regPhone);
        if (Reg.IsMatch(PhoneField.Text))
            return 1;
        else
            return 0;


    }

    // No thanks action 
    protected void backToLoginPage(object sender, EventArgs e)
    {

        Response.Redirect("login.aspx");
    }

}