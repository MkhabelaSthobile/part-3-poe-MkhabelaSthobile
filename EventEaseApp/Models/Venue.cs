using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EventEaseApp.Models
{
    [Table("Venue")]
    public class Venue
    {
        public int VenueID { get; set; }

        [Required]
        public string? VenueName { get; set; }

        [Required]
        public string? Location { get; set; }

        [Required]
        public int Capacity { get; set; }


        public string? ImageURL { get; set; }

        //For uploading from the Create/Edit form
        [NotMapped]
        public IFormFile? ImageFile { get; set; }

        //Navigation property to Event
        public ICollection<Event>? Event { get; set;  }
    }
}
