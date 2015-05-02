Feature: Manage List
  In order to manage the pending task
  A user
  Should manage the pending task list, adding, removing and editing the existing tasks

  Background:
     Given the system knows about the following tasks::
      | title     | description                                             |
      | ror       | Install ruby on rails                                   |
      | bugs      | Fix the windows bug related                             |
      | cucumber  | install cucumber gems                                   |
      | reinstall | reinstall an older version due to another windows bug   |
    

  Scenario: View current tasks
    When the user performs a "GET" to "/todoitems"                        
    Then response should be "200"                                   
    And the JSON response should be:                                    
      """
      [{"id":1,"title":"ror","description":"Install ruby on rails"},
       {"id":2,"title":"bugs","description":"Fix the windows bug related"},
       {"id":3,"title":"cucumber","description":"install cucumber gems"},
       {"id":4,"title":"reinstall","description":"reinstall an older version due to another windows bug"}]
      """

  Scenario: Add a new task
    When the user performs a "POST" to "/todoitems.json" with body:
    """ 
    {"todoitem" : {"title":"new", "description":"task"} }

    """
    Then response should be "201"                                   
    And the JSON response should be:                                    
      """
      {"id":5,"title":"new","description":"task"}
     """


 Scenario: Remove a new task
    When the user performs a "DELETE" to "/todoitems/2.json" 
    Then response should be "204"                                   
    

 Scenario: Edit a task
   When the user performs a "PUT" to "/todoitems/2.json" with body:
    """ 
    {"todoitem" : {"title":"updated", "description":"task updated"} }

    """
    Then response should be "202"                                   
    

 

   