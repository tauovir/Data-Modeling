import json

data = [
            {"id": "101", "name": "Mohit Kumar", "city": "Delhi", "country": "India"},
            {"id": "101", "name": "Mohit Kumar", "city": "Mumbai", "country": "India"},
            {"id": "103", "name": "Rahul Sharma", "city": "Pune", "country": "India"}
        ]



def data_format():
    """
    Format list of dictionary od data into below format
    output: {"101": {"first_name": "MOHIT", "last_name": "KUMAR", "address": [{"city": "Delhi", "country": "India"}]}, "103": {"first_name": "RAHUL", "last_name": "SHARMA", "address": [{"city": "Pune", "country": "India"}, {"city": "Pune", "country": "India"}]}}
    """
    pass

print(data_format())




def data_format_implemented():
    """
    Format list of dictionary od data into below format
    output: {"101": {"first_name": "MOHIT", "last_name": "KUMAR", "address": [{"city": "Delhi", "country": "India"}]}, "103": {"first_name": "RAHUL", "last_name": "SHARMA", "address": [{"city": "Pune", "country": "India"}, {"city": "Pune", "country": "India"}]}}
    """
    data_rec = {}
    for row in data:
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

print(data_format())
