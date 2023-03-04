#!/bin/bash
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=periodic_tabletest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
fi

if [[ $1 ]]
then
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_INFO_RESULT=$($PSQL "select atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, name,symbol, types.type from properties join elements using(atomic_number) join types using(type_id) where name like '$1%' order by atomic_number limit 1")
  else
    ELEMENT_INFO_RESULT=$($PSQL "select atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, name,symbol, types.type from properties join elements using(atomic_number) join types using(type_id) where atomic_number=$1")
  fi
  if [[ -z $ELEMENT_INFO_RESULT ]]
  then
    echo -e "I could not find that element in the database."
  else
    echo $ELEMENT_INFO_RESULT | while IFS="|" read AN AM MP BP NAME SYMBOL TYPE
    do
      echo -e "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  fi
else
  echo -e "Please provide an element as an argument."
fi
