# https://www.hackerrank.com/challenges/ctci-is-binary-search-tree

def checkBST(root):
    return check(root, -1, 10001)

def check(node, min, max):
    if node == None:
        return True
    else:
        return (node.data > min and
                node.data < max and
                check(node.left, min, node.data) and
                check(node.right, node.data, max))
