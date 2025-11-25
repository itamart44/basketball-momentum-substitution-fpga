# Momentum Formula – Version 1.1

This version includes improved weighting for in-game events, separation between 1/2/3-point field goals, normal fouls vs. offensive fouls, and new categories such as drawn fouls and and-1 plays.

---

## Personal Momentum

**Free Throw (1pt):** +1  
**2-Point Field Goal:** +3  
**3-Point Field Goal:** +4  
**And-1 Bonus:** +2  
**Offensive Rebound:** +2  
**Defensive Rebound:** +1  
**Steal:** +3  
**Block:** +2  
**Assist:** +1  
**Drawn Foul:** +1  

**Missed Shot:** −1  
**Turnover:** −2  
**Foul (regular):** −1  
**Offensive Foul:** −3  

---

## Team Momentum (Relative Team Comparison)

To understand how a player's momentum compares to the rest of the team, we compute the total team momentum:

**TeamTotalMomentum = M1 + M2 + M3 + M4 + M5**

Where Mi is the personal momentum score for each player on the court.

To avoid division (which is not ideal for FPGA), we use the following comparison:

**TeamRelativeMomentum = PersonalMomentum * 5 − TeamTotalMomentum**

Interpretation:  
- Positive → player is performing above team level  
- Negative → player is below team level  
- Strongly positive → player is driving team momentum  
- Strongly negative → player is lowering team momentum  

---

## Final Momentum Score (Combined)

We combine personal momentum and team-relative momentum:

This gives a complete score that reflects both the player's individual performance and his impact relative to the rest of the team.


