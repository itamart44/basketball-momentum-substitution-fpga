# Fitness Formula – Version 1.0

This formula defines the expected performance level ("Fitness") of each player before the game.  
It combines two components:
1. Base fitness (entered by the user)
2. Role-based expectation (how important the player is to the team)

The purpose is to create a clear, predictable baseline to compare against real-time momentum.

---

## 1. Base Fitness (User Input)

Before the game, the user enters a fitness rating from 1 to 10 for each player.

This represents:
- physical condition  
- fatigue level  
- recent performance  
- mental readiness  

To match the scale of the momentum score, the fitness input is scaled:

**BaseFitnessValue = FitnessInput × 5**

This places base fitness in the range of 5 to 50, similar to momentum values.

---

## 2. Role Expectation Factor (RoleFactor)

Each player has a different level of expected contribution.  
We define four role categories:

- Star Player → RoleFactor = 1.4  
- Key Player → RoleFactor = 1.2  
- Role Player → RoleFactor = 1.0  
- Bench Player → RoleFactor = 0.8  

Role-adjusted fitness:

**RoleAdjustedFitness = BaseFitnessValue × RoleFactor**

---

## 3. Team Fitness Comparison (Relative Fitness)

To evaluate a player relative to teammates, we compute the team’s total fitness:

**TeamFitnessTotal = F1 + F2 + F3 + F4 + F5**

Where each Fi is the BaseFitnessValue of a player on the court.

Instead of division (not ideal for FPGA), we use this comparison:

**RelativeFitness = BaseFitnessValue × 5 − TeamFitnessTotal**

Interpretation:  
- Positive → above team fitness level  
- Negative → below team fitness level  

---

## 4. Final Fitness Score

Combining personal fitness, role expectation, and team-relative fitness:

**FinalFitness = RoleAdjustedFitness + RelativeFitness**

This score represents the player's overall readiness, expected contribution,  
and how his condition compares to teammates.






