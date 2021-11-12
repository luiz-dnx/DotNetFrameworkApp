# DotNetFrameworkApp

DotNetFrameworkApp sample application written using ASP.NET Framework 4.8.

This project is part of an AWS CodePipeline Blueprint.

Here's the current project structure.
```
(root directory name)
├── buildspec.yml
├── DotNetFrameworkApp.sln
├── DotNetFrameworkApp.API
│   ├── .ebextensions
│   │   └── waf.config
│   ├── App_Start
│   │   ├── SwaggerConfig.cs
│   │   └── WebApiConfig.cs
│   ├── Controllers
│   │   ├── HealthController.cs
│   │   └── ValuesController.cs
│   ├── aws-windows-deployment-manifest.json
│   ├── DotNetFrameworkApp.API.csproj
│   ├── Global.asax
│   └── Web.config
├── DotNetFrameworkApp.Worker
│   ├── App.config
│   ├── DotNetFrameworkApp.Worker.csproj
│   ├── Program.cs
│   ├── ProjectInstaller.cs
│   └── Worker.cs
├── DotNetFrameworkApp.Worker.WebApp
│   ├── .ebextensions
│   │   └── waf.config
│   ├── App_Start
│   │   └── WebApiConfig.cs
│   ├── Controllers
│   │   ├── HealthController.cs
│   │   └── StatusController.cs
│   ├── aws-windows-deployment-manifest.json
│   ├── DotNetFrameworkApp.Worker.WebApp.csproj
│   ├── Global.asax
│   └── Web.config
```
