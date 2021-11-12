using System.Diagnostics;
using System.ServiceProcess;
using System.Timers;

namespace DotNetFrameworkApp.Worker
{
    public partial class Worker : ServiceBase
    {
        private int _eventId = 1;

        public Worker()
        {
            InitializeComponent();
            eventLog1 = new EventLog();
            if (!EventLog.SourceExists("WorkerSVC"))
            {
                EventLog.CreateEventSource("WorkerSVC", "");
            }
            eventLog1.Source = "WorkerSVC";
            eventLog1.Log = "";
        }

        protected override void OnStart(string[] args)
        {
            eventLog1.WriteEntry("In OnStart.");
            // Set up a timer that triggers every minute.
            Timer timer = new Timer
            {
                Interval = 60000 // 60 seconds
            };
            timer.Elapsed += new ElapsedEventHandler(this.OnTimer);
            timer.Start();
        }

        protected override void OnStop()
        {
            eventLog1.WriteEntry("In OnStop.");
        }

        public void OnTimer(object sender, ElapsedEventArgs args)
        {
            // TODO: Insert monitoring activities here.
            eventLog1.WriteEntry("Monitoring the System", EventLogEntryType.Information, _eventId++);
        }
    }
}
