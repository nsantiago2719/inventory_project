module ApplicationHelper
  def tailwind_button(name, path)
    link_to name, path, class: "bg-blue-500 rounded no-underline text-blue-100 px-4 py-2"
  end

  def notif_color(flash_type)
    if flash_type == "notice"
      ["bg-green-300", "text-green-950"]
    else
      ["bg-red-300", "text-red-950"]
    end
  end
end
