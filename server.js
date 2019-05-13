var mysql = require("mysql");
var inquirer = require("inquirer");
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "bamazon_db"
});
connection.connect(function(err) {
  if (err) throw err;
  login();
});
function login() {
  inquirer
    .prompt({
      name: "customerOrManager",
      type: "list",
      message: "Please choose your account to log in.\n=======================================",
      choices: ["CUSTOMER", "MANAGER", "EXIT"]
    })
    .then(function(answer) {
      if (answer.customerOrManager === "CUSTOMER") {
        customer();
      }
      else if (answer.customerOrManager === "MANAGER") {
        inquirer
          .prompt({
            name: "loginCredentials",
            type: "input",
            message: "Please enter your password to login (hint: 'admin')\n=======================================",
            validate: function(value) {
                if (value === "admin") {
                    manager();
                }
                return false;
            }
          })
      } else {
          connection.end();
      }
    });
}
function customer() {
connection.query("SELECT * FROM products", function(err, results) {
    if (err) throw err;
    inquirer
      .prompt([
        {
          name: "choice",
          type: "rawlist",
          choices: function() {
            var productArray = [];
            for (var i = 0; i < results.length; i++) {
              productArray.push(results[i].product_name);
            }
            return productArray;
          },
          message: "Select the item you wish to purchase.\n======================================="
        },
        {
          name: "quantity",
          type: "input",
          message: "How many units would you like to buy?\n=======================================",
          validate: function(value) {
            if (value === "" || 0) {
                return false;
            }
            else if (isNaN(value) === false) {
              return true;
            }
            return false;
          }
        }
      ])
      .then(function(answer) {
        var chosenItem;
        for (var i = 0; i < results.length; i++) {
          if (results[i].product_name === answer.choice) {
            chosenItem = results[i];
          }
        }
        if (chosenItem.stock_quantity > parseInt(answer.quantity)) {
          var newStock_quantity = chosenItem.stock_quantity - answer.quantity;
          connection.query(
            "UPDATE products SET ? WHERE ?",
            [
              {
                stock_quantity: newStock_quantity,
              },
              {
                item_id: chosenItem.item_id
              }
            ],
            function(error) {
              if (error) throw err;
              console.log("Your Order is on the way! Your total will be $" + (chosenItem.price * answer.quantity) + "\n==================================================");
              customerStartOverPrompt();
            }
          );
        }
        else {
          console.log("Unfortunately, there is not enough in stock to fulfill your order\n=================================================================");
          customerStartOverPrompt();
        }
      });
  });
}

function customerStartOverPrompt() {
    inquirer
        .prompt({
            name: "againOrLogout",
            type: "list",
            message: "Would you like to place another order?\n========================================",
            choices: ["YES", "LOGOUT"]
        })
        .then(function(answer) {
            if (answer.againOrLogout === "YES") {
                customer();
            } else if (answer.againOrLogout === "LOGOUT") {
                login();
            }
        })
};
function manager() {
    inquirer
        .prompt({
            name: "managerTask",
            type: "list",
            message: "What task would you like to complete.",
            choices: ["View your Catalogue of Products", "View your Low Inventory", "Add to your Inventory", "Add a New Product to your Catalogue", "EXIT"]
        })
        .then(function(answer) {
            switch (answer.managerTask) {
                case "View your Catalogue of Products":
                managerView();
                break;
            
            case "View your Low Inventory Items":
                lowInventoryView();
                break;
            
            case "Add to your Inventory":
                orderInventory();
                break;
            
            case "Add a New Product to your Catalogue":
                createProduct();
                break;
            
            case "EXIT":
                login();
                break;
            }
        });
}
function managerView() {
    connection.query("SELECT * FROM products", function(err, results) {
        if (err) throw err;
        
    }
}
function managerStartOverPrompt() {
    inquirer
        .prompt({
            name: "againOrLogout",
            type: "list",
            message: "Would you like to complete another task?\n========================================",
            choices: ["YES", "LOGOUT"]
        })
        .then(function(answer) {
            if (answer.againOrLogout === "YES") {
                manager();
            } else if (answer.againOrLogout === "LOGOUT") {
                login();
            }
        })
};