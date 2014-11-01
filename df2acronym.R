setwd("~/Desktop/")
# \newacronym{<label>}{<abbrv>}{<full>}
# \newacronym{lvm}{LVM}{Logical Volume Manager}
df <- read.csv("new.csv")
label  <- tolower(df$Short)
abbrv  <- df$Short
full  <- df$Long
acro <- paste0("\\newacronym{", label, "}", "{" ,abbrv , "}", "{", full, "}")
write.table(acro,
            "acroRS.tex", sep = "\n", append = T,quote = F,
            row.names = F, col.names = F)
df2acro <- function(df,){


}
