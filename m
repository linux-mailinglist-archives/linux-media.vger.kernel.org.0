Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 993CF17C36D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 18:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgCFRCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 12:02:51 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55111 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgCFRCu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 12:02:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id i9so3257661wml.4
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4w63ql1gzjFniKogtyy3oiM+GApjFsdresV2p6J6cZA=;
        b=lELEVtqz4wJzy27B42dknKg1245IMzOQBcBp3ejIbQbqgNreARUgUdblMSoQ6p31ES
         oHA2i6yPBrFh8T9W8CqD+bN8Q4xD0ocnf+DDVV7G3+JGY+jFbu2HV3PkMFUIg6CXbUbM
         lmbX8otYGPxe7Os0nVMIwFwmGmoKjVTeg/jjIecD+/vzQe8ZpgLLx7dd7u7T8/3pXuVP
         TQOHd0BBpWOWUhnsX5Jx9daMHBAEjmg/T/icGapOp4DWiND9fnu/qwWSfxRDNGoYn6Oc
         sZQHi94YXswOhokT6jKCb1t+MQeICCjexZsGKQedt/csGlAXo6ZT6DY7lnDKb2i7THgw
         2/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4w63ql1gzjFniKogtyy3oiM+GApjFsdresV2p6J6cZA=;
        b=c9XwexSxiwom9JPAZYhyjjxv4+Lk1gCQ8svgVVcAhoA/C0jcz6KmD0gSXEicCIQS+P
         jGf10fK/bhJkX+/MsL2aKAeHwlCSwqHJtoqtxw6qXgNPShi7gNwdWU58tS3CP3Euv2cf
         oR+0F+XTAMqHN/gW8brVvJ34xAtgXRKMcot3Eeq2xU2+iT+0ysfGN8Zt7d4riX/cGF01
         1iqt7xZHGIfdaWmZf6MAtTREOqRT8DX4itwXqtRCKrKsCDo6cI+YhoMjPJPZ6yOGcB1o
         I7ZrnuPJyqWaQvO3D307FwgdVdqYuMBPNkAZHgpnM0i7w2B+QAS+iX5gwZ6zBqJchAxv
         fA2Q==
X-Gm-Message-State: ANhLgQ1xJZFuQeJvfhzr7Oub4jP2FS4phyiPYpfQJKkOQO8vDkSqeMm0
        dqJswl6KKtsovQ+pQR9D2s2FEACkJeQc3NMbF6aqLg==
X-Google-Smtp-Source: ADFU+vtR/q8zbXDWVwpXSdWzo3LZTdE/PyqsDLQg+8vJckO+FCkhjHTc3JtSyKR1njzdoM4CRHdOwMHKKepG7v0QN9w=
X-Received: by 2002:a1c:a381:: with SMTP id m123mr4860112wme.158.1583514168236;
 Fri, 06 Mar 2020 09:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200306103246.22213-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAPY8ntCuXgzQTi2=d_sd_t1ucnCgfGM64E3aNR_MuGonnHnifA@mail.gmail.com> <CA+V-a8tDGO_Td5jfqZ4iwWfc4NVG8CgE2hKKLZGFqyGjjbGQuA@mail.gmail.com>
In-Reply-To: <CA+V-a8tDGO_Td5jfqZ4iwWfc4NVG8CgE2hKKLZGFqyGjjbGQuA@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 6 Mar 2020 17:02:30 +0000
Message-ID: <CAPY8ntAZeyN6jJp6sapr4tSKmR5cfCFj1fy9ESm9b6YVPqrmXA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Add support for cropped
 640x480 resolution
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 6 Mar 2020 at 14:59, Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> Hi Dave,
>
> Thank you for the review.
>
> On Fri, Mar 6, 2020 at 2:47 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Pabhakar
> >
> > Thanks for the update. One very minor nit-pick.
> >
> > On Fri, 6 Mar 2020 at 10:33, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > >
> > > This patch adds mode table entry for capturing cropped 640x480 resolution
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 72 ++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 70 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index f96f3ce9fd85..6a86f500ec48 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -54,6 +54,7 @@
> > >  #define IMX219_VTS_15FPS               0x0dc6
> > >  #define IMX219_VTS_30FPS_1080P         0x06e3
> > >  #define IMX219_VTS_30FPS_BINNED                0x06e3
> > > +#define IMX219_VTS_30FPS_640x480       0x06e3
> >
> > Thanks on updating this - I can confirm the default is now 30fps
> > rather than the 90 I was seeing before.
> > Reducing vertical blanking down to the minimum 4 lines give me
> > 109.3fps and all still working properly :-)
> >
> thank you for testing.
>
> > >  #define IMX219_VTS_MAX                 0xffff
> > >
> > >  #define IMX219_VBLANK_MIN              4
> > > @@ -142,8 +143,8 @@ struct imx219_mode {
> > >
> > >  /*
> > >   * Register sets lifted off the i2C interface from the Raspberry Pi firmware
> > > - * driver.
> > > - * 3280x2464 = mode 2, 1920x1080 = mode 1, and 1640x1232 = mode 4.
> > > + * driver for resolutions 3280x2464, 1920x1080 and 1640x1232.
> > > + * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 1.
> >
> > 640x480 has come from mode 1 of the firmware? mode 1 is the 1080p mode.
> >
> my bad, my context of mode was cropped/binned.
>
> > Having checked through the register settings they are identical to
> > those used by the Pi firmware for mode 7, see [1]. You could quote
> > that rather than stating that they were derived by yourself.
> >
> > One of Sony's concerns when I discussed upstreaming this driver with
> > them was that people might add modes with random register settings. If
> > the image quality was then sub-standard they'd unjustly look bad. They
> > validated and blessed the register sets that we were using in the Pi
> > firmware, so retaining that parentage will make them happy.
> >
> > [1] https://github.com/6by9/raspiraw/blob/master/imx219_modes.h#L506
> >
> To be honest the driver which was in-house didn't have  any references
> for the register settings,
> I'll instead add the reference to which you pointed and set as mode = 7.

Code of unknown origin being passed around is always fun!

I hadn't referenced my raspiraw repo as the source as it's not an
officially released app, and Github repos have a tendency to move or
get deleted over time. The original comment that it was as per the
Raspberry Pi firmware (of which raspiraw is an I2C dump of the
transactions, but anyone else could attach an analyser for themselves)
seemed sufficient to me. Up to you though.

FYI The complete list of modes we have register sets for are
- mode 1 = 1920x1080 cropped
- mode 2 =  3280x2464 full FOV
- mode 3 =  same as mode 2 for legacy reasons.
- mode 4 = 1640x1232 2x2 binned
- mode 5 = 1640x922 2x2 binned and centre cropped to 16:9
- mode 6 = 1280x720 2x2 binned in the fast binning mode, and centre
cropped. For higher framerate capture (up to 120fps)
- mode 7 = 640x480 2x2 binned in the fast binning mode, and centre
cropped. For higher framerate capture (up to 200fps). I'd need to
investigate why your copy of this register set only gets up to 109fps.
Quite possibly line_length being reduced.

> If you are Okay Ill just resend this patch as rest have been acked.

Fine by me if others are happy with the rest of the patches.

  Dave

> Cheers,
> --Prabhakar
>
> > >   */
> > >  static const struct imx219_reg mode_3280x2464_regs[] = {
> > >         {0x0100, 0x00},
> > > @@ -318,6 +319,63 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
> > >         {0x0163, 0x78},
> > >  };
> > >
> > > +static const struct imx219_reg mode_640_480_regs[] = {
> > > +       {0x0100, 0x00},
> > > +       {0x30eb, 0x05},
> > > +       {0x30eb, 0x0c},
> > > +       {0x300a, 0xff},
> > > +       {0x300b, 0xff},
> > > +       {0x30eb, 0x05},
> > > +       {0x30eb, 0x09},
> > > +       {0x0114, 0x01},
> > > +       {0x0128, 0x00},
> > > +       {0x012a, 0x18},
> > > +       {0x012b, 0x00},
> > > +       {0x0162, 0x0d},
> > > +       {0x0163, 0x78},
> > > +       {0x0164, 0x03},
> > > +       {0x0165, 0xe8},
> > > +       {0x0166, 0x08},
> > > +       {0x0167, 0xe7},
> > > +       {0x0168, 0x02},
> > > +       {0x0169, 0xf0},
> > > +       {0x016a, 0x06},
> > > +       {0x016b, 0xaf},
> > > +       {0x016c, 0x02},
> > > +       {0x016d, 0x80},
> > > +       {0x016e, 0x01},
> > > +       {0x016f, 0xe0},
> > > +       {0x0170, 0x01},
> > > +       {0x0171, 0x01},
> > > +       {0x0174, 0x03},
> > > +       {0x0175, 0x03},
> > > +       {0x0301, 0x05},
> > > +       {0x0303, 0x01},
> > > +       {0x0304, 0x03},
> > > +       {0x0305, 0x03},
> > > +       {0x0306, 0x00},
> > > +       {0x0307, 0x39},
> > > +       {0x030b, 0x01},
> > > +       {0x030c, 0x00},
> > > +       {0x030d, 0x72},
> > > +       {0x0624, 0x06},
> > > +       {0x0625, 0x68},
> > > +       {0x0626, 0x04},
> > > +       {0x0627, 0xd0},
> > > +       {0x455e, 0x00},
> > > +       {0x471e, 0x4b},
> > > +       {0x4767, 0x0f},
> > > +       {0x4750, 0x14},
> > > +       {0x4540, 0x00},
> > > +       {0x47b4, 0x14},
> > > +       {0x4713, 0x30},
> > > +       {0x478b, 0x10},
> > > +       {0x478f, 0x10},
> > > +       {0x4793, 0x10},
> > > +       {0x4797, 0x0e},
> > > +       {0x479b, 0x0e},
> > > +};
> > > +
> > >  static const char * const imx219_test_pattern_menu[] = {
> > >         "Disabled",
> > >         "Color Bars",
> > > @@ -424,6 +482,16 @@ static const struct imx219_mode supported_modes[] = {
> > >                         .regs = mode_1640_1232_regs,
> > >                 },
> > >         },
> > > +       {
> > > +               /* 640x480 30fps mode */
> > > +               .width = 640,
> > > +               .height = 480,
> > > +               .vts_def = IMX219_VTS_30FPS_640x480,
> > > +               .reg_list = {
> > > +                       .num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> > > +                       .regs = mode_640_480_regs,
> > > +               },
> > > +       },
> > >  };
> > >
> > >  struct imx219 {
> > > --
> > > 2.20.1
> > >
