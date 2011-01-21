module ApplicationHelper
  
    def coderay(text)  
     text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do  
       CodeRay.scan($3, $2).div(:css => :class)  
     end  
  end
  
    def title
      base_title = "MyHelpToolbox"
      if @title.nil?
        base_title
      else
        "#{base_title} | #{@title}"
      end
    end
  
end
