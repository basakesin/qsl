qsl <- function(z,label,D,N,k) 
{
  pr<- double()
  P0<- double()
  
  
for (i in c(1:N)){

  if (i>1 && i<N) {
    ii<-c(1:(i-1), (i+1):N)
    f<-sort(D[i,ii],index.return=TRUE)
    cY1 = label[ii[f$ix]]
    rr <- kstar(cY1,k)
    Pin <- rr$p
    k_star<- rr$ks 
    pr[k_star]<-as.numeric(cY1[k_star]==0)
    for (j in c((k_star-1):1))
    {
      pr[j]<-Pin[j]*as.numeric(cY1[j]==0)+(1-Pin[j])*pr[j+1]
    }
  }
  
  if(i==1)
  {
    ii <- c((i+1):N)
    f<-sort(D[i,ii],index.return=TRUE)
    cY1 = label[ii[f$ix]]
    rr <- kstar(cY1,k)
    Pin <- rr$p
    k_star<- rr$ks 
    pr[k_star]<-as.numeric(cY1[k_star]==0)
    for (j in c((k_star-1):1))
    {
      pr[j]=Pin[j]*as.numeric(cY1[j]==0)+(1-Pin[j])*pr[j+1];
    }
  }
  
  if(i==N)
  {
    ii <- c(1:N-1)
    f<-sort(D[i,ii],index.return=TRUE)
    cY1 = label[ii[f$ix]]
    rr <- kstar(cY1,k)
    Pin <- rr$p
    k_star<- rr$ks 
    pr[k_star]<-as.numeric(cY1[k_star]==0)
    for (j in ((k_star-1):1))
    {
      pr[j]=Pin[j]*as.numeric(cY1[j]==0)+(1-Pin[j])*pr[j+1];
    }
  }
  P0[i] = Pin[1]*as.numeric(cY1[1]==0)+(1-Pin[1])*pr[1];
  
}

return(P0)
}