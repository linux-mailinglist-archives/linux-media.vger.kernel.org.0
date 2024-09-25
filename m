Return-Path: <linux-media+bounces-18559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EA69864B7
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 18:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4CFE1F23136
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 16:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB524643B;
	Wed, 25 Sep 2024 16:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WFUW6Kji"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBE1D5ABD;
	Wed, 25 Sep 2024 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281320; cv=none; b=Gi6y+/mFLDraD0TBcd6QhE6V0jo/WMxplS3sRljtdrRLnwi2VPP9LYW65cnVK7sMol3HpRAUqPh0OhsM08pnpeEGXmmRqWwMV4GvKiSkP0rh5vorYu3/AWSzIeTgL3TpVIRwPTuYqT+w7U9XYVNMYYTQLzSK4hV3aXAaqg3bGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281320; c=relaxed/simple;
	bh=fld8b16rWy92YSgtCiIICRR04WLpU51ov1gdx7F/8Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PODwFRt+3B3+ZO2Qoa45/F0t6/zdg3hBrQnixfoC29alRDT6RmeC1K8DtMNK65CAvvv3Lpu2P/yF5gUBd+IYjcs73ysICwt57TNBPCRSefnpWim/Uzbrfl0PIh8GMjZqv89kLsCsmBw6ZKL+IjGQ4MsIJuA/wFxR4RFVh6fiMzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WFUW6Kji; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 874DD7E2;
	Wed, 25 Sep 2024 18:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727281227;
	bh=fld8b16rWy92YSgtCiIICRR04WLpU51ov1gdx7F/8Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFUW6KjitnAXLSu1qJjsdM4DxHToP61T6HOc6dKM/Bq1fq6y9xcaKwPoPRTFKPBKZ
	 bcLVUFA2K3mX2dwnfj4H2DObKm8/2OZFdz0v5JLfSykiVo2fQQdz84cpRuHYn8oTBv
	 xOvDUbAkZrpQM1JUrcaOGF/AQ3fl76MpHagFN5hY=
Date: Wed, 25 Sep 2024 19:21:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 09/11] media: i2c: ov5645: Add internal image sink pad
Message-ID: <20240925162153.GA27666@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-10-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:06:08PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Use the newly added internal pad API to expose the internal
> configuration of the sensor to userspace in a standard manner.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 107 +++++++++++++++++++++++++++----------
>  1 file changed, 79 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index dc93514608ee..255c6395a268 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -60,6 +60,10 @@
>  #define OV5645_SDE_SAT_U		0x5583
>  #define OV5645_SDE_SAT_V		0x5584
>  
> +#define OV5645_NATIVE_FORMAT	MEDIA_BUS_FMT_SBGGR8_1X8
> +#define OV5645_NATIVE_WIDTH	2592
> +#define OV5645_NATIVE_HEIGHT	1944
> +
>  /* regulator supplies */
>  static const char * const ov5645_supply_name[] = {
>  	"vdddo", /* Digital I/O (1.8V) supply */
> @@ -69,6 +73,12 @@ static const char * const ov5645_supply_name[] = {
>  
>  #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
>  
> +enum ov5645_pad_ids {
> +	OV5645_PAD_SOURCE,
> +	OV5645_PAD_IMAGE,
> +	OV5645_NUM_PADS,
> +};
> +
>  struct reg_value {
>  	u16 reg;
>  	u8 val;
> @@ -87,7 +97,7 @@ struct ov5645 {
>  	struct i2c_client *i2c_client;
>  	struct device *dev;
>  	struct v4l2_subdev sd;
> -	struct media_pad pad;
> +	struct media_pad pads[OV5645_NUM_PADS];
>  	struct v4l2_fwnode_endpoint ep;
>  	struct v4l2_rect crop;
>  	struct clk *xclk;
> @@ -826,7 +836,10 @@ static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index > 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
> +	if (code->pad == OV5645_PAD_IMAGE)
> +		code->code = OV5645_NATIVE_FORMAT;
> +	else
> +		code->code = MEDIA_BUS_FMT_UYVY8_1X16;
>  
>  	return 0;
>  }
> @@ -835,16 +848,24 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
> -		return -EINVAL;
> -
> -	if (fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
> -		return -EINVAL;
> -
> -	fse->min_width = ov5645_mode_info_data[fse->index].width;
> -	fse->max_width = ov5645_mode_info_data[fse->index].width;
> -	fse->min_height = ov5645_mode_info_data[fse->index].height;
> -	fse->max_height = ov5645_mode_info_data[fse->index].height;
> +	if (fse->pad == OV5645_PAD_IMAGE) {
> +		if (fse->code != OV5645_NATIVE_FORMAT || fse->index > 0)
> +			return -EINVAL;
> +
> +		fse->min_width = OV5645_NATIVE_WIDTH;
> +		fse->max_width = OV5645_NATIVE_WIDTH;
> +		fse->min_height = OV5645_NATIVE_HEIGHT;
> +		fse->max_height = OV5645_NATIVE_HEIGHT;
> +	} else {
> +		if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16 ||

This will be interesting. With internal pads we will introduce the
concept of a "subdev model", which will formally document how the V4L2
subdev configuration items (formats, selection rectangles, ...) maps to
hardware features. Sakari is working on the definition of a subdev model
for raw sensors, that should catter for the needs of raw sensors without
a bayer scaler (the vast majority of them). To use internal pads with a
non-raw sensor, we'll have to define a model. It may be more
challenging/complicated to do so, as the YUV sensor features are less
standardized, but it will be an interesting development.

> +		    fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
> +			return -EINVAL;
> +
> +		fse->min_width = ov5645_mode_info_data[fse->index].width;
> +		fse->max_width = ov5645_mode_info_data[fse->index].width;
> +		fse->min_height = ov5645_mode_info_data[fse->index].height;
> +		fse->max_height = ov5645_mode_info_data[fse->index].height;
> +	}
>  
>  	return 0;
>  }
> @@ -855,18 +876,55 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
>  {
>  	struct ov5645 *ov5645 = to_ov5645(sd);
>  	struct v4l2_mbus_framefmt *__format;
> +	struct v4l2_rect *compose;
>  	struct v4l2_rect *__crop;

While at it, could you rename __crop to crop ?

>  	const struct ov5645_mode_info *new_mode;
>  	int ret;
>  
> -	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
> +	if (format->pad != OV5645_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, format);
> +
>  	new_mode = v4l2_find_nearest_size(ov5645_mode_info_data,
>  					  ARRAY_SIZE(ov5645_mode_info_data),
>  					  width, height, format->format.width,
>  					  format->format.height);
> -
> -	__crop->width = new_mode->width;
> -	__crop->height = new_mode->height;
> +	format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
> +	format->format.width = new_mode->width;
> +	format->format.height = new_mode->height;
> +	format->format.field = V4L2_FIELD_NONE;
> +	format->format.colorspace = V4L2_COLORSPACE_SRGB;
> +	format->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	format->format.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	format->format.xfer_func = V4L2_XFER_FUNC_DEFAULT;

Drivers are not supposed to return DEFAULT values, you should pick
appropriate values.

> +
> +	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_IMAGE);

Maybe __format could also become fmt.

> +	*__format = format->format;
> +	__format->code = OV5645_NATIVE_FORMAT;
> +	__format->width = OV5645_NATIVE_WIDTH;
> +	__format->height = OV5645_NATIVE_HEIGHT;
> +
> +	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_IMAGE);
> +	__crop->width = format->format.width;
> +	__crop->height = format->format.height;
> +
> +	/*
> +	 * The compose rectangle models binning, its size is the sensor output
> +	 * size.
> +	 */
> +	compose = v4l2_subdev_state_get_compose(sd_state, OV5645_PAD_IMAGE);
> +	compose->left = 0;
> +	compose->top = 0;
> +	compose->width = format->format.width;
> +	compose->height = format->format.height;
> +
> +	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_SOURCE);
> +	__crop->left = 0;
> +	__crop->top = 0;
> +	__crop->width = format->format.width;
> +	__crop->height = format->format.height;
> +
> +	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_SOURCE);
> +	*__format = format->format;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		ret = __v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
> @@ -882,14 +940,6 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
>  		ov5645->current_mode = new_mode;
>  	}
>  
> -	__format = v4l2_subdev_state_get_format(sd_state, 0);
> -	__format->width = __crop->width;
> -	__format->height = __crop->height;
> -	__format->code = MEDIA_BUS_FMT_UYVY8_1X16;
> -	__format->field = V4L2_FIELD_NONE;
> -	__format->colorspace = V4L2_COLORSPACE_SRGB;
> -
> -	format->format = *__format;
>  
>  	return 0;
>  }
> @@ -899,7 +949,7 @@ static int ov5645_init_state(struct v4l2_subdev *subdev,
>  {
>  	struct v4l2_subdev_format fmt = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
> -		.pad = 0,
> +		.pad = OV5645_PAD_SOURCE,
>  		.format = {
>  			.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  			.width = ov5645_mode_info_data[1].width,
> @@ -919,7 +969,7 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
> -	sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
> +	sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);

Now there's a compose rectangle, you should support getting it.

>  	return 0;
>  }
>  
> @@ -1123,11 +1173,12 @@ static int ov5645_probe(struct i2c_client *client)
>  	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
>  	ov5645->sd.internal_ops = &ov5645_internal_ops;
>  	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> -	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ov5645->pads[OV5645_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	ov5645->pads[OV5645_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
>  	ov5645->sd.dev = dev;
>  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
> -	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
> +	ret = media_entity_pads_init(&ov5645->sd.entity, ARRAY_SIZE(ov5645->pads), ov5645->pads);

Line wrap.

>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "could not register media entity\n");
>  		goto free_ctrl;

-- 
Regards,

Laurent Pinchart

