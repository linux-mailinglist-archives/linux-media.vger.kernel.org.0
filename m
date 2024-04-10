Return-Path: <linux-media+bounces-9035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 884AE89F409
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 15:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC9C71C26370
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369E215ECC1;
	Wed, 10 Apr 2024 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdaHkvbC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ABE15EFD8
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755135; cv=none; b=uOAYeyPqNvwhbin+ouINYp6izK2iglDE0GmCJMF/b8suZYUfECdWOXi+qEEbywIvMInVZM1i75NljHWfMzUy0sv+6lBcowhMBMVFh6oi0wESyIylx3doqvxelA4RvDP3u30nUjARBMMeyQzeI+Vurw8q6ElVJ66L1aZPtlAIQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755135; c=relaxed/simple;
	bh=ESVthPfeIgD3fB2piH4MFitl0kE6iW98JzWxR/iI6uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX92auT/In5eMU8JG++IFc9F3q0B6cvSx/UPle1KhfYbxima2mFYHdIbyBFK8qhwb+kvLZhDfrWM3zlo8neeya+GXsDU05M52RhhjQlF0hw3TzU9FsqvUdDbpP2hadskQvYlyf07lK7Lef9IqvgLfT509GQbFYa2Kjs1wNmcR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdaHkvbC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712755133; x=1744291133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ESVthPfeIgD3fB2piH4MFitl0kE6iW98JzWxR/iI6uE=;
  b=NdaHkvbClnA7t/SmstGXMr27LY5LEw2RhqhlpItA6a4DK25do6j/zzji
   pzRO7XBGpS1lzxa/GUmqiHR4LC21RHNtlbfNyiqZhENBXX8LDo3jLIg/R
   NPHV6OAUhvWuWC2WM0l9d6tG67HG+Diq3Y1kuYkLfmCptTBUjaehMfz8g
   Je7jwtd4ByNuOkW4FCQz4tnMBLwPekT2ZTKwWOSc0nx+MGTnSp9z5C9Xv
   oaQ0LhXLnKkOE/NlHtIXR7vAj+KK3G47Ds+l7lKqDHIgmy1jJMzyrE0lC
   0HyToVVk+RnkSAlTa+0NCfjp3AOQ4Yrs8NphRTijDxEtGtN/XkaV5BBao
   Q==;
X-CSE-ConnectionGUID: 3t1Fyjo9RDyYiiocp6FUqw==
X-CSE-MsgGUID: GxK2YroxS32CHWS5882duA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7972072"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7972072"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:18:52 -0700
X-CSE-ConnectionGUID: bsAvkPWfSyKwnNJUnkRfMw==
X-CSE-MsgGUID: xQsxH8WSRLuBywCzqdjNJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25068992"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:18:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5099D1203E6;
	Wed, 10 Apr 2024 16:18:47 +0300 (EEST)
Date: Wed, 10 Apr 2024 13:18:47 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 35/38] media: ov2740: Add support for embedded data
Message-ID: <ZhaRt7nsK3YAdSj2@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-36-sakari.ailus@linux.intel.com>
 <20240321171608.GL9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321171608.GL9582@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Thu, Mar 21, 2024 at 07:16:08PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:25:13AM +0200, Sakari Ailus wrote:
> > Add support for embedded data. This introduces two internal pads for pixel
> > and embedded data streams. As the driver supports a single mode only,
> > there's no need for backward compatibility in mode selection.
> > 
> > The embedded data is configured to be placed before the image data whereas
> > after the image data is the default.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov2740.c | 150 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 137 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > index df57f0096e98..7488b2535071 100644
> > --- a/drivers/media/i2c/ov2740.c
> > +++ b/drivers/media/i2c/ov2740.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/nvmem-provider.h>
> >  #include <linux/regmap.h>
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -71,11 +72,31 @@
> >  #define OV2740_REG_ISP_CTRL00		0x5000
> >  /* ISP CTRL01 */
> >  #define OV2740_REG_ISP_CTRL01		0x5001
> > +
> > +/* Embedded data line location control */
> > +#define OV2740_REG_EMBEDDED_FLAG	0x5a08
> > +#define OV2740_EMBEDDED_FLAG_FOOTER	BIT(2) /* otherwise it's in header */
> > +#define OV2740_EMBEDDED_FLAG_MYSTERY	BIT(1)
> >  /* Customer Addresses: 0x7010 - 0x710F */
> >  #define CUSTOMER_USE_OTP_SIZE		0x100
> >  /* OTP registers from sensor */
> >  #define OV2740_REG_OTP_CUSTOMER		0x7010
> >  
> > +enum {
> > +	OV2740_PAD_SOURCE,
> > +	OV2740_PAD_PIXEL,
> > +	OV2740_PAD_META,
> > +	OV2740_NUM_PADS,
> > +};
> > +
> > +enum {
> > +	OV2740_STREAM_PIXEL,
> > +	OV2740_STREAM_META,
> > +};
> > +
> > +#define OV2740_META_WIDTH		100U /* 97 bytes of actual data */
> > +#define OV2740_META_HEIGHT		1U
> > +
> >  struct nvm_data {
> >  	struct nvmem_device *nvmem;
> >  	struct regmap *regmap;
> > @@ -513,7 +534,7 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
> >  
> >  struct ov2740 {
> >  	struct v4l2_subdev sd;
> > -	struct media_pad pad;
> > +	struct media_pad pads[OV2740_NUM_PADS];
> >  	struct v4l2_ctrl_handler ctrl_handler;
> >  
> >  	/* V4L2 Controls */
> > @@ -976,6 +997,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
> >  	if (ret)
> >  		goto out_pm_put;
> >  
> > +	ret = ov2740_write_reg(ov2740, OV2740_REG_EMBEDDED_FLAG, 1,
> > +			       OV2740_EMBEDDED_FLAG_MYSTERY);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> >  			       OV2740_MODE_STREAMING);
> >  	if (ret) {
> > @@ -1013,23 +1039,49 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
> >  	return ret;
> >  }
> >  
> > -static int ov2740_set_format(struct v4l2_subdev *sd,
> > -			     struct v4l2_subdev_state *sd_state,
> > -			     struct v4l2_subdev_format *fmt)
> > +static int __ov2740_set_format(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *sd_state,
> > +			       struct v4l2_mbus_framefmt *format,
> > +			       enum v4l2_subdev_format_whence which,
> > +			       unsigned int pad, unsigned int stream)
> >  {
> > +	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
> > +		*meta_fmt;
> >  	struct ov2740 *ov2740 = to_ov2740(sd);
> >  	const struct ov2740_mode *mode;
> >  	s32 vblank_def, h_blank;
> >  
> > +	/*
> > +	 * Allow setting format on internal pixel pad as well as the source
> > +	 * pad's pixel stream (for compatibility).
> 
> The internal image pad represents the pixel array, it should thus report
> the full pixel array size, and be unaffected by the selected mode.

Yes, I also realised this later on. I think we'll need more time to define
a proper API for sensors and thus postpone the sensor patches. :-I But I
don't see a reason to delay the rest.

> 
> > +	 */
> > +	if (pad == OV2740_PAD_SOURCE || pad == OV2740_PAD_META ||
> > +	    stream == OV2740_STREAM_META) {
> 
> As Julien pointed out, this isn't right.

I've fixed that for the next version.

> 
> > +		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
> > +		return 0;
> > +	}
> > +
> > +	pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
> > +	meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
> > +	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> > +						   OV2740_STREAM_PIXEL);
> > +	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> > +						    OV2740_STREAM_META);
> > +
> >  	mode = v4l2_find_nearest_size(ov2740->supported_modes,
> >  				      ov2740->supported_modes_count,
> >  				      width, height,
> > -				      fmt->format.width, fmt->format.height);
> > +				      format->width, format->height);
> > +	ov2740_update_pad_format(mode, pix_fmt);
> > +	*format = *src_pix_fmt = *pix_fmt;
> >  
> > -	ov2740_update_pad_format(mode, &fmt->format);
> > -	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> > +	meta_fmt->code = MEDIA_BUS_FMT_OV2740_EMBEDDED;
> > +	meta_fmt->width = OV2740_META_WIDTH;
> > +	meta_fmt->height = OV2740_META_HEIGHT;
> > +	*src_meta_fmt = *meta_fmt;
> > +	src_meta_fmt->code = MEDIA_BUS_FMT_META_10;
> >  
> > -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> >  		return 0;
> >  
> >  	ov2740->cur_mode = mode;
> > @@ -1049,6 +1101,14 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > +static int ov2740_set_format(struct v4l2_subdev *sd,
> > +			     struct v4l2_subdev_state *sd_state,
> > +			     struct v4l2_subdev_format *fmt)
> > +{
> > +	return __ov2740_set_format(sd, sd_state, &fmt->format, fmt->which,
> > +				   fmt->pad, fmt->stream);
> > +}
> > +
> >  static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
> >  				 struct v4l2_subdev_state *sd_state,
> >  				 struct v4l2_subdev_mbus_code_enum *code)
> 
> You need to update this too, to enumerate the correct format on the
> different pads and streams.
> 
> > @@ -1085,10 +1145,68 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
> >  static int ov2740_init_state(struct v4l2_subdev *sd,
> >  			     struct v4l2_subdev_state *sd_state)
> >  {
> > +	struct v4l2_subdev_route routes[] = {
> > +		{
> > +			.sink_pad = OV2740_PAD_PIXEL,
> > +			.source_pad = OV2740_PAD_SOURCE,
> > +			.source_stream = OV2740_STREAM_PIXEL,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		}, {
> > +			.sink_pad = OV2740_PAD_META,
> > +			.source_pad = OV2740_PAD_SOURCE,
> > +			.source_stream = OV2740_STREAM_META,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		},
> > +	};
> > +	struct v4l2_subdev_krouting routing = {
> > +		.routes = routes,
> > +		.num_routes = ARRAY_SIZE(routes),
> > +	};
> > +	struct v4l2_subdev_state *active_state;
> > +	struct v4l2_mbus_framefmt format = { 0 };
> >  	struct ov2740 *ov2740 = to_ov2740(sd);
> > +	int ret;
> > +
> > +	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
> > +	if (ret)
> > +		return ret;
> > +
> > +	active_state = v4l2_subdev_get_locked_active_state(sd);
> 
> There's a lockdep assertion that will trip when initializing any try
> state.

Uh-oh.

> 
> > +
> > +	ov2740_update_pad_format(&ov2740->supported_modes[0], &format);
> > +
> > +	return __ov2740_set_format(sd, sd_state, &format,
> > +				   active_state == sd_state ?
> > +				   V4L2_SUBDEV_FORMAT_ACTIVE :
> > +				   V4L2_SUBDEV_FORMAT_TRY, OV2740_PAD_PIXEL, 0);
> 
> Move the code specific to the active state from __ov2740_set_format() to
> ov2740_set_format(), and drop the which parameter to
> __ov2740_set_format(). You'll simplify the code here.

I'll see how this would work for v9.

> 
> > +}
> > +
> > +static int ov2740_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +				 struct v4l2_mbus_frame_desc *desc)
> > +{
> > +	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
> > +	struct v4l2_subdev_state *sd_state;
> > +	struct v4l2_mbus_framefmt *fmt;
> > +
> > +	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +
> > +	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> > +	fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> > +					   OV2740_STREAM_PIXEL);
> > +	entry->pixelcode = fmt->code;
> > +	v4l2_subdev_unlock_state(sd_state);
> > +
> > +	entry->stream = OV2740_STREAM_PIXEL;
> > +	entry->bus.csi2.dt = MIPI_CSI2_DT_RAW10;
> > +	entry++;
> > +	desc->num_entries++;
> 
> I think addressing entries explicitly would be clearer.
> 
> 	entry[0].stream = ...;
> 	entry[0].bus.csi2.dt = ...;
> 
> 	...
> 
> 	desc->num_entries = 2;

I think we can disagree on this. I asked you to do the other way around in
the other patch. ;-)

> 
> > +
> > +	entry->pixelcode = MEDIA_BUS_FMT_META_8;
> > +	entry->stream = OV2740_STREAM_META;
> > +	entry->bus.csi2.dt = MIPI_CSI2_DT_GENERIC_LONG(1);
> 
> As Bingbu mentioned, this is not correct.

With default settings it would have seemed to be, but I think we can switch
to the embedded data type.

> 
> > +	entry++;
> > +	desc->num_entries++;
> >  
> > -	ov2740_update_pad_format(&ov2740->supported_modes[0],
> > -				 v4l2_subdev_state_get_format(sd_state, 0));
> >  	return 0;
> >  }
> >  
> > @@ -1103,6 +1221,7 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
> >  	.enum_frame_size = ov2740_enum_frame_size,
> >  	.enable_streams = ov2740_enable_streams,
> >  	.disable_streams = ov2740_disable_streams,
> > +	.get_frame_desc = ov2740_get_frame_desc,
> >  };
> >  
> >  static const struct v4l2_subdev_ops ov2740_subdev_ops = {
> > @@ -1369,11 +1488,16 @@ static int ov2740_probe(struct i2c_client *client)
> >  	}
> >  
> >  	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
> > -	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> >  	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
> >  	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > -	ov2740->pad.flags = MEDIA_PAD_FL_SOURCE;
> > -	ret = media_entity_pads_init(&ov2740->sd.entity, 1, &ov2740->pad);
> > +	ov2740->pads[OV2740_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> > +	ov2740->pads[OV2740_PAD_PIXEL].flags =
> > +		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
> > +	ov2740->pads[OV2740_PAD_META].flags =
> > +		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
> > +	ret = media_entity_pads_init(&ov2740->sd.entity,
> > +				     ARRAY_SIZE(ov2740->pads), ov2740->pads);
> >  	if (ret) {
> >  		dev_err_probe(dev, ret, "failed to init entity pads\n");
> >  		goto probe_error_v4l2_ctrl_handler_free;
> 

-- 
Kind regards,

Sakari Ailus

