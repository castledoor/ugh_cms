activate :directory_indexes

set :relative_links, true
set :haml, { ugly: true, format: :html5 }

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/404.html", directory_index: false

configure :build do
  activate :external_pipeline,
    name: :gulp,
    command: "npm run production",
    source: ".tmp",
    latency: 1

  ignore "javascripts/all.js"
  ignore "stylesheets/site"

  activate :gzip

  activate :minify_html do |html|
    html.remove_quotes = false
    html.remove_intertag_spaces = true
  end
end

activate :dato,
  token: '73fe31ca4776cfe72aa536fa80083b43614ee61ccdbaf284e9',
  base_url: 'http://lifeguard-chimpanzee-26586.netlify.com/'