
### THE GIVEN PARAMETERS
k = rep(c(3000, 10000), 3)
E = rep(30000000, 6)
I = rep(95.2, 6)
P1 = rep(c(50000, 62700), 3)
P2 = rep(c(44000, 52900), 3)
Po = c(25187.5, 25187.5, 22000,22000,22500,225000)
A= rep(0.6975,6)
MU= c(7264,7264, 4680,4680, 5921,5921)
Mu = round(MU/769.2, 4)
mro= rep(136,6)
mso= rep(c(200,800),3)
a= rep(0.003, 6)
e= rep(0.25, 6)
R = c(25.5,25.5,21.65,21.65,18,18)
l = rep(c(20,24),3)
D= R*2

parameters <- rbind (k ,E, I, P1, P2, Po, A, MU, Mu, mro, mso, a, e, R, l, D)
units <- c("lb/inch^2","lb/inch^2", "inch^4", "lbs", "lbs", "lbs", "NA", "lbs/axle",  "lbs-sec^2/inch","lb/yd", "lb", "radian", "NA", "inch", "inch", "inch")
table<- cbind(parameters, units)
colnames(table)<- c("vehincle 1 wood", "vehincle 1 concrete", "vehincle 2 wood", "vehincle 2 concrete", "vehincle 3 wood", "vehincle 3 concrete", "units")
table

lambda <- round((k/(4*E*I))**0.25,4)
Khx = (P1-Po)/(G*(P1**(2/3)-Po**(2/3)))
Kh = A * Khx
mr = round(mro/13877.55102,4)
ms = mso/769.23
m = mr+ms/l
Mt = 3*m/(2*lambda)
Kt<- 2*k/(lambda)
G = 6.342E-6*R**(-0.118)
Mx<-m*(gamma(0.75)*gamma(1.25)*sqrt(2))**(4/3)*(4*E*I/Kh)**(1/3)
Impact.factor = P2/Po




V1.arema =100*D*(P1/Po - 1)/33

V2.arema =100*D*(P2/Po - 1)/33

V1.max = (P1-Po)/(2*a*sqrt(Kh*Mx/(1+Mx/Mu)))*0.0568182

V2.max = (P2-Po)/((1-pi*e^2*Mt/(Mu+Mt))*2*a*sqrt(Kt*Mu)*sqrt(Mu/(Mu+Mt)))* 0.0568182

units <-c("1/inch", "lb-sec^2/inch^2", "lb-sec^2/in", "lb-sec^2/inch^2","lb-se
c^2/in", "lb/in", "in/lb^2/3", "lb/in", "lb/in", "lb-sec^2/in", "N/A", "mph",
"mph", "mph", "mph")
result =rbind(lambda, mr, ms, m, Mt, Kt, G, Khx, Kh, Mx,Impact.factor, V1.max,
V2.max, V1.arema, V2.arema)
results = round(result,4)
r.table = cbind(units, results)
colnames(r.table) = c("units","vehincle 1 wood", "vehincle 1 concrete", "vehincle 2 wood", "vehincle 2 concrete", "vehincle 3 wood", "vehincle 3 concrete")
r.table



SpeedTable_extract = results[12:15,]
colnames(SpeedTable_extract) = c("Wood Veh 1", "Concrete Veh 1", "Wood Veh 2", "Concre
te Veh 2", "Wood Veh 3", "Concrete veh 3")
rownames(SpeedTable_extract) = c("Max(V)_P1", "Max(V)_P2", "V_AREMA P1", "V_AREMA P2")
PlotTable = round(SpeedTable_extract)
PlotTable

_
