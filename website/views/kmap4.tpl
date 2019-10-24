%rebase("template.tpl")
%import sqlite3

%if status == "success":
	<div class="alert alert-success" role="alert">Your answer was correct!</div>
%elif status == "wrong":
	<div class="alert alert-danger" role="alert">Your answer was wrong!</div>
%end

	<!-- Source website of images is https://whatis.techtarget.com/definition/logic-gate-AND-OR-XOR-NOT-NAND-NOR-and-XNOR -->
		<center>
		
		
		<br>
		
		<h2>What is the name of this Logic Gate?</h2>

		<br><br>

		<img id = "source">

		<br><br><br>

		<!-- MAKE THE IMAGES LARGER -->
		
		<!-- <button id="and" type="button" onClick = "isCorrect('and');" value="AND" class="btn btn-outline-primary btn-lg"/>AND</button>
		<button id="or" type="button" onClick = "isCorrect('or');" value="OR" class="btn btn-outline-primary btn-lg"/>OR</button>
		<button id="xor" type="button" onClick = "isCorrect('xor');" value="XOR" class="btn btn-outline-primary btn-lg"/>XOR</button>
		<br>
		<br>
		<button id="nand" type="button" onClick = "isCorrect('nand');" value="NAND" class="btn btn-outline-primary btn-lg"/>NAND</button>
		<button id="nor" type="button" onClick = "isCorrect('nor');" value="NOR" class="btn btn-outline-primary btn-lg"/>NOR</button>
		<button id="xnor" type="button" onClick = "isCorrect('xnor');" value="XNOR" class="btn btn-outline-primary btn-lg"/>XNOR</button>
		<br>
		<br>
		<button id="not" type="button" onClick = "isCorrect('not');" value="NOT" class="btn btn-outline-primary btn-lg"/>NOT</button> -->



	<form action="/kmap4" method="post">
						<!-- <button id="and" type="button" onClick = "isCorrect('and');" value="AND" class="btn btn-outline-primary btn-lg"/>AND</button> -->

				<input hidden id = "answer" name="answer" value="test" type="text"/>

                <input name="guess" value="AND" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input name="guess" value="OR" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input name="guess" value="XOR" type="submit" class="btn btn-outline-primary btn-lg"/>
                <br><br>
                <input name="guess" value="NAND" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input name="guess" value="NOR" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input name="guess" value="XNOR" type="submit" class="btn btn-outline-primary btn-lg"/>
                <br><br>
                <input name="guess" value="NOT" type="submit" class="btn btn-outline-primary btn-lg"/>
                
  	</form>





		<!--<br/>
		<input id="or" type="button" onClick = "isCorrect('or');" value="OR"/>
		<br/>
		<input id="xor" type="button" onClick = "isCorrect('xor');" value="XOR"/>
		<br/>
		<input id="nand" type="button" onClick = "isCorrect('nand');" value="NAND"/>
		<br/>
		<input id="nor" type="button" onClick = "isCorrect('nor');" value="NOR"/>
		<br/>
		<input id="xnor" type="button" onClick = "isCorrect('xnor');" value="XNOR"/>
		<br/>
		<input id="not" type="button" onClick = "isCorrect('not');" value="NOT"/>
		<br/>-->
		
		<br><br>
		<button id="reload" type="button" onClick = "reload();" value="RELOAD" class="btn btn-outline-secondary btn-lg"/>Refresh</button>

		<br><br><br><br><br>

		<!-- make this not render when empty -->

		<div id = "response" class="btn"></div>

		</center>


<script>

//things to add
//bigger images of logic gates

//Make it flash?
//So users can notice multiple flashes
//make it a notification?

		function isCorrect(name) {

			if (name == random) {

				
				document.getElementById("response").innerHTML="You are Correct!";
				document.getElementById("response").classList.add('btn-success');
				document.getElementById("response").classList.remove('btn-danger');
				reload();
			} else {


				


				document.getElementById("response").innerHTML="You are not correct!";
				document.getElementById("response").classList.add('btn-danger');
				document.getElementById("response").classList.remove('btn-success');
			}

		}

		function reload() {
			var images = ["and", "or", "xor", "not", "nand", "nor", "xnor"];
			random = images[Math.floor(Math.random() * images.length)];
			document.getElementById("source").src = "images/" + random + ".gif";
		}
		
		var random;
		reload();
		
		document.getElementById("answer").value = random;
		
</script>