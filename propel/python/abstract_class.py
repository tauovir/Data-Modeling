from abc import ABC, abstractmethod,abstractproperty


class MatrixMeta(ABC):
    # Declaring A Method As Abstract Requires A Subclass To Implement It
    # Declaring A Method As property Requires A Subclass To Implement It


    @abstractproperty
    def matrix_val(self):
        pass
    @abstractmethod
    # output:[6, 15, 24]
    def row_addtion(self):
        pass

    @abstractmethod
    # output: [12, 15, 18]
    def col_addtion(self):
        pass

    @abstractmethod
    # output: [1, 2, 3, 4, 5, 6, 7, 8, 9]
    def flatten(self):
        pass

    @abstractmethod
    # Output: [[3, 2, 1], [6, 5, 4], [9, 8, 7]]
    def row_reverse(self):
        pass


class Matrix(MatrixMeta):

    def __init__(self):
        self.mat = self.matrix_val()

    def matrix_val(self):
        mat = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        return mat

    def row_addtion(self):
        row_add = [sum(row) for row in self.mat]
        print(row_add)

    def col_addtion(self):

        res = []
        for ind, row in enumerate(self.mat):
            for indx, val in enumerate(row):
                if ind == 0:
                    res = row
                else:
                    res[indx] = res[indx] + val

        print("Result:", res)

    def flatten(self):
        flat = [ele for rows in self.mat for ele in rows]
        print(flat)

    def row_reverse(self):
        # Result: [[3, 2, 1], [6, 5, 4], [9, 8, 7]]
        reverse_row = [row[::-1] for row in self.mat]
        print(reverse_row)


if __name__ == "__main__":
    obj = Matrix()
    obj.row_reverse()
