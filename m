Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895477853B3
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbjHWJTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235540AbjHWJSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:18:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D495F1702
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 02:07:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D27015A4;
        Wed, 23 Aug 2023 11:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692781578;
        bh=XPbuEX6j8Ut64oUniivzzSwgpo17CaP/3ewG/yuqtkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dp1NB44y4c70zXDyHpn/SqUzC+7UlR2fbIf6ccJTKNcokGvYOcD4Dml9Sknux5+V/
         T2I3b20B0hr4p98Z1U3dAGsuExmPQpZO0eXp0I7sYwBTHQsadm3G/iBNZQcWLftdcC
         0Jc69Ez4X7S2jcB2F0drDbenBsh2IJPSnLytixGw=
Date:   Wed, 23 Aug 2023 12:07:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 16/18] media: i2c: imx219: Calculate crop rectangle
 dynamically
Message-ID: <20230823090742.GE4143@pendragon.ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-17-laurent.pinchart@ideasonboard.com>
 <CAPY8ntAmdkSKcGVdCURt-Zae-nQk9Ljwu0Gp28bx-Er6_Vq-AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAmdkSKcGVdCURt-Zae-nQk9Ljwu0Gp28bx-Er6_Vq-AA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Aug 22, 2023 at 07:15:21PM +0100, Dave Stevenson wrote:
> On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart wrote:
> >
> > Calculate the crop rectangle size and location dynamically when setting
> > the format, instead of storing it in the imx219_mode structure. This
> > removes duplicated information from the mode, to guarantee consistency.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 45 +++++++++++++-------------------------
> >  1 file changed, 15 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 646d73d1e6a3..4140d9b78e4c 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> > @@ -152,9 +153,6 @@ struct imx219_mode {
> >         /* Frame height */
> >         unsigned int height;
> >
> > -       /* Analog crop rectangle. */
> > -       struct v4l2_rect crop;
> > -
> >         /* V-timing */
> >         unsigned int vts_def;
> >  };
> > @@ -292,48 +290,24 @@ static const struct imx219_mode supported_modes[] = {
> >                 /* 8MPix 15fps mode */
> >                 .width = 3280,
> >                 .height = 2464,
> > -               .crop = {
> > -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> > -                       .top = IMX219_PIXEL_ARRAY_TOP,
> > -                       .width = 3280,
> > -                       .height = 2464
> > -               },
> >                 .vts_def = 3526,
> >         },
> >         {
> >                 /* 1080P 30fps cropped */
> >                 .width = 1920,
> >                 .height = 1080,
> > -               .crop = {
> > -                       .left = 688,
> > -                       .top = 700,
> > -                       .width = 1920,
> > -                       .height = 1080
> > -               },
> >                 .vts_def = 1763,
> >         },
> >         {
> >                 /* 2x2 binned 30fps mode */
> >                 .width = 1640,
> >                 .height = 1232,
> > -               .crop = {
> > -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> > -                       .top = IMX219_PIXEL_ARRAY_TOP,
> > -                       .width = 3280,
> > -                       .height = 2464
> > -               },
> >                 .vts_def = 1763,
> >         },
> >         {
> >                 /* 640x480 30fps mode */
> >                 .width = 640,
> >                 .height = 480,
> > -               .crop = {
> > -                       .left = 1008,
> > -                       .top = 760,
> > -                       .width = 1280,
> > -                       .height = 960
> > -               },
> >                 .vts_def = 1763,
> >         },
> >  };
> > @@ -830,6 +804,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         int exposure_max, exposure_def, hblank;
> >         struct v4l2_mbus_framefmt *format;
> >         struct v4l2_rect *crop;
> > +       unsigned int bin;
> >
> >         mode = v4l2_find_nearest_size(supported_modes,
> >                                       ARRAY_SIZE(supported_modes),
> > @@ -839,10 +814,20 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> >
> >         format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > -       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > -
> >         *format = fmt->format;
> > -       *crop = mode->crop;
> > +
> > +       /*
> > +        * Use binning to maximize the crop rectangle size, and centre it in the
> > +        * sensor. Bin by the same factor horizontally and vertically.
> > +        */
> > +       bin = min3(IMX219_PIXEL_ARRAY_WIDTH / format->width,
> > +                  IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> 
> If you're insisting that binning is by the same factor horizontally
> and vertically, why consider both in the min? Either only look at one,
> or we start looking at making H & V binning independent.

I was considering making them independent. It should be fairly easy. If
you're fine with that, I think that would be my preference.

> > +
> > +       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > +       crop->width = format->width * bin;
> > +       crop->height = format->height * bin;
> > +       crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> > +       crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >                 /* Update limits and set FPS to default */

-- 
Regards,

Laurent Pinchart
