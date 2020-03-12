// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
import socket from "./socket"

import Axios from "axios";

window.onload = () => {
  Axios.get('/api/messages').then(resp => {
    const { data } = resp.data;
    if (data === undefined) return;
    const msgs = document.querySelector('#messages');
    data.forEach(item => {
      const li = document.createElement('li');
      li.innerText = `[${item.posted_at}] ${item.message}`;
      msgs.appendChild(li);
    });
  });
};
