def publications
  @items.select do |item|
    ['article', 'index'].include?(item[:kind])
  end
end

def sorted_publications
  publications.sort_by { |item| item[:published_at] }.reverse
end

def latest_publications
  sorted_publications.first(10)
end

def latest_publication
  latest_publications.first
end
