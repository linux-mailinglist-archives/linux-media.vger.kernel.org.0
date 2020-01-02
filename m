Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F6112E9AF
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2020 19:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbgABSDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 13:03:03 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54423 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgABSDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jan 2020 13:03:03 -0500
Received: by mail-wm1-f68.google.com with SMTP id b19so6276782wmj.4
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2020 10:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FFyDg3uLkQV1fv1eW0SdeDKExfjXH+jqElM9xm3N+mE=;
        b=IyjQx2TsOKtrZUjGr32WE9tImZJ0Cs0VNxUB/BerBDl76d1w8iRX+rISHEWql+T+Tl
         1kOMYN1xtE+8FPo5pbHKi+cGhvQXozhBtLRYpU/kDuUDxKTtWQkOqS/y3QVBY5OIBoY3
         VMDwpu5jOPmz45+6ORZOxM/bzCavs5HfWc5KRBAOvhUvtamUK39OvNI34aCU/H/Aivmf
         CrPTiz/VjJvV+6fbkt4F3JitTBNnDhjGb5DO1/8Y86cafKE3iRentOBWkL+XHtcDzibj
         mynkdClh8P5sfOECY3WwGz5YoddstdxeWn7xoS9K6mq72NXHvkOPvrq8mEWoZ/3+2lqp
         pipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FFyDg3uLkQV1fv1eW0SdeDKExfjXH+jqElM9xm3N+mE=;
        b=VoqdGAcF2T5i0LmQikIMWFzvbqizyG1ZGCJswe7sgZZFR66jDIHz46j4gmTNx29ayh
         fdo/lbRrBT9kfhBBaBLzKFLriba3Uw16OjXvPtPuGi/BqtyG3+sdyPj9aMIgd1SWDnrc
         IE9nOsDizSQZvbp4XCltkumtatJ5F9fwmdLQgc2sEuBWDg/IgM2uFkwt346RR8Ue3dNp
         6rBZhO7ffUMnaa/ghC3wNcUHLAUFcbQJlXVCcg8tz3G7YJfLTNnC9rMUq5p7WY08e3SL
         pWnY0DQQvh1krwwbkI0ciFDAJn/6M1aPILr7oRzSU4fYiy5/g27fTxREefdTPjYt25YE
         NcZg==
X-Gm-Message-State: APjAAAWdefG2GfS3IFVE2HO2HOGe39FO0OelJdT+XX8AyegvVAYE7K19
        YTiXgMKM8cLuDR3Smz29+B8im8z1
X-Google-Smtp-Source: APXvYqxwaq9MI/GfW6a6oewkPo4iUwtskE7uZGyiY+A2CyW+ECLDnYB6TUgvtJOBk+QJZETsOtU5dA==
X-Received: by 2002:a1c:e289:: with SMTP id z131mr14635877wmg.18.1577988180975;
        Thu, 02 Jan 2020 10:03:00 -0800 (PST)
Received: from localhost ([37.237.208.41])
        by smtp.gmail.com with ESMTPSA id w22sm8893812wmk.34.2020.01.02.10.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 10:03:00 -0800 (PST)
Date:   Thu, 2 Jan 2020 21:02:58 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] media: rc: add keymap for Videostrong KII Pro
Message-ID: <20200102180258.wg3hxnaaazejhvht@manjaro.localdomain>
References: <20191120114153.17676-1-mohammad.rasim96@gmail.com>
 <20191231104434.GA1515@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191231104434.GA1515@gofer.mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/12/31 10:44AM, Sean Young wrote:
> Hi Mohammad,
>
> On Wed, Nov 20, 2019 at 02:41:53PM +0300, Mohammad Rasim wrote:
> > Changes since v1:
> > - fix styling issues
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> >  drivers/media/rc/keymaps/Makefile             |  1 +
> >  .../media/rc/keymaps/rc-videostrong-kii-pro.c | 84 +++++++++++++++++++
> >  include/media/rc-map.h                        |  1 +
> >  3 files changed, 86 insertions(+)
> >  create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> >
> > diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> > index a56fc634d2d6..ea91a9afa6a0 100644
> > --- a/drivers/media/rc/keymaps/Makefile
> > +++ b/drivers/media/rc/keymaps/Makefile
> > @@ -117,6 +117,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
> >  			rc-videomate-m1f.o \
> >  			rc-videomate-s350.o \
> >  			rc-videomate-tv-pvr.o \
> > +			rc-videostrong-kii-pro.o \
> >  			rc-wetek-hub.o \
> >  			rc-wetek-play2.o \
> >  			rc-winfast.o \
> > diff --git a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> > new file mode 100644
> > index 000000000000..2b94c28ed5d7
> > --- /dev/null
> > +++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// Copyright (C) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > +
> > +#include <media/rc-map.h>
> > +#include <linux/module.h>
> > +
> > +//
> > +// Keytable for the Videostrong KII Pro STB remote control
> > +//
> > +
>
> I assume it's this remote:
>
> https://i1.wp.com/www.eyalo.com/wp-content/uploads/2016/10/KIIPro-items1.jpg
>
> or
>
> https://www.cnx-software.com/2016/08/26/videostrong-kii-pro-android-set-top-box-with-dvb-t2-dvb-s2-tuners-comes-with-2gb-ram/
>
Yes, your assumption is right

The vendor driver uses this file to setup keymaps
https://github.com/OpenVisionE2/amremote/blob/master/k1pro.conf

> > +static struct rc_map_table kii_pro[] = {
> > +	{ 0x59, KEY_POWER },
> > +	{ 0x19, KEY_MUTE },
> > +	{ 0x42, KEY_RED },
> > +	{ 0x40, KEY_GREEN },
> > +	{ 0x00, KEY_YELLOW },
> > +	{ 0x03, KEY_BLUE },
> > +	{ 0x4a, KEY_BACK },
> > +	{ 0x48, KEY_FORWARD },
> > +	{ 0x08, KEY_PREVIOUSSONG},
> > +	{ 0x0b, KEY_NEXTSONG},
> > +	{ 0x46, KEY_PLAYPAUSE },
> > +	{ 0x44, KEY_STOP },
> > +	{ 0x1f, KEY_FAVORITES},	//KEY_F5?
> > +	{ 0x04, KEY_RECORD},
>
> KEY_PVR?
What's the difference between the two ? on vendor dtv app this button
starts recording the current program
>
> > +	{ 0x4d, KEY_EPG},
> > +	{ 0x02, KEY_INFO},
> > +	{ 0x09, KEY_SUBTITLE},
> > +	{ 0x01, KEY_AUDIO},
> > +	{ 0x0d, KEY_HOMEPAGE},
> > +	{ 0x11, KEY_G},		// DTV ?
>
> KEY_TV?
Ok, will use this in the next version.
>
> > +	{ 0x06, KEY_UP},
> > +	{ 0x5a, KEY_LEFT},
> > +	{ 0x1a, KEY_ENTER},	// KEY_OK ?
> > +	{ 0x1b, KEY_RIGHT},
> > +	{ 0x16, KEY_DOWN},
> > +	{ 0x45, KEY_MENU},
> > +	{ 0x05, KEY_ESC},
> > +	{ 0x13, KEY_VOLUMEUP },
> > +	{ 0x17, KEY_VOLUMEDOWN },
> > +	{ 0x58, KEY_F6},
>
> KEY_APPSELECT?
Ok.
>
> > +	{ 0x12, KEY_KATAKANA},	// mouse
>
> I realise mouse doesn't have a good mapping. However katakana, the
> Japanese script, seems a little odd.
>
What do you suggest ? I was thinking of using KEY_VENDOR but i don't
really know what that code does
> > +	{ 0x55, KEY_PAGEUP},	// KEY_CHANNELUP ?
> > +	{ 0x15, KEY_PAGEDOWN},	//KEY_CHANNELDOWN ?
> > +	{ 0x52, KEY_1},
> > +	{ 0x50, KEY_2},
> > +	{ 0x10, KEY_3},
> > +	{ 0x56, KEY_4},
> > +	{ 0x54, KEY_5},
> > +	{ 0x14, KEY_6},
> > +	{ 0x4e, KEY_7},
> > +	{ 0x4c, KEY_8},
> > +	{ 0x0c, KEY_9},
> > +	{ 0x18, KEY_F7},
> > +	{ 0x0f, KEY_0},
> > +	{ 0x51, KEY_BACKSPACE},
> > +
>
> Please remove this blank line.
Ok
>
> > +};
> > +
> > +static struct rc_map_list kii_pro_map = {
> > +	.map = {
> > +		.scan     = kii_pro,
> > +		.size     = ARRAY_SIZE(kii_pro),
> > +		.rc_proto = RC_PROTO_NEC,
> > +		.name     = RC_MAP_KII_PRO,
> > +	}
> > +};
> > +
> > +static int __init init_rc_map_kii_pro(void)
> > +{
> > +	return rc_map_register(&kii_pro_map);
> > +}
> > +
> > +static void __exit exit_rc_map_kii_pro(void)
> > +{
> > +	rc_map_unregister(&kii_pro_map);
> > +}
> > +
> > +module_init(init_rc_map_kii_pro)
> > +module_exit(exit_rc_map_kii_pro)
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Mohammad Rasim <mohammad.rasim96@gmail.com>");
> > diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> > index afd2ab31bdf2..c2ef3906e1cd 100644
> > --- a/include/media/rc-map.h
> > +++ b/include/media/rc-map.h
> > @@ -271,6 +271,7 @@ struct rc_map *rc_map_get(const char *name);
> >  #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
> >  #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
> >  #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
> > +#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
> >  #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
> >  #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
> >  #define RC_MAP_WINFAST                   "rc-winfast"
> > --
> > 2.24.0
