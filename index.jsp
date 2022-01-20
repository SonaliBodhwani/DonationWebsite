<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation | Home</title>
    <!-- <link rel="stylesheet" href="style/style.css"> -->
    <style>
        * {
        padding:0px;
        text-decoration:none;
        list-style:none;
        box-sizing: border-box;   
        }

        /* .bgimage{
        height:1000px;
        width:1000px;
        position: absolute; */


        /* .image{
        position: absolute;
        top: 10px; */
    
        body {
        margin: 0px;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        nav {
        background-color: rgb(70, 193, 214);
        overflow: hidden;
        } 

        nav a {
        text-decoration: none;
        padding: 12px;
        text-align: center;
        float: right;
        color: white;
        }

        main {
        text-align: center;
        }

        .background{
        background-image: url("/img7.jpg");
        height:708px;
        background-repeat: No-repeat;
        background-size:cover;
        background-attachment: fixed; 
        }


        body a.pay{
        background-color: rgb(70, 193, 214);;
        color:white;
        padding:20px;
        text-decoration:none;
        font-size:20px;
        }

        a:hover {
        color: saddlebrown;
        background-color: slategrey;
        text-decoration:none;
        padding:10px;
        }
   
        .first {
        font-family:Segoe script;
        /* position:absolute; */
        }

        .second{font-family:Times New Roman; font-size:25px;}

        .first,.second{text-align:center; color:white;}

        #banner_content{
        position:relative;
        padding-top: 3%;
        padding-bottom: 3%;
        overflow: hidden;
        background-color: rgba(0, 0, 0, 0.7);
        max-width: 660px;
        color:white;
        }

    </style>
</head>
<body>
    <!-- <img src="/img7.jpg"  alt="couldnt load image" class="bgimage" style="width:100%; height:100%;">  -->
    <nav>
        <a href=contactus.jsp>CONTACT US</a>
        <a href=aboutus.jsp>ABOUT US</a>
        <a href=index.jsp>HOME</a>
        
    </nav>
    
    <main>
        <div class="background" id="banner-image">
            <div class="container">
                <center>
                <div id="banner_content">
                    <h1 class="first">Open Your Heart To Those In Need!! </h1>
                   <p class="second"> A Little Help Can Make A Big Change!!!</p><br>
                <a href="payment.jsp" class="pay btn btn-primary btn-lg active">Donate Now</a></p>
                </div>
                </center>
            </div>
        </div>
    
    </main> 
</body>

</html>