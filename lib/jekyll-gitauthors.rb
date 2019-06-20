module Jekyll
    class GitAuthorTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text
        end
  
        def lookup(context, name)
            lookup = context
            name.split(".").each { |value| lookup = lookup[value] }
            lookup
        end

        def render(context)
            `git log --pretty=format:"%an," #{lookup(context, 'page.path')} | sort | uniq`
        end
    end
    class GitAuthorAllTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text
        end
  
        def lookup(context, name)
            lookup = context
            name.split(".").each { |value| lookup = lookup[value] }
            lookup
        end

        def render(context)
            `git log --pretty=format:"%an," . | sort | uniq`
        end
    end
end
  
Liquid::Template.register_tag('git_author', Jekyll::GitAuthorTag)
Liquid::Template.register_tag('git_author_all', Jekyll::GitAuthorTag)