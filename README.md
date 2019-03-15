# Oystercard

During week 2, we have been creating an Oystercard system. This version is from when I paired with Riya.

The application so far allows touch in, touch out and a minimum fare to be deducted.

The journey class has been extracted from the Oystercard list but does not yet calculate a fare to allow penalty fare charging.

There is a station class that holds the station and the fare but it is not yet currently used by Oystercard.

## Getting started

`git clone https://github.com/samanthaixer/oystercard_thurs`
`bundle`

## Usage

`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`


## Running tests

`rspec` running rspec on the whole folder will run the tests for Oystercard, Journey and Station

## Challenges

Step 14 of this challenge has been the biggest hurdle so far. Working out how to **extract** a Journey class from an already-working Oystercard class has been hard work! We haven't yet completed all of step 14 as we don't yet charge a penalty fare. 

Switching pairs each afternoon has it's pros and cons. **A huge pro** - getting to know everyone on the cohort and learning from each person. **Another pro** - looking at the code that each previous pair has created shows all sorts of different ways of implementing something. **The con** - moving between pairs can sometimes mean losing work that you have previously done. For example, Matt Tea and I spent a lot of Wednesday getting really comfortable with our tests, refactoring to ensure we didn't test state and making sure we used context blocks and lets to set tests up cleanly. That isn't in this Thursday repo as Riya and I focussed on being able to delegate to the new class and using a double for our testing.

`https://github.com/samanthaixer/oystercard_Weds` is where the amazingly refactored tests reside!
