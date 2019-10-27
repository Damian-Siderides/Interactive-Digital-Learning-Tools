%rebase("template.tpl")
%import sqlite3

%if status == "success":
	<div class="alert alert-success" role="alert">Your answer was correct!</div>
%elif status == "wrong":
	<div class="alert alert-danger" role="alert">Your answer was wrong!</div>
%end
		
		<br><br>
		
		<center><h2>What Logic Gate does the following VHDL code implement?</h2></center>

		<br><br>

		<pre id = "blob" class = "jumbotron">
			
		</pre>

		


		<center>

		

		<br><br><br>


	<form action="/vhdl3" method="post">
				<input hidden id = "answer" name="answer" value="test" type="text"/>

                <input name="guess" value="half adder" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input name="guess" value="full adder" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input name="guess" value="tristate buffer" type="submit" class="btn btn-outline-primary btn-lg"/>
                <br><br>
                <input name="guess" value="tristate vector" type="submit" class="btn btn-outline-primary btn-lg"/>
                <input name="guess" value="memory entity" type="submit" class="btn btn-outline-primary btn-lg"/>
                
                
  	</form>

		

		</center>

		<br><br><br>
  		<input id="help" name="help" value="help" type="button" onClick="help();" class="btn btn-outline-secondary btn-lg"/>

  		<br><br>
  		
  		<div id="myDiv">
  		<input id="slide" type="button" onclick="location.href='../';" value="Test Lecture Slide Link" class="btn btn-outline-secondary btn-lg"/>
  		<input id="video" type="button" onclick="location.href='../';" value="Test Video Link" class="btn btn-outline-secondary btn-lg"/>
  		</div>

<script>

//things to add
//bigger images of logic gates

//Make it flash?
//So users can notice multiple flashes
//make it a notification?
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
			//var gates = ["and", "or", "xor", "nand", "nor", "xnor", "not"];
			//var gates = ["multiplexer", "4 multiplexer", "bus multiplexer", "other bus multiplexer", "single flip flop", "something"];
			var gates = ["half adder", "full adder", "tristate buffer", "tristate vector", "memory entity"];
			//var gates = ["next state bloated", "next state", "finite state machine", "crosswalk"];
			//var gates = ["and", "or", "xor", "nand", "nor", "xnor", "not", "multiplexer", "4 multiplexer", "bus multiplexer", "other bus multiplexer", "single flip flop", "something", "half adder", "full adder", "tristate buffer", "tristate vector", "memory entity", "next state bloated", "next state", "finite state machine", "crosswalk"];
			num = Math.floor(Math.random() * gates.length);
			offset = 13;
			random = gates[num];
		}
		
		var random;
		reload();
		
		document.getElementById("answer").value = random;
		

		var gate = [];

// do not change the indentation
// the below formatting is displayed correctly
// on the webpage

//and gate
gate[0] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
\n\
entity mystery is\n\
   	port( A, B : in std_logic;\n\
		 F : out std_logic);\n\
end mystery;\n\
\n\
architecture func of mystery is\n\
begin\n\
  	F <= A and B;\n\
end func;";
// or gate
gate[1] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
\n\
entity mystery is\n\
   	port( A, B : in std_logic;\n\
		 F : out std_logic);\n\
end mystery;\n\
\n\
architecture func of mystery is\n\
begin\n\
  	F <= A or B;\n\
end func;";
// xor gate
gate[2] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
\n\
entity mystery is\n\
   	port( A, B : in std_logic;\n\
		 F : out std_logic);\n\
end mystery;\n\
\n\
architecture func of mystery is\n\
begin\n\
  	F <= A xor B;\n\
end func;";
// nand gate
gate[3] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
\n\
entity mystery is\n\
   	port( A, B : in std_logic;\n\
		 F : out std_logic);\n\
end mystery;\n\
\n\
architecture func of mystery is\n\
begin\n\
  	F <= A nand B;\n\
end func;";
// nor gate
gate[4] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
\n\
entity mystery is\n\
   	port( A, B : in std_logic;\n\
		 F : out std_logic);\n\
end mystery;\n\
\n\
architecture func of mystery is\n\
begin\n\
  	F <= A nor B;\n\
end func;";
// xnor gate
gate[5] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
\n\
entity mystery is\n\
   	port( A, B : in std_logic;\n\
		 F : out std_logic);\n\
end mystery;\n\
\n\
architecture func of mystery is\n\
begin\n\
  	F <= A xnor B;\n\
end func;";
// not gate
gate[6] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
\n\
entity mystery is\n\
   	port( A : in std_logic;\n\
	      F : out std_logic);\n\
end mystery;\n\
\n\
architecture func of mystery is\n\
begin\n\
  	F <= not A;\n\
end func;";

// multiplexers

// 1 bit multiplexer
gate[7] = "ARCHITECTURE behavioural of mux is\n\
begin\n\
process(s, x, y) \n\
begin \n\
	if s = ‘1’ then \n\
		m <= x; \n\
	else\n\
		m <= y;\n\
	end if;\n\
end process;\n\
END behavioural;"

//4 multiplexer
gate[8] = "ENTITY mux4 IS\n\
PORT ( 		 s : IN std_logic_vector(1 downto 0);\n\
 	u, v, w, x : IN std_logic;\n\
		 m : OUT std_logic);\n\
END;\n\
\n\
ARCHITECTURE Behavior of mux4 IS\n\
COMPONENT mux2\n\
	PORT (s, x, y : IN std_logic;\n\
		    m : OUT std_logic);\n\
END COMPONENT;\n\
signal a, b: std_logic;\n\
BEGIN\n\
	m0: mux2 port map(s => s(1), x => *, y => *);\n\
	m1: mux2 port map(s => *, x => *, y => *);\n\
END;"

// bus multiplexer

gate[9] = "ENTITY mux is \n\
port (     s : IN std_logic;\n\
	 ina : IN std_logic_vector(7 downto 0);\n\
	 inb : IN std_logic_vector(7 downto 0); \n\
	   m : OUT std_logic_vector(7 downto 0));\n\
END;\n\
\n\
ARCHITECTURE behavioural of mux is \n\
begin\n\
process(s, ina, inb) \n\
begin \n\
	if s = ‘1’ then \n\
		m <= ina; \n\
	else\n\
		m <= inb;\n\
	end if;\n\
end process;\n\
END behavioural;"

// other bus multiplexer

gate[10] = "ENTITY mux is \n\
port ( S : IN std_logic;\n\
       X : IN std_logic_vector(7 downto 0);\n\
       Y : IN std_logic_vector(7 downto 0);\n\
       M : OUT std_logic_vector(7 downto 0)\n\
      );\n\
END;\n\
\n\
ARCHITECTURE behavioural of mux is \n\
begin\n\
process(S, X, Y) \n\
begin \n\
	if S = ‘1’ then \n\
		M <= Y; \n\
	else\n\
		M <= X;\n\
	end if;\n\
end process;\n\
END behavioural;"

// bit comparators lecture9

// single flip flop

gate[11] = "entity reg8 is\n\
port ( 		  D     : in std_logic; \n\
		clk, reset  : in std_logic;\n\
				  Q : out std_logic);\n\
end reg8;\n\
\n\
ARCHITECTURE behavioral OF reg8 is\n\
BEGIN\n\
PROCESS (clk, reset)\n\
BEGIN\n\
	if (reset = '1') then\n\
		Q <= ‘0’;\n\
	elsif (falling_edge(clk)) then\n\
		Q <= D;\n\
	end if;\n\
END PROCESS;\n\
END;"

//backticks cause " in the vhdl code

gate[12] = `entity reg8 is\n\
port ( 	     D     : in std_logic_vector(7 downto 0); \n\
       clk, reset  : in std_logic;\n\
		 Q : out std_logic_vector(7 downto 0);\n\
      );\n\
end reg8;\n\
\n\
ARCHITECTURE behavioral OF reg8 is\n\
BEGIN\n\
PROCESS (clk, reset)\n\
BEGIN\n\
	if (reset = '1') then\n\
		Q <= "00000000";\n\
	elsif (falling_edge(clk)) then\n\
		Q <= D;\n\
	end if;\n\
END PROCESS;\n\
END;`


// half adder
gate[13] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
use ieee.numeric_std.all;\n\
\n\
entity half_adder is\n\
  port ( in1 : in std_logic;\n\
    	 in2 : in std_logic;\n\
    	 sum : out std_logic;\n\
       carry : out std_logic\n\
    );\n\
end half_adder;\n\
\n\
architecture rtl of half_adder is\n\
begin\n\
  sum   <= in1 xor in2;\n\
  carry <= in1 and in2;\n\
end rtl;"

gate[14] = "library ieee;\n\
use ieee.std_logic_1164.all;\n\
use ieee.numeric_std.all;\n\
\n\
entity full_adder is\n\
  port (\n\
    i_bit1  : in std_logic;\n\
    i_bit2  : in std_logic;\n\
    i_carry : in std_logic;\n\
    --\n\
    o_sum   : out std_logic;\n\
    o_carry : out std_logic\n\
    );\n\
end full_adder;\n\
 \n\
 \n\
architecture rtl of full_adder is\n\
 \n\
  signal w_WIRE_1 : std_logic;\n\
  signal w_WIRE_2 : std_logic;\n\
  signal w_WIRE_3 : std_logic;\n\
   \n\
begin\n\
 \n\
  w_WIRE_1 <= i_bit1 xor i_bit2;\n\
  w_WIRE_2 <= w_WIRE_1 and i_carry;\n\
  w_WIRE_3 <= i_bit1 and i_bit2;\n\
 \n\
  o_sum   <= w_WIRE_1 xor i_carry;\n\
  o_carry <= w_WIRE_2 or w_WIRE_3;\n\
 \n\
 \n\
  -- FYI: Code above using wires will produce the same results as:\n\
  -- o_sum   <= i_bit1 xor i_bit2 xor i_carry;\n\
  -- o_carry <= (i_bit1 xor i_bit2) and i_carry) or (i_bit1 and i_bit2);\n\
 \n\
  -- Wires are just used to be explicit. \n\
 \n\
end rtl;"

// tristate buffer
gate[15] = "entity tristate is\n\
	port( A, enable : in std_logic;\n\
		Q : out std_logic);\n\
end tristate;\n\
\n\
architecture behavioural of tristate is\n\
begin\n\
	process (A, enable)\n\
	begin\n\
		if (enable = '1') then\n\
			Q <= A;\n\
		else\n\
			Q <= 'Z';\n\
		end if;\n\
	end process;\n\
end behavioural;"

// tristate vector

gate[16] = "ENTITY trin IS\n\
	GENERIC ( N : INTEGER := 8 );\n\
	port ( A 	: IN std_logic_vector(N-1 downto 0);\n\
			enable : in std_logic;\n\
			q : out std_logic_vector(n-1 downto 0)\n\
			);\n\
end trin;\n\
\n\
architecture behaviour of trin is\n\
begin\n\
process (A, enable)\n\
begin\n\
	if (enable = '1') then\n\
		Q <= A;\n\
	else\n\
		Q<= (others => 'z');\n\
	end if;\n\
end process;\n\
end behaviour;\n\
"

// memory entity
//slides lec16
gate[17] = "entity memory is\n\
generic ( S, N : integer := 16);\n\
port(\n\
		clock: in std_logic;\n\
		data : in std_logic_vector(15 downto 0);\n\
		write_addr: in std_logic_vector(N-1 downto 0;)\n\
		read_addr: in std_logic_vector(N-1 downto 0);\n\
		write_enable : in std_logic;\n\
		q : out std_logic_vector(15 downto 0)\n\
		);\n\
end;"


// next state

gate[18] = `ENTITY find_ns is\n\
port ( state: IN std_logic_vector(2 downto 0);\n\
reset: IN std_logic;\n\
next_state : OUT std_logic_vector(2 downto 0));\n\
END;\n\
\n\
ARCHITECTURE behavioural of find_ns is\n\
begin\n\
	process(state,reset) \n\
	begin\n\
		if reset = ‘1’ then\n\
			next_state <= “000”;\n\
		else\n\
			case state is \n\
				when "000"       =>   next_state <= “001”; \n\
				when "001"       =>   next_state <= “010”;\n\
				when "010"       =>   next_state <= “011”;\n\
				when "011"       =>   next_state <= “100”;\n\
				when "100"       =>   next_state <= “101”;\n\
				when "101"       =>   next_state <= “110”;\n\
				when "110"       =>   next_state <= “111”;\n\
				when others      =>   next_state <= “000”;\n\
			end case;\n\
		end if;\n\
	end process;\n\
END behavioural;`

gate[19] = `ENTITY find_ns is\n\
port ( state: IN std_logic_vector(2 downto 0);\n\
reset: IN std_logic;\n\
next_state : OUT std_logic_vector(2 downto 0));\n\
END;\n\
\n\
ARCHITECTURE behavioural of find_ns is\n\
begin\n\
	process(state,reset) \n\
	begin\n\
		if reset = ‘1’ then\n\
			next_state <= “000”;\n\
		else\n\
			next_state <= state + 1;
		end if;\n\
	end process;\n\
END behavioural;`

gate[20] = `ENTITY counter3bit is \n\
	port (   reset, clk: IN std_logic;\n\
		count : OUT std_logic_vector(2 downto 0)); \n\
END;\n\
\n\
ARCHITECTURE behavioural of counter3bit is\n\
	component find_ns\n\
		port (  state: IN std_logic_vector(2 downto 0); ;\n\
				reset: IN std_logic;\n\
			next_state : OUT std_logic_vector(2 downto 0)); \n\
	end component;\n\
	signal curr_s, ns : std_logic_vector(2 downto 0);\n\
\n\
begin\n\
	a: find_ns port map ( state => curr_s, reset => reset, next_state => ns);\n\
	PROCESS (clk) begin\n\
		if rising_edge(clk) then\n\
			curr_s <= ns;\n\
		end if;\n\
	END PROCESS;\n\
	count <= curr_s;\n\
END behavioural;`


//crosswalk

gate[21] = `ENTITY crosswalk is \n\
	port (    reset, b, t, clk: IN std_logic; \n\
		gyr : OUT std_logic_vector(2 downto 0);\n\
		gr : OUT std_logic_vector(1 downto 0);\n\
		tr: out std_logic ); \n\
END;\n\
\n\
ARCHITECTURE behavioural of crosswalk is\n\
	component find_ns\n\
		port ( state: IN std_logic_vector(1 downto 0);\n\
			b, t, reset: IN std_logic;\n\
			next_state : OUT std_logic_vector(1 downto 0));\n\
	END component;\n\
\n\
	component outputsig\n\
		port (state: IN std_logic_vector(1 downto 0);\n\
			gyr : OUT std_logic_vector(2 downto 0);\n\
			gr : OUT std_logic_vector(1 downto 0));\n\
		END component;\n\
\n\
signal state, ns : std_logic_vector(1 downto 0);\n\
\n\
begin\n\
	a: next_state port map ( state => state, b => b, t => t, reset => reset, next_state => ns);\n\
	b:  outputsig port map ( state => state, gyr => gyr, gr => gr, tr => tr);\n\
\n\
	PROCESS (clk) begin\n\
		if rising_edge(clk) then\n\
			state <= ns;\n\
		end if;\n\
	END PROCESS;\n\
END behavioural`

// moore state machine - output only function of the state
// mealy state machine - output function of the state and inputs
// add full adder and other circuits, latch flipflop counter

		document.getElementById("blob").innerHTML = gate[num + offset];


		// these statements dont work because javascript is a bad langauge
		// recommend using the js console/debugger

		//var blobvalue = "hello there general kenobi"

		//document.getElementById("blob").innerHTML = "hello";

</script>