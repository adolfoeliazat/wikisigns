module RoutingFilter
  class FacebookCanvas < Filter
    @@fb_canvas = false
    cattr_reader :fb_canvas

    def around_recognize(path, env, &block)
      @@fb_canvas = extract_segment!(%r(^(/fb_canvas)(?=/|$)), path)
      yield.tap do |params|
        params[:fb_canvas] ||= @@fb_canvas.present?
      end
    end

    def around_generate(*args, &block)
      params = args.extract_options!

      fb_canvas = params.delete(:fb_canvas)
      fb_canvas = @@fb_canvas.present? if fb_canvas.nil?

      yield.tap do |result|
        prepend_segment!(result, 'fb_canvas') if fb_canvas
      end
    end
  end
end
