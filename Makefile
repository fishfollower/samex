keep := ".*/\(.*.cpp\|.*.R\|.*.md\|.*.RData\\|Makefile\)"

.PHONY = clean all

all: fit1.pdf

clean:
	find . -maxdepth 1 -type f ! -regex $(keep) -delete

fit1.pdf: sam.R sam.cpp
	echo 'source("sam.R")' | R --slave

