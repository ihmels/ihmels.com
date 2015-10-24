def convert_dates
  @items.each do |item|
    unless item[:published_at].nil?
      item[:published_at] = DateTime.parse(item[:published_at].to_s)
    end

    unless item[:modified_at].nil?
      item[:modified_at] = DateTime.parse(item[:modified_at].to_s)
    end
  end
end

def set_modified_at
  @items.each do |item|
    if !item[:published_at].nil? and item[:modified_at].nil?
      item[:modified_at] = item[:published_at]
    end
  end

  unless @items['/index.*'].nil?
    @items['/index.*'][:modified_at] = latest_publication[:published_at]
  end

  unless @items['/publications.*'].nil?
    @items['/publications.*'][:modified_at] = latest_publication[:published_at]
  end
end

def hide_items
  @items.each do |item|
    if ['css', 'js'].include?(item[:extension])
      item[:is_hidden] = true
    end
  end
end
