require 'spec_helper'

describe TechnologyAssociates::Job do

  describe '.all' do
    use_vcr_cassette

    it 'returns a list of jobs' do
      jobs = TechnologyAssociates::Job.all

      jobs.size.should == 24
      job = jobs.first

      job.tracking_code.should == '2011392'
      job.title.should == 'IT Support Specialist'
      job.location.should == 'Midwest City, OK, US'
      job.date_posted.should == Date.new(2011, 12, 29)
      job.url.should == 'https://taic.silkroad.com/epostings/index.cfm?fuseaction=app.jobinfo&jobid=217392&company_id=16053&source=ONLINE&JobOwner=992315&byBusinessUnit=NULL&bycountry=0&bystate=0&bylocation=&keywords=&byCat=&tosearch=yes'

      job.description.should == "<dd id=\"jobDesciptionDiv\" class=\"cssDspJobBody\">\r\n\t\t\t\t\t\t<p>Technology Associates is a technical, professional services company providing state-of-the-art solutions to government and commercial clients. Our services include custom-engineered solutions that integrate with the latest technology, resulting in advanced information technology systems; business and management consulting services to assess client needs and reengineer processes; and strategic and tactical program expertise to support continuity and provide comprehensive oversight for mission-critical initiatives.</p>\r\n<p>Technology Associates partners with government and commercial agencies that require development of systems, such as communication systems, asset management, network deployment and engineering services, power and energy management solutions, portal applications, command and control, and geospatial information systems (GIS) to operate more efficiently and profitably.</p>\r\n<p>Under limited supervision, responsible for the resolution of multiple problems/issues arising from a suite of applications to multiple sets of desktop and laptop configuration and operating system versions.\302\240</p>\r\n<ul>\n<li>Analyze configuration issues and develop solutions to individual end-user problems.\302\240</li>\r\n<li>Resolve end-user requests through the analysis of database implementation and integration issues.\302\240</li>\r\n<li>Maintain passwords, data integrity and file system security for the desktop/laptop environment.\302\240</li>\r\n<li>Communicate technical information to both technical and non-technical personnel.\302\240</li>\r\n<li>Assist with the recommendation of hardware and software solutions.\302\240</li>\r\n<li>Perform other duties as required.\302\240\302\240\302\240</li>\r\n</ul>\n<ul>\n<li>Associate\342\200\231s degree or equivalent experience\302\240</li>\r\n<li>Two \342\200\223Five years desktop systems support experience\302\240</li>\r\n<li>A+ /Net+/ Sec+ Certification\302\240</li>\r\n<li>Microsoft Certified Professional highly desired\302\240</li>\r\n<li>ITIL V3 Foundations Certified highly desired</li>\r\n<li>Knowledge of and experience with PC hardware, HP Open View, Remedy Action Request System, NT User Manager for Domains, MS Active Directory, Exchange 2003 and subsequent versions of messaging services, MS 2000 and 2003 Server Administrator, network infrastructure, Windows 2000, XP, Vista, MS Office 2000, 2003 and 2007, desktop and network operating systems and the Air Force Standard Desktop Configuration (SDC) including MS Outlook\302\240</li>\r\n<li>Ability to resolve difficult problems within the assistance of senior support or the use of outside software analysis support\302\240</li>\r\n<li>Professional written and verbal communication skills\302\240</li>\r\n<li>Advanced analytical and problem solving skills\302\240</li>\r\n<li>Customer service skills and/or strong interpersonal skills\302\240</li>\r\n<li>Ability to work independently or in a team environment\302\240</li>\r\n<li>Able to obtain and maintain a Secret security clearance\302\240</li>\r\n<li>Have and maintain a valid state Driver's License\302\240</li>\r\n<li>Able to lift 25 lbs</li>\r\n</ul>\n<p><em>Candidates will be subject to a government background investigation and must meet eligibility criteria for access to classified information. US Citizenship is required. </em></p>\r\n<p><strong>AN EQUAL OPPORTUNITY EMPLOYER\302\240</strong><br>All employment decisions are made without regard to race, color, religion, sex, sexual orientation, national origin, age, creed, ancestry, marital status, non-job-related handicap or disability, veteran status, or any other legally protected status.</p>\r\n\t\t\t\t\t</dd>"
    end
  end

end
