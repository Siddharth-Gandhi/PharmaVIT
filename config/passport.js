// config/passport.js

// load all the things we need
var LocalStrategy = require('passport-local').Strategy;

// load up the user model
var mysql = require('mysql');
var bcrypt = require('bcrypt-nodejs');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
// connection.connect();
connection.query('USE ' + dbconfig.database);
// connection.end();
// expose this function to our app using module.exports
module.exports = function (passport) {
  // =========================================================================
  // passport session setup ==================================================
  // =========================================================================
  // required for persistent login sessions
  // passport needs ability to serialize and unserialize users out of session

  // used to serialize the user for the session
  passport.serializeUser(function (user, done) {
    // console.log(user.username)
    done(null, user.login_id);
  });

  // used to deserialize the user
  passport.deserializeUser(function (id, done) {
    // connection.connect();
    // console.log(id)
    connection.query(
      'SELECT * FROM login WHERE login_id = ? ',
      [id],
      function (err, rows) {
        // console.log(rows[0])
        done(err, rows[0]);
      }
    );
    // connection.end();
  });

  // =========================================================================
  // LOCAL SIGNUP ============================================================
  // =========================================================================
  // we are using named strategies since we have one for login and one for signup
  // by default, if there was no name, it would just be called 'local'

  passport.use(
    'local-signup',
    new LocalStrategy(
      {
        // by default, local strategy uses username and password, we will override with email
        usernameField: 'username',
        passwordField: 'password',
        passReqToCallback: true, // allows us to pass back the entire request to the callback
      },
      function (req, username, password, done) {
        // find a user whose email is the same as the forms email
        // we are checking to see if the user trying to login already exists
        // connection.connect();
        // console.log(req);
        connection.query(
          'SELECT * FROM login WHERE username = ?',
          [username],
          function (err, rows) {
            if (err) return done(err);
            if (rows.length) {
              return done(
                null,
                false,
                req.flash('signupMessage', 'That username is already taken.')
              );
            } else {
              // if there is no user with that username
              // create the user
              var newUserMysql = {
                username: username,
                //    password1: bcrypt.hashSync(password, null, null),  // use the generateHash function in our user model
                password: password,
              };

              var insertQuerySignUp =
                "INSERT INTO login ( username, password, role) values (?,?, 'Patient')";
              // connection.connect();
              connection.query(
                insertQuerySignUp,
                [
                  newUserMysql.username,
                  //   bcrypt.hashSync(newUserMysql.password, null, null),
                  newUserMysql.password,
                ],
                function (err, rows) {
                  console.log('JAI HIND');
                  console.log(err);
                  console.log(rows);
                  newUserMysql.login_id = rows.insertId;

                  return done(null, newUserMysql);
                }
              );
              // connection.end();
            }
          }
        );
        // connection.end();
      }
    )
  );

  // =========================================================================
  // LOCAL LOGIN =============================================================
  // =========================================================================
  // we are using named strategies since we have one for login and one for signup
  // by default, if there was no name, it would just be called 'local'

  passport.use(
    'local-login',
    new LocalStrategy(
      {
        // by default, local strategy uses username and password, we will override with email
        usernameField: 'username',
        passwordField: 'password',
        passReqToCallback: true, // allows us to pass back the entire request to the callback
      },
      function (req, username, password, done) {
        // callback with email and password from our form
        // connection.connect();
        connection.query(
          'SELECT * FROM login WHERE login.username = ? and login.password= ? or login.username = ? and login.password= ? ',
          [username, password, username, bcrypt.hashSync(password, null, null)],
          function (err, rows) {
            if (err) return done(err);
            if (!rows.length) {
              // console.log(rows)
              return done(
                null,
                false,
                req.flash('loginMessage', 'No user found.')
              ); // req.flash is the way to set flashdata using connect-flash
            }

            // if the user is found but the password is wrong
            // if (!bcrypt.compareSync(password, rows[0].password))
            if (password != rows[0].password)
              return done(
                null,
                false,
                req.flash('loginMessage', 'Oops! Wrong password.')
              ); // create the loginMessage and save it to session as flashdata

            // all is well, return successful user
            return done(null, rows[0]);
          }
        );
        // connection.end();
      }
    )
  );
};
