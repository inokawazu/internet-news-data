### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 30fe24e6-4584-11eb-1bbe-69bdf11577da
using DataFrames

# ╔═╡ 78006de0-4584-11eb-3990-d344428fb2ee
using CSV

# ╔═╡ 60da9828-4586-11eb-149b-93667e86c30f
md"""
# Data Analysis of Internet News
- [x] Import Data
- [x] Display column names
- [x] Plot the distrbution of sources, authors
- [ ] Make a word cloud.
"""

# ╔═╡ 59890220-4587-11eb-000d-17acdb41c67d
md"Importing the data file, \"articles_data.csv\""

# ╔═╡ 1d24d176-4585-11eb-33fe-a9d9abfc94ba
data = DataFrame(CSV.File("articles_data.csv"))

# ╔═╡ ae1a254c-4589-11eb-3361-8fffaa22f423
md"summary of data"

# ╔═╡ 9b855258-4589-11eb-1000-351ffd4e2a25
md"Removing the rows with missing Data"

# ╔═╡ 0c5a65c0-4589-11eb-1ed4-ebb3eb1a1874
DataFrames.dropmissing!(data)

# ╔═╡ d7941d3a-4587-11eb-0d16-6979760f882d
md"Importing Statistics and Ploting modules"

# ╔═╡ a72321de-458a-11eb-1c45-0ddd309b920b
names(data)

# ╔═╡ b6bf5f22-458a-11eb-0afd-a35685a58d7e
source_name_counts = Dict(title => count(x -> x == title, data.source_name) for title ∈ unique(data.source_name))

# ╔═╡ 9a93c46e-458f-11eb-3f1a-5bd1e2bae0d4
total_number_of_sources = source_name_counts |> values |> sum

# ╔═╡ 3e95df84-4590-11eb-3f87-87b652fc252d
(x -> ("$(x[1]) = $(round(x[2]/total_number_of_sources*100; digits = 2))%")).(Tuple(source_name_counts))

# ╔═╡ cfb5335e-459d-11eb-22a2-b3ead0a592bc
md"The titles' word distrobution."

# ╔═╡ Cell order:
# ╟─60da9828-4586-11eb-149b-93667e86c30f
# ╠═30fe24e6-4584-11eb-1bbe-69bdf11577da
# ╠═78006de0-4584-11eb-3990-d344428fb2ee
# ╟─59890220-4587-11eb-000d-17acdb41c67d
# ╟─1d24d176-4585-11eb-33fe-a9d9abfc94ba
# ╠═ae1a254c-4589-11eb-3361-8fffaa22f423
# ╟─9b855258-4589-11eb-1000-351ffd4e2a25
# ╠═0c5a65c0-4589-11eb-1ed4-ebb3eb1a1874
# ╟─d7941d3a-4587-11eb-0d16-6979760f882d
# ╠═a72321de-458a-11eb-1c45-0ddd309b920b
# ╟─b6bf5f22-458a-11eb-0afd-a35685a58d7e
# ╟─9a93c46e-458f-11eb-3f1a-5bd1e2bae0d4
# ╟─3e95df84-4590-11eb-3f87-87b652fc252d
# ╟─cfb5335e-459d-11eb-22a2-b3ead0a592bc
