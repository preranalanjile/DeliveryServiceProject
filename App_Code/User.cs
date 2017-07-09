using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    String fullName;
    String company;
    String mailingAddress;
    String phoneNumber;
    String emailAddress;
    int accessCode;
    DeliveryDetail[] deliveryDetailsList;   //This Array is used to store the Deliveries
                                            //this user requested. It is an array of
                                            //DeliveryDetail objects.
    public User()
    { // TODO: Add constructor logic here 
        
    }
    public String FullName //This is a property to the name field.
    {
        get { return fullName; }
        set { fullName = value; }
    }
    public String Company //This is a property to the name field.
    {
        get { return company; }
        set { company = value; }
    }
    public String MailAddress //This is a property to the name field.
    {
        get { return mailingAddress; }
        set { mailingAddress = value; }
    }
    public String PhoneNumber //This is a property to the name field.
    {
        get { return phoneNumber; }
        set { phoneNumber = value; }
    }
    public String EmailAddress //This is a property to the name field.
    {
        get { return emailAddress; }
        set { emailAddress = value; }
    }
    public int AccessCode //This is a property to the name field.
    {
        get { return accessCode; }
        set { accessCode = value; }
    }
    //Add the other properties like the above ‘FullName’ example

    public DeliveryDetail[] DeliveryDetails
    {
        get { return deliveryDetailsList; }
        set { deliveryDetailsList = value; }
    }
}