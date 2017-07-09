<%@ Import Namespace="System" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
            <li><a href="#">Contact Us</a></li>
            <li><a href="#resource" onclick="return showMenuContent('resource');">Resources</a></li>
            <li><a href="#serviceArea" onclick="return showMenuContent('serviceArea');" style="padding-right: 67px;">Service Areas</a></li>
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
                <!-- Home Page Start -->
                <div id="home" class="homeContent">
                    <div class="upperText innerBorder">
                        <h1 class="green_text">The Service You Can Trust</h1><br>
                        <p class="serviceText">
                            Enjoy a 1-to-1 relationship with your very own TEXAS Delivery Service, who delivers for you each time and learns your preferences
                            <br /><br />
                            Get your favourite products from store of your prference and get delivered right to your door
                            <br /><br />
                            We offer a range of other services including Medical deliveries Legal courier deliveries etc
                            <br /><br />
                            It's all backed by our 100% Stress-Free Guarantee
                        </p>
                    </div>
                    <div class="innerBorder">
                        <div class="tele_service"></div>
                        <div class="food_service"></div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!-- Home Page End -->
                <!-- Service Page Start -->
                
                <!-- Service Page End -->

                <!-- Account Page Starts -->
                
                <!-- Accounts Page Ends -->


                <!-- Resources Page Start -->

                <!-- Resources Page End -->

                <!-- Service Area Page Start -->
                
                <!-- Service Area Page End -->
            </div>
            <!-- Right Body Part End-->
            <div class="clear"></div>
            <form id="ads" runat="server">
                <div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:Timer ID="Timer1" Interval="1000" runat="server" />
                    <asp:UpdatePanel ID="up1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:AdRotator id="AdRotator1" runat="server" Target="_blank" AdvertisementFile="~/App_Data/AdRotator.xml"/>
                            <asp:AdRotator ID="AdRotator2" runat="server" Target="_blank" AdvertisementFile="~/App_Data/AdRotator.xml" />
                            <asp:AdRotator ID="AdRotator3" runat="server" Target="_blank" AdvertisementFile="~/App_Data/AdRotator.xml" />
                            <asp:AdRotator ID="AdRotator4" runat="server" Target="_blank" AdvertisementFile="~/App_Data/AdRotator.xml" />
                            <asp:AdRotator ID="AdRotator5" runat="server" Target="_blank" AdvertisementFile="~/App_Data/AdRotator.xml" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </form>
        </div>
        <!-- Main Body End-->
    </div>

    <script type="text/javascript" src="service.js"> 
    </script>
</body>
</html>
