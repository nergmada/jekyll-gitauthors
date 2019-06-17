module Jekyll
    class GitAuthorTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text
        end
  
        def render(context)
            `git log --pretty=format:"%an%x09" #{page.path} | sort | uniq`
        end
    end
end
  
Liquid::Template.register_tag('git_author', Jekyll::GitAuthorTag)