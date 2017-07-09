<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deliverydetails.aspx.cs" Inherits="deliverydetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Texas Delivery Services</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body onload="loadXMLDoc('load');">
        <div class="mainDiv">
        <!-- Banner Start -->
        <div class="banner">
            <!-- Banner Image Start -->
            <div class="banner_img" ></div>
            <!-- Banner Image End -->
            <!-- Banner Text Message Start -->
            <div class="putLeft bannerText">
                <div class="bannerUpperText"><i><b style="font-size: 75px;">Texas</b></i> Delivery Service</div>
                <div>
                    <div class="putLeft bottomImg" ></div>
                    <div class="bannerDownText putRight"><i><span style="color: #ffffff;">d</span>elivery <span style="color: #ffffff;">p</span>rofessionals</i></div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear"></div>
            <!-- Banner Text Message End-->
        </div>
        <!-- Banner End -->

        <!-- Menu Start -->
         <ul class="menuBar">
            <li><a href="Default.aspx">Home</a></li>
            <li><a href="about_us.aspx" target="_blank">About Us</a></li>
            <li><a href="home.aspx">Services</a></li>
            <li><a href="login.aspx" >Accounts</a></li>
            <li><a href="contact_us.aspx">Contact Us</a></li>
            <li><a href="resource.aspx">Resources</a></li>
            <li><a href="service_area.aspx" style="padding-right: 67px;">Service Areas</a></li>
          </ul>
        <!-- Menu End -->
        <!-- Main Body Start-->
        <div>
            <!-- Left Body Part Start-->
            <div class="putLeft leftBody outerBorder">
                <!-- Contact us Start-->
                <div class="contactUs innerBorder">
                    <h3 class="text_blue">Contact Us</h3><br>
                    <p>Texans Serving Texans <br> 24 Hours a Day!</p><br>
                    <p><span class="text_blue">Toll Free</span> <br> <span id="tollPhoneNumber" class="underline_phone"></span> <br> <span class="text_blue">Houston</span> <br> <span id="houstonPhoneNumber" class="underline_phone"></span></p><br>
                    <p><span class="text_blue">e-mail</span> <br> <span id="contactEmail"></span></p>
                </div>
                <!-- Contact us End-->
                <!-- Payment cards Start-->
                <div class="paymentCard innerBorder">
                    <h1 class="small">We accept</h1>
                    <div class="putLeft visaCard"></div>
                    <div class="putLeft masterCard"></div>
                    <div class="putLeft discoverCard"></div>
                    <div class="putLeft expressCard"></div>
                    <div class="clear"></div>
                </div>
                <!-- Payment cards Start-->
            </div>
            <!-- Left Body Part End-->
            <!-- Right Body Part Start-->
            <div class="putLeft rightBody outerBorder">
                <div id="account" class="serviceContent innerBorder">
    <form id="form1" runat="server">
    <!-- After Login Page -->
                        <div id="WelcomePage">
                            <p id="WelcomeText" runat="server" ></p>

                            <!-- Log Out Link -->
                            <asp:LinkButton id="LogOut" xmlns:asp="#unknown" class="putRight" Text="Log Out" CausesValidation="false" OnClick="Log_Out" runat="server"/>

                            <!-- Radio buttons for delivery and account details -->
                            <asp:RadioButtonList id="deliveryActList" class="blue_text" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem value="request" text="New Delivery Request" selected="True"/>
                                <asp:ListItem value="details" text="View My Account Details" />
                            </asp:RadioButtonList>

                            <!-- New Delivery Details -->
                            <div class="existingAct deliveryDetails">
                                <div class="innerFormBox">
                                    <span class="textOverBorder blue_text">New Delivery Details </span>
                                    <h4> Please enter delivery details below </h4>
                                    <!-- Delivery details request form-->
                                    <div class="blue_text">
                                       <p class="inbetweenGap">
                                           <asp:Label ID="Label1" CssClass="required" runat="server" Text="Pickup Address" width="200" /> 
                                           <asp:TextBox id="pickupAddress" width="300"  Height="20" runat="server" />
                                           <!-- Pickup address required validations -->
                                            <asp:RequiredFieldValidator ID="ReqPickAdd" CssClass="errorMsg" ControlToValidate = "pickupAddress" Display ="Dynamic" runat="server" ErrorMessage="Please enter pickup address" />
                                       </p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="Label2" CssClass="required" runat="server" Text="Recipient Address" width="200" /> 
                                           <asp:TextBox id="recipientAddress" width="300"  Height="20" runat="server" />
                                           <!-- Recepient address required validations -->
                                            <asp:RequiredFieldValidator ID="ReqRecAdd" CssClass="errorMsg" ControlToValidate = "recipientAddress" Display ="Dynamic" runat="server" ErrorMessage="Please enter recepient address" />
                                       </p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="Label3" CssClass="required" runat="server" Text="Recipient Phone" width="200" />
                                           <asp:TextBox id="recipientPhone" width="200"  Height="20" runat="server" />
                                           <!-- Phone required and expression validations -->
                                           <asp:RequiredFieldValidator ID="ReqRecPhone" CssClass="errorMsg" ControlToValidate = "recipientPhone" Display ="Dynamic" runat="server" ErrorMessage="Please enter recepient Phone" />
                                           <asp:RegularExpressionValidator id="RegRecPhone" CssClass="errorMsg" ControlToValidate="recipientPhone" Text="Invalid Phone Number" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}$" runat="server" />
                                       </p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="Label4" CssClass="required" runat="server" Text="Provide a Description(List Items to Delivery)" width="200" />
                                           <asp:TextBox id="deliveryDescription"  width="300" Height="60" TextMode="multiline" runat="server" />
                                           <!-- delivery description required validations -->
                                           <asp:RequiredFieldValidator ID="ReqDel" CssClass="errorMsg" ControlToValidate = "deliveryDescription" Display ="Dynamic" runat="server" ErrorMessage="Please enter delivery description" />
                                       </p>
                                    </div>
                                    <div class="submitRequest"><asp:Button ID="Button1" width="100" Height="25" Text="Submit Request" runat="server" OnClick="SubmitRequest" /></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        <div class="clear"></div>
        </div>
      <!-- Main Body End-->
    </div>

    <script type="text/javascript" src="service.js"> 
    </script>
</body>
</html>
