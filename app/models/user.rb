class User < ApplicationRecord
  def tests_by_difficulty(level)
    Test.joins("INNER JOIN usertests ON tests.id = usertests.test_id")
      .where(level: level, usertests: { user_id: self.id } )
  end
end
