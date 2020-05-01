# frozen_string_literal: true
require 'shopify_cli'

module Extension
  module Commands
    class Pack < ShopifyCli::Command
      hidden_command

      YARN_BUILD_COMMAND = %w(yarn build)
      NPM_BUILD_COMMAND = %w(npm run-script build)

      def call(args, command_name)
        CLI::UI::Frame.open(frame_title) do
          @ctx.abort(Content::Pack::BUILD_FAILURE_MESSAGE) unless build.success?
        end
      end

      def self.help
        <<~HELP
          Pack your extension to prepare for deployment.
            Usage: {{command:#{ShopifyCli::TOOL_NAME} pack}}
        HELP
      end

      private

      def frame_title
        Content::Pack::FRAME_TITLE % (yarn_available? ? 'yarn' : 'npm')
      end

      def yarn_available?
        @yarn_availability ||= JsDeps.new(ctx: @ctx).yarn?
      end

      def build
        build_command = yarn_available? ? YARN_BUILD_COMMAND : NPM_BUILD_COMMAND
        @ctx.system(*build_command)
      end
    end
  end
end
