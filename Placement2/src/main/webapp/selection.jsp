<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carty Meats Web Service</title>
    
    <!-- Bootstrap CSS -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/includes/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="assets/includes/css/signin.css" rel="stylesheet">
    <link href="assets/includes/css/sticky-footer.css" rel="stylesheet">
    <link href="assets/includes/css/styles.css" rel="stylesheet">
    
    <style>
        /* Add custom styles here */
        /* Adjustments to fit within viewport */
        .vertical-buttons {
            margin-bottom: 20px;
        }
        
        .horizontal-buttons .dropdown {
            margin-right: 10px;
        }
        
        .navbar {
        background-color: #602033;
    	}
    	
    	.navbar-nav > li > a {
        color: white;
    	}
        
        .footer {
            position: fixed;
            bottom: 0;
            height:75px;
            width: 100%;
            background-color: #602033;
            text-align: center;
            padding: 8px 0;
        }
        .container {
  			text-align: left;
		}

		.container .mt-4 {
  		margin-left: auto;
  		margin-right: auto;
		}
		
		body {
        background-image: url('assets/images/ezgif.png');
        background-size: cover; /* Cover the entire background */
        background-repeat: no-repeat; /* Prevent repeating of the image */
    	}
        
    </style>
</head>
<body style="background-color: #e4bf80">

<div id="main">
    <div class="navbar navbar-fixed-top">
        <div class="container" style="padding: 0;">                    
            <button class="navbar-toggle" data-target=".navbar-responsive-collapse" data-toggle="collapse" type="button">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>	
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img src="assets/images/CartyMeats.png" width="35" height="30" alt="Your Logo"></a>

            <div class="nav-collapse collapse navbar-responsive-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="index.jsp">Login</a>
                                </li>                                   
                                <li class="divider"></li>

                                <li class="dropdown-header">More Services</li>
                                <li>
                                    <a href="views/about.jsp">About Us</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/olivercartyandfamily/">Social Media</a>
                                </li>
                            </ul>
                    </li>
                </ul>

                <form class="navbar-form pull-left"  >
                    <input type="text" class="form-control" placeholder="Search product..." id="searchInput">
                    <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                </form><!-- end navbar-form -->
                
                <ul class="nav navbar-nav pull-right">
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span>My Account</a>
                    </li>
                </ul><!-- end nav pull-right -->

            </div><!-- end nav-collapse -->
        </div><!-- end container -->
        
    </div><!-- end navbar-->

    <div class="row" id="featuresHeading">
        <div class="col-12">
            
        </div>
        
    </div>

<!-- Start of Selection Page Heading -->
    <div class="container">
       <h1 class="mt-4">Selection Page</h1>
<!-- End of Selection Page Heading -->
       
       
<!-- Start of Drop Down Menu Design -->
<h2>Town:</h2>
<select id="townDropdown" onchange="handleTownSelection()">
  <option value="town0">Select town</option>
  <option value="town1">Athlone</option>
  <option value="town2">Tullamore</option>
  <option value="town3">Portlaoise</option>
  <option value="town4">Longford</option>
  <option value="town5">Ballinasloe</option>
  <option value="town6">Clara</option>
  <option value="town7">Newbridge</option>
  <option value="town8">Maynooth</option>
</select>

<h2>Store:</h2>
<select id="storeDropdown" onchange="handleSelection('store')">
  <option value="store0">Select Store</option>
  <option value="store1">Dunnes Stores</option>
  <option value="store2">SuperValu</option>
  <option value="store3">Tesco</option>
  <option value="store4">Spar</option>
</select>

<h2>Rank:</h2>
<select id="rankDropdown">
  <option value="rank0">Select Rank</option>
  <option value="rank1">A</option>
  <option value="rank2">B</option>
  <option value="rank3">C</option>
  <option value="rank4">D</option>
</select>

<h2>Product:</h2>
<select id="productDropdown">
  <option value="product0">Select Product</option>
  <option value="product1">Bacon</option>
  <option value="product2">Rashers</option>
  <option value="product3">Pork</option>
</select>



<!-- Start of Drop Down Menu Design -->
<h2>Facings:</h2>
<div class="row">
    <div class="col">
        <input type="text" id="additionalInfoInput" onchange="handleInput()">
    </div>
</div>
<div class="row mt-3">
    <div class="col">
        <!-- Save button -->
		   <button class="btn btn-lg btn-primary btn-block" type="submit" />Save</button>
    </div>
</div>
<!-- End of Drop Down Menu Design -->



<!-- Start of Drop Down Menu Functionality -->
<script>
function handleTownSelection() {
  var townDropdown = document.getElementById("townDropdown");
  var storeDropdown = document.getElementById("storeDropdown");
  var selectedTown = townDropdown.value;
  
  // Clear existing options
  storeDropdown.innerHTML = "";
  
  // Add options based on selected town
  if (selectedTown === "town1") {
    addOption(storeDropdown, "store1", "Dunnes Stores");
    addOption(storeDropdown, "store2", "SuperValu");
    addOption(storeDropdown, "store4", "Spar");
    
  }else if(selectedTown == "town2"){
	  addOption(storeDropdown, "store1", "Dunnes Stores");
	  addOption(storeDropdown, "store3", "Tesco");
	  addOption(storeDropdown, "store4", "Spar");

  }else if(selectedTown == "town3"){
	  addOption(storeDropdown, "store1", "Dunnes Stores");
	  addOption(storeDropdown, "store2", "SuperValu");
	  addOption(storeDropdown, "store3", "Tesco");
	  addOption(storeDropdown, "store4", "Spar");

  }else if(selectedTown == "town4"){
	  addOption(storeDropdown, "store1", "Dunnes Stores");
	  addOption(storeDropdown, "store2", "SuperValu");
	  addOption(storeDropdown, "store3", "Tesco");
	  addOption(storeDropdown, "store4", "Spar");

  }else if(selectedTown == "town5"){
	  addOption(storeDropdown, "store2", "SuperValu");
	  addOption(storeDropdown, "store3", "Tesco");
	  addOption(storeDropdown, "store4", "Spar");

  }else if(selectedTown == "town6"){
	  addOption(storeDropdown, "store3", "Tesco");

  }else if(selectedTown == "town7"){
	  addOption(storeDropdown, "store1", "Dunnes Stores");
	  addOption(storeDropdown, "store2", "SuperValu");
	  addOption(storeDropdown, "store3", "Tesco");
	  addOption(storeDropdown, "store4", "Spar");

  }else if(selectedTown == "town8"){
	  addOption(storeDropdown, "store1", "Dunnes Stores");
	  addOption(storeDropdown, "store2", "SuperValu");
	  addOption(storeDropdown, "store3", "Tesco");
	  addOption(storeDropdown, "store4", "Spar");
	  
	  
	}else {
    // Default options for other towns
    addOption(storeDropdown, "store1", "Dunnes Stores");
    addOption(storeDropdown, "store2", "SuperValu");
    addOption(storeDropdown, "store3", "Tesco");
    addOption(storeDropdown, "store4", "Spar");
  }
}

function addOption(selectElement, value, text) {
  var option = document.createElement("option");
  option.value = value;
  option.text = text;
  selectElement.add(option);
}
</script>
<!-- End of Drop Down Menu Functionality -->
   </div>

<!-- Start of Footer Design -->
<footer class="footer">
        <div class="row">
            <img src="assets/images/TUS.png" width="43" height="44" alt="Made by TUS" title="Made by TUS">
            <p>&copy; 2024 TUS</p>
    	</div>
</footer>
<!-- End of Footer Design -->


<!-- All Javascript at the bottom of the page for faster page loading -->

<!-- First try for the online version of jQuery-->
<script src="https://code.jquery.com/jquery.js"></script>

<!-- If no online access, fallback to our hardcoded version of jQuery -->
<script>window.jQuery || document.write('<script src="assets/includes/js/jquery-1.8.2.min.js"><\/script>')</script>

<!-- Bootstrap JS -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="assets/includes/js/script.js"></script>

	</body>
</html>
