<<<<<<< HEAD
# Admin panel, build easy customizable admin features for your app!
[![Language](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
=======
# Admin Panel ✍️
[![Swift Version](https://img.shields.io/badge/Swift-3.1-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-2-F6CBCA.svg)](http://vapor.codes)
[![Linux Build Status](https://img.shields.io/circleci/project/github/nodes-vapor/admin-panel.svg?label=Linux)](https://circleci.com/gh/nodes-vapor/admin-panel)
[![macOS Build Status](https://img.shields.io/travis/nodes-vapor/admin-panel.svg?label=macOS)](https://travis-ci.org/nodes-vapor/admin-panel)
[![codebeat badge](https://codebeat.co/badges/52c2f960-625c-4a63-ae63-52a24d747da1)](https://codebeat.co/projects/github-com-nodes-vapor-admin-panel)
[![codecov](https://codecov.io/gh/nodes-vapor/admin-panel/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/admin-panel)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/admin-panel)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/admin-panel)
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/admin-panel/master/LICENSE)


Build easy customizable admin features for your app!

## Features
 - Admin user system with roles
 - Welcome mails
 - Reset password
 - Dashboard with easy graphs
 - SSO logins
 
![image](https://cloud.githubusercontent.com/assets/1279756/21502899/83ff79dc-cc53-11e6-8222-40bfa773d361.png)

<<<<<<< HEAD
# Installation

#### Prerequisites:

You will need to setup you project with a PostgreSQL database. Follow the README for [this repo](https://github.com/vapor/postgresql-provider).

#### Install
=======

## 📦 Installation
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7

Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/calebkleveter/postgres-admin-panel.git", majorVersion: 0)
```

<<<<<<< HEAD
#### Config
Create `Config/adminpanel.json`
=======

## Getting started 🚀
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7

### Configs
Create config `adminpanel.json`

```json
{
    "name": "Admin Panel",
    "unauthorizedPath": "/admin/login",
    "loginSuccessPath": "admin/dashboard",
    "loadRoutes": true,
    "loadDashboardRoute": true,
    "profileImageFallbackUrl": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg",
    "welcomeMailViewPath": "Emails/welcome",
    "resetPasswordViewPath": "Emails/reset-password",
    "autoLoginFirstUser": false,
    "ssoRedirectUrl": "https://mysso.com",
    "ssoCallbackPath": "/admin/ssocallback",
    "roles": [
        {
            "title": "Super admin",
            "slug": "super-admin",
            "is_default": false
        },
        {
            "title": "Admin",
            "slug": "admin",
            "is_default": false
        },
        {
            "title": "User",
            "slug": "user",
            "is_default": true
        }
    ],
    "customViews": []
}

```

<<<<<<< HEAD
Create `Config/mail.json`

```
=======
Create config `mail.json`
```json
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7
{
    "smtpHost": "smtp.mailgun.org",
    "smtpPort": "465",
    "user": "",
    "password": "",
    "fromEmail": ""
}
```

<<<<<<< HEAD
Make sure to have `Config/app.json` setup

```
=======
Make sure to have config `app.json` setup
```json
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7
{
    "name": "MY-PROJECT",
    "url": "0.0.0.0:8080"
}

```

The url here will be used as redirect link in invite emails fx.


### main.swift
<<<<<<< HEAD

```
=======
```swift
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7
import AdminPanel
```

And add provider (before defining routes, but after defining cache driver)
<<<<<<< HEAD

```
=======
```swift
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7
try drop.addProvider(AdminPanel.Provider.self)

/// ... routes goes here

```

### Custom Controller and Views

**View:**

To add custom pages to the admin dashboard, you can create a view starting with the following template:

```
#extend("Layout/layout-page-sidebar")

#export("page-header") {
	<div>
    	<h3>PAGE-NAME</h3>
	</div>
}

#export("content") {

}
```
Then add what you want to the `content` export. Finally, add the path to the view to the `customViews` array in the `adminpanel.json` config. This will create a page with the URL of:

```
/admin/dashboard/FILE-NAME
```

To add a link to the side bar, you will need to go to `Resources/Views/Layout/Partials/Navigation/navigation.leaf` and add the link in the unordered list following the format of the one already there:

```
 <li>
    <a class="list-group-item #active(request, "/admin/dashboard/PAGE-NAME")" href="/admin/dashboard/PAGE-NAME">
        <span class="icon">
            <span class="fa fa-ICON-NAME"></span>
        </span>
        LINK-NAME
    </a>
</li>
```

**Controller:**

You might want to create custom routes for these views for posting to the server from a form or something like that. What you will do is create a controller that conforms to `AdminPanelController`:

```
extension CONTROLLER: AdminPanelController {
    func addRoutes(to group: RouteGroup<Droplet.Value, (RouteGroup<Droplet.Value, Droplet>)>) {
        // Add routes to the group passed in.
    }
}
```

Then assign the `customController` an instance of the controller just created:

```
AdminPanel.customController = CONTROLLER()
```

Do this *before* adding the provider to the droplet.

### Seed data
<<<<<<< HEAD

=======
Add the seeder command to your `main.swift`
```swift
drop.commands.append(AdminPanel.Seeder(drop: drop))
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7
```

And then run the command in your terminal (remember to build the project first)
```swift
vapor run admin-panel:seeder
```

### UI package

#### Prerequisites

- node.js > v4.0
- npm > v3.0
- bower > 2.0

With brew
```
brew install node
brew install npm
brew install bower
npm install -g gulp
```

#### Setup

- Copy the files from `Packages/AdminPanel-X.Y.Z/Sources/AdminPanel/gulp` to the ROOT of your project
- Copy the files from `Packages/AdminPanel-X.Y.Z/Sources/AdminPanel/Resources` to the `Resources` folder in your project
- Copy the files from `Packages/AdminPanel-X.Y.Z/Sources/AdminPanel/Public/favicon.ico` and the `favicon` folder to the `Public` folder in your project
- Run `npm install` > `bower install` > `gulp build`

#### Read more

Wiki: https://github.com/nodes-vapor/admin-panel/wiki

Github: https://github.com/nodes-frontend/nodes-ui

Doc: https://nodes-frontend.github.io/nodes-ui/
<<<<<<< HEAD
=======

#### Using views from packages (for development)
```swift
drop.view = LeafRenderer(
    viewsDir: Droplet().workDir + "/Packages/AdminPanel-0.5.4/Sources/AdminPanel/Resources/Views"
)
```


## 🏆 Credits

This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com).
The package owner for this project is [Steffen](https://github.com/steffendsommer).


## 📄 License

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
>>>>>>> fd04d8b411fb4a014e0dbb295de02aad5b9fdab7
