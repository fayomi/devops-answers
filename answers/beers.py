import requests

r = requests.get('https://api.punkapi.com/v2/beers')
beer_data = r.json()

print("Here is the entire api data: ")
print(beer_data)


print("\nThese are the beers and their ABV values")
for data in beer_data:
    print(data["name"], ",", data["abv"])


specified_value = float(input("Enter an abv value that you want the beers to be greater than:\n"))


print("\nThese are the beers with ABV values greater than {}".format(specified_value))
for data in beer_data:
    if data["abv"] > specified_value:
        print(data["name"], ",", data["abv"])


print("\nThese are all the beers sorted in ascending order based on their abv values")

beer_names = []
beer_abv = []
for data in beer_data:
    beer_names.append(data["name"])
    beer_abv.append(data["abv"])


beer_list = zip(beer_names, beer_abv)


def getAbv(number):
    return number[1]

final = sorted(beer_list, key=getAbv)

for f in final:
    print(f[0], ",", f[1])
