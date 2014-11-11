uva = dbConnect(MySQL(), user="publicread", password="", dbname="DH2014", host="dbm2.itc.virginia.edu")
charrette.df = dbReadTable(uva, "charrette_map")
dbDisconnect(uva)

colnames(charrette.df)   = c("rid","rtype","did","dtype")
charrette.melt.df = melt(charrette.df[c('rtype','did')],id=c('rtype'),measure=c('did'))
charrette.cast.df = cast(charrette.melt.df, rtype ~ value)
charrette.matrix  = as.matrix(charrette.cast.df)
corrplot(charrette.matrix,method="shade",is.corr=FALSE)