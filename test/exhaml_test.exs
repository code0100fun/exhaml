defmodule Exhaml do
  @self_closing_tags ["meta", "img", "link", "br", "hr", "input", "area", "base"]

  defrecord Line, tag: "", attributes: []

  def parse(text) do
    String.split(text, "\n") |> tokenize([]) |> build_hierachy
  end

  def tokenize([], acc) do: acc
  def tokenize(h|tail, acc) do
    acc ++ cond do
      h
      # "%div" -> ["%", "div", ".", "elixir"]
    end
    tokenize(tail, acc)
  end

  def build_hierachy(token_list) do
    token_list
  end

  @doc """
    Steps to parse haml
    1. Read in text
    2. build Line hierachy
      - match tags
    3. build html based on Line hierachy

  """
end

# def render(text) do
#   parse(text) |> build_html([])
# end

# def build_html(lines, indent) do
#   html = ""
#   indent ||= []
#   lines.each do |l|
#     html += open(l.tag, l.attributes)
#     html += newline
#     indent << indent_char
#     html += indent.join()
#     html += render(l.children, indent)
#     indent.pop()
#     html += newline
#     html += close(l.tag) unless self_closing(l.tag)
#     html += newline
#   end
#  end

# html\n\thead\n\tbody\n\t\tdiv\n\t\t\tp
# html
#   head
#   body
#     div

  # lines = [Line(tag: "html",
#               children: [
#                 Line(tag: "head", children: [], indent: 1),
#                 Line(tag: "body", children: [
#                   Line(tag: "div", children: ["Hello World!", Line(tag: "p")])
#                 ], indent: 1),
#                 Line(tag: "footer", children: []),
#               ])
#             ]

defmodule ExhamlTest do
  use ExUnit.Case

  test "parse div tags" do
    assert Exhaml.Line[tag: "div"] == Exhaml.parse("%div")
    assert Exhaml.Line[tag: "div", attributes: [{"data-class", "elixir"}]] == Exhaml.parse(".elixir")
  end

  test "parse tag with children" do
    assert true
  end

  test "parse other tags" do
    assert true
  end

  test "parse self closing tags" do
    assert true
    # "meta", "img", "link", "br", "hr", "input", "area", "base"
    # assert "<meta />" == Exhaml.render("%meta")
    # assert "<img />" == Exhaml.render("%img")
    # assert "<link />" == Exhaml.render("%link")
    # assert "<hr />" == Exhaml.render("%hr")
    # assert "<input />" == Exhaml.render("%input")
    # assert "<area />" == Exhaml.render("%area")
    # assert "<base />" == Exhaml.render("%base")
    # assert "<br />" == Exhaml.render("%br")
  end
end
