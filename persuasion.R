library('DBI')

uva = dbConnect(MySQL(), user="publicread", password="", dbname="DH2014", host="dbm2.itc.virginia.edu")
persuasion.df = dbReadTable(uva, "persuasion_map")
dbDisconnect(uva)

colnames(persuasion.df) = c("rid","rtype","did","dtype")

persuasion.df = persuasion.df[c("rid","did")]
persuasion.self.df = merge(persuasion.df,persuasion.df,by="rid")
persuasion.self.df = persuasion.self.df[c('did.x','did.y')]
persuasion.melt.df = melt(persuasion.self.df,id=c('did.x'),measure=c('did.y'))
persuasion.cast.df = cast(persuasion.melt.df, did.x ~ value)
persuasion.matrix = as.matrix(persuasion.cast.df)
persuasion.matrix
corrplot(persuasion.matrix,method="shade",is.corr=FALSE)

#persuasion.melt.df = melt(persuasion.1.df,id=c('did.x'),measure=c('did.y'))
#persuasion.melt.df = melt(persuasion.df[c('rtype','did')],id=c('rtype'),measure=c('did'))
#persuasion.cast.df = cast(persuasion.melt.df, rtype ~ value)
#persuasion.cast.df
#persuasion.matrix  = as.matrix(persuasion.cast.df)
#corrplot(persuasion.matrix,method="shade",is.corr=FALSE)