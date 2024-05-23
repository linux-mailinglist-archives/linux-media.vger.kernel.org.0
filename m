Return-Path: <linux-media+bounces-11825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E28CD4FF
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 15:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E2A21F23A6B
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78BA14A62D;
	Thu, 23 May 2024 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sHRdmUQa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976714A4D9;
	Thu, 23 May 2024 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716471856; cv=none; b=hnElabN/gxfVXD9YiVOHuy55BoPhcD175/+U4uq64HDIZ4uFN9LdRyev3R13aM794fpm2USb7bYZQfJuqy/GjHpjWWBkJBHfk0O0lHsqsIrjwpBykh7wuhYKAwqFXfBe61BgrlCBCMeI6ADYdVVFi7krGvquEPWKx+y3ri3HqOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716471856; c=relaxed/simple;
	bh=+iTmD4KmlsOon4xvNgR0mTlpZEKmT9QAKSvOFvN6ZkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He0Dtcbc4d28jW3tobE0DtOp35SUtBTwaBNJhbhhV+Lep9UdIoaKN4HHSrz09dmHW3sUHE/mQ4/mkHICA1CvdZK7wdIG78PmISWvb5jQZBjBp86o5ozpbl8K3O+EBGFgFIge4Av5A0qdU8go0Kjcf/TQOb4cre78G37hks2M9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sHRdmUQa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8138475;
	Thu, 23 May 2024 15:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716471837;
	bh=+iTmD4KmlsOon4xvNgR0mTlpZEKmT9QAKSvOFvN6ZkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sHRdmUQaZhnvh71nqUJbhcvbb8EgPO+pXHsmZmPKAu5vTYcyvRQ0XeOz7uq2uBvuq
	 MFf+iN06ljLOBhVWqN7MZu4SkbnBFD6p67UrCLN8xsmETIB+NBq1cldE1yZUpXT4Gu
	 XJB/th2zAQue524co4NhQQxv/Hmz09a1oYxGtE0c=
Message-ID: <20996978-aace-4d59-92b8-39041da2ebd3@ideasonboard.com>
Date: Thu, 23 May 2024 14:44:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari - thanks for the review. Snipping some bits for which I have no comment...

On 23/05/2024 09:03, Sakari Ailus wrote:

<snip>
>> +
>> +static unsigned int mali_c55_calculate_bank_num(struct mali_c55 *mali_c55,
>> +						unsigned int crop,
>> +						unsigned int scale)
>> +{
>> +	unsigned int tmp;
>> +	unsigned int i;
>> +
>> +	tmp = (scale * 1000) / crop;
> This looks like something that can overflow. Can it?


Shouldn't be able to; maximum scale width is 8192.

>
>> +
>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_coefficient_banks); i++) {
>> +		if (tmp >= mali_c55_coefficient_banks[i].bottom &&
>> +		    tmp <= mali_c55_coefficient_banks[i].top)
>> +			return mali_c55_coefficient_banks[i].bank;
>> +	}
>> +
>> +	/*
>> +	 * We shouldn't ever get here, in theory. As we have no good choices
>> +	 * simply warn the user and use the first bank of coefficients.
>> +	 */
>> +	dev_warn(mali_c55->dev, "scaling factor outside defined bounds\n");
>> +	return 0;
>> +}
>> +
>> +#endif /* _MALI_C55_RESIZER_COEFS_H */
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>> new file mode 100644
>> index 000000000000..8e0669a5f391
>> --- /dev/null
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
>> @@ -0,0 +1,740 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ARM Mali-C55 ISP Driver - Image signal processor
>> + *
>> + * Copyright (C) 2024 Ideas on Board Oy
>> + */
>> +
>> +#include <linux/math.h>
>> +#include <linux/minmax.h>
>> +
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#include "mali-c55-common.h"
>> +#include "mali-c55-registers.h"
>> +#include "mali-c55-resizer-coefs.h"
>> +
>> +/* Scaling factor in Q4.20 format. */
>> +#define MALI_C55_RZR_SCALER_FACTOR	1048576
> (1U << 20)
>
> ?
>
>> +
>> +static const u32 rzr_non_bypass_src_fmts[] = {
>> +	MEDIA_BUS_FMT_RGB121212_1X36,
>> +	MEDIA_BUS_FMT_YUV10_1X30
>> +};
>> +
>> +static const char * const mali_c55_resizer_names[] = {
>> +	[MALI_C55_RZR_FR] = "resizer fr",
>> +	[MALI_C55_RZR_DS] = "resizer ds",
>> +};
>> +
>> +static int mali_c55_rzr_program_crop(struct mali_c55_resizer *rzr,
>> +				     struct v4l2_subdev_state *state)
>> +{
>> +	unsigned int reg_offset = rzr->cap_dev->reg_offset;
>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	struct v4l2_rect *crop;
>> +
>> +	/* Verify if crop should be enabled. */
>> +	fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SINK_PAD, 0);
>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD, 0);
>> +
>> +	if (fmt->width == crop->width && fmt->height == crop->height)
>> +		return MALI_C55_BYPASS_CROP;
>> +
>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_X_START(reg_offset),
>> +		       crop->left);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_Y_START(reg_offset),
>> +		       crop->top);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_X_SIZE(reg_offset),
>> +		       crop->width);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_Y_SIZE(reg_offset),
>> +		       crop->height);
>> +
>> +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_EN(reg_offset),
>> +		       MALI_C55_CROP_ENABLE);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_rzr_program_resizer(struct mali_c55_resizer *rzr,
>> +					struct v4l2_subdev_state *state)
>> +{
>> +	unsigned int reg_offset = rzr->cap_dev->reg_offset;
>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>> +	struct v4l2_rect *crop, *scale;
>> +	unsigned int h_bank, v_bank;
>> +	u64 h_scale, v_scale;
>> +
>> +	/* Verify if scaling should be enabled. */
>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD, 0);
>> +	scale = v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD, 0);
>> +
>> +	if (crop->width == scale->width && crop->height == scale->height)
>> +		return MALI_C55_BYPASS_SCALER;
>> +
>> +	/* Program the V/H scaling factor in Q4.20 format. */
>> +	h_scale = crop->width * MALI_C55_RZR_SCALER_FACTOR;
>> +	v_scale = crop->height * MALI_C55_RZR_SCALER_FACTOR;
>> +
>> +	do_div(h_scale, scale->width);
>> +	do_div(v_scale, scale->height);
>> +
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_IN_WIDTH(reg_offset),
>> +		       crop->width);
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_IN_HEIGHT(reg_offset),
>> +		       crop->height);
>> +
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_OUT_WIDTH(reg_offset),
>> +		       scale->width);
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_OUT_HEIGHT(reg_offset),
>> +		       scale->height);
>> +
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_HFILT_TINC(reg_offset),
>> +		       h_scale);
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_VFILT_TINC(reg_offset),
>> +		       v_scale);
>> +
>> +	h_bank = mali_c55_calculate_bank_num(mali_c55, crop->width,
>> +					     scale->width);
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_HFILT_COEF(reg_offset),
>> +		       h_bank);
>> +
>> +	v_bank = mali_c55_calculate_bank_num(mali_c55, crop->height,
>> +					     scale->height);
>> +	mali_c55_write(mali_c55,
>> +		       MALI_C55_REG_SCALER_VFILT_COEF(reg_offset),
>> +		       v_bank);
>> +
>> +	return 0;
>> +}
>> +
>> +static void mali_c55_rzr_program(struct mali_c55_resizer *rzr,
>> +				 struct v4l2_subdev_state *state)
>> +{
>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>> +	u32 bypass = 0;
>> +
>> +	/* Verify if cropping and scaling should be enabled. */
>> +	bypass |= mali_c55_rzr_program_crop(rzr, state);
>> +	bypass |= mali_c55_rzr_program_resizer(rzr, state);
>> +
>> +	mali_c55_update_bits(mali_c55, rzr->id == MALI_C55_RZR_FR ?
>> +			     MALI_C55_REG_FR_BYPASS : MALI_C55_REG_DS_BYPASS,
>> +			     MALI_C55_BYPASS_CROP | MALI_C55_BYPASS_SCALER,
>> +			     bypass);
>> +}
>> +
>> +/*
>> + * Inspect the routing table to know which of the two (mutually exclusive)
>> + * routes is enabled and return the sink pad id of the active route.
>> + */
>> +static unsigned int mali_c55_rzr_get_active_sink(struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_subdev_krouting *routing = &state->routing;
>> +	struct v4l2_subdev_route *route;
>> +
>> +	/* A single route is enabled at a time. */
>> +	for_each_active_route(routing, route)
>> +		return route->sink_pad;
>> +
>> +	return MALI_C55_RZR_SINK_PAD;
>> +}
>> +
>> +static int __mali_c55_rzr_set_routing(struct v4l2_subdev *sd,
>> +				      struct v4l2_subdev_state *state,
>> +				      struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>> +						    sd);
>> +	unsigned int active_sink = UINT_MAX;
>> +	struct v4l2_rect *crop, *compose;
>> +	struct v4l2_subdev_route *route;
>> +	unsigned int active_routes = 0;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>> +
>> +	ret = v4l2_subdev_routing_validate(sd, routing, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Only a single route can be enabled at a time. */
>> +	for_each_active_route(routing, route) {
>> +		if (++active_routes > 1) {
>> +			dev_err(rzr->mali_c55->dev,
>> +				"Only one route can be active");
>> +			return -EINVAL;
>> +		}
>> +
>> +		active_sink = route->sink_pad;
>> +	}
>> +	if (active_sink == UINT_MAX) {
>> +		dev_err(rzr->mali_c55->dev, "One route has to be active");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_subdev_set_routing(sd, state, routing);
>> +	if (ret) {
>> +		dev_err(rzr->mali_c55->dev, "Failed to set routing\n");
>> +		return ret;
>> +	}
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, active_sink, 0);
>> +	crop = v4l2_subdev_state_get_crop(state, active_sink, 0);
>> +	compose = v4l2_subdev_state_get_compose(state, active_sink, 0);
>> +
>> +	fmt->width = MALI_C55_DEFAULT_WIDTH;
>> +	fmt->height = MALI_C55_DEFAULT_HEIGHT;
>> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> +	fmt->field = V4L2_FIELD_NONE;
>> +
>> +	if (active_sink == MALI_C55_RZR_SINK_PAD) {
>> +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>> +
>> +		crop->left = crop->top = 0;
>> +		crop->width = MALI_C55_DEFAULT_WIDTH;
>> +		crop->height = MALI_C55_DEFAULT_HEIGHT;
>> +
>> +		*compose = *crop;
>> +	} else {
>> +		fmt->code = MEDIA_BUS_FMT_SRGGB12_1X12;
>> +	}
>> +
>> +	/* Propagate the format to the source pad */
>> +	*v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD, 0) = *fmt;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_rzr_enum_mbus_code(struct v4l2_subdev *sd,
>> +				       struct v4l2_subdev_state *state,
>> +				       struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	struct v4l2_mbus_framefmt *sink_fmt;
>> +	const struct mali_c55_isp_fmt *fmt;
>> +	unsigned int index = 0;
>> +	u32 sink_pad;
>> +
>> +	switch (code->pad) {
>> +	case MALI_C55_RZR_SINK_PAD:
>> +		if (code->index)
>> +			return -EINVAL;
>> +
>> +		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
>> +
>> +		return 0;
>> +	case MALI_C55_RZR_SOURCE_PAD:
>> +		sink_pad = mali_c55_rzr_get_active_sink(state);
>> +		sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
>> +
>> +		/*
>> +		 * If the active route is from the Bypass sink pad, then the
>> +		 * source pad is a simple passthrough of the sink format.
>> +		 */
>> +
>> +		if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
>> +			if (code->index)
>> +				return -EINVAL;
>> +
>> +			code->code = sink_fmt->code;
>> +			return 0;
>> +		}
>> +
>> +		/*
>> +		 * If the active route is from the non-bypass sink then we can
>> +		 * select either RGB or conversion to YUV.
>> +		 */
>> +
>> +		if (code->index >= ARRAY_SIZE(rzr_non_bypass_src_fmts))
>> +			return -EINVAL;
>> +
>> +		code->code = rzr_non_bypass_src_fmts[code->index];
>> +
>> +		return 0;
>> +	case MALI_C55_RZR_SINK_BYPASS_PAD:
>> +		for_each_mali_isp_fmt(fmt) {
>> +			if (index++ == code->index) {
>> +				code->code = fmt->code;
>> +				return 0;
>> +			}
>> +		}
>> +
>> +		break;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int mali_c55_rzr_enum_frame_size(struct v4l2_subdev *sd,
>> +					struct v4l2_subdev_state *state,
>> +					struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	if (fse->index)
>> +		return -EINVAL;
>> +
>> +	fse->max_width = MALI_C55_MAX_WIDTH;
>> +	fse->max_height = MALI_C55_MAX_HEIGHT;
>> +	fse->min_width = MALI_C55_MIN_WIDTH;
>> +	fse->min_height = MALI_C55_MIN_HEIGHT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_rzr_set_sink_fmt(struct v4l2_subdev *sd,
>> +				     struct v4l2_subdev_state *state,
>> +				     struct v4l2_subdev_format *format)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>> +	struct v4l2_rect *rect;
>> +	unsigned int sink_pad;
>> +
>> +	/*
>> +	 * Clamp to min/max and then reset crop and compose rectangles to the
>> +	 * newly applied size.
>> +	 */
>> +	clamp_t(unsigned int, fmt->width,
>> +		MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
>> +	clamp_t(unsigned int, fmt->height,
>> +		MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
>> +
>> +	sink_pad = mali_c55_rzr_get_active_sink(state);
>> +	if (sink_pad == MALI_C55_RZR_SINK_PAD) {
>> +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>> +
>> +		rect = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD);
>> +		rect->left = 0;
>> +		rect->top = 0;
>> +		rect->width = fmt->width;
>> +		rect->height = fmt->height;
>> +
>> +		rect = v4l2_subdev_state_get_compose(state,
>> +						     MALI_C55_RZR_SINK_PAD);
>> +		rect->left = 0;
>> +		rect->top = 0;
>> +		rect->width = fmt->width;
>> +		rect->height = fmt->height;
>> +	} else {
>> +		/*
>> +		 * Make sure the media bus code is one of the supported
>> +		 * ISP input media bus codes.
>> +		 */
>> +		if (!mali_c55_isp_is_format_supported(fmt->code))
>> +			fmt->code = MALI_C55_DEFAULT_MEDIA_BUS_FMT;
>> +	}
>> +
>> +	*v4l2_subdev_state_get_format(state, sink_pad, 0) = *fmt;
>> +	*v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD, 0) = *fmt;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_rzr_set_source_fmt(struct v4l2_subdev *sd,
>> +				       struct v4l2_subdev_state *state,
>> +				       struct v4l2_subdev_format *format)
>> +{
>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>> +						    sd);
>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>> +	struct v4l2_mbus_framefmt *sink_fmt;
>> +	struct v4l2_rect *crop, *compose;
>> +	unsigned int sink_pad;
>> +	unsigned int i;
>> +
>> +	sink_pad = mali_c55_rzr_get_active_sink(state);
>> +	sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
>> +	crop = v4l2_subdev_state_get_crop(state, sink_pad, 0);
>> +	compose = v4l2_subdev_state_get_compose(state, sink_pad, 0);
>> +
>> +	/* FR Bypass pipe. */
>> +
>> +	if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
>> +		/*
>> +		 * Format on the source pad is the same as the one on the
>> +		 * sink pad.
>> +		 */
>> +		fmt->code = sink_fmt->code;
>> +
>> +		/* RAW bypass disables scaling and cropping. */
>> +		crop->top = compose->top = 0;
>> +		crop->left = compose->left = 0;
>> +		fmt->width = crop->width = compose->width = sink_fmt->width;
>> +		fmt->height = crop->height = compose->height = sink_fmt->height;
>> +
>> +		*v4l2_subdev_state_get_format(state,
>> +					      MALI_C55_RZR_SOURCE_PAD) = *fmt;
>> +
>> +		return 0;
>> +	}
>> +
>> +	/* Regular processing pipe. */
>> +
>> +	for (i = 0; i < ARRAY_SIZE(rzr_non_bypass_src_fmts); i++) {
>> +		if (fmt->code == rzr_non_bypass_src_fmts[i])
>> +			break;
>> +	}
>> +
>> +	if (i == ARRAY_SIZE(rzr_non_bypass_src_fmts)) {
>> +		dev_dbg(rzr->mali_c55->dev,
>> +			"Unsupported mbus code 0x%x: using default\n",
>> +			fmt->code);
>> +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
>> +	}
>> +
>> +	/*
>> +	 * The source pad format size comes directly from the sink pad
>> +	 * compose rectangle.
>> +	 */
>> +	fmt->width = compose->width;
>> +	fmt->height = compose->height;
>> +
>> +	*v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD) = *fmt;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_rzr_set_fmt(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state,
>> +				struct v4l2_subdev_format *format)
>> +{
>> +	/*
>> +	 * On sink pads fmt is either fixed for the 'regular' processing
>> +	 * pad or a RAW format or 20-bit wide RGB/YUV format for the FR bypass
>> +	 * pad.
>> +	 *
>> +	 * On source pad sizes are the result of crop+compose on the sink
>> +	 * pad sizes, while the format depends on the active route.
>> +	 */
>> +
>> +	if (format->pad != MALI_C55_RZR_SOURCE_PAD)
>> +		return mali_c55_rzr_set_sink_fmt(sd, state, format);
>> +
>> +	return mali_c55_rzr_set_source_fmt(sd, state, format);
>> +}
>> +
>> +static int mali_c55_rzr_get_selection(struct v4l2_subdev *sd,
>> +				      struct v4l2_subdev_state *state,
>> +				      struct v4l2_subdev_selection *sel)
>> +{
>> +	if (sel->pad != MALI_C55_RZR_SINK_PAD)
>> +		return -EINVAL;
>> +
>> +	if (sel->target != V4L2_SEL_TGT_CROP &&
>> +	    sel->target != V4L2_SEL_TGT_COMPOSE)
>> +		return -EINVAL;
>> +
>> +	sel->r = sel->target == V4L2_SEL_TGT_CROP
>> +	       ? *v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD)
>> +	       : *v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_rzr_set_selection(struct v4l2_subdev *sd,
>> +				      struct v4l2_subdev_state *state,
>> +				      struct v4l2_subdev_selection *sel)
>> +{
>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>> +						    sd);
>> +	struct v4l2_mbus_framefmt *source_fmt;
>> +	struct v4l2_mbus_framefmt *sink_fmt;
>> +	struct v4l2_rect *crop, *compose;
>> +
>> +	if (sel->pad != MALI_C55_RZR_SINK_PAD)
>> +		return -EINVAL;
>> +
>> +	if (sel->target != V4L2_SEL_TGT_CROP &&
>> +	    sel->target != V4L2_SEL_TGT_COMPOSE)
>> +		return -EINVAL;
>> +
>> +	source_fmt = v4l2_subdev_state_get_format(state,
>> +						  MALI_C55_RZR_SOURCE_PAD);
>> +	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SINK_PAD);
>> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD);
>> +	compose = v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD);
>> +
>> +	/* RAW bypass disables crop/scaling. */
>> +	if (mali_c55_format_is_raw(source_fmt->code)) {
>> +		crop->top = compose->top = 0;
>> +		crop->left = compose->left = 0;
>> +		crop->width = compose->width = sink_fmt->width;
>> +		crop->height = compose->height = sink_fmt->height;
>> +
>> +		sel->r = sel->target == V4L2_SEL_TGT_CROP ? *crop : *compose;
>> +
>> +		return 0;
>> +	}
>> +
>> +	/* During streaming, it is allowed to only change the crop rectangle. */
>> +	if (rzr->streaming && sel->target != V4L2_SEL_TGT_CROP)
>> +		return -EINVAL;
>> +
>> +	 /*
>> +	  * Update the desired target and then clamp the crop rectangle to the
>> +	  * sink format sizes and the compose size to the crop sizes.
>> +	  */
>> +	if (sel->target == V4L2_SEL_TGT_CROP)
>> +		*crop = sel->r;
>> +	else
>> +		*compose = sel->r;
>> +
>> +	clamp_t(unsigned int, crop->left, 0,  sink_fmt->width);
>> +	clamp_t(unsigned int, crop->top, 0,  sink_fmt->height);
>> +	clamp_t(unsigned int, crop->width, MALI_C55_MIN_WIDTH,
>> +		sink_fmt->width - crop->left);
>> +	clamp_t(unsigned int, crop->height, MALI_C55_MIN_HEIGHT,
>> +		sink_fmt->height - crop->top);
>> +
>> +	if (rzr->streaming) {
>> +		/*
>> +		 * Apply at runtime a crop rectangle on the resizer's sink only
>> +		 * if it doesn't require re-programming the scaler output sizes
>> +		 * as it would require changing the output buffer sizes as well.
>> +		 */
>> +		if (sel->r.width < compose->width ||
>> +		    sel->r.height < compose->height)
>> +			return -EINVAL;
>> +
>> +		*crop = sel->r;
>> +		mali_c55_rzr_program(rzr, state);
>> +
>> +		return 0;
>> +	}
>> +
>> +	compose->left = 0;
>> +	compose->top = 0;
>> +	clamp_t(unsigned int, compose->left, 0,  sink_fmt->width);
>> +	clamp_t(unsigned int, compose->top, 0,  sink_fmt->height);
>> +	clamp_t(unsigned int, compose->width, crop->width / 8, crop->width);
>> +	clamp_t(unsigned int, compose->height, crop->height / 8, crop->height);
>> +
>> +	sel->r = sel->target == V4L2_SEL_TGT_CROP ? *crop : *compose;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_rzr_set_routing(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    enum v4l2_subdev_format_whence which,
>> +				    struct v4l2_subdev_krouting *routing)
>> +{
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
>> +	    media_entity_is_streaming(&sd->entity))
>> +		return -EBUSY;
>> +
>> +	return __mali_c55_rzr_set_routing(sd, state, routing);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops mali_c55_resizer_pad_ops = {
>> +	.enum_mbus_code		= mali_c55_rzr_enum_mbus_code,
>> +	.enum_frame_size	= mali_c55_rzr_enum_frame_size,
>> +	.get_fmt		= v4l2_subdev_get_fmt,
>> +	.set_fmt		= mali_c55_rzr_set_fmt,
>> +	.get_selection		= mali_c55_rzr_get_selection,
>> +	.set_selection		= mali_c55_rzr_set_selection,
>> +	.set_routing		= mali_c55_rzr_set_routing,
>> +};
>> +
>> +void mali_c55_rzr_start_stream(struct mali_c55_resizer *rzr)
>> +{
>> +	struct mali_c55 *mali_c55 = rzr->mali_c55;
>> +	struct v4l2_subdev *sd = &rzr->sd;
>> +	struct v4l2_subdev_state *state;
>> +	unsigned int sink_pad;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	sink_pad = mali_c55_rzr_get_active_sink(state);
>> +	if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
>> +		/* Bypass FR pipe processing if the bypass route is active. */
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
>> +				     MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK,
>> +				     MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS);
>> +		goto unlock_state;
>> +	}
>> +
>> +	/* Disable bypass and use regular processing. */
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
>> +			     MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK, 0);
>> +	mali_c55_rzr_program(rzr, state);
>> +
>> +unlock_state:
>> +	rzr->streaming = true;
>> +	v4l2_subdev_unlock_state(state);
>> +}
>> +
>> +void mali_c55_rzr_stop_stream(struct mali_c55_resizer *rzr)
>> +{
>> +	struct v4l2_subdev *sd = &rzr->sd;
>> +	struct v4l2_subdev_state *state;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +	rzr->streaming = false;
>> +	v4l2_subdev_unlock_state(state);
>> +}
>> +
>> +static const struct v4l2_subdev_ops mali_c55_resizer_ops = {
>> +	.pad	= &mali_c55_resizer_pad_ops,
>> +};
>> +
>> +static int mali_c55_rzr_init_state(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state)
>> +{
>> +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
>> +						    sd);
>> +	struct v4l2_subdev_krouting routing = { };
>> +	struct v4l2_subdev_route *routes;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	routes = kcalloc(rzr->num_routes, sizeof(*routes), GFP_KERNEL);
>> +	if (!routes)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < rzr->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routes[i];
>> +
>> +		route->sink_pad = i
>> +				? MALI_C55_RZR_SINK_BYPASS_PAD
>> +				: MALI_C55_RZR_SINK_PAD;
>> +		route->source_pad = MALI_C55_RZR_SOURCE_PAD;
>> +		if (route->sink_pad != MALI_C55_RZR_SINK_BYPASS_PAD)
>> +			route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>> +	}
>> +
>> +	routing.num_routes = rzr->num_routes;
>> +	routing.routes = routes;
>> +
>> +	ret = __mali_c55_rzr_set_routing(sd, state, &routing);
>> +	kfree(routes);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_subdev_internal_ops mali_c55_resizer_internal_ops = {
>> +	.init_state = mali_c55_rzr_init_state,
>> +};
>> +
>> +static void mali_c55_resizer_program_coefficients(struct mali_c55 *mali_c55,
>> +						  unsigned int index)
>> +{
>> +	unsigned int scaler_filt_coefmem_addrs[][2] = {
> This should be const.
>
>> +		[MALI_C55_RZR_FR] = {
>> +			0x034A8, /* hfilt */
>> +			0x044A8  /* vfilt */
>> +		},
>> +		[MALI_C55_RZR_DS] = {
>> +			0x014A8, /* hfilt */
>> +			0x024A8  /* vfilt */
>> +		},
>> +	};
>> +	unsigned int haddr = scaler_filt_coefmem_addrs[index][0];
>> +	unsigned int vaddr = scaler_filt_coefmem_addrs[index][1];
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < MALI_C55_RESIZER_COEFS_NUM_BANKS; i++) {
>> +		for (j = 0; j < MALI_C55_RESIZER_COEFS_NUM_ENTRIES; j++) {
>> +			mali_c55_write(mali_c55, haddr,
>> +				mali_c55_scaler_h_filter_coefficients[i][j]);
>> +			mali_c55_write(mali_c55, vaddr,
>> +				mali_c55_scaler_v_filter_coefficients[i][j]);
>> +
>> +			haddr += 4;
>> +			vaddr += 4;
> sizeof(u32) ?
>
> Up to you.


I think I'll keep it if it's all the same to you

>
>> +		}
>> +	}
>> +}
>> +
>> +int mali_c55_register_resizers(struct mali_c55 *mali_c55)
>> +{
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	for (i = 0; i < MALI_C55_NUM_RZRS; ++i) {
>> +		struct mali_c55_resizer *rzr = &mali_c55->resizers[i];
>> +		struct v4l2_subdev *sd = &rzr->sd;
>> +		unsigned int num_pads = MALI_C55_RZR_NUM_PADS;
>> +
>> +		rzr->id = i;
>> +		rzr->streaming = false;
>> +
>> +		if (rzr->id == MALI_C55_RZR_FR)
>> +			rzr->cap_dev = &mali_c55->cap_devs[MALI_C55_CAP_DEV_FR];
>> +		else
>> +			rzr->cap_dev = &mali_c55->cap_devs[MALI_C55_CAP_DEV_DS];
>> +
>> +		mali_c55_resizer_program_coefficients(mali_c55, i);
>> +
>> +		v4l2_subdev_init(sd, &mali_c55_resizer_ops);
>> +		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE
>> +			  | V4L2_SUBDEV_FL_STREAMS;
> "|" should be aligned with beginning of the rvalue, i.e. "V" of
> V4L2_SUBDEV_FL_HAS_DEVNODE.
>
>> +		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
>> +		sd->owner = THIS_MODULE;
>> +		sd->internal_ops = &mali_c55_resizer_internal_ops;
>> +		snprintf(sd->name, ARRAY_SIZE(sd->name), "%s %s",
>> +			 MALI_C55_DRIVER_NAME, mali_c55_resizer_names[i]);
>> +
>> +		rzr->pads[MALI_C55_RZR_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
>> +		rzr->pads[MALI_C55_RZR_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
>> +
>> +		/* Only the FR pipe has a bypass pad. */
>> +		if (rzr->id == MALI_C55_RZR_FR) {
>> +			rzr->pads[MALI_C55_RZR_SINK_BYPASS_PAD].flags =
>> +							MEDIA_PAD_FL_SINK;
>> +			rzr->num_routes = 2;
>> +		} else {
>> +			num_pads -= 1;
>> +			rzr->num_routes = 1;
>> +		}
>> +
>> +		ret = media_entity_pads_init(&sd->entity, num_pads, rzr->pads);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = v4l2_subdev_init_finalize(sd);
>> +		if (ret)
>> +			goto err_cleanup;
>> +
>> +		ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
>> +		if (ret)
>> +			goto err_cleanup;
>> +
>> +		rzr->mali_c55 = mali_c55;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_cleanup:
>> +	for (; i >= 0; --i) {
>> +		struct mali_c55_resizer *rzr = &mali_c55->resizers[i];
>> +		struct v4l2_subdev *sd = &rzr->sd;
>> +
>> +		v4l2_subdev_cleanup(sd);
>> +		media_entity_cleanup(&sd->entity);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +void mali_c55_unregister_resizers(struct mali_c55 *mali_c55)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < MALI_C55_NUM_RZRS; i++) {
>> +		struct mali_c55_resizer *resizer = &mali_c55->resizers[i];
>> +
>> +		if (!resizer->mali_c55)
>> +			continue;
>> +
>> +		v4l2_device_unregister_subdev(&resizer->sd);
>> +		v4l2_subdev_cleanup(&resizer->sd);
>> +		media_entity_cleanup(&resizer->sd.entity);
>> +	}
>> +}
>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
>> new file mode 100644
>> index 000000000000..042851a4b42d
>> --- /dev/null
>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
>> @@ -0,0 +1,424 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ARM Mali-C55 ISP Driver - Test pattern generator
>> + *
>> + * Copyright (C) 2024 Ideas on Board Oy
>> + */
>> +
>> +#include <linux/minmax.h>
>> +#include <linux/string.h>
>> +
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#include "mali-c55-common.h"
>> +#include "mali-c55-registers.h"
>> +
>> +#define MALI_C55_TPG_SRC_PAD		0
>> +#define MALI_C55_TPG_FIXED_HBLANK	0x20
>> +#define MALI_C55_TPG_MAX_VBLANK		0xFFFF
>> +#define MALI_C55_TPG_PIXEL_RATE		100000000
>> +
>> +static const char * const mali_c55_tpg_test_pattern_menu[] = {
>> +	"Flat field",
>> +	"Horizontal gradient",
>> +	"Vertical gradient",
>> +	"Vertical bars",
>> +	"Arbitrary rectangle",
>> +	"White frame on black field"
>> +};
>> +
>> +static const u32 mali_c55_tpg_mbus_codes[] = {
>> +	MEDIA_BUS_FMT_SRGGB16_1X16,
>> +	/*
>> +	 * This is a lie. In RGB mode the Test Pattern Generator actually output
>> +	 * 16-bits-per-colour data. However, RGB data follows one of the Bypass
>> +	 * paths which has a 12-bit limit at the insertion point, meaning it
>> +	 * would be truncated there to match the internal 12-bit format that
>> +	 * would be output from the debayering block. The same is true of RGB
>> +	 * data output by a sensor and streamed to the ISP's input port, however
>> +	 * in that case the ISP's input port requires that data be converted to
>> +	 * a 20-bit MSB aligned format. Given:
>> +	 *
>> +	 *	1. Our chosen topology represents the TPG as a subdevice
>> +	 *	   linked to the ISP's input port.
>> +	 *	2. We need to restrict the ISP's sink pad to only accepting that
>> +	 *	   20-bit RGB format from sensors / CSI-2 receivers.
>> +	 *	3. All the data ultimately ends up in the same format anyway and
>> +	 *	   these data from the TPG are purely internal to the ISP
>> +	 *
>> +	 * It seems best to reduce the programming complexity by simply
>> +	 * pretending that the TPG outputs data in the same format that the ISP
>> +	 * input port requires, even though it doesn't really.
>> +	 */
>> +	MEDIA_BUS_FMT_RGB202020_1X60,
>> +};
>> +
>> +static void __mali_c55_tpg_calc_vblank(struct v4l2_mbus_framefmt *format,
>> +				       int *def_vblank, int *min_vblank)
>> +{
>> +	unsigned int hts;
>> +	int tgt_fps;
>> +	int vblank;
>> +
>> +	hts = format->width + MALI_C55_TPG_FIXED_HBLANK;
>> +
>> +	/*
>> +	 * The ISP has minimum vertical blanking requirements that must be
>> +	 * adhered to by the TPG. The minimum is a function of the Iridix blocks
>> +	 * clocking requirements and the width of the image and horizontal
>> +	 * blanking, but if we assume the worst case iVariance and sVariance
>> +	 * values then it boils down to the below.
>> +	 */
>> +	*min_vblank = 15 + (120500 / hts);
>> +
>> +	/*
>> +	 * We need to set a sensible default vblank for whatever format height
>> +	 * we happen to be given from set_fmt(). This function just targets
>> +	 * an even multiple of 15fps. If we can't get 15fps, let's target 5fps.
>> +	 * If we can't get 5fps we'll take whatever the minimum vblank gives us.
>> +	 */
>> +	tgt_fps = MALI_C55_TPG_PIXEL_RATE / hts / (format->height + *min_vblank);
>> +
>> +	if (tgt_fps < 5)
>> +		vblank = *min_vblank;
>> +	else
>> +		vblank = MALI_C55_TPG_PIXEL_RATE / hts
>> +		       / max(rounddown(tgt_fps, 15), 5);
>> +
>> +	*def_vblank = ALIGN_DOWN(vblank, 2) - format->height;
>> +}
>> +
>> +static int mali_c55_tpg_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct mali_c55_tpg *tpg = container_of(ctrl->handler,
>> +						struct mali_c55_tpg,
>> +						ctrls.handler);
>> +	struct mali_c55 *mali_c55 = container_of(tpg, struct mali_c55, tpg);
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN:
>> +		mali_c55_write(mali_c55, MALI_C55_REG_TEST_GEN_CH0_PATTERN_TYPE,
>> +			       ctrl->val);
>> +		break;
>> +	case V4L2_CID_VBLANK:
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_BLANKING,
>> +				     MALI_C55_REG_VBLANK_MASK, ctrl->val);
>> +		break;
>> +	default:
>> +		dev_err(mali_c55->dev, "invalid V4L2 control ID\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops mali_c55_tpg_ctrl_ops = {
>> +	.s_ctrl = &mali_c55_tpg_s_ctrl,
>> +};
>> +
>> +static void mali_c55_tpg_configure(struct mali_c55 *mali_c55,
>> +				   struct v4l2_subdev *sd)
>> +{
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	/*
>> +	 * hblank needs setting, but is a read-only control and thus won't be
>> +	 * called during __v4l2_ctrl_handler_setup(). Do it here instead.
>> +	 */
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_BLANKING,
>> +			     MALI_C55_REG_HBLANK_MASK,
>> +			     MALI_C55_TPG_FIXED_HBLANK);
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
>> +			     MALI_C55_REG_GEN_VIDEO_MULTI_MASK, 0x01);
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +	fmt = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
>> +
>> +	mali_c55_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
>> +			     MALI_C55_TEST_PATTERN_RGB_MASK,
>> +			     fmt->code == MEDIA_BUS_FMT_RGB202020_1X60 ?
>> +					  0x01 : 0x0);
>> +
>> +	v4l2_subdev_unlock_state(state);
>> +}
>> +
>> +static int mali_c55_tpg_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct mali_c55_tpg *tpg = container_of(sd, struct mali_c55_tpg, sd);
>> +	struct mali_c55 *mali_c55 = container_of(tpg, struct mali_c55, tpg);
>> +
>> +	if (!enable) {
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
>> +				     MALI_C55_TEST_PATTERN_ON_OFF, 0x00);
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
>> +				     MALI_C55_REG_GEN_VIDEO_ON_MASK, 0x00);
>> +	} else {
>> +		/*
>> +		 * One might reasonably expect the framesize to be set here
>> +		 * given it's configurable in .set_fmt(), but it's done in the
>> +		 * ISP subdevice's .s_stream() instead, as the same register is
>> +		 * also used to indicate the size of the data coming from the
>> +		 * sensor.
>> +		 */
>> +		mali_c55_tpg_configure(mali_c55, sd);
>> +		__v4l2_ctrl_handler_setup(sd->ctrl_handler);
>> +
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
>> +				     MALI_C55_TEST_PATTERN_ON_OFF,
>> +				     MALI_C55_TEST_PATTERN_ON_OFF);
>> +		mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
>> +				     MALI_C55_REG_GEN_VIDEO_ON_MASK,
>> +				     MALI_C55_REG_GEN_VIDEO_ON_MASK);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_video_ops mali_c55_tpg_video_ops = {
>> +	.s_stream = &mali_c55_tpg_s_stream,
>> +};
>> +
>> +static int mali_c55_tpg_enum_mbus_code(struct v4l2_subdev *sd,
>> +				       struct v4l2_subdev_state *state,
>> +				       struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->pad >= sd->entity.num_pads)
>> +		return -EINVAL;
> This check is done by the framework, you can drop it here.
>
>> +
>> +	if (code->index >= ARRAY_SIZE(mali_c55_tpg_mbus_codes))
>> +		return -EINVAL;
>> +
>> +	code->code = mali_c55_tpg_mbus_codes[code->index];
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_tpg_enum_frame_size(struct v4l2_subdev *sd,
>> +					struct v4l2_subdev_state *state,
>> +					struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	if (fse->index > 0 || fse->pad > sd->entity.num_pads)
>> +		return -EINVAL;
>> +
>> +	fse->min_width = MALI_C55_MIN_WIDTH;
>> +	fse->max_width = MALI_C55_MAX_WIDTH;
>> +	fse->min_height = MALI_C55_MIN_HEIGHT;
>> +	fse->max_height = MALI_C55_MAX_HEIGHT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_tpg_set_fmt(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state,
>> +				struct v4l2_subdev_format *format)
>> +{
>> +	struct mali_c55_tpg *tpg = container_of(sd, struct mali_c55_tpg, sd);
>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>> +	int vblank_def, vblank_min;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(mali_c55_tpg_mbus_codes); i++) {
>> +		if (fmt->code == mali_c55_tpg_mbus_codes[i])
>> +			break;
>> +	}
>> +
>> +	if (i == ARRAY_SIZE(mali_c55_tpg_mbus_codes))
>> +		fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
>> +
>> +	/*
>> +	 * The TPG says that the test frame timing generation logic expects a
>> +	 * minimum framesize of 4x4 pixels, but given the rest of the ISP can't
>> +	 * handle anything smaller than 128x128 it seems pointless to allow a
>> +	 * smaller frame.
>> +	 */
>> +	clamp_t(unsigned int, fmt->width, MALI_C55_MIN_WIDTH,
>> +		MALI_C55_MAX_WIDTH);
>> +	clamp_t(unsigned int, fmt->height, MALI_C55_MIN_HEIGHT,
>> +		MALI_C55_MAX_HEIGHT);
>> +
>> +	*v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD) = *fmt;
>> +
> Shouldn't the controls below only be changed for the active format?


Yes! Thank you

>
>> +	__mali_c55_tpg_calc_vblank(fmt, &vblank_def, &vblank_min);
>> +	__v4l2_ctrl_modify_range(tpg->ctrls.vblank, vblank_min,
>> +				 MALI_C55_TPG_MAX_VBLANK, 1, vblank_def);
>> +	__v4l2_ctrl_s_ctrl(tpg->ctrls.vblank, vblank_def);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops mali_c55_tpg_pad_ops = {
>> +	.enum_mbus_code		= mali_c55_tpg_enum_mbus_code,
>> +	.enum_frame_size	= mali_c55_tpg_enum_frame_size,
>> +	.get_fmt		= v4l2_subdev_get_fmt,
>> +	.set_fmt		= mali_c55_tpg_set_fmt,
>> +};
>> +
>> +static const struct v4l2_subdev_ops mali_c55_tpg_ops = {
>> +	.video	= &mali_c55_tpg_video_ops,
>> +	.pad	= &mali_c55_tpg_pad_ops,
>> +};
>> +
>> +static int mali_c55_tpg_init_state(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *sd_state)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	fmt = v4l2_subdev_state_get_format(sd_state, MALI_C55_TPG_SRC_PAD);
> Can be assigned in the declaration.


How would you make it fit that way?

>
>> +
>> +	fmt->width = MALI_C55_DEFAULT_WIDTH;
>> +	fmt->height = MALI_C55_DEFAULT_HEIGHT;
>> +	fmt->field = V4L2_FIELD_NONE;
>> +	fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_internal_ops mali_c55_tpg_internal_ops = {
>> +	.init_state = mali_c55_tpg_init_state,
>> +};
>> +
>> +static int mali_c55_tpg_init_controls(struct mali_c55 *mali_c55)
>> +{
>> +	struct mali_c55_tpg_ctrls *ctrls = &mali_c55->tpg.ctrls;
>> +	struct v4l2_subdev *sd = &mali_c55->tpg.sd;
>> +	struct v4l2_mbus_framefmt *format;
>> +	struct v4l2_subdev_state *state;
>> +	int vblank_def, vblank_min;
>> +	int ret;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +	format = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
>> +
>> +	ret = v4l2_ctrl_handler_init(&ctrls->handler, 1);
>> +	if (ret)
>> +		goto err_unlock;
>> +
>> +	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(&ctrls->handler,
>> +				&mali_c55_tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
>> +				ARRAY_SIZE(mali_c55_tpg_test_pattern_menu) - 1,
>> +				0, 3, mali_c55_tpg_test_pattern_menu);
>> +
>> +	/*
>> +	 * We fix hblank at the minimum allowed value and control framerate
>> +	 * solely through the vblank control.
>> +	 */
>> +	ctrls->hblank = v4l2_ctrl_new_std(&ctrls->handler,
>> +				&mali_c55_tpg_ctrl_ops,
>> +				V4L2_CID_HBLANK, MALI_C55_TPG_FIXED_HBLANK,
>> +				MALI_C55_TPG_FIXED_HBLANK, 1,
>> +				MALI_C55_TPG_FIXED_HBLANK);
>> +	if (ctrls->hblank)
>> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +	__mali_c55_tpg_calc_vblank(format, &vblank_def, &vblank_min);
>> +	ctrls->vblank = v4l2_ctrl_new_std(&ctrls->handler,
>> +					  &mali_c55_tpg_ctrl_ops,
>> +					  V4L2_CID_VBLANK, vblank_min,
>> +					  MALI_C55_TPG_MAX_VBLANK, 1,
>> +					  vblank_def);
>> +
>> +	if (ctrls->handler.error) {
>> +		dev_err(mali_c55->dev, "Error during v4l2 controls init\n");
>> +		ret = ctrls->handler.error;
>> +		goto err_free_handler;
>> +	}
>> +
>> +	ctrls->handler.lock = &mali_c55->tpg.lock;
>> +	mali_c55->tpg.sd.ctrl_handler = &ctrls->handler;
>> +
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return 0;
>> +
>> +err_free_handler:
>> +	v4l2_ctrl_handler_free(&ctrls->handler);
>> +err_unlock:
>> +	v4l2_subdev_unlock_state(state);
>> +	return ret;
>> +}
>> +
>> +int mali_c55_register_tpg(struct mali_c55 *mali_c55)
>> +{
>> +	struct mali_c55_tpg *tpg = &mali_c55->tpg;
>> +	struct v4l2_subdev *sd = &tpg->sd;
>> +	struct media_pad *pad = &tpg->pad;
>> +	int ret;
>> +
>> +	mutex_init(&tpg->lock);
>> +
>> +	v4l2_subdev_init(sd, &mali_c55_tpg_ops);
>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +	sd->owner = THIS_MODULE;
>> +	sd->internal_ops = &mali_c55_tpg_internal_ops;
>> +	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
>> +
>> +	pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
>> +	ret = media_entity_pads_init(&sd->entity, 1, pad);
>> +	if (ret) {
>> +		dev_err(mali_c55->dev,
>> +			"Failed to initialize media entity pads\n");
>> +		goto err_destroy_mutex;
>> +	}
>> +
>> +	ret = v4l2_subdev_init_finalize(sd);
>> +	if (ret)
>> +		goto err_cleanup_media_entity;
>> +
>> +	ret = mali_c55_tpg_init_controls(mali_c55);
>> +	if (ret) {
>> +		dev_err(mali_c55->dev,
>> +			"Error initialising controls\n");
>> +		goto err_cleanup_subdev;
>> +	}
>> +
>> +	ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
>> +	if (ret) {
>> +		dev_err(mali_c55->dev, "Failed to register tpg subdev\n");
>> +		goto err_free_ctrl_handler;
>> +	}
>> +
>> +	/*
>> +	 * By default the colour settings lead to a very dim image that is
>> +	 * nearly indistinguishable from black on some monitor settings. Ramp
>> +	 * them up a bit so the image is brighter.
>> +	 */
>> +	mali_c55_write(mali_c55, MALI_C55_REG_TPG_R_BACKGROUND,
>> +		       MALI_C55_TPG_BACKGROUND_MAX);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_TPG_G_BACKGROUND,
>> +		       MALI_C55_TPG_BACKGROUND_MAX);
>> +	mali_c55_write(mali_c55, MALI_C55_REG_TPG_B_BACKGROUND,
>> +		       MALI_C55_TPG_BACKGROUND_MAX);
>> +
>> +	tpg->mali_c55 = mali_c55;
>> +
>> +	return 0;
>> +
>> +err_free_ctrl_handler:
>> +	v4l2_ctrl_handler_free(&tpg->ctrls.handler);
>> +err_cleanup_subdev:
>> +	v4l2_subdev_cleanup(sd);
>> +err_cleanup_media_entity:
>> +	media_entity_cleanup(&sd->entity);
>> +err_destroy_mutex:
>> +	mutex_destroy(&tpg->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +void mali_c55_unregister_tpg(struct mali_c55 *mali_c55)
>> +{
>> +	struct mali_c55_tpg *tpg = &mali_c55->tpg;
>> +
>> +	if (!tpg->mali_c55)
>> +		return;
>> +
>> +	v4l2_device_unregister_subdev(&tpg->sd);
>> +	v4l2_subdev_cleanup(&tpg->sd);
>> +	media_entity_cleanup(&tpg->sd.entity);
>> +	v4l2_ctrl_handler_free(&tpg->ctrls.handler);
>> +	mutex_destroy(&tpg->lock);
>> +}

