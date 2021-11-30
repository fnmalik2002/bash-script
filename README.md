# Verify Apple DEP Enrollment Script

 Apple DEP (Now called MDM) is an Apple program to allow organizations to restrict the functionality of  their Apple computers according to their needs.
 
 A computer that is enrolled in DEP will always contact the servers in that organization to download and install their profile. This remains true even if you wipe the hard drive and reinstall operating system.
 
 
 This is a bash script to verify if Apple Computer is enrolled in DEP.
 
 There are two files. 
 The one with .sh extension is the actual script
 The one with .command extension is the same script but if you double click it then it will execute all its code line by line
 
 Make sure to run this script on a Mac before purchasing that Mac.
 
 Requirement:
 1- Run this script on a Mac running MacOS High Sierra or higher
 2- Make sure that Mac is connected to the internet before you run this script. It needs active internet connection to verify DEP status using Apple's own built-in terminal command.
