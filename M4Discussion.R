# Install and load necessary packages
install.packages("igraph")
library(igraph)

install.packages("treemap")
library(treemap)

# Create a larger sample dataset for travel and tours business
customers <- data.frame(
  customer_id = 1:100,
  customer_name = paste0("Customer", 1:100),
  city = sample(c("Pokhara", "Kathmandu", "Lumbini"), 100, replace = TRUE),
  tour_interest = sample(c("Adventure", "Cultural", "Nature"), 100, replace = TRUE),
  booking_status = sample(c("Booked", "Cancelled", "Pending"), 100, replace = TRUE)
)

# Create a directed graph based on customer connections
customer_graph <- graph_from_data_frame(customers[, c("customer_id", "customer_name")], directed = TRUE)

# Visualize the customer network
plot(customer_graph, layout = layout_with_fr, vertex.label = NA, 
     vertex.color = "lightblue", edge.color = "gray", 
     main = "Customer Network")

# Print the graph summary
print(summary(customer_graph))

# Analyze the network based on geolocation
geolocation_analysis <- table(customers$city)
print(geolocation_analysis)

# Visualize the geolocation analysis
barplot(geolocation_analysis, main = "Customer Distribution by City", 
        xlab = "City", ylab = "Number of Customers", col = "skyblue")

# Analyze the network based on tour interest
tour_analysis <- table(customers$tour_interest)
print(tour_analysis)

# Visualize the tour interest analysis using a treemap
treemap(as.data.frame(tour_analysis), index = "Var1", vSize = "Freq", 
        title = "Customer Interests", palette = "Set2")

# Analyze the network based on booking status
booking_analysis <- table(customers$booking_status)
print(booking_analysis)

# Visualize the booking status analysis
barplot(booking_analysis, main = "Booking Status", 
        xlab = "Status", ylab = "Number of Customers", col = "lightgreen")
