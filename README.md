Tracebot manual

Connect laptop PC power, 3-axis stage power, pump power (for Bartel’s pumps), and USB from stage and pump to PC.

Install environment for running tracebot:

Mount (or access) network drive that microscope PC also can access.

Duplicate configs/robot_config_template.yaml then rename the new file to make a custom config file. Change parameters in file as needed, most parameters should be documented in template config file. COM ports can be verified in Device Manager on the laptop. 

Install miniconda for the OS on your PC (https://docs.conda.io/en/latest/miniconda.html).
Open Anaconda prompt (miniconda3) in the start menu.
Upon first run:

```
cd /path/to/shared/folder
git clone https://git.embl.de/grp-ellenberg/tracebot
conda create env –f tracebot/environment.yml –p /path/to/local/env
```

Upon first and all subsequent runs:
```
cd /path/to/shared/folder
conda activate /path/to/local/env
python tracebot/mw_pump_gui.py
```
 

 
In the GUI, select the custom config file created earlier, and press “Initialize robot”. If all is correct, stage and pump should connect.

Test the pump by setting a time (e.g. 10 s) and pressing Pump cycle.

Before moving the stage the first time, press “Zero stage”.

If 3-axis stage is not already above well A1, manually screw the z-axis screw upward until ~1-2 mm from top. Can do this by controlling the z, y and x with the small remote control (will disconnect from PC when you do this though), or manually driving the stage (but be careful not to crash!).

Press “Zero stage”.

Manually screw (or carefully drive using coordinates maintaining z=0 and adjusting x and y) until inlet is just above well A1 in the 96-well plate (upper right corner on stage base when facing the stage).

Press “Zero stage” again. 

The calibration and custom positions can be tested using “Move to position”.

Once the stage, pump and sequential setup have been verified, press “Start robot” to run the sequence. 

Unchecking “Restart?” will let the robot continue at the previously selected well from an earlier run rather than at the first well indicated in the configuration file. 

“Stop robot” will allow halting the sequence at any point after the completion of the current command. Note however that upon restarting, the sequence will restart at the first command of the sequence, although the correct well plate position will be continued if unchecking “Restart?” as above.
