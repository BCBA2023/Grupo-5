--create database Grupo5
use Grupo5;


drop table Categorias;
drop table Clientes;
drop table Ordenes;
drop table OrdenDetalles;
drop table Productos;

CREATE TABLE Clientes (
    CustomerID   int  NOT NULL,
    FirstName  nvarchar(200) NULL,
	LastName  nvarchar(200) NULL,
	Correo	  nvarchar(200) NULL , 
    Country     nvarchar(100) NULL,
    Phone       nvarchar(24) NULL,
    PRIMARY KEY (CustomerID)
);
	
create table Store (
	StoreID int not null,
	nameStore nvarchar(200) not null unique,
	adress nvarchar(200) null,
	PRIMARY KEY (StoreID)
);

CREATE TABLE Ordenes (
    OrderID       int     NOT NULL,
    CustomerID    int     NULL,
    OrderDate     datetime     NULL,
    StoreID		  int NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Clientes(CustomerID),
	FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

CREATE TABLE Categorias (
    CategoryID   int          NOT NULL,
    CategoryName nvarchar(200) NOT NULL,
	Detail nvarchar(200) NOT NULL,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE Productos (
    ProductID   int          NOT NULL,
    ProductName nvarchar(40) NOT NULL,
    CategoryID  int          NULL,
    UnitPriceCost   decimal(10,2) NULL,
    UnitsInStock smallint     NULL,
    PRIMARY KEY (ProductID),
	FOREIGN KEY (CategoryID) REFERENCES Categorias(CategoryID)
);

CREATE TABLE OrdenDetalles(
    OrderDetailID int          NOT NULL,
    OrderID       int          NULL,
    ProductID     int          NULL,
    Quantity      int          NULL,
    UnitPriceSell decimal(10,2) not NULL,
	igv			  decimal(10,2) not NULL,
    PRIMARY KEY (OrderDetailID),
    FOREIGN KEY (OrderID) REFERENCES Ordenes(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Productos(ProductID)
);

INSERT INTO Clientes
values ( 1, 'Jose', 'Martinez', 'jmartinez@gmail.com', 'Perú', '945657809'),
       ( 2, 'Maria', 'Zavaleta', 'mzavaletag@gmail.com', 'Perú', '946654809'),
       ( 3, 'Carlos', 'Rosales', 'crosales4@gmail.com', 'Perú', '955627709'),
       ( 4, 'Sara', 'Gutierrez', 'sgutierrezs@gmail.com', 'Perú', '945355809'),
       ( 5, 'Raul', 'Gonzales', 'rgonzales@gmail.com', 'Perú', '943454809'),
       ( 6, 'Jorge', 'Vela', 'jvelao@gmail.com', 'Perú', '955457704'),
       ( 7, 'Luis', 'Rodriguez', 'lrodriguez@gmail.com', 'Perú', '935556809'),
       ( 8, 'Carla', 'Fernandez', 'cfernandez@gmail.com', 'Perú', '945480409'),
       ( 9, 'Manuel', 'Linares', 'mlinares5@gmail.com', 'Perú', '945656703'),
       ( 10, 'Laura', 'Gomez', 'lgomez@gmail.com', 'Perú', '958656702')
go
	

------------------
