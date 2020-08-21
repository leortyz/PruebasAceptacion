# language: en

Feature: Search games by study

  @gamesByRate
  Scenario: Filter games by rate without finding result
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the study: 'xyz'
      When the user search games by study
      Then 0 games will match
      And the following message is displayed: No game with the specified study was found.

  @gamesByRate
  Scenario: Filter games that contain the study 'Nintendo'
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the study: Nintendo
      When the user search games by study
      Then 1 games will match
      And the names of these games are
      | NAME                       |
      | Splatoon                   |
      And the following message is displayed: 1 games were found containing the study: Nintendo
