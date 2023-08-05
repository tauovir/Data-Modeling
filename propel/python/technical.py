
class Matrix:
    def __init__(self):
        self.matrix = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]

    def row_addtion(self):
        # output:[6, 15, 24]
        row_add = [sum(row) for row in self.matrix]
        print(row_add)

    def col_addtion(self):
        # Result: [12, 15, 18]
        res = []
        for ind,row in enumerate(self.matrix):
            for indx,val in enumerate(row):
                if ind == 0:
                    res = row
                else:
                    res[indx] = res[indx] + val

        print("Result:",res)

    def flatten(self):
        flat = [ele for rows in self.matrix for ele in rows]
        print(flat)

if __name__ =="__main__":
    obj = Matrix()
    obj.flatten()