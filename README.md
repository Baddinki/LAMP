# LAMP
Moduuli on osa Tero Karvisen Palvelinten Hallinta kurssia Haaga-Helian ammattikorkeakoulussa http://terokarvinen.com/

Tero Karvisen Palvelinten hallinta kurssin viimeisenä työnä tein moduulin, joka asentaa Lampin eli Linuxin lisäksi apachen, php:n ja mysql:n. Tämä moduuli on pohjana siihen, että myöhemmin teen moduulin joka asentaa automaattisesti wordpressin. Yritin tehdä sen myös nyt, mutta en saanut sitä toimimaan joten nyt toimiva moduulini asentaa vain lampin.

Ensimmäinen askel

Luon seuraavat tiedostot

Site.pp on tiedosto, jota en tällä hetkellä tarvitse moduulin asentamiseen, mutta, jos on useampia moduuleita niin ne kaikki pystyy asentamaan site.pp:n kautta. Tällä hetkellä siellä lukee vain include apache eli nykyinen moduulini.

init.pp

Siellä on komennot mitkä asentavat koko Lampin. Sen lisäksi se poistaa apachen oletussivun ja asettaa tilalle moduulin oman kotisivun.


index.html

index.html:ssä lukee haluamani teksti ja moduulia ajettaessa se korvaa apachen oletussivun.

php7.0.conf

Tämän tiedoston avulla php:tä voi ajaa käyttäjien kotihakemistoissa.

Moduulin ajo

Moduulin saa ajettua komennolla sudo puppet apply -e 'class {"apache":}


Moduulin ajamisen jälkeen ohjelmat on asennettu ja apachen etusivu vaihdettu.
