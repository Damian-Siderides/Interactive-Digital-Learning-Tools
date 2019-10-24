%rebase("template.tpl")

<br>

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


		<br><br>




		<table class = "table table-bordered table-striped table-hover">
  			<tr>
    			<td id = "letters" value=""></td>
    			<td><center>AB</center></td>
    			
  			</tr>
  			<tr>
    			<td id = "matrix" value=""></td>
    			<td id = "matrix" value=""></td>
    			<td id = "results" value="">00</td>
    			<td id = "results" value="">01</td>
    			<td id = "results" value="">11</td>
    			<td id = "results" value="">10</td>
  			</tr>
  			<tr>
    			<td id = "" value="">CD</td>
    			<td id = "" value="">00</td>
    			<td id = "0000" value=""></td>
    			<td id = "0001" value="">ff</td>
    			<td id = "0011" value="">ff</td>
    			<td id = "0010" value="">ff</td>
  			</tr>
  			<tr>
    			<td id = "matrix" value=""></td>
    			<td id = "results" value="">01</td>
    			<td id = "0100" value="">ff</td>
    			<td id = "0101" value="">ff</td>
    			<td id = "0111" value="">ff</td>
    			<td id = "0110" value="">ff</td>
  			</tr>
  			<tr>
    			<td id = "matrix" value=""></td>
    			<td id = "results" value="">11</td>
    			<td id = "1100" value="">ff</td>
    			<td id = "1101" value="">ff</td>
    			<td id = "1111" value="">ff</td>
    			<td id = "1110" value="">ff</td>
  			</tr>
  			<tr>
    			<td id = "matrix" value=""></td>
    			<td id = "results" value="">10</td>
    			<td id = "1000" value="">ff</td>
    			<td id = "1001" value="">ff</td>
    			<td id = "1011" value="">ff</td>
    			<td id = "1010" value="">ff</td>
  			</tr>
		</table>







		<br><br>


		<input id="a" type="button" class="btn btn-light" onClick = "check('a')" value=""/>
		<br/>

		<input id="b" type="button" class="btn btn-light" onClick = "check('b')" value=""/>
		<br/>

		<input id="c" type="button" class="btn btn-light" onClick = "check('c')" value=""/>
		<br/>

		<input id="d" type="button" class="btn btn-light" onClick = "check('d')" value=""/>
		<br/>
		<br>

		<div id = "response" class="btn"></div>







</div>		


</center>


<script>

		//dont overload the built in print() function
		
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
				matrixOne += dec2bin(i, variables) + "<br>";
			}

			document.getElementById("matrix").innerHTML = matrixOne;
		}

		function printResults(array, variables) {

			let results = "";

			for (let i = 0; i < pow; i++) {

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

		var variables = 4; // x axis of array
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
  		
		kmap()
		

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

			printResults(array, variables);


		}



		function kmap() {

			ab = [0, 4, 12, 8];
			cd = [0, 1, 3, 2];

			var x = ["00", "01", "11", "10"];
			var y = ["00", "01", "11", "10"];

			for (var i = 0; i < 4; i++) {
				for (var j = 0; j < 4; j++) {

					var num = x[i] + y[j];
					
				
					//should be correct now
					document.getElementById(num.toString()).innerHTML = array[ cd[i] + ab[j] ][variables];
				}
			}

		}






</script>