class Scraper
################ Helper ####################
def self.dParse(des)
  des.gsub(/[\n]/, ' ').gsub('  ',' ')
end
############################################
#===================DocURLs====================
  def self.get_DocURLs #Complete[X]
    # load
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    # SCRAPES :titles, :urls (DocCount = 2403)
    container.search("a").each do |doc|
      doc_title = doc.text
      docURL = "https://apidock.com" + doc.attribute("href").value
    end
  end
#==============================================
  # requires a doc.url
#==================DocPage=====================
  def self.get_docPage(doc_url) #Complete[X]
    # load
    doc_page = Nokogiri::HTML(open(doc_url))
    doc_page.search(".description p")[0..1].search("em").remove #description prerequisite
    dScrape = doc_page.search(".description p")[0..1].text #description prerequisite
    container = doc_page.search("#related") #methods prerequisite
    container.search("li").search(".related_header").remove #methods prerequisite
    
    # SCRAPES :description, :type, methods (with urls)
    description = dParse(dScrape)
    type = doc_page.search(".title_prefix span").text
    
    container.search("li").each do |meth|
      meth_name = meth.search("a").text
      methURL = "https://apidock.com" + meth.search("a").attribute("href").value
      binding.pry
    end
    
  end
#==============================================
end