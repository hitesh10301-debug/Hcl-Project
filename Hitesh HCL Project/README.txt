Linux File Permission Demonstration - source code
Student : Hitesh Solanki
Admission no.: 2026B01010448
Course  : BTech (CSE), 1st Year - HCL Practice Program, ABES Engineering College

Files
  permission_demo.sh  - safe Bash helper script. Creates practice files in a
                        temporary folder, runs chmod (symbolic and numeric),
                        prints ls -l / stat output and deletes the folder.
                        It does not use chown or sudo.

How to run (Kali Linux / any Linux VM)
  chmod +x permission_demo.sh
  ./permission_demo.sh

The chown part of the practical is done manually in the terminal (it needs
sudo) - see Appendix A of the project report for the full command list.
