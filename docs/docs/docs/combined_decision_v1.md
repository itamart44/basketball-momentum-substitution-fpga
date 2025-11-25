# Combined Decision Score – Version 1.0

This formula combines the momentum and fitness models into a single decision score  
that helps determine whether a player should stay on the court or be substituted.

It stays simple on purpose so it can be implemented on an FPGA with basic arithmetic only.

---

## 1. Core Comparison: Momentum vs. Fitness

First, we compare the live in-game performance to the pre-game expectation:

**Delta = FinalMomentum − FinalFitness**

- Positive Delta → player is performing above expectation  
- Around zero → player is performing as expected  
- Negative Delta → player is performing below expectation  

This is the base of the decision.

---

## 2. Foul Penalty (FoulImpact)

Fouls directly affect substitution decisions.  
We keep a simple model:

- Each regular foul: −2  
- Each offensive foul: −3  

**FoulPenalty = −2 × RegularFouls − 3 × OffensiveFouls**

This gives a stronger penalty for offensive fouls,  
which usually hurt both possession and team momentum.

---

## 3. Fatigue Penalty (Minutes on Court)

Playing too many consecutive minutes increases fatigue.  
We use 3 simple ranges (easy for FPGA implementation):

- If MinutesOnCourt ≤ 6 → **FatiguePenalty = 0**  
- If 7 ≤ MinutesOnCourt ≤ 12 → **FatiguePenalty = −5**  
- If MinutesOnCourt > 12 → **FatiguePenalty = −10**  

This encourages short rests for players who stay on the floor too long.

---

## 4. Final Decision Score

All components are combined:

**FinalDecisionScore = Delta + FoulPenalty + FatiguePenalty**

This represents:
- live performance vs. expectation  
- foul trouble impact  
- basic fatigue effect  

---

## 5. Decision Logic (Substitution Recommendation)

Using the final score, the system can output a simple recommendation:

- If **FinalDecisionScore ≥ +20** → **HOT – keep on court**  
- If **+5 ≤ FinalDecisionScore < +20** → **Playing well – recommended to keep**  
- If **−5 < FinalDecisionScore < +5** → **Neutral – no forced change**  
- If **−20 < FinalDecisionScore ≤ −5** → **Below expectation – suggested rest**  
- If **FinalDecisionScore ≤ −20** → **Strong negative impact – must substitute**

These thresholds can be tuned later based on testing and real game scenarios.
