Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7780816BE44
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 11:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbgBYKI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 05:08:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:4649 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729129AbgBYKI2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 05:08:28 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 02:08:28 -0800
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; 
   d="scan'208";a="231414683"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 02:08:26 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8E71E2089D; Tue, 25 Feb 2020 12:08:24 +0200 (EET)
Date:   Tue, 25 Feb 2020 12:08:24 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ian Kumlien <ian.kumlien@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, petrcvekcz@gmail.com,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        leonl@leopardimaging.com, linux-media@vger.kernel.org
Subject: Re: [RFC] Buildfailure due to mising "select REGMAP_I2C"
Message-ID: <20200225100824.GM5379@paasikivi.fi.intel.com>
References: <CAA85sZu_5=mP2zn2h_8aY+n=UM+fXOKgym9yNAvwxcc+6R_-jA@mail.gmail.com>
 <20200225075117.GI5379@paasikivi.fi.intel.com>
 <CAA85sZvCxyi9n0dmCfb3q4EwnMu1dp6vsh3eHWyAeZ2aX+J0Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA85sZvCxyi9n0dmCfb3q4EwnMu1dp6vsh3eHWyAeZ2aX+J0Pw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 25, 2020 at 08:56:34AM +0100, Ian Kumlien wrote:
> On Tue, Feb 25, 2020 at 8:51 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Ian,
> >
> > Thank you for the patch.
> >
> > On Mon, Feb 24, 2020 at 11:35:54PM +0100, Ian Kumlien wrote:
> > > Hi,
> > >
> > > I got surprised by:
> > > ld: drivers/media/i2c/tvp5150.o: in function `tvp5150_probe':
> > > tvp5150.c:(.text+0x11ac): undefined reference to `__devm_regmap_init_i2c'
> > > make: *** [Makefile:1078: vmlinux] Error 1
> > >
> > > When going from 5.5.2 -> 5.5.6
> > >
> > > A quick git grep shows that something like this might be needed, but
> > > it should be verified.
> > > I'm really uncertain about the ones that say REGMAP_SCCB...
> >
> > Those don't need REGMAP_I2C for they use SCCB.
> 
> I would have to read up, =)
> 
> > Please also do not send attachments; your mail is likely consumed by some
> > list servers that way.
> 
> Ok
> 
> [..8<..]
> > >           This is a Video4Linux2 sensor driver for the Sony
> > > @@ -774,6 +778,7 @@ config VIDEO_OV7251
> > >  config VIDEO_OV772X
> > >         tristate "OmniVision OV772x sensor support"
> > >         depends on I2C && VIDEO_V4L2
> > > +       select REGMAP_I2C
> >
> > So this isn't needed.
> 
> Ok
> 
> > >         select REGMAP_SCCB
> > >         help
> > >           This is a Video4Linux2 sensor driver for the OmniVision
> > > @@ -804,6 +809,7 @@ config VIDEO_OV7670
> > >  config VIDEO_OV7740
> > >         tristate "OmniVision OV7740 sensor support"
> > >         depends on I2C && VIDEO_V4L2
> > > +       select REGMAP_I2C
> > >         help
> > >           This is a Video4Linux2 sensor driver for the OmniVision
> > >           OV7740 VGA camera sensor.
> > > @@ -829,6 +835,7 @@ config VIDEO_OV9640
> > >  config VIDEO_OV9650
> > >         tristate "OmniVision OV9650/OV9652 sensor support"
> > >         depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > +       select REGMAP_I2C
> >
> > Nor this one.
> 
> Ok
> 
> > >         select REGMAP_SCCB
> > >         help
> > >           This is a V4L2 sensor driver for the Omnivision
> >
> > Could you send v2, please, removing those two?
> 
> Yep, like this one:

Yes, like that one.

> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c68e002d26ea..1d1170de8c98 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -238,6 +238,7 @@ config VIDEO_ADV7604
>         tristate "Analog Devices ADV7604 decoder"
>         depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
>         depends on GPIOLIB || COMPILE_TEST
> +       select REGMAP_I2C
>         select HDMI
>         select V4L2_FWNODE
>         help
> @@ -379,6 +380,7 @@ config VIDEO_TVP5150
>         tristate "Texas Instruments TVP5150 video decoder"
>         depends on VIDEO_V4L2 && I2C
>         select V4L2_FWNODE
> +       select REGMAP_I2C
>         help
>           Support for the Texas Instruments TVP5150 video decoder.
> 
> @@ -584,6 +586,7 @@ config VIDEO_IMX214
>         tristate "Sony IMX214 sensor support"
>         depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>         depends on V4L2_FWNODE
> +       select REGMAP_I2C
>         help
>           This is a Video4Linux2 sensor driver for the Sony
>           IMX214 camera.
> @@ -612,6 +615,7 @@ config VIDEO_IMX274
>  config VIDEO_IMX290
>         tristate "Sony IMX290 sensor support"
>         depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +       select REGMAP_I2C
>         select V4L2_FWNODE
>         help
>           This is a Video4Linux2 sensor driver for the Sony
> @@ -804,6 +808,7 @@ config VIDEO_OV7670
>  config VIDEO_OV7740
>         tristate "OmniVision OV7740 sensor support"
>         depends on I2C && VIDEO_V4L2
> +       select REGMAP_I2C
>         help
>           This is a Video4Linux2 sensor driver for the OmniVision
>           OV7740 VGA camera sensor.

-- 
Sakari Ailus
