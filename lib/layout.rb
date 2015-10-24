def indent(string, amount, char = "\t")
  indenting = true

  string.split("\n").collect do |line|
    result = indenting ? char*amount + line : line

    if line =~ /<pre/ and line !~ /<\/pre>/
      indenting = false
    elsif line !~ /<pre/ and line =~ /<\/pre>/
      indenting = true
    end

    result
  end.join("\n").concat("\n")
end

def link_to_unless_active(text, item)
  if item.path == @item.path
    text
  else
    %(<a href="#{item.path}">#{text}</a>)
  end
end

def nav_link(item)
  text = item[:nav_title] || item[:title]
  link_to_unless_active(text, item)
end

def html_id_for(item)
  id = id_for(item)
  %( id="#{id}")
end

def translate(string)
  I18n.t(string)
end

def date_pretty(datetime)
  I18n.l datetime.to_date
end

def date_iso8601(datetime)
  datetime.strftime('%F')
end
