setwd("~/Desktop/")
# \newacronym{<label>}{<abbrv>}{<full>}
# \newacronym{lvm}{LVM}{Logical Volume Manager}
df <- read.csv("new.csv")
label  <- tolower(df$Short)
label  <- ifelse(duplicated(df$Short) | duplicated(df$Short, fromLast=TRUE),
                   paste(df$Short, ave(df$Short, df$Short, FUN=seq_along),
                         sep='_'), df$Short)
abbrv  <- df$Short
full  <- df$Long
acro <- paste0("\\newacronym{", label, "}", "{" ,abbrv , "}", "{", full, "}")
write.table(acro,
            "acroRS.tex", sep = "\n", append = T,quote = F,
            row.names = F, col.names = F)
acro
