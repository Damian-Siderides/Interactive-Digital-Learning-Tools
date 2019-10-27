%rebase("template.tpl")
%import sqlite3
<br>


%if status == "success":
	<div class="alert alert-success" role="alert">Your answer was correct!</div>
%elif status == "wrong":
	<div class="alert alert-danger" role="alert">Your answer was wrong!</div>
%end


<div class="container">
		<center>
		
		<br>

		<table class = "table table-bordered table-striped table-hover">
  			<tr>
    			<td id = "letters" value=""></td>
    			<td><center>Results</center></td>
  			</tr>
  			<tr>
    			<td id = "matrix" value=""></td>
    			<td id = "results" value=""></td>
  			</tr>
		</table>


		<!-- <input id="a" type="button" class="btn btn-light" onClick = "check('a')" value=""/>
		<br/>

		<input id="b" type="button" class="btn btn-light" onClick = "check('b')" value=""/>
		<br/>

		<input id="c" type="button" class="btn btn-light" onClick = "check('c')" value=""/>
		<br/>

		<input id="d" type="button" class="btn btn-light" onClick = "check('d')" value=""/>
		<br/>
		<br> -->


	<form action="/kmap" method="post">
						<!-- <button id="and" type="button" onClick = "isCorrect('and');" value="AND" class="btn btn-outline-primary btn-lg"/>AND</button> -->

				<!-- <input hidden id = "answer" name="answer" value="test" type="text"/> -->
				<input hidden id = "answer" name="answer" value="test" type="text"/>

                <input id="a" name="guess" value="a" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input id="b" name="guess" value="b" type="submit" class="btn btn-outline-primary btn-lg"/>
                <br><br>
                <input id="c" name="guess" value="c" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input id="d" name="guess" value="d" type="submit" class="btn btn-outline-primary btn-lg"/>


                
                
  	</form>

  		<br><br><br>
  		<input id="help" name="help" value="help" type="button" onClick="help();" class="btn btn-outline-secondary btn-lg"/>

  		<br><br>
  		
  		<div id="myDiv">
  		<input id="slide" type="button" onclick="location.href='../';" value="Test Lecture Slide Link" class="btn btn-outline-secondary btn-lg"/>
  		<input id="video" type="button" onclick="location.href='../';" value="Test Video Link" class="btn btn-outline-secondary btn-lg"/>
  		</div>








		<div id = "response" class="btn"></div>






</div>		


</center>


<script>

		//dont overload the built in print() function
		
		var y = document.getElementById("myDiv");
  		y.style.display = "none";
  		
		function help() {
			var x = document.getElementById("myDiv");
  			if (x.style.display === "none") {
    			x.style.display = "block";
  			} else {
    			x.style.display = "none";
  			}
		}

		function printLetters(variables) {
		
			let letters = "";

			for (let i = 0, c = 'A'; i < variables; i++) {
				letters += c;
				c = String.fromCharCode(c.charCodeAt() + 1);
			}
			document.getElementById("letters").innerHTML = letters;
		}

		function printMatrix(pow) {

			let matrixOne = "";

			for (let i = 0; i < pow; i++) {
				matrixOne += dec2bin(i, 3) + "<br>";
			}

			document.getElementById("matrix").innerHTML = matrixOne;
		}

		function printResults(array, variables) {

			let results = "";

			for (let i = 0; i < 8; i++) {

				//results += parseInt(array[i][3]) + "<br>";
				results += array[i][variables] + "<br>";
				
			}

			document.getElementById("results").innerHTML = results;

		}


		function dec2bin(c, n) {
   			thing = ""
   			for(let i = 31; i >= 0; i--) {
     			if ((c & (1 << i)) != 0) {
      				thing += "1";
     			} else if (i < n) {
      				thing += "0";
     			}
   			}
   			return thing;
		}

		//function to store binary digits in an array.
		//there might be a better form to store then a array, such as a string
		function dec2bin2(c, n, array) {
   			for(let i = 31; i >= 0; i--) {
     			if ((c & (1 << i)) != 0) {
      				array[c][n - i - 1] = 1;
     			} else if (i < n) {
       				array[c][n - i - 1] = 0;
     			}
   			}
		}

		function randomString(variables, strings, tokens) {

			var construct = "A";
			

			for (let i = 0, c = 'B'; i < variables - 1; i++) {
				strings[i] = tokens[Math.floor(Math.random() * 6)];
				
				construct += " " + strings[i] + " " + c;
				c = String.fromCharCode(c.charCodeAt() + 1);
			}

			return construct;

		}


		//MAIN

		var variables = 3; // x axis of array
		var pow = Math.pow(2, variables); // y axis of array
		
		printLetters(variables);
		printMatrix(pow);


		//var random = Math.ceil(Math.random() * variables);
		var tokens = ["and", "or", "xor", "nand", "nor", "xnor"];
		
		var strings = [];

		var newString = randomString(variables, strings, tokens);

	
		var array = [];
		for (let i = 0; i < pow; i++) {
     		array[i] = [];
     		dec2bin2(i, variables, array);
  		}
		
		
		var random
  		reload(array, strings)
  		
		
		

		function check(name) {

			if (name == random) {

				

				document.getElementById("response").innerHTML="You are Correct!";
				document.getElementById("response").classList.add('btn-success');
				document.getElementById("response").classList.remove('btn-danger');
				reload(array, strings);
			} else {

			

				document.getElementById("response").innerHTML="You are not correct!";
				document.getElementById("response").classList.add('btn-danger');
				document.getElementById("response").classList.remove('btn-success');
			}

		}

		function reload(array, strings) {


			for (let i = 0; i < pow; i++) {

				let answer = array[i][0];

				for (let j = 0; j < variables - 1; j++) {
					switch (strings[j]) {
						case "and": answer = answer & array[i][j + 1];
							    	break;
						case "or": answer = answer | array[i][j + 1];
								   break;
						case "xor": answer = answer ^ array[i][j + 1];
									break;
								//might be possible to just XOR answer with 0000 0001 to toggle it.
						case "nand": answer = ((answer & array[i][j + 1]) == 1) ? 0 : 1;
									 break;
						case "nor": answer = ((answer | array[i][j + 1]) == 1) ? 0 : 1;
									break;
						case "xnor": answer = ((answer ^ array[i][j + 1]) == 1) ? 0 : 1;
									 break;
					}
				}	

				array[i][variables] = answer;

			}


			var options = ['a', 'b', 'c', 'd']
        	random = options[parseInt(Math.random() * 4)]

        	document.getElementById('a').value = randomString(variables, strings, tokens);
        	document.getElementById('b').value = randomString(variables, strings, tokens);
        	document.getElementById('c').value = randomString(variables, strings, tokens);
        	document.getElementById('d').value = randomString(variables, strings, tokens);
        	
        	document.getElementById(random).value = newString;
			document.getElementById("answer").value = newString;

			printResults(array, variables);


		}









</script>