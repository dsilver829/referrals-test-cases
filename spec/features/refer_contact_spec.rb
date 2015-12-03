require "spec_helper"

feature "An employee refers a contact for a role" do
  authenticate
  visit contact_page(contact)
  parent = find('a', text: job.name).parent
  parent.first('a.btn-refer').click
  expect(parent.find('a.btn-referred')).to be_true
end
