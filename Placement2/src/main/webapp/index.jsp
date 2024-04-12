<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <!-- Website Title & Description for Search Engine purposes -->
    <title>Carty Meats Web Service</title>
    <meta name="description" content="Edit or delete employees after login">
    
    <!-- Mobile viewport optimized -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    <!-- Bootstrap CSS -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/includes/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="assets/includes/css/signin.css" rel="stylesheet">
    <link href="assets/includes/css/sticky-footer.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="assets/includes/css/styles.css" rel="stylesheet">
    
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
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
        
        .navbar {
            background-color: #602033;
        }
        
        .navbar-nav > li > a {
            color: white;
        }
        
        body {
            background-image: url('assets/images/ezgif.png');
            background-size: cover; /* Cover the entire background */
            background-repeat: no-repeat; /* Prevent repeating of the image */
            background-attachment: fixed; /* Ensure the background image stays fixed */
            overflow: hidden; /* Disable scrolling */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #e4bf80;
        }

        /* Centering text and button */
        .center-content {
            text-align: center;
        }

        /* Changing button color */
        .custom-btn {
            background-color: #602033 !important;
            color: white !important;
        }

        /* Centering the navbar brand */
		.navbar-brand {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-left: 240px; /* Adjust margin-left as needed */
		    margin-right: 0; /* Reset right margin */
		}
		
		.custom-width {
        width: 900px; /* Set a fixed width */
    }
    
    .btn-lg {
    padding: 10px 30px; /* Adjust padding as needed */
}

	/* Adjust container width */
	.container {
	    width: 80%; /* Set width to 100% */
	    max-width:680px; /* Set maximum width */
	}
	    


    </style>
</head>
<body>

<div class="container" id="main">

    <div class="navbar navbar-fixed-top">
        <div class="container" style="padding: 0;">
            
            <button class="navbar-toggle" data-target=".navbar-responsive-collapse" data-toggle="collapse" type="button">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="/"><img src="assets/images/taste-the-carty-cure-light.png" width="300" height="90" alt="Your Logo"></a>

            <div class="nav-collapse collapse navbar-responsive-collapse">
                <ul class="nav navbar-nav">
                    <!-- Home button removed -->
                </ul>
            </div><!-- end nav-collapse -->
        </div><!-- end container -->
    </div><!-- end navbar-->

    <div class="row justify-content-center mt-4">
        <div class="col-md-6">
            <!-- Modified button layout -->
            <div class="center-content">
                <input type="submit" class="btn btn-lg btn-primary custom-btn btn-block mb-3" name="uploadsubmit" id="btnupload" value="Administrator"  onclick="javascript:location.href='login'"/>
          		<input type="submit" class="btn btn-lg btn-primary custom-btn btn-block" name="uploadsubmit" id="btnupload" value="Respresentative"  onclick="javascript:location.href='register'"/>
            </div>
        </div>
    </div>      

</div><!-- end container -->




<footer class="footer">
    <div class="container">
        <div class="row">
            <img src="assets/images/TUS-Logo_Primary_RGB.png"png" width="80" height="34" alt="Made by TUS" title="Made by TUS">
            <p>&copy; 2024 TUS - - A-Mazing Team.</p>
        </div>
    </div>
</footer>

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
