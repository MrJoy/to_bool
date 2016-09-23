Feature: Monkey patches for to_bool
  In order to make development more fluid

  Scenario: Converting various values that we want to treat as 'true' to booleans
    Given any of true, "1", "true", "True", "TRUE", "t", "yes", "y", 1.0, 1, -1, 2
    When it's converted to a boolean value
    Then I should get true

  Scenario: Converting various values that we want to treat as 'false' to booleans
    Given any of false, "0", "false", "False", "FALSE", "f", "no", "n", "", 0.0, 0, nil
    When it's converted to a boolean value
    Then I should get false

  Scenario: Converting strings to boolean values when we can't make a good guess about their truthiness
    Given any of "dummy", "any_unexpected_value_at_all"
    When it's converted to a boolean value
    Then I should get an ArgumentError
