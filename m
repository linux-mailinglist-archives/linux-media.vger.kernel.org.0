Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1921069DFEB
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 13:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbjBUMHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 07:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234588AbjBUMHj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 07:07:39 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BAB2887F
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 04:07:00 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id m10so2125660vso.4
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 04:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLK2BL6DDQGo9trBvU5RHg98iqlh3tfDOY9s/jFUqa4=;
        b=PGLP/FrYGAZ3HKl5G/KWhXYi2aJ0uCAV8FfgrKh08+5oYMirn73ElWGBJ3aNtu6IkD
         kxaaXyuhq/xZCDLOt2JtybVp4HGECpEwVZdTXOeU4VJsfdfJCHYVJem64lsvxDG6dwPk
         xPqNFWK/Yf4jvwxJaMl/myj17hHNXXuVOgDdBduEg5BjdeKBTDK24pAkZ91YnUFsnfcw
         1GG9oHWXB01MCT9gRJXUoJ7LgjY4kAJYjVETP8nh+FK0FbavtLaOks0u0be02TDqbwLq
         fVEJlDBpnOiWi9qwbauV3gPA0BJXZOCSQUC7SfYeBm46VBy7PVZC+4NKSPyW4C4UbeFP
         sLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLK2BL6DDQGo9trBvU5RHg98iqlh3tfDOY9s/jFUqa4=;
        b=NTY09xarGNS7xJEFIlAP37N9YNCQe8V+pAZT75Rr0vhl4MDMiwr/V7y+1SZvd8PGV2
         cudeQoRqcPwWGQS2rTwoD9z2L1U8JXrR45i6P5nYS3aZcIV9M942gAxuNRJIvTeaszKa
         JlJQvNN9ODrjbB6BKQz4+vmEXBILNdAqzcWJMEGDPDg1rdh+in6DSKIu0DSrTmIpPcA3
         UKTySlrJvj3LNxA2DUPpgvVtWn2c6i5Zw/dLgb8KyhtV3n9+KzN9z72I1twKoEQE2ofE
         zuiqJ9OFYi0tr82sb7w+a7iNVzoDAzbOG5oRtbSSfR06BxMtCw2pJHAvcCk8GyO+oRi2
         YVzQ==
X-Gm-Message-State: AO0yUKX6m2Zu5zZIruGLfddqen+N5zD94hhfMdP4UPIbIqDIVxflPMVb
        7aTYrEl8Mp9Y87oGwmBD1+0avEMk8Dd/rKwspZn89w==
X-Google-Smtp-Source: AK7set+0IqZQvPdr7TWykucv5dEdupk5jGgRs+klipV+kIR1NnTmD8iPuiHtPjHheta7jXCZIrfMJYdIuz7FM4WiEPo=
X-Received: by 2002:a05:6102:5088:b0:412:6281:6a38 with SMTP id
 bl8-20020a056102508800b0041262816a38mr665511vsb.48.1676980850955; Tue, 21 Feb
 2023 04:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
 <20230220124041.1010289-1-jacopo.mondi@ideasonboard.com> <CAPY8ntAqsL+Z-yM71keTcafxW6WDnzG4hFDq+AWk31jUjr3qGg@mail.gmail.com>
 <20230221082504.x6ssez7rkqv67oty@uno.localdomain>
In-Reply-To: <20230221082504.x6ssez7rkqv67oty@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 21 Feb 2023 12:00:35 +0000
Message-ID: <CAPY8ntCk59UhSfCLUz6pdM-A01=-a-5Wgcb2QpMGazWRh7ApZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov5647: Add test pattern control
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Tue, 21 Feb 2023 at 08:25, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Mon, Feb 20, 2023 at 06:18:14PM +0000, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > On Mon, 20 Feb 2023 at 12:40, Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > From: Valentine Barshak <valentine.barshak@cogentembedded.com>
> > >
> > > This adds V4L2_CID_TEST_PATTERN control support.
> > >
> > > Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/ov5647.c | 28 +++++++++++++++++++++++++++-
> > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > > index 847a7bbb69c5..0b88ac6dee41 100644
> > > --- a/drivers/media/i2c/ov5647.c
> > > +++ b/drivers/media/i2c/ov5647.c
> > > @@ -58,6 +58,7 @@
> > >  #define OV5647_REG_MIPI_CTRL00         0x4800
> > >  #define OV5647_REG_MIPI_CTRL14         0x4814
> > >  #define OV5647_REG_AWB                 0x5001
> > > +#define OV5647_REG_ISPCTRL3D           0x503d
> > >
> > >  #define REG_TERM 0xfffe
> > >  #define VAL_TERM 0xfe
> > > @@ -116,6 +117,22 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > >         return container_of(sd, struct ov5647, sd);
> > >  }
> > >
> > > +static const char * const ov5647_test_pattern_menu[] = {
> > > +       "Disabled",
> > > +       "Color Bars",
> > > +       "Color Squares",
> > > +       "Random Data",
> > > +       "Input Data"
> >
> > "Input Data" appears to give me just a black image. Have I missed
> > something? What's it meant to be the input to?
>
> I noticed as well, but not knowing what "input data" meant I just
> "meh" and moved on
>
> Should it be dropped in your opinion ?

Personally I would drop it as it is undefined what that really means.

> > Is it worth adding 0x92 for a black and white checkboard as well?
>
> I could

I'll leave that one up to you. I have no major interest in test patterns.

> >
> > Whichever way:
> >
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Just as a note, the test patterns appear to be valid only if 0x3820
> > bit 1 = 0 and 0x3821 bit 1 = 1 (V & H flips respectively).
>
> Unrelated: why do I see the 2592x1944 mode with {0x3821, 0x06} ?
> I only tested whatever qcam gave me, I should better re-check

The sensor appears to have an inherent H-flip, so for "normal" readout
you need to set 0x3821 bit 1 as you see in the driver.
I don't remember if I've ever really experimented with the difference
between r_mirror_isp (bit 2) and r_mirror_snr (bit 1)

> > The sensor appears to be assuming one particular colour pattern (BGGR)
> > when producing a test pattern, so flips altering the format give some
> > very weird effects. I do have patches that add the V4L2 flip controls,
>
> Ah, that surprises me, I recall we discussed in the past the fact that
> flip shouldn't alter test patterns...

I don't recall the exact discussion. Was it around a sensor which
deliberately changed the flip register as it enabled the pattern?
In my experience it's not uncommon that they are affected by flips.

Flips are implemented by changing the readout order on the sensor
array. The sensor itself doesn't care that doing so changes the Bayer
order as it knows nothing about the colour filter or even if it is
present.
Test patterns are generally implemented further down the pipeline by
forcing the pixel state of each pixel in turn, ignoring flips. If the
receiver pipeline is working on the basis that it knows the flips and
how that would normally affect the Bayer order, then you get wrong
colours.

V4L2_CID_TEST_PATTERN_[RED|GREENR|GREENB|BLUE] exist, and I see they
have been implemented for CCS and imx219 (IIRC done by others rather
than myself, but in the original upstreamed version of the driver).
Testing with imx219 confirms that it also has the same issue - colours
are only correct if hflip = 0 and vflip = 0. V4L2_CID_TEST_PATTERN
ought to set MODIFY_LAYOUT, override the Bayer order, and be grabbed
at start/stop streaming.
Of course this gets even more confusing when device tree can advertise
a mounting rotation though V4L2_CID_CAMERA_SENSOR_ROTATION, so
libcamera may enable flips automatically when told to stream in the
native orientation, and then the test patterns are unexpectedly wrong
as the user didn't ask for flips.
It's one of the reasons I generally don't care about test patterns -
they're generally of little use other than to prove the sensor
streams, so how much effort is it worth expending in making them work
perfectly under all conditions?

  Dave

> > so those expose some interesting effects :-/
> >
> >   Dave
> >
> > > +};
> > > +
> > > +static u8 ov5647_test_pattern_val[] = {
> > > +       0x00,   /* Disabled */
> > > +       0x80,   /* Color Bars */
> > > +       0x82,   /* Color Squares */
> > > +       0x81,   /* Random Data */
> > > +       0x83,   /* Input Data */
> > > +};
> > > +
> > >  static const struct regval_list sensor_oe_disable_regs[] = {
> > >         {0x3000, 0x00},
> > >         {0x3001, 0x00},
> > > @@ -1242,6 +1259,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> > >                 ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
> > >                                      sensor->mode->format.height + ctrl->val);
> > >                 break;
> > > +       case V4L2_CID_TEST_PATTERN:
> > > +               ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> > > +                                  ov5647_test_pattern_val[ctrl->val]);
> > > +               break;
> > >
> > >         /* Read-only, but we adjust it based on mode. */
> > >         case V4L2_CID_PIXEL_RATE:
> > > @@ -1270,7 +1291,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> > >         struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> > >         int hblank, exposure_max, exposure_def;
> > >
> > > -       v4l2_ctrl_handler_init(&sensor->ctrls, 8);
> > > +       v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> > >
> > >         v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> > >                           V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > > @@ -1314,6 +1335,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> > >                                            sensor->mode->vts -
> > >                                            sensor->mode->format.height);
> > >
> > > +       v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &ov5647_ctrl_ops,
> > > +                                    V4L2_CID_TEST_PATTERN,
> > > +                                    ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
> > > +                                    0, 0, ov5647_test_pattern_menu);
> > > +
> > >         if (sensor->ctrls.error)
> > >                 goto handler_free;
> > >
> > > --
> > > 2.39.0
> > >
