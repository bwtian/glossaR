#'
#' @example
#' url  <- c("http://www.restec.or.jp/english/knowledge/glossary.html")
#' df  <- glsXML(url)
#'
glsXML  <- function(url, short = "//dt", long = "//dd"){
        require(XML, stringr)
        doc  <- htmlParse(url)
        short.l  <- XML::xpathApply(doc, short)
        s  <- sapply(short.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        s  <- lapply(s, str_trim)
        s  <- lapply(s, function(x) str_c(x, collapse = " "))
        short <- s[!(is.na(s) | s=="" | s=="\n")]
        long.l  <- xpathApply(doc, long)
        l  <- sapply(long.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        l  <- lapply(l, str_trim)
        l  <- lapply(l, function(x) str_c(x, collapse = " "))
        long <- l[!(is.na(l) | l=="" | l=="\n")]
        gls.d  <- as.data.frame(cbind(short, long))
        return(gls.d)
}
pre  <- "http://www.restec.or.jp/english/knowledge/glossary"
suf  <- c("","-bc","-de","-fh","-ik","-ln","-oq","-rs","-tu","-vz","-09")
url.l  <- paste0(pre, suf, ".html")

df.l  <- lapply(url.l, glsXML)
df.d  <- as.data.frame(do.call(rbind, df.l))

org  <- paste0("** ", df.d[,1],": ", df.d[,2])
org
write.table(org,
             "test.org", sep = "\n", append = T,quote = F,
                row.names = F, col.names = F)

