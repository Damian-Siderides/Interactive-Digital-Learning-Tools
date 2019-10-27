%rebase("template.tpl")
%import sqlite3
%from bottle import route, run, debug, template, request, static_file, get, post, response


<%
if request.get_cookie('username') == None:
	user = "anonymous"
else:
	user = request.get_cookie('username')
end

kmap1 = 3
kmap2 = 7
kmap3 = 11
kmap4 = 15

vhdl1 = 19
vhdl2 = 23
vhdl3 = 27
vhdl4 = 31
vhdl5 = 35



conn = sqlite3.connect('data.db')
c = conn.cursor()
c.execute("SELECT * FROM data WHERE username IS ?", (user,))
string = c.fetchone()

#global is a keyword in python dont use

c.execute("SELECT * FROM data WHERE username IS ?", ("global",))
globe = c.fetchone()

%>



<h1> Personal Statistics for user {{user}}</h1>

<br>

<table class = "table table-bordered table-striped table-hover">
	<tr>
		<th>Problem</th>
		<th>Correct</th>
		<th>Incorrect</th>
		<th>Attempts</th>
		<th>Last 50</th>
	</tr>
	<tr>
		<td>Kmap1</td>
		<td>{{string[kmap1]}}</td>
		<td>{{string[kmap1 + 1]}}</td>
		<td>{{string[kmap1 + 2]}}</td>
		<td>{{string[kmap1 + 3]}}</td>
	</tr>
	<tr>
		<td>Kmap2</td>
		<td>{{string[kmap2]}}</td>
		<td>{{string[kmap2 + 1]}}</td>
		<td>{{string[kmap2 + 2]}}</td>
		<td>{{string[kmap2 + 3]}}</td>
	</tr>
	<tr>
		<td>Kmap4</td>
		<td>{{string[kmap4]}}</td>
		<td>{{string[kmap4 + 1]}}</td>
		<td>{{string[kmap4 + 2]}}</td>
		<td>{{string[kmap4 + 3]}}</td>
	</tr>
	<tr>
		<td>Vhdl1</td>
		<td>{{string[vhdl1]}}</td>
		<td>{{string[vhdl1 + 1]}}</td>
		<td>{{string[vhdl1 + 2]}}</td>
		<td>{{string[vhdl1 + 3]}}</td>
	</tr>
	<tr>
		<td>Vhdl2</td>
		<td>{{string[vhdl2]}}</td>
		<td>{{string[vhdl2 + 1]}}</td>
		<td>{{string[vhdl2 + 2]}}</td>
		<td>{{string[vhdl2 + 3]}}</td>
	</tr>
	<tr>
		<td>Vhdl3</td>
		<td>{{string[vhdl3]}}</td>
		<td>{{string[vhdl3 + 1]}}</td>
		<td>{{string[vhdl3 + 2]}}</td>
		<td>{{string[vhdl3 + 3]}}</td>
	</tr>
	<tr>
		<td>Vhdl4</td>
		<td>{{string[vhdl4]}}</td>
		<td>{{string[vhdl4 + 1]}}</td>
		<td>{{string[vhdl4 + 2]}}</td>
		<td>{{string[vhdl4 + 2]}}</td>
	</tr>
	<tr>
		<td>Vhdl5</td>
		<td>{{string[vhdl5]}}</td>
		<td>{{string[vhdl5 + 1]}}</td>
		<td>{{string[vhdl5 + 2]}}</td>
		<td>{{string[vhdl5 + 3]}}</td>
	</tr>

	
</table>

<h1> Global Statistics </h1>

<br>

<table class = "table table-bordered table-striped table-hover">
	<tr>
		<th>Problem</th>
		<th>Correct</th>
		<th>Incorrect</th>
		<th>Attempts</th>
		<!-- <th>Last 50</th> -->
	</tr>
	<tr>
		<td>Kmap1</td>
		<td>{{globe[kmap1]}}</td>
		<td>{{globe[kmap1 + 1]}}</td>
		<td>{{globe[kmap1 + 2]}}</td>
		<!-- <td>{{globe[kmap1 + 3]}}</td> -->
	</tr>
	<tr>
		<td>Kmap2</td>
		<td>{{globe[kmap2]}}</td>
		<td>{{globe[kmap2 + 1]}}</td>
		<td>{{globe[kmap2 + 2]}}</td>
		<!-- <td>{{globe[kmap2 + 3]}}</td> -->
	</tr>
	<tr>
		<td>Kmap4</td>
		<td>{{globe[kmap4]}}</td>
		<td>{{globe[kmap4 + 1]}}</td>
		<td>{{globe[kmap4 + 2]}}</td>
		<!-- <td>{{globe[kmap4 + 3]}}</td> -->
	</tr>
	<tr>
		<td>Vhdl1</td>
		<td>{{globe[vhdl1]}}</td>
		<td>{{globe[vhdl1 + 1]}}</td>
		<td>{{globe[vhdl1 + 2]}}</td>
		<!-- <td>{{globe[vhdl1 + 3]}}</td> -->
	</tr>
	<tr>
		<td>Vhdl2</td>
		<td>{{globe[vhdl2]}}</td>
		<td>{{globe[vhdl2 + 1]}}</td>
		<td>{{globe[vhdl2 + 2]}}</td>
		<!-- <td>{{globe[vhdl2 + 3]}}</td> -->
	</tr>
	<tr>
		<td>Vhdl3</td>
		<td>{{globe[vhdl3]}}</td>
		<td>{{globe[vhdl3 + 1]}}</td>
		<td>{{globe[vhdl3 + 2]}}</td>
		<!-- <td>{{globe[vhdl3 + 3]}}</td> -->
	</tr>
	<tr>
		<td>Vhdl4</td>
		<td>{{globe[vhdl4]}}</td>
		<td>{{globe[vhdl4 + 1]}}</td>
		<td>{{globe[vhdl4 + 2]}}</td>
		<!-- <td>{{globe[vhdl4 + 2]}}</td> -->
	</tr>
	<tr>
		<td>Vhdl5</td>
		<td>{{globe[vhdl5]}}</td>
		<td>{{globe[vhdl5 + 1]}}</td>
		<td>{{globe[vhdl5 + 2]}}</td>
		<!-- <td>{{globe[vhdl5 + 3]}}</td> -->
	</tr>

	
</table>

%c.close()







