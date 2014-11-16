all: resume.en.html resume.en.pdf resume.en.docx resume.en.txt

resume.en.html resume.cn.html: resume.en.md resume.cn.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o resume.en.html resume.en.md
	pandoc --standalone -c style.css --from markdown --to html -o resume.cn.html resume.cn.md

resume.en.pdf resume.cn.pdf: resume.en.html resume.cn.html
	wkhtmltopdf resume.en.html resume.en.pdf
	wkhtmltopdf resume.cn.html resume.cn.pdf

resume.en.docx resume.cn.docx: resume.en.md resume.cn.md
	pandoc --from markdown --to docx -o resume.en.docx resume.en.md
	pandoc --from markdown --to docx -o resume.cn.docx resume.cn.md

resume.en.txt resume.cn.txt: resume.en.md resume.cn.md
	pandoc --standalone --smart --from markdown --to plain -o resume.en.txt resume.en.md
	pandoc --standalone --smart --from markdown --to plain -o resume.cn.txt resume.cn.md

clean:
	rm -f *.html *.pdf *.docx *.txt *~
