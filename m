Return-Path: <linux-media+bounces-31060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C62A9C890
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 14:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7470188BEBC
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED1E2472AD;
	Fri, 25 Apr 2025 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tZL/aVSb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E0B22126C
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582776; cv=none; b=jNyj7BMarAEu0/3f1oTqCbolLS/i1Z+6AhXp2Js3JMoo1a/EWmymRUgW1aAtRgsK9KAwDLmAGZM64cRthzbjWjV9MJQ4GbcQZJ+bqmw6g7pXyXXEQBtHE55KtYwVBMlQw8FaItwQvRtOVgrJN1IiAmmQp/vckes8tQnjx3RNjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582776; c=relaxed/simple;
	bh=AMyuzecdyvVFIwZMwHNph6A9YhVGdJNF798S7IsaXsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGCK4G1mBZS5dAinKBW0NC5D9xjU3ctBeETBfOgtW69tRVSh3fknHLV0h2S9KvHHjCR22DN0eR+JP2P0iiLlylEvzDgqcg54Y5+k1qY83RpSgklZHAEJkppg84TwnDOgNd1KcVjKYoTMgyyPjvSjFX92nXZNyI/qc7XW1q7EBDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tZL/aVSb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A87282E;
	Fri, 25 Apr 2025 14:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745582770;
	bh=AMyuzecdyvVFIwZMwHNph6A9YhVGdJNF798S7IsaXsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZL/aVSb1ZfqONMER1EMfoWOUDy3my/NlLPQ2NaiFqmLxb+fpLRFkTpAa+TI9KcpL
	 6bpMjPSs0likx5J+dq6XpdoEclqvU53wN7MqiI/WdtywFXExwyPvXgt8RxL5B4yW4k
	 e7Ne+IOCOhFJuYO/SM82lN6DfqRE5IeM5Yb+Xp+k=
Date: Fri, 25 Apr 2025 15:06:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 18/20] media: i2c: imx219: Calculate crop rectangle
 dynamically
Message-ID: <20250425120610.GA24730@pendragon.ideasonboard.com>
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
 <20230924153309.12423-19-laurent.pinchart@ideasonboard.com>
 <CAPY8ntDmDkh+RM6knYMqqgpN11KhjaFUAowMsGmhV_3b92oN-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDmDkh+RM6knYMqqgpN11KhjaFUAowMsGmhV_3b92oN-A@mail.gmail.com>

Hi Dave,

On Tue, Apr 15, 2025 at 03:20:40PM +0100, Dave Stevenson wrote:
> On Sun, 24 Sept 2023 at 16:33, Laurent Pinchart wrote:
> >
> > Calculate the crop rectangle size and location dynamically when setting
> > the format, instead of storing it in the imx219_mode structure. This
> > removes duplicated information from the mode, to guarantee consistency.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Changes since v2:
> >
> > - Handle horizontal and vertical binning separately
> > ---
> >  drivers/media/i2c/imx219.c | 45 +++++++++++++-------------------------
> >  1 file changed, 15 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index bf1c2a1dad95..2b88c5b8a7bf 100644
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
> > @@ -153,9 +154,6 @@ struct imx219_mode {
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
> > @@ -844,6 +818,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >         int exposure_max, exposure_def, hblank;
> >         struct v4l2_mbus_framefmt *format;
> >         struct v4l2_rect *crop;
> > +       unsigned int bin_h, bin_v;
> >
> >         mode = v4l2_find_nearest_size(supported_modes,
> >                                       ARRAY_SIZE(supported_modes),
> > @@ -853,10 +828,20 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
> > +        * sensor.
> > +        */
> > +       bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
> > +       bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> 
> This patch missed 6.6 as the previous LTS, so we've only just noticed
> this regression with 6.12. It's also present in 6.15-rc2.
> 
> The 1920x1080 mode will give you bin_h of 1, but bin_v of 2 as 1080 <
> (2480/2). You therefore get a weirdly stretched image from the sensor.
> 
> I accept that having a nicely generic cropping/binning configuration
> is ideal, but currently this is a mode based driver, and there is no
> API to allow for configuring generic cropping/binning configuration.
> Until that API exists and can be implemented for previously mode-based
> drivers without regression, I see the only real options being either
> - move the binning setup back into struct imx219_mode and defined in
> supported modes
> - set the two binning values to be the same as the minimum of the two
> computed values.
> Which would be preferred?

Different horizontal and vertical binning factors seem to be a niche use
case to me, so I think I'd prefer the second option. It should also be
the simplest to implement. Would you like to send a patch ?

> > +
> > +       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > +       crop->width = format->width * bin_h;
> > +       crop->height = format->height * bin_v;
> > +       crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> > +       crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >                 /* Update limits and set FPS to default */

-- 
Regards,

Laurent Pinchart

