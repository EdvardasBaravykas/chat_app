import { Application } from "@hotwired/stimulus";

const application = Application.start();

import controllers from "./**/*_controller.js";

controllers.forEach((controller) => {
  application.register(controller.name, controller.module.default);
});

application.debug = process.env.NODE_ENV === "development";
application.warnings = true;
window.Stimulus = application;

export { application };
