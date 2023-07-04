create database Grupo5

-- Crear la tabla "Customers"
drop table Categorias;
drop table Clientes;
drop table Ordenes;
drop table OrdenDetalles;
drop table Productos;

CREATE TABLE Clientes (
    CustomerID   nchar(5)     NOT NULL,
    CompanyName  nvarchar(40) NOT NULL,
    ContactName  nvarchar(30) NULL,
    Country      nvarchar(15) NULL,
    Phone        nvarchar(24) NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Ordenes (
    OrderID       int          NOT NULL,
    CustomerID    nchar(5)     NULL,
    EmployeeID    int          NULL,
    OrderDate     datetime     NULL,
    ShipCountry   nvarchar(15) NULL,
    ShipVia       int          NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Clientes(CustomerID)
);



CREATE TABLE Categorias (
    CategoryID   int          NOT NULL,
    CategoryName nvarchar(15) NOT NULL,
    Description  ntext        NULL,
    PRIMARY KEY (CategoryID)
);

select * from Categorias;

CREATE TABLE Productos (
    ProductID   int          NOT NULL,
    ProductName nvarchar(40) NOT NULL,
    CategoryID  int          NULL,
    UnitPrice   decimal(10,2) NULL,
    UnitsInStock smallint     NULL,
    PRIMARY KEY (ProductID),
	FOREIGN KEY (CategoryID) REFERENCES Categorias(CategoryID)
);

CREATE TABLE OrdenDetalles(
    OrderDetailID int          NOT NULL,
    OrderID       int          NULL,
    ProductID     int          NULL,
    Quantity      int          NULL,
    UnitPrice     decimal(10,2) NULL,
    PRIMARY KEY (OrderDetailID),
    FOREIGN KEY (OrderID) REFERENCES Ordenes(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Productos(ProductID)
);