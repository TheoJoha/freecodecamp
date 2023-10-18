#! /bin/bash

# Connect to database
PSQL="psql --username=freecodecamp --dbname=salon -t -c"
#PSQL="psql --username=freecodecamp --dbname=salon -c"
# Truncate tables
#TRUNCATE_TABLE=$($PSQL "TRUNCATE TABLE appointments, customers, services")

# Restart numbering
#ALTER_SEQUENCE=$($PSQL "ALTER SEQUENCE services_service_id_seq RESTART")

# Insert services in table
#INSERT_SERVICES=$($PSQL "INSERT INTO services(name) VALUES('haircut'), ('shaving'), ('buzz-cut')")


# Welcome message
echo -e "\n~~~~~ Welcome to my salon ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?"

# Ask for service-id
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #Get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo $AVAILABLE_SERVICES | sed -r 's/ \| /|/g' | sed -r 's/ /\n/g' | sed -r 's/\|/) /g' #| sed -r 's/ \|//g' #| sed -r 's/\|//g'
  
  read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED_DB=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  # echo $SERVICE_ID_SELECTED, $ID_SELECTED
  if [[ -z $SERVICE_ID_SELECTED_DB ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    PROCEED
  fi
}

# If service-id is not equal to one of service-ids then continue
# to ask until one is received
PROCEED() {

  # When a valid service-id has been received then ask for phone number
  echo -e "\nPlease enter your phone-number:"
  read CUSTOMER_PHONE
  CUSTOMER_PHONE_DB=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If phone number does not exist in database then ask for name
  # and enter it into database
  if [[ -z $CUSTOMER_PHONE_DB ]]
  then
    echo -e "\nPlease enter your name:"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  # Get customer-id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Ask customer about time
  echo -e "\nPlease enter time of appointment:"
  read SERVICE_TIME

  # Enter appointment into appointments
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', '$CUSTOMER_ID', '$SERVICE_ID_SELECTED')")

  # Get name of service
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

  # Print appointment
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}

MAIN_MENU


