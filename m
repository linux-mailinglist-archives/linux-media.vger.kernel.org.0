Return-Path: <linux-media+bounces-12644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C8E8FE6C8
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 14:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083A91C25451
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 12:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1031B195B15;
	Thu,  6 Jun 2024 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dH9WJIBV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF964DA14;
	Thu,  6 Jun 2024 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678044; cv=none; b=hXkqXW+QxpPQs/SqXKXg8CiQFCnI8aAU0y2+cqZ2s044dE4Qg6wtGR1YIZXwh5IZ8ZmXDJar36I/LzI6RPVd93nc16vxYqWDdphqjXO7P4X49CJ0LNFA50N9V8q5J1H1LQePVbmsY6uVHZKakYZOBcKP7vBj77Sc0oOha6lkYwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678044; c=relaxed/simple;
	bh=CU7XWk66vkjMBHrMF7784BZQD0yxoNJxBJrD1nbVXio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfMFAyHFNt9ld6Eh4RoD3qxYeflH4zJactUNILwGOJmYBgKTqJaqJykS4FwWKbQexphQUUPR7HaRZWjCTq+m/SBQ2llfznEKj51pZmGTpQjSaqfwDhAy+hw7p72KyhCWuGClukVWHsQRF8KbBBtsC40gw++gaRzlReRZUAdIdoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dH9WJIBV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2F22BEB;
	Thu,  6 Jun 2024 14:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717678022;
	bh=CU7XWk66vkjMBHrMF7784BZQD0yxoNJxBJrD1nbVXio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dH9WJIBVCnshDxCby06NVz0U+3ur4+Ctcv33uZ5nGZsbmpUX89nc/xotV7GPex1jS
	 lOc58jYGV32fRuHH2xbUvqWOOIfn3zNu7heb2pJgzOv4RCWagtx2FWb2Y+YawY9Vbf
	 sOaurTjbZ5bbtbslwPtP3IeXXCGerZomPe97fWPU=
Date: Thu, 6 Jun 2024 14:47:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, sakari.ailus@iki.fi
Subject: Re: [PATCH v5 05/16] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <ygr7rhp23gjc4ywmcdy7d5coh4wubxlvkdxcvwgdpk4j343pnd@h4if5jtz7mop>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-6-dan.scally@ideasonboard.com>
 <20240530001507.GG10586@pendragon.ideasonboard.com>
 <20240530214348.GA5213@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240530214348.GA5213@pendragon.ideasonboard.com>

Hi Laurent

On Fri, May 31, 2024 at 12:43:48AM GMT, Laurent Pinchart wrote:
> And now the second part of the review, addressing mali-c55-capture.c and
> mali-c55-resizer.c. I've reviewed the code from the bottom up, so some
> messages may be repeated in an order that seems weird. Sorry about that.
>

[snip]

A few replies/questions on the resizer module

> >
> > > +
> > > +#endif /* _MALI_C55_RESIZER_COEFS_H */
> > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > > new file mode 100644
> > > index 000000000000..0a5a2969d3ce
> > > --- /dev/null
> > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > > @@ -0,0 +1,779 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * ARM Mali-C55 ISP Driver - Image signal processor
> > > + *
> > > + * Copyright (C) 2024 Ideas on Board Oy
> > > + */
> > > +
> > > +#include <linux/math.h>
> > > +#include <linux/minmax.h>
> > > +
> > > +#include <media/media-entity.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +#include "mali-c55-common.h"
> > > +#include "mali-c55-registers.h"
> > > +#include "mali-c55-resizer-coefs.h"
> > > +
> > > +/* Scaling factor in Q4.20 format. */
> > > +#define MALI_C55_RZR_SCALER_FACTOR	(1U << 20)
> > > +
> > > +static const u32 rzr_non_bypass_src_fmts[] = {
> > > +	MEDIA_BUS_FMT_RGB121212_1X36,
> > > +	MEDIA_BUS_FMT_YUV10_1X30
> > > +};
> > > +
> > > +static const char * const mali_c55_resizer_names[] = {
> > > +	[MALI_C55_RZR_FR] = "resizer fr",
> > > +	[MALI_C55_RZR_DS] = "resizer ds",
> > > +};
> > > +
> > > +static int mali_c55_rzr_program_crop(struct mali_c55_resizer *rzr,
> > > +				     struct v4l2_subdev_state *state)
> > > +{
> > > +	unsigned int reg_offset = rzr->cap_dev->reg_offset;
> > > +	struct mali_c55 *mali_c55 = rzr->mali_c55;
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +	struct v4l2_rect *crop;
>
> const
>
> > > +
> > > +	/* Verify if crop should be enabled. */
> > > +	fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SINK_PAD, 0);
> > > +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD, 0);
> > > +
> > > +	if (fmt->width == crop->width && fmt->height == crop->height)
> > > +		return MALI_C55_BYPASS_CROP;
> > > +
> > > +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_X_START(reg_offset),
> > > +		       crop->left);
> > > +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_Y_START(reg_offset),
> > > +		       crop->top);
> > > +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_X_SIZE(reg_offset),
> > > +		       crop->width);
> > > +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_Y_SIZE(reg_offset),
> > > +		       crop->height);
> > > +
> > > +	mali_c55_write(mali_c55, MALI_C55_REG_CROP_EN(reg_offset),
> > > +		       MALI_C55_CROP_ENABLE);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_rzr_program_resizer(struct mali_c55_resizer *rzr,
> > > +					struct v4l2_subdev_state *state)
> > > +{
> > > +	unsigned int reg_offset = rzr->cap_dev->reg_offset;
> > > +	struct mali_c55 *mali_c55 = rzr->mali_c55;
> > > +	struct v4l2_rect *crop, *scale;
>
> const
>
> Once "[PATCH v4 0/3] media: v4l2-subdev: Support const-awareness in
> state accessors" gets merged, the state argument to this function can be
> made const too. Same for other functions, as applicable.
>
> > > +	unsigned int h_bank, v_bank;
> > > +	u64 h_scale, v_scale;
> > > +
> > > +	/* Verify if scaling should be enabled. */
> > > +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD, 0);
> > > +	scale = v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD, 0);
> > > +
> > > +	if (crop->width == scale->width && crop->height == scale->height)
> > > +		return MALI_C55_BYPASS_SCALER;
> > > +
> > > +	/* Program the V/H scaling factor in Q4.20 format. */
> > > +	h_scale = crop->width * MALI_C55_RZR_SCALER_FACTOR;
> > > +	v_scale = crop->height * MALI_C55_RZR_SCALER_FACTOR;
> > > +
> > > +	do_div(h_scale, scale->width);
> > > +	do_div(v_scale, scale->height);
> > > +
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_IN_WIDTH(reg_offset),
> > > +		       crop->width);
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_IN_HEIGHT(reg_offset),
> > > +		       crop->height);
> > > +
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_OUT_WIDTH(reg_offset),
> > > +		       scale->width);
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_OUT_HEIGHT(reg_offset),
> > > +		       scale->height);
> > > +
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_HFILT_TINC(reg_offset),
> > > +		       h_scale);
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_VFILT_TINC(reg_offset),
> > > +		       v_scale);
> > > +
> > > +	h_bank = mali_c55_calculate_bank_num(mali_c55, crop->width,
> > > +					     scale->width);
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_HFILT_COEF(reg_offset),
> > > +		       h_bank);
> > > +
> > > +	v_bank = mali_c55_calculate_bank_num(mali_c55, crop->height,
> > > +					     scale->height);
> > > +	mali_c55_write(mali_c55,
> > > +		       MALI_C55_REG_SCALER_VFILT_COEF(reg_offset),
> > > +		       v_bank);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void mali_c55_rzr_program(struct mali_c55_resizer *rzr,
> > > +				 struct v4l2_subdev_state *state)
> > > +{
> > > +	struct mali_c55 *mali_c55 = rzr->mali_c55;
> > > +	u32 bypass = 0;
> > > +
> > > +	/* Verify if cropping and scaling should be enabled. */
> > > +	bypass |= mali_c55_rzr_program_crop(rzr, state);
> > > +	bypass |= mali_c55_rzr_program_resizer(rzr, state);
> > > +
> > > +	mali_c55_update_bits(mali_c55, rzr->id == MALI_C55_RZR_FR ?
> > > +			     MALI_C55_REG_FR_BYPASS : MALI_C55_REG_DS_BYPASS,
> > > +			     MALI_C55_BYPASS_CROP | MALI_C55_BYPASS_SCALER,
> > > +			     bypass);
> > > +}
> > > +
> > > +/*
> > > + * Inspect the routing table to know which of the two (mutually exclusive)
> > > + * routes is enabled and return the sink pad id of the active route.
> > > + */
> > > +static unsigned int mali_c55_rzr_get_active_sink(struct v4l2_subdev_state *state)
> > > +{
> > > +	struct v4l2_subdev_krouting *routing = &state->routing;
> > > +	struct v4l2_subdev_route *route;
> > > +
> > > +	/* A single route is enabled at a time. */
> > > +	for_each_active_route(routing, route)
> > > +		return route->sink_pad;
> > > +
> > > +	return MALI_C55_RZR_SINK_PAD;
> > > +}
> > > +
> > > +static u32 mali_c55_rzr_shift_mbus_code(u32 mbus_code)
> > > +{
> > > +	u32 corrected_code = 0;
> > > +
> > > +	/*
> > > +	 * The ISP takes input in a 20-bit format, but can only output 16-bit
> > > +	 * RAW bayer data (with the 4 least significant bits from the input
> > > +	 * being lost). Return the 16-bit version of the 20-bit input formats.
> > > +	 */
> > > +	switch (mbus_code) {
> > > +	case MEDIA_BUS_FMT_SBGGR20_1X20:
> > > +		corrected_code = MEDIA_BUS_FMT_SBGGR16_1X16;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SGBRG20_1X20:
> > > +		corrected_code = MEDIA_BUS_FMT_SGBRG16_1X16;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SGRBG20_1X20:
> > > +		corrected_code = MEDIA_BUS_FMT_SGRBG16_1X16;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_SRGGB20_1X20:
> > > +		corrected_code = MEDIA_BUS_FMT_SRGGB16_1X16;
> > > +		break;
>
> Would it make sense to add the shifted code to mali_c55_isp_fmt ?
>
> > > +	}
> > > +
> > > +	return corrected_code;
> > > +}
> > > +
> > > +static int __mali_c55_rzr_set_routing(struct v4l2_subdev *sd,
> > > +				      struct v4l2_subdev_state *state,
> > > +				      struct v4l2_subdev_krouting *routing)
>
> I think the last argument can be const.

If I have to adjust the routing table instead of refusing it, it can't

>
> > > +{
> > > +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
> > > +						    sd);
>
> A to_mali_c55_resizer() static inline function would be useful. Same for
> other components, where applicable.
>
> > > +	unsigned int active_sink = UINT_MAX;
> > > +	struct v4l2_mbus_framefmt *src_fmt;
> > > +	struct v4l2_rect *crop, *compose;
> > > +	struct v4l2_subdev_route *route;
> > > +	unsigned int active_routes = 0;
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_subdev_routing_validate(sd, routing, 0);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Only a single route can be enabled at a time. */
> > > +	for_each_active_route(routing, route) {
> > > +		if (++active_routes > 1) {
> > > +			dev_err(rzr->mali_c55->dev,
> > > +				"Only one route can be active");
>
> No kernel log message with a level higher than dev_dbg() from
> user-controlled paths please, here and where applicable. This is to
> avoid giving applications an easy way to flood the kernel log.
>
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		active_sink = route->sink_pad;
> > > +	}
> > > +	if (active_sink == UINT_MAX) {
> > > +		dev_err(rzr->mali_c55->dev, "One route has to be active");
> > > +		return -EINVAL;
> > > +	}
>
> The recommended handling of invalid routing is to adjust the routing
> table, not to return errors.
>

How should I adjust it ? The error here is due to the fact multiple
routes are set as active, which one should I make active ? the first
one ? Should I go and reset the flags in the subdev_route for the one
that has to be made non-active ?

> > > +
> > > +	ret = v4l2_subdev_set_routing(sd, state, routing);
> > > +	if (ret) {
> > > +		dev_err(rzr->mali_c55->dev, "Failed to set routing\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	fmt = v4l2_subdev_state_get_format(state, active_sink, 0);
> > > +	crop = v4l2_subdev_state_get_crop(state, active_sink, 0);
> > > +	compose = v4l2_subdev_state_get_compose(state, active_sink, 0);
> > > +
> > > +	fmt->width = MALI_C55_DEFAULT_WIDTH;
> > > +	fmt->height = MALI_C55_DEFAULT_HEIGHT;
> > > +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
>
> There are other colorspace-related fields.
>
> > > +	fmt->field = V4L2_FIELD_NONE;
>
> I wonder if we should really update the sink pad format, or just
> propagate it. If we update it, I think it should be set to defaults on
> both sink pads, not just the active sink pad.
>

If only one route can be active, there will only be one state.stream_config
entry for the active sink, not for the other one (see
v4l2_subdev_init_stream_configs()), this mean I can't reset both sink
formats ?

> > > +
> > > +	if (active_sink == MALI_C55_RZR_SINK_PAD) {
> > > +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
> > > +
> > > +		crop->left = crop->top = 0;
>
> 		crop->left = 0;
> 		crop->top = 0;
>
> > > +		crop->width = MALI_C55_DEFAULT_WIDTH;
> > > +		crop->height = MALI_C55_DEFAULT_HEIGHT;
> > > +
> > > +		*compose = *crop;
> > > +	} else {
> > > +		fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
> > > +	}
> > > +
> > > +	/* Propagate the format to the source pad */
> > > +	src_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD,
> > > +					       0);
> > > +	*src_fmt = *fmt;
> > > +
> > > +	/* In the event this is the bypass pad the mbus code needs correcting */
> > > +	if (active_sink == MALI_C55_RZR_SINK_BYPASS_PAD)
> > > +		src_fmt->code = mali_c55_rzr_shift_mbus_code(src_fmt->code);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_rzr_enum_mbus_code(struct v4l2_subdev *sd,
> > > +				       struct v4l2_subdev_state *state,
> > > +				       struct v4l2_subdev_mbus_code_enum *code)
> > > +{
> > > +	struct v4l2_mbus_framefmt *sink_fmt;
> > > +	const struct mali_c55_isp_fmt *fmt;
> > > +	unsigned int index = 0;
> > > +	u32 sink_pad;
> > > +
> > > +	switch (code->pad) {
> > > +	case MALI_C55_RZR_SINK_PAD:
> > > +		if (code->index)
> > > +			return -EINVAL;
> > > +
> > > +		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
> > > +
> > > +		return 0;
> > > +	case MALI_C55_RZR_SOURCE_PAD:
> > > +		sink_pad = mali_c55_rzr_get_active_sink(state);
> > > +		sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
> > > +
> > > +		/*
> > > +		 * If the active route is from the Bypass sink pad, then the
> > > +		 * source pad is a simple passthrough of the sink format,
> > > +		 * downshifted to 16-bits.
> > > +		 */
> > > +
> > > +		if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
> > > +			if (code->index)
> > > +				return -EINVAL;
> > > +
> > > +			code->code = mali_c55_rzr_shift_mbus_code(sink_fmt->code);
> > > +			if (!code->code)
> > > +				return -EINVAL;
> > > +
> > > +			return 0;
> > > +		}
> > > +
> > > +		/*
> > > +		 * If the active route is from the non-bypass sink then we can
> > > +		 * select either RGB or conversion to YUV.
> > > +		 */
> > > +
> > > +		if (code->index >= ARRAY_SIZE(rzr_non_bypass_src_fmts))
> > > +			return -EINVAL;
> > > +
> > > +		code->code = rzr_non_bypass_src_fmts[code->index];
> > > +
> > > +		return 0;
> > > +	case MALI_C55_RZR_SINK_BYPASS_PAD:
> > > +		for_each_mali_isp_fmt(fmt) {
> > > +			if (index++ == code->index) {
> > > +				code->code = fmt->code;
> > > +				return 0;
> > > +			}
> > > +		}
> > > +
> > > +		break;
> > > +	}
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int mali_c55_rzr_enum_frame_size(struct v4l2_subdev *sd,
> > > +					struct v4l2_subdev_state *state,
> > > +					struct v4l2_subdev_frame_size_enum *fse)
> > > +{
> > > +	if (fse->index)
> > > +		return -EINVAL;
> > > +
> > > +	fse->max_width = MALI_C55_MAX_WIDTH;
> > > +	fse->max_height = MALI_C55_MAX_HEIGHT;
> > > +	fse->min_width = MALI_C55_MIN_WIDTH;
> > > +	fse->min_height = MALI_C55_MIN_HEIGHT;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_rzr_set_sink_fmt(struct v4l2_subdev *sd,
> > > +				     struct v4l2_subdev_state *state,
> > > +				     struct v4l2_subdev_format *format)
> > > +{
> > > +	struct v4l2_mbus_framefmt *fmt = &format->format;
> > > +	struct v4l2_rect *rect;
> > > +	unsigned int sink_pad;
> > > +
> > > +	/*
> > > +	 * Clamp to min/max and then reset crop and compose rectangles to the
> > > +	 * newly applied size.
> > > +	 */
> > > +	clamp_t(unsigned int, fmt->width,
> > > +		MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);

also, clamp_t doens't clamp in place

        fmt->width = clamp_t...

> > > +	clamp_t(unsigned int, fmt->height,
> > > +		MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
>
> Please check comments for other components related to the colorspace
> fields, to decide how to handle them here.
>
> > > +
> > > +	sink_pad = mali_c55_rzr_get_active_sink(state);
> > > +	if (sink_pad == MALI_C55_RZR_SINK_PAD) {
>
> The selection here should depend on format->pad, not the active sink
> pad.
>
> > > +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
> > > +
> > > +		rect = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD);
> > > +		rect->left = 0;
> > > +		rect->top = 0;
> > > +		rect->width = fmt->width;
> > > +		rect->height = fmt->height;
> > > +
> > > +		rect = v4l2_subdev_state_get_compose(state,
> > > +						     MALI_C55_RZR_SINK_PAD);
> > > +		rect->left = 0;
> > > +		rect->top = 0;
> > > +		rect->width = fmt->width;
> > > +		rect->height = fmt->height;
> > > +	} else {
> > > +		/*
> > > +		 * Make sure the media bus code is one of the supported
> > > +		 * ISP input media bus codes.
> > > +		 */
> > > +		if (!mali_c55_isp_is_format_supported(fmt->code))
> > > +			fmt->code = MALI_C55_DEFAULT_MEDIA_BUS_FMT;

And DEFAULT_MEDIA_BUS_FMT is not one of the supported input media bus
codes

> > > +	}
> > > +
> > > +	*v4l2_subdev_state_get_format(state, sink_pad, 0) = *fmt;
> > > +	*v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD, 0) = *fmt;
>
> Propagation to the source pad, however, should depend on the active
> route. If format->pad is routed to the source pad, you should propagate,
> otherwise, you shouldn't.
>
> > > +
> > > +	return 0;

I ended up with

static int mali_c55_rsz_set_sink_fmt(struct v4l2_subdev *sd,
				     struct v4l2_subdev_state *state,
				     struct v4l2_subdev_format *format)
{
	struct v4l2_mbus_framefmt *fmt = &format->format;
	unsigned int active_sink;
	struct v4l2_rect *rect;

	/*
	 * Clamp to min/max and then reset crop and compose rectangles to the
	 * newly applied size.
	 */
	fmt->width = clamp_t(unsigned int, fmt->width, MALI_C55_MIN_WIDTH,
			     MALI_C55_MAX_WIDTH);
	fmt->height = clamp_t(unsigned int, fmt->height, MALI_C55_MIN_HEIGHT,
			      MALI_C55_MAX_HEIGHT);

	rect = v4l2_subdev_state_get_crop(state, format->pad);
	rect->left = 0;
	rect->top = 0;
	rect->width = fmt->width;
	rect->height = fmt->height;

	rect = v4l2_subdev_state_get_compose(state, format->pad);
	rect->left = 0;
	rect->top = 0;
	rect->width = fmt->width;
	rect->height = fmt->height;

	if (format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD) {
		/*
		 * Make sure the media bus code is one of the supported
		 * ISP input media bus codes. Default it to SRGGB otherwise.
		 */
		if (!mali_c55_isp_is_format_supported(fmt->code))
			fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
	} else {
		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
	}

	*v4l2_subdev_state_get_format(state, format->pad, 0) = *fmt;

	/* If format->pad is routed to the source pad, propagate the format. */
	active_sink = mali_c55_rsz_get_active_sink(state);
	if (active_sink == format->pad) {

		/* If the bypass route is used, downshift the code to 16bpp. */
		if (active_sink == MALI_C55_RSZ_SINK_BYPASS_PAD)
			fmt->code = mali_c55_rsz_shift_mbus_code(fmt->code);

		*v4l2_subdev_state_get_format(state,
					      MALI_C55_RSZ_SOURCE_PAD, 0) = *fmt;
	}

	return 0;
}
> > > +}
> > > +
> > > +static int mali_c55_rzr_set_source_fmt(struct v4l2_subdev *sd,
> > > +				       struct v4l2_subdev_state *state,
> > > +				       struct v4l2_subdev_format *format)
> > > +{
> > > +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
> > > +						    sd);
> > > +	struct v4l2_mbus_framefmt *fmt = &format->format;
> > > +	struct v4l2_mbus_framefmt *sink_fmt;
> > > +	struct v4l2_rect *crop, *compose;
> > > +	unsigned int sink_pad;
> > > +	unsigned int i;
> > > +
> > > +	sink_pad = mali_c55_rzr_get_active_sink(state);
> > > +	sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
> > > +	crop = v4l2_subdev_state_get_crop(state, sink_pad, 0);
> > > +	compose = v4l2_subdev_state_get_compose(state, sink_pad, 0);
> > > +
> > > +	/* FR Bypass pipe. */
> > > +
> > > +	if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
> > > +		/*
> > > +		 * Format on the source pad is the same as the one on the
> > > +		 * sink pad, downshifted to 16-bits.
> > > +		 */
> > > +		fmt->code = mali_c55_rzr_shift_mbus_code(sink_fmt->code);
> > > +		if (!fmt->code)
> > > +			return -EINVAL;
> > > +
> > > +		/* RAW bypass disables scaling and cropping. */
> > > +		crop->top = compose->top = 0;
> > > +		crop->left = compose->left = 0;
> > > +		fmt->width = crop->width = compose->width = sink_fmt->width;
> > > +		fmt->height = crop->height = compose->height = sink_fmt->height;
>
> I don't think this is right. This function sets the format on the source
> pad. Subdevs should propagate formats from the sink to the source, not
> the other way around.
>
> The only parameter that can be modified on the source pad (as far as I
> understand) is the media bus code. In the bypass path, I understand it's
> fixed, while in the other path, you can select between RGB and YUV. I
> think the following code is what you need to implement this function.
>
> static int mali_c55_rzr_set_source_fmt(struct v4l2_subdev *sd,
> 				       struct v4l2_subdev_state *state,
> 				       struct v4l2_subdev_format *format)
> {
> 	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
> 						    sd);
> 	struct v4l2_mbus_framefmt *fmt;
>
> 	fmt = v4l2_subdev_state_get_format(state, format->pad);
>
> 	/* In the non-bypass path the output format can be selected. */
> 	if (mali_c55_rzr_get_active_sink(state) == MALI_C55_RZR_SINK_PAD) {
> 		unsigned int i;
>
> 		fmt->code = format->format.code;
>
> 		for (i = 0; i < ARRAY_SIZE(rzr_non_bypass_src_fmts); i++) {
> 			if (fmt->code == rzr_non_bypass_src_fmts[i])
> 				break;
> 		}
>
> 		if (i == ARRAY_SIZE(rzr_non_bypass_src_fmts))
> 			fmt->code = rzr_non_bypass_src_fmts[0];
> 	}
>
> 	format->format = *fmt;
>
> 	return 0;
> }

Almost. Your proposal doesn't adjust format->format.width/height

I think the following is more appropriate

static int mali_c55_rsz_set_source_fmt(struct v4l2_subdev *sd,
				       struct v4l2_subdev_state *state,
				       struct v4l2_subdev_format *format)
{
	struct v4l2_mbus_framefmt *fmt = &format->format;
	struct v4l2_mbus_framefmt *sink_fmt;
	struct v4l2_rect *sink_compose;
	unsigned int active_sink;

	active_sink = mali_c55_rsz_get_active_sink(state);
	sink_fmt = v4l2_subdev_state_get_format(state, active_sink, 0);
	sink_compose = v4l2_subdev_state_get_compose(state, active_sink, 0);

	/*
	 * The source pad format sizes come directly from the active sink pad
	 * compose rectangle.
	 */
	fmt->width = sink_compose->width;
	fmt->height = sink_compose->height;

	if (active_sink == MALI_C55_RSZ_SINK_PAD) {
		/*
		 * Regular processing pipe: RGB121212 can be color-space
		 * converted to YUV101010.
		 */
		unsigned int i;

		for (i = 0; i < ARRAY_SIZE(rsz_non_bypass_src_fmts); i++) {
			if (fmt->code == rsz_non_bypass_src_fmts[i])
				break;
		}

		if (i == ARRAY_SIZE(rsz_non_bypass_src_fmts))
			fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
	} else {
		/*
		 * Bypass pipe: the source format is the same as the bypass
		 * sink pad downshifted to 16bpp.
		 */
		fmt->code = mali_c55_rsz_shift_mbus_code(sink_fmt->code);
	}

	*v4l2_subdev_state_get_format(state, MALI_C55_RSZ_SOURCE_PAD) = *fmt;

	return 0;
}

I'll handle the colorspace fields as well

>
> > > +
> > > +		*v4l2_subdev_state_get_format(state,
> > > +					      MALI_C55_RZR_SOURCE_PAD) = *fmt;
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	/* Regular processing pipe. */
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(rzr_non_bypass_src_fmts); i++) {
> > > +		if (fmt->code == rzr_non_bypass_src_fmts[i])
> > > +			break;
> > > +	}
> > > +
> > > +	if (i == ARRAY_SIZE(rzr_non_bypass_src_fmts)) {
> > > +		dev_dbg(rzr->mali_c55->dev,
> > > +			"Unsupported mbus code 0x%x: using default\n",
> > > +			fmt->code);
>
> I think you can drop this message.
>
> > > +		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The source pad format size comes directly from the sink pad
> > > +	 * compose rectangle.
> > > +	 */
> > > +	fmt->width = compose->width;
> > > +	fmt->height = compose->height;
> > > +
> > > +	*v4l2_subdev_state_get_format(state, MALI_C55_RZR_SOURCE_PAD) = *fmt;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_rzr_set_fmt(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_state *state,
> > > +				struct v4l2_subdev_format *format)
> > > +{
> > > +	/*
> > > +	 * On sink pads fmt is either fixed for the 'regular' processing
> > > +	 * pad or a RAW format or 20-bit wide RGB/YUV format for the FR bypass
> > > +	 * pad.
> > > +	 *
> > > +	 * On source pad sizes are the result of crop+compose on the sink
> > > +	 * pad sizes, while the format depends on the active route.
> > > +	 */
> > > +
> > > +	if (format->pad != MALI_C55_RZR_SOURCE_PAD)
> > > +		return mali_c55_rzr_set_sink_fmt(sd, state, format);
> > > +
> > > +	return mali_c55_rzr_set_source_fmt(sd, state, format);
>
> Nitpicking,
>
> 	if (format->pad == MALI_C55_RZR_SOURCE_PAD)
> 		return mali_c55_rzr_set_source_fmt(sd, state, format);
>
> 	return mali_c55_rzr_set_sink_fmt(sd, state, format);
>
> to match SOURCE_PAD and source_fmt.
>

Done at the expense a bit more verbose check

	if (format->pad == MALI_C55_RSZ_SINK_PAD ||
	    format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD)
		return mali_c55_rsz_set_sink_fmt(sd, state, format);

> > > +}
> > > +
> > > +static int mali_c55_rzr_get_selection(struct v4l2_subdev *sd,
> > > +				      struct v4l2_subdev_state *state,
> > > +				      struct v4l2_subdev_selection *sel)
> > > +{
> > > +	if (sel->pad != MALI_C55_RZR_SINK_PAD)
> > > +		return -EINVAL;
> > > +
> > > +	if (sel->target != V4L2_SEL_TGT_CROP &&
> > > +	    sel->target != V4L2_SEL_TGT_COMPOSE)
> > > +		return -EINVAL;
> > > +
> > > +	sel->r = sel->target == V4L2_SEL_TGT_CROP
> > > +	       ? *v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD)
> > > +	       : *v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_rzr_set_selection(struct v4l2_subdev *sd,
> > > +				      struct v4l2_subdev_state *state,
> > > +				      struct v4l2_subdev_selection *sel)
> > > +{
> > > +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
> > > +						    sd);
> > > +	struct v4l2_mbus_framefmt *source_fmt;
> > > +	struct v4l2_mbus_framefmt *sink_fmt;
> > > +	struct v4l2_rect *crop, *compose;
> > > +
> > > +	if (sel->pad != MALI_C55_RZR_SINK_PAD)
> > > +		return -EINVAL;
> > > +
> > > +	if (sel->target != V4L2_SEL_TGT_CROP &&
> > > +	    sel->target != V4L2_SEL_TGT_COMPOSE)
> > > +		return -EINVAL;
> > > +
> > > +	source_fmt = v4l2_subdev_state_get_format(state,
> > > +						  MALI_C55_RZR_SOURCE_PAD);
> > > +	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RZR_SINK_PAD);
> > > +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RZR_SINK_PAD);
> > > +	compose = v4l2_subdev_state_get_compose(state, MALI_C55_RZR_SINK_PAD);
> > > +
> > > +	/* RAW bypass disables crop/scaling. */
> > > +	if (mali_c55_format_is_raw(source_fmt->code)) {
> > > +		crop->top = compose->top = 0;
> > > +		crop->left = compose->left = 0;
> > > +		crop->width = compose->width = sink_fmt->width;
> > > +		crop->height = compose->height = sink_fmt->height;
> > > +
> > > +		sel->r = sel->target == V4L2_SEL_TGT_CROP ? *crop : *compose;
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	/* During streaming, it is allowed to only change the crop rectangle. */
> > > +	if (rzr->streaming && sel->target != V4L2_SEL_TGT_CROP)
> > > +		return -EINVAL;
> > > +
> > > +	 /*
> > > +	  * Update the desired target and then clamp the crop rectangle to the
> > > +	  * sink format sizes and the compose size to the crop sizes.
> > > +	  */
> > > +	if (sel->target == V4L2_SEL_TGT_CROP)
> > > +		*crop = sel->r;
> > > +	else
> > > +		*compose = sel->r;
> > > +
> > > +	clamp_t(unsigned int, crop->left, 0,  sink_fmt->width);
> > > +	clamp_t(unsigned int, crop->top, 0,  sink_fmt->height);
> > > +	clamp_t(unsigned int, crop->width, MALI_C55_MIN_WIDTH,
> > > +		sink_fmt->width - crop->left);
> > > +	clamp_t(unsigned int, crop->height, MALI_C55_MIN_HEIGHT,
> > > +		sink_fmt->height - crop->top);
> > > +
> > > +	if (rzr->streaming) {
> > > +		/*
> > > +		 * Apply at runtime a crop rectangle on the resizer's sink only
> > > +		 * if it doesn't require re-programming the scaler output sizes
> > > +		 * as it would require changing the output buffer sizes as well.
> > > +		 */
> > > +		if (sel->r.width < compose->width ||
> > > +		    sel->r.height < compose->height)
> > > +			return -EINVAL;
> > > +
> > > +		*crop = sel->r;
> > > +		mali_c55_rzr_program(rzr, state);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	compose->left = 0;
> > > +	compose->top = 0;
> > > +	clamp_t(unsigned int, compose->left, 0,  sink_fmt->width);
> > > +	clamp_t(unsigned int, compose->top, 0,  sink_fmt->height);
> > > +	clamp_t(unsigned int, compose->width, crop->width / 8, crop->width);
> > > +	clamp_t(unsigned int, compose->height, crop->height / 8, crop->height);
> > > +
> > > +	sel->r = sel->target == V4L2_SEL_TGT_CROP ? *crop : *compose;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_rzr_set_routing(struct v4l2_subdev *sd,
> > > +				    struct v4l2_subdev_state *state,
> > > +				    enum v4l2_subdev_format_whence which,
> > > +				    struct v4l2_subdev_krouting *routing)
> > > +{
> > > +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> > > +	    media_entity_is_streaming(&sd->entity))
> > > +		return -EBUSY;
> > > +
> > > +	return __mali_c55_rzr_set_routing(sd, state, routing);
> > > +}
> > > +
> > > +static const struct v4l2_subdev_pad_ops mali_c55_resizer_pad_ops = {
> > > +	.enum_mbus_code		= mali_c55_rzr_enum_mbus_code,
> > > +	.enum_frame_size	= mali_c55_rzr_enum_frame_size,
> > > +	.get_fmt		= v4l2_subdev_get_fmt,
> > > +	.set_fmt		= mali_c55_rzr_set_fmt,
> > > +	.get_selection		= mali_c55_rzr_get_selection,
> > > +	.set_selection		= mali_c55_rzr_set_selection,
> > > +	.set_routing		= mali_c55_rzr_set_routing,
> > > +};
> > > +
> > > +void mali_c55_rzr_start_stream(struct mali_c55_resizer *rzr)
>
> Could this be handled through the .enable_streams() and
> .disable_streams() operations ? They ensure that the stream state stored
> internal is correct. That may not matter much today, but I think it will
> become increasingly important in the future for the V4L2 core.
>
> > > +{
> > > +	struct mali_c55 *mali_c55 = rzr->mali_c55;
> > > +	struct v4l2_subdev *sd = &rzr->sd;
> > > +	struct v4l2_subdev_state *state;
> > > +	unsigned int sink_pad;
> > > +
> > > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > +
> > > +	sink_pad = mali_c55_rzr_get_active_sink(state);
> > > +	if (sink_pad == MALI_C55_RZR_SINK_BYPASS_PAD) {
> > > +		/* Bypass FR pipe processing if the bypass route is active. */
> > > +		mali_c55_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
> > > +				     MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK,
> > > +				     MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS);
> > > +		goto unlock_state;
> > > +	}
> > > +
> > > +	/* Disable bypass and use regular processing. */
> > > +	mali_c55_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
> > > +			     MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK, 0);
> > > +	mali_c55_rzr_program(rzr, state);
> > > +
> > > +unlock_state:
> > > +	rzr->streaming = true;
>
> And hopefully you'll be able to replace this with
> v4l2_subdev_is_streaming(), introduced in "[PATCH v6 00/11] media:
> subdev: Improve stream enable/disable machinery" (Sakari has sent a pull
> request for v6.11 yesterday).
>
> > > +	v4l2_subdev_unlock_state(state);
> > > +}
> > > +
> > > +void mali_c55_rzr_stop_stream(struct mali_c55_resizer *rzr)
> > > +{
> > > +	struct v4l2_subdev *sd = &rzr->sd;
> > > +	struct v4l2_subdev_state *state;
> > > +
> > > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > +	rzr->streaming = false;
> > > +	v4l2_subdev_unlock_state(state);
> > > +}
> > > +
> > > +static const struct v4l2_subdev_ops mali_c55_resizer_ops = {
> > > +	.pad	= &mali_c55_resizer_pad_ops,
> > > +};
> > > +
> > > +static int mali_c55_rzr_init_state(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_state *state)
> > > +{
> > > +	struct mali_c55_resizer *rzr = container_of(sd, struct mali_c55_resizer,
> > > +						    sd);
> > > +	struct v4l2_subdev_krouting routing = { };
> > > +	struct v4l2_subdev_route *routes;
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	routes = kcalloc(rzr->num_routes, sizeof(*routes), GFP_KERNEL);
> > > +	if (!routes)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < rzr->num_routes; ++i) {
> > > +		struct v4l2_subdev_route *route = &routes[i];
> > > +
> > > +		route->sink_pad = i
> > > +				? MALI_C55_RZR_SINK_BYPASS_PAD
> > > +				: MALI_C55_RZR_SINK_PAD;
> > > +		route->source_pad = MALI_C55_RZR_SOURCE_PAD;
> > > +		if (route->sink_pad != MALI_C55_RZR_SINK_BYPASS_PAD)
> > > +			route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> > > +	}
> > > +
> > > +	routing.num_routes = rzr->num_routes;
> > > +	routing.routes = routes;
> > > +
> > > +	ret = __mali_c55_rzr_set_routing(sd, state, &routing);
> > > +	kfree(routes);
> > > +
> > > +	return ret;
>
> I think this could be simplified.
>
> 	struct v4l2_subdev_route routes[2] = {
> 		{
> 			.sink_pad = MALI_C55_RZR_SINK_PAD,
> 			.source_pad = MALI_C55_RZR_SOURCE_PAD,
> 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> 		}, {
> 			.sink_pad = MALI_C55_RZR_SINK_BYPASS_PAD,
> 			.source_pad = MALI_C55_RZR_SOURCE_PAD,
> 		},
> 	};
> 	struct v4l2_subdev_krouting routing = {
> 		.num_routes = rzr->num_routes,
> 		.routes = routes,
> 	};
>
> 	return __mali_c55_rzr_set_routing(sd, state, &routing);
>
> > > +}
> > > +
> > > +static const struct v4l2_subdev_internal_ops mali_c55_resizer_internal_ops = {
> > > +	.init_state = mali_c55_rzr_init_state,
> > > +};
> > > +
> > > +static void mali_c55_resizer_program_coefficients(struct mali_c55 *mali_c55,
> > > +						  unsigned int index)
> > > +{
> > > +	const unsigned int scaler_filt_coefmem_addrs[][2] = {
> > > +		[MALI_C55_RZR_FR] = {
> > > +			0x034A8, /* hfilt */
> > > +			0x044A8  /* vfilt */
> >
> > Lowercase hex constants.
>
> And addresses belong to the mali-c55-registers.h file.
>
> > > +		},
> > > +		[MALI_C55_RZR_DS] = {
> > > +			0x014A8, /* hfilt */
> > > +			0x024A8  /* vfilt */
> > > +		},
> > > +	};
> > > +	unsigned int haddr = scaler_filt_coefmem_addrs[index][0];
> > > +	unsigned int vaddr = scaler_filt_coefmem_addrs[index][1];
> > > +	unsigned int i, j;
> > > +
> > > +	for (i = 0; i < MALI_C55_RESIZER_COEFS_NUM_BANKS; i++) {
> > > +		for (j = 0; j < MALI_C55_RESIZER_COEFS_NUM_ENTRIES; j++) {
> > > +			mali_c55_write(mali_c55, haddr,
> > > +				mali_c55_scaler_h_filter_coefficients[i][j]);
> > > +			mali_c55_write(mali_c55, vaddr,
> > > +				mali_c55_scaler_v_filter_coefficients[i][j]);
> > > +
> > > +			haddr += sizeof(u32);
> > > +			vaddr += sizeof(u32);
> > > +		}
> > > +	}
>
> How about memcpy_toio() ? I suppose this function isn't
> performance sensitive, so maybe usage of mali_c55_write() is better from
> a consistency point of view.
>
> > > +}
> > > +
> > > +int mali_c55_register_resizers(struct mali_c55 *mali_c55)
> > > +{
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	for (i = 0; i < MALI_C55_NUM_RZRS; ++i) {
>
> Moving the inner content to a separate mali_c55_register_resizer()
> function would increase readability I think, and remove usage of gotos.
> I would probably do the same for unregistration too, for consistency.
>
> > > +		struct mali_c55_resizer *rzr = &mali_c55->resizers[i];
> > > +		struct v4l2_subdev *sd = &rzr->sd;
> > > +		unsigned int num_pads = MALI_C55_RZR_NUM_PADS;
> > > +
> > > +		rzr->id = i;
> > > +		rzr->streaming = false;
> > > +
> > > +		if (rzr->id == MALI_C55_RZR_FR)
> > > +			rzr->cap_dev = &mali_c55->cap_devs[MALI_C55_CAP_DEV_FR];
> > > +		else
> > > +			rzr->cap_dev = &mali_c55->cap_devs[MALI_C55_CAP_DEV_DS];
> > > +
> > > +		mali_c55_resizer_program_coefficients(mali_c55, i);
>
> Should this be done at stream start, given that power may be cut off
> between streaming sessions ?
>
> > > +
> > > +		v4l2_subdev_init(sd, &mali_c55_resizer_ops);
> > > +		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE
> > > +			     | V4L2_SUBDEV_FL_STREAMS;
> > > +		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> > > +		sd->internal_ops = &mali_c55_resizer_internal_ops;
> > > +		snprintf(sd->name, ARRAY_SIZE(sd->name), "%s %s",
>
> 		snprintf(sd->name, ARRAY_SIZE(sd->name), "%s resizer %s",
>
> and drop the "resizer " prefix from mali_c55_resizer_names. You can also
> make mali_c55_resizer_names a local static const variable.
>
> > > +			 MALI_C55_DRIVER_NAME, mali_c55_resizer_names[i]);
> > > +
> > > +		rzr->pads[MALI_C55_RZR_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
> > > +		rzr->pads[MALI_C55_RZR_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
> > > +
> > > +		/* Only the FR pipe has a bypass pad. */
> > > +		if (rzr->id == MALI_C55_RZR_FR) {
> > > +			rzr->pads[MALI_C55_RZR_SINK_BYPASS_PAD].flags =
> > > +							MEDIA_PAD_FL_SINK;
> > > +			rzr->num_routes = 2;
> > > +		} else {
> > > +			num_pads -= 1;
> > > +			rzr->num_routes = 1;
> > > +		}
> > > +
> > > +		ret = media_entity_pads_init(&sd->entity, num_pads, rzr->pads);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		ret = v4l2_subdev_init_finalize(sd);
> > > +		if (ret)
> > > +			goto err_cleanup;
> > > +
> > > +		ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
> > > +		if (ret)
> > > +			goto err_cleanup;
> > > +
> > > +		rzr->mali_c55 = mali_c55;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err_cleanup:
> > > +	for (; i >= 0; --i) {
> > > +		struct mali_c55_resizer *rzr = &mali_c55->resizers[i];
> > > +		struct v4l2_subdev *sd = &rzr->sd;
> > > +
> > > +		v4l2_subdev_cleanup(sd);
> > > +		media_entity_cleanup(&sd->entity);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +void mali_c55_unregister_resizers(struct mali_c55 *mali_c55)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < MALI_C55_NUM_RZRS; i++) {
> > > +		struct mali_c55_resizer *resizer = &mali_c55->resizers[i];
> > > +
> > > +		if (!resizer->mali_c55)
> > > +			continue;
> > > +
> > > +		v4l2_device_unregister_subdev(&resizer->sd);
> > > +		v4l2_subdev_cleanup(&resizer->sd);
> > > +		media_entity_cleanup(&resizer->sd.entity);
> > > +	}
> > > +}

