module ApplicationHelper
  def tailwind_button(name, path)
    link_to name, path, class: "bg-blue-500 no-underline text-white px-4 py-2 font-semibold shadow-sm w-full block text-center"
  end

  def notif_color(flash_type)
    if flash_type == "notice"
      ["bg-green-300", "text-green-950"]
    else
      ["bg-red-300", "text-red-950"]
    end
  end

  def current_user
    Current.user
  end

  def current_user?
    Current.user.present?
  end


end
