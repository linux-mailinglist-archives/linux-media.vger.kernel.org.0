Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C611369F9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 10:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgAJJ3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 04:29:13 -0500
Received: from gofer.mess.org ([88.97.38.141]:35799 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726759AbgAJJ3M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 04:29:12 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6141611A001; Fri, 10 Jan 2020 09:29:10 +0000 (GMT)
Date:   Fri, 10 Jan 2020 09:29:10 +0000
From:   Sean Young <sean@mess.org>
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] media: rc: add keymap for Videostrong KII Pro
Message-ID: <20200110092910.GA4721@gofer.mess.org>
References: <20191120114153.17676-1-mohammad.rasim96@gmail.com>
 <20191231104434.GA1515@gofer.mess.org>
 <20200102180258.wg3hxnaaazejhvht@manjaro.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102180258.wg3hxnaaazejhvht@manjaro.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 02, 2020 at 09:02:58PM +0300, Mohammad Rasim wrote:
> On 19/12/31 10:44AM, Sean Young wrote:
> > Hi Mohammad,
> >
> > On Wed, Nov 20, 2019 at 02:41:53PM +0300, Mohammad Rasim wrote:
> > > Changes since v1:
> > > - fix styling issues
> > > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > ---
> > >  drivers/media/rc/keymaps/Makefile             |  1 +
> > >  .../media/rc/keymaps/rc-videostrong-kii-pro.c | 84 +++++++++++++++++++
> > >  include/media/rc-map.h                        |  1 +
> > >  3 files changed, 86 insertions(+)
> > >  create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> > >
> > > diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> > > index a56fc634d2d6..ea91a9afa6a0 100644
> > > --- a/drivers/media/rc/keymaps/Makefile
> > > +++ b/drivers/media/rc/keymaps/Makefile
> > > @@ -117,6 +117,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
> > >  			rc-videomate-m1f.o \
> > >  			rc-videomate-s350.o \
> > >  			rc-videomate-tv-pvr.o \
> > > +			rc-videostrong-kii-pro.o \
> > >  			rc-wetek-hub.o \
> > >  			rc-wetek-play2.o \
> > >  			rc-winfast.o \
> > > diff --git a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> > > new file mode 100644
> > > index 000000000000..2b94c28ed5d7
> > > --- /dev/null
> > > +++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> > > @@ -0,0 +1,84 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +//
> > > +// Copyright (C) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > +
> > > +#include <media/rc-map.h>
> > > +#include <linux/module.h>
> > > +
> > > +//
> > > +// Keytable for the Videostrong KII Pro STB remote control
> > > +//
> > > +
> >
> > I assume it's this remote:
> >
> > https://i1.wp.com/www.eyalo.com/wp-content/uploads/2016/10/KIIPro-items1.jpg
> >
> > or
> >
> > https://www.cnx-software.com/2016/08/26/videostrong-kii-pro-android-set-top-box-with-dvb-t2-dvb-s2-tuners-comes-with-2gb-ram/
> >
> Yes, your assumption is right
> 
> The vendor driver uses this file to setup keymaps
> https://github.com/OpenVisionE2/amremote/blob/master/k1pro.conf
> 
> > > +static struct rc_map_table kii_pro[] = {
> > > +	{ 0x59, KEY_POWER },
> > > +	{ 0x19, KEY_MUTE },
> > > +	{ 0x42, KEY_RED },
> > > +	{ 0x40, KEY_GREEN },
> > > +	{ 0x00, KEY_YELLOW },
> > > +	{ 0x03, KEY_BLUE },
> > > +	{ 0x4a, KEY_BACK },
> > > +	{ 0x48, KEY_FORWARD },
> > > +	{ 0x08, KEY_PREVIOUSSONG},
> > > +	{ 0x0b, KEY_NEXTSONG},
> > > +	{ 0x46, KEY_PLAYPAUSE },
> > > +	{ 0x44, KEY_STOP },
> > > +	{ 0x1f, KEY_FAVORITES},	//KEY_F5?
> > > +	{ 0x04, KEY_RECORD},
> >
> > KEY_PVR?
> What's the difference between the two ? on vendor dtv app this button
> starts recording the current program

A PVR is a personal video recorder. When pressing the button you expect
the PVR app to open or start recording. The remote does say PVR.

> >
> > > +	{ 0x4d, KEY_EPG},
> > > +	{ 0x02, KEY_INFO},
> > > +	{ 0x09, KEY_SUBTITLE},
> > > +	{ 0x01, KEY_AUDIO},
> > > +	{ 0x0d, KEY_HOMEPAGE},
> > > +	{ 0x11, KEY_G},		// DTV ?
> >
> > KEY_TV?
> Ok, will use this in the next version.
> >
> > > +	{ 0x06, KEY_UP},
> > > +	{ 0x5a, KEY_LEFT},
> > > +	{ 0x1a, KEY_ENTER},	// KEY_OK ?
> > > +	{ 0x1b, KEY_RIGHT},
> > > +	{ 0x16, KEY_DOWN},
> > > +	{ 0x45, KEY_MENU},
> > > +	{ 0x05, KEY_ESC},
> > > +	{ 0x13, KEY_VOLUMEUP },
> > > +	{ 0x17, KEY_VOLUMEDOWN },
> > > +	{ 0x58, KEY_F6},
> >
> > KEY_APPSELECT?
> Ok.
> >
> > > +	{ 0x12, KEY_KATAKANA},	// mouse
> >
> > I realise mouse doesn't have a good mapping. However katakana, the
> > Japanese script, seems a little odd.
> >
> What do you suggest ? I was thinking of using KEY_VENDOR but i don't
> really know what that code does

KEY_VENDOR is for a vendor-specific key. Since this button doesn't have
a good mapping, KEY_VENDOR is fine. Keep the comment though, so it can
be updated once there is a good mapping for the mouse key.

> > > +	{ 0x55, KEY_PAGEUP},	// KEY_CHANNELUP ?
> > > +	{ 0x15, KEY_PAGEDOWN},	//KEY_CHANNELDOWN ?
> > > +	{ 0x52, KEY_1},
> > > +	{ 0x50, KEY_2},
> > > +	{ 0x10, KEY_3},
> > > +	{ 0x56, KEY_4},
> > > +	{ 0x54, KEY_5},
> > > +	{ 0x14, KEY_6},
> > > +	{ 0x4e, KEY_7},
> > > +	{ 0x4c, KEY_8},
> > > +	{ 0x0c, KEY_9},
> > > +	{ 0x18, KEY_F7},
> > > +	{ 0x0f, KEY_0},
> > > +	{ 0x51, KEY_BACKSPACE},
> > > +
> >
> > Please remove this blank line.
> Ok
> >
> > > +};
> > > +
> > > +static struct rc_map_list kii_pro_map = {
> > > +	.map = {
> > > +		.scan     = kii_pro,
> > > +		.size     = ARRAY_SIZE(kii_pro),
> > > +		.rc_proto = RC_PROTO_NEC,
> > > +		.name     = RC_MAP_KII_PRO,
> > > +	}
> > > +};
> > > +
> > > +static int __init init_rc_map_kii_pro(void)
> > > +{
> > > +	return rc_map_register(&kii_pro_map);
> > > +}
> > > +
> > > +static void __exit exit_rc_map_kii_pro(void)
> > > +{
> > > +	rc_map_unregister(&kii_pro_map);
> > > +}
> > > +
> > > +module_init(init_rc_map_kii_pro)
> > > +module_exit(exit_rc_map_kii_pro)
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_AUTHOR("Mohammad Rasim <mohammad.rasim96@gmail.com>");
> > > diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> > > index afd2ab31bdf2..c2ef3906e1cd 100644
> > > --- a/include/media/rc-map.h
> > > +++ b/include/media/rc-map.h
> > > @@ -271,6 +271,7 @@ struct rc_map *rc_map_get(const char *name);
> > >  #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
> > >  #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
> > >  #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
> > > +#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
> > >  #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
> > >  #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
> > >  #define RC_MAP_WINFAST                   "rc-winfast"
> > > --
> > > 2.24.0


Thanks
Sean
