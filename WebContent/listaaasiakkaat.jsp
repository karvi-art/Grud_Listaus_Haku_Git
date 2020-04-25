<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.oikealle{
	text-align: right;
	color: white;
	background-color: green;
	}
.tausta{
	text-align: left;
	background-color: green;
	color: white;
}

</style>
</head>
<body>
<table id="listaus" border="1";>
	<thead>
		<tr>
			<th colspan="2" class="oikealle">Hakusana:</th>
			<th colspan="1" class="tausta"><input type="text" id="hakusana"></th>
			<th class="tausta"><input type="button" value="hae" id="hakunappi"></th>
			</tr>
		<tr>
			<th class="tausta">Etunimi</th>	
			<th class="tausta">Sukunimi</th>
			<th class="tausta">Puhelin</th>
			<th class="tausta">Sposti</th>
		</tr>
	</thead>
	<tbody>
	</tbody>	
</table>
<script>
$(document).ready(function(){
	
	haeAsiakkaat ();
	$("#hakunappi").click(function(){
		haeAsiakkaat();
	});
	$(document.body) .on("keydown", function(event){
		if(event.which==13){
			haeAsiakkaat();
		}
	});
	$("#hakusana").focus();
});	

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){//Funktio palauttaa tiedot json-objektina		
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>";  
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
}

</script>
</body>
</html>