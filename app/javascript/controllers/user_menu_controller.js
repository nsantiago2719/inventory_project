import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-menu"
export default class extends Controller {
  toggle_menu() {
    let user_menu = document.getElementById("user-menu")
    if (user_menu.classList.contains("hidden")) {
      user_menu.classList.remove("hidden")
    } else {
      user_menu.classList.add("hidden")
    }
  }
}
