#!/bin/bash
echo -e "\n ~~ Welcome to the Salon ~~\n"
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=salontest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
fi
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICES
}
SERVICES(){
  GET_SERVICE_RESULT=$($PSQL "select * from services order by service_id")
  echo "$GET_SERVICE_RESULT" | while IFS="|" read S_ID NAME
  do
   echo -e "\n$S_ID) $NAME"
  done

  echo -e "\nWhich service would you like"
  read SERVICE_ID_SELECTED
  GET_SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $GET_SERVICE_NAME ]]
  then
    MAIN_MENU "Sorry, the service id you entered is not present"
  else
    echo -e "\nWhat's your phone number(xxx-xxx-xxxx format)?"
    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # if customer doesn't exist
    if [[ -z $CUSTOMER_ID ]]
    then
          # get new customer name
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      
    fi
    echo -e "\nWhat time would you prefer?"
    read SERVICE_TIME

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")    
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
    echo -e "I have put you down for a $GET_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
MAIN_MENU