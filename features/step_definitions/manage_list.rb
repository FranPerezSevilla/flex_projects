Given(/^the system knows about the following tasks::$/) do |table|
 
 table.hashes.each do |row|
    
    item = Todoitem.new
    item.title = row["title"]
    item.description = row["description"]
    item.save

  end 

end


When(/^the user performs a "(.*?)" to "(.*?)"$/) do |method, url|
  if method == "GET"  
    get url
  elsif method == "DELETE"
    delete url
  end
end

When(/^the user performs a "(.*?)" to "(.*?)" with body:$/) do |method, url, jsoncontent|
  jsonToBeSent = JSON.parse(jsoncontent)

  if method == "POST"
    #puts "performing post"
    post url, jsonToBeSent
  elsif method == "PUT"
    #puts "performing put"
    put url, jsonToBeSent
  end

end



Then(/^response should be "(.*?)"$/) do |status|
  expect(last_response.status).to eq(status.to_i)
end

Then(/^the JSON response should be:$/) do |jsoncontent|
  expected_json = JSON.parse(jsoncontent)
  response_json = JSON.parse(last_response.body)

  response_json.should == expected_json
end