charrette.df = read.csv("charrette.csv")
colnames(charrette.df) = c("rid","rtype","did","dtype")

figures = charrette.df$rtype
characters = charrette.df$did

figures.table = table(figures)
characters.table = table(characters)

plot(characters)


#charrette.melt.df = melt(charrette.df[c('rtype','did')],id=c('rtype'),measure=c('did'))
#charrette.cast.df = cast(charrette.melt.df, rtype ~ value)
#charrette.matrix  = as.matrix(charrette.cast.df)
#corrplot(charrette.matrix,method="shade",is.corr=FALSE)