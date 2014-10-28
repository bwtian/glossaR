glsXML  <- function(url, short = "//dt", long = "//dd"){
        require(XML)
        doc  <- htmlParse(url)
        short.l  <- XML::xpathApply(doc, short)
        s  <- sapply(short.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        s  <- str_trim(s)
        short <- s[!(is.na(s) | s=="" | s=="\n")]
        long.l  <- xpathApply(doc, long)
        l  <- sapply(long.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        l  <- str_trim(l)
        long <- l[!(is.na(l) | l=="" | l=="\n")]

        gls.d  <- data.frame(cbind(short, long))
        return(gls.d)
}
url  <- c("http://www.restec.or.jp/english/knowledge/glossary.html")
x  <- glsXML(url)
pre  <- "http://www.restec.or.jp/english/knowledge/glossary"
suf  <- c("","-bc","-de","-fh","-ik","-ln","-oq","-rs","-tu","-vz","-09")
url.l  <- paste0(pre, suf, ".html")

df.l  <- lapply(url.l, glsXML)
df.d  <- as.data.frame(do.call(rbind, df.l))

org  <- paste0("** ", df.d[,1],":", df.d[,2])
org
write.table(org,
            "test.org", sep = "\n", append = T,quote = F,
            row.names = F, col.names = F)
getwd()
library(stringr)
