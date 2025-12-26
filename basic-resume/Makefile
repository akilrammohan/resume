.PHONY: all private public clean

all: private public

private:
	typst compile main.typ main-private.pdf

public:
	typst compile --input public=true main.typ main.pdf

clean:
	rm -f main.pdf main-private.pdf
