# Batteries 🔋

Here I came up with an idea to recharge AA Lithium-ion batteries using old alkaline batteries in series, however I learned along the way about internal resistance, DC to DC converter limitations, and safety protocols.

* [usable_voltage.py](https://github.com/007kev/STEP/blob/main/Batteries/usable_voltage.py)

Knowing the voltage threshold for a specific device you can estimate how much life is in a battery using this graph.

<iframe src="./images/usable_voltage_vs_internal_resistance.pdf" width="100%" height="600px">
  This browser does not support PDFs. Please download the PDF to view it: <a href="./images/usable_voltage_vs_internal_resistance.pdf">Download PDF</a>
</iframe>


Using the loaded and unloaded voltage, plus a 10 ohm resisitor I was able to calculate which batteries were usable(above threshold) and how many in series I would need to power smaller electronics (0.1A - 0.5A of current draw).


I soldered a 10ohm resistor to the terminals of the battery housing to get an accurate current draw.
![Loaded Voltage Measurement](./images/v_load_resistor.jpeg)

I used the housing of the line following robot for the larger AA batteries.
![Modifying Line Following Robot Battery Housing](./images/v_load_housing.jpeg)

