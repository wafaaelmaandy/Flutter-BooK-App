using BookApp.Date;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BookApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsjsonController : ControllerBase
    {

        private readonly BookappContext _context;

        public ContactsjsonController(BookappContext context)
        {
            _context = context;
        }

        // GET: api/<ContactsjsonController>
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_context.Contacts.ToList());
        }

        // GET api/<ContactsjsonController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ContactsjsonController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ContactsjsonController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ContactsjsonController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
