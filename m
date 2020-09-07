Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD6D25FC49
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 16:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgIGOwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 10:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730038AbgIGOwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:52:08 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B24C061573
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 07:44:16 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 83A87C63C7; Mon,  7 Sep 2020 15:43:09 +0100 (BST)
Date:   Mon, 7 Sep 2020 15:43:09 +0100
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] ir-keytable: re-add --device option
Message-ID: <20200907144309.GA2767@gofer.mess.org>
References: <20200907113659.0143dba2@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907113659.0143dba2@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 07, 2020 at 11:36:59AM +0200, Mauro Carvalho Chehab wrote:
> While --device option doesn't work for enumerating and for RC/LIRC
> specific control, it is still useful for testing purposes
> for all kinds of input devices. For example, it can be used to
> test mouse events:
> 
> 	$ ./utils/keytable/ir-keytable -d /dev/input/event4 -t
> 	Testing events. Please, press CTRL-C to abort.
> 	1222738.567737: event type EV_REL(0x02): REL_X (0x0000) value=1
> 	1222738.567737: event type EV_SYN(0x00).
> 	1222738.573742: event type EV_REL(0x02): REL_X (0x0000) value=1
> 	1222738.573742: event type EV_SYN(0x00).
> 	1222738.581738: event type EV_REL(0x02): REL_X (0x0000) value=2
> 	1222738.581738: event type EV_REL(0x02): REL_Y (0x0001) value=1
> 
> So, re-add it, but only on test mode.

Isn't this the same functionality as evtest(1), but not as complete?

https://cgit.freedesktop.org/evtest/

evtest is packaged for Fedora, Debian, and Ubuntu.


Sean

> 
> Partially reverts: 906719e4c573 ("keytable: remove misleading --device argument")
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/utils/keytable/ir-keytable.1.in b/utils/keytable/ir-keytable.1.in
> index 5237f0be2620..e12de34b2b68 100644
> --- a/utils/keytable/ir-keytable.1.in
> +++ b/utils/keytable/ir-keytable.1.in
> @@ -22,6 +22,9 @@ Auto\-load keymaps, based on a configuration file. Only works with
>  \fB\-c\fR, \fB\-\-clear\fR
>  Clears the scancode to keycode mappings.
>  .TP
> +\fB\-d\fR, \fB\-\-device\fR=\fIDEV\fR
> +Use specified input device. Works only on test mode.
> +.TP
>  \fB\-D\fR, \fB\-\-delay\fR=\fIDELAY\fR
>  Sets the delay before repeating a keystroke.
>  .TP
> @@ -66,6 +69,8 @@ print the v4l2\-utils version
>  Mandatory or optional arguments to long options are also mandatory or optional
>  for any corresponding short options. Options can be combined together.
>  .SS The options arguments are:
> +.IP \fIDEV\fR
> +the /dev/input/event* device to control
>  .IP \fISYSDEV\fR
>  the rc device as found at /sys/class/rc
>  .IP \fIKEYMAP\fR
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index 3df5fcf203ed..021479d6c4e0 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -249,6 +249,7 @@ static const char doc[] = N_(
>  	"You need to have read permissions on /dev/input for the program to work\n"
>  	"\nOn the options below, the arguments are:\n"
>  	"  SYSDEV    - the rc device as found at /sys/class/rc\n"
> +	"  DEV       - the /dev/input/event* device to control\n"
>  	"  KEYMAP    - a keymap file with protocols and scancode to keycode mappings\n"
>  	"  SCANKEY   - a set of scancode1=keycode1,scancode2=keycode2.. value pairs\n"
>  	"  PROTOCOL  - protocol name (nec, rc-5, rc-6, jvc, sony, sanyo, rc-5-sz, lirc,\n"
> @@ -267,6 +268,7 @@ static const struct argp_option options[] = {
>  	{"sysdev",	's',	N_("SYSDEV"),	0,	N_("rc device to control, defaults to rc0 if not specified"), 0},
>  	{"test",	't',	0,		0,	N_("test if IR is generating events"), 0},
>  	{"read",	'r',	0,		0,	N_("reads the current scancode/keycode mapping"), 0},
> +	{"device",	'd',	N_("DEV"),	0,	N_("ir device to control"), 0},
>  	{"write",	'w',	N_("KEYMAP"),	0,	N_("write (adds) the keymap from the specified file"), 0},
>  	{"set-key",	'k',	N_("SCANKEY"),	0,	N_("Change scan/key pairs"), 0},
>  	{"protocol",	'p',	N_("PROTOCOL"),	0,	N_("Protocol to enable (the other ones will be disabled). To enable more than one, use the option more than one time"), 0},
> @@ -285,6 +287,7 @@ static const char args_doc[] = N_("");
>  
>  /* Static vars to store the parameters */
>  static char *devclass = NULL;
> +static char *devicename = NULL;
>  static int readtable = 0;
>  static int clear = 0;
>  int debug = 0;
> @@ -551,6 +554,9 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
>  		if (!p || *p || period < 0)
>  			argp_error(state, _("Invalid period: %s"), arg);
>  		break;
> +	case 'd':
> +		devicename = arg;
> +		break;
>  	case 's':
>  		devclass = arg;
>  		break;
> @@ -2033,7 +2039,7 @@ int main(int argc, char *argv[])
>  	int dev_from_class = 0, write_cnt;
>  	int fd;
>  	static struct sysfs_names *names;
> -	struct rc_device	  rc_dev;
> +	struct rc_device	  rc_dev = { };
>  
>  #ifdef ENABLE_NLS
>  	setlocale (LC_ALL, "");
> @@ -2046,6 +2052,11 @@ int main(int argc, char *argv[])
>  	if (test_keymap)
>  		return 0;
>  
> +	if (devicename &&( !test || devclass || clear || readtable || keytable || ch_proto || cfg.next || delay >= 0 || period >= 0 || bpf_protocol)) {
> +		fprintf (stderr, _("device option can be used only for test events\n"));
> +		return -1;
> +	}
> +
>  	/* Just list all devices */
>  	if (!clear && !readtable && !keytable && !ch_proto && !cfg.next && !test && delay < 0 && period < 0 && !bpf_protocol) {
>  		if (show_sysfs_attribs(&rc_dev, devclass))
> @@ -2061,19 +2072,21 @@ int main(int argc, char *argv[])
>  		fprintf (stderr, _("Auto-mode can be used only with --read, --verbose and --sysdev options\n"));
>  		return -1;
>  	}
> -
> -	names = find_device(devclass);
> -	if (!names)
> -		return -1;
> -	rc_dev.sysfs_name = names->name;
> -	if (get_attribs(&rc_dev, names->name)) {
> +	if (!devicename) {
> +		names = find_device(devclass);
> +		if (!names)
> +			return -1;
> +		rc_dev.sysfs_name = names->name;
> +		if (get_attribs(&rc_dev, names->name)) {
> +			free_names(names);
> +			return -1;
> +		}
> +		names->name = NULL;
>  		free_names(names);
> -		return -1;
> -	}
> -	names->name = NULL;
> -	free_names(names);
>  
> -	dev_from_class++;
> +		devicename = rc_dev.input_name;
> +		dev_from_class++;
> +	}
>  
>  	if (cfg.next) {
>  		struct cfgfile *cur;
> @@ -2124,14 +2137,14 @@ int main(int argc, char *argv[])
>  	}
>  
>  	if (debug)
> -		fprintf(stderr, _("Opening %s\n"), rc_dev.input_name);
> -	fd = open(rc_dev.input_name, O_RDONLY | O_NONBLOCK);
> +		fprintf(stderr, _("Opening %s\n"), devicename);
> +	fd = open(devicename, O_RDONLY | O_NONBLOCK);
>  	if (fd < 0) {
> -		perror(rc_dev.input_name);
> +		perror(devicename);
>  		return -1;
>  	}
>  	if (dev_from_class)
> -		free(rc_dev.input_name);
> +		free(devicename);
>  	if (get_input_protocol_version(fd))
>  		return -1;
>  
> 
> 
> Thanks,
> Mauro
