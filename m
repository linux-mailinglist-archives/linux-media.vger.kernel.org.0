Return-Path: <linux-media+bounces-6360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A262F870521
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 16:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C8581F23442
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 15:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE81487B6;
	Mon,  4 Mar 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h8e4kn6K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A57447772
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709565271; cv=none; b=XjcfNL6whwuoiLbL+pzrnF1C2or29sVDPKaOwz5PL5m1qvxjr7YHTC8aTC0TIV2i/pA9tEsSBrZF3hzATkzR2drQqrHWyZIppX4XlyIRnyDULymI+dVb3wQY2SHE+l1rk4vsMW4aTXxb/l9spnMXoSx60ACzvLBzTkcE0fpmqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709565271; c=relaxed/simple;
	bh=MTnKABlfkuyFSlsZUhw/USptxc9PvKOSS1AHk4AphPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruCJDnf3gUvZB6zpLPN4t1RjgIy7KtcC0dbLRJtSEwDkepPqoyD/NUk10on+d7pR+rrIku+/dfDw4W3xeHEvzJSIzpoA4yQNvoeJpDl45rlmyrbwNaqEiT9ISjAHAPotLWG1+2RZ2/00DZZgOS/LUxejpom9KZ+kIEKF/bfDmwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h8e4kn6K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B51753374;
	Mon,  4 Mar 2024 16:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709565248;
	bh=MTnKABlfkuyFSlsZUhw/USptxc9PvKOSS1AHk4AphPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8e4kn6KbMvlCoWUUpP9d+RuP79Y+kDHjWFzEBJfAtETCGzR1maO72ZjeyyCRvEMS
	 jA8lAkHX/VLEgkPOipoN6zJddJdqeiQ/FAI4ErWnv4BavaPRhyVJVW0sdwkkDml6co
	 kZFQVhkbpQn1gKqpSPy2Q1jIDlkyRt01Bq53QVaY=
Date: Mon, 4 Mar 2024 17:14:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v6 02/15] media: i2c: imx219: Add internal image sink pad
Message-ID: <20240304151426.GB21608@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-3-laurent.pinchart@ideasonboard.com>
 <ttl3uozfwxkcggjubnpnbwvy2nk22ke563zkzbpazyps243f2p@iwf46qtfiwyo>
 <275z3nycmioo737b2phuy4swhzziqyes4f3hgh5r6w2blvv5wc@ml3acqn6anzt>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <275z3nycmioo737b2phuy4swhzziqyes4f3hgh5r6w2blvv5wc@ml3acqn6anzt>

Hi Jacopo,

On Mon, Mar 04, 2024 at 10:38:12AM +0100, Jacopo Mondi wrote:
> On Mon, Mar 04, 2024 at 10:13:47AM +0100, Jacopo Mondi wrote:
> > On Fri, Mar 01, 2024 at 11:32:17PM +0200, Laurent Pinchart wrote:
> > > Use the newly added internal pad API to expose the internal
> > > configuration of the sensor to userspace in a standard manner. This also
> > > paves the way for adding support for embedded data with an additional
> > > internal pad.
> > >
> > > To maintain compatibility with existing userspace that may operate on
> > > pad 0 unconditionally, keep the source pad numbered 0 and number the
> > > internal image pad 1.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 169 +++++++++++++++++++++++++++++--------
> > >  1 file changed, 133 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 3878da50860e..817bf192e4d9 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -140,6 +140,7 @@
> > >  #define IMX219_DEFAULT_LINK_FREQ_4LANE	363000000
> > >
> > >  /* IMX219 native and active pixel array size. */
> > > +#define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
> > >  #define IMX219_NATIVE_WIDTH		3296U
> > >  #define IMX219_NATIVE_HEIGHT		2480U
> > >  #define IMX219_PIXEL_ARRAY_LEFT		8U
> > > @@ -312,9 +313,15 @@ static const struct imx219_mode supported_modes[] = {
> > >  	},
> > >  };
> > >
> > > +enum imx219_pad_ids {
> > > +	IMX219_PAD_SOURCE,
> > > +	IMX219_PAD_IMAGE,
> >
> > Feels a bit weird for the internal source pad to be named "Image" as
> > it will (if I understand correctly) host both the image and metadata
> > streams.
> >
> > However, I have an hard time proposing a different name, but we should
> > find something that should be used in all drivers ported to this new
> > API.
> >
> > Enough with bikeshedding anyway, this is a tiny detail.
> 
> Now that I've read 5/15 I now understand why this is called "IMAGE" :)

:-)

> > > +	IMX219_NUM_PADS,
> > > +};
> > > +
> > >  struct imx219 {
> > >  	struct v4l2_subdev sd;
> > > -	struct media_pad pad;
> > > +	struct media_pad pads[IMX219_NUM_PADS];
> > >
> > >  	struct regmap *regmap;
> > >  	struct clk *xclk; /* system clock to IMX219 */
> > > @@ -374,7 +381,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  	int ret = 0;
> > >
> > >  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> > > -	format = v4l2_subdev_state_get_format(state, 0);
> > > +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> > >
> > >  	if (ctrl->id == V4L2_CID_VBLANK) {
> > >  		int exposure_max, exposure_def;
> > > @@ -593,8 +600,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> > >  	u64 bin_h, bin_v;
> > >  	int ret = 0;
> > >
> > > -	format = v4l2_subdev_state_get_format(state, 0);
> > > -	crop = v4l2_subdev_state_get_crop(state, 0);
> > > +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> > > +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
> > >
> > >  	switch (format->code) {
> > >  	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > @@ -764,10 +771,25 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> > >  {
> > >  	struct imx219 *imx219 = to_imx219(sd);
> > >
> > > -	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> > > -		return -EINVAL;
> > > +	if (code->pad == IMX219_PAD_IMAGE) {
> > > +		/* The internal image pad is hardwired to the native format. */
> > > +		if (code->index)
> > > +			return -EINVAL;
> > >
> > > -	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
> > > +		code->code = IMX219_NATIVE_FORMAT;
> >
> > If you return 0 here you can spare the else {} branch. Same in the
> > function below.
> >
> 
> You're reworking this in 5/15, so no need to change this and cause
> rebase conflicts.

It's true that I'm reworking it further in 05/15, but I think the change
here still makes sense, as it updates the driver to support the internal
pad properly. Beside, if I were to drop this change, then I would get a
rebase conflict :-)

> > > +	} else {
> > > +		/*
> > > +		 * On the source pad, the sensor supports multiple raw formats
> > > +		 * with different bit depths.
> > > +		 */
> > > +		u32 format;
> > > +
> > > +		if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> > > +			return -EINVAL;
> > > +
> > > +		format = imx219_mbus_formats[code->index * 4];
> > > +		code->code = imx219_get_format_code(imx219, format);
> > > +	}
> > >
> > >  	return 0;
> > >  }
> > > @@ -777,19 +799,25 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> > >  				  struct v4l2_subdev_frame_size_enum *fse)
> > >  {
> > >  	struct imx219 *imx219 = to_imx219(sd);
> > > -	u32 code;
> > >
> > > -	if (fse->index >= ARRAY_SIZE(supported_modes))
> > > -		return -EINVAL;
> > > +	if (fse->pad == IMX219_PAD_IMAGE) {
> > > +		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
> > > +			return -EINVAL;
> > >
> > > -	code = imx219_get_format_code(imx219, fse->code);
> > > -	if (fse->code != code)
> > > -		return -EINVAL;
> > > +		fse->min_width = IMX219_NATIVE_WIDTH;
> > > +		fse->max_width = IMX219_NATIVE_WIDTH;
> > > +		fse->min_height = IMX219_NATIVE_HEIGHT;
> > > +		fse->max_height = IMX219_NATIVE_HEIGHT;
> > > +	} else {
> > > +		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
> > > +		    fse->index >= ARRAY_SIZE(supported_modes))
> > > +			return -EINVAL;
> > >
> > > -	fse->min_width = supported_modes[fse->index].width;
> > > -	fse->max_width = fse->min_width;
> > > -	fse->min_height = supported_modes[fse->index].height;
> > > -	fse->max_height = fse->min_height;
> > > +		fse->min_width = supported_modes[fse->index].width;
> > > +		fse->max_width = fse->min_width;
> > > +		fse->min_height = supported_modes[fse->index].height;
> > > +		fse->max_height = fse->min_height;
> > > +	}
> > >
> > >  	return 0;
> > >  }
> > > @@ -801,9 +829,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  	struct imx219 *imx219 = to_imx219(sd);
> > >  	const struct imx219_mode *mode;
> > >  	struct v4l2_mbus_framefmt *format;
> > > +	struct v4l2_rect *compose;
> > >  	struct v4l2_rect *crop;
> > >  	unsigned int bin_h, bin_v;
> > >
> > > +	/*
> > > +	 * The driver is mode-based, the format can be set on the source pad
> > > +	 * only.
> > > +	 */
> > > +	if (fmt->pad != IMX219_PAD_SOURCE)
> > > +		return v4l2_subdev_get_fmt(sd, state, fmt);
> > > +
> > >  	/*
> > >  	 * Adjust the requested format to match the closest mode. The Bayer
> > >  	 * order varies with flips.
> > > @@ -822,22 +858,51 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >  	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > >  	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> > >
> > > -	format = v4l2_subdev_state_get_format(state, 0);
> > > +	/* Propagate the format through the sensor. */
> > > +
> > > +	/* The image pad models the pixel array, and thus has a fixed size. */
> > > +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_IMAGE);
> > >  	*format = fmt->format;
> >
> > Is this assignment needed ?
> >
> > Isn't 'fmt' meant to be applied at pad #0 ? Also, you overwrite the
> > code and size below, do the rest of the 'struct v4l2_mbus_framefmt'
> > fields apply to pad #1 (field, colorspace, quantization etc ? If pad
> > #1 represents the pixel array, I don't think they do).

It's a shortcut to avoid setting field, colorspace, ycbcr_enc,
quantization and xfer_func manually, as there's set a few lines above in
fmt. I can set the fields manually if you prefer.

> > Also, can't the pad #1 format be initialized by .init_state() and never
> > touched again ?

They could, but then .init_state() couldn't be implemented by simply
calling imx219_set_pad_format(). I think it is clearer to store all the
format setting logic in one place, especially when adding support for
the embedded data stream.

> > > +	format->code = IMX219_NATIVE_FORMAT;
> > > +	format->width = IMX219_NATIVE_WIDTH;
> > > +	format->height = IMX219_NATIVE_HEIGHT;
> > >
> > >  	/*
> > >  	 * Use binning to maximize the crop rectangle size, and centre it in the
> > >  	 * sensor.
> > >  	 */
> > > -	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
> > > -	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> > > +	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / fmt->format.width, 2U);
> > > +	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2U);
> > >
> > > -	crop = v4l2_subdev_state_get_crop(state, 0);
> > > -	crop->width = format->width * bin_h;
> > > -	crop->height = format->height * bin_v;
> > > +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
> > > +	crop->width = fmt->format.width * bin_h;
> > > +	crop->height = fmt->format.height * bin_v;
> > >  	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> > >  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> > This is no different than before, but I now wonder if VGA is actually
> > obtained by cropping down to 1280x960 and then by a 2x2 binning, or is
> > there a 4x4 binning mode. I presume this is correct though, as this has been
> > validated by many people.

It would be worth experimenting with the /4 binning mode.

> > > +	/*
> > > +	 * The compose rectangle models binning, its size is the sensor output
> > > +	 * size.
> > > +	 */
> > > +	compose = v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
> > > +	compose->left = 0;
> > > +	compose->top = 0;
> > > +	compose->width = fmt->format.width;
> > > +	compose->height = fmt->format.height;
> > > +
> > > +	/*
> > > +	 * No mode use digital crop, the source pad crop rectangle size and
> > > +	 * format are thus identical to the image pad compose rectangle.
> > > +	 */
> > > +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
> > > +	crop->left = 0;
> > > +	crop->top = 0;
> > > +	crop->width = fmt->format.width;
> > > +	crop->height = fmt->format.height;
> > > +
> > > +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> > > +	*format = fmt->format;
> > > +
> > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > >  		int exposure_max;
> > >  		int exposure_def;
> > > @@ -874,13 +939,13 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> > >  				struct v4l2_subdev_state *state,
> > >  				struct v4l2_subdev_selection *sel)
> > >  {
> > > -	switch (sel->target) {
> > > -	case V4L2_SEL_TGT_CROP: {
> > > -		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> > > -		return 0;
> > > -	}
> > > +	struct v4l2_rect *compose;
> > >
> > > +	switch (sel->target) {
> > >  	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +		if (sel->pad != IMX219_PAD_IMAGE)
> > > +			return -EINVAL;
> > > +
> > >  		sel->r.top = 0;
> > >  		sel->r.left = 0;
> > >  		sel->r.width = IMX219_NATIVE_WIDTH;
> > > @@ -890,11 +955,35 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> > >
> > >  	case V4L2_SEL_TGT_CROP_DEFAULT:
> > >  	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > -		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > > -		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > > -		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > > -		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > > +		switch (sel->pad) {
> > > +		case IMX219_PAD_IMAGE:
> > > +			sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > > +			sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > > +			sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > > +			sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> > > +			return 0;
> > >
> > > +		case IMX219_PAD_SOURCE:
> > > +			compose = v4l2_subdev_state_get_compose(state,
> > > +								IMX219_PAD_IMAGE);
> > > +			sel->r.top = 0;
> > > +			sel->r.left = 0;
> > > +			sel->r.width = compose->width;
> > > +			sel->r.height = compose->height;
> > > +			return 0;
> > > +		}
> > > +
> > > +		break;
> > > +
> > > +	case V4L2_SEL_TGT_CROP:
> > > +		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_COMPOSE:
> > > +		if (sel->pad != IMX219_PAD_IMAGE)
> > > +			return -EINVAL;
> > > +
> > > +		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
> > >  		return 0;
> >
> > Do we need to support TGT_COMPOSE_BOUNDS for PAD_IMAGE ? I would have
> > suggested V4L2_SEL_TGT_COMPOSE_DEFAULT too, but according to the spec
> > it does not apply to subdevices.

Good question. V4L2_SEL_TGT_COMPOSE_BOUNDS is a bit under-documented for
V4L2 subdevs. I wonder if it wouldn't be simpler for drivers to not
implement it when the compose bounds are identical to the crop rectangle
size, as that could be considered a default ?

> > >  	}
> > >
> > > @@ -906,7 +995,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
> > >  {
> > >  	struct v4l2_subdev_format fmt = {
> > >  		.which = V4L2_SUBDEV_FORMAT_TRY,
> > > -		.pad = 0,
> > > +		.pad = IMX219_PAD_SOURCE,
> > >  		.format = {
> > >  			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> > >  			.width = supported_modes[0].width,
> >
> > Why not intialize pad#1 format here an never touch it again ? Should
> > also the pad#1 crop and compose rectangles and pad#0 crop be
> > initialized here ?

As written above, I think it's cleaner to have all the format-related
constraints in one place, especially with support for embedded data. It
may be a style preference, I'm not sure.

> > > @@ -1174,10 +1263,18 @@ static int imx219_probe(struct i2c_client *client)
> > >  			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > >  	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > >
> > > -	/* Initialize source pad */
> > > -	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +	/*
> > > +	 * Initialize the pads. To preserve backward compatibility with
> > > +	 * userspace that used the sensor before the introduction of the
> > > +	 * internal image pad, the external source pad is numbered 0 and the
> > > +	 * internal image pad numbered 1.
> > > +	 */
> > > +	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> > > +	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
> > > +					     | MEDIA_PAD_FL_INTERNAL;
> > >
> > > -	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> > > +	ret = media_entity_pads_init(&imx219->sd.entity,
> > > +				     ARRAY_SIZE(imx219->pads), imx219->pads);
> > >  	if (ret) {
> > >  		dev_err(dev, "failed to init entity pads: %d\n", ret);
> > >  		goto error_handler_free;

-- 
Regards,

Laurent Pinchart

