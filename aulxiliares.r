um = rowMeans(cbind(
		(e1.filestats.1$CPU.user[2:443] - e1.filestats.1$CPU.user[1:442]),
		(e1.filestats.2$CPU.user[2:443] - e1.filestats.2$CPU.user[1:442]),
		(e1.filestats.3$CPU.user[2:443] - e1.filestats.3$CPU.user[1:442]),
		(e1.filestats.4$CPU.user[2:443] - e1.filestats.4$CPU.user[1:442]),
		(e1.filestats.5$CPU.user[2:443] - e1.filestats.5$CPU.user[1:442]),
		(e1.filestats.6$CPU.user[2:443] - e1.filestats.6$CPU.user[1:442]),
		(e1.filestats.7$CPU.user[2:443] - e1.filestats.7$CPU.user[1:442]),
		(e1.filestats.8$CPU.user[2:443] - e1.filestats.8$CPU.user[1:442]),
		(e1.filestats.9$CPU.user[2:443] - e1.filestats.9$CPU.user[1:442]),
		(e1.filestats.10$CPU.user[2:443] - e1.filestats.10$CPU.user[1:442]),
		(e1.filestats.11$CPU.user[2:443] - e1.filestats.11$CPU.user[1:442]),
		(e1.filestats.12$CPU.user[2:443] - e1.filestats.12$CPU.user[1:442])
))

km = rowMeans(cbind(
		(e1.filestats.1$CPU.kernel[2:443] - e1.filestats.1$CPU.kernel[1:442]),
		(e1.filestats.2$CPU.kernel[2:443] - e1.filestats.2$CPU.kernel[1:442]),
		(e1.filestats.3$CPU.kernel[2:443] - e1.filestats.3$CPU.kernel[1:442]),
		(e1.filestats.4$CPU.kernel[2:443] - e1.filestats.4$CPU.kernel[1:442]),
		(e1.filestats.5$CPU.kernel[2:443] - e1.filestats.5$CPU.kernel[1:442]),
		(e1.filestats.6$CPU.kernel[2:443] - e1.filestats.6$CPU.kernel[1:442]),
		(e1.filestats.7$CPU.kernel[2:443] - e1.filestats.7$CPU.kernel[1:442]),
		(e1.filestats.8$CPU.kernel[2:443] - e1.filestats.8$CPU.kernel[1:442]),
		(e1.filestats.9$CPU.kernel[2:443] - e1.filestats.9$CPU.kernel[1:442]),
		(e1.filestats.10$CPU.kernel[2:443] - e1.filestats.10$CPU.kernel[1:442]),
		(e1.filestats.11$CPU.kernel[2:443] - e1.filestats.11$CPU.kernel[1:442]),
		(e1.filestats.12$CPU.kernel[2:443] - e1.filestats.12$CPU.kernel[1:442])
))


ctm = rowMeans(cbind(
		(e1.filestats.1$CPU.total[2:443] - e1.filestats.1$CPU.total[1:442]),
		(e1.filestats.2$CPU.total[2:443] - e1.filestats.2$CPU.total[1:442]),
		(e1.filestats.3$CPU.total[2:443] - e1.filestats.3$CPU.total[1:442]),
		(e1.filestats.4$CPU.total[2:443] - e1.filestats.4$CPU.total[1:442]),
		(e1.filestats.5$CPU.total[2:443] - e1.filestats.5$CPU.total[1:442]),
		(e1.filestats.6$CPU.total[2:443] - e1.filestats.6$CPU.total[1:442]),
		(e1.filestats.7$CPU.total[2:443] - e1.filestats.7$CPU.total[1:442]),
		(e1.filestats.8$CPU.total[2:443] - e1.filestats.8$CPU.total[1:442]),
		(e1.filestats.9$CPU.total[2:443] - e1.filestats.9$CPU.total[1:442]),
		(e1.filestats.10$CPU.total[2:443] - e1.filestats.10$CPU.total[1:442]),
		(e1.filestats.11$CPU.total[2:443] - e1.filestats.11$CPU.total[1:442]),
		(e1.filestats.12$CPU.total[2:443] - e1.filestats.12$CPU.total[1:442])
))


pim = rowMeans(cbind(
		(e1.filestats.1$Page.in[2:443] - e1.filestats.1$Page.in[1:442]),
		(e1.filestats.2$Page.in[2:443] - e1.filestats.2$Page.in[1:442]),
		(e1.filestats.3$Page.in[2:443] - e1.filestats.3$Page.in[1:442]),
		(e1.filestats.4$Page.in[2:443] - e1.filestats.4$Page.in[1:442]),
		(e1.filestats.5$Page.in[2:443] - e1.filestats.5$Page.in[1:442]),
		(e1.filestats.6$Page.in[2:443] - e1.filestats.6$Page.in[1:442]),
		(e1.filestats.7$Page.in[2:443] - e1.filestats.7$Page.in[1:442]),
		(e1.filestats.8$Page.in[2:443] - e1.filestats.8$Page.in[1:442]),
		(e1.filestats.9$Page.in[2:443] - e1.filestats.9$Page.in[1:442]),
		(e1.filestats.10$Page.in[2:443] - e1.filestats.10$Page.in[1:442]),
		(e1.filestats.11$Page.in[2:443] - e1.filestats.11$Page.in[1:442]),
		(e1.filestats.12$Page.in[2:443] - e1.filestats.12$Page.in[1:442])
))

pom = rowMeans(cbind(
		(e1.filestats.1$Page.out[2:443] - e1.filestats.1$Page.out[1:442]),
		(e1.filestats.2$Page.out[2:443] - e1.filestats.2$Page.out[1:442]),
		(e1.filestats.3$Page.out[2:443] - e1.filestats.3$Page.out[1:442]),
		(e1.filestats.4$Page.out[2:443] - e1.filestats.4$Page.out[1:442]),
		(e1.filestats.5$Page.out[2:443] - e1.filestats.5$Page.out[1:442]),
		(e1.filestats.6$Page.out[2:443] - e1.filestats.6$Page.out[1:442]),
		(e1.filestats.7$Page.out[2:443] - e1.filestats.7$Page.out[1:442]),
		(e1.filestats.8$Page.out[2:443] - e1.filestats.8$Page.out[1:442]),
		(e1.filestats.9$Page.out[2:443] - e1.filestats.9$Page.out[1:442]),
		(e1.filestats.10$Page.out[2:443] - e1.filestats.10$Page.out[1:442]),
		(e1.filestats.11$Page.out[2:443] - e1.filestats.11$Page.out[1:442]),
		(e1.filestats.12$Page.out[2:443] - e1.filestats.12$Page.out[1:442])
))



mum = rowMeans(cbind(
		(e1.filestats.1$MEM.used[2:442]),
		(e1.filestats.2$MEM.used[2:442]),
		(e1.filestats.3$MEM.used[2:442]),
		(e1.filestats.4$MEM.used[2:442]),
		(e1.filestats.5$MEM.used[2:442]),
		(e1.filestats.6$MEM.used[2:442]),
		(e1.filestats.7$MEM.used[2:442]),
		(e1.filestats.8$MEM.used[2:442]),
		(e1.filestats.9$MEM.used[2:442]),
		(e1.filestats.10$MEM.used[2:442]),
		(e1.filestats.11$MEM.used[2:442]),
		(e1.filestats.12$MEM.used[2:442])
))
