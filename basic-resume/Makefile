.PHONY: all private public clean

all: private public

private:
	typst compile main.typ Akil_Rammohan_Resume.pdf

public:
	typst compile --input public=true main.typ Akil_Rammohan_Resume_Public.pdf

clean:
	rm -f Akil_Rammohan_Resume.pdf Akil_Rammohan_Resume_Public.pdf
