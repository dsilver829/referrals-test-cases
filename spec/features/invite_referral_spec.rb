require "spec_helper"

feature "Invite an employee to refer a candidate" do
  authenticate, as: recruiter
  fill_in "#candidate_search", with: candidate.name
  click_on "Search" 
  click_on candidate.name
 
  button = first "a.invite-referral"
  button.click

  employee_name = button.parent.find('a.employee').text
  employee = Employee.find_by name: employee_name
  
  open_inbox(employee.email)
  expect(messages(inbox).size).to equal 1
end
