Given /^any of true, "1", "true", "True", "TRUE", "t", "yes", "y", 1.0, 1, -1, 2$/ do
  @test_objects = [true, "1", "true", "True", "TRUE", "t", "yes", "y", 1.0, 1, -1, 2]
end

Given /^any of false, "0", "false", "False", "FALSE", "f", "no", "n", "", 0.0, 0, nil$/ do
  @test_objects = [false, "0", "false", "False", "FALSE", "f", "no", "n", "", 0.0, 0, nil]
end

Given /^any of "dummy", "any_unexpected_value_at_all"$/ do
  @test_objects = ["dummy", "any_unexpected_value_at_all"]
end

When /^it\'s converted to a boolean value$/ do #' This comment is to unfuxx0r SublimeText 2 Ruby parser. >.<
  @result_objects = @test_objects.map do |obj|
    res = begin
      obj.to_bool
    rescue Object => o
      o
    end
    [obj, res]
  end
end

Then /^I should get true$/ do
  @result_objects.each do |obj|
    assert obj[1] == true
  end
end

Then /^I should get false$/ do
  @result_objects.each do |obj|
    assert obj[1] == false
  end
end

Then /^I should get an ArgumentError$/ do
  @result_objects.each do |obj|
    assert obj[1].class == ArgumentError
  end
end
