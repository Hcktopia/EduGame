import json
import random
import sys

class Player:
    def __init__(self, name, phealth, difficulty):
        self.name = name
        self.phealth = phealth
        self.diff = difficulty

    def start(self):
        print("Hi", self.name, "In this game, you will be using different mathematical operations to defeat the Lich King and save the town.")

    def boss1(self):
        print("As you walk through the corridor, you encounter a skeleton.")
        print("You will never get past me.")
        bhealth = 3
        top = 9
        bottom = 1
        if self.diff == 1:
            top = top
            bottom = bottom
        elif self.diff == 2:
            top = top * 10
            bottom = bottom * 10
        elif self.diff == 3:
            top = top * 100
            bottom = bottom * 100
        while self.phealth > 0 and bhealth > 0:
            num1 = random.randint(bottom, top)
            num2 = random.randint(bottom, top)
            total = num1 + num2
            print("What is the answer to", num1, "+", num2)
            try:
                answer = eval(input())
            except (SyntaxError, NameError):
                print("Invalid input. Please enter a valid number.")
                continue
            if answer == total:
                print("Correct! The skeleton loses 1 health.")
                bhealth -= 1
            elif answer != total:
                print("Incorrect! You lose 1 health.")
                self.phealth -= 1

            if self.phealth == 0:
                print("You lose.")
                break
                sys.exit(0)
            elif bhealth == 0:
                print("You defeat the skeleton and move forward.")
                break

        global phealth
        phealth = self.phealth

    # Add similar corrections to other boss methods...

    def player_details(self):
        print(self.name, "Your current health is", self.phealth)


print("Hello there, traveler! What is your name?")
urname = input("Please enter your name: ")
user_input = ""
while user_input != "y":
    print(urname, "you look like the smart adventuring type. Would you like to go on an adventure? (y or n)")
    user_input = input()
    if user_input == "y":
        print("Great! There are four rooms ahead of you. Each with a monster you must outwit using the skills you have developed in math class.")
    elif user_input == "n":
        print("Take care, traveler. GAME OVER")
        sys.exit(0)
    else:
        print("Invalid input. Please enter 'y' or 'n'")

phealth = 5
difficulty = 0
while difficulty == 0:
    difficulty = eval(input("Enter 1 for easy, 2 for medium, or 3 for hard."))

player1 = Player(urname, phealth, difficulty)
player1.player_details()
player1.start()
player1.boss1()
player1.player_details()
# Add similar calls for other bosses...

information = {"name": urname, "health": phealth, "difficulty": difficulty}
inforjson = json.dumps(information)
print(inforjson)
with open("info.json", "w") as outfile:
    outfile.write(inforjson)
