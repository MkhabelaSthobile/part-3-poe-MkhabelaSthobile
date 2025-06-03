using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EventEaseApp.Models
{
    [Table("Booking")]
    public class Booking
    {
        [Key]
        public int? BookingID { get; set; }

        [Required(ErrorMessage = "Please select an event")]
        public int? Event_ID { get; set; }

        [Required(ErrorMessage = "Please select a venue")]
        public int? Venue_ID { get; set; }

        [Required(ErrorMessage = "Please enter a booking date")]
        [DataType(DataType.Date)]
        public DateTime BookingDate { get; set; }

        [ForeignKey("Venue_ID")]
        public Venue? Venue { get; set; }

        [ForeignKey("Event_ID")]
        public Event? Event { get; set; }
    }
}