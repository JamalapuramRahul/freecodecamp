#!/bin/bash
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=number_guesstest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
fi

RANDOM_NUMBER=$(($RANDOM % 1000 +1))
# echo $RANDOM_NUMBER

echo -e "\nEnter your username:"
read USERNAME

GET_USERNAME=$($PSQL "select username from users where username='$USERNAME'")

if [[ -z $GET_USERNAME ]]
then
  INSERT_USER=$($PSQL "insert into users(username) values('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES=$($PSQL "select count(*) from users inner join games using(user_id) where username='$USERNAME'")
  MIN_GUESS=$($PSQL "select min(num_guesses) from users inner join games using(user_id) where username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $MIN_GUESS guesses."
fi

GUESS=1
echo "Guess the secret number between 1 and 1000:"
while read NUMBER
do
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $NUMBER -gt $RANDOM_NUMBER ]]
    then 
      echo "It's lower than that, guess again:"
    elif [[ $NUMBER -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $GUESS tries. The secret number was $NUMBER. Nice job!"
      break;
    fi
  fi
  GUESS=$(( $GUESS+1 ))
done 

GET_USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")
INSERT_NEW_GAME=$($PSQL "insert into games(num_guesses,user_id) values($GUESS,$GET_USER_ID)")