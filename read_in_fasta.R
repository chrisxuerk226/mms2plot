seq = readLines('/Users/xrk.study/Desktop/Figure3/swissprot_human_isoform_2014_10_30.fasta') 
seq = seq[seq != ""]
is.anno <- regexpr("^>", seq, perl=T) # 正则匹配（regular expression）注释行,是注释行为1，否则为-1
seq.anno <- seq[ which(is.anno == 1) ] # 注释内容          # 注释内容
seq.content <- seq[ which(is.anno == -1) ] # 序列内容
start <- which(is.anno == 1) # 注释行行号
end <- start[ 2:length(start) ]-1
end <- c(end, length(seq) )  
seq.ID = c() 
for (i in 1:length(seq.anno)) 
{
  seq.anno[i] = strsplit(strsplit(seq.anno[i], split = ' ')[[1]][1], split = '|', fixed = TRUE)[[1]][2]
}

distance <- end - start # 每条记录所占行号 
index <- 1:length(start)  
index <- rep(index, distance) # 分组标签 
seqs <- tapply(seq.content, index, paste, collapse="") 
seq.content<-as.character( seqs ) # 将列表转换为向量，向量每个元素为一条序列的内容 
seq.ID <- gsub("^>(\\w+\\|){3}([A-Za-z0-9.]+)\\|.*", "\\2", seq.anno, perl = T) # 获取序列的ID 
result <- data.frame( seq.ID,  seq.content ) # 组件结果：ID，长度，注释行，序列内容 
