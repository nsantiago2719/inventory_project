module ApplicationHelper
  def tailwind_button(name, path)
    link_to name, path, class: "bg-blue-500 rounded no-underline text-blue-100 px-4 py-2"
  end
end
