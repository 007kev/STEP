# First 3D Prints 🖨️

OpenSCAD is an open source 3d modeling software based on C++ that I am starting off with to enhance my projects


### Speaker Enclosure 

My first project is to redesign the enclosure for a bluetooth speaker kit from Amazon. The clear acrylic is assembled using M2 bolts and captive nut joints. 

![Speaker Front](./images/speaker_OG.png)

On OpenSCAD, I was able to design a sturdier compartment for some of the components from the original kit. I used the original bluetooth module and amplifier. However, I used a pair of Bose speakers from a Soundlink Mini 2 that I salvaged from the e-recycling bin. The electrical impedance matches that of the original speakers but the power rating is higher. So the speaker performs safely for low to medium volumes but at higher volumes it sounds distorted due to clipping. 

![Speaker Shell](./images/speaker_openSCAD.png)

I coded basic algebra and geometry on the C++ based software to make a shell and lid design that was not only thicker but also correctly fit the new speakers with bigger magnets. I only highlighted in red some of the shapes that were removing material, it was programmed using a difference() function.

The code can be read;
* [here](https://github.com/007kev/STEP/blob/main/3D_prints/speaker_shell.scad)

Measurments were done on a Chicago Brand vernier caliper to get within 0.02mm of measurement. Since, my Bambu labs A1 Mini has a stock nozzle diameter of 0.4mm this results in a 5% relative uncertainty.

![Speaker Shell](./images/speaker_front.png)

For portability; a 3D printed three AA battery compartment wired in series to a 5V dc - dc converter in series again to a switch in the back.

![Speaker Inside](./images/speaker_inside.jpeg)

![Speaker Back](./images/speaker_back.png)

