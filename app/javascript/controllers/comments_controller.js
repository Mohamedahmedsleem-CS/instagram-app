import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    clear(){
      this.element.reset();
    }
  }

//  making this field an empty  field  after posting the comment 
// 1- use a stimulus which is another part of turbo let's here at the JS controllers 
// 2- import controller from hotwired stimulus 
// 3- add the function which will be triggered when the post is submitted to make the form to be reset and its field ( clear() )  