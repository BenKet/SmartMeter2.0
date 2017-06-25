<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*,de.tub.as.smm.models.SmartMeter"%>
<%@page import="java.util.*,de.tub.as.smm.models.Detailansicht"%>
<%@page import="java.util.*,de.tub.as.smm.models.Nutzereintrag"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Smart Meter</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/uebersicht.css">
	
    <!-- Javascript for random number and KhW entry feature -->
    <script>
        //get random number
        function random (min, max) {
            var randomNum = Math.floor(Math.random() * (max - min + 1)) + min;
            return randomNum;
        }
        //do a entry (idea from http://www.perl-community.de/bat/poard/thread/16658 )
        function submitEintrag() {
            //get values from user input
            var nK = document.getElementById("Nuterkennung").value;
            var KhW = document.getElementById("verbrauchswert").value;
            //create timestamp
            var date = new Date();
            var dateString = date.toDateString();
            //get the table by ID
            var tabelle = document.getElementById( "tabelle" );
            //count already existing rows in the table
            var zeile = tabelle.getElementsByTagName( "tr" ).length;
            //insert new row in the end (because we counted the number of existing rows and saved it in "zeile")
            var tr = tabelle.insertRow( zeile );
            //creat three new td elements for one row
            var nutzerKennung = document.createElement( "td" );
            var verbrauchskWh = document.createElement( "td" );
            var timestamps = document.createElement( "td" );
            //insert content from user into the <td> tags
            nutzerKennung.innerHTML = nK;
            verbrauchskWh.innerHTML = KhW;
            timestamps.innerHTML = dateString;
            //insert as a child of the new created row
            tr.appendChild( nutzerKennung );
            tr.appendChild( verbrauchskWh );
            tr.appendChild( timestamps );
        }
    </script>
	
	
</head>
<body>
<div id="main">

        <a href="uebersicht" class="glyphicon glyphicon-triangle-left"> Zurück</a>
        <h1>Detailansicht</h1><br>

        <!-- Image of the smartMeter -->
        <img id="smartMeterPic" src="img/smartMeter.jpg"></img>

		<%
		List<SmartMeter> smList = (List<SmartMeter>) request.getAttribute("sm");
		if (smList != null) {
			for (SmartMeter sm : smList) {
		%>

        <!-- Info Box with the dates -->
        <div id="info">
            <h4>Gerätekennung</h4>
            <input type="text" class="form-control" readonly="readonly" value="<%=sm.getKennung()%>">
            <br>
            <h4>Zulässige maximale Belastung</h4>
            <input type="text" class="form-control" readonly="readonly" value="<%=sm.getStromStärke()%>">
            <br>
            <h4>Spannung</h4>
            <script>
                // definition of min and max values
                var min = 2200;
                var max = 2400;
                //get random number
                var spannung = random(min, max);
                //write random number in an input tag
                document.write('<input type="text" class="form-control" readonly="readonly" value=" '+ spannung/10 +' ">');
            </script>
            <br>
            <h4>Stromstärke</h4>
            <script>
                // definition of min and max (+5) values
                
                var getMax = <%=sm.getStromStärke()%>
                
                var min = 0;
                var max = (getMax + 5)* 10;

                //get random number
                var strom = random(min, max);
                //check if current strom > max belastung, if true -> warning else normal input
                if(strom > (getMax * 10)){
                    document.write('<input type="text" class="form-control" id="warnung" readonly="readonly" value=" '+ strom/10 +' ">');
                }else {
                    document.write('<input type="text" class="form-control"  readonly="readonly" value=" ' + strom/10 + ' ">');
                }
            </script>
        </div>
	
		
		
        <!-- table to list user input -->
        <div id="ablesen">
            <table class="table table-striped" id="tabelle">
                <thead>
                     <tr>
                          <th>Nutzerkennung</th>
                         <th>Verbrauchswert (kWh)</th>
                          <th>Time</th>
                      </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>PS17</td>
                        <td>25015,023</td>
                        <td>Mon May 15 2017</td>
                    </tr>
                    <tr>
                        <td>BK53</td>
                        <td>25016,023</td>
                        <td>Mon May 22 2017</td>
                    </tr>
                    <tr>
                        <td>LW61</td>
                        <td>25017,023</td>
                        <td>Mon May 29 2017</td>
                    </tr>
                    <tr>
                        <td>SM92</td>
                        <td>25018,023</td>
                        <td>Mon June 5 2017</td>
                    </tr>
                    
                            <%
		List<Nutzereintrag> neList = (List<Nutzereintrag>) request.getAttribute("ne");
		if (!neList.isEmpty()) {
			for (Nutzereintrag ne : neList) {
		%>
              		<tr>
                        <td><%=ne.getNutzer()%></td>
                        <td><%=ne.getVerbrauchswert()%></td>
                        <td><%=ne.getDatum()%></td>
                    </tr>
			<%
			}

		}
		%>	
                    
                    
                    
                </tbody>
            </table>

          
        <!-- SmartMeter hinzufügen -->
		<div class="container">
			<button id="addSM" type="button" class="btn btn-info "
				data-toggle="modal" data-target="#myModal1">Ablesen</button>
			<div class="modal fade" id="myModal1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Ablesung</h4>
						</div>
						<div class="modal-body">
						
						     <% if(session.getAttribute("username")== null){
									%>Bitte Log dich erst ein. <a href="user">Login</a><% 
	
									}else{
							%>  
						
							<!-- form for user input -->
							<form id="formID" action="detailansicht" onsubmit="return submitEintrag();"
								method="POST">
								Abzulesendes Smart-Meter
								<input class="form-control" type="text" name="kennung" readonly="readonly" value="<%=sm.getKennung()%>" /><br>
								Nutzerkennung <input type="text" class="form-control"
									id="Nuterkennung" name="nutzerkennung" value="${username}" readonly="readonly"><br> Verbrauchswert
	
									<input
									type="text" class="form-control" id="verbrauchswert" name="verbrauchswert"><br>
								<br> <input type="Submit" class="btn btn-success"
									onclick="submitEintrag()" value="Absenden">
							</form>
									<%
									}
									%>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

		</div>
            

		</div>
	</div>
			<%
			}
			}
		%>

</body>
</html>