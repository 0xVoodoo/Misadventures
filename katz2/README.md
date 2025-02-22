# Katz^2
Katz Squared is a small python parser for Mimikatz log files, allowing for username/hash combos to be written to txt files, ready for use with Hashcat (you get the joke yet?) or John.

---

Usage: `katz2.py [-h] -f/--file -m/--mode`
-
**Modes:** 
 - logonpasswords - Used for files containing the output of the mimikatz module of the same name.
 - cache -- Used for files containing the output of the lsadump::cache mimikatz module
 ---
 **License:**
 
 GPLv3 as all good software should be.
