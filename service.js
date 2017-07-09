var xmlhttp;
var xmlDoc;

// Display Left hand side Numbers and service area page values from XML file
function loadXMLDoc() {
    xmlhttp = new XMLHttpRequest("Microsoft.XMLDOM");
    xmlhttp.onreadystatechange = readData;
    xmlhttp.open("GET", "contactinfor.xml", true);
    xmlhttp.send();
}

function readData() {
    var city_numbers = [];
    if (xmlhttp.readyState == 4) {
        xmlDoc = xmlhttp.responseXML;
        var items = xmlDoc.getElementsByTagName("info")[0];

        var toll_free_number = items.getAttribute("toll-free-phone"); //To fill left side toll free number Data
        var contact_email = items.getAttribute("contact-email"); //To fill left side email Data
        var houston_number = items.getAttribute("houston-phone"); //To fill left side houston number Data
        document.getElementById("tollPhoneNumber").innerHTML = toll_free_number;
        document.getElementById("houstonPhoneNumber").innerHTML = houston_number;
        document.getElementById("contactEmail").innerHTML = contact_email;

        var xmlTagNames = { 'one': 'houston', 'two': 'austin', 'three': 'dallas', 'four': 'elpaso', 'five': 'sanantonio', 'six': 'riogrande', 'seven': 'corpus', 'eight': 'easttx', 'nine': 'westtx' }; // //To fetch values according to tag name
        var emp;

        for (tagName in xmlTagNames) {
            var obj = {};
            obj[items.getAttribute("city-" + tagName)] = items.getAttribute(xmlTagNames[tagName] + "-phone");
            city_numbers.push(obj);
        }
        var val;
        var list = "";
        // Append list of cities and their numbers
        city_numbers.forEach(function (i) {
            for (val in i) {
                list += "<li style='float: left; width: 235px; padding: 5px;'><div>" + val + "</div><div style='text-decoration: underline;'>" + i[val] + "</div></li>";
            }
        })
        if (document.getElementById("cityNumbers")) {
            document.getElementById("cityNumbers").innerHTML = list;
        }
    }

}

// Account Page Operations START

// New Account
function check(radioButtonValue) {
    // If "I do not have existing account" button is selected
    if (radioButtonValue == "not_exist") {
        var loginPage = document.getElementById("FirstActPage");          
        var newAccountPage = document.getElementById("NoAccount");
        loginPage.style.display = 'none';                           // Hide login page
        newAccountPage.style.display = 'block';                     // Display new account form page
        return false;
    }
    return;
}

//Log In operation
function logIn() {
    var loginRadioButtons = document.getElementById("LoginRadioButtons");
    var loginPage = document.getElementById("FirstActPage");
    var deliveryRequestPage = document.getElementById("WelcomePage");
    var newAccountPage = document.getElementById("NoAccount");
    loginRadioButtons.style.display = 'none';                       // Hide login page radio buttons
    loginPage.style.display = 'none';                               // Hide login page
    deliveryRequestPage.style.display = 'block';                    // Show delivery request page
    newAccountPage.style.display = 'none';                          // Hide new account page
   
}

// Account tab, I have an existing account, Log Out, No Thanks and Forgot password page operation
function backToLoginPage() {
    var loginPage = document.getElementById("FirstActPage");
    var newAccountPage = document.getElementById("NoAccount");
    document.getElementById("AccountList_0").checked = true;        // Set the first radio button true on login page

    
}


// Submit Request Button action - Account Tab
function submitRequest() {
    alert("Thank you for submitting a delivery request. We are more than happy to serve you. An invoice email has been sent to the email address in our file.");
}


// Account Page Operations ENDS