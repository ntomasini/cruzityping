#Colab for Trypanosoma cruzi Typing

This notebook is designed for an easy run of bioinformatic steps for Trypanosoma cruzi DTU typing using mHVR amplicon sequencing (see the related publication).

Steps:

1. Load .fastq files into a folder in your Google Drive. All ".fastq" reads (you should have R1 and R2 files for each sample) in the folder will be analyzed. Make sure there are no other ".fastq" files in the folder. Ensure that file names end with "R1.fastq" and "R2.fastq" for each sample.
2. Mount your Google Drive in the Colab at the left panel (click on the folder icon and then on the folder with the Google Drive icon).
Set Parameters:

3. Set the "folder" parameter name as the folder in your Google Drive.
4. Set the reference set (85 or 95).
5. Press Ctrl + F9 to run all cells or run each one at a time by clicking on the play button to the left of each cell.
6. The summary will be printed in the last cell. Additionally, you can find the results in your Google Drive. The results should be in the folder "Typing_Results" within the folder you specified in Google Drive.

Important If a step was interrupted by colab desconection you can restart from it by previously playing the Set Parameters Cell
