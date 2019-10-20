
Int2Factor <- function(x)
{
  if(!is.null(attr(x, "value.labels"))){
    vlab <- attr(x, "value.labels")
    if(sum(duplicated(vlab)) > 0)
      cat("Duplicated levels:", vlab, "\n")
    else if(sum(duplicated(names(vlab))) > 0)
      cat("Duplicated labels:",
          names(vlab)[duplicated(names(vlab))], "\n")
    else
      x <- factor(x, levels = as.numeric(vlab),
                  labels = names(vlab))
  }
  x
}


cx = read.spss("2013_TxT_CSS_Dep_SPSS_Database.sav", use.value.labels = FALSE) #to.data.frame=TRUE) 
cx = lapply(cx, Int2Factor) 
cx = as.data.frame(cx, stringsAsFactors = FALSE) 
