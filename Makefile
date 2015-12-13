
OBJS = plot1.png plot2.png plot3.png plot4.png

all: ${OBJS}

%.png: %.R
	Rscript $*.R

clean:
	rm -f ${OBJS}
