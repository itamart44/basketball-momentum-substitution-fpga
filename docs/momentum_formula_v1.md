# Momentum Formula – Version 1.1

This version includes improved weighting for in-game events, separation between 1/2/3-point field goals, normal fouls vs. offensive fouls, and new categories such as drawn fouls and and-1 plays.

---

## Positive Actions

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

---

## Negative Actions

**Missed Shot:** -1  
**Turnover:** -2  
**Foul (regular):** -1  
**Offensive Foul:** -3  

---

## Notes

- The formula uses simple arithmetic operations suitable for FPGA implementation.  
- Weights follow basketball momentum logic: high-impact events get higher values.  
- Offensive fouls and turnovers reduce momentum significantly.  
- This is an early version — adjustments will be made as the project grows.
