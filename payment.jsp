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
    <title>Payment Form</title>
    <!-- <link rel="stylesheet" href="style/payment.css"> -->
	<style>
		*{
    background-image: url("img25e.jpg");
    background-size: cover;
    background-attachment: fixed;
    font-size:18px;
    color:black;
	font-weight:bold;
    
    
}

h2{
    font-size: 32px;
}

body{
    margin: 15px 30px;
    padding:8px;
    font-family:Arial;
}

.container{
    background-color: #f2f2f2;
    padding:1px 10px 10px 20px;
    border: 1px solid lightgray ;
    border-radius: 4px;
}

input[type="text"],
input[type="email"],
input[type="number"],
input[type="password"],
textarea{
    width:22%;
    padding:10px;
    border:1px solid;
    border-radius: 5px;
}

select{
	width:23%;
	padding:10px;
    border:1px solid;
    border-radius: 5px;
}

input[type="date"]{
	width:19%;
	padding:10px;
    border:1px solid;
    border-radius: 5px;

}

input[type="submit"]{
    background-color: lightslategray;
    color:black;
    padding:10px 16px;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover{
    background-color: #4caf84;
}

.success{
	font-family: Segoe script;
	color:rgb(231, 10, 21);
	font-size:25px;
}


	</style>
</head>
<body>
    <div class="container">
    <h2>Payment Details</h2>
    <hr>
    <form>
        Full Name:&nbsp;&nbsp;<input type="text" name="name" id="na" placeholder="Enter your Name" required><br><br>
        Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name="em" id="email" placeholder="Enter your Email-id" required><br><br>
        Contact No: <input type="number" name="phone" id="no" placeholder="Enter your Contact No." required><br><br>        
        Amount: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="amount" id="amt" placeholder="Enter Amount" required><br><br>
        Card Type: &nbsp;
        <select name="card_type" id="card_type" required>
            <option value="">--Select a Card Type--</option>
            <option value="visa">Visa</option>
            <option value="rupay">Rupay</option>
            <option value="mastercard">MasterCard</option>
        </select><br><br>
		Card No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="card_number" id="card_no" placeholder="Enter your Card Number" required><br><br>
		Expiration Date: <input type="date" name="exp_date" id="exp_dt" required><br><br>
		CVV: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="password" name="cvv" id="cvv" placeholder="Enter CVV" required><br><br>
        <input type="submit" value="Pay Now" name="b1">
    </form>
    </div>


    <%
		if (request.getParameter("b1") != null) {
			String name = request.getParameter("name");
			String em = request.getParameter("em");
			Float phone = Float.parseFloat(request.getParameter("phone"));
			Float amount = Float.parseFloat(request.getParameter("amount"));
			String card_type = request.getParameter("card_type");
			Float card_number = Float.parseFloat(request.getParameter("card_number"));
			String exp_date = request.getParameter("exp_date");
			int cvv = Integer.parseInt(request.getParameter("cvv"));


			try {
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "abc123");
				String sql = "insert into payment_tsf values(?,?,?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, name);
                pst.setString(2, em);
                pst.setFloat(3, phone);
                pst.setFloat(4, amount);
				pst.setString(5, card_type);
                pst.setFloat(6, card_number);
				pst.setString(7, exp_date);
                pst.setInt(8, cvv);
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
					msg.setText("Dear " + name +","+amount + " Rs. Successfully Donated..!!"+ " Thank you for your donation. Your generous donation has been allocated to the Old Age Nursing Home! We are so fortunate to have caught the attention of people like you with large warm hearts!!! Please accept this complimentary ticket as a heartfelt thank you for being sunshine in their dark days:)");
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("em")));
					Transport.send(msg);
			%>
					<br>
					<div class="success">
					<% out.println("Thank you for your most generous donation!!!");
				} catch (Exception e) {
					out.println("issue" + e);
				}
				con.close();
		}catch(SQLException e) {
			out.println(em + "already registered");
			out.println("---> "+ e);
		}
		}
	%>
</div>
</body>
</html>