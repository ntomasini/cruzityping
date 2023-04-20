# Load the required library
library("readr")

# Display instructions for the user
instructions <- 'This algorithm use a frequency table of of different mHVR clusters in a set of strains to simulate PCR bias in the frequencies and to address theoretical sensitivities and specifities. Use a Qiime Table of OTUs: remove #, copy to Excel, sort strains by lineage, and paste back into a text editor without the taxonomy column. Then, save the file as .txt'
print(instructions)

# Read user inputs
num_molecules <- as.integer(readline("Enter the number of starting DNA molecules: "))
efficiency <- as.double(readline("Enter PCR efficiency using format 0.x: "))
num_reps <- as.integer(readline("Enter the number of replicates: "))

# Load the strains data from a file
strains <- read.table(file.choose(), skip = 1, header = TRUE, sep = '\t')

# Loop through strains
for (strain_index in 2:length(strains[1,])) {
  dilution <- matrix(strains[, 1])
  dilution <- cbind(dilution, strains[, strain_index])

  # Loop through replicates
  for (replicate_index in 1:num_reps) {
    diluted_replicate <- rmultinom(1, num_molecules, strains[, strain_index])
    dilution <- cbind(dilution, diluted_replicate)

    # Loop through PCR steps
    for (pcr_step_index in 1:10) {
      num_molecules_produced <- rbinom(1, sum(dilution[, replicate_index + 2]), efficiency) # Determine the number of molecules produced according to efficiency
      PCR_step <- rmultinom(1, num_molecules_produced, dilution[, replicate_index + 2])
      dilution[, replicate_index + 2] <- PCR_step + dilution[, replicate_index + 2] # Update the frequency of each cluster after the PCR step
    }
  }

  # Save the dilution data to a file
  write.table(dilution, paste("file", colnames(strains)[strain_index], ".txt"), append = FALSE, sep = "\t", dec = ".",
              row.names = TRUE, col.names = TRUE)
  dilution <- NULL
}
