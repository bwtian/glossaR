glsRestec  <- function(url, short = "//dt", long = "//dd"){
        require(XML)
        doc  <- htmlParse(url)
        short.l  <- XML::xpathApply(doc, short)
        s  <- sapply(short.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        short <- s[!(is.na(s) | s=="" | s=="\n")]
        long.l  <- xpathApply(doc, long)
        l  <- sapply(long.l, function(x) {
                unname(xmlSApply(x, xmlValue))}
        )
        long <- l[!(is.na(l) | l=="" | l=="\n")]
        gls.d  <- cbind(short, long)
        return(gls.d)
}

