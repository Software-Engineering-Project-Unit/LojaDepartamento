/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [db_loja_departamento]
GO
ALTER TABLE [dbo].[Vendedor] DROP CONSTRAINT [FK_Vendedor_Departamento]
GO
ALTER TABLE [dbo].[Venda] DROP CONSTRAINT [FK_Venda_Cliente]
GO
ALTER TABLE [dbo].[RegistroVenda] DROP CONSTRAINT [FK_RegistroVenda_Vendedor]
GO
ALTER TABLE [dbo].[RegistroVenda] DROP CONSTRAINT [FK_RegistroVenda_Venda]
GO
ALTER TABLE [dbo].[RegistroVenda] DROP CONSTRAINT [FK_RegistroVenda_Produto]
GO
ALTER TABLE [dbo].[RegistroVenda] DROP CONSTRAINT [FK_RegistroVenda_Departamento]
GO
ALTER TABLE [dbo].[ProdutoSimilar] DROP CONSTRAINT [FK_ProdutoSimilar_ProdutoSimilar]
GO
ALTER TABLE [dbo].[ProdutoSimilar] DROP CONSTRAINT [FK_ProdutoSimilar_Produto]
GO
ALTER TABLE [dbo].[Produto] DROP CONSTRAINT [FK_Produto_Departamento]
GO
ALTER TABLE [dbo].[Produto] DROP CONSTRAINT [FK_Produto_Categoria]
GO
ALTER TABLE [dbo].[Chefia] DROP CONSTRAINT [FK_Chefia_Vendedor]
GO
ALTER TABLE [dbo].[Chefia] DROP CONSTRAINT [FK_Chefia_Departamento]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[Vendedor]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[Venda]
GO
/****** Object:  Table [dbo].[RegistroVenda]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[RegistroVenda]
GO
/****** Object:  Table [dbo].[ProdutoSimilar]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[ProdutoSimilar]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[Produto]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[Departamento]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Chefia]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[Chefia]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 10-Oct-17 16:30:17 ******/
DROP TABLE [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chefia]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chefia](
	[IdDepartamento] [int] NOT NULL,
	[IdeVendedor] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [PK_Chefia] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC,
	[IdeVendedor] ASC,
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cpf] [nvarchar](11) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[Sigla] [nvarchar](10) NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantidade] [int] NOT NULL,
	[Preco] [float] NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDepartamento] [int] NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdutoSimilar]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdutoSimilar](
	[Id] [int] NOT NULL,
	[IdSimilar] [int] NULL,
 CONSTRAINT [PK_ProdutoSimilar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroVenda]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroVenda](
	[IdProduto] [int] NOT NULL,
	[IdVenda] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorProduto] [float] NOT NULL,
	[IdDepartamento] [int] NOT NULL,
	[IdVendedor] [int] NOT NULL,
 CONSTRAINT [PK_RegistroVenda] PRIMARY KEY CLUSTERED 
(
	[IdProduto] ASC,
	[IdVenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValorTotal] [float] NOT NULL,
	[Comissao] [float] NOT NULL,
	[ComissaoPaga] [bit] NOT NULL,
	[Data] [datetime] NOT NULL,
	[IdCliente] [int] NULL,
 CONSTRAINT [PK_Venda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 10-Oct-17 16:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Rg] [nvarchar](10) NOT NULL,
	[Escolaridade] [smallint] NOT NULL,
	[Desligado] [bit] NOT NULL,
	[DataAdmissao] [date] NOT NULL,
	[CPF] [char](11) NOT NULL,
	[IdDepartamento] [int] NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (10, N'Categoria A')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (11, N'Categoria b')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
ALTER TABLE [dbo].[Chefia]  WITH CHECK ADD  CONSTRAINT [FK_Chefia_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([Id])
GO
ALTER TABLE [dbo].[Chefia] CHECK CONSTRAINT [FK_Chefia_Departamento]
GO
ALTER TABLE [dbo].[Chefia]  WITH CHECK ADD  CONSTRAINT [FK_Chefia_Vendedor] FOREIGN KEY([IdeVendedor])
REFERENCES [dbo].[Vendedor] ([Id])
GO
ALTER TABLE [dbo].[Chefia] CHECK CONSTRAINT [FK_Chefia_Vendedor]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Categoria]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([Id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Departamento]
GO
ALTER TABLE [dbo].[ProdutoSimilar]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoSimilar_Produto] FOREIGN KEY([Id])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[ProdutoSimilar] CHECK CONSTRAINT [FK_ProdutoSimilar_Produto]
GO
ALTER TABLE [dbo].[ProdutoSimilar]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoSimilar_ProdutoSimilar] FOREIGN KEY([IdSimilar])
REFERENCES [dbo].[ProdutoSimilar] ([Id])
GO
ALTER TABLE [dbo].[ProdutoSimilar] CHECK CONSTRAINT [FK_ProdutoSimilar_ProdutoSimilar]
GO
ALTER TABLE [dbo].[RegistroVenda]  WITH CHECK ADD  CONSTRAINT [FK_RegistroVenda_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([Id])
GO
ALTER TABLE [dbo].[RegistroVenda] CHECK CONSTRAINT [FK_RegistroVenda_Departamento]
GO
ALTER TABLE [dbo].[RegistroVenda]  WITH CHECK ADD  CONSTRAINT [FK_RegistroVenda_Produto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[RegistroVenda] CHECK CONSTRAINT [FK_RegistroVenda_Produto]
GO
ALTER TABLE [dbo].[RegistroVenda]  WITH CHECK ADD  CONSTRAINT [FK_RegistroVenda_Venda] FOREIGN KEY([IdVenda])
REFERENCES [dbo].[Venda] ([Id])
GO
ALTER TABLE [dbo].[RegistroVenda] CHECK CONSTRAINT [FK_RegistroVenda_Venda]
GO
ALTER TABLE [dbo].[RegistroVenda]  WITH CHECK ADD  CONSTRAINT [FK_RegistroVenda_Vendedor] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Vendedor] ([Id])
GO
ALTER TABLE [dbo].[RegistroVenda] CHECK CONSTRAINT [FK_RegistroVenda_Vendedor]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [FK_Venda_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [FK_Venda_Cliente]
GO
ALTER TABLE [dbo].[Vendedor]  WITH CHECK ADD  CONSTRAINT [FK_Vendedor_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([Id])
GO
ALTER TABLE [dbo].[Vendedor] CHECK CONSTRAINT [FK_Vendedor_Departamento]
GO
