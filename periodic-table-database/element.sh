#!/bin/bash
# a program to print some info about a periodic element given the element's name, symbol, or atomic_number.
# example output: "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
# there are no tests
#
# connect to psql
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if not args given
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # check if first arg can be matched with an element
  INPUTTED_ARGUMENT=$1
  CORRESPONDING_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM properties WHERE atomic_number = $INPUTTED_ARGUMENT")
  CORRESPONDING_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$INPUTTED_ARGUMENT'")
  CORRESPONDING_NAME=$($PSQL "SELECT name FROM elements WHERE name = '$INPUTTED_ARGUMENT'")

  # check what input corresponds to to produce output
  if [[ -n $CORRESPONDING_ATOMIC_NUMBER  ]]
  then
  ATOMIC_NUMBER=$CORRESPONDING_ATOMIC_NUMBER
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $CORRESPONDING_ATOMIC_NUMBER")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $CORRESPONDING_ATOMIC_NUMBER")
  TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $CORRESPONDING_ATOMIC_NUMBER")
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $CORRESPONDING_ATOMIC_NUMBER")
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $CORRESPONDING_ATOMIC_NUMBER")
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $CORRESPONDING_ATOMIC_NUMBER")
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  else
    if [[ -n $CORRESPONDING_SYMBOL  ]]
    then
      SYMBOL=$CORRESPONDING_SYMBOL
      NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$SYMBOL'")
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$SYMBOL'")
      TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
      MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
      BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    else
      if [[ -n $CORRESPONDING_NAME  ]]
      then
        NAME=$CORRESPONDING_NAME
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$NAME'")
        ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$SYMBOL'")
        TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
        TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
        ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
        MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
        BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      else
        echo "I could not find that element in the database."
      fi
    fi
  fi
fi





