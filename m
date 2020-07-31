Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E33234881
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 17:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgGaPcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 11:32:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41642 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgGaPcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 11:32:02 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF64B53C;
        Fri, 31 Jul 2020 17:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596209519;
        bh=dedesMR4np940AvQEP4rMEblUlg5e6+Hz09ETo0/cvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=htDhrgG0SA0Uwfbh5CyNp/NEdUb8I4PdTHikstBMA1iIwywH+I8B+TuCuMbXkKbEu
         Ticek8LFiLpktdEQ8QAN46mssXlgMBVCQiVQOwqrS4jFk/+X61Xo7KYGw5+9lIvc1Q
         Co61mVRG6MG4b1GMSiid4xuCPlh4xrfOS0zjoiAg=
Date:   Fri, 31 Jul 2020 18:31:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/2] media: i2c: ov5640: Enable data pins on startup for
 DVP mode
Message-ID: <20200731153149.GJ6218@pendragon.ideasonboard.com>
References: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596187487-31403-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200731130315.GO13316@paasikivi.fi.intel.com>
 <CA+V-a8u0dLJGP_1MXQYu2v6o55vBSxH49S3HRY=9gb2dcO8PnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8u0dLJGP_1MXQYu2v6o55vBSxH49S3HRY=9gb2dcO8PnA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Jul 31, 2020 at 02:18:12PM +0100, Lad, Prabhakar wrote:
> On Fri, Jul 31, 2020 at 2:03 PM Sakari Ailus wrote:
> > On Fri, Jul 31, 2020 at 10:24:46AM +0100, Lad Prabhakar wrote:
> > > During testing this sensor on iW-RainboW-G21D-Qseven platform noticed the
> > > capture worked only for first run and for subsequent runs it failed.
> > >
> > > This patch does the following in DVP mode:
> > > 1: Enables data lines on power up
> > > 2: Configures HVP lines on power up instead of configuring everytime on
> > >    stream ON/OFF
> > > 3: Disables MIPI interface.
> > > 4: Puts the sensor in power down mode during stream OFF.
> >
> > Could you detail a little the underlying problem, the environment where it
> > can be reproduced and how the patch addresses it, please?
>
> my bad.
> 
> > Are you using CSI-2 or the parallel interface, for instance?
>
> while using the sensor in parallel interface mode (DVP) 8-bit mode,
> with rcar-vin bridge noticed the capture worked fine for the first run
> (with yavta), but for subsequent runs the bridge driver waited for the
> frame to be captured. Debugging further noticed the data lines were
> enabled/disabled in stream on/off callback. But enabling the data
> lines in startup (as done in the patch) fixed this issue.

This looks like a hack though. We should disable the outputs somewhere,
if not at stream off time, at least in ov5640_set_power(0). Leaving
everything powered on will increase power consumption.

This issue needs to be debugged further to understand what's going on,
and a proper fix needs to then be submitted.

> Without this patch I can confirm the i2c writes were happening in
> stream on/off callback and the values were updated in the respective
> register to enable/disable datalines. (I didn't find any information
> relating to sequence of enabling the data lines in data sheet [1])
> 
> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> 
> > >
> > > Fixes: f22996db44e2d ("media: ov5640: add support of DVP parallel interface")
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 253 +++++++++++++++++++++------------------------
> > >  1 file changed, 120 insertions(+), 133 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 2fe4a7a..ac305a5 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -274,7 +274,7 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> > >  /* YUV422 UYVY VGA@30fps */
> > >  static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
> > >       {0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> > > -     {0x3103, 0x03, 0, 0}, {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0},
> > > +     {0x3103, 0x03, 0, 0},
> > >       {0x3630, 0x36, 0, 0},
> > >       {0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
> > >       {0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> > > @@ -1210,96 +1210,7 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
> > >
> > >  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
> > >  {
> > > -     int ret;
> > > -     unsigned int flags = sensor->ep.bus.parallel.flags;
> > > -     u8 pclk_pol = 0;
> > > -     u8 hsync_pol = 0;
> > > -     u8 vsync_pol = 0;
> > > -
> > > -     /*
> > > -      * Note about parallel port configuration.
> > > -      *
> > > -      * When configured in parallel mode, the OV5640 will
> > > -      * output 10 bits data on DVP data lines [9:0].
> > > -      * If only 8 bits data are wanted, the 8 bits data lines
> > > -      * of the camera interface must be physically connected
> > > -      * on the DVP data lines [9:2].
> > > -      *
> > > -      * Control lines polarity can be configured through
> > > -      * devicetree endpoint control lines properties.
> > > -      * If no endpoint control lines properties are set,
> > > -      * polarity will be as below:
> > > -      * - VSYNC:     active high
> > > -      * - HREF:      active low
> > > -      * - PCLK:      active low
> > > -      */
> > > -
> > > -     if (on) {
> > > -             /*
> > > -              * configure parallel port control lines polarity
> > > -              *
> > > -              * POLARITY CTRL0
> > > -              * - [5]:       PCLK polarity (0: active low, 1: active high)
> > > -              * - [1]:       HREF polarity (0: active low, 1: active high)
> > > -              * - [0]:       VSYNC polarity (mismatch here between
> > > -              *              datasheet and hardware, 0 is active high
> > > -              *              and 1 is active low...)
> > > -              */
> > > -             if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > -                     pclk_pol = 1;
> > > -             if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> > > -                     hsync_pol = 1;
> > > -             if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> > > -                     vsync_pol = 1;
> > > -
> > > -             ret = ov5640_write_reg(sensor,
> > > -                                    OV5640_REG_POLARITY_CTRL00,
> > > -                                    (pclk_pol << 5) |
> > > -                                    (hsync_pol << 1) |
> > > -                                    vsync_pol);
> > > -
> > > -             if (ret)
> > > -                     return ret;
> > > -     }
> > > -
> > > -     /*
> > > -      * powerdown MIPI TX/RX PHY & disable MIPI
> > > -      *
> > > -      * MIPI CONTROL 00
> > > -      * 4:    PWDN PHY TX
> > > -      * 3:    PWDN PHY RX
> > > -      * 2:    MIPI enable
> > > -      */
> > > -     ret = ov5640_write_reg(sensor,
> > > -                            OV5640_REG_IO_MIPI_CTRL00, on ? 0x18 : 0);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     /*
> > > -      * enable VSYNC/HREF/PCLK DVP control lines
> > > -      * & D[9:6] DVP data lines
> > > -      *
> > > -      * PAD OUTPUT ENABLE 01
> > > -      * - 6:         VSYNC output enable
> > > -      * - 5:         HREF output enable
> > > -      * - 4:         PCLK output enable
> > > -      * - [3:0]:     D[9:6] output enable
> > > -      */
> > > -     ret = ov5640_write_reg(sensor,
> > > -                            OV5640_REG_PAD_OUTPUT_ENABLE01,
> > > -                            on ? 0x7f : 0);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     /*
> > > -      * enable D[5:0] DVP data lines
> > > -      *
> > > -      * PAD OUTPUT ENABLE 02
> > > -      * - [7:2]:     D[5:0] output enable
> > > -      */
> > > -     return ov5640_write_reg(sensor,
> > > -                             OV5640_REG_PAD_OUTPUT_ENABLE02,
> > > -                             on ? 0xfc : 0);
> > > +     return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ? 0x2 : 0x42);
> > >  }
> > >
> > >  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> > > @@ -2003,6 +1914,10 @@ static void ov5640_set_power_off(struct ov5640_dev *sensor)
> > >
> > >  static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > >  {
> > > +     unsigned int flags = sensor->ep.bus.parallel.flags;
> > > +     u8 pclk_pol = 0;
> > > +     u8 hsync_pol = 0;
> > > +     u8 vsync_pol = 0;
> > >       int ret = 0;
> > >
> > >       if (on) {
> > > @@ -2014,52 +1929,124 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > >               if (ret)
> > >                       goto power_off;
> > >
> > > -             /* We're done here for DVP bus, while CSI-2 needs setup. */
> > > -             if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> > > -                     return 0;
> > > +             /* CSI-2 setup. */
> > > +             if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
> > > +                     /*
> > > +                      * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> > > +                      *
> > > +                      * 0x300e = 0x40
> > > +                      * [7:5] = 010  : 2 data lanes mode (see FIXME note in
> > > +                      *                "ov5640_set_stream_mipi()")
> > > +                      * [4] = 0      : Power up MIPI HS Tx
> > > +                      * [3] = 0      : Power up MIPI LS Rx
> > > +                      * [2] = 0      : MIPI interface disabled
> > > +                      */
> > > +                     ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> >
> > Please wrap lines over 80 if it can be reasonably one.
>
> checkpatch doesn't complain about it  (size is increased to 100)?

-- 
Regards,

Laurent Pinchart
