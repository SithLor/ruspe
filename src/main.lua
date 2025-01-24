-- main.lua

-- Function to create a table with sample data
local function createData()
    local data = {
        { id = 1, name = "Alice", age = 30 },
        { id = 2, name = "Bob", age = 25 },
        { id = 3, name = "Charlie", age = 35 }
    }
    return data
end

-- Function to print the data
local function printData(data)
    for _, entry in ipairs(data) do
        print(string.format("ID: %d, Name: %s, Age: %d", entry.id, entry.name, entry.age))
    end
end

-- Main execution
local data = createData()
printData(data)

local StockFrame  = {
    sell= []
    buy = []

}