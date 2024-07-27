ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  fragment = Nokogiri::HTML.fragment(html_tag)
  field = fragment.at('input,select,textarea')
  
  field_name = instance_tag.instance_variable_get(:@method_name).to_sym
  model = instance_tag.object
  # TODO: find a way to display all messages at once
  error_message = model.errors.where(field_name).first.full_message

  html = if field
           field['class'] = "#{field['class']} border-2 border-rose-500 text-rose-500"
           html = <<-HTML
              #{fragment.to_s}
              <div class="text-rose-500 text-xs mt-2">#{error_message}</div>
           HTML
           html
         else
           html_tag
         end

  html.html_safe
end
