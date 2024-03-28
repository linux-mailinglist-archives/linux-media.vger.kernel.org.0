Return-Path: <linux-media+bounces-8112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE66890666
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 17:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8441C307FC
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 16:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B5D3BBF5;
	Thu, 28 Mar 2024 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vP5Efkmz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2A3A1DA
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711644991; cv=none; b=bVGemqpbL6NeZjWvV8YMjn9Mkw/Jg51/eZVilQAtPOEsZgpKW6Yr/tbXZxypHaEQyoizswyT3gSl20EHPKI2UMwiZMgHdP850b+vKhJ5E2xw+YOEfni25yFrK/dxnI3/GzvZErvXKRRrHRcmNwhcTYjFhXnPHnyj9r9FAgOJ9Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711644991; c=relaxed/simple;
	bh=8LS/zIWeXULexUHeQGwguNbOVji99ju+Jb2pSygFWpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0Hi6ahMrIK3eLq7VPy4/CyVMiCB7Kay2mn+IXHTeMJLhcZ8PS8tzNcOzUqmijGH7ny7lRmcV8+rz2AzChnNmTTp2VuZBH44/oJdsGVtDjSPrUgpcttquNLuiYSM7uO0YOTF7QKW0KviyO+8feH71VuD4sfZn8mBIwp+dPNfbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vP5Efkmz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F224D20;
	Thu, 28 Mar 2024 17:55:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711644955;
	bh=8LS/zIWeXULexUHeQGwguNbOVji99ju+Jb2pSygFWpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vP5Efkmz+7VRCcZWq7WKVh4zNygXIJu3Kg1GI29YMu/XUGBqvkEu5JPTOfOxRdMww
	 z+NbWiq6gFIxL0rwdCFJitw9CXPRbeQN+bmVhsTqoGV/eO93ABLzFm1dsxjI3O3I/C
	 8TYKTKy+xeHsBmyWiHmjupqIca1i9tFJ62CC2IHg=
Date: Thu, 28 Mar 2024 18:56:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v7 02/15] media: i2c: imx219: Add internal image sink pad
Message-ID: <20240328165618.GF16097@pendragon.ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-3-laurent.pinchart@ideasonboard.com>
 <887c8055-245c-4768-abe6-29d17472b06c@ideasonboard.com>
 <20240328160912.GD11463@pendragon.ideasonboard.com>
 <6eabb69a-4623-4cc2-bb43-63e849c00969@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6eabb69a-4623-4cc2-bb43-63e849c00969@ideasonboard.com>

On Thu, Mar 28, 2024 at 06:18:24PM +0200, Tomi Valkeinen wrote:
> On 28/03/2024 18:09, Laurent Pinchart wrote:
> > On Wed, Mar 27, 2024 at 11:51:49AM +0200, Tomi Valkeinen wrote:
> >> On 25/03/2024 00:08, Laurent Pinchart wrote:
> >>> Use the newly added internal pad API to expose the internal
> >>> configuration of the sensor to userspace in a standard manner. This also
> >>> paves the way for adding support for embedded data with an additional
> >>> internal pad.
> >>>
> >>> To maintain compatibility with existing userspace that may operate on
> >>> pad 0 unconditionally, keep the source pad numbered 0 and number the
> >>> internal image pad 1.
> >>
> >> If I remember right, we discussed that this (internal pads after
> >> external pads) would be the approach also for totally new drivers.
> > 
> > Do you recall the rationale for that ? Compatibility (within some limits
> > I suppose) with existing userspace for new drivers ?
> 
> I don't. Probably compatibility, and making the subdevs with internal 
> pads look similar to subdevs without them. I guess in theory it 
> shouldn't matter.
> 
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>    drivers/media/i2c/imx219.c | 169 +++++++++++++++++++++++++++++--------
> >>>    1 file changed, 133 insertions(+), 36 deletions(-)
> >>>
> >>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >>> index 3878da50860e..817bf192e4d9 100644
> >>> --- a/drivers/media/i2c/imx219.c
> >>> +++ b/drivers/media/i2c/imx219.c
> >>> @@ -140,6 +140,7 @@
> >>>    #define IMX219_DEFAULT_LINK_FREQ_4LANE	363000000
> >>>    
> >>>    /* IMX219 native and active pixel array size. */
> >>> +#define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
> >>>    #define IMX219_NATIVE_WIDTH		3296U
> >>>    #define IMX219_NATIVE_HEIGHT		2480U
> >>>    #define IMX219_PIXEL_ARRAY_LEFT		8U
> >>> @@ -312,9 +313,15 @@ static const struct imx219_mode supported_modes[] = {
> >>>    	},
> >>>    };
> >>>    
> >>> +enum imx219_pad_ids {
> >>> +	IMX219_PAD_SOURCE,
> >>> +	IMX219_PAD_IMAGE,
> >>> +	IMX219_NUM_PADS,
> >>> +};
> >>
> >> Nitpick, but if the numbering of the values is important, I always mark
> >> the first one "= 0", to make it clear(er) for the reader.
> > 
> > I'll do that.
> > 
> >>>    struct imx219 {
> >>>    	struct v4l2_subdev sd;
> >>> -	struct media_pad pad;
> >>> +	struct media_pad pads[IMX219_NUM_PADS];
> >>>    
> >>>    	struct regmap *regmap;
> >>>    	struct clk *xclk; /* system clock to IMX219 */
> >>> @@ -374,7 +381,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >>>    	int ret = 0;
> >>>    
> >>>    	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> >>> -	format = v4l2_subdev_state_get_format(state, 0);
> >>> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> >>>    
> >>>    	if (ctrl->id == V4L2_CID_VBLANK) {
> >>>    		int exposure_max, exposure_def;
> >>> @@ -593,8 +600,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >>>    	u64 bin_h, bin_v;
> >>>    	int ret = 0;
> >>>    
> >>> -	format = v4l2_subdev_state_get_format(state, 0);
> >>> -	crop = v4l2_subdev_state_get_crop(state, 0);
> >>> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> >>> +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
> >>>    
> >>>    	switch (format->code) {
> >>>    	case MEDIA_BUS_FMT_SRGGB8_1X8:
> >>> @@ -764,10 +771,25 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> >>>    {
> >>>    	struct imx219 *imx219 = to_imx219(sd);
> >>>    
> >>> -	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> >>> -		return -EINVAL;
> >>> +	if (code->pad == IMX219_PAD_IMAGE) {
> >>> +		/* The internal image pad is hardwired to the native format. */
> >>> +		if (code->index)
> >>> +			return -EINVAL;
> >>>    
> >>> -	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
> >>> +		code->code = IMX219_NATIVE_FORMAT;
> >>> +	} else {
> >>> +		/*
> >>> +		 * On the source pad, the sensor supports multiple raw formats
> >>> +		 * with different bit depths.
> >>> +		 */
> >>> +		u32 format;
> >>> +
> >>> +		if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> >>> +			return -EINVAL;
> >>> +
> >>> +		format = imx219_mbus_formats[code->index * 4];
> >>> +		code->code = imx219_get_format_code(imx219, format);
> >>> +	}
> >>>    
> >>>    	return 0;
> >>>    }
> >>> @@ -777,19 +799,25 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >>>    				  struct v4l2_subdev_frame_size_enum *fse)
> >>>    {
> >>>    	struct imx219 *imx219 = to_imx219(sd);
> >>> -	u32 code;
> >>>    
> >>> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> >>> -		return -EINVAL;
> >>> +	if (fse->pad == IMX219_PAD_IMAGE) {
> >>> +		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
> >>> +			return -EINVAL;
> >>>    
> >>> -	code = imx219_get_format_code(imx219, fse->code);
> >>> -	if (fse->code != code)
> >>> -		return -EINVAL;
> >>> +		fse->min_width = IMX219_NATIVE_WIDTH;
> >>> +		fse->max_width = IMX219_NATIVE_WIDTH;
> >>> +		fse->min_height = IMX219_NATIVE_HEIGHT;
> >>> +		fse->max_height = IMX219_NATIVE_HEIGHT;
> >>> +	} else {
> >>> +		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
> >>> +		    fse->index >= ARRAY_SIZE(supported_modes))
> >>> +			return -EINVAL;
> >>>    
> >>> -	fse->min_width = supported_modes[fse->index].width;
> >>> -	fse->max_width = fse->min_width;
> >>> -	fse->min_height = supported_modes[fse->index].height;
> >>> -	fse->max_height = fse->min_height;
> >>> +		fse->min_width = supported_modes[fse->index].width;
> >>> +		fse->max_width = fse->min_width;
> >>> +		fse->min_height = supported_modes[fse->index].height;
> >>> +		fse->max_height = fse->min_height;
> >>> +	}
> >>>    
> >>>    	return 0;
> >>>    }
> >>> @@ -801,9 +829,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >>>    	struct imx219 *imx219 = to_imx219(sd);
> >>>    	const struct imx219_mode *mode;
> >>>    	struct v4l2_mbus_framefmt *format;
> >>> +	struct v4l2_rect *compose;
> >>>    	struct v4l2_rect *crop;
> >>>    	unsigned int bin_h, bin_v;
> >>>    
> >>> +	/*
> >>> +	 * The driver is mode-based, the format can be set on the source pad
> >>> +	 * only.
> >>> +	 */
> >>> +	if (fmt->pad != IMX219_PAD_SOURCE)
> >>> +		return v4l2_subdev_get_fmt(sd, state, fmt);
> >>> +
> >>>    	/*
> >>>    	 * Adjust the requested format to match the closest mode. The Bayer
> >>>    	 * order varies with flips.
> >>> @@ -822,22 +858,51 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >>>    	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >>>    	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> >>>    
> >>> -	format = v4l2_subdev_state_get_format(state, 0);
> >>> +	/* Propagate the format through the sensor. */
> >>> +
> >>> +	/* The image pad models the pixel array, and thus has a fixed size. */
> >>> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_IMAGE);
> >>>    	*format = fmt->format;
> >>> +	format->code = IMX219_NATIVE_FORMAT;
> >>> +	format->width = IMX219_NATIVE_WIDTH;
> >>> +	format->height = IMX219_NATIVE_HEIGHT;
> >>
> >> Isn't the image pad format always the same, and cannot be changed? The
> >> above hints otherwise. What fields can change in the image pad?
> > 
> > None. I'll update the comment above to state
> > 
> > 	/* The image pad models the pixel array, and thus has a fixed format. */
> > 
> > The code behaviour matches that.
> 
> If it never changes, shouldn't it be set once in init_state, rather than 
> setting it here every time set_format is called?

I think Sakari commented on that too. It's possible, but make
.init_state() significantly more complex, and splits the logic between
.init_state() and .set_fmt(). I'm not convinced it's worth the work.

-- 
Regards,

Laurent Pinchart

