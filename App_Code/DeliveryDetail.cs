using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeliveryDetail
/// </summary>
public class DeliveryDetail
{
    String pickupAddress; //with the fields in the
    String recepientAddress; //’New Delivery Details’ page.
    String recepientPhone;
    String description;
    String emailID;
    DateTime dateTime;

    public DeliveryDetail()
    { // TODO: Add constructor logic here 

    }
    public String PickupAddress
    {
        get { return pickupAddress; }
        set { pickupAddress = value; }
    }
    public String RecepientAddress
    {
        get { return recepientAddress; }
        set { recepientAddress = value; }
    }
    public String RecepientPhone
    {
        get { return recepientPhone; }
        set { recepientPhone = value; }
    }
    public String Description
    {
        get { return description; }
        set { description = value; }
    }

    public String EmailID
    {
        get { return emailID; }
        set { emailID = value; }
    }

    public DateTime Datetime
    {
        get { return dateTime; }
        set { dateTime = value; }
    }
    //Add the other properties like the above ‘PickupAddress’ example
}