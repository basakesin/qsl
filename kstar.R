kstar <- function(cY1,k) {
  
  L0 = as.numeric(sum(cY1==0))
  L1 = as.numeric(sum(cY1==1))

  len = length(cY1)
  Pin<-double()
  for (j in c(1:len))
  {
    if(cY1[j]==0)
    {
      Pin[j]= k/L0
      L0=L0-1
    }
    if(cY1[j]==1)
    {
      Pin[j]=k/L1
      L1=L1-1
    }
    if(L1<k || L0<k)
    {
    k_star = j
    break
    }
    
  }
 
  return(list(ks = k_star,p = Pin))
}
