Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBDCF69DBD8
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 09:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjBUIZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 03:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbjBUIZL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 03:25:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415D21F4B2
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 00:25:10 -0800 (PST)
Received: from ideasonboard.com (host-87-16-53-160.retail.telecomitalia.it [87.16.53.160])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EC022E4;
        Tue, 21 Feb 2023 09:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676967908;
        bh=6IOlwlelD0RIN/BVccIlzs4M3wPJiWyzmKWXLjDE50Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AjX1IRQvNehxMO8O9QXn6PcBFnEe4XrDT7qD2F5UsGGyXB1tKjOVLIY5eCyyQraZe
         1uln8K2iPAKePigZqldhDh4GjbyFywv3BIwhFOlxuHsYQAQGImDMhwERTJTkG441RG
         II77HUoXRhJMyeWHLPGbEyQ57409Ald083ydG6y8=
Date:   Tue, 21 Feb 2023 09:25:04 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov5647: Add test pattern control
Message-ID: <20230221082504.x6ssez7rkqv67oty@uno.localdomain>
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
 <20230220124041.1010289-1-jacopo.mondi@ideasonboard.com>
 <CAPY8ntAqsL+Z-yM71keTcafxW6WDnzG4hFDq+AWk31jUjr3qGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAqsL+Z-yM71keTcafxW6WDnzG4hFDq+AWk31jUjr3qGg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Mon, Feb 20, 2023 at 06:18:14PM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Mon, 20 Feb 2023 at 12:40, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > From: Valentine Barshak <valentine.barshak@cogentembedded.com>
> >
> > This adds V4L2_CID_TEST_PATTERN control support.
> >
> > Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 28 +++++++++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 847a7bbb69c5..0b88ac6dee41 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -58,6 +58,7 @@
> >  #define OV5647_REG_MIPI_CTRL00         0x4800
> >  #define OV5647_REG_MIPI_CTRL14         0x4814
> >  #define OV5647_REG_AWB                 0x5001
> > +#define OV5647_REG_ISPCTRL3D           0x503d
> >
> >  #define REG_TERM 0xfffe
> >  #define VAL_TERM 0xfe
> > @@ -116,6 +117,22 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> >         return container_of(sd, struct ov5647, sd);
> >  }
> >
> > +static const char * const ov5647_test_pattern_menu[] = {
> > +       "Disabled",
> > +       "Color Bars",
> > +       "Color Squares",
> > +       "Random Data",
> > +       "Input Data"
>
> "Input Data" appears to give me just a black image. Have I missed
> something? What's it meant to be the input to?

I noticed as well, but not knowing what "input data" meant I just
"meh" and moved on

Should it be dropped in your opinion ?

> Is it worth adding 0x92 for a black and white checkboard as well?

I could

>
> Whichever way:
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Just as a note, the test patterns appear to be valid only if 0x3820
> bit 1 = 0 and 0x3821 bit 1 = 1 (V & H flips respectively).

Unrelated: why do I see the 2592x1944 mode with {0x3821, 0x06} ?
I only tested whatever qcam gave me, I should better re-check

> The sensor appears to be assuming one particular colour pattern (BGGR)
> when producing a test pattern, so flips altering the format give some
> very weird effects. I do have patches that add the V4L2 flip controls,

Ah, that surprises me, I recall we discussed in the past the fact that
flip shouldn't alter test patterns...

> so those expose some interesting effects :-/
>
>   Dave
>
> > +};
> > +
> > +static u8 ov5647_test_pattern_val[] = {
> > +       0x00,   /* Disabled */
> > +       0x80,   /* Color Bars */
> > +       0x82,   /* Color Squares */
> > +       0x81,   /* Random Data */
> > +       0x83,   /* Input Data */
> > +};
> > +
> >  static const struct regval_list sensor_oe_disable_regs[] = {
> >         {0x3000, 0x00},
> >         {0x3001, 0x00},
> > @@ -1242,6 +1259,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> >                 ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
> >                                      sensor->mode->format.height + ctrl->val);
> >                 break;
> > +       case V4L2_CID_TEST_PATTERN:
> > +               ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> > +                                  ov5647_test_pattern_val[ctrl->val]);
> > +               break;
> >
> >         /* Read-only, but we adjust it based on mode. */
> >         case V4L2_CID_PIXEL_RATE:
> > @@ -1270,7 +1291,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> >         struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> >         int hblank, exposure_max, exposure_def;
> >
> > -       v4l2_ctrl_handler_init(&sensor->ctrls, 8);
> > +       v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> >
> >         v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> >                           V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> > @@ -1314,6 +1335,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
> >                                            sensor->mode->vts -
> >                                            sensor->mode->format.height);
> >
> > +       v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &ov5647_ctrl_ops,
> > +                                    V4L2_CID_TEST_PATTERN,
> > +                                    ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
> > +                                    0, 0, ov5647_test_pattern_menu);
> > +
> >         if (sensor->ctrls.error)
> >                 goto handler_free;
> >
> > --
> > 2.39.0
> >
