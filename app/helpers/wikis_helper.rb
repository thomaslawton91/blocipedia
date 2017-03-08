module WikisHelper

def user_is_authorized_for_private
  current_user.admin? || current_user.premium?
end
  
def markdown(text)
  options = {
    filter_html: true,
    hard_wrap: true,
    link_attributes: { rel: 'nowfollow', target: "_blank" },
    space_after_headers: true,
    fenced_code_blocks: true
  }

  extensions = {
    autolink: true,
    superscript: true,
    disable_indented_code_blocks: true
  }

  renderer = Redcarpet::Render::HTML.new(options)
  markdown = Redcarpet::Markdown.new(renderer, extensions)

  markdown.render(text).html_safe
end
