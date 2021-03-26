Feature: Users

  @Users
  Scenario: As admin user
  I want to create, update and delete an User
  So that i am able to manipulate the Users

    Given I have access to Todo.ly
    When I send a POST request to http://todo.ly/api/user.json with json
    """
    {
      "Email":"newuser@newuser.com",
      "FullName":"New User",
      "Password":"12345678"
    }
    """
    Then I wait for the response code to be 200
    And I wait for the response body to be
    """
    {
      "Id": "12346",
      "Email": "newuser@newuser.com",
      "FullName": "New User",
      "TimeZone": "0",
      "IsProUser": "false",
      "DefaultProjectId": "124",
      "AddItemMoreExpanded": "false",
      "EditDueDateMoreExpanded": "true",
      "ListSortType": "0",
      "FirstDayOfWeek": "1",
      "NewTaskDueDate": "0"
    }
    """

    When I send an UPDATE request to https://todo.ly/api/user/.JSON with json
    """
    {
      "Email":"updatednewuser@updatednewuser.com",
    }
    """
    Then I wait for the response code to be 200