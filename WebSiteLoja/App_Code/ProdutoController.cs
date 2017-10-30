using LojaDepartamentoModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

/// <summary>
/// Summary description for ProdutoController
/// </summary>
public class ProdutoController
{


    public ProdutoController()
    {

    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<Produto> ListarProduto()
    {
        db_loja_departamentoEntities lojaDepartamentoEntities =
                    new db_loja_departamentoEntities();
        return lojaDepartamentoEntities.Produtoes.ToList<Produto>();
        
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<Produto> ListarProduto(String nome)
    {
        if (String.IsNullOrEmpty(nome))
        {
            return ListarProduto();
        }
        else
        {
            db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
            return lojaDepartamentoEntities.Produtoes
                .Where(cat => cat.Nome.ToLower().Contains(nome)).ToList<Produto>();
        }
    }


    [DataObjectMethod(DataObjectMethodType.Select)]
    public Produto Obter(int Id)
    {
        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
        var resultado = from produto in lojaDepartamentoEntities.Produtoes
                        where produto.Id.Equals(Id)
                        select produto;

        if (resultado.Count() > 0)
            return resultado.First<Produto>();
        return null;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public void Atualizar(Produto produto)
    {

        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        lojaDepartamentoEntities.Produtoes.Attach(produto);

        lojaDepartamentoEntities.Entry(produto).State = System.Data.Entity.EntityState.Modified;

        lojaDepartamentoEntities.SaveChanges();

    }


    [DataObjectMethod(DataObjectMethodType.Insert)]
    public void Inserir(Produto produto)
    {

        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        lojaDepartamentoEntities.Produtoes.Add(produto);

        lojaDepartamentoEntities.SaveChanges();

    }


    [DataObjectMethod(DataObjectMethodType.Delete)]
    public void Deletar(Produto produto)
    {

        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        lojaDepartamentoEntities.Produtoes.Attach(produto);

        lojaDepartamentoEntities.Entry(produto).State = System.Data.Entity.EntityState.Deleted;

        lojaDepartamentoEntities.Produtoes.Remove(produto);

        lojaDepartamentoEntities.SaveChanges();

    }


    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<EletroEletronico> ObterSimilares(int Id)
    {
        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();

        var resultado = from produtoSimilar in lojaDepartamentoEntities.Produtoes.OfType<EletroEletronico>()
                        where produtoSimilar.Id.Equals(Id)
                        select produtoSimilar;

        if (resultado.Count() > 0)
            return resultado.ToList<EletroEletronico>();
        return null;
    }


}