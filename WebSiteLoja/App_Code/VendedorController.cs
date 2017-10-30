using LojaDepartamentoModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

/// <summary>
/// Summary description for Class1
/// </summary>
public class VendedorController
{
    public VendedorController()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Inserir(Vendedor vendedor)
    {

        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        lojaDepartamentoEntities.Vendedors.Add(vendedor);

        lojaDepartamentoEntities.SaveChanges();

    }




}