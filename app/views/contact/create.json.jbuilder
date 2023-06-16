json.contact do
  json.primaryContatctId @contacts.first.id
  json.emails @contacts.uniq.pluck(:email).uniq
  json.phoneNumbers [@contacts.pluck(:phoneNumber).uniq]
  json.secondaryContactIds @contacts.where.not(id: @contacts.first.id).pluck(:id).uniq
end