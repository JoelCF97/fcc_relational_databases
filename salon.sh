#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -A -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
#get init service IDs
CUT_ID=$($PSQL "SELECT service_id FROM services WHERE name='cut'")
COLOR_ID=$($PSQL "SELECT service_id FROM services WHERE name='color'")
PERM_ID=$($PSQL "SELECT service_id FROM services WHERE name='perm'")
STYLE_ID=$($PSQL "SELECT service_id FROM services WHERE name='style'")
TRIM_ID=$($PSQL "SELECT service_id FROM services WHERE name='trim'")


# welcome message and main menu
echo -e "Welcome to My Salon, how can I help you?\n"

#menu definition
MENU(){
if [[ $1 ]]
then
echo -e "\n$1"
fi


while true;
do
echo -e "$CUT_ID) cut\n$COLOR_ID) color\n$PERM_ID) perm\n$STYLE_ID) style\n$TRIM_ID) trim"
read SERVICE_ID_SELECTED
case $SERVICE_ID_SELECTED in
"$CUT_ID") break ;;
"$COLOR_ID") break ;;
"$PERM_ID") break ;;
"$STYLE_ID") break ;;
"$TRIM_ID") break ;;
*) echo "I could not find that service. What would you like today?" ;;
esac
done
#identify the service chosen
SERVICE_CHOSEN=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
#ask for phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
#check if phone number in customers table
PHONE_NUMBER_RESULT=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $PHONE_NUMBER_RESULT ]]
then
#if not, ask name and add both to customers table
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
ADD_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
fi
#identify customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
#ask for time
echo -e "\nWhat time would you like your $SERVICE_CHOSEN, $CUSTOMER_NAME?"
read SERVICE_TIME
#insert into appointments table
ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
#exit statement
echo -e "\nI have put you down for a $SERVICE_CHOSEN at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

MENU