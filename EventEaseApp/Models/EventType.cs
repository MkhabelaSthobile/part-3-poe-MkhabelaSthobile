using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EventEaseApp.Models
{
    [Table("EventType")]
    public class EventType
    {
        [Key]
        public int EventTypeID { get; set; }

        [MaxLength(500)]
        [Required]
        public string? Name { get; set; }
    }
}
