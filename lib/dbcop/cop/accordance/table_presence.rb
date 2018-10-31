# frozen_string_literal: true

require_relative '../cop'

module Dbcop
  module Accordance
    # Check the presence of the underlying table for the model
    class TablePresence < Cop
      def call
        result = ActiveRecord::Base.connection.table_exists?(model.table_name)
        logger.info("#{model.name} has no underlying table #{model.table_name}") if logger && !result
        result
      end
    end
  end
end
