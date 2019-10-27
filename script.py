import sqlite3

init = "username char NOT NULL, password char NOT NULL, rightkmap integer, wrongkmap integer, totalkmap integer, recentkmap integer," \
													   "rightkmap2 integer, wrongkmap2 integer, totalkmap2 integer, recentkmap2 integer," \
													   "rightkmap3 integer, wrongkmap3 integer, totalkmap3 integer, recentkmap3 integer," \
													   "rightkmap4 integer, wrongkmap4 integer, totalkmap4 integer, recentkmap4 integer," \
													   "rightvhdl integer, wrongvhdl integer, totalvhdl integer, recentvhdl integer," \
													   "rightvhdl2 integer, wrongvhdl2 integer, totalvhdl2 integer, recentvhdl2 integer," \
													   "rightvhdl3 integer, wrongvhdl3 integer, totalvhdl3 integer, recentvhdl3 integer," \
													   "rightvhdl4 integer, wrongvhdl4 integer, totalvhdl4 integer, recentvhdl4 integer," \
													   "rightvhdl5 integer, wrongvhdl5 integer, totalvhdl5 integer, recentvhdl5 integer"
													  #"rightfsm integer, wrongfsm integer, totalfsm integer, "
													  #"rightfsm2 integer, wrongfsm2 integer, totalfsm2 integer, "
													  #"rightfsm3 integer, wrongfsm3 integer, totalfsm3 integer, "
													  #"rightfsm4 integer, wrongfsm4 integer, totalfsm4 integer"

fields = "(username, password, rightkmap, wrongkmap, totalkmap, recentkmap,"  \
							  "rightkmap2, wrongkmap2, totalkmap2, recentkmap2," \
							  "rightkmap3, wrongkmap3, totalkmap3, recentkmap3," \
							  "rightkmap4, wrongkmap4, totalkmap4, recentkmap4," \
							  "rightvhdl, wrongvhdl, totalvhdl, recentvhdl," \
							  "rightvhdl2, wrongvhdl2, totalvhdl2, recentvhdl2," \
							  "rightvhdl3, wrongvhdl3, totalvhdl3, recentvhdl3," \
							  "rightvhdl4, wrongvhdl4, totalvhdl4, recentvhdl4," \
							  "rightvhdl5, wrongvhdl5, totalvhdl5, recentvhdl5)"
							 #"rightfsm, wrongfsm, totalfsm, recentfsm,"
							 #"rightfsm2, wrongfsm2, totalfsm2, recentfsm2,"
							 #"rightfsm3, wrongfsm3, totalfsm3, recentfsm3,"
							 #"rightfsm4, wrongfsm4, totalfsm4)"
#values = "0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0"
values = "0, " * ( (4 * 9) - 1) + "0"
#could use python to multiply the zeros

conn = sqlite3.connect('data.db') # Warning: This file is created in the current directory
conn.execute("CREATE TABLE data (id INTEGER PRIMARY KEY, {})".format(init))
conn.execute("INSERT INTO data {} VALUES ('global', 'spacebar', {})".format(fields, values))
conn.execute("INSERT INTO data {} VALUES ('anonymous', 'telephone', {})".format(fields, values))
conn.commit()

#print(values)

# strange results below

# x = 0
# y = '0'
# for y in values:
# 	x += 1

#print(x)

# Should we have a field for total? or should we just add right and wrong when we need a total?
# for now so we dont break everything leave it as total
# try and make username unique