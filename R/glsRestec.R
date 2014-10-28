glsRestec  <- function(url, short = "//dt", long = "//dd"){
        require(XML)
        doc  <- htmlParse(url)
        short.l  <- XML::xpathApply(doc, short)
        s  <- sapply(short.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        short <- s[!(is.na(s) | s=="\n")]
        long.l  <- xpathApply(doc, long)
        l  <- sapply(long.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        long <- l[!(is.na(l) | l=="\n")]
        if(length(long == short)){
                gls.d  <- data.frame(cbind(short, long))
                return(gls.d)
        } else {
                stop("the length of short and long is diff, please check")
        }


}
url  <- c("http://www.restec.or.jp/english/knowledge/glossary.html")
x  <- glsRestec(url)
pre  <- "http://www.restec.or.jp/english/knowledge/glossary"
suf  <- c("","-bc","-de","-fh","-ik","-ln","-oq","-rs","-tu","-vz","-09")
url.l  <- paste0(pre, suf, ".html")

df.l  <- sapply(url.l, gls.restec)
df.d  <- do.call(rbind, df.l)
d2  <- df.l[[7]]
