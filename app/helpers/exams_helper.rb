module ExamsHelper
 def choose_new_or_edit
  if action_name == 'new' || action_name == 'confirm'
   confirm_exams_path
  elsif action_name == 'edit'
   exam_path
  end 
 end 
end
