﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LojaDepartamentoModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class db_loja_departamentoEntities : DbContext
    {
        public db_loja_departamentoEntities()
            : base("name=db_loja_departamentoEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Categoria> Categorias { get; set; }
        public virtual DbSet<Chefia> Chefias { get; set; }
        public virtual DbSet<Cliente> Clientes { get; set; }
        public virtual DbSet<Departamento> Departamentoes { get; set; }
        public virtual DbSet<RegistroVenda> RegistroVendas { get; set; }
        public virtual DbSet<Venda> Vendas { get; set; }
        public virtual DbSet<Vendedor> Vendedors { get; set; }
        public virtual DbSet<Produto> Produtoes { get; set; }
    }
}
