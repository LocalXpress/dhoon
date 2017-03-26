<?php
error_reporting(0);

$CONF = $TMPL = array();

// The MySQL credentials
$CONF['host'] = 'localhost';
$CONF['user'] = 'root';
$CONF['pass'] = '';
$CONF['name'] = 'dhoon_db';

// The Installation URL
$CONF['url'] = 'http://www.inverticals.com/dhoon';

// The Notifications e-mail
$CONF['email'] = 'no-reply@inverticals.com';

// The themes directory
$CONF['theme_path'] = 'themes';

$CONF['salt'] = 'swdhbc234nf';

$action = array('admin'			=> 'admin',
				'explore'		=> 'explore',
				'stream'		=> 'stream',
				'settings'		=> 'settings',
				'messages'		=> 'messages',
				'track'			=> 'track',
				'playlist'		=> 'playlist',
				'upload'		=> 'upload',
				'recover'		=> 'recover',
				'profile'		=> 'profile',
				'stats'			=> 'stats',
				'pro'			=> 'pro',
				'notifications'	=> 'notifications',
				'search'		=> 'search',
				'page'			=> 'page',
				'welcome'		=> 'welcome'
				);
?>