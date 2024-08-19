defmodule ThemeToggle.SaladUI.Button do
  @moduledoc false
  use     Phoenix.Component

  @doc """
  Renders a button.

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" class="ml-2">Send!</.button>
  """
  attr(:type, :string, default: nil)
  attr(:class, :any, default: nil)

  attr(:variant, :string,
    values: ~w(default secondary destructive outline ghost link),
    default: "default",
    doc: "the button variant style"
  )

  attr(:size, :string, values: ~w(default sm lg icon iconLarge), default: "default")
  attr(:rest, :global, include: ~w(disabled form name value))

  slot(:inner_block, required: true)

  def(button(assigns)) do
    assigns = assign(assigns, :variant_class, variant(assigns))

    ~H"""
    <button
      type={@type}
      class={[
          "inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50",
          @variant_class,
          @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  attr :text, :string, required: true

  def default_button(assigns) do
    ~H"""
    <.button aria-label={"Button for #{@text}"}>
      <%= @text %>
    </.button>
    """
  end

  @variants %{
    variant: %{
      "default" => "bg-primary text-primary-foreground shadow hover:bg-primary/90",
      "destructive" => "bg-destructive text-destructive-foreground shadow-sm hover:bg-destructive/90",
      "outline" => "border border-input bg-background shadow-sm hover:bg-accent hover:text-accent-foreground",
      "secondary" => "bg-secondary-button text-secondary-button-foreground shadow-sm hover:bg-secondary-button/80",
      "ghost" => "hover:bg-accent hover:text-accent-foreground",
      "link" => "text-primary underline-offset-4 hover:underline"
    },
    size: %{
      "default" => "h-9 px-4 py-2",
      "sm" => "h-8 rounded-md px-3 text-xs",
      "lg" => "h-10 rounded-md px-8",
      "icon" => "h-9 w-9",
      "iconLarge" => "h-12 w-12"
    }
  }

  @default_variants %{
    variant: "default",
    size: "default"
  }

  defp variant(props) do
    variants = Map.take(props, ~w(variant size)a)
    variants = Map.merge(@default_variants, variants)

    Enum.map_join(variants, " ", fn {key, value} -> @variants[key][value] end)
  end
end
