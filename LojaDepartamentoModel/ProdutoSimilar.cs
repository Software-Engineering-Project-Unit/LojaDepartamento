//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class ProdutoSimilar : Produto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProdutoSimilar()
        {
            this.ProdutoSimilar1 = new HashSet<ProdutoSimilar>();
        }
    
        public Nullable<int> IdSimilar { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProdutoSimilar> ProdutoSimilar1 { get; set; }
        public virtual ProdutoSimilar ProdutoSimilar2 { get; set; }
    }
}
