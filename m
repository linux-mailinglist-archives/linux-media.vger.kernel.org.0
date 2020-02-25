Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4048116BB60
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 08:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgBYH4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 02:56:46 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42325 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729065AbgBYH4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 02:56:46 -0500
Received: by mail-qk1-f194.google.com with SMTP id o28so11140056qkj.9
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2020 23:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IBnr344HJVxBcyHsZVx6kbKqRZ8ACauyApEgU2WQrXg=;
        b=CKWpRGVvsuTDTmP+SpR+q5cHc23a5smIga+GHS7XYsY46DjnolLKBCYMksS9ThDkxu
         wimH+CFKMXcZBp1d3+BLhv1udN4RkWK0JAPsRKThAgODwM0fDEDAm2Sa6j6c5ekmmYdL
         XmTCY/VCWMvdojcO4FUy3HehL6aKT2rI+j4D0jQeIRK/Y4N+Opwn0yeO/aAi+506gyYQ
         0YBdMpz9etgDc5DV7ZhjuSdHgfG1PYUitWFxCTm1sV/F/ssxAZKOFd2CUpn3QdWMBnE4
         7GMp7WL38C/tyquo6DuHowsO/2W+/NeCEM686ZJXYCkmTpzni6yLPbGoS/CBBcSgDZZt
         vXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBnr344HJVxBcyHsZVx6kbKqRZ8ACauyApEgU2WQrXg=;
        b=ban9SN9Hytj5hILV5FTSKgG3Qpq/tkW4u7Y137Yozx2SB2OZM1f2jbhtdDd0WRCwu0
         4eFSUiIBlErGuEy99ebG7r79QhJX3X3/Sz3zXVktsVRNXo0h3bsT+CmLkzYDQLVtlz75
         yQX7IhDaMIyHSehY+1mK5CdOXueGhz8uLWxzOVs22IKZkKKfNI2/N/GnQkyocZQpb8D3
         badzsKE/dDkOAJnfgJgCwxSJT3fwUi3EC+2yPwnBtiW5WGQzn7Lzy8mFYnYplj7ULF+r
         SaROF7L0Isk+LcZOvExjTFAqoAzriBCKhk0jCIe+PQjsPmNjp1txw+hYKaFVSYwLRNJL
         4dTg==
X-Gm-Message-State: APjAAAVY7YLdDDMlsHD4dozsa3/pO/RN8wD54OPJ/2q3hLsO/e7QsbyD
        mgMVb81HqE/aUFq1ee8MAqnklVvz3tEQ/FS49v0=
X-Google-Smtp-Source: APXvYqyI7QNU/aJ7lkzoqVDJlKTRs7GqZ4RSYAyEaAEJZYaZcGVhLcFqoZrfWdD60GlOkQJ95Ts407vB9PkxcXbfYGs=
X-Received: by 2002:a37:4b4b:: with SMTP id y72mr52473207qka.175.1582617404919;
 Mon, 24 Feb 2020 23:56:44 -0800 (PST)
MIME-Version: 1.0
References: <CAA85sZu_5=mP2zn2h_8aY+n=UM+fXOKgym9yNAvwxcc+6R_-jA@mail.gmail.com>
 <20200225075117.GI5379@paasikivi.fi.intel.com>
In-Reply-To: <20200225075117.GI5379@paasikivi.fi.intel.com>
From:   Ian Kumlien <ian.kumlien@gmail.com>
Date:   Tue, 25 Feb 2020 08:56:34 +0100
Message-ID: <CAA85sZvCxyi9n0dmCfb3q4EwnMu1dp6vsh3eHWyAeZ2aX+J0Pw@mail.gmail.com>
Subject: Re: [RFC] Buildfailure due to mising "select REGMAP_I2C"
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     hverkuil-cisco@xs4all.nl, petrcvekcz@gmail.com,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        leonl@leopardimaging.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 25, 2020 at 8:51 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ian,
>
> Thank you for the patch.
>
> On Mon, Feb 24, 2020 at 11:35:54PM +0100, Ian Kumlien wrote:
> > Hi,
> >
> > I got surprised by:
> > ld: drivers/media/i2c/tvp5150.o: in function `tvp5150_probe':
> > tvp5150.c:(.text+0x11ac): undefined reference to `__devm_regmap_init_i2c'
> > make: *** [Makefile:1078: vmlinux] Error 1
> >
> > When going from 5.5.2 -> 5.5.6
> >
> > A quick git grep shows that something like this might be needed, but
> > it should be verified.
> > I'm really uncertain about the ones that say REGMAP_SCCB...
>
> Those don't need REGMAP_I2C for they use SCCB.

I would have to read up, =)

> Please also do not send attachments; your mail is likely consumed by some
> list servers that way.

Ok

[..8<..]
> >           This is a Video4Linux2 sensor driver for the Sony
> > @@ -774,6 +778,7 @@ config VIDEO_OV7251
> >  config VIDEO_OV772X
> >         tristate "OmniVision OV772x sensor support"
> >         depends on I2C && VIDEO_V4L2
> > +       select REGMAP_I2C
>
> So this isn't needed.

Ok

> >         select REGMAP_SCCB
> >         help
> >           This is a Video4Linux2 sensor driver for the OmniVision
> > @@ -804,6 +809,7 @@ config VIDEO_OV7670
> >  config VIDEO_OV7740
> >         tristate "OmniVision OV7740 sensor support"
> >         depends on I2C && VIDEO_V4L2
> > +       select REGMAP_I2C
> >         help
> >           This is a Video4Linux2 sensor driver for the OmniVision
> >           OV7740 VGA camera sensor.
> > @@ -829,6 +835,7 @@ config VIDEO_OV9640
> >  config VIDEO_OV9650
> >         tristate "OmniVision OV9650/OV9652 sensor support"
> >         depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > +       select REGMAP_I2C
>
> Nor this one.

Ok

> >         select REGMAP_SCCB
> >         help
> >           This is a V4L2 sensor driver for the Omnivision
>
> Could you send v2, please, removing those two?

Yep, like this one:

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c68e002d26ea..1d1170de8c98 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -238,6 +238,7 @@ config VIDEO_ADV7604
        tristate "Analog Devices ADV7604 decoder"
        depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
        depends on GPIOLIB || COMPILE_TEST
+       select REGMAP_I2C
        select HDMI
        select V4L2_FWNODE
        help
@@ -379,6 +380,7 @@ config VIDEO_TVP5150
        tristate "Texas Instruments TVP5150 video decoder"
        depends on VIDEO_V4L2 && I2C
        select V4L2_FWNODE
+       select REGMAP_I2C
        help
          Support for the Texas Instruments TVP5150 video decoder.

@@ -584,6 +586,7 @@ config VIDEO_IMX214
        tristate "Sony IMX214 sensor support"
        depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
        depends on V4L2_FWNODE
+       select REGMAP_I2C
        help
          This is a Video4Linux2 sensor driver for the Sony
          IMX214 camera.
@@ -612,6 +615,7 @@ config VIDEO_IMX274
 config VIDEO_IMX290
        tristate "Sony IMX290 sensor support"
        depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+       select REGMAP_I2C
        select V4L2_FWNODE
        help
          This is a Video4Linux2 sensor driver for the Sony
@@ -804,6 +808,7 @@ config VIDEO_OV7670
 config VIDEO_OV7740
        tristate "OmniVision OV7740 sensor support"
        depends on I2C && VIDEO_V4L2
+       select REGMAP_I2C
        help
          This is a Video4Linux2 sensor driver for the OmniVision
          OV7740 VGA camera sensor.
