# lib/your_app_web/components/theme_toggle.ex
defmodule ThemeToggle do
  use     Phoenix.Component
  alias   Phoenix.LiveView.JS
  import  ThemeToggle.Icons
  import  ThemeToggle.SaladUI.{Button, DropdownMenu, Menu}

  def theme_toggle(assigns) do
    ~H"""
    <div id="theme-toggle-container" class="fixed top-0 right-0 m-4 z-40">
      <.dropdown_menu id="theme-toggle">
        <.dropdown_menu_trigger>
          <.button variant="outline" size="icon" class="relative">
           <.sun_icon class="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0">
           </.sun_icon>
           <.moon_icon class="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all text-black dark:text-white dark:rotate-0 dark:scale-100">
           </.moon_icon>
           <span class="sr-only">
            Toggle theme
           </span>
          </.button>
        </.dropdown_menu_trigger>

        <.dropdown_menu_content align="end">
          <.menu class="w-32">
            <.menu_item id="light-theme" phx-click={JS.dispatch("set_theme", detail: %{theme: "light"})}>
              Light
            </.menu_item>
            <.menu_item id="dark-theme" phx-click={JS.dispatch("set_theme", detail: %{theme: "dark"})}>
              Dark
            </.menu_item>
            <.menu_item id="system-theme" phx-click={JS.dispatch("set_theme", detail: %{theme: "system"})}>
              System
            </.menu_item>
          </.menu>
        </.dropdown_menu_content>
      </.dropdown_menu>
    </div>
    """
  end
end
