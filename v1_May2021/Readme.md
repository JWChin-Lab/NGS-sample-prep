v1: Published alongside W. Robertson et al., Science 372, 2021: 

Sense codon reassignment enables viral resistance and encoded polymer synthesis

Automated methods were created in Biomek v4.1 (Beckman Coulter) and associated deck layouts and project details and found in '.imp' files. Automation platform possessed onboard thermocycler and platereader; methods for accessing these platforms and automatically running analysis scripts are not included. These methods/screenshots are best utilised as a guide to replicate protocols on other automation platforms. 

1. 'gDNA extraction.bmf' method can be run standalone.

2. 'Qubit gDNA quantification.bmf' prepares plate for platereader to read fluorescence. 'Qubit 4.txt' is an example of platereader output file, which is analysed by Qubit_analysis.R. 

3. Qubit_analysis.R generates .csv files which can be read by 'Dilution after Qubit.bmf'.

4. Nextera XT Library Prep methods require plate centrifugation, as indicated by pauses, and thermocycler steps for tagmentation and PCR (not written in these methods). Methods must be run in order (i.e. 7a then 7b then 7c). 
