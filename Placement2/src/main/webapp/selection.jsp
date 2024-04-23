<%@ page import="java.sql.*" %>
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
         /* Centering the login form */
         .login-form {
         margin-top: 50px; /* Adjust margin-top as needed */
         text-align: center;
         }
         .custom-btn {
         background-color: #602033 !important;
         color: white !important;
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
               </div>
               <!-- end nav-collapse -->
            </div>
            <!-- end container -->
         </div>
         <!-- end navbar-->
         <div class="container">
            <!-- End of Selection Page Heading -->
            <form action="saveSelection" method="post">
               <!-- Town Dropdown -->
               <h2>Town:</h2>
               <select id="townDropdown" name="town">
                  <option value="Select town">Select town</option>
                  <% 
                     // Establish database connection
                     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/employees", "root", "");
                     Statement stmt = conn.createStatement();
                     
                     // Retrieve towns from database
                     ResultSet townsResult = stmt.executeQuery("SELECT DISTINCT town FROM stores");
                     while (townsResult.next()) {
                         String town = townsResult.getString("town");
                     %>
                  <option value="<%= town %>"><%= town %></option>
                  <% 
                     }
                     townsResult.close();
                     stmt.close();
                     conn.close();
                     %>
               </select>
               <!-- Store Dropdown - Initially empty -->
               <h2>Store:</h2>
               <select id="storeDropdown" name="store">
                  <option value="Select Store">Select Store</option>
               </select>
               <!-- Rank Dropdown - Initially empty -->
               <h2>Rank:</h2>
               <select id="rankDropdown" name="rank">
                  <option value="Select Rank">Select Rank</option>
               </select>
               <!-- Product Dropdown - Initially empty -->
               <h2>Product:</h2>
               <select id="productDropdown" name="product">
                  <option value="Select Product">Select Product</option>
               </select>
               <!-- Facings Input Box -->
               <h2>Facings:</h2>
               <input type="text" id="facingsInput" name="facings" placeholder="Enter facings..." required>
               <div class="row mt-3">
                  <div class="col">
                     <!-- Save button -->
                     <button class="btn btn-lg btn-primary btn-block custom-btn" type="submit">Save</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
      <!-- end container -->
      <footer class="footer">
         <div class="container">
            <div class="row">
               <img src="assets/images/TUS-Logo_Primary_RGB.png" width="80" height="34" alt="Made by TUS" title="Made by TUS">
               <p>&copy; 2024 TUS - - A-Mazing Team.</p>
            </div>
         </div>
      </footer>


      
      <script src="assets/bootstrap/js/bootstrap.min.js"></script>
      <script src="assets/bootstrap/js/script.js"></script>
      <!-- Add jQuery library -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

      <!-- Add JavaScript code -->
      <script>
         $(document).ready(function() {
             $('#townDropdown').change(function() {
                 var town = $(this).val();
                 $.ajax({
                     url: 'saveSelection',
                     type: 'GET',
                     data: {town: town},
                     dataType: 'json',
                     success: function(data) {
                         $('#storeDropdown').empty();
                         $('#storeDropdown').append('<option value="Select Store">Select Store</option>');
                         $.each(data.stores, function(index, store) {
                             $('#storeDropdown').append('<option value="' + store + '">' + store + '</option>');
                         });
         
                         $('#rankDropdown').empty();
                         $('#rankDropdown').append('<option value="Select Rank">Select Rank</option>');
                         $.each(data.ranks, function(index, rank) {
                             $('#rankDropdown').append('<option value="' + rank + '">' + rank + '</option>');
                         });
         
                         $('#productDropdown').empty();
                         $('#productDropdown').append('<option value="Select Product">Select Product</option>');
                         $.each(data.products, function(index, product) {
                             $('#productDropdown').append('<option value="' + product + '">' + product + '</option>');
                         });
                     },
                     error: function(xhr, status, error) {
                         console.error('Error fetching data: ' + error);
                     }
                 });
             });
         });
      </script>
   </body>
</html>
