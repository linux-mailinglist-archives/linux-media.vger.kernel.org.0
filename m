Return-Path: <linux-media+bounces-7928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609A88DB8F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 11:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F932B21F65
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 10:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051D7524A0;
	Wed, 27 Mar 2024 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kHLIlVro"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034A3DABF0
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711536680; cv=none; b=dmcWu7pfpakv1B76foO+1jf4LvkRr/VRQoVotTWlfHf1MRWSMo4SiBWJ8EPUjDr5sW5LkpN1jOw6nh3VDVa4qM8K3rbA0UhU8ALYIBNYVBRu+8NkUqqAPuzTeAVuySAPSF00N8ri7FdfTS/bKyG8C36ZE5PfG6WP8y/rcRkvIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711536680; c=relaxed/simple;
	bh=xAag3ZvNeFwbKwTc6bgi092thLt2vcvsMLibhwnk+V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBWitB2yh/wsxb14HA+0QowK1aXh73bC9TZtKmIecYvzbLz7OUConm5BRlx3KZFPTfnjZLSBYQucGZDScOP0FFxtPy4ZDSA7Hafv67Efwv/Tu6gm50Ej67h5uPUcqdOn9E8+IAomM10ZTsJOKAkDeqlVXMhQMgC4I+4aGlVTjlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kHLIlVro; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FC1F675;
	Wed, 27 Mar 2024 11:50:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711536643;
	bh=xAag3ZvNeFwbKwTc6bgi092thLt2vcvsMLibhwnk+V0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kHLIlVroCilCkcjsCyFSa8MnvooCVlK8g+dcILioC3wL95H9Ww/L7iHj/UnVzfxh5
	 6maHJJQahAVjxY5uvKn5TKhEqQ3GyrTJYDSh2xQ1X2COO3KhheF/J/GCp2vIbIx0KT
	 6jGl8nGnylbeLYOSdt01KRY15eQ0t1x4ZZ0XjFoY=
Message-ID: <f44c64ad-78b0-41a5-be12-27835f3babfa@ideasonboard.com>
Date: Wed, 27 Mar 2024 12:51:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/15] media: i2c: imx219: Add embedded data support
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Naushir Patuck <naush@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-6-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240324220854.15010-6-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/2024 00:08, Laurent Pinchart wrote:
> The IMX219 generates embedded data unconditionally. Report it as an
> additional stream, with a new internal embedded data pad, and update
> subdev operations accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v6:
> 
> - Get format from IMX219_STREAM_IMAGE in imx219_set_ctrl()
> - Fix mbus code for second stream in imx219_get_frame_desc()
> - Set V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag on route
> ---
>   drivers/media/i2c/imx219.c | 188 +++++++++++++++++++++++++++++++------
>   1 file changed, 160 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index fa64bc402c9a..86a0ebf6d65f 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -149,6 +149,9 @@
>   #define IMX219_PIXEL_ARRAY_WIDTH	3280U
>   #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
>   
> +/* Embedded metadata stream height */
> +#define IMX219_EMBEDDED_DATA_HEIGHT	2U
> +
>   /* Mode : resolution and related config&values */
>   struct imx219_mode {
>   	/* Frame width */
> @@ -317,9 +320,15 @@ static const struct imx219_mode supported_modes[] = {
>   enum imx219_pad_ids {
>   	IMX219_PAD_SOURCE,
>   	IMX219_PAD_IMAGE,
> +	IMX219_PAD_EDATA,
>   	IMX219_NUM_PADS,
>   };
>   
> +enum imx219_stream_ids {
> +	IMX219_STREAM_IMAGE,
> +	IMX219_STREAM_EDATA,
> +};
> +
>   struct imx219 {
>   	struct v4l2_subdev sd;
>   	struct media_pad pads[IMX219_NUM_PADS];
> @@ -382,7 +391,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>   	int ret = 0;
>   
>   	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> -	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					      IMX219_STREAM_IMAGE);

As mentioned in the previous mail, all these lines could be in a 
separate patch, they are not related to embedded data support.

>   	if (ctrl->id == V4L2_CID_VBLANK) {
>   		int exposure_max, exposure_def;
> @@ -610,6 +620,25 @@ static unsigned int imx219_format_bpp(u32 code)
>   	}
>   }
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

You could also switch based on imx219_format_bpp().

>   static int imx219_set_framefmt(struct imx219 *imx219,
>   			       struct v4l2_subdev_state *state)
>   {
> @@ -619,7 +648,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>   	u64 bin_h, bin_v;
>   	int ret = 0;
>   
> -	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					      IMX219_STREAM_IMAGE);
>   	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
>   	bpp = imx219_format_bpp(format->code);
>   
> @@ -774,17 +804,33 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>   {
>   	struct imx219 *imx219 = to_imx219(sd);
>   
> -	if (code->pad == IMX219_PAD_IMAGE) {
> +	switch (code->pad) {
> +	case IMX219_PAD_IMAGE:
>   		/* The internal image pad is hardwired to the native format. */
> -		if (code->index)
> +		if (code->index > 0)

Was there something wrong with if (code->index)? I don't mind the 
change, but it's not related to adding embedded data support. Also, you 
added the line in patch 2, so you could change it already in there.

Normally it wouldn't matter that much, but I think it makes sense trying 
to make the imx219 patches as clean as possible, as they'll be used for 
reference.

>   			return -EINVAL;
>   
>   		code->code = IMX219_NATIVE_FORMAT;
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
> +	}
> +
> +	/*
> +	 * On the source pad, the sensor supports multiple image raw formats
> +	 * with different bit depths. The embedded data format bit depth
> +	 * follows the image stream.
> +	 */
> +	if (code->stream == IMX219_STREAM_IMAGE) {
>   		u32 format;

It seems we get these constructs quite often:

	switch (pad) {
	case IMX219_PAD_IMAGE:
		return;
	case IMX219_PAD_EDATA:
		return;
	case IMX219_PAD_SOURCE:
	default:
		break;
	}

	if (stream == IMX219_STREAM_IMAGE) {
	} else {
	}

I wonder would it be better to make a macro that combines the pad and 
stream numbers, and then one could do:

	switch (padstream) {
		case IMX219_PADSTREAM_IMAGE:
		case IMX219_PADSTREAM_EDATA:
		case IMX219_PADSTREAM_SOURCE_IMAGE:
		case IMX219_PADSTREAM_SOURCE_EDATA:
	}

  Tomi

>   
>   		if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> @@ -792,6 +838,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>   
>   		format = imx219_mbus_formats[code->index * 4];
>   		code->code = imx219_get_format_code(imx219, format);
> +	} else {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +						   IMX219_STREAM_EDATA);
> +		code->code = fmt->code;
>   	}
>   
>   	return 0;
> @@ -803,7 +858,8 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>   {
>   	struct imx219 *imx219 = to_imx219(sd);
>   
> -	if (fse->pad == IMX219_PAD_IMAGE) {
> +	switch (fse->pad) {
> +	case IMX219_PAD_IMAGE:
>   		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
>   			return -EINVAL;
>   
> @@ -811,7 +867,24 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>   		fse->max_width = IMX219_NATIVE_WIDTH;
>   		fse->min_height = IMX219_NATIVE_HEIGHT;
>   		fse->max_height = IMX219_NATIVE_HEIGHT;
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
>   		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
>   		    fse->index >= ARRAY_SIZE(supported_modes))
>   			return -EINVAL;
> @@ -820,6 +893,21 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>   		fse->max_width = fse->min_width;
>   		fse->min_height = supported_modes[fse->index].height;
>   		fse->max_height = fse->min_height;
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
>   	}
>   
>   	return 0;
> @@ -831,6 +919,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   {
>   	struct imx219 *imx219 = to_imx219(sd);
>   	const struct imx219_mode *mode;
> +	struct v4l2_mbus_framefmt *ed_format;
>   	struct v4l2_mbus_framefmt *format;
>   	struct v4l2_rect *compose;
>   	struct v4l2_rect *crop;
> @@ -838,9 +927,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   
>   	/*
>   	 * The driver is mode-based, the format can be set on the source pad
> -	 * only.
> +	 * only, and only for the image streeam.
>   	 */
> -	if (fmt->pad != IMX219_PAD_SOURCE)
> +	if (fmt->pad != IMX219_PAD_SOURCE || fmt->stream != IMX219_STREAM_IMAGE)
>   		return v4l2_subdev_get_fmt(sd, state, fmt);
>   
>   	/*
> @@ -897,15 +986,31 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   	 * No mode use digital crop, the source pad crop rectangle size and
>   	 * format are thus identical to the image pad compose rectangle.
>   	 */
> -	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
> +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE,
> +					  IMX219_STREAM_IMAGE);
>   	crop->left = 0;
>   	crop->top = 0;
>   	crop->width = fmt->format.width;
>   	crop->height = fmt->format.height;
>   
> -	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					      IMX219_STREAM_IMAGE);
>   	*format = fmt->format;
>   
> +	/*
> +	 * Finally, update the formats on the sink and source sides of the
> +	 * embedded data stream.
> +	 */
> +	ed_format = v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
> +	ed_format->code = imx219_format_edata(format->code);
> +	ed_format->width = format->width;
> +	ed_format->height = IMX219_EMBEDDED_DATA_HEIGHT;
> +	ed_format->field = V4L2_FIELD_NONE;
> +
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					      IMX219_STREAM_EDATA);
> +	*format = *ed_format;
> +
>   	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>   		int exposure_max;
>   		int exposure_def;
> @@ -944,6 +1049,13 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>   {
>   	struct v4l2_rect *compose;
>   
> +	/*
> +	 * The embedded data stream doesn't support selection rectangles,
> +	 * neither on the embedded data pad nor on the source pad.
> +	 */
> +	if (sel->pad == IMX219_PAD_EDATA || sel->stream != 0)
> +		return -EINVAL;
> +
>   	switch (sel->target) {
>   	case V4L2_SEL_TGT_NATIVE_SIZE:
>   		if (sel->pad != IMX219_PAD_IMAGE)
> @@ -996,12 +1108,19 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>   static int imx219_init_state(struct v4l2_subdev *sd,
>   			     struct v4l2_subdev_state *state)
>   {
> -	struct v4l2_subdev_route routes[1] = {
> +	struct v4l2_subdev_route routes[2] = {
>   		{
>   			.sink_pad = IMX219_PAD_IMAGE,
>   			.sink_stream = 0,
>   			.source_pad = IMX219_PAD_SOURCE,
> -			.source_stream = 0,
> +			.source_stream = IMX219_STREAM_IMAGE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
> +		}, {
> +			.sink_pad = IMX219_PAD_EDATA,
> +			.sink_stream = 0,
> +			.source_pad = IMX219_PAD_SOURCE,
> +			.source_stream = IMX219_STREAM_EDATA,
>   			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
>   				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>   		},
> @@ -1014,7 +1133,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>   	struct v4l2_subdev_format fmt = {
>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>   		.pad = IMX219_PAD_SOURCE,
> -		.stream = 0,
> +		.stream = IMX219_STREAM_IMAGE,
>   		.format = {
>   			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>   			.width = supported_modes[0].width,
> @@ -1027,6 +1146,10 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>   	if (ret)
>   		return ret;
>   
> +	/*
> +	 * Set the image stream format on the source pad. This will be
> +	 * propagated to all formats and selection rectangles internally.
> +	 */
>   	imx219_set_pad_format(sd, state, &fmt);
>   
>   	return 0;
> @@ -1035,29 +1158,36 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>   static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   				 struct v4l2_mbus_frame_desc *fd)
>   {
> -	const struct v4l2_mbus_framefmt *fmt;
>   	struct v4l2_subdev_state *state;
> -	u32 code;
> +	u32 img_code;
> +	u32 ed_code;
>   
>   	if (pad != IMX219_PAD_SOURCE)
>   		return -EINVAL;
>   
>   	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE, 0);
> -	code = fmt->code;
> +	img_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +						IMX219_STREAM_IMAGE)->code;
> +	ed_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> +					       IMX219_STREAM_EDATA)->code;
>   	v4l2_subdev_unlock_state(state);
>   
>   	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> -	fd->num_entries = 1;
> +	fd->num_entries = 2;
>   
>   	memset(fd->entry, 0, sizeof(fd->entry));
>   
> -	fd->entry[0].pixelcode = code;
> -	fd->entry[0].stream = 0;
> +	fd->entry[0].pixelcode = img_code;
> +	fd->entry[0].stream = IMX219_STREAM_IMAGE;
>   	fd->entry[0].bus.csi2.vc = 0;
> -	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8
> +	fd->entry[0].bus.csi2.dt = imx219_format_bpp(img_code) == 8
>   				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
>   
> +	fd->entry[1].pixelcode = ed_code;
> +	fd->entry[1].stream = IMX219_STREAM_EDATA;
> +	fd->entry[1].bus.csi2.vc = 0;
> +	fd->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
> +
>   	return 0;
>   }
>   
> @@ -1321,12 +1451,14 @@ static int imx219_probe(struct i2c_client *client)
>   	/*
>   	 * Initialize the pads. To preserve backward compatibility with
>   	 * userspace that used the sensor before the introduction of the
> -	 * internal image pad, the external source pad is numbered 0 and the
> -	 * internal image pad numbered 1.
> +	 * internal pads, the external source pad is numbered 0 and the internal
> +	 * image and embedded data pads numbered 1 and 2 respectively.
>   	 */
>   	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>   	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
>   					     | MEDIA_PAD_FL_INTERNAL;
> +	imx219->pads[IMX219_PAD_EDATA].flags = MEDIA_PAD_FL_SINK
> +					     | MEDIA_PAD_FL_INTERNAL;
>   
>   	ret = media_entity_pads_init(&imx219->sd.entity,
>   				     ARRAY_SIZE(imx219->pads), imx219->pads);


