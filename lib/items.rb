def id_for(item)
  item[:kind] + '-' + item[:published_at].strftime('%Y%m%d')
end

def tag_uri_for(item)
  hostname = /^(?:https?:\/\/)?(?:www\.)?([^\/]+)/i.match(@config[:base_url])[1]
  date = item[:published_at].strftime('%F')
  id = id_for(item)

  "tag:#{hostname},#{date}:#{id}"
end
