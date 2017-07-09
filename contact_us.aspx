<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Texas Delivery Services</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body onload="loadXMLDoc();">
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
                <form id="ContactForm" runat="server">
                    <!-- Contact us Page Start -->
                    <div id="ContactUs" class="contact_us">
                        <div class="upperText innerBorder">
                            <h1 class="green_text">Please Email Us All Your Concerns</h1><br>
                            <div class="ctcForm">
                                <p class="inbetweenGap">
                                    <asp:Label ID="ContactEmailIDLabel" CssClass="required" runat="server" Text="Enter Your Email Address:" />
                                    <asp:TextBox ID="ContactEmailID" Width="530" Height="20" runat="server" />
                                    <!-- Email address required and expression validations -->
                                    <!-- EnableClientScript must be set to false needed to avoid validation form submission error -->
                                    <asp:RequiredFieldValidator ID="ReqContactEmail" CssClass="errorMsg" EnableClientScript="false" ControlToValidate = "ContactEmailID" Display ="Dynamic" runat="server" ErrorMessage="Please enter email" />
                                    <asp:RegularExpressionValidator id="RegContactEmail" CssClass="errorMsg" EnableClientScript="false" ControlToValidate="ContactEmailID" Text="Invalid email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" runat="server" />
                                </p>
                                <p class="inbetweenGap">
                                    <asp:TextBox id="ContactDescription" Placeholder="Type your message here.." rows="4" columns="102" TextMode="multiline" runat="server" />
                                </p>
                            </div>
                            <div class="submitRequest"><asp:Button ID="ContactMsgBtn" width="115" Height="25" Text="Submit Message" OnClick="Contact_Email" runat="server" /></div>
                        </div>
                        <div class="innerBorder">
                            <div class="tele_service"></div>
                            <div class="food_service"></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!-- Contact us Page End -->
                </form>
            </div>
            <!-- Right Body Part End-->
            <div class="clear"></div>
        </div>
        <!-- Main Body End-->
    </div>

    <script type="text/javascript" src="service.js"> 
    </script>
</body>
</html