<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*,de.tub.as.smm.models.SmartMeter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartMeter Übersicht</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/Übersicht.css">


</head>

<body>
	<div id="main">
	
	
	<% if(session.getAttribute("username")== null){
		%>Bitte Log dich erst ein. <a href="user">Login</a><% 
	
	}else{
	%>
	
	
		<h1>Gesamtübersicht</h1>
		
		<!-- SmartMeter hinzufügen -->
		<div class="container">
			<button id="addSM" type="button" class="btn btn-info "
				data-toggle="modal" data-target="#myModal1">SmartMeterhinzufügen</button>
			<div class="modal fade" id="myModal1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">SmartMeterhinzufügen</h4>
						</div>
						<div class="modal-body">
							<form method="POST" action="übersicht">
								<p class="column-sm-5">Kennung:</p>
								<input class="column-sm-7" type="text" name="kennung" />
								<p class="column-sm-5">Maximale Belastung:</p>
								<input class="column-sm-7" type="number" min=50 max=100
									name="maxStaerke" /><br>
								<br> <input type="submit" value="hinzufügen" />
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

		</div>
		
		<!-- Einloggen -->
		<div class="container">
				
				<form method="POST" action="user">
					 <input class="btn btn-info " type="submit" value="Abmelden" />
				</form>

		</div>
		
		
		

		<div>
			<a href="DE_02469237.html"> <img src="img/smartMeter.jpg">
				<h4>Kennung:DE 02469237</h4>
			</a>
		</div>
		<div>
			<a href="CC_29748571.html"> <img src="img/smartMeter.jpg" />
				<h4>Kennung: CC 29748571</h4>
			</a>
		</div>
		<%
			@SuppressWarnings("unchecked")
			List<SmartMeter> smList = (List<SmartMeter>) request.getAttribute("sm");
			if (smList != null) {
				for (SmartMeter sm : smList) {
		%>
		<a href=<%
				System.out.println("YES!"); 
				%>> 
				<img src="img/smartMeter.jpg">
				
				
				<form method="POST" action="detailansicht">
								<input class="column-sm-7" type="text" name="kennung" value="<%=sm.getKennung()%>" readonly/>
								<br> <input type="submit" value="Detailansicht" />
				</form>
		</a>
		<%
			}
			}
	}
		%>

	</div>


</body>
</html>