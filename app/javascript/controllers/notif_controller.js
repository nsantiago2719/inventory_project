import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notif"
export default class extends Controller {
  remove() {
    this.element.remove()
    console.log("triggered")
  }
}
