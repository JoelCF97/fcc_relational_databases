#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#ensure fresh start
echo $($PSQL "TRUNCATE teams, games RESTART IDENTITY")
#Access line
tail -n +2 games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
#check if winner is in teams
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
if [[ -z $WINNER_ID ]]
#if winner not in teams add to teams and acquire ID
then
WINNER_ID_ADDED=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
fi
#check if opponent is in teams
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
if [[ -z $OPPONENT_ID ]]
#if not in teams add to teams and acquire ID
then
OPPONENT_ID_ADDED=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
fi
#insert information into games
GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")
done
