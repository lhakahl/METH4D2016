# METH4D2016
Final project for the Introduction to methods in digital humanities course (University of Helsinki)

This project is the final project for the Introduction to methods in digital humanities course. The course ran at the University of Helsinki in autumn 2016.

For the final assignment, I created a corpus consisting of 28 strategy documents by different Finnish cabinets (Lipponen I cabinet 1995 - Sipilä 2015). The object of the final project was to observe word frequences in all documents and then see if different words were emphasised during one or two particular cabinet.

The preprocessing of data was done with RStudio and mainly conducted following the steps provided by Graham Williams in http://onepager.togaware.com/TextMiningO.pdf.

Preprocessing of the documents included following steps:
1)The recommended packages were downloaded

2)PDFs were converted to text files

3)Text files were used for creating the corpus

4)The following characters were replaced with space: /@|

5)Upper case letters were changed to lower case
6)Numbers were removed
7)Punctuation was replaced with space
8)Finnish stopwords were removed
9)Whitespace was removed
10)The words were stemmed
11)DocumentTermMatrix was created
12)Frequences were counted
13)Sparse terms were removed
14)Words that occured in the corpus more than 2000 times were plotted using ggplot
15)Wordcloud was created of words that appear in the corpus more than 800 times 

The overall results were not that surprising. The most frequently used words are listed below:
                             word freq
vuode                       vuode 3538
tavoit                     tavoit 3413
suome                       suome 3078
vuon                         vuon 2960
valtio                     valtio 2268
osa                           osa 2250
palvelu                   palvelu 2197
hallitus                 hallitus 2180
lisä                         lisä 2147
ohjelm                     ohjelm 2118
yhteistyö               yhteistyö 2082
käytö                       käytö 1992
koskev                     koskev 1898
hallituks               hallituks 1828
toimenpit               toimenpit 1745
euro                         euro 1716
vuos                         vuos 1695
prosent                   prosent 1685
sen                           sen 1635
määrä                       määrä 1522
kunt                         kunt 1505
hank                         hank 1497
erityis                   erityis 1415
olev                         olev 1412
kehittämis             kehittämis 1352
aika                         aika 1340
toimin                     toimin 1329
alue                         alue 1319
kehit                       kehit 1293
eri                           eri 1289
valtioneuvosto     valtioneuvosto 1285
kasvu                       kasvu 1282
suomi                       suomi 1245
julkis                     julkis 1221
eun                           eun 1209
kaik                         kaik 1191
kun                           kun 1191
sosiaal                   sosiaal 1158
yht                           yht 1144
liittyv                   liittyv 1131
politiikkaohjelm politiikkaohjelm 1129
mukais                     mukais 1108
huomio                     huomio 1081
edist                       edist 1072
koulutuks               koulutuks 1066
nuort                       nuort 1060
eduskun                   eduskun 1028
alu                           alu  995
koko                         koko  993
uus                           uus  947
voima                       voima  940
muun                         muun  938
kansallis               kansallis  935
keskeis                   keskeis  922
taso                         taso  916
tehtäv                     tehtäv  908
kansainvälis         kansainvälis  889
toteut                     toteut  878
ministeriö             ministeriö  870
milj                         milj  866
työryhm                   työryhm  864
edistämis               edistämis  855
euroop                     euroop  853
kehittäm                 kehittäm  839
taloud                     taloud  825
työeläm                   työeläm  822
hallituskaud         hallituskaud  820
lopu                         lopu  818
yrityst                   yrityst  818
ede                           ede  816
selvit                     selvit  807
muas                         muas  806
uude                         uude  805
toim                         toim  803
hallitusohjelm     hallitusohjelm  802

