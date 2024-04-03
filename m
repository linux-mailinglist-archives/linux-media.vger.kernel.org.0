Return-Path: <linux-media+bounces-8527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09E896FD4
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 609CF1C26E9A
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B54147C6C;
	Wed,  3 Apr 2024 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="z94YHzoU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935B61EEF9
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712149536; cv=none; b=fV4ZOhEs9WD22NyKKjCIJAcDbK/2lXKEmgWEDtRXnDEwMF3wVD+lLJcZUaDTQqhP5vnpV/ZD0apaCIz/WhuqHZ8SxHuLrOhYyJ/kf8KPfYGlugzN9+OXHQCVFADtSH71kGNsCY/F6l6DRyI6G4/gxOuyNoM7LF5/8G/xXcCt7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712149536; c=relaxed/simple;
	bh=yJFfk8iKMdWI1JZlWLFW1SUyq2DjiFK2WrYXGgsrvhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cw3CPUrkDtl1c5J6x4U/yOu/aAvd56fr9qt2zRnlcZxiPzlSxbKWc6BhPwqLc783MdVPGlokRCyPXsQGmW4s+lMq5wA4QpxqWRU87GKDe0X5hOs23N4q6U688JHKffiBot3K/r5ZZxPsAAEOY5DL+kGiEgcA66s+/espN6G2UxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=z94YHzoU; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433AMQxL019566;
	Wed, 3 Apr 2024 14:26:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=AM1e38nSHiOMckC9tX0EhPMShfKIZQAQAMMPzCocEFc=; b=z9
	4YHzoU8sy/Dns7VA5+OGXZIsh6XEYmmo9ROqhrV0/1tl8Os94w6RosPlFO36UZ/3
	XlPb6V8Sj5QzC23BB8zTQ7BdUeds8yzJ6L/Et4258jmr2erSJ0a/8W8pjNQD5pcp
	gWN0iEldkZRRPQLpUgarvyR/fDN86jfOWUzQ8t5C9NDlJfNrI8Boh1DYclCMDAUh
	2HCzpKznHoA9VwUKdkKWMF7h9EiBMcTbasLbbUO48lxGsyA0ncIVAVJLfoTuuy9B
	fXpLEeaVpFOcfVF0VMGXmI39AkgWh+8Co1PuXmvHjMrmYwZsNiYjLdu0f/NcfA9Z
	Dhm/BvRj6LTNYdrgTIpQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x6w65714b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 14:26:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E112E40044;
	Wed,  3 Apr 2024 14:26:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEA64218633;
	Wed,  3 Apr 2024 14:26:29 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 3 Apr
 2024 14:26:29 +0200
Message-ID: <b6cda7fa-c62c-45ed-9c1f-b2acfae1e249@foss.st.com>
Date: Wed, 3 Apr 2024 14:26:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: st-vgxy61: Add support for embedded data
To: Julien Massot <julien.massot@collabora.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <sylvain.petinot@foss.st.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
 <20240315085158.1213159-3-julien.massot@collabora.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240315085158.1213159-3-julien.massot@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_10,2024-04-03_01,2023-05-22_02

Hi Julien,

On 3/15/24 09:51, Julien Massot wrote:
> Add support for embedded data. This introduces two internal pads for pixel
> and embedded data streams. The sensor can send ISL data at the begginning

Typo 'beginning'.

> of each frame.
> 
> The ISL data contains information related to the current frame such as:
> ROI, cropping and orientation, gains, thermal sensors values,
> frame counter..
> 
> The Intelligent Status Line follows the CCS embedded data format definition
> regarding the tagged data but not for the registers address, therefore the
> format code is MEDIA_BUS_FMT_META_8 and not MEDIA_BUS_FMT_CCS_EMBEDDED.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/i2c/st-vgxy61.c | 172 +++++++++++++++++++++++++++++++---
>  1 file changed, 160 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
> index 733713f909cf..e8302456a8d9 100644
> --- a/drivers/media/i2c/st-vgxy61.c
> +++ b/drivers/media/i2c/st-vgxy61.c
> @@ -88,11 +88,16 @@
>  #define VGXY61_REG_PATGEN_SHORT_DATA_B			CCI_REG16_LE(0x0954)
>  #define VGXY61_REG_PATGEN_SHORT_DATA_GB			CCI_REG16_LE(0x0956)
>  #define VGXY61_REG_BYPASS_CTRL				CCI_REG8(0x0a60)
> +#define VGXY61_ISL_BYPASS				BIT(3)
> +#define VGXY61_ASIL_BYPASS				BIT(2)
>  
>  #define VGX661_WIDTH					1464
>  #define VGX661_HEIGHT					1104
>  #define VGX761_WIDTH					1944
>  #define VGX761_HEIGHT					1204
> +/* two status lines (ISL), of 256 bytes each */
> +#define VGXY61_META_WIDTH				256
> +#define VGXY61_META_HEIGHT				2
>  #define VGX661_DEFAULT_MODE				1
>  #define VGX761_DEFAULT_MODE				1
>  #define VGX661_SHORT_ROT_TERM				93
> @@ -112,6 +117,18 @@
>  #define VGXY61_FWPATCH_REVISION_MINOR			0
>  #define VGXY61_FWPATCH_REVISION_MICRO			5
>  
> +enum {
> +	VGXY61_PAD_SOURCE,
> +	VGXY61_PAD_PIXEL,
> +	VGXY61_PAD_META,
> +	VGXY61_NUM_PADS,
> +};
> +
> +enum {
> +	VGXY61_STREAM_PIXEL,
> +	VGXY61_STREAM_META,
> +};
> +
>  static const u8 patch_array[] = {
>  	0xbf, 0x00, 0x05, 0x20, 0x06, 0x01, 0xe0, 0xe0, 0x04, 0x80, 0xe6, 0x45,
>  	0xed, 0x6f, 0xfe, 0xff, 0x14, 0x80, 0x1f, 0x84, 0x10, 0x42, 0x05, 0x7c,
> @@ -382,7 +399,7 @@ struct vgxy61_dev {
>  	struct i2c_client *i2c_client;
>  	struct regmap *regmap;
>  	struct v4l2_subdev sd;
> -	struct media_pad pad;
> +	struct media_pad pads[VGXY61_NUM_PADS];
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(vgxy61_supply_name)];
>  	struct gpio_desc *reset_gpio;
>  	struct clk *xclk;
> @@ -655,6 +672,13 @@ static int vgxy61_get_selection(struct v4l2_subdev *sd,
>  {
>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>  
> +	/*
> +	 * The embedded data stream doesn't support selection rectangles,
> +	 * neither on the embedded data pad nor on the source pad.
> +	 */
> +	if (sel->pad == VGXY61_PAD_META)
> +		return -EINVAL;
> +
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP:
>  		sel->r = sensor->current_mode->crop;
> @@ -676,6 +700,16 @@ static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
>  {
> +	if (code->pad == VGXY61_PAD_META ||
> +	    (code->pad == VGXY61_PAD_SOURCE &&
> +	     code->stream == VGXY61_STREAM_META)) {
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		code->code = MEDIA_BUS_FMT_META_8;
> +		return 0;
> +	}
> +
>  	if (code->index >= ARRAY_SIZE(vgxy61_supported_codes))
>  		return -EINVAL;
>  
> @@ -703,6 +737,19 @@ static int vgxy61_enum_frame_size(struct v4l2_subdev *sd,
>  {
>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>  
> +	if (fse->pad == VGXY61_PAD_META ||
> +	    (fse->pad == VGXY61_PAD_SOURCE &&
> +	     fse->stream == VGXY61_STREAM_META)) {
> +		if (fse->index > 0)
> +			return -EINVAL;
> +
> +		fse->min_width = VGXY61_META_WIDTH;
> +		fse->max_width = VGXY61_META_WIDTH;
> +		fse->min_height = VGXY61_META_HEIGHT;
> +		fse->max_height = VGXY61_META_HEIGHT;
> +		return 0;
> +	}
> +
>  	if (fse->index >= sensor->sensor_modes_nb)
>  		return -EINVAL;
>  
> @@ -1159,24 +1206,54 @@ static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> -static int vgxy61_set_fmt(struct v4l2_subdev *sd,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *format)
> +static int __vgxy61_set_fmt(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *sd_state,
> +			    struct v4l2_mbus_framefmt *format,
> +			    enum v4l2_subdev_format_whence which,
> +			    unsigned int pad, unsigned int stream)
>  {
>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> +	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
> +		*meta_fmt;
>  	const struct vgxy61_mode_info *new_mode;
>  	int ret;
>  
>  	if (sensor->streaming)
>  		return -EBUSY;
>  
> -	ret = vgxy61_try_fmt_internal(sd, &format->format, &new_mode);
> +	/*
> +	 * Allow setting format on internal pixel pad as well as the source
> +	 * pad's pixel stream (for compatibility).
> +	 */
> +	if ((pad == VGXY61_PAD_SOURCE && stream == VGXY61_STREAM_META) ||
> +	    pad == VGXY61_PAD_META) {
> +		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
> +		return 0;
> +	}
> +
> +	pix_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_PIXEL, 0);
> +	meta_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_META, 0);
> +	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_SOURCE,
> +						   VGXY61_STREAM_PIXEL);
> +	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_SOURCE,
> +						    VGXY61_STREAM_META);
> +
> +	ret = vgxy61_try_fmt_internal(sd, format, &new_mode);
>  	if (ret)
>  		return ret;
>  
> -	*v4l2_subdev_state_get_format(sd_state, format->pad) = format->format;
> +	pix_fmt->width = format->width;
> +	pix_fmt->height = format->height;
> +	pix_fmt->code = format->code;
> +	pix_fmt->field = V4L2_FIELD_NONE;
> +
> +	*format = *src_pix_fmt = *pix_fmt;
> +	meta_fmt->code = MEDIA_BUS_FMT_META_8;
> +	meta_fmt->width = VGXY61_META_WIDTH;
> +	meta_fmt->height = VGXY61_META_HEIGHT;
> +	*src_meta_fmt = *meta_fmt;
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
>  		return 0;
>  
>  	sensor->current_mode = new_mode;
> @@ -1202,16 +1279,78 @@ static int vgxy61_set_fmt(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int vgxy61_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	return __vgxy61_set_fmt(sd, sd_state, &fmt->format, fmt->which,
> +				fmt->pad, fmt->stream);
> +}
> +
> +static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct v4l2_subdev_state *sd_state;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	desc->num_entries = 2;
> +
> +	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_SOURCE,
> +					   VGXY61_STREAM_PIXEL);
> +	v4l2_subdev_unlock_state(sd_state);
> +
> +	desc->entry[0].stream = VGXY61_STREAM_PIXEL;
> +	desc->entry[0].pixelcode = fmt->code;
> +	desc->entry[0].bus.csi2.dt = get_data_type_by_code(fmt->code);
> +
> +	desc->entry[1].stream = VGXY61_STREAM_META;
> +	desc->entry[1].pixelcode = MEDIA_BUS_FMT_META_8;
> +	desc->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
> +
> +	return 0;
> +}
> +
>  static int vgxy61_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>  	struct v4l2_subdev_format fmt = { 0 };
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = VGXY61_PAD_PIXEL,
> +			.source_pad = VGXY61_PAD_SOURCE,
> +			.source_stream = VGXY61_STREAM_PIXEL,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
> +		}, {
> +			.sink_pad = VGXY61_PAD_META,
> +			.source_pad = VGXY61_PAD_SOURCE,
> +			.source_stream = VGXY61_STREAM_META,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.routes = routes,
> +		.num_routes = ARRAY_SIZE(routes),
> +	};
> +	struct v4l2_subdev_state *active_state;
> +	int ret;
> +
> +	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
> +	if (ret)
> +		return ret;
> +
> +	active_state = v4l2_subdev_get_locked_active_state(sd);
>  
>  	vgxy61_fill_framefmt(sensor, sensor->current_mode, &fmt.format,
>  			     VGXY61_MEDIA_BUS_FMT_DEF);
>  
> -	return vgxy61_set_fmt(sd, sd_state, &fmt);
> +	return __vgxy61_set_fmt(sd, sd_state, &fmt.format,
> +				active_state == sd_state ?
> +				V4L2_SUBDEV_FORMAT_ACTIVE :
> +				V4L2_SUBDEV_FORMAT_TRY, VGXY61_PAD_PIXEL, 0);
>  }
>  
>  static int vgxy61_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -1364,6 +1503,7 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
>  	.enum_mbus_code = vgxy61_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = vgxy61_set_fmt,
> +	.get_frame_desc = vgxy61_get_frame_desc,
>  	.get_selection = vgxy61_get_selection,
>  	.enum_frame_size = vgxy61_enum_frame_size,
>  };
> @@ -1478,7 +1618,8 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
>  	cci_write(sensor->regmap, VGXY61_REG_CLK_SYS_PLL_MULT, mult, &ret);
>  	cci_write(sensor->regmap, VGXY61_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
>  	cci_write(sensor->regmap, VGXY61_REG_FRAME_CONTENT_CTRL, 0, &ret);
> -	cci_write(sensor->regmap, VGXY61_REG_BYPASS_CTRL, 4, &ret);
> +	cci_write(sensor->regmap, VGXY61_REG_BYPASS_CTRL, VGXY61_ASIL_BYPASS,
> +		  &ret);
>  	if (ret)
>  		return ret;
>  	vgxy61_update_gpios_strobe_polarity(sensor, sensor->gpios_polarity);
> @@ -1743,8 +1884,14 @@ static int vgxy61_probe(struct i2c_client *client)
>  	v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops);
>  	sensor->sd.internal_ops = &vgxy61_internal_ops;
>  	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> -			    V4L2_SUBDEV_FL_HAS_EVENTS;
> -	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +			    V4L2_SUBDEV_FL_HAS_EVENTS |
> +			    V4L2_SUBDEV_FL_STREAMS;
> +	sensor->pads[VGXY61_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	sensor->pads[VGXY61_PAD_PIXEL].flags =
> +		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
> +	sensor->pads[VGXY61_PAD_META].flags =
> +		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
> +
>  	sensor->sd.entity.ops = &vgxy61_subdev_entity_ops;
>  	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
> @@ -1778,7 +1925,8 @@ static int vgxy61_probe(struct i2c_client *client)
>  		goto error_power_off;
>  	}
>  
> -	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	ret = media_entity_pads_init(&sensor->sd.entity,
> +				     ARRAY_SIZE(sensor->pads), sensor->pads);
>  	if (ret) {
>  		dev_err(&client->dev, "pads init failed %d\n", ret);
>  		goto error_handler_free;

-- 
Regards,

Benjamin

