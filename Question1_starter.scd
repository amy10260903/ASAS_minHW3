// Using pbind to coding your score
// In this question you are asked to write a piano score into the supercoilder code
// You will learn how to set the tempo and the tomes properly
// NOTE: don't forget ; in each end of command

//Q1: Paly the ascending C scale in 80 bpm

(
~bpm = 80/60; //calculate the proper value for 80 bpm. For example, 1 is for 60bpm and
          //2 is for 120bpm
~asc_scale = Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7]),\dur, 1);
)
~asc_scale.play(TempoClock(~bpm)); //play the note

//Q2 Now, let's try to play the scale in
//[Q,Q,H,Q,Q,H,Q,Q], where Q means quarter notes and H means half notes
(
~rythm = [1, 1, 2, 1, 1, 2, 1, 1];//calculate the proper value for 80 bpm
~asc_scale = Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7]),\dur, Pseq(~rythm));
)
~asc_scale.play(TempoClock(~bpm));


//Q3 change the tones as a descending C scale
(
~tones = [7, 6, 5, 4, 3, 2, 1, 0];// fill the proper number for the descending scale
~dsc_scale = Pbind(\degree, Pseq(~tones),\dur, Pseq(~rythm));
)
~dsc_scale.play(TempoClock(~bpm));

// Q4 Now, you can transfer the printed score to supercolider code
// Let's try to write Twinkle Twinkle Little Star in C major and 100 bpm
// Do Do So SO La La So-
(
~right_str = 0.5;    //Dynaminc coefficient for the right hand
~star_bpm = ;
~star_right_tone = ;
~star_right_rythm = ;
~star_right = Pbind(
	\degree, Pseq(~star_right_tone),
	\dur, Pseq(~star_right_rythm),
	\amp, ~right_str
);
)
~star_right.play(TempoClock(~star_bpm));

//Q5 You can also write the left-hand part. Since the rythm is fixed
//we can simplify the code by the "repeat" arguement in Pseq
(
~left_str = 0.4;    //Dynaminc coefficient for the left hand
~star_left_tone = ;
~star_left_rythm = ;
~star_left = Pbind(

);
)

// Let's playing the Twinkle Twinkle Little Star in piano sound!
(
~star_right.play(TempoClock(~star_bpm));
~star_left.play(TempoClock(~star_bpm));
)


