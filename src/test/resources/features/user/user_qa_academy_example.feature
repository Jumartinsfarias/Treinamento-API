
# charset: UTF-8

@JIRA-001
  Feature: Simple example
    Scenario: Cucumber example
      Given the user is on the table
      When the user get out
      Then the user should see the window

    Scenario: Simple user post
        Given the user wants to create a new user
        And the user fills field "login" with value equal "stellaagapito"
        And the user fills field "full_name" with value equal "Stella Agapito"
        And the user fills field "age" with value equal "8"
        And the user fills field "email" with value equal "stellaagapito@gmail.com"
        When the user saves new user
        Then the user should see "save with success" message

    Scenario: Simple user get
      Given the user wants to create a new user
      And the user fills field "login" with value equal "stellaagapito"
      And the user fills field "full_name" with value equal "Stella Agapito"
      And the user fills field "age" with value equal "8"
      And the user fills field "email" with value equal "stellaagapito@gmail.com"
      And the user saves new user
      When the user gets the same user
      Then the user should see "success" message
      And the user should see field "login" with value "stellaagapito"
      And the user should see field "full_name" with value "Stella Agapito"
      And the user should see field "age" with value "8"
      And the user should see field "email" with value "stellaagapito@gmail.com"

    Scenario: Simple user delete
      Given the user wants to create a new user
      And the user fills field "login" with value equal "stellaagapito"
      And the user fills field "full_name" with value equal "Stella Agapito"
      And the user fills field "age" with value equal "8"
      And the user fills field "email" with value equal "stellaagapito@gmail.com"
      And the user saves new user
      And the user deletes the same user
      Then the user should see "not content" message

      When the user gets the same user
      Then the user should see "not found" message

    Scenario: Simple user contract
      Given the user wants to create a new user
      And the user fills field "login" with value equal "stellaagapito"
      And the user fills field "full_name" with value equal "Stella Agapito"
      And the user fills field "age" with value equal "8"
      And the user fills field "email" with value equal "stellaagapito@gmail.com"
      And the user saves new user
      When the user gets the same user
      Then the user should see your schema

    Scenario: Simple builder and environment data
      Given the user wants to create a new user
      And the user fills all fields
      And the user saves new user
      When the user gets the same user
      Then the user should see "success" message
      And the user should see field "login" with value "dadosdev"
      And the user should see field "full_name" with value "Dados Dev"
      And the user should see field "age" with value "43"
      And the user should see field "email" with value "dados.dev@gft.com"

