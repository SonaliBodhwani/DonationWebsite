<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <!-- <link rel="stylesheet" href="style/contactus.css"> -->
    <style>
        *{
            background-image: url("img21.jpg");
            background-attachment: fixed;
            background-repeat: No-repeat;
            background-size:cover;
            font-family: Arial;
            color: white;
            margin:0;
            padding:10px;
        }

        /* img{
            height:745px;
            width:1535px;
        } */


        body{
            margin: 6px 15px;
            padding:8px;
        }

        .container{
            background-color: #f2f2f2;
            padding:5px 20px 65px 5px;
            border: 1px solid lightgray ;
            border-radius: 4px;
        }

        input[type="text"],
        input[type="email"],
        textarea{
            padding:12px;
            border:1px solid;
        }

        input[type="submit"]{
            background-color: lightslategray;
            color:white;
            padding:10px 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover{
            background-color: #4caf84;
        }

        .success{
	    font-family: Segoe script;
	    color:black;
	    font-size:25px;
        }

    </style>
</head>
<body>
    <!-- <div> -->
        <!-- <img src="img21.jpg" class="img" style{height:100%; position:absolute;}> -->
    <div class="container">
    <form>
        <div>
            Name: &nbsp; <input type="text" name="name" placeholder="Enter Your Name" required>
        </div><br>
        <div>
            Email:&nbsp;&nbsp; <input type="email" name="email" placeholder="Enter Your Email-Id" required>
        </div><br>
        <div>
            Gender: <br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Male&nbsp;<input type="radio" name="gender" id="male" required>&nbsp;
                Female&nbsp;<input type="radio" name="gender" id="female">&nbsp;
                Other&nbsp;<input type="radio" name="gender" id="other">&nbsp;
            
        </div><br> 
        <div>
            Type Message: <br><br>
        <textarea name="message" id="message" cols="55" rows="8" required></textarea>
        </div><br>
        <div>
            <input type="Submit" name="b1" value="Submit"></p>
        </div>
    </form>
    </div>
<!-- </div> -->

    <%
		if (request.getParameter("b1") != null) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String message = request.getParameter("message");


			try {
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "abc123");
				String sql = "insert into contact_tsf values(?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, gender);
                pst.setString(4, message);
				pst.executeUpdate();

				Properties p = System.getProperties();
				p.put("mail.smtp.host", "smtp.gmail.com");
				p.put("mail.smtp.port", "587");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.starttls.enable", true);

				Session ms = Session.getInstance(p, new Authenticator() {
					public PasswordAuthentication getPasswordAuthentication () {
						return new PasswordAuthentication("xyzproject2201@gmail.com", "pro@2201"); 
					}
				});

				try {
					MimeMessage msg = new MimeMessage(ms);
					msg.setSubject("Old Age Home Donation");
					msg.setText("Dear " + name +", "+"We got your message and we will look into that as soon as possible! Stay tuned..!! Our team will get back to you soon. Thanks for your Patience!");
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("email")));
					Transport.send(msg);
    %>
					<br>
					<div class="success">
	<% out.println("Thank you!!!");
				} catch (Exception e) {
					out.println("issue" + e);
				}
				con.close();
		}catch(SQLException e) {
			out.println(email + "already registered");
			out.println("---> "+ e);
		}
		}
	%>
</div>
</body>
</html>