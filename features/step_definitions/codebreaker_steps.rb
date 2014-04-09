class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

# features/step_definitions/codebreaker_steps.rb
When /^I start a new game$/ do
  game = Codebreaker::Game.new(output) # using output method
  game.start
end

Then /^I should see "([^\"]*)"$/ do |message|
  output.messages.should include(message)
end