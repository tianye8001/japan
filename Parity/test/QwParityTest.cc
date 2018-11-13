// Google Test header
#include "gtest/gtest.h"

// Qweak headers
#include "QwParameterFile.h"

TEST(QwParameterFile, ParseIntRange) {
  EXPECT_EQ (1, QwParameterFile::ParseIntRange("-", "1-2").first)
    << "failed to recognize first of closed range";
  EXPECT_EQ (2, QwParameterFile::ParseIntRange("-", "1-2").second)
    << "failed to recognize second of closed range";
  EXPECT_EQ (-10, QwParameterFile::ParseIntRange("-","-10-20").first)
    << "failed to recognize negative first of closed range";
  EXPECT_EQ (0, QwParameterFile::ParseIntRange("-","-100").first)
    << "failed to recognize zero as first of half open range";
  EXPECT_EQ (INT_MAX, QwParameterFile::ParseIntRange("-","100-").second)
    << "failed to recognize MAX_INT as second of half open range";
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
