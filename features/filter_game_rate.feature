# language: en

Feature: Search games by rate

  @gamesByRate
  Scenario: Filter games by rate without finding result
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the rate: 'xyz'
      When the user search games by rating
      Then 0 games will match
      And the following message is displayed: No game with the specified rate was found.

  @gamesByRate
  Scenario: Filter games that contain the rate 'M'
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the rate: M y E
      When the user search games by rate
      Then 3 games will match
      And the names of these games are
      | NAME                       |
      | The Witcher 3: Wild Hunt   |
      | The Last of Us             |
      | Super Smash Bros. Ultimate |
      And the following message is displayed: 3 games were found containing the rate: ['M','E']
