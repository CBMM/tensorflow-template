'''
Example TensorFlow module
'''

# Import the tensorflow module so that its definitions are in scope
import tensorflow as tf

# Define a function that runs an example tensorflow computation and returns the result
# The computation is a simple constant matrix multiplication
def tensorflow_example():
    # A constant 1x2 matrix
    matrix1 = tf.constant([[1., 1.]])
    # A constant 2x1 matrix
    matrix2 = tf.constant([[2.],[1.]])

    # Matrix multiplication resulting in a 1x1 matrix
    product = tf.matmul(matrix1, matrix2)

    # having defined our computational graph, let's run it, print it out, and return it
    with tf.Session() as sess:
        result = sess.run(product)
        print("Result of tensorflow computation: " + str(result))
        return result
