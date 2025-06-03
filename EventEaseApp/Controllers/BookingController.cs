using EventEaseApp.Data;
using EventEaseApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace EventEaseApp.Controllers
{
    public class BookingController : Controller
    {
        private readonly EventEaseAppContext _context;

        public BookingController(EventEaseAppContext context)
        {
            _context = context;
        }

        // GET: BookingController
        public async Task<ActionResult> Index(string searchString)
        {
            var bookings = _context.Booking.Include(b => b.Event).Include(b => b.Venue).AsQueryable();

            if (!string.IsNullOrEmpty(searchString))
            {
                bookings = bookings.Where(b => 
                    b.Venue.VenueName.Contains(searchString) ||
                    b.Event.EventName.Contains(searchString));
            }
            return View(await bookings.ToListAsync());
        }

        // GET: BookingController/Details/5
        public async Task<ActionResult> Details(int id)
        {
            var booking = await _context.Booking.FirstOrDefaultAsync(b => b.BookingID == id);
            if (booking == null)
            {
                return NotFound();
            }
            return View(booking);
        }

        // GET: BookingController/Create



        public IActionResult Create()
        {
            var eventList = _context.Event.ToList();
            var venueList = _context.Venue.ToList();

            // Add a default placeholder item
            eventList.Insert(0, new Event { EventID = 0, EventName = "-- Select Event --" });
            venueList.Insert(0, new Venue { VenueID = 0, VenueName = "-- Select Venue --" });

            ViewBag.EventList = new SelectList(eventList, "EventID", "EventName");
            ViewBag.VenueList = new SelectList(venueList, "VenueID", "VenueName");

            return View();
        }



        // POST: BookingController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Booking booking)
        {
            var selectedEvent = await _context.Event.FirstOrDefaultAsync(e => e.EventID == booking.Event_ID);

            if (selectedEvent == null) 
            {
                ModelState.AddModelError("", "Selected event not found.");
                ViewData["Events"] = _context.Event.ToList();
                ViewData["Venues"] = _context.Venue.ToList();
                return View(booking);
            }

            var conflict = await _context.Booking
                .Include(b => b.Event)
                .AnyAsync(b => b.Venue_ID == booking.Venue_ID && b.Event.EventDate.Date == selectedEvent.EventDate.Date);

            if (conflict)
            {
                ModelState.AddModelError("", "This venue is already booked for that date.");
            }

            if (ModelState.IsValid)
            {
                _context.Add(booking);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewData["Events"] = _context.Event.ToList();
            ViewData["Venues"] = _context.Venue.ToList();
            return View(booking);

        }

        // GET: BookingController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var booking = await _context.Booking.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }
            return View(booking);
        }

        // POST: BookingController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, [Bind("BookingDate")] Booking booking)
        {
            if (id != booking.BookingID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(booking);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!_context.Booking.Any(b => b.BookingID == booking.BookingID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(booking);
        }

        // GET: BookingController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var booking = await _context.Booking.FirstOrDefaultAsync(b => b.BookingID == id);
            if (booking == null)
            {
                return NotFound();
            }
            return View(booking);
        }

        // POST: BookingController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var booking = await _context.Booking.FindAsync(id);
            if (booking != null)
            {
                _context.Booking.Remove(booking);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
