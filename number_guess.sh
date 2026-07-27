#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
if [[ -z $USERNAME_RESULT ]]
then
#if new username
echo "Welcome, $USERNAME! It looks like this is your first time here."
ADD_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
#if existing username
GAMES_PLAYED_INFO=$($PSQL "SELECT COUNT(game_id),MIN(guesses_needed) FROM games INNER JOIN users USING(user_id) WHERE username='$USERNAME'")
echo $GAMES_PLAYED_INFO | while IFS="|" read GAMES_PLAYED BEST_GAME;
do
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
done
fi
RANDOM_NUMBER=$(( 1 + RANDOM % 1000 ))
NUMBER_OF_GUESSES=0
echo "Guess the secret number between 1 and 1000:"
read GUESS
while [[ ! $GUESS =~ ^[0-9]+$ ]];
do
echo "That is not an integer, guess again:"
read GUESS
done
((NUMBER_OF_GUESSES+=1))
while [[ $GUESS -ne $RANDOM_NUMBER ]]
do
if [[ $GUESS -gt $RANDOM_NUMBER ]]
then
echo "It's lower than that, guess again:"
read GUESS
while [[ ! $GUESS =~ ^[0-9]+$ ]];
do
echo "That is not an integer, guess again:"
read GUESS
done
else
echo "It's higher than that, guess again:"
read GUESS
while [[ ! $GUESS =~ ^[0-9]+$ ]];
do
echo "That is not an integer, guess again:"
read GUESS
done
fi
((NUMBER_OF_GUESSES+=1))
done
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
ADD_GAME_RESULT=$($PSQL "INSERT INTO games(user_id,guesses_needed) VALUES('$USER_ID','$NUMBER_OF_GUESSES')")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $GUESS. Nice job!"
