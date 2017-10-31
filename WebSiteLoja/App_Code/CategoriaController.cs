using LojaDepartamentoModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CategoriaController
/// </summary>
/// 
[DataObject(true)]
public class CategoriaController
{
    public CategoriaController()
    {
       // db_loja_departamentoEntities lojaDepartamentoEntities =
         //           new db_loja_departamentoEntities();

        //var result = lojaDepartamentoEntities.Produtoes.OfType<EletroEletronico>().ToList<EletroEletronico>();
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<Categoria> ListarCategoria()
    {
        db_loja_departamentoEntities lojaDepartamentoEntities =
                    new db_loja_departamentoEntities();
        return lojaDepartamentoEntities.Categorias.ToList<Categoria>();
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<Categoria> ListarCategoria(String nome)
    {

        if (String.IsNullOrEmpty(nome))
        {
            return ListarCategoria();
        }
        else
        {
            db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
            return lojaDepartamentoEntities.Categorias
                .Where(cat => cat.Nome.ToLower().Contains(nome)).ToList<Categoria>();
        }
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public Categoria Obter(int Id)
    {
        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
        var resultado = from c in lojaDepartamentoEntities.Categorias
                        where c.Id.Equals(Id)
                        select c;

        if (resultado.Count() > 0)
            return resultado.First<Categoria>();

        return null;


    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public void Atualizar(Categoria categoria)
    {

        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        lojaDepartamentoEntities.Categorias.Attach(categoria);

        lojaDepartamentoEntities.Entry(categoria).State = System.Data.Entity.EntityState.Modified;

        lojaDepartamentoEntities.SaveChanges();

    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public void Inserir(Categoria categoria)
    {

        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        lojaDepartamentoEntities.Categorias.Add(categoria);

        lojaDepartamentoEntities.SaveChanges();

    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public void Deletar(Categoria categoria)
    {

        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        lojaDepartamentoEntities.Categorias.Attach(categoria);

        lojaDepartamentoEntities.Entry(categoria).State = System.Data.Entity.EntityState.Deleted;

        lojaDepartamentoEntities.Categorias.Remove(categoria);

        lojaDepartamentoEntities.SaveChanges();

    }
}