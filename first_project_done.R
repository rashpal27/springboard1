library(tidyverse)


rash1 <- read_csv("refine_original.csv")
View(rash1)

rash2 <- separate(rash1, 2, c("product_code", "product_number"), sep = "-")

rash3 <- unite(rash2, "full_address", address, city, country, sep=",")

rash3 <- add_column(rash3, product_category= "missing" )

rash3$product_category <- "missing"



  
rash3$product_category<- ifelse(
      rash3$product_code == "p","Smartphone",rash3$product_category)
    
rash3$product_category<- ifelse(
  rash3$product_code == "v","TV",rash3$product_category)

rash3$product_category<- ifelse(
  rash3$product_code == "x","Laptop",rash3$product_category)

rash3$product_category<- ifelse(
  rash3$product_code == "q","Tablet",rash3$product_category)


rash3$company <- gsub( "([a-z]|[A-Z])+p[s|S]" , "philips", rash3$company)

rash3$company <- gsub( "([a-z]|[A-Z])+ver" , "unilever", rash3$company)

rash3$company <- gsub("ak zo","akzo", rash3$company)

rash3$company <- gsub("[~A|~a][K|k]([a-z]|[A-Z]|[0-9])+","akzo", rash3$company)

rash3$company <- gsub("[V|v]an [H|h]outen","van houten",rash3$company)

rash3 <- add_column(rash3, company_philips = "missing" )
 
rash3$company_philips<- ifelse(
  rash3$company == "philips" , 1 ,0)
 
rash3 <- add_column(rash3, company_akzo = "missing" )
 
 
rash3$company_akzo<- ifelse(
   rash3$company == "akzo" , 1 ,0)
 
 rash3 <- add_column(rash3, company_van_houten = "missing" )
 
 
 
 rash3$company_van_houten<- ifelse(
   rash3$company == "van houten" , 1 ,0)
 
 
 rash3 <- add_column(rash3, company_unilever = "missing" )
 
 
 rash3$company_unilever<- ifelse(
   rash3$company == "unilever" , 1 ,0)
  
 
 rash3 <- add_column(rash3, product_smartphone = "missing" )
 
 
 rash3$product_smartphone<- ifelse(
   rash3$product_category == "Smartphone" , 1 ,0)
 
 rash3 <- add_column(rash3, product_tv = "missing" )
 
 rash3$product_tv<- ifelse(
   rash3$product_category == "TV" , 1 ,0) 
 
 rash3 <- add_column(rash3, product_laptop = "missing" )
 
 
 rash3$product_laptop<- ifelse(
   rash3$product_category == "Laptop" , 1 ,0)
 
 
 
 rash3 <- add_column(rash3, product_tablet = "missing" )
 
 
 rash3$product_tablet<- ifelse(
   rash3$product_category == "Tablet" , 1 ,0)
 
 write_csv(rash3,"refine_clean.csv")
 
 