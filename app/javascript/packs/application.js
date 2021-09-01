// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"

// https://github.com/turbolinks/turbolinks/issues/430
document.addEventListener("turbolinks:request-start", (event) => {
  const cspHeader = document.querySelector("meta[name='csp-nonce']");
  if (cspHeader != null) {
    const xhr = event.data.xhr;
    xhr.setRequestHeader("X-Turbolinks-Nonce", cspHeader.content);
  }
});

document.addEventListener("turbolinks:before-cache", () => {
  const styleTags = document.querySelectorAll("style");
  const scriptTags = document.querySelectorAll("script");
  const pageNonce = document.querySelector("meta[name='csp-nonce']");
  if (pageNonce) {
    if (styleTags) {
      styleTags.forEach(tag => { tag.nonce = pageNonce.content; });
    }
    if (scriptTags) {
      scriptTags.forEach(tag => { tag.nonce = pageNonce.content; });
    }
  }
});
