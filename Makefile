CSTD = -std=c++11
FLAGS = -lz -ldl -pthread $(CSTD) -Wall
WIRINGPI = -lwiringPi

MAKETMPCMD = g++ -c $(CSTD) -o $@ $<


default: movex.out

.PHONY: fuck.o
fuck.o: moveXsteps.cpp
	$(MEKTMPCMD)

LINKTMPCMD = g++ $(FLAGS) -o $@ $^

movex.out: moveXsteps.cpp
	g++ -c $(CSTD) -o fuck.o $<
	g++ $(FLAGS) $(WIRINGPI) -o $@ fuck.o




