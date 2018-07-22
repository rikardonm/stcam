#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <wiringPi.h>
#include <chrono>
#include <thread>


const int stepDir = 9; //8;
const int stepPulse = 8; //9;


const int pulsePeriod = 10;

int main(int argc, char *argv[])
{
	if(argc != 3){
		std::cout << "wrong number of args!" << std::endl;
		return EXIT_FAILURE;
	}	
	int times = atoi(argv[1]);
	int dir = atoi(argv[2]);

	std::cout << "rotating " << times << " steps in XX direction!" << std::endl;

	wiringPiSetup();

//leds configuration
	pinMode(stepDir, OUTPUT);
	pinMode(stepPulse, OUTPUT);

// well, if it anit so. we need to set the corrent direction level
	digitalWrite(stepDir, dir);
	digitalWrite(stepPulse, LOW);

//init main object
	for(; times > 0; times--){
		digitalWrite(stepPulse, HIGH);
		std::this_thread::sleep_for(std::chrono::milliseconds(pulsePeriod));
	// wait a moment?...
		digitalWrite(stepPulse, LOW);
		std::this_thread::sleep_for(std::chrono::milliseconds(pulsePeriod));
	}
	return EXIT_FAILURE;
}



