<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*,de.tub.as.smm.models.SmartMeter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartMeter Übersicht</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/uebersicht.css">


</head>

<body>
	<div id="main">
	
	
	
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
							<form method="POST" action="uebersicht">
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
						  <% if(session.getAttribute("username")== null){
									%><input class="btn btn-info " type="submit" value="Anmelden" /><% 
	
									}else{
							%>  
					 <input class="btn btn-info " type="submit" value="Abmelden" />
					 <%
									}
					 %>
				</form>

		</div>
		
		<%
			@SuppressWarnings("unchecked")
			List<SmartMeter> smList = (List<SmartMeter>) request.getAttribute("sm");
			if (smList != null) {
				for (SmartMeter sm : smList) {
		%>
				<img src="img/smartMeter.jpg">
				
				
				<form method="POST" action="detailansicht">
								<input class="column-sm-7" type="text" name="kennung" value="<%=sm.getKennung()%>" readonly="readonly"/>
								<br> <input type="submit" value="Detailansicht" />
				</form>
		</a>
		<%
			}
			}
	
		%>

	</div>


</body>
</html>