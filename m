Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACCC234859
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 17:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbgGaPXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 11:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgGaPXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 11:23:41 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32474C061574;
        Fri, 31 Jul 2020 08:23:41 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id a24so6478513oia.6;
        Fri, 31 Jul 2020 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IzF2AxIgh1wgNNllfB79yF7NZlkAFA5+3j22ozuyBTo=;
        b=fO38yLHRx9gKGlDt5tHh1R8JmCQhTpbcZyfgMjL3TgTPp7C2QVAP32D3LliNrhNc0t
         euNAhYdaFkMwA1oFgr1i98NObBa4rETFw/Qk7O/ukhpTCvaueZwJShdRodk6U5p56vNf
         E1UVxmksWOZED/b3Hbz46l72v2EcJuusYul+A4yFTgXewFvpMpSwK7L3CL2TWP+Azs4C
         bAyVgX3M3xmkosMjV1aQhZfhhbbDVUX7nZohVVOP50ZxwKapn3Q7WKNzkr2k7cidpxQt
         kaZULPrMMjHxd3aRVnDvwi12Ry3bz0UXwsxyF7euKOqz2tILLT1MRyR/DF1827pb+yYt
         fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IzF2AxIgh1wgNNllfB79yF7NZlkAFA5+3j22ozuyBTo=;
        b=GEGiEme0RB1FG0ui6a8US4NJBOiboDKDOmgr4Pab1h3aeNkW7z73U8xtmgtLHgkyp1
         2hq3dIK7orGm0a/SXTMBqUNo2WHWgoOVBXY/tMr8I9MNN1GMQvS9yczXWEYtqkLKWU3X
         MHgYYM4DqWVbNGQOv4qHThQUzWMyID5FamQdubxL7Pfj/Rgp/mfd7yXnAlcNgolILAvK
         j23+hTgJuIlfSou8H5bIqpN0WTBiROFIwQPrMNcYYhF7NajewFM6z20AUk/Ia6Aeq9Bu
         qWNcCeMuJWBa23Dkq1srWO2LwqJpYY96XVh1zzVrxYybJJr5jgghxp8YGawB0KsLmBlS
         qnjw==
X-Gm-Message-State: AOAM5317osv3jf0AGBnhQX0mpWH2qT0P/gLHh9v38kA4Y4KEhNiKzYNY
        2u/8CAkLNxc1KxRPU2vXkWD9YzJa5hrjg4jxBMk=
X-Google-Smtp-Source: ABdhPJyPUNcitFJ//ddJfLeO9XqU4pGmsVh9h1SQGOHnKqrjks80BXmMhq7g28YWQjeduytrjweUKyxEMEesuTrbIcY=
X-Received: by 2002:aca:7583:: with SMTP id q125mr3447911oic.142.1596209020455;
 Fri, 31 Jul 2020 08:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596187487-31403-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200731130315.GO13316@paasikivi.fi.intel.com> <CA+V-a8u0dLJGP_1MXQYu2v6o55vBSxH49S3HRY=9gb2dcO8PnA@mail.gmail.com>
 <20200731151927.GR13316@paasikivi.fi.intel.com>
In-Reply-To: <20200731151927.GR13316@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 31 Jul 2020 16:23:13 +0100
Message-ID: <CA+V-a8srhDcjjHe73UBTxqz8jooNp4nLvaScLY5jFSNtwYkCcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov5640: Enable data pins on startup for
 DVP mode
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Jul 31, 2020 at 4:19 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jul 31, 2020 at 02:18:12PM +0100, Lad, Prabhakar wrote:
> > Hi Sakari,
> >
> > Thank you for the review.
> >
> > On Fri, Jul 31, 2020 at 2:03 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thank you for the patch.
> > >
> > > On Fri, Jul 31, 2020 at 10:24:46AM +0100, Lad Prabhakar wrote:
> > > > During testing this sensor on iW-RainboW-G21D-Qseven platform noticed the
> > > > capture worked only for first run and for subsequent runs it failed.
> > > >
> > > > This patch does the following in DVP mode:
> > > > 1: Enables data lines on power up
> > > > 2: Configures HVP lines on power up instead of configuring everytime on
> > > >    stream ON/OFF
> > > > 3: Disables MIPI interface.
> > > > 4: Puts the sensor in power down mode during stream OFF.
>
> Does this last one only apply to DVP (parallel) mode?
>
Yes only in DVP mode.

> > >
> > > Could you detail a little the underlying problem, the environment where it
> > > can be reproduced and how the patch addresses it, please?
> > >
> > my bad.
> >
> > > Are you using CSI-2 or the parallel interface, for instance?
> > >
> > while using the sensor in parallel interface mode (DVP) 8-bit mode,
> > with rcar-vin bridge noticed the capture worked fine for the first run
> > (with yavta), but for subsequent runs the bridge driver waited for the
> > frame to be captured. Debugging further noticed the data lines were
> > enabled/disabled in stream on/off callback. But enabling the data
> > lines in startup (as done in the patch) fixed this issue.
>
> Could you add a note on this bug to the commit message, please?
>
Sure will do.

> >
> > Without this patch I can confirm the i2c writes were happening in
> > stream on/off callback and the values were updated in the respective
> > register to enable/disable datalines. (I didn't find any information
> > relating to sequence of enabling the data lines in data sheet [1])
> >
> > [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> >
> > > >
> > > > Fixes: f22996db44e2d ("media: ov5640: add support of DVP parallel interface")
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  drivers/media/i2c/ov5640.c | 253 +++++++++++++++++++++------------------------
> > > >  1 file changed, 120 insertions(+), 133 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > > index 2fe4a7a..ac305a5 100644
> > > > --- a/drivers/media/i2c/ov5640.c
> > > > +++ b/drivers/media/i2c/ov5640.c
> > > > @@ -274,7 +274,7 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> > > >  /* YUV422 UYVY VGA@30fps */
> > > >  static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
> > > >       {0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> > > > -     {0x3103, 0x03, 0, 0}, {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0},
> > > > +     {0x3103, 0x03, 0, 0},
> > > >       {0x3630, 0x36, 0, 0},
> > > >       {0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
> > > >       {0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> > > > @@ -1210,96 +1210,7 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
> > > >
> > > >  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
> > > >  {
> > > > -     int ret;
> > > > -     unsigned int flags = sensor->ep.bus.parallel.flags;
> > > > -     u8 pclk_pol = 0;
> > > > -     u8 hsync_pol = 0;
> > > > -     u8 vsync_pol = 0;
> > > > -
> > > > -     /*
> > > > -      * Note about parallel port configuration.
> > > > -      *
> > > > -      * When configured in parallel mode, the OV5640 will
> > > > -      * output 10 bits data on DVP data lines [9:0].
> > > > -      * If only 8 bits data are wanted, the 8 bits data lines
> > > > -      * of the camera interface must be physically connected
> > > > -      * on the DVP data lines [9:2].
> > > > -      *
> > > > -      * Control lines polarity can be configured through
> > > > -      * devicetree endpoint control lines properties.
> > > > -      * If no endpoint control lines properties are set,
> > > > -      * polarity will be as below:
> > > > -      * - VSYNC:     active high
> > > > -      * - HREF:      active low
> > > > -      * - PCLK:      active low
> > > > -      */
> > > > -
> > > > -     if (on) {
> > > > -             /*
> > > > -              * configure parallel port control lines polarity
> > > > -              *
> > > > -              * POLARITY CTRL0
> > > > -              * - [5]:       PCLK polarity (0: active low, 1: active high)
> > > > -              * - [1]:       HREF polarity (0: active low, 1: active high)
> > > > -              * - [0]:       VSYNC polarity (mismatch here between
> > > > -              *              datasheet and hardware, 0 is active high
> > > > -              *              and 1 is active low...)
> > > > -              */
> > > > -             if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > -                     pclk_pol = 1;
> > > > -             if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > > -                     hsync_pol = 1;
> > > > -             if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > > -                     vsync_pol = 1;
> > > > -
> > > > -             ret = ov5640_write_reg(sensor,
> > > > -                                    OV5640_REG_POLARITY_CTRL00,
> > > > -                                    (pclk_pol << 5) |
> > > > -                                    (hsync_pol << 1) |
> > > > -                                    vsync_pol);
> > > > -
> > > > -             if (ret)
> > > > -                     return ret;
> > > > -     }
> > > > -
> > > > -     /*
> > > > -      * powerdown MIPI TX/RX PHY & disable MIPI
> > > > -      *
> > > > -      * MIPI CONTROL 00
> > > > -      * 4:    PWDN PHY TX
> > > > -      * 3:    PWDN PHY RX
> > > > -      * 2:    MIPI enable
> > > > -      */
> > > > -     ret = ov5640_write_reg(sensor,
> > > > -                            OV5640_REG_IO_MIPI_CTRL00, on ? 0x18 : 0);
> > > > -     if (ret)
> > > > -             return ret;
> > > > -
> > > > -     /*
> > > > -      * enable VSYNC/HREF/PCLK DVP control lines
> > > > -      * & D[9:6] DVP data lines
> > > > -      *
> > > > -      * PAD OUTPUT ENABLE 01
> > > > -      * - 6:         VSYNC output enable
> > > > -      * - 5:         HREF output enable
> > > > -      * - 4:         PCLK output enable
> > > > -      * - [3:0]:     D[9:6] output enable
> > > > -      */
> > > > -     ret = ov5640_write_reg(sensor,
> > > > -                            OV5640_REG_PAD_OUTPUT_ENABLE01,
> > > > -                            on ? 0x7f : 0);
> > > > -     if (ret)
> > > > -             return ret;
> > > > -
> > > > -     /*
> > > > -      * enable D[5:0] DVP data lines
> > > > -      *
> > > > -      * PAD OUTPUT ENABLE 02
> > > > -      * - [7:2]:     D[5:0] output enable
> > > > -      */
> > > > -     return ov5640_write_reg(sensor,
> > > > -                             OV5640_REG_PAD_OUTPUT_ENABLE02,
> > > > -                             on ? 0xfc : 0);
> > > > +     return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ? 0x2 : 0x42);
> > > >  }
> > > >
> > > >  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> > > > @@ -2003,6 +1914,10 @@ static void ov5640_set_power_off(struct ov5640_dev *sensor)
> > > >
> > > >  static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > > >  {
> > > > +     unsigned int flags = sensor->ep.bus.parallel.flags;
> > > > +     u8 pclk_pol = 0;
> > > > +     u8 hsync_pol = 0;
> > > > +     u8 vsync_pol = 0;
> > > >       int ret = 0;
> > > >
> > > >       if (on) {
> > > > @@ -2014,52 +1929,124 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > > >               if (ret)
> > > >                       goto power_off;
> > > >
> > > > -             /* We're done here for DVP bus, while CSI-2 needs setup. */
> > > > -             if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> > > > -                     return 0;
> > > > +             /* CSI-2 setup. */
> > > > +             if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
> > > > +                     /*
> > > > +                      * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> > > > +                      *
> > > > +                      * 0x300e = 0x40
> > > > +                      * [7:5] = 010  : 2 data lanes mode (see FIXME note in
> > > > +                      *                "ov5640_set_stream_mipi()")
> > > > +                      * [4] = 0      : Power up MIPI HS Tx
> > > > +                      * [3] = 0      : Power up MIPI LS Rx
> > > > +                      * [2] = 0      : MIPI interface disabled
> > > > +                      */
> > > > +                     ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> > >
> > > Please wrap lines over 80 if it can be reasonably one.
> > >
> > checkpatch doesn't complain about it  (size is increased to 100)?
>
> That's not a reason leave it as-is.
>
OK.

Cheers,
Prabhakar

> --
> Regards,
>
> Sakari Ailus
