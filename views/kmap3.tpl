%rebase("template.tpl")

<center>
		
			<br>
			<button class="btn btn-primary btn-lg"> Enter your number in the box below. </button>

			<br><br>

		<input type = "number" oninput="check();" id = "answer" class="input-lg"/>
		<br/><br>



		<br>
		<input id="number" type="button" class="btn btn-primary btn-lg" value="Number"/>
		<br/>
		<br>
		<input id="binary" type="button" class="btn btn-primary btn-lg" value="Binary"/>
		<br/>
		<br>
		<input id="octal" type="button" class="btn btn-primary btn-lg" value="Octal"/>
		<br/>
		<br>
		<input id="hex" type="button" class="btn btn-primary btn-lg" value="Hexadecimal"/>
		<br/>
		<br>
		<input id="comp1" type="button" class="btn btn-primary btn-lg" value="1's Complement"/>
		<br/>
		<br>
		<input id="comp2" type="button" class="btn btn-primary btn-lg" value="2's Complement"/>
		<br/>
		<br>

		<br>

		
		

		<!-- No longer necessary -->
		<!-- <input id="submit" type="button" onClick = "check();" class="btn btn-secondary btn-lg" value="Submit"/>
		<br/> -->
		</center>




<script>

		//fix bug with negatives and complements


		//what is a better way
		//to display this information?

		//make textbox submitable with enter button

		function check() {
			document.getElementById('number').value = "Number: " + document.getElementById('answer').value;
			document.getElementById('binary').value = "Binary: b" + parseInt(document.getElementById('answer').value).toString(2);
			document.getElementById('octal').value = "Octal: 0" + parseInt(document.getElementById('answer').value).toString(8);
			document.getElementById('hex').value = "Hexadecimal: 0x" + parseInt(document.getElementById('answer').value).toString(16);
			document.getElementById('comp1').value = "1's Complement: " + ~parseInt(document.getElementById('answer').value).toString(2);
			document.getElementById('comp2').value = "2's Complement: " + -parseInt(document.getElementById('answer').value).toString(2);
		}
		
		
</script>