Return-Path: <linux-media+bounces-3360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5333827DD8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 05:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7CE8B23053
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 04:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CEB819;
	Tue,  9 Jan 2024 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK4E1GrR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3885F370;
	Tue,  9 Jan 2024 04:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28cec7ae594so2234470a91.3;
        Mon, 08 Jan 2024 20:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704774827; x=1705379627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCMId/5L0iH9DyJS85Qpr/inU5ufG7LGKBtdnJQ8fPY=;
        b=hK4E1GrR/zmkw/6NW7xn8eXBqOnPIe1cIGdhneMJIFA9zpuFULROhAhP9MTV0BgAFB
         qJOyiFbH1yiWJ8RqE7JzhJYRB7taM2cL8ar/c1sDOObnND1mpWThC4s8qVJZCts2bLbS
         5QgtxuG3xNlNnTPG2ev1JpDYqL2fasqxNBmyGxEHI/0ADO2KthPZy+tARzsFNSsq5xTJ
         g97SIhvZ1kpNJ+Lj8dwCUbAw+ndMlV+lT0Zm/6MQ4l9EB5ItKhLBogXE1TfGgnbxrqmg
         HgfHICCZGjzSm7hQOjgl/0Orn+ilq8s/z+BJ+D8bxAu/00bdPlP/oB32Hjpi7/B7+5Zp
         pBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704774827; x=1705379627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCMId/5L0iH9DyJS85Qpr/inU5ufG7LGKBtdnJQ8fPY=;
        b=gRnDtbt/hmlDjrveTDSgglPaxJdyxL+HHf8Ini2AAnk12dD+fdmo9rUrGEvgEdfZOa
         HSJIr6Hjg71dQQ0XvhcewsEExpufp1EC42oO2TAMB3A4yePJsnawP9k6T/A+ImLYq9Dg
         sFXDlf1IN8rT9p0yb7kSdj1k1S2fCLR7RAI1LXbTO+SJ22/zpTAnGr2pYZtRl5wilgc+
         24ipQ2/AxM42zLG4fliHkQLnDRBDytLyA6GpFqk07EJSYO4APo1Udk3UB11KD/X3Oow5
         kujw15jynf8OV/AUSCOXCIAAf2Ok6VS7xj1Hj8avkGmkMTAJa88CUpk4my4ykNKd9Vmx
         7TXA==
X-Gm-Message-State: AOJu0YxmO7SK/KhzKwrwLnodxWVyWyPn7iBtr1AX0m0vSJY2OF98imn8
	UaWlJEGYA9pmev40ZXC+Kmc=
X-Google-Smtp-Source: AGHT+IGiFBvvyJDs12ei6bbXdkJkIxS+qj/bVfuW1pO0+Whhn/OKMYwVXlvcsZ9zgbLaBLtEi9X40g==
X-Received: by 2002:a17:90a:2f88:b0:28c:d9b:5983 with SMTP id t8-20020a17090a2f8800b0028c0d9b5983mr2475568pjd.48.1704774827273;
        Mon, 08 Jan 2024 20:33:47 -0800 (PST)
Received: from localhost ([218.186.180.226])
        by smtp.gmail.com with ESMTPSA id b15-20020a17090a12cf00b0028c89122f8asm785020pjg.6.2024.01.08.20.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 20:33:46 -0800 (PST)
Date: Tue, 9 Jan 2024 12:33:45 +0800
From: Vinay Varma <varmavinaym@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"open list:SONY IMX219 SENSOR DRIVER" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx219: implement the v4l2 selection api
Message-ID: <6qv3g6h4xl7sbpsyzlwm7lpfvb5eqjm6242ahzl7cuclziokl5@fev53ashkup3>
References: <kv6yfyahbud474e75y4jaczg64pcowvlz7i52kikknuh6wje5o@4k2hikwcueoy>
 <ZZu2C_lu6TAh-LOf@kekkonen.localdomain>
 <3q6andka2su7i43xz2ok44ejvtb3hdjdn6xretyde7sdcvtd7l@lz2syngckivi>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3q6andka2su7i43xz2ok44ejvtb3hdjdn6xretyde7sdcvtd7l@lz2syngckivi>

Hi Jacopo, Sakari,

I have sent out an updated patch with all the changes mentioned here,
but `git send-email` ended up creating a new thread rather than replying
to this one.

On 24/01/08 10:19AM, Jacopo Mondi wrote:
> Hi Sakari, Vinay,
> 
>    a more foundamental question is how this usage of the crop/compose
> API plays with the fact we enumerate only a limited set of frame
> sizes, and now you can get an arbitrary output size. We could get away
> by modifying enum_frame_sizes to return a size range (or ranges) but I
> wonder if it wouldn't be better to introduce an internal pad to
> represent the pixel array where to apply TGT_CROP in combination with
> a source pad where we could apply TGT_COMPOSE and an output format.
While the driver could support stepwise framesizes, to maintain
backwards compatibility do we not have to continue with the existing 4
driscrete framesizes? At the same time, the selection API gives a lot
more control than S_FMT operation in terms of what area to sample that
may not be required for the general use cases.
> 
> To be completely honest, binning should be handled with a different
> mechanism than the selection API, but that would require a completly
> new design.
I agree that a lot of the binning aspects feels very implicit in the
driver - such as whether to use Avg or Sum binning in the case of the
IMX219 driver. However, the driver already uses binning to expose the
various modes of operation. At the same time any implemntation of the
selection API would require to modify binning, if not we will have to
use the binning set by the current mode - which too seems implicit and a
bit restrictive. 
> 
> Laurent: are there plans to introduce internal pad for embedded data
> support for this sensor ?
> 
> Also, the patch doesn't apply on the most recent media master, please
> rebase before resending.
> 
> On Mon, Jan 08, 2024 at 08:44:59AM +0000, Sakari Ailus wrote:
> > Hi Vinay,
> >
> > Thanks for the patch.
> >
> > On Sun, Jan 07, 2024 at 03:42:59PM +0800, Vinay Varma wrote:
> > > This patch exposes IMX219's crop and compose capabilities
> > > by implementing the selection API. Horizontal and vertical
> > > binning being separate registers, `imx219_binning_goodness`
> > > computes the best possible height and width of the compose
> > > specification using the selection flags. Compose operation
> > > updates the subdev's format object to keep them in sync.
> >
> > The line length limit here is 75, not ~ 60. Please rewrap.
> >
> > >
> > > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 222 +++++++++++++++++++++++++++++++------
> > >  1 file changed, 190 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 39943d72c22d..27d85fb7ad51 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -29,6 +29,7 @@
> > >  #include <media/v4l2-event.h>
> > >  #include <media/v4l2-fwnode.h>
> > >  #include <media/v4l2-mediabus.h>
> > > +#include <media/v4l2-rect.h>
> > >
> > >  /* Chip ID */
> > >  #define IMX219_REG_CHIP_ID		CCI_REG16(0x0000)
> > > @@ -73,6 +74,7 @@
> > >  /* V_TIMING internal */
> > >  #define IMX219_REG_VTS			CCI_REG16(0x0160)
> > >  #define IMX219_VTS_MAX			0xffff
> > > +#define IMX219_VTS_DEF 1763
> > >
> > >  #define IMX219_VBLANK_MIN		32
> > >
> > > @@ -146,6 +148,7 @@
> > >  #define IMX219_PIXEL_ARRAY_TOP		8U
> > >  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
> > >  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> > > +#define IMX219_MIN_COMPOSE_SIZE 8U
> >
> > Please align 8U with the rest of the macros. Same above.
> >
> > >
> > >  /* Mode : resolution and related config&values */
> > >  struct imx219_mode {
> > > @@ -284,6 +287,8 @@ static const u32 imx219_mbus_formats[] = {
> > >  #define IMX219_XCLR_MIN_DELAY_US	6200
> > >  #define IMX219_XCLR_DELAY_RANGE_US	1000
> > >
> > > +static const u32 binning_ratios[] = { 1, 2 };
> > > +
> > >  /* Mode configs */
> > >  static const struct imx219_mode supported_modes[] = {
> > >  	{
> > > @@ -296,19 +301,19 @@ static const struct imx219_mode supported_modes[] = {
> > >  		/* 1080P 30fps cropped */
> > >  		.width = 1920,
> > >  		.height = 1080,
> > > -		.vts_def = 1763,
> > > +		.vts_def = IMX219_VTS_DEF,
> > >  	},
> > >  	{
> > >  		/* 2x2 binned 30fps mode */
> > >  		.width = 1640,
> > >  		.height = 1232,
> > > -		.vts_def = 1763,
> > > +		.vts_def = IMX219_VTS_DEF,
> > >  	},
> > >  	{
> > >  		/* 640x480 30fps mode */
> > >  		.width = 640,
> > >  		.height = 480,
> > > -		.vts_def = 1763,
> > > +		.vts_def = IMX219_VTS_DEF,
> > >  	},
> > >  };
> > >
> > > @@ -809,6 +814,39 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> > >  	return 0;
> > >  }
> > >
> > > +static void imx219_refresh_ctrls(struct v4l2_subdev *sd,
> > > +				 struct v4l2_subdev_state *state,
> > > +				 unsigned int vts_def)
> > > +{
> > > +	int exposure_max;
> > > +	int exposure_def;
> > > +	int hblank;
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +	struct v4l2_mbus_framefmt *fmt =
> > > +		v4l2_subdev_get_pad_format(sd, state, 0);
> > > +
> > > +	/* Update limits and set FPS to default */
> > > +	__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > > +				 IMX219_VTS_MAX - fmt->height, 1,
> > > +				 vts_def - fmt->height);
> > > +	__v4l2_ctrl_s_ctrl(imx219->vblank, vts_def - fmt->height);
> > > +	/* Update max exposure while meeting expected vblanking */
> > > +	exposure_max = vts_def - 4;
> > > +	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> > > +			       exposure_max :
> > > +			       IMX219_EXPOSURE_DEFAULT;
> > > +	__v4l2_ctrl_modify_range(imx219->exposure, imx219->exposure->minimum,
> > > +				 exposure_max, imx219->exposure->step,
> > > +				 exposure_def);
> > > +	/*
> > > +	 * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> > > +	 * depends on mode->width only, and is not changeble in any
> > > +	 * way other than changing the mode.
> > > +	 */
> > > +	hblank = IMX219_PPL_DEFAULT - fmt->width;
> > > +	__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1, hblank);
> > > +}
> > > +
> > >  static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  				 struct v4l2_subdev_state *state,
> > >  				 struct v4l2_subdev_format *fmt)
> > > @@ -816,7 +854,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  	struct imx219 *imx219 = to_imx219(sd);
> > >  	const struct imx219_mode *mode;
> > >  	struct v4l2_mbus_framefmt *format;
> > > -	struct v4l2_rect *crop;
> > > +	struct v4l2_rect *crop, *compose;
> > >  	unsigned int bin_h, bin_v;
> > >
> > >  	mode = v4l2_find_nearest_size(supported_modes,
> > > @@ -842,34 +880,14 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> > >  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> > >
> > > -	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > -		int exposure_max;
> > > -		int exposure_def;
> > > -		int hblank;
> > > -
> > > -		/* Update limits and set FPS to default */
> > > -		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> > > -					 IMX219_VTS_MAX - mode->height, 1,
> > > -					 mode->vts_def - mode->height);
> > > -		__v4l2_ctrl_s_ctrl(imx219->vblank,
> > > -				   mode->vts_def - mode->height);
> > > -		/* Update max exposure while meeting expected vblanking */
> > > -		exposure_max = mode->vts_def - 4;
> > > -		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> > > -			exposure_max : IMX219_EXPOSURE_DEFAULT;
> > > -		__v4l2_ctrl_modify_range(imx219->exposure,
> > > -					 imx219->exposure->minimum,
> > > -					 exposure_max, imx219->exposure->step,
> > > -					 exposure_def);
> > > -		/*
> > > -		 * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> > > -		 * depends on mode->width only, and is not changeble in any
> > > -		 * way other than changing the mode.
> > > -		 */
> > > -		hblank = IMX219_PPL_DEFAULT - mode->width;
> > > -		__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> > > -					 hblank);
> > > -	}
> > > +	compose = v4l2_subdev_get_pad_compose(sd, state, 0);
> > > +	compose->width = format->width;
> > > +	compose->height = format->height;
> > > +	compose->left = 0;
> > > +	compose->top = 0;
> > > +
> > > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > > +		imx219_refresh_ctrls(sd, state, mode->vts_def);
> > >
> > >  	return 0;
> > >  }
> > > @@ -884,6 +902,11 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> > >  		return 0;
> > >  	}
> > >
> > > +	case V4L2_SEL_TGT_COMPOSE: {
> > > +		sel->r = *v4l2_subdev_get_pad_compose(sd, state, 0);
> > > +		return 0;
> > > +	}
> >
> > The braces are unnecessary here.
> >
> > > +
> > >  	case V4L2_SEL_TGT_NATIVE_SIZE:
> > >  		sel->r.top = 0;
> > >  		sel->r.left = 0;
> > > @@ -900,11 +923,145 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> > >  		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > >
> > >  		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > > +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > > +	case V4L2_SEL_TGT_COMPOSE_PADDED:
> > > +		sel->r.top = 0;
> > > +		sel->r.left = 0;
> > > +		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > > +		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > > +		return 0;
> > >  	}
> > >
> > >  	return -EINVAL;
> > >  }
> > >
> > > +#define IMX219_ROUND(dim, step, flags)                \
> > > +	((flags) & V4L2_SEL_FLAG_GE ?                 \
> > > +		 round_up((dim), (step)) :            \
> > > +		 ((flags) & V4L2_SEL_FLAG_LE ?        \
> > > +			  round_down((dim), (step)) : \
> > > +			  round_down((dim) + (step) / 2, (step))))
> > > +
> > > +static int imx219_set_selection_crop(struct v4l2_subdev *sd,
> > > +				     struct v4l2_subdev_state *sd_state,
> > > +				     struct v4l2_subdev_selection *sel)
> > > +{
> > > +	u32 max_binning;
> > > +	struct v4l2_rect *compose, *crop;
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +
> > > +	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > > +	if (v4l2_rect_equal(&sel->r, crop))
> > > +		return false;
> > > +	max_binning = binning_ratios[ARRAY_SIZE(binning_ratios) - 1];
> > > +	sel->r.width =
> > > +		clamp(IMX219_ROUND(sel->r.width, max_binning, sel->flags),
> > > +		      max_binning * IMX219_MIN_COMPOSE_SIZE,
> > > +		      IMX219_PIXEL_ARRAY_WIDTH);
> > > +	sel->r.height =
> > > +		clamp(IMX219_ROUND(sel->r.width, max_binning, sel->flags),
> > > +		      max_binning * IMX219_MIN_COMPOSE_SIZE,
> > > +		      IMX219_PIXEL_ARRAY_WIDTH);
> > > +	sel->r.left =
> > > +		min_t(u32, sel->r.left, IMX219_PIXEL_ARRAY_LEFT - sel->r.width);
> > > +	sel->r.top =
> > > +		min_t(u32, sel->r.top, IMX219_PIXEL_ARRAY_TOP - sel->r.top);
> > > +
> > > +	compose = v4l2_subdev_get_pad_compose(sd, sd_state, 0);
> > > +	fmt = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > +	*crop = sel->r;
> > > +	compose->height = crop->height;
> > > +	compose->width = crop->width;
> > > +	return true;
> > > +}
> > > +
> > > +static int imx219_binning_goodness(u32 act, u32 ask, u32 flags)
> > > +{
> > > +	const int goodness = 100000;
> > > +	int val = 0;
> > > +
> > > +	if (flags & V4L2_SEL_FLAG_GE)
> > > +		if (act < ask)
> > > +			val -= goodness;
> > > +
> > > +	if (flags & V4L2_SEL_FLAG_LE)
> > > +		if (act > ask)
> > > +			val -= goodness;
> > > +
> > > +	val -= abs(act - ask);
> > > +
> > > +	return val;
> > > +}
> > > +
> > > +static bool imx219_set_selection_compose(struct v4l2_subdev *sd,
> > > +					 struct v4l2_subdev_state *state,
> > > +					 struct v4l2_subdev_selection *sel)
> > > +{
> > > +	int best_goodness;
> >
> > This would be nicer if declared after the line below. Think of reverse
> > Christmas trees.
> >
> > Similarly for max_binning a few functions up actually as well as variables
> > in imx219_refresh_ctrls().
> >
> > > +	struct v4l2_rect *compose, *crop;
> > > +
> > > +	compose = v4l2_subdev_get_pad_compose(sd, state, 0);
> > > +	if (v4l2_rect_equal(compose, &sel->r))
> > > +		return false;
> > > +
> > > +	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
> > > +
> > > +	best_goodness = INT_MIN;
> > > +	for (int i = 0; i < ARRAY_SIZE(binning_ratios); ++i) {
> > > +		u32 width = crop->width / binning_ratios[i];
> > > +		int goodness = imx219_binning_goodness(width, sel->r.width,
> > > +						       sel->flags);
> > > +		if (goodness > best_goodness) {
> > > +			best_goodness = goodness;
> > > +			compose->width = width;
> > > +		}
> > > +	}
> > > +	best_goodness = INT_MIN;
> > > +	for (int i = 0; i < ARRAY_SIZE(binning_ratios); ++i) {
> > > +		u32 height = crop->height / binning_ratios[i];
> > > +		int goodness = imx219_binning_goodness(height, sel->r.height,
> > > +						       sel->flags);
> > > +		if (goodness > best_goodness) {
> > > +			best_goodness = goodness;
> > > +			compose->height = height;
> > > +		}
> > > +	}
> > > +	return true;
> > > +}
> > > +
> > > +static int imx219_set_selection(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_state *sd_state,
> > > +				struct v4l2_subdev_selection *sel)
> > > +{
> > > +	bool compose_updated = false;
> > > +
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_CROP:
> > > +		compose_updated = imx219_set_selection_crop(sd, sd_state, sel);
> > > +		break;
> > > +	case V4L2_SEL_TGT_COMPOSE:
> > > +		compose_updated =
> > > +			imx219_set_selection_compose(sd, sd_state, sel);
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +	if (compose_updated) {
> > > +		struct v4l2_rect *compose =
> > > +			v4l2_subdev_get_pad_compose(sd, sd_state, 0);
> > > +		struct v4l2_mbus_framefmt *fmt =
> > > +			v4l2_subdev_get_pad_format(sd, sd_state, 0);
> >
> > A newline here?
> >
> > > +		fmt->height = compose->height;
> > > +		fmt->width = compose->width;
> > > +	}
> > > +	if (compose_updated && sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > > +		imx219_refresh_ctrls(sd, sd_state, IMX219_VTS_DEF);
> >
> > Please move this inside the previous condition (where you check just
> > sel->which).
> >
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int imx219_init_cfg(struct v4l2_subdev *sd,
> > >  			   struct v4l2_subdev_state *state)
> > >  {
> > > @@ -938,6 +1095,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> > >  	.get_fmt = v4l2_subdev_get_fmt,
> > >  	.set_fmt = imx219_set_pad_format,
> > >  	.get_selection = imx219_get_selection,
> > > +	.set_selection = imx219_set_selection,
> > >  	.enum_frame_size = imx219_enum_frame_size,
> > >  };
> > >
> >
> > --
> > Regards,
> >
> > Sakari Ailus
> >

