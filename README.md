# Email cleanup #

This ruby script reads a CSV export file from MySQL database, and removes lines contained in a dictionary file. Ie: do a XOR between the exported file and a dictionary.

##Source files##

emails.csv

 - CSV Export file columns: First name, Last name, Email address, Entity

emails-dictionary.txt

 - Dictionary: Email address, one per line

## Produced file ##

emails-cleaned.csv

 - CSV file, with following columns: First name, Last name, Email address, Entity
