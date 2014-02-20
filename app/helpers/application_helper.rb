module ApplicationHelper
  # モーダル用リンク
  def modal_link_to(label, options={}, html_options={})
    options.update({ :authenticity_token => form_authenticity_token })
    html_options[:id] ||= 'modal_id'
    return link_to(label, options, html_options)
  end

  # モーダル用JavaScript
  def modal_script(options={})
    opts = {
      :id      => 'modal_id',
      :class   => 'modal',
      :opacity => 0.7,
      :width   => 600,
      :height  => 450,
      :fade    => true
    }.update(options)
    script =<<-END
    <script>
    Event.observe(window, 'load', function() {
      new Control.Modal($('#{opts[:id]}'), {
        className:     '#{opts[:class]}',
        overlayOpacity: #{opts[:opacity]},
        width:  #{opts[:width]},
        height: #{opts[:height]},
        fade:   #{opts[:fade] ? 'true' : 'false'}
      });
    });
    </script>
    END
    return script
  end
end
