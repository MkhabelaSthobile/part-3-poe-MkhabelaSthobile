using EventEaseApp.Data;
using EventEaseApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Reflection.Metadata.Ecma335;

namespace EventEaseApp.Controllers
{
    public class EventController : Controller
    {
        private readonly EventEaseAppContext _context;

        public EventController(EventEaseAppContext context)
        {
            _context = context;
        }

        // GET: EventController
        public async Task<ActionResult> Index()
        {
            var events = await _context.Event.Include(e => e.Venue).ToListAsync();
            return View(events);
        }


        // GET: EventController/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var eventItem = await _context.Event.FirstOrDefaultAsync(e => e.EventID == id);

            if (eventItem == null) return NotFound();

            return View(eventItem);
        }


        // GET: EventController/Create
        //public IActionResult Create()
        //{
            //ViewBag.VenueID = new SelectList(_context.Venue, "VenueID", "VenueName");
           // return View();
       // }

        public IActionResult Create()
        {
            ViewBag.VenueList = new SelectList(_context.Venue.ToList(), "VenueID", "VenueName");
            return View();
        }



        // POST: EventController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Event eventItem)
        {
            if (ModelState.IsValid)
            {
                _context.Add(eventItem);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Event created successfully.";
                return RedirectToAction(nameof(Index));
            }

            ViewData["Venues"] = _context.Venue.ToList();
            return View(eventItem);

        }

        // GET: EventController/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if(id == null) return NotFound();

            var events = await _context.Event.FindAsync(id);
            if (events == null)
            {
                return NotFound();
            }

            ViewData["Venues"] = _context.Venue.ToList();
            return View(events);
        }

        // POST: EventController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, Event eventItem)
        {
            if (id != eventItem.EventID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                    _context.Update(eventItem);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = "Event updated successfully";
                    return RedirectToAction(nameof(Index));                           
            }

            ViewData["Venues"] = _context.Venue.ToList();
            return RedirectToAction(nameof(Index));
        }

        // GET: EventController/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            //if (id == null) return NotFound();

            var @eventItem = await _context.Event.Include(e => e.Venue).FirstOrDefaultAsync(e => e.EventID == id);
            if (@eventItem == null) return NotFound();
        
            return View(@eventItem);
        }

        // POST: EventController/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var eventItem = await _context.Event.FindAsync(id);
            if (eventItem == null) return NotFound();

            var isBooked = await _context.Booking.AnyAsync(b => b.Event_ID == id);
            if(isBooked)
            {
                TempData["ErrorMessage"] = "Cannot delete event because it has existing bookings.";
                return RedirectToAction(nameof(Index));
            }

            _context.Event.Remove(eventItem);
            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Event deleted successfully";
            return RedirectToAction(nameof(Index));
        }
    }
}
