# frozen_string_literal: true

require "active_support/all"
require "guard/compat/plugin"
require "erb_lint/cli"

require "guard/erb_lint/options"

module Guard
  class ErbLint < Plugin
    # Initializes a Guard plugin.
    # Don't do any work here, especially as Guard plugins get initialized even if they are not in an active group!
    #
    # @param [Hash] options the custom Guard plugin options
    # @option options [Array<Guard::Watcher>] watchers the Guard plugin file watchers
    # @option options [Symbol] group the group this Guard plugin belongs to
    # @option options [Boolean] any_return allow any object to be returned from a watcher
    #
    def initialize(options = {})
      @options = Guard::ErbLint::Options.with_defaults(options).with_indifferent_access
      super
    end

    # Called once when Guard starts. Please override initialize method to init stuff.
    #
    # @raise [:task_has_failed] when start has failed
    # @return [Object] the task result
    #
    def start
      Compat::UI.info("Guard::ERBLint initialized")
      run_all if @options[:all_on_start]
    rescue StandardError
      throw(:task_has_failed)
    end

    # Called when just `enter` is pressed
    # This method should be principally used for long action like running all specs/tests/...
    #
    # @raise [:task_has_failed] when run_all has failed
    # @return [Object] the task result
    #
    def run_all
      run("--lint-all")
    rescue StandardError
      throw(:task_has_failed)
    end

    # Called on file(s) additions that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_additions has failed
    # @return [Object] the task result
    #
    def run_on_additions(paths)
      run_all_or_block { run(*paths) }
    end

    # Called on file(s) modifications that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_modifications has failed
    # @return [Object] the task result
    #
    def run_on_modifications(paths)
      run_all_or_block { run(*paths) }
    end

    def run(*args)
      @cli ||= ERBLint::CLI.new

      Compat::UI.info("Running ERBLint with args #{args.join(", ")}")

      @cli.run(["bundle", "exec", "erblint", *args])
    end

    private

    def run_all_or_block
      throw_on_err do
        if @options[:all_on_change]
          run_all
        else
          yield
        end
      end
    end

    def throw_on_err
      yield
    rescue StandardError
      throw(:task_has_failed)
    end
  end
end
