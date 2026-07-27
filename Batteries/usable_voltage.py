"created by Kevin Arias on 2023-06-15"
# A graph to visualize a batteries internal resistance and usable voltage
#%%

import matplotlib.pyplot as plt
import numpy as np

# 1. Define range of internal resistance (0.1 ohms to 7.0 ohms)
R_total = np.linspace(0.1, 7.0, 100)

# 2. Define different current draw scenarios (Amps)
currents = [0.1, 0.25, 0.5, 1.0]

# 3. Initial open-circuit voltage of battery bank
V_initial = 1.5  # e.g., 1.5V total input

plt.figure(figsize=(8, 5))

for I in currents:
    V_usable = V_initial - (I * R_total)
    plt.plot(R_total, V_usable, label=f"Current Draw I = {I} A")

# Minimum threshold line for boost converter shutdown
plt.axhline(0.9, color="red", linestyle="--", label="Min Boost Threshold (0.9V)")

plt.title("Usable Voltage vs. Internal Resistance (Initial Voltage = 1.5V)")
plt.xlabel("Total Internal Resistance (Ω)")
plt.ylabel("Usable Voltage (V)")
plt.ylim(0, 1.6)
plt.grid(True, linestyle=":", alpha=0.7)
plt.legend()
plt.show()
plt.savefig("usable_voltage_vs_internal_resistance.pdf")

#%%
# inputs

import itertools

v_unloaded = [1.42, 1.12, 1.09, 0.34, 1.15, 1.183, 1.101, 1.1, 1.13, 1.067, 1.23]
v_loaded =   [1.03, 0.70, 0.80, 0.04, 0.75, 0.90, 0.474, 0.69, 0.727, 0.750, 0.736]

R_load = 10 #ohms
I_draw = 0.1 #A
Threshold = 0.9 #V

# processing

batteries = [] # list to store battery data for later

for idx, (v_u, v_l) in enumerate(zip(v_unloaded, v_loaded), start=1):
    i_load = v_l / R_load 
    r_int = (v_u - v_l) / i_load

    # structure as object to store battery data
    batteries.append({
        'id': f"Battery {idx}",
        'v_unloaded': v_u,
        'r_int': r_int
    })

valid_combinations = []

for combo in itertools.combinations(batteries, 3):
    total_v_unloaded = sum(b['v_unloaded'] for b in combo)
    total_r_int = sum(b['r_int'] for b in combo)

    v_usable = total_v_unloaded - (I_draw * total_r_int)

    if v_usable >= Threshold:
        valid_combinations.append({
            'batteries': [b['id'] for b in combo],
            'total_r_int': total_r_int,
            'total_v_unloaded': total_v_unloaded,
            'v_usable': v_usable
        })


# outputs


sorted_combos = sorted(valid_combinations, key=lambda x: x['total_r_int'])

top_3 = sorted_combos[:3]

print("---Battery Analysis---")
for b in batteries:
    print(f"{b['id']}: V_open = {b['v_unloaded']:.2f}V | R_internal = {b['r_int']:.3f} Ω")

print(f"\n---AA: Top 3 lowest internal resitances above 0.9V usable---")
for rank, combo in enumerate(top_3, start=1):
    bat_names = " + ".join(combo['batteries'])
    print(f"Rank {rank}: {bat_names}")
    print(f"   |--Total R_internal : {combo['total_r_int']:.3f} Ω")
    print(f"   |--Total V_unloaded : {combo['total_v_unloaded']:.2f} V")
    print(f"   |--Usable V : @ {I_draw}A : {combo['v_usable']:.2f} V")
    print()
# %% Now for AAA batteries

v_unloaded = [1.368, 1.077, 0.36, 1.365, 0.113, 1.09, 1.40, 1.399, 1.399]
v_loaded =   [1.161, 0.660, 0.008, 1.217, 0.017, 0.63, 1.12, 1.112, 1.179]

R_load = 10 #ohms
I_draw = 0.5 #A
Threshold = 0.9 #V

# processing

batteries = [] # list to store battery data for later

for idx, (v_u, v_l) in enumerate(zip(v_unloaded, v_loaded), start=1):
    i_load = v_l / R_load 
    r_int = (v_u - v_l) / i_load

    # structure as object to store battery data
    batteries.append({
        'id': f"Battery {idx}",
        'v_unloaded': v_u,
        'r_int': r_int
    })

valid_combinations = []

for combo in itertools.combinations(batteries, 3):
    total_v_unloaded = sum(b['v_unloaded'] for b in combo)
    total_r_int = sum(b['r_int'] for b in combo)

    v_usable = total_v_unloaded - (I_draw * total_r_int)

    if v_usable >= Threshold:
        valid_combinations.append({
            'batteries': [b['id'] for b in combo],
            'total_r_int': total_r_int,
            'total_v_unloaded': total_v_unloaded,
            'v_usable': v_usable
        })


# outputs


sorted_combos = sorted(valid_combinations, key=lambda x: x['total_r_int'])

top_3 = sorted_combos[:3]

print("---Battery Analysis---")
for b in batteries:
    print(f"{b['id']}: V_open = {b['v_unloaded']:.2f}V | R_internal = {b['r_int']:.3f} Ω")

print(f"\n---AAA: Top 3 lowest internal resitances above 0.9V usable---")
for rank, combo in enumerate(top_3, start=1):
    bat_names = " + ".join(combo['batteries'])
    print(f"Rank {rank}: {bat_names}")
    print(f"   |--Total R_internal : {combo['total_r_int']:.3f} Ω")
    print(f"   |--Total V_unloaded : {combo['total_v_unloaded']:.2f} V")
    print(f"   |--Usable V : @ {I_draw}A : {combo['v_usable']:.2f} V")
    print()

# %%

