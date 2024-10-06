pdf("Fst_lines_marker.pdf", width=20,height=7)
par(mgp=c(0,0.5,0))
plot(c(0,0)~c(0,0),col="white",xlim=c(0,725.017384),axes=F,xlab="",ylim=c(0,0.65),ylab="Fst",main="Substenotomum_vs_Phureja",cex.lab=2,cex.main=2)# adjugement the ylim

db<-read.table("input.all.fst")
rition_value<-db$V3
pos<-db$V2/1000000
chr_ID<-db$V1
for (i in 1:length(rition_value)) {
if (chr_ID[i]=='chr01'){
if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i],pos[i]),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i],pos[i]),lty=1,col="darkgoldenrod1",lwd=1);
}

} else if (chr_ID[i]=='chr02'){
if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+88.591686,pos[i]+88.591686),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+88.663952,pos[i]+88.663952),lty=1,col="darkgoldenrod1",lwd=1);
#	lines(c(0.5,0.5)~c(25.1+88.663952,29.1+88.663952),lty=1,col="red",lwd=1);
}
} else if (chr_ID[i]=='chr03'){
if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+134.694601,pos[i]+134.694601),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+137.278633,pos[i]+137.278633),lty=1,col="darkgoldenrod1",lwd=1);
#	lines(c(0.5,0.5)~c(51.4+137.278633,55.4+137.278633),lty=1,col="red",lwd=1)
}
} else if (chr_ID[i]=='chr04'){
if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+195.402171,pos[i]+195.402171),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+199.568919,pos[i]+199.568919),lty=1,col="darkgoldenrod1",lwd=1);
}
} else if (chr_ID[i]=='chr05'){
if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+264.638502,pos[i]+264.638502),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+271.777540,pos[i]+271.777540),lty=1,col="darkgoldenrod1",lwd=1);
#	lines(c(0.5,0.5)~c(3.9+271.777540,7.9+271.777540),lty=1,col="red",lwd=1)
}
} else if (chr_ID[i]=='chr06'){
if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+320.238199,pos[i]+320.238199),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+323.847698,pos[i]+323.847698),lty=1,col="darkgoldenrod1",lwd=1);
}
} else if (chr_ID[i]=='chr07'){
	if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+379.329777,pos[i]+379.329777),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+383.379794,pos[i]+383.379794),lty=1,col="darkgoldenrod1",lwd=1);
}
} else if (chr_ID[i]=='chr08'){
	if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+436.969094,pos[i]+436.969094),lty=1,col="dodgerblue2",lwd=1);
} else  {
	lines(c(0,rition_value[i])~c(pos[i]+440.140637,pos[i]+440.140637),lty=1,col="darkgoldenrod1",lwd=1);
}
} else if (chr_ID[i]=='chr09'){
	if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+496.195094,pos[i]+496.195094),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+497.079094,pos[i]+497.079094),lty=1,col="darkgoldenrod1",lwd=1);
#	lines(c(0.5,0.5)~c(50.9+497.079094,54.9+497.079094),lty=1,col="red",lwd=1)
}
} else if (chr_ID[i]=='chr10'){
	if(rition_value[i]<1) {	
	lines(c(0,rition_value[i])~c(pos[i]+563.795394,pos[i]+563.795394),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+558.619845,pos[i]+558.619845),lty=1,col="darkgoldenrod1",lwd=1);
}
} else if (chr_ID[i]=='chr11'){
	if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+624.839545,pos[i]+624.839545),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+618.376068,pos[i]+618.376068),lty=1,col="darkgoldenrod1",lwd=1);
#	lines(c(0.5,0.5)~c(8.8+618.376068,12.8+618.376068),lty=1,col="red",lwd=1)	
}
} else if (chr_ID[i]=='chr12'){
	if(rition_value[i]<1) {
	lines(c(0,rition_value[i])~c(pos[i]+671.616932,pos[i]+671.616932),lty=1,col="dodgerblue2",lwd=1);
} else {
	lines(c(0,rition_value[i])~c(pos[i]+663.851735,pos[i]+663.851735),lty=1,col="darkgoldenrod1",lwd=1);
}
}
}
lines(c(0,0.65)~c(88.591686,88.591686),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(134.694601,134.694601),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(195.402171,195.402171),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(264.638502,264.638502),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(320.238199,320.238199),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(379.329777,379.329777),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(436.969094,436.969094),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(496.195094,496.195094),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(563.795394,563.795394),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(624.839545,624.839545),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(671.616932,671.616932),lty=5,lwd=2,col="black")
lines(c(0,0.65)~c(731.287687,731.287687),lty=5,lwd=2,col="black")

lines(c(0.164609,0.164609)~c(0,731.287687),lty=5,lwd=1,col="black")

axis(side=1,at=c(0,44.33,112.97,168.42,235.67,297.81,353.61,411.76,468.61,527.85,588.45,641.11,694.43,725.017384),labels=c("","1","2","3","4","5","6","7","8","9","10","11","12",""),pos=0,lwd=1, tck=0)
axis(side=2,at=seq(0,0.65,0.1),labels=seq(0,0.65,0.1),pos=0,las=1,lwd=1, tck=0,tck=-0.01)
#text(766.0189215,-2,labels="chromosome",cex=2)


code<-read.table("marker")
start<-code$V3/1000000
end<-code$V4/1000000
name<-code$V1
chr_ID<-code$V2
for (i in 1:length(name)) {
        if (chr_ID[i]=='chr01'){
        lines(c(0.5,0.5)~c(start[i],end[i]),lty=1,col="red",lwd=1)
        text(end[i],0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr02'){
        lines(c(0.5,0.5)~c(start[i]+88.591686,end[i]+88.591686),lty=1,col="red",lwd=1)
        text(end[i]+88.591686,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr03'){
        lines(c(0.5,0.5)~c(start[i]+134.694601,end[i]+134.694601),lty=1,col="red",lwd=1)
        text(end[i]+134.694601,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr04'){
        lines(c(0.5,0.5)~c(start[i]+195.402171,end[i]+195.402171),lty=1,col="red",lwd=1)
        text(end[i]+195.402171,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr05'){
        lines(c(0.5,0.5)~c(start[i]+264.638502,end[i]+264.638502),lty=1,col="red",lwd=1)
        text(end[i]+264.638502,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr06'){
        lines(c(0.5,0.5)~c(start[i]+320.238199,end[i]+320.238199),lty=1,col="red",lwd=1)
        text(end[i]+320.238199,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr07'){
        lines(c(0.5,0.5)~c(start[i]+379.329777,end[i]+379.329777),lty=1,col="red",lwd=1)
        text(end[i]+379.329777,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr08'){
        lines(c(0.5,0.5)~c(start[i]+436.969094,end[i]+436.969094),lty=1,col="red",lwd=1)
        text(end[i]+436.969094,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr09'){
        lines(c(0.5,0.5)~c(start[i]+496.195094,end[i]+496.195094),lty=1,col="red",lwd=1)
        text(end[i]+496.195094,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr10'){
        lines(c(0.5,0.5)~c(start[i]+563.795394,end[i]+563.795394),lty=1,col="red",lwd=1)
        text(end[i]+563.795394,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr11'){
        lines(c(0.5,0.5)~c(start[i]+624.839545,end[i]+624.839545),lty=1,col="red",lwd=1)
        text(end[i]+624.839545,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
} else if (chr_ID[i]=='chr12'){
        lines(c(0.5,0.5)~c(start[i]+671.616932,end[i]+671.616932),lty=1,col="red",lwd=1)
        text(end[i]+671.616932,0.4, adj=0, name[i],pos=2,srt=45, cex=0.6)
}
}

dev.off()
