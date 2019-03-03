def pet_shop_name(name)
  return @pet_shop[:name]
end


def total_cash(value)
  return @pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(wallet, change_value)
  @pet_shop[:admin][:total_cash] += change_value
end


def pets_sold(pets)
  @pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pets, number)
  @pet_shop[:admin][:pets_sold] += number
end


def stock_count(pets)
  return @pet_shop[:pets].length
end


def pets_by_breed(pet_shop, breed)
  matches = []
  for pet_breed in pet_shop[:pets]
    matches.push(breed) if pet_breed[:breed] == breed
  end
  return matches
end


def find_pet_by_name(pet_shop, name)
  for pet_name in pet_shop[:pets]
    return pet_name if pet_name[:name] == name
  end
  return nil
end


def remove_pet_by_name (pet_shop, name)
  for pet_name in pet_shop[:pets]
    pet_shop[:pets].delete(pet_name) if pet_name[:name] == name
  end
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end


def customer_cash(customers_with_index)
  for money in @customers
    return money[:cash] if customers_with_index == money
  end
end


def remove_customer_cash(customer_with_index, cost)
  for money in @customers
    return money[:cash] -= cost if customer_with_index == money
  end
end


def customer_pet_count(customer_with_index)
  for all_pets in @customers
    return all_pets[:pets].length if customer_with_index == all_pets
  end
end

def add_pet_to_customer(customer_with_index, new_pet)
  for all_pets in @customers
    all_pets[:pets].push(new_pet) if customer_with_index == all_pets
  end
end

def customer_can_afford_pet(customer_with_index, new_pet)
  for folks in @customers
    return true if folks[:cash] >= @new_pet[:price] && customer_with_index == folks
  end
  return false
end


def sell_pet_to_customer(pet_shop, customer_with_index, pet)
    for folks in @customers
      add_pet_to_customer(customer_with_index, pet) if customer_with_index == folks
      pet_shop[:admin][:pets_sold] += 1 if customer_with_index == folks
    for pet_price in pet_shop[:pets]
      folks[:cash] - pet_price[:price] if customer_with_index == folks
      pet_shop[:admin][:total_cash] + pet_price[:price] if customer_with_index == folks
    end
  end
end
    #could refactor with case maybe
