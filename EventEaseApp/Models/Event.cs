using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics;

namespace EventEaseApp.Models
{
    [Table("Event")]
    public class Event
    {
        [Key]
        public int EventID { get; set; }
        //Navigation property
        public int Venue_ID { get; set; }
        public int EventType_ID { get; set; }
        public string? EventName { get; set; }

        [DataType(DataType.Date)]
        public DateTime EventDate { get; set; }
        public string? Description { get; set; }

        [ForeignKey("Venue_ID")]
        public Venue? Venue { get; set; }

        [ForeignKey("EventType_ID")]
        public EventType? EventType {  get; set; }
    }
}
