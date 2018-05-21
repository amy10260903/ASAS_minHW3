// Consturct a simple algorithmic music by markov chain
// You don't need to impement the whole codes by yourself.
// You only need to understand how to set the parameters and make it more reasonable
// the original code is from:
// https://composerprogrammer.com/teaching/supercollider/sctutorial/9.1%20Algorithmic%20Strategies.html

//sound generator
(
SynthDef(\acsound,{|freq=440,amp=0.1,dur= 0.2,cutoff=2000|
var sound, filter;
sound= Saw.ar(freq, amp)*EnvGen.kr(Env([0,2,3,0],[0.08,0.12,(dur.max(0.07))-0.06]),doneAction:2);
filter= LPF.ar(sound,Line.kr(cutoff,50,dur));
Out.ar(0,filter.dup(2))
}).add;
)

(
var markovmatrix1, markovmatrix2; // define the transition probability for tone and duration
var tone_seed = [60,62,64,67,69].midicps;    // The possible tones. It uses midicps to convert the midi note number to frequency
var dur_seed = [0.25,0.5,0.75] * 3;     // The possible duration.
var currentstate=5.rand; //initial state for the states of tones
var currentstate2=3.rand; //initial state for the states of tones
markovmatrix1= [
	[0.0,0.25,0.25,0.25,0.25],
	[0.0,0.1,0.3,0.3,0.3],
	[0.05,0.2,0.3,0.05,0.3],
	[0.1,0.3,0.3,0.15,0.15],
	[0.1,0.3,0.3,0.15,0.15]
];
markovmatrix2= [
	[0,0.8,0.2],
	[0.8,0.0,0.2],
	[0.2,0.5,0.3],
];

{
	inf.do{       //Number of generated notes. "inf" means that it will not be terminated
			Synth(\acsound,[\freq, tone_seed.at(currentstate),\dur,dur_seed.at(currentstate2)]);
			//which probability distribution to use depends on what state we're in right now
		    dur_seed.at(currentstate2).wait;
		    //Do the trnasition of the states
			currentstate = [0,1,2,3,4].wchoose(markovmatrix1[currentstate]);
		    currentstate2 = [0,1,2,3,4].wchoose(markovmatrix2[currentstate2]);
			};
}.fork;
)


