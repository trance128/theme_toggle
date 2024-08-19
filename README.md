# Theme Toggle

Theme toggle for Phoenix apps, inspired by shadcn/ui

Provides light theme and dark theme switch, as well as auto-detecting the users' system theme

## Installation

1.  Add theme_toggle to your deps in mix.exs:

```elixir
def deps do
  [
    {:theme_toggle, "~> 0.1.0"}
  ]
end
```

2. Add theme to app.css
- add custom colors / themes
    - go to https://ui.shadcn.com/themes
    - choose your preferred theme
    - click copy code >> Copy
    - paste copied css into your assets/app.css, making sure you don't overwrite the imports at the top
- add the following to your assets/app.css
```
@layer base {
    * {
      @apply border-border;
    }
    body {
      @apply bg-background text-foreground;
    }
  }
```

2. Configure Tailwind
- add *darkMode: ["class"]* to your module.exports:
```
module.exports = {
  darkMode: ["class"],
  etc...
}
```
- add "../deps/theme_toggle/**/*.*ex" to content:
```
content: [
    ...,
    "../deps/theme_toggle/**/*.*ex"
  ],
```
- extend theme:
```
theme: {
  extend: {
    colors: {
      border: "hsl(var(--border))",
      input: "hsl(var(--input))",
      ring: "hsl(var(--ring))",
      background: "hsl(var(--background))",
      foreground: "hsl(var(--foreground))",
      primary: {
        DEFAULT: "hsl(var(--primary))",
        foreground: "hsl(var(--primary-foreground))",
      },
      secondary: {
        DEFAULT: "hsl(var(--secondary-500))",
        foreground: "hsl(var(--secondary-foreground))",
      },
      destructive: {
        DEFAULT: "hsl(var(--destructive))",
        foreground: "hsl(var(--destructive-foreground))",
      },
      muted: {
        DEFAULT: "hsl(var(--muted))",
        foreground: "hsl(var(--muted-foreground))",
      },
      accent: {
        DEFAULT: "hsl(var(--accent))",
        foreground: "hsl(var(--accent-foreground))",
      },
      popover: {
        DEFAULT: "hsl(var(--popover))",
        foreground: "hsl(var(--popover-foreground))",
      },
      card: {
        DEFAULT: "hsl(var(--card))",
        foreground: "hsl(var(--card-foreground))",
      },
    },
    borderRadius: {
      lg: "var(--radius)",
      md: "calc(var(--radius) - 2px)",
      sm: "calc(var(--radius) - 4px)",
    },
  },
}
```
- add tailwind plugins:
```
plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("tailwindcss-animate"),
    ...
]
```

For tailwind animate, you can either *npm i -D tailwindcss-animate* or if you don't want any npm in your modules, change the import to *require("../deps/theme_toggle/assets/js/tailwindcss-animate.js")*

3. Import theme_toggle JS into your assets/app.js:
```
import "../../deps/theme_toggle/assets/js/theme_toggle.js"
```

4. If you're not using Salad UI, import the salad ui css into your app.css:
```
@import "../../deps/theme_toggle/assets/css/salad_ui.css";
... previous imports below ...
@import "tailwindcss/base";
@import "tailwindcss/components";
@import "tailwindcss/utilities";
```

This step is required because theme_toggle uses 3 slighlty modified components from salad ui.  Since modifications were made, this package does not depend on salad ui but the css is still required

### Example files after installation

After installation, your assets/app.css should look something like this:
```
@import "../../deps/theme_toggle/assets/css/salad_ui.css";
@import "tailwindcss/base";
@import "tailwindcss/components";
@import "tailwindcss/utilities";

/* This file is for your main application CSS */

@layer base {
    :root {
      --background: 0 0% 100%;
      --foreground: 224 71.4% 4.1%;
      --card: 0 0% 100%;
      --card-foreground: 224 71.4% 4.1%;
      --popover: 0 0% 100%;
      --popover-foreground: 224 71.4% 4.1%;
      --primary: 262.1 83.3% 57.8%;
      --primary-foreground: 210 20% 98%;
      --secondary: 220 14.3% 95.9%;
      --secondary-foreground: 220.9 39.3% 11%;
      --muted: 220 14.3% 95.9%;
      --muted-foreground: 220 8.9% 46.1%;
      --accent: 220 14.3% 95.9%;
      --accent-foreground: 220.9 39.3% 11%;
      --destructive: 0 84.2% 60.2%;
      --destructive-foreground: 210 20% 98%;
      --border: 220 13% 91%;
      --input: 220 13% 91%;
      --ring: 262.1 83.3% 57.8%;
      --radius: 0.75rem;
      --chart-1: 12 76% 61%;
      --chart-2: 173 58% 39%;
      --chart-3: 197 37% 24%;
      --chart-4: 43 74% 66%;
      --chart-5: 27 87% 67%;
    }
  
    .dark {
      --background: 224 71.4% 4.1%;
      --foreground: 210 20% 98%;
      --card: 224 71.4% 4.1%;
      --card-foreground: 210 20% 98%;
      --popover: 224 71.4% 4.1%;
      --popover-foreground: 210 20% 98%;
      --primary: 263.4 70% 50.4%;
      --primary-foreground: 210 20% 98%;
      --secondary: 215 27.9% 16.9%;
      --secondary-foreground: 210 20% 98%;
      --muted: 215 27.9% 16.9%;
      --muted-foreground: 217.9 10.6% 64.9%;
      --accent: 215 27.9% 16.9%;
      --accent-foreground: 210 20% 98%;
      --destructive: 0 62.8% 30.6%;
      --destructive-foreground: 210 20% 98%;
      --border: 215 27.9% 16.9%;
      --input: 215 27.9% 16.9%;
      --ring: 263.4 70% 50.4%;
      --chart-1: 220 70% 50%;
      --chart-2: 160 60% 45%;
      --chart-3: 30 80% 55%;
      --chart-4: 280 65% 60%;
      --chart-5: 340 75% 55%;
    }
  }
  
  @layer base {
    * {
      @apply border-border;
    }
    body {
      @apply bg-background text-foreground;
    }
  }
```

Your assets/app.js should look something like this:
```
// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"
import "../../deps/theme_toggle/assets/js/theme_toggle.js"      // !!! This line added !!! //

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken}
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
```

Example assets/tailwind.config.js:
```
// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  darkMode: ["class"],
  content: [
    "./js/**/*.js",
    "../lib/theme_toggle_test_web.ex",
    "../lib/theme_toggle_test_web/**/*.*ex",
    "../deps/theme_toggle/**/*.*ex"
  ],
  theme: {
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary-500))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("../deps/theme_toggle/assets/js/tailwindcss-animate.js"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          let size = theme("spacing.6")
          if (name.endsWith("-mini")) {
            size = theme("spacing.5")
          } else if (name.endsWith("-micro")) {
            size = theme("spacing.4")
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": size,
            "height": size
          }
        }
      }, {values})
    })
  ]
}
```

### Example Usage

Simply use the component:
```
<ThemeToggle.theme_toggle />
```

Wrap it in a div and give it whatever padding, position, or whatever else you'd like.

You could add it to your app layout and display the toggle fixed to top of every page, like so:
```
<header>
    <div class="fixed top-0 right-0 m-4 z-40">
      <ThemeToggle.theme_toggle />
    </div>
</header>
<main class="md:px-6 lg:px-8">
  <div class="md:mx-auto max-w-2xl">
    <.flash_group flash={@flash} />
    <%= @inner_content %>
  </div>
</main>
```