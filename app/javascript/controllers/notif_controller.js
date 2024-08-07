import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notif"
export default class extends Controller {
  remove() {
    setTimeout(() => {
      this.element.remove()
    }, 1000
    )
  }
}
