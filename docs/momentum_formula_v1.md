# Momentum Formula – Version 1.1

This formula defines how a player's live game events translate into a momentum score.  
The momentum score reflects how “hot” or “cold” the player is during the game —  
and later will be compared to fitness and team momentum.

---

## 1. Personal Momentum (Per-Player Score)

Positive actions:

- Free Throw (1pt) → **+1**  
- 2-Point Field Goal → **+3**  
- 3-Point Field Goal → **+4**  
- And-1 Bonus → **+2**  
- Offensive Rebound → **+2**  
- Defensive Rebound → **+1**  
- Steal → **+3**  
- Block → **+2**  
- Assist → **+1**  
- Drawn Foul → **+1**

Negative actions:

- Missed Shot → **−1**  
- Turnover → **−2**  
- Foul (regular) → **−1**  
- Offensive Foul → **−3**

The personal momentum score is the sum of all the weighted events.

---

## 2. Team Momentum (Relative Team Comparison)

To understand how a player’s momentum compares to the rest of the team on the court,  
we compute the total team momentum including all 5 active players:

**TeamTotalMomentum = M1 + M2 + M3 + M4 + M5**

Where each Mi is the personal momentum of one player.

To avoid division (not ideal for FPGA hardware),  
we use the following scaled comparison:

**TeamRelativeMomentum = PersonalMomentum × 5 − TeamTotalMomentum**

Interpretation:

- Positive → player is performing above team momentum  
- Negative → player is below team momentum  
- Strong positive → player is driving the team  
- Strong negative → player is dragging the team down  

---

## 3. Final Momentum Score (Combined)

We combine both components to get a complete momentum evaluation:

**FinalMomentum = PersonalMomentum + TeamRelativeMomentum**

This final score represents:

- the player's individual performance  
- their momentum relative to teammates  
- their overall impact on the game's energy flow  

This score will later be compared with the fitness score  
to help determine substitution timing.
