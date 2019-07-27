Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C9477562
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 02:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfG0ARM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 20:17:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35828 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfG0ARM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 20:17:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 90D7828BD91
Message-ID: <e9dc1975727f6aeee34114c9fdb488bf71a2aa71.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers
 autoselect" is enabled
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Date:   Fri, 26 Jul 2019 21:17:00 -0300
In-Reply-To: <20190725230929.6a52133c@coco.lan>
References: <20190715212316.352-1-ezequiel@collabora.com>
         <20190715212316.352-3-ezequiel@collabora.com>
         <20190725125730.2218f0a8@coco.lan>
         <f87fb2e6bd740de8c44df1f8ff3b48b7b04af481.camel@collabora.com>
         <CAGb2v65wOz+nUi=Leb3FudU7K5S_AHtuCarXHcO0kMvvqEw8rQ@mail.gmail.com>
         <20190725154111.7fc7e335@coco.lan>
         <cb3e54a7281678b89e34eee82009f615589fea94.camel@collabora.com>
         <20190725230929.6a52133c@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-07-25 at 23:09 -0300, Mauro Carvalho Chehab wrote:
> Em Thu, 25 Jul 2019 20:55:13 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > On Thu, 2019-07-25 at 15:41 -0300, Mauro Carvalho Chehab wrote:
> > > Em Fri, 26 Jul 2019 01:29:58 +0800
> > > Chen-Yu Tsai <wens@kernel.org> escreveu:
> > >   
> > > > On Fri, Jul 26, 2019 at 1:06 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:  
> > > > > On Thu, 2019-07-25 at 12:57 -0300, Mauro Carvalho Chehab wrote:    
> > > > > > Em Mon, 15 Jul 2019 18:23:16 -0300
> > > > > > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > > > > >    
> > > > > > > 	Many users have been complaining about not being able to find
> > > > > > > certain menu options. One such example are camera sensor drivers
> > > > > > > (e.g IMX219, OV5645, etc) which are common on embedded platforms
> > > > > > > and not always ancillary devices.
> > > > > > > 
> > > > > > > The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
> > > > > > > to the fact that it uses the "visible" kbuild syntax to hide
> > > > > > > entire group of drivers.
> > > > > > > 
> > > > > > > This is not obvious and, as explained above, not always desired.
> > > > > > > 
> > > > > > > To fix the problem, drop the "visible" and stop hiding any menu
> > > > > > > options. Users skilled enough to configure their kernel are expected
> > > > > > > to be skilled enough to know what (not) to configure anyway.
> > > > > > > 
> > > > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > > > ---
> > > > > > >  drivers/media/dvb-frontends/Kconfig | 1 -
> > > > > > >  drivers/media/i2c/Kconfig           | 1 -
> > > > > > >  drivers/media/spi/Kconfig           | 1 -
> > > > > > >  drivers/media/tuners/Kconfig        | 1 -
> > > > > > >  4 files changed, 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> > > > > > > index dc43749177df..2d1fea3bf546 100644
> > > > > > > --- a/drivers/media/dvb-frontends/Kconfig
> > > > > > > +++ b/drivers/media/dvb-frontends/Kconfig
> > > > > > > @@ -1,5 +1,4 @@
> > > > > > >  menu "Customise DVB Frontends"
> > > > > > > -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
> > > > > > > 
> > > > > > >  comment "Multistandard (satellite) frontends"
> > > > > > >     depends on DVB_CORE
> > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > index 79ce9ec6fc1b..475072bb67d6 100644
> > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > @@ -23,7 +23,6 @@ config VIDEO_IR_I2C
> > > > > > >  #
> > > > > > > 
> > > > > > >  menu "I2C Encoders, decoders, sensors and other helper chips"
> > > > > > > -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT    
> > > > > > 
> > > > > > Hmm... Hans picked this patch, but IMO it doesn't make sense
> > > > > > for PC consumer people to see the hundreds of extra options
> > > > > > that making those menus visible will produce.
> > > > > > 
> > > > > > This was added because in the past we had lots of issues with
> > > > > > people desktop/laptop settings with all those things enabled.
> > > > > > 
> > > > > > In any case, if the desktop/laptop user is smart enough to
> > > > > > go though it, he can simply disable MEDIA_SUBDRV_AUTOSELECT and
> > > > > > manually select what he wants, so I really miss the point of
> > > > > > making those stuff always visible.
> > > > > > 
> > > > > > Now, from this patch's comments, it seems that you want this
> > > > > > to be visible if CONFIG_EMBEDDED. So, I won't complain if you
> > > > > > replace the changes on this patch to:
> > > > > > 
> > > > > >       menu "foo"
> > > > > >           visible if !MEDIA_SUBDRV_AUTOSELECT || !EMBEDDED || COMPILE_TEST || EXPERT
> > > > > > 
> > > > > > In other words, for the normal guy that just wants to build the
> > > > > > latest media stuff for his PC camera or TV device to work, he won't
> > > > > > need to dig into hundreds of things that won't make any difference
> > > > > > if he enables, except for making the Kernel bigger.
> > > > > >    
> > > > > 
> > > > > Well, I think the real value of MEDIA_SUBDRV_AUTOSELECT is the autoselection,
> > > > > not the hidden part. I'm really missing to see what hiding anything gives you.
> > > > > 
> > > > > In other words, this option gets useful when driver authors select ancillary
> > > > > drivers such as:
> > > > > 
> > > > > config VIDEO_USBVISION
> > > > >         tristate "USB video devices based on Nogatech NT1003/1004/1005"
> > > > >         depends on I2C && VIDEO_V4L2
> > > > >         select VIDEO_TUNER
> > > > >         select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
> > > > > 
> > > > > What's so confusing about having these drivers visible? Compared to the
> > > > > rest of the zillion menu options, what's more confusing about seeing these?
> > > > > 
> > > > > Now, while I would agree with EMBEDDED, the problem with that is that
> > > > > many "embedded" platforms don't enable EMBEDDED. So, it's not that useful.
> > > > > 
> > > > > Finally, let me give an example of why hiding the menus is so bad.
> > > > > Normally, to enable a symbol, we use the search tool.
> > > > > 
> > > > > Now, when MEDIA_SUBDRV_AUTOSELECT=y, the search tool will _not_ take you
> > > > > there and there's no indication why.    
> > > > 
> > > > As someone who has done so in the past year, I agree it's confusing.
> > > > I had to dig through the Kconfig files to figure out which knobs to
> > > > turn to get the OV5640 option out. The description says "auto-selecting",  
> > > 
> > > Well, the text and/or the help message can be changed, if it is not
> > > clear enough, but this option was added because we had too many issues
> > > with users trying to build drivers for their devices without being
> > > able to do that, because selecting thousands of devices is something
> > > that an average PC user has troubles.
> > > 
> > > I'm all to improve it, provided that we don't make harder for non-devs
> > > to build the Kernel.
> > >   
> > 
> > I just recalled Buildroot made extensive use of comments,
> > so how about this instead:
> > 
> > From fdbb96242422823a6df59cf457ebd19f83e45ffe Mon Sep 17 00:00:00 2001
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > Date: Thu, 25 Jul 2019 20:45:07 -0300
> > Subject: [PATCH] media: Clarify how menus are hidden by SUBDRV_AUTOSELECT
> > 
> > Some users have been having a hard time finding certain menu
> > options. One such example are camera sensor drivers
> > (e.g IMX219, OV5645, etc) which are common on embedded
> > platforms and not really "ancillary" devices.
> > 
> > The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
> > to the fact that it uses the "visible" kbuild syntax to hide
> > entire group of drivers.
> > 
> > This is not obvious and it normally takes some time to
> > figure out.
> > 
> > To fix the problem, add a comment on each of hidden menus,
> > which should clarify what option is causing menus to be hidden.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/dvb-frontends/Kconfig | 3 +++
> >  drivers/media/i2c/Kconfig           | 3 +++
> >  drivers/media/spi/Kconfig           | 3 +++
> >  drivers/media/tuners/Kconfig        | 4 ++++
> >  4 files changed, 13 insertions(+)
> > 
> > diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> > index dc43749177df..5e2ba9d03662 100644
> > --- a/drivers/media/dvb-frontends/Kconfig
> > +++ b/drivers/media/dvb-frontends/Kconfig
> > @@ -1,3 +1,6 @@
> > +comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
> > +	depends on !(!MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT)
> > +
> >  menu "Customise DVB Frontends"
> >  	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
> 
> Makes sense to me.
> 
> Yet, it will keep repeating the same dependency logic everywhere.
> 
> Maybe we could have something like:
> 
> config MEDIA_SIMPLIFY_SELECT
> 	bool
> 	depends on !(!MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT)
> 	default y
> 
> (yeah, the name sucks - feel free to suggest a better name for
> the symbol)
> 
> and use it instead of keeping repeating the same if over and over.
> 

I've added an extra config, and used it also for the 'visible' syntax.

From e3d7207f7055bb7b69ce7fd0a5c9305c550b18ae Mon Sep 17 00:00:00 2001
From: Ezequiel Garcia <ezequiel@collabora.com>
Date: Thu, 25 Jul 2019 20:45:07 -0300
Subject: [PATCH] media: Clarify how menus are hidden by SUBDRV_AUTOSELECT

Some users have been having a hard time finding certain menu
options. One such example are camera sensor drivers
(e.g IMX219, OV5645, etc) which are common on embedded
platforms and not really "ancillary" devices.

The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
to the fact that it uses the "visible" kbuild syntax to hide
entire group of drivers.

This is not obvious and it normally takes some time to
figure out.

To fix the problem, add a comment on each of hidden menus,
which should clarify what option is causing menus to be hidden.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/Kconfig               | 5 +++++
 drivers/media/dvb-frontends/Kconfig | 5 ++++-
 drivers/media/i2c/Kconfig           | 5 ++++-
 drivers/media/spi/Kconfig           | 5 ++++-
 drivers/media/tuners/Kconfig        | 6 +++++-
 5 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 8404e80aa38e..b36a41332867 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -207,6 +207,11 @@ config MEDIA_SUBDRV_AUTOSELECT
 
 	  If unsure say Y.
 
+config MEDIA_HIDE_ANCILLARY_SUBDRV
+        bool
+        depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
+        default y
+
 config MEDIA_ATTACH
 	bool
 	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT
diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index dc43749177df..a29e9ddf9c82 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -1,5 +1,8 @@
+comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+
 menu "Customise DVB Frontends"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 comment "Multistandard (satellite) frontends"
 	depends on DVB_CORE
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 79ce9ec6fc1b..1f72eafa7d1a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -22,8 +22,11 @@ config VIDEO_IR_I2C
 # Encoder / Decoder module configuration
 #
 
+comment "I2C drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+
 menu "I2C Encoders, decoders, sensors and other helper chips"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 comment "Audio decoders, processors and mixers"
 
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index 08386abb9bbc..bcc49cb47de6 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -1,8 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 if VIDEO_V4L2
 
+comment "SPI drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+
 menu "SPI helper chips"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_GS1662
 	tristate "Gennum Serializers video"
diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index a7108e575e9b..e104bb7766e1 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -15,8 +15,12 @@ config MEDIA_TUNER
 	select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
 
+comment "Tuner drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
+
 menu "Customize TV tuners"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
 
 config MEDIA_TUNER_SIMPLE
-- 
2.22.0


