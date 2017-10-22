# https://www.hackerrank.com/challenges/ctci-linked-list-cycle

def has_cycle(head):
    visited = [head]
    current = head
    while True:
        current = current.next
        if current == None:
            return False
        if current in visited:
            return True
        visited.append(current)
