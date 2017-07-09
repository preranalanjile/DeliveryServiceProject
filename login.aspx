<%@ Import Namespace="System" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
                    <!-- First Account Page -->
                        <div id="AccountForm">
                            <!-- Radio buttons for accounts -->
                            <div id="LoginRadioButtons" runat="server">
                                <asp:RadioButton ID="radio_one" CssClass="radio_btn blue_text" runat="server" GroupName="single" Text="I have an existing account" Checked="true" AutoPostBack="true" ></asp:RadioButton>
                                <asp:RadioButton ID="radio_two" CssClass="radio_btn blue_text" runat="server" GroupName="single" Text="I do not have an existing account" OnCheckedChanged="radio_forms" AutoPostBack="true"></asp:RadioButton>
                            </div>

                            <!-- Login Page -->
                            <div id="FirstActPage" class="existingAct" runat="server">
                                <div class="innerFormBox">
                                    <span class="textOverBorder blue_text" runat="server" >Existing Account </span>
                                    <!-- Login details -->
                                    <div class="blue_text">
                                      
                                       <asp:Label ID="EmailId" CssClass="required" runat="server" Text="Email Address:" />
                                        <asp:TextBox ID="Email" Height="20" runat="server" />
                                        <!-- Email address required and expression validations -->
                                        <asp:RequiredFieldValidator ID="ReqLoginEmail" CssClass="errorMsg" EnableClientScript="false" ControlToValidate = "Email" Display ="Dynamic" runat="server" ErrorMessage="Please enter email" />
                                        <asp:RegularExpressionValidator id="RegLoginEmail" CssClass="errorMsg" EnableClientScript="false" ControlToValidate="Email" Text="Invalid email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" runat="server" />
                                      
                                       <asp:Label ID="AccessCode" CssClass="required" runat="server" Text="Access Code:" />
                                        <asp:TextBox ID="Pswd" Height="20" TextMode="password" runat="server" />
                                        <!-- Access Code required and expression validations -->
                                        <asp:RequiredFieldValidator ID="ReqLoginAccess" CssClass="errorMsg" EnableClientScript="false" ControlToValidate = "Pswd" Display ="Dynamic" runat="server" ErrorMessage="Please enter access code"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator id="RegLoginAccess" CssClass="errorMsg" EnableClientScript="false" ControlToValidate="Pswd" Text="Invalid access code" ValidationExpression="^[0-9]{6}$" runat="server" />
                                    </div>
                                    <p>
                                    <!-- Forgot Password Link -->
                                    <asp:HyperLink ID="ForgotPswd" NavigateUrl="forgotpswd.aspx" Text="Forgot My Access Code" runat="server"/> 
                                    <!-- Log In Button -->
                                    <asp:Button id="LogInBtn" width="100" Height="25" Text="Log In" runat="server" OnClick="LogIn" /></p>
                                </div>
                            </div>
                            
                            <!-- New Account Form -->
                            <div id="NoAccount" runat="server" class="existingAct newAccount" >
                                <div class="innerFormBox">
                                    <span class="textOverBorder blue_text">Create New Account </span>
                                    <h4> Apply online to open a new account with us. </h4>
                                    <p class="blue_text">To complete an online application, please fill out the following information and then hit the 'Create Account' button.</p>

                                    <!-- Delivery details request form-->
                                    <div class="blue_text">
                                       <p class="inbetweenGap">
                                           <asp:Label ID="FullName" CssClass="required" runat="server" Text="Full Name" width="200" /> 
                                           <asp:TextBox ID="FullNameField" width="300" Height="20" runat="server" />
                                           <!-- Name required and expression validations -->
                                            <asp:RequiredFieldValidator ID="ReqName" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate = "FullNameField" Display ="Dynamic" runat="server" ErrorMessage="Please enter Full Name" />
                                            <asp:RegularExpressionValidator id="RegName" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate="FullNameField" Text="Invalid Name" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" runat="server" />
                                       </p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="CompanyName" runat="server" Text="Company" width="200" />
                                           <asp:TextBox id="CompanyField" width="300" Height="20" runat="server" /></p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="Mail" CssClass="required" runat="server" Text="Mailing Address" width="200" /> 
                                           <asp:TextBox ID="MailField" width="300" Height="20" runat="server" />
                                           <!-- Address required validations -->
                                            <asp:RequiredFieldValidator ID="ReqAddress" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate = "MailField" Display ="Dynamic" runat="server" ErrorMessage="Please enter Mail Address" />
                                       </p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="Phone" CssClass="required" runat="server" Text="Phone Number" width="200" /> 
                                           <asp:TextBox ID="PhoneField"  width="200" Height="20" runat="server" />
                                           <!-- Phone required and expression validations -->
                                            <asp:RequiredFieldValidator ID="ReqPhone" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate = "PhoneField" Display ="Dynamic" runat="server" ErrorMessage="Please enter Phone number" />
                                            <asp:RegularExpressionValidator id="RegPhone" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate="PhoneField" Text="Invalid Phone Number" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}$" runat="server" />
                                       </p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="EmailAds" CssClass="required" runat="server" Text="Email Address" width="200" />
                                           <asp:TextBox ID="EmailField"  width="200" Height="20" runat="server" />
                                           <!-- Email address required and expression validations -->
                                            <asp:RequiredFieldValidator ID="ReqEmailAdd" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate = "EmailField" Display ="Dynamic" runat="server" ErrorMessage="Please enter email" />
                                            <asp:RegularExpressionValidator id="RegEmailAdd" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate="EmailField" Text="Invalid email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" runat="server" />
                                       </p>
                                       
                                        <!-- Generate Access Code  -->
                                       <p class="inbetweenGap">
                                           <asp:Label ID="Code" runat="server" Text="Access Code" width="200" />
                                           <asp:TextBox ID="RandomNumber" Width="50" Height="20" readonly="true" runat="server" />
                                       </p>
                                       <p class="inbetweenGap">
                                           <asp:Label ID="EnterCode" CssClass="required" runat="server" Text="Enter Access Code" width="200" />
                                           <asp:TextBox ID="CodeField"  width="100" Height="20" runat="server" />
                                           <!-- Access Code required and compare validations -->
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="errorMsg"  EnableClientScript="false" ControlToValidate = "EmailField" Display ="Dynamic" runat="server" ErrorMessage="Please enter above code" />
                                            <asp:CompareValidator ID="CmpCode" CssClass="errorMsg" ControlToValidate="CodeField"  EnableClientScript="false" ControlToCompare="RandomNumber" operator="Equal" type="Integer" errormessage="Incorrect Code." runat="server" /><br />
                                       </p>
                                    </div>

                                    <!-- Create Account and No Thanks Buttons -->
                                    <div class="createButton">
                                        <asp:Button runat="server" ID="CreateUser" width="150" Height="25" Text ="Create Account" OnClick="validate_new_account" />
                                        <asp:Button id="NoThanksButton" width="100" Height="25" Text="No Thanks" runat="server" CausesValidation="false" OnClick="backToLoginPage"/>
                                    </div>
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
