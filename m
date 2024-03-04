Return-Path: <linux-media+bounces-6344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CA86FDEC
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 10:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72ED01F2183A
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 09:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E3520DF4;
	Mon,  4 Mar 2024 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KuPGILw0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48D224CF
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545646; cv=none; b=IWHpbk8rYjO2GoUWFZaPFPnn4pnKeqzANX2ASU43Ccdx/85ZiVFUUyKgoxfn0Cn3HmsB7+Sibl6voeWXFoxT+P6HODKlscSaYDxTJ7XX5AkHr7GfURGu6Zo9BG8H69nynROOL4IH4Qp3ZVLeT24xK+kS2l8L2q4WzugLI/N90Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545646; c=relaxed/simple;
	bh=+zM5adYvOJSS+Vjm/az8+nAWnkg6X0Y//zr4R4dD5po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jL6QsFFPmvifaHodI3kerAfODCFVpE3QVxvAMXlypoO7aKtRcB7lEXfUDmmujji3H08W0yhY8nOyeJMmqrimQW4phG8rzIz2xHxOuxdV6hNhl4VC44+hdomTyqWlyedSw++QQC9/TAkjKzowkB52lQ+PZjMzaCTg3BxbQNJ2Pzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KuPGILw0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58E7C3997;
	Mon,  4 Mar 2024 10:47:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709545625;
	bh=+zM5adYvOJSS+Vjm/az8+nAWnkg6X0Y//zr4R4dD5po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuPGILw0E6sfSZ+ylAAXtKG8ICrNBMnkL3uqIjnJEsf9YxDYiWYv8SKkomN9hNvwA
	 VDfRKpMg7ZpmfMYOiQndYC7DZ8O2J9ExO/4ojNafStqzCvftMzIr0hkbx9VuaDX7ap
	 I0tQg5J7aR6UM0bE1GR1L9XishzNxb+rbVQtm+Z0=
Date: Mon, 4 Mar 2024 10:47:19 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Naushir Patuck <naush@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v6 05/15] media: i2c: imx219: Add embedded data support
Message-ID: <cqnc7d7vtvhm6f3suk5avkiwxe3eujqn57mlfqfkdtafqhobm4@s4xcmpd5xk7s>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-6-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301213231.10340-6-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Fri, Mar 01, 2024 at 11:32:20PM +0200, Laurent Pinchart wrote:
> The IMX219 generates embedded data unconditionally. Report it as an
> additional stream, with a new internal embedded data pad, and update
> subdev operations accordingly.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 173 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 151 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6e0232b6772b..cfbf4c304a9a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -149,6 +149,9 @@
>  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
>  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
>
> +/* Embedded metadata stream height */
> +#define IMX219_EMBEDDED_DATA_HEIGHT	2U
> +
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {
>  	/* Frame width */
> @@ -317,9 +320,15 @@ static const struct imx219_mode supported_modes[] = {
>  enum imx219_pad_ids {
>  	IMX219_PAD_SOURCE,
>  	IMX219_PAD_IMAGE,
> +	IMX219_PAD_EDATA,
>  	IMX219_NUM_PADS,
>  };
>
> +enum imx219_stream_ids {
> +	IMX219_STREAM_IMAGE,
> +	IMX219_STREAM_EDATA,
> +};
> +
>  struct imx219 {
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[IMX219_NUM_PADS];
> @@ -613,6 +622,25 @@ static int imx219_format_bpp(u32 code)
>  	}
>  }
>
> +/* Return the embedded data format corresponding to an image format. */
> +static u32 imx219_format_edata(u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		return MEDIA_BUS_FMT_META_8;
> +
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	default:
> +		return MEDIA_BUS_FMT_META_10;
> +	}
> +}
> +
>  static int imx219_set_framefmt(struct imx219 *imx219,
>  			       struct v4l2_subdev_state *state)
>  {
> @@ -622,7 +650,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>  	u64 bin_h, bin_v;
>  	int ret = 0;
>
> -	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					      IMX219_STREAM_IMAGE);
>  	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
>  	bpp = imx219_format_bpp(format->code);
>
> @@ -777,17 +806,33 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  {
>  	struct imx219 *imx219 = to_imx219(sd);
>
> -	if (code->pad == IMX219_PAD_IMAGE) {
> +	switch (code->pad) {
> +	case IMX219_PAD_IMAGE:
>  		/* The internal image pad is hardwired to the native format. */
> -		if (code->index)
> +		if (code->index > 0)
>  			return -EINVAL;
>
>  		code->code = IMX219_NATIVE_FORMAT;
> -	} else {
> -		/*
> -		 * On the source pad, the sensor supports multiple raw formats
> -		 * with different bit depths.
> -		 */
> +		return 0;
> +
> +	case IMX219_PAD_EDATA:
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		code->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
> +		return 0;
> +
> +	case IMX219_PAD_SOURCE:
> +	default:
> +		break;

Do you need these ?

> +	}
> +
> +	/*
> +	 * On the source pad, the sensor supports multiple image raw formats
> +	 * with different bit depths. The embedded data format bit depth
> +	 * follows the image stream.
> +	 */
> +	if (code->stream == IMX219_STREAM_IMAGE) {
>  		u32 format;
>
>  		if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> @@ -795,6 +840,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>
>  		format = imx219_mbus_formats[code->index * 4];
>  		code->code = imx219_get_format_code(imx219, format);
> +	} else {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +						   IMX219_STREAM_EDATA);
> +		code->code = fmt->code;
>  	}
>
>  	return 0;
> @@ -806,7 +860,8 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  {
>  	struct imx219 *imx219 = to_imx219(sd);
>
> -	if (fse->pad == IMX219_PAD_IMAGE) {
> +	switch (fse->pad) {
> +	case IMX219_PAD_IMAGE:
>  		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
>  			return -EINVAL;
>
> @@ -814,7 +869,24 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  		fse->max_width = IMX219_NATIVE_WIDTH;
>  		fse->min_height = IMX219_NATIVE_HEIGHT;
>  		fse->max_height = IMX219_NATIVE_HEIGHT;
> -	} else {
> +		return 0;
> +
> +	case IMX219_PAD_EDATA:
> +		if (fse->code != MEDIA_BUS_FMT_CCS_EMBEDDED || fse->index > 0)
> +			return -EINVAL;
> +
> +		fse->min_width = IMX219_NATIVE_WIDTH;
> +		fse->max_width = IMX219_NATIVE_WIDTH;
> +		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
> +		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
> +		return 0;
> +
> +	case IMX219_PAD_SOURCE:
> +	default:
> +		break;
> +	}
> +
> +	if (fse->stream == IMX219_STREAM_IMAGE) {
>  		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
>  		    fse->index >= ARRAY_SIZE(supported_modes))
>  			return -EINVAL;
> @@ -823,6 +895,21 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  		fse->max_width = fse->min_width;
>  		fse->min_height = supported_modes[fse->index].height;
>  		fse->max_height = fse->min_height;
> +	} else {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +						   IMX219_STREAM_EDATA);
> +		if (fse->code != fmt->code)
> +			return -EINVAL;
> +
> +		if (fse->index)
> +			return -EINVAL;
> +
> +		fse->min_width = fmt->width;
> +		fse->max_width = fmt->width;
> +		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
> +		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
>  	}
>
>  	return 0;
> @@ -834,6 +921,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  {
>  	struct imx219 *imx219 = to_imx219(sd);
>  	const struct imx219_mode *mode;
> +	struct v4l2_mbus_framefmt *ed_format;
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *compose;
>  	struct v4l2_rect *crop;
> @@ -841,9 +929,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>
>  	/*
>  	 * The driver is mode-based, the format can be set on the source pad
> -	 * only.
> +	 * only, and only for the image streeam.
>  	 */
> -	if (fmt->pad != IMX219_PAD_SOURCE)
> +	if (fmt->pad != IMX219_PAD_SOURCE || fmt->stream != IMX219_STREAM_IMAGE)
>  		return v4l2_subdev_get_fmt(sd, state, fmt);
>
>  	/*
> @@ -900,15 +988,31 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	 * No mode use digital crop, the source pad crop rectangle size and
>  	 * format are thus identical to the image pad compose rectangle.
>  	 */
> -	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
> +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE,
> +					  IMX219_STREAM_IMAGE);
>  	crop->left = 0;
>  	crop->top = 0;
>  	crop->width = fmt->format.width;
>  	crop->height = fmt->format.height;
>
> -	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					      IMX219_STREAM_IMAGE);
>  	*format = fmt->format;
>
> +	/*
> +	 * Finally, update the formats on the sink and source sides of the
> +	 * embedded data stream.
> +	 */
> +	ed_format = v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
> +	ed_format->code = imx219_format_edata(format->code);

One could consider making imx219_format_edata() retrieve the
[PAD_SOURCE/STREAM_IMAGE] format internally instead of passing it from
outside, to avoid passing in a from format

> +	ed_format->width = format->width;
> +	ed_format->height = IMX219_EMBEDDED_DATA_HEIGHT;
> +	ed_format->field = V4L2_FIELD_NONE;
> +
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					      IMX219_STREAM_EDATA);
> +	*format = *ed_format;

Or
        *v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
                                      IMX219_STREAM_EDATA) = *ed_format;

To avoid re-assigning 'format' which now points to the [0/0] format
and might be reused later to update controls ?

> +
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		int exposure_max;
>  		int exposure_def;
> @@ -947,6 +1051,13 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>  {
>  	struct v4l2_rect *compose;
>
> +	/*
> +	 * The embedded data stream doesn't support selection rectangles,
> +	 * neither on the embedded data pad nor on the source pad.
> +	 */
> +	if (sel->pad == IMX219_PAD_EDATA || sel->stream != 0)
> +		return -EINVAL;
> +
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_NATIVE_SIZE:
>  		if (sel->pad != IMX219_PAD_IMAGE)
> @@ -999,12 +1110,18 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>  static int imx219_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *state)
>  {
> -	struct v4l2_subdev_route routes[1] = {
> +	struct v4l2_subdev_route routes[2] = {
>  		{
>  			.sink_pad = IMX219_PAD_IMAGE,
>  			.sink_stream = 0,
>  			.source_pad = IMX219_PAD_SOURCE,
> -			.source_stream = 0,
> +			.source_stream = IMX219_STREAM_IMAGE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		}, {
> +			.sink_pad = IMX219_PAD_EDATA,
> +			.sink_stream = 0,
> +			.source_pad = IMX219_PAD_SOURCE,
> +			.source_stream = IMX219_STREAM_EDATA,
>  			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>  		},
>  	};
> @@ -1016,7 +1133,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>  	struct v4l2_subdev_format fmt = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  		.pad = IMX219_PAD_SOURCE,
> -		.stream = 0,
> +		.stream = IMX219_STREAM_IMAGE,
>  		.format = {
>  			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>  			.width = supported_modes[0].width,
> @@ -1029,6 +1146,10 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>
> +	/*
> +	 * Set the image stream format on the source pad. This will be
> +	 * propagated to all formats and selection rectangles internally.
> +	 */
>  	imx219_set_pad_format(sd, state, &fmt);
>
>  	return 0;
> @@ -1045,21 +1166,27 @@ static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  		return -EINVAL;
>
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	fmt = v4l2_subdev_state_get_stream_format(state, IMX219_PAD_SOURCE, 0);
> +	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					   IMX219_STREAM_IMAGE);
>  	code = fmt->code;
>  	v4l2_subdev_unlock_state(state);
>
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> -	fd->num_entries = 1;
> +	fd->num_entries = 2;
>
>  	memset(fd->entry, 0, sizeof(fd->entry));
>
>  	fd->entry[0].pixelcode = code;
> -	fd->entry[0].stream = 0;
> +	fd->entry[0].stream = IMX219_STREAM_IMAGE;
>  	fd->entry[0].bus.csi2.vc = 0;
>  	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8
>  				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
>
> +	fd->entry[1].pixelcode = code;

Is the mbus_code on this second entry the same as the first one ?

> +	fd->entry[1].stream = IMX219_STREAM_EDATA;
> +	fd->entry[1].bus.csi2.vc = 0;
> +	fd->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
> +
>  	return 0;
>  }
>
> @@ -1323,12 +1450,14 @@ static int imx219_probe(struct i2c_client *client)
>  	/*
>  	 * Initialize the pads. To preserve backward compatibility with
>  	 * userspace that used the sensor before the introduction of the
> -	 * internal image pad, the external source pad is numbered 0 and the
> -	 * internal image pad numbered 1.
> +	 * internal pads, the external source pad is numbered 0 and the internal
> +	 * image and embedded data pads numbered 1 and 2 respectively.
>  	 */
>  	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>  	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
>  					     | MEDIA_PAD_FL_INTERNAL;
> +	imx219->pads[IMX219_PAD_EDATA].flags = MEDIA_PAD_FL_SINK
> +					     | MEDIA_PAD_FL_INTERNAL;
>
>  	ret = media_entity_pads_init(&imx219->sd.entity,
>  				     ARRAY_SIZE(imx219->pads), imx219->pads);
> --
> Regards,
>
> Laurent Pinchart
>
>

