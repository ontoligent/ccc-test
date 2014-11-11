
# Open a connection to the UVA MySQL Server
uva = dbConnect(MySQL(), user="publicread", password="", dbname="DH2014", host="dbm2.itc.virginia.edu")

# Grab the basic map data from the three core sets
charrette.df   = dbReadTable(uva, "charrette_map")
faulkner.df    = dbReadTable(uva, "faulkner_map")
persuasion.df  = dbReadTable(uva, "persuasion_map")

# Close the db
dbDisconnect(uva)

# Fix things up a bit
ccc.cols = c("rid","rtype","did","dtype")
colnames(charrette.df)   = ccc.cols
colnames(faulkner.df)    = ccc.cols
colnames(persuasion.df)  = ccc.cols

# CHARRETTE
charrette.melt.df = melt(charrette.df[c('rtype','did')],id=c('rtype'),measure=c('did'))
charrette.cast.df = cast(charrette.melt.df, rtype ~ value)
charrette.matrix  = as.matrix(charrette.cast.df)
corrplot(charrette.matrix,method="circle",is.corr=FALSE)

# PERSUASION
persuasion.melt.df = melt(persuasion.df(c()))

# Get lists of valuess for figures and characters
#charrette.figures.f = factor(unique(charrette.df$rtype))
#charrette.chars.f   = factor(unique(charrette.df$did))

# Pivot
#charrette.melt.1.df     = melt(charrette.df[c('rid','rtype','did')],id=c('rid'),measure=c('rtype','did'))
#charrette.melt.rtype.df = melt(charrette.df[c('rid','rtype')],id=c('rid'),measure=c('rtype'))
#charrette.melt.did.df   = melt(charrette.df[c('rid','did')],id=c('rid'),measure=c('did'))
#charrette.cast.1.df     = cast(charrette.melt.1.df, rid ~ value)
#charrette.cast.rtype.df = cast(charrette.melt.rtype.df, rid ~ value)
#charrette.cast.did.df   = cast(charrette.melt.did.df, rid ~ value)



# plot(cor(charrette.cast.df)) # This correlates the first two columns
# dfx = subset(charrette.cast.df,select=c('AD','CH'))
# plot(cor(dfx)) # Why does this not work?

# Correlate
#charrette.figures.f = sort(factor(unique(charrette.df$rtype)))
#charrette.chars.f   = sort(factor(unique(charrette.df$did)))
#for (figure in charrette.figures.f) {
  #figure.v = as.vector(charrette.cast.df[[figure]])
#  for (char in charrette.chars.f) {
    #char.v = as.vector(charrette.cast.df[[char]])
    #my.df = subset(charrette.cast.df, rtype == figure, select=c('rtype',char)) #data.frame(figure=figure.v,char=char.v)
    #print(my.df)
    #r = cor(my.df)
    #v = cov(my.df)
    #print(paste(figure,char,r,v))
    #plot(cor(my.df),main=paste('figure:',figure,', char:',char))
#  }
#}

