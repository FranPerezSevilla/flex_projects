Feature: Manage List
  In order to manage the pending task
  A user
  Should manage the pending task list, adding, removing and editing the existing tasks

  Background:
    Given I have 4 tasks in my todoList

  Scenario: View current tasks
    When I ask for the todoList
    Then I should see 4 items

  Scenario: Add a new task
    When I add a new task
    And I ask for the todoList
    Then I should see 5 items 
    And the last task is the new one

  Scenario: Remove a task
    When I remove a task
    And I ask for the todoList
    Then I should see 3 items
    And The missing task is the removed one

  Scenario: Edit a task
    When I edit a task
    And I ask for the todoList
    Then I should see 4 items
    And The edited task has been updated with the new values

  Scenario: Mark a task as done
  	Given I have a task marked as undone
    When I check the undone task
    And I ask for the todoList
    Then I should see 4 items
    And The checked task is shown as done

  Scenario: Mark a task as undone
  	Given I have a task marked as done
    When I uncheck the done task
    And I ask for the todoList
    Then I should see 4 items
    And The unchecked task is shown as undone

   