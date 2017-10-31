using LojaDepartamentoModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de ProdutoController
/// </summary>
[DataObject(true)]
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
    public List<Produto> ListarProduto(String nome, double preco, String categoria)
    {

        if (String.IsNullOrEmpty(nome) && preco == 0 && String.IsNullOrEmpty(categoria))
        {
            return ListarProduto();
        }
        else
        {
            if (!String.IsNullOrEmpty(nome) && preco > 0 && !String.IsNullOrEmpty(categoria))
            {
                db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
                return lojaDepartamentoEntities.Produtoes
                    .Where(produto => produto.Nome.ToLower().Contains(nome.ToLower()) && produto.Preco.Equals(preco) && produto.Categoria.Nome.ToLower().Contains(categoria.ToLower())).ToList<Produto>();
            } else if (!String.IsNullOrEmpty(nome) && preco > 0)
            {
                db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
                return lojaDepartamentoEntities.Produtoes
                    .Where(produto => produto.Nome.ToLower().Contains(nome.ToLower()) && produto.Preco.Equals(preco)).ToList<Produto>();
            } else if (!String.IsNullOrEmpty(nome) && !String.IsNullOrEmpty(categoria))
            {
                db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
                return lojaDepartamentoEntities.Produtoes
                    .Where(produto => produto.Nome.ToLower().Contains(nome.ToLower()) && produto.Categoria.Nome.ToLower().Contains(categoria.ToLower())).ToList<Produto>();
            } else if (preco > 0 && !String.IsNullOrEmpty(categoria))
            {
                db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
                return lojaDepartamentoEntities.Produtoes
                    .Where(produto => produto.Preco.Equals(preco) && produto.Categoria.Nome.ToLower().Contains(categoria.ToLower())).ToList<Produto>();
            } else if (!String.IsNullOrEmpty(nome))
            {
                db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
                return lojaDepartamentoEntities.Produtoes
                    .Where(produto => produto.Nome.ToLower().Contains(nome.ToLower())).ToList<Produto>();
            } else if (preco > 0)
            {
                db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
                return lojaDepartamentoEntities.Produtoes
                    .Where(produto => produto.Preco.Equals(preco)).ToList<Produto>();
            } else if (!String.IsNullOrEmpty(categoria))
            {
                db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
                return lojaDepartamentoEntities.Produtoes
                    .Where(produto => produto.Categoria.Nome.ToLower().Contains(categoria.ToLower())).ToList<Produto>();
            }
            
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

    [DataObjectMethod(DataObjectMethodType.Select)]
    public List<EletroEletronico> ObterSimilar(int Id)
    {
        db_loja_departamentoEntities lojaDepartamentoEntities = new db_loja_departamentoEntities();
        var resultado = lojaDepartamentoEntities.Produtoes.OfType<EletroEletronico>().Where(prod => prod.Id.Equals(Id)).ToList<EletroEletronico>();

        if (resultado.Count().Equals(1))
        {
            return resultado.First<EletroEletronico>().ListaSimilar.ToList();
        }

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
}