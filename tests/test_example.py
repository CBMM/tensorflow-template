from project import example

import unittest

class SampleTestSuite(unittest.TestCase):
    """Basic test cases."""

    def test_example(self):
        assert example.tensorflow_example() == [[3]]


if __name__ == '__main__':
    unittest.main()
