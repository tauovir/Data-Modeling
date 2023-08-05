import json


class Records:
    def __init__(self):
        self.records = [
            {"id": "101", "name": "Mohit Kumar", "city": "Delhi", "country": "India"},
            {"id": "101", "name": "Mohit Kumar", "city": "Mumbai", "country": "India"},
            {"id": "103", "name": "Rahul Sharma", "city": "Pune", "country": "India"}
        ]

    def formated(self):
        """
        output: {"101": {"first_name": "MOHIT", "last_name": "KUMAR", "address": [{"city": "Delhi", "country": "India"}]}, "103": {"first_name": "RAHUL", "last_name": "SHARMA", "address": [{"city": "Pune", "country": "India"}, {"city": "Pune", "country": "India"}]}}

        :return:
        """
        data_rec = {}
        for row in self.records:
            if row["id"] not in data_rec:
                temp_dict = {"first_name": row['name'].split(" ")[0].upper(),
                             "last_name": row['name'].split(" ")[-1].upper()}
                addres = {"city": row["city"], "country": row["country"]}
                temp_dict["address"] = [addres]
                data_rec[row["id"]] = temp_dict
        else:
            adde = {"city": row["city"], "country": row["country"]}
            dict1 = data_rec[row['id']]
            dict1["address"].append(adde)
            data_rec[row["id"]] = dict1
        return json.dumps(data_rec)


if __name__ == "__main__":
    obj = Records()
    print(obj.formated())
