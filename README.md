# METH4D2016
The final project for the Introduction to Methods in Digital Humanities course (University of Helsinki)

This project is the final project for the Introduction to Methods in Digital Humanities course. The course ran at the University of Helsinki in autumn 2016.

For the final assignment, I created a corpus consisting of 28 strategy documents by different Finnish cabinets (Lipponen I cabinet 1995 - Sipilä 2015). The object of the final project was to observe word frequences in all documents and then see if different words were emphasised during one or two particular cabinet's document. I used Vanhanen's I & II cabinet strategies for the comparison.

The preprocessing of data was done with RStudio and mainly conducted following the steps provided by Graham Williams in http://onepager.togaware.com/TextMiningO.pdf.

Preprocessing of the documents included following steps:

1)The recommended packages were downloaded. I ended up downloading more packages than the task required.

2)PDFs were converted to text files using XPDF's pdftotext.

3)Text files were used for creating the corpus.

4)The following characters were replaced with space: /@| .

5)Upper case letters were changed to lower case.

6)Numbers were removed.

7)Punctuation was replaced with space.

8)Finnish stopwords were removed.

9)Whitespace was removed.

10)The words were stemmed.

11)DocumentTermMatrix was created.

12)Frequences were counted.

13)Sparse terms were removed.

14)Words that occured in the corpus more than 2000 times were plotted using ggplot.

15)Wordcloud was created of words that appear in the corpus more than 800 times.

The overall results were not that surprising though there were some differences between the compared corpuses.
                      

