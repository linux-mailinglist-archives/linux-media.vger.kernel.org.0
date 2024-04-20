Return-Path: <linux-media+bounces-9807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 412958ABACE
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6804C1C20B1C
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119FE175A5;
	Sat, 20 Apr 2024 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h9ryMOfi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D713D9E
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713605896; cv=none; b=q/WILr31RyMv4hNBv8kVm+oA59fymgFTvul/kiu96Kg3rtbDwlzj+vIY0X4h4Ymg4Fs3XXfEVwoWlCbpNxfZVC4Tgg+1iL5w0aSZZ09sJ8qLhtRQg28rm1Hb8PyKdjUqxbqOaPd7q7gH1lzKJ/QW8dvggvudk467Sv0LeqYXUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713605896; c=relaxed/simple;
	bh=XIrU2UIGIapBtiO52+1Uu6GdyVroopzng3sTkd1CvbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDfMO6dhyr0mLf8Ubi6+7CbgqPlqoav9Bh2B1axBdrEXmk2mCPCAvHizcNgHpkq+Jw7DR+W58ivM/AT1rVHlliwLfGf376/L/P+WAHMzvm8tEjU8KWZMq5Z39n8Cvjlcog8FJDZdffXoDBkJGIKx47z/mI0JlO9MgUSUd9MGBsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h9ryMOfi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16D1A55;
	Sat, 20 Apr 2024 11:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713605844;
	bh=XIrU2UIGIapBtiO52+1Uu6GdyVroopzng3sTkd1CvbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9ryMOfi25xx0CAKW/7qxCK+4I6G9BdXO14xqXPgizdM3LZkY3AWNCJVL2TLXr4Zd
	 ghM9zqP2MSMqzq0lrPbM2fEnuPXj/lN9qj77ITH7wwjjhcDoLKMpTUZ8/UuI+mLCqG
	 1LCQsj5DCuks9eK/igPg5I3m/AK3VUToq22CXvgE=
Date: Sat, 20 Apr 2024 12:38:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 41/46] media: ov2740: Add support for embedded data
Message-ID: <20240420093804.GY6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-42-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-42-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:14PM +0300, Sakari Ailus wrote:
> Add support for embedded data. This introduces two internal pads for pixel
> and embedded data streams. As the driver supports a single mode only,
> there's no need for backward compatibility in mode selection.
> 
> The embedded data is configured to be placed before the image data whereas
> after the image data is the default.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 156 +++++++++++++++++++++++++++++++++----
>  1 file changed, 141 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index c29e9b8cde15..dc0931308053 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -11,6 +11,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/regmap.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -71,11 +72,31 @@
>  #define OV2740_REG_ISP_CTRL00		0x5000
>  /* ISP CTRL01 */
>  #define OV2740_REG_ISP_CTRL01		0x5001
> +
> +/* Embedded data line location control */
> +#define OV2740_REG_EMBEDDED_FLAG	0x5a08
> +#define OV2740_EMBEDDED_FLAG_FOOTER	BIT(2) /* otherwise it's in header */
> +#define OV2740_EMBEDDED_FLAG_MYSTERY	BIT(1)
>  /* Customer Addresses: 0x7010 - 0x710F */
>  #define CUSTOMER_USE_OTP_SIZE		0x100
>  /* OTP registers from sensor */
>  #define OV2740_REG_OTP_CUSTOMER		0x7010
>  
> +enum {
> +	OV2740_PAD_SOURCE,
> +	OV2740_PAD_PIXEL,
> +	OV2740_PAD_META,
> +	OV2740_NUM_PADS,
> +};
> +
> +enum {
> +	OV2740_STREAM_PIXEL,
> +	OV2740_STREAM_META,
> +};
> +
> +#define OV2740_META_WIDTH		100U
> +#define OV2740_META_HEIGHT		1U
> +
>  struct nvm_data {
>  	struct nvmem_device *nvmem;
>  	struct regmap *regmap;
> @@ -149,6 +170,7 @@ static const struct ov2740_reg mode_1932x1092_regs_360mhz[] = {
>  	{0x3000, 0x00},
>  	{0x3018, 0x32},
>  	{0x3031, 0x0a},
> +	{0x3036, 0x12},

Please name this register and document the value.

>  	{0x3080, 0x08},
>  	{0x3083, 0xB4},
>  	{0x3103, 0x00},
> @@ -253,7 +275,7 @@ static const struct ov2740_reg mode_1932x1092_regs_360mhz[] = {
>  	{0x4017, 0x10},
>  	{0x4044, 0x02},
>  	{0x4304, 0x08},
> -	{0x4307, 0x30},
> +	{0x4307, 0x31},

Same here.

>  	{0x4320, 0x80},
>  	{0x4322, 0x00},
>  	{0x4323, 0x00},
> @@ -302,6 +324,7 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
>  	{0x3000, 0x00},
>  	{0x3018, 0x32},	/* 0x32 for 2 lanes, 0x12 for 1 lane */
>  	{0x3031, 0x0a},
> +	{0x3036, 0x12},
>  	{0x3080, 0x08},
>  	{0x3083, 0xB4},
>  	{0x3103, 0x00},
> @@ -406,7 +429,7 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
>  	{0x4017, 0x10},
>  	{0x4044, 0x02},
>  	{0x4304, 0x08},
> -	{0x4307, 0x30},
> +	{0x4307, 0x31},
>  	{0x4320, 0x80},
>  	{0x4322, 0x00},
>  	{0x4323, 0x00},
> @@ -513,7 +536,7 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
>  
>  struct ov2740 {
>  	struct v4l2_subdev sd;
> -	struct media_pad pad;
> +	struct media_pad pads[OV2740_NUM_PADS];
>  	struct v4l2_ctrl_handler ctrl_handler;
>  
>  	/* V4L2 Controls */
> @@ -973,6 +996,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto out_pm_put;
>  
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_EMBEDDED_FLAG, 1,
> +			       OV2740_EMBEDDED_FLAG_MYSTERY);
> +	if (ret)
> +		goto out_pm_put;
> +
>  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>  			       OV2740_MODE_STREAMING);
>  	if (ret) {
> @@ -1010,23 +1038,49 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -static int ov2740_set_format(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_state *sd_state,
> -			     struct v4l2_subdev_format *fmt)
> +static int __ov2740_set_format(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_mbus_framefmt *format,
> +			       enum v4l2_subdev_format_whence which,
> +			       unsigned int pad, unsigned int stream)
>  {
> +	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
> +		*meta_fmt;
>  	struct ov2740 *ov2740 = to_ov2740(sd);
>  	const struct ov2740_mode *mode;
>  	s32 vblank_def, h_blank;
>  
> +	/*
> +	 * Allow setting format on internal pixel pad as well as the source
> +	 * pad's pixel stream (for compatibility).
> +	 */

As mentioned in the review of v8, the internal image pad represents the
pixel array, it should thus report the full pixel array size, and be
unaffected by the selected mode. We need to discuss how to expose raw
sensor parameters to userspace, which will affect this patch. I don't
think it's a good idea to expose a non-standard behaviour to userspace
before we agree on how to standardize it.

> +	if ((pad == OV2740_PAD_SOURCE && stream == OV2740_STREAM_META) ||
> +	    pad == OV2740_PAD_META) {
> +		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
> +		return 0;
> +	}
> +
> +	pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
> +	meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
> +	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> +						   OV2740_STREAM_PIXEL);
> +	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> +						    OV2740_STREAM_META);
> +
>  	mode = v4l2_find_nearest_size(ov2740->supported_modes,
>  				      ov2740->supported_modes_count,
>  				      width, height,
> -				      fmt->format.width, fmt->format.height);
> +				      format->width, format->height);
> +	ov2740_update_pad_format(mode, pix_fmt);
> +	*format = *src_pix_fmt = *pix_fmt;
>  
> -	ov2740_update_pad_format(mode, &fmt->format);
> -	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +	meta_fmt->code = MEDIA_BUS_FMT_OV2740_EMBEDDED;
> +	meta_fmt->width = OV2740_META_WIDTH;
> +	meta_fmt->height = OV2740_META_HEIGHT;
> +	*src_meta_fmt = *meta_fmt;
> +	src_meta_fmt->code = MEDIA_BUS_FMT_META_10;
>  
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
>  		return 0;
>  
>  	ov2740->cur_mode = mode;
> @@ -1046,6 +1100,14 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ov2740_set_format(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *sd_state,
> +			     struct v4l2_subdev_format *fmt)
> +{
> +	return __ov2740_set_format(sd, sd_state, &fmt->format, fmt->which,
> +				   fmt->pad, fmt->stream);
> +}
> +
>  static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -1082,10 +1144,68 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
>  static int ov2740_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = OV2740_PAD_PIXEL,
> +			.source_pad = OV2740_PAD_SOURCE,
> +			.source_stream = OV2740_STREAM_PIXEL,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		}, {
> +			.sink_pad = OV2740_PAD_META,
> +			.source_pad = OV2740_PAD_SOURCE,
> +			.source_stream = OV2740_STREAM_META,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.routes = routes,
> +		.num_routes = ARRAY_SIZE(routes),
> +	};
> +	struct v4l2_subdev_state *active_state;
> +	struct v4l2_mbus_framefmt format = { 0 };
>  	struct ov2740 *ov2740 = to_ov2740(sd);
> +	int ret;
> +
> +	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
> +	if (ret)
> +		return ret;
> +
> +	active_state = v4l2_subdev_get_locked_active_state(sd);

There's a lockdep assertion that will trip when initializing any try
state.

I'll stop reviewing this as comments on v8 haven't been taken into
account. Please revisit them for v10.

> +
> +	ov2740_update_pad_format(&ov2740->supported_modes[0], &format);
> +
> +	return __ov2740_set_format(sd, sd_state, &format,
> +				   active_state == sd_state ?
> +				   V4L2_SUBDEV_FORMAT_ACTIVE :
> +				   V4L2_SUBDEV_FORMAT_TRY, OV2740_PAD_PIXEL, 0);
> +}
> +
> +static int ov2740_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
> +	struct v4l2_subdev_state *sd_state;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> +					   OV2740_STREAM_PIXEL);
> +	entry->pixelcode = fmt->code;
> +	v4l2_subdev_unlock_state(sd_state);
> +
> +	entry->stream = OV2740_STREAM_PIXEL;
> +	entry->bus.csi2.dt = MIPI_CSI2_DT_RAW10;
> +	entry++;
> +	desc->num_entries++;
> +
> +	entry->pixelcode = MEDIA_BUS_FMT_META_10;
> +	entry->stream = OV2740_STREAM_META;
> +	entry->bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
> +	entry++;
> +	desc->num_entries++;
>  
> -	ov2740_update_pad_format(&ov2740->supported_modes[0],
> -				 v4l2_subdev_state_get_format(sd_state, 0));
>  	return 0;
>  }
>  
> @@ -1100,6 +1220,7 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
>  	.enum_frame_size = ov2740_enum_frame_size,
>  	.enable_streams = ov2740_enable_streams,
>  	.disable_streams = ov2740_disable_streams,
> +	.get_frame_desc = ov2740_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops ov2740_subdev_ops = {
> @@ -1366,11 +1487,16 @@ static int ov2740_probe(struct i2c_client *client)
>  	}
>  
>  	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
> -	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
>  	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> -	ov2740->pad.flags = MEDIA_PAD_FL_SOURCE;
> -	ret = media_entity_pads_init(&ov2740->sd.entity, 1, &ov2740->pad);
> +	ov2740->pads[OV2740_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	ov2740->pads[OV2740_PAD_PIXEL].flags =
> +		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
> +	ov2740->pads[OV2740_PAD_META].flags =
> +		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
> +	ret = media_entity_pads_init(&ov2740->sd.entity,
> +				     ARRAY_SIZE(ov2740->pads), ov2740->pads);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "failed to init entity pads\n");
>  		goto probe_error_v4l2_ctrl_handler_free;

-- 
Regards,

Laurent Pinchart

