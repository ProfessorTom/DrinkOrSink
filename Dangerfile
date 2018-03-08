has_app_changes = !git.modified_files.grep(/ProjectName/).empty?
has_test_changes = !git.modified_files.grep(/ProjectNameTests/).empty?

# If changes are more than 10 lines of code, tests need to be updated too
if has_app_changes && !has_test_changes && git.lines_of_code > 10
  fail("Tests were not updated", sticky: false)
end
