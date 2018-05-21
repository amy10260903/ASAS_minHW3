# ASAS_miniHW3 SuperCollider Basics

This week we hope to give you a simple and quick way to entering the world of SuperCollider (SC). After this simple tutorial and homework, we hopes you will learn 

  - Basic syntax of SC language
  - Debugging and tracing the codes
  - Capability to wrtie a very simple SC program by yourself

## Tutorial and Documents

  - Official SC document (http://doc.sccode.org/Help.html)
  - A Gentle Introduction to SC ()
  and its summary ()

## Installation
To install the SC, please refer to this page:
https://supercollider.github.io/download

Two things need to be installed:
* main program (v3.9.3)
* SC3-plugins (v3.9.0)

*Note that before installing the plugins, you sould open the SC programs at least once. Otherwise, the directory for putting the plugins won't be created. The path may be
```sh
C:\Users\<USERNAME>\AppData\Local\SuperCollider\Extensions
```
or
```sh
C:\ProgramData\SuperCollider\Extensions
```

## Introduction
### Server
Before Starting to write a SC program, you should knoe the concept
> Everything that you type in SuperCollider is in the SuperCollider language (the client): that’s where you write and execute commands, and see results in the Post window

> Everything that makes sound in SuperCollider is coming from the server—the “sound engine”, so to speak—, controlled by you through the SuperCollider language.

That is, if we want to play any sound by our sound card, we should first turn on a sever for it.
To open it, you can do it by 

<kbd>CTRL</kbd>+<kbd>B</kbd> or "Sever"->"Boot Sever"

If it is succesful, you will see some informations about your sound interface in the Post window.

### Output Message
You can use '.postln' to output message.
```SuperCollider
"Hello World".postln;
```
You can run it by <kbd>CTRL</kbd>+<kbd>Enter</kbd>.

### Code block
You can also run multiple lines ate the same time. For this, you should use parentheses to create a code block.
```SuperCollider
(
"The first line".postln;
", The second line".postln;
", and the third line".postln;
)
```
Now, you can run the lines by <kbd>CTRL</kbd>+<kbd>Enter</kbd>.

### Comments
Adding comments can help you and other who read your codes
```SuperCollider
(
// this is single-line commen.

/*This is
a 
multi-line comment*/
)
```

### Variables
You can store numbers, words, unit generators, functions, or entire blocks of code in variables. Variables can be single letters or whole words chosen by you. We use the equal sign (=) to “assign” variables. 
```SuperCollider
x = 10;
y = 660;
y; // check what's in there
x;
x + y;
y-x;
```
Often it will make more sense to give better names to your variables, to help you remember what they stand for in your code. You can use a ⇠ (tilde) to declare a variable with a longer name.
```SuperCollider
(
~myFreqs = [415, 220, 440, 880, 220, 990];
~myDurs = [0.1, 0.2, 0.2, 0.5, 0.2, 0.1];

Pbind(\freq, Pseq(~myFreqs), \dur, Pseq(~myDurs)).play;
)
```
Sometimes you will see ```var variable_name``` in some example codes. By this way, it declares a local variable named variable_name. Local variables only exist within the scope of that code block. That is, if you run the code
```SuperCollider
(
~galaApples = 4;
~bloodOranges = 5;
~limes = 2;
~plantains = 1;

["Citrus", ~bloodOranges + ~limes];
["Noncitrus",~plantains + ~galaApples];
 // Local variables: valid only within the code block.
 // Evaluate the block once and watch the Post window:
)
(
var apples = 4, oranges = 3, lemons = 8, bananas = 10;
["Citrus fruits", oranges + lemons].postln;
["Noncitrusfruits", bananas + apples].postln;
"End".postln;
)
~galaApples; // still exists
apples; // gone
```
The program throws an error about "apples" is not defined.

## PATTERNS
### Pbind
The definition from the official helps:
> Pbind combines several value streams into one event stream. Each value stream is assigned to one or more keys in the resulting event stream. It specifies a stream of Events in terms of different patterns that are bound to different keys in the Event. The patterns bound to keys are referred to as value patterns and the Pbind itself is termed an event pattern.

If you are confused about the definition of the Pbind, let's start from a simple example
```SuperCollider
Pbind(\degree, 0, \dur, 0.5).play;
```
This code means: we sent 0 to the parameter \degree to control the pitch and sent 0.5 to the parameter \dur to control the length of the note. Finally, play the note by ".play"

*Note that there are four different parameters for controling pitch: \degree, \midinote, \note and \freq. Please refer to the document part II 13.4.

### Pseq
Pseq. As the name might suggest, this pattern deals with sequences. All that Pseq needs in order to play a sequence is:
* a list of items between square brackets
* a number of repetitions
For example, if the code is:
```SuperCollider
Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1), \dur, 0.2).play;
```
In the example, the list is [0, 1, 2, 3, 4, 5, 6, 7], and the number of repeats is 1. This Pseq simply means: “play once all the items of the list, in sequence.”

### Prand
Prand is very similar to Pseq. But instead of playing through the list in sequence, Prand picks a random item from the list every time.
For example, try the codes and listen what's happen
```SuperCollider
(
Pbind(
\degree, Prand([2, 3, 4, 5, 6], inf),
\dur, 0.15,
\amp, 0.2,
\legato, 0.1
).play;
)
```
## mini-HW SuperCollider Basics
Please refer to "SC_HW.pdf".

* Q1: Please try to transcribe the famous folk songs "Twinkle Twinkle Little Star" in supercollider code with proper pitch, rythm and tempo. You can start from the code "Question1_starter.scd". Some simple exmaple in this code may also help you.

* Q2: Please refer to "SC-Problem2.pptx".

Please hand in your codes with proper comments.

* Bonus: Try to trace the code "Markov-algo.scd". Briefly explain the code and make the generating music more beautiful/interesting/euphonic..., etc.

For bonus, please hand in your modified code and a short PDF report in one page.
