install.packages("rpart")
install.packages("rpart.plot")
install.packages("partykit")
library(rpart)
library(rpart.plot)
library(partykit)
#insurance_type <- read.csv("decision-tree recommend.csv",header=TRUE)
insurance_type <- read.csv("literal.csv",header=TRUE)
insurance_type
#res.cart <- rpart(型~年齢+性別+住所+車のタイプ+加入タイミング,data = insurance_type,method="class")
res.cart <- rpart(型~年齢+性別+住所+車のタイプ+加入タイミング,data = insurance_type, control = rpart.control(minsplit = 1))
plot(res.cart, uniform=TRUE, branch=0.6, margin=0.05 )
rpctrl <- rpart.control(minsplit=1);
text(res.cart, all=TRUE, use.n=TRUE, pretty=0)
input <- read.csv("test.csv",header=TRUE)
input
pred.cart <- predict(res.cart, data = input,type="class")
pred.cart
#table(pred.cart,res.cart$型)
print(res.cart,digit=2)
rpart.plot(res.cart,type=1,uniform=TRUE,extra=1,under=1,faclen=0)
plot(as.party(res.cart))

