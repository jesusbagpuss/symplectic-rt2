# symplectic-rt2
Collection of code snippets that may be useful for others connecting EPrints and Symplectic Elements via RT2

## CSV Export (for migration tool)
The script [cgi/symplectic_RT2_CSV](cgi/symplectic_RT2_CSV) can be added to an EPrints repository to allows easy 
download of the data needed for the RT1 to RT2 migration tool.


## Record creation date
The folder [creation_date](creation_date/) has a virtual EPrints field that will search the history dataset for
the first entry relating to the EPrint - which should be the creation date of that specific record.

