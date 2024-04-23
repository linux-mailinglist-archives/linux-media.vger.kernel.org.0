Return-Path: <linux-media+bounces-9931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F598AE611
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 14:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC8601F2570F
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D9485631;
	Tue, 23 Apr 2024 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxADz6sK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF1138DD8
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713875611; cv=none; b=qwb8oNXBjTLIhJEasrxJobt11cXbq0fJKzgE5s2YHsfGkea9YW7ZmFAlSzEt1qNleAc1F9vMzPHUJsDRVFJL4DZwpcEku1zTx7riGYrs/RmtNM7+AuA9zIdIEwsJajA11WAVc4VA4kVIwI13i9AYlpB/0zZTwbR+nf/BT1S/PiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713875611; c=relaxed/simple;
	bh=y7jpsdm+lhClNSZvhHpj/eKLgqzKG0KY9YoCscGzIMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2eibDSHEI3HzYebr5Rr2oZ9z4z98Lhl/baJEQoYTyLbU/uMvwIHB0LCk1Jq8JIBQeB2SUlwi6ZZ/ZPpGzeBr1DfJECTG7BBdKepbnZ4GniwUtjJovozw9vSCv6EMXXx8v5u88ftG2bqo4kcwtNn7zEx0b1Z2V0vzizIWBZtJVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxADz6sK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713875610; x=1745411610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y7jpsdm+lhClNSZvhHpj/eKLgqzKG0KY9YoCscGzIMU=;
  b=SxADz6sKFyERmWTyCWM3S0AsvetkTjkxsSuZ1KY7FWsxtMxCE5riXEmK
   O5BIp/uE7VDgnCGXh4tPluYK6tl1A6UBKFdLnyYgnARSv5B7ZZ5ZlSJfu
   jd41/tFVsMqS2zHbP/o8Ow2MwSn7AQjZlY/V8v3htbAQKLFPf8UHVut3G
   7gp0+ZwMklxlKrYzNAdDFTHy4CZnmcTl2v09D0ppc8QWU6KBi0YUDi+Qz
   x0LYX9iFwlXkApeOLgqLiLkah286eVcGFb1n29rfsJEBFXUHh5CTjMrGR
   DCYL9A/Yav/fhvq85UqJg++gzf/Q8nvh1BF1Mx+6X1TcbAOVLR/kzVV1w
   A==;
X-CSE-ConnectionGUID: BVMrW4OxTVqWbEMuQaMp6A==
X-CSE-MsgGUID: kizzvY9kTDWlaidlIhjncw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13290146"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="13290146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 05:33:29 -0700
X-CSE-ConnectionGUID: ZifsqQjtS5yeI1qhFm5H5g==
X-CSE-MsgGUID: BRnoB6U7Qt6kd1T9vCi9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29152865"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 05:33:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4BD9E11FCCF;
	Tue, 23 Apr 2024 15:33:23 +0300 (EEST)
Date: Tue, 23 Apr 2024 12:33:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 30/46] media: ccs: Add support for embedded data stream
Message-ID: <Zieqk9uwEwDlFQhm@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-31-sakari.ailus@linux.intel.com>
 <20240420085949.GS6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420085949.GS6414@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Apr 20, 2024 at 11:59:49AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review!

> 
> On Tue, Apr 16, 2024 at 10:33:03PM +0300, Sakari Ailus wrote:
> > Add support for embedded data stream, in UAPI and frame descriptor.
> > 
> > This patch adds also a new embedded data pad (2) to the source sub-device.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 372 +++++++++++++++++++++++++++++--
> >  drivers/media/i2c/ccs/ccs.h      |  18 +-
> >  2 files changed, 362 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 3ca2415fca3b..ba629eafec43 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -1903,6 +1903,13 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
> >  	if (rval < 0)
> >  		goto err_pm_put;
> >  
> > +	/* Configure embedded data */
> > +	if (sensor->csi_format->compressed >= 16) {
> > +		rval = ccs_write(sensor, EMB_DATA_CTRL, sensor->emb_data_ctrl);
> > +		if (rval < 0)
> > +			goto err_pm_put;
> > +	}
> > +
> >  	if (CCS_LIM(sensor, FLASH_MODE_CAPABILITY) &
> >  	    (CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE |
> >  	     SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE) &&
> > @@ -2022,6 +2029,57 @@ static const struct ccs_csi_data_format
> >  	return sensor->csi_format;
> >  }
> >  
> > +#define CCS_EMBEDDED_CODE_DEPTH(depth, half_depth)			\
> > +	depth,								\
> > +	CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW##depth,		\
> > +	CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW##depth,		\
> > +	CCS_EMB_DATA_CTRL_RAW##half_depth##_PACKING_FOR_RAW##depth,	\
> > +	MEDIA_BUS_FMT_META_##half_depth,				\
> > +	MEDIA_BUS_FMT_META_##depth,					\
> > +
> > +static const struct ccs_embedded_code {
> > +	u8 depth;
> > +	u8 cap_two_bytes_per_sample;
> > +	u8 cap_no_legacy;
> > +	u8 ctrl;
> > +	u32 code_two_bytes;
> > +	u32 code_legacy;
> > +} ccs_embedded_codes[] = {
> > +	{ CCS_EMBEDDED_CODE_DEPTH(16, 8) },
> > +	{ CCS_EMBEDDED_CODE_DEPTH(20, 10) },
> > +	{ CCS_EMBEDDED_CODE_DEPTH(24, 12) },
> > +};
> > +
> > +static const struct ccs_embedded_code *ccs_embedded_code(unsigned int bpp)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(ccs_embedded_codes); i++)
> > +		if (ccs_embedded_codes[i].depth == bpp)
> > +			return ccs_embedded_codes + i;
> > +
> > +	WARN_ON(1);
> > +
> > +	return ccs_embedded_codes;
> > +}
> > +
> > +static u32
> > +ccs_default_embedded_code(struct ccs_sensor *sensor,
> > +			  const struct ccs_embedded_code *embedded_code)
> > +{
> > +	if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
> > +	    BIT(embedded_code->cap_two_bytes_per_sample))
> > +		return embedded_code->code_two_bytes;
> > +
> > +	if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
> > +	      BIT(embedded_code->cap_no_legacy)))
> > +		return embedded_code->code_legacy;
> > +
> > +	WARN_ON(1);
> > +
> > +	return embedded_code->code_legacy;
> > +}
> > +
> >  static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
> >  			      struct v4l2_subdev_state *sd_state,
> >  			      struct v4l2_subdev_mbus_code_enum *code)
> > @@ -2037,6 +2095,69 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
> >  	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
> >  		subdev->name, code->pad, code->index);
> >  
> > +	if (subdev == &sensor->src->sd) {
> > +		if (code->pad == CCS_PAD_META) {
> > +			if (code->index)
> > +				goto out;
> > +
> > +			code->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
> > +
> > +			rval = 0;
> > +			goto out;
> > +		}
> > +		if (code->stream == CCS_STREAM_META) {
> > +			struct v4l2_mbus_framefmt *pix_fmt =
> > +				v4l2_subdev_state_get_format(sd_state,
> > +							     CCS_PAD_SRC,
> > +							     CCS_STREAM_PIXEL);
> > +			const struct ccs_csi_data_format *csi_format =
> > +				ccs_validate_csi_data_format(sensor,
> > +							     pix_fmt->code);
> > +			unsigned int i = 0;
> > +			u32 codes[2];
> > +
> > +			switch (csi_format->compressed) {
> > +			case 8:
> > +				codes[i++] = MEDIA_BUS_FMT_META_8;
> > +				break;
> > +			case 10:
> > +				codes[i++] = MEDIA_BUS_FMT_META_10;
> > +				break;
> > +			case 12:
> > +				codes[i++] = MEDIA_BUS_FMT_META_12;
> > +				break;
> > +			case 14:
> > +				codes[i++] = MEDIA_BUS_FMT_META_14;
> > +				break;
> > +			case 16:
> > +			case 20:
> > +			case 24: {
> > +				const struct ccs_embedded_code *embedded_code =
> > +					ccs_embedded_code(csi_format->compressed);
> > +
> > +				if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
> > +				    BIT(embedded_code->cap_two_bytes_per_sample))
> > +					codes[i++] =
> > +						embedded_code->code_two_bytes;
> > +
> > +				if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
> > +				      BIT(embedded_code->cap_no_legacy)))
> > +					codes[i++] = embedded_code->code_legacy;
> > +				break;
> > +			}
> > +			default:
> > +				WARN_ON(1);
> > +			}
> > +
> > +			if (WARN_ON(i > ARRAY_SIZE(codes)) || code->index >= i)
> > +				goto out;
> > +
> > +			code->code = codes[code->index];
> > +			rval = 0;
> > +			goto out;
> > +		}
> > +	}
> > +
> >  	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
> >  		if (code->index)
> >  			goto out;
> > @@ -2079,8 +2200,11 @@ static int __ccs_get_format(struct v4l2_subdev *subdev,
> >  			    struct v4l2_subdev_state *sd_state,
> >  			    struct v4l2_subdev_format *fmt)
> >  {
> > -	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > -	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
> > +	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad,
> > +						    fmt->stream);
> > +
> > +	if (fmt->pad != CCS_PAD_META && fmt->stream != CCS_STREAM_META)
> > +		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
> >  
> >  	return 0;
> >  }
> > @@ -2110,10 +2234,11 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
> >  	if (crops)
> >  		for (i = 0; i < subdev->entity.num_pads; i++)
> >  			crops[i] =
> > -				v4l2_subdev_state_get_crop(sd_state, i);
> > +				v4l2_subdev_state_get_crop(sd_state, i,
> > +							   CCS_STREAM_PIXEL);
> >  	if (comps)
> > -		*comps = v4l2_subdev_state_get_compose(sd_state,
> > -						       ssd->sink_pad);
> > +		*comps = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> > +						       CCS_STREAM_PIXEL);
> 
> This hunk and the next one could have been moved to the patch that
> introduced CCS_STREAM_PIXEL. Same for the change in __ccs_init_state()
> below.

Sounds good.

> 
> >  }
> >  
> >  /* Changes require propagation only on sink pad. */
> > @@ -2146,7 +2271,8 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
> >  		fallthrough;
> >  	case V4L2_SEL_TGT_COMPOSE:
> >  		*crops[CCS_PAD_SRC] = *comp;
> > -		fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
> > +		fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
> > +						   CCS_STREAM_PIXEL);
> >  		fmt->width = comp->width;
> >  		fmt->height = comp->height;
> >  		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
> > @@ -2210,6 +2336,83 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> >  	return ccs_pll_update(sensor);
> >  }
> >  
> > +static int ccs_set_format_meta(struct v4l2_subdev *subdev,
> > +			       struct v4l2_subdev_state *sd_state,
> > +			       struct v4l2_mbus_framefmt *fmt)
> > +{
> > +	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > +	const struct ccs_csi_data_format *csi_format;
> > +	struct v4l2_mbus_framefmt *pix_fmt;
> > +	struct v4l2_mbus_framefmt *meta_fmt;
> > +	struct v4l2_mbus_framefmt *meta_out_fmt;
> > +	u32 code;
> > +
> > +	pix_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
> > +					       CCS_STREAM_PIXEL);
> > +	meta_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_META, 0);
> > +	meta_out_fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
> > +						    CCS_STREAM_META);
> > +
> > +	code = fmt ? fmt->code : meta_out_fmt->code;
> 
> When this function is called from __ccs_init_state(), fmt will be NULL,
> and meta_out_fmt will be uninitialized. Is this intended ?

Not uninitialised but zero. I'll use zero explicitly instead.

> 
> > +
> > +	meta_out_fmt->width = meta_fmt->width = pix_fmt->width;
> > +	meta_out_fmt->height = meta_fmt->height =
> > +		sensor->embedded_end - sensor->embedded_start;
> > +	meta_fmt->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
> > +
> > +	csi_format = ccs_validate_csi_data_format(sensor, pix_fmt->code);
> > +
> > +	switch (csi_format->compressed) {
> > +	case 8:
> > +		meta_out_fmt->code = MEDIA_BUS_FMT_META_8;
> > +		break;
> > +	case 10:
> > +		meta_out_fmt->code = MEDIA_BUS_FMT_META_10;
> > +		break;
> > +	case 12:
> > +		meta_out_fmt->code = MEDIA_BUS_FMT_META_12;
> > +		break;
> > +	case 14:
> > +		meta_out_fmt->code = MEDIA_BUS_FMT_META_14;
> > +		break;
> > +	case 16:
> > +	case 20:
> > +	case 24: {
> > +		const struct ccs_embedded_code *embedded_code;
> > +
> > +		embedded_code = ccs_embedded_code(csi_format->compressed);
> > +		meta_out_fmt->code =
> > +			ccs_default_embedded_code(sensor, embedded_code);
> > +
> > +		if (!(CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
> > +		      BIT(embedded_code->cap_no_legacy)) &&
> > +		    code == embedded_code->code_legacy) {
> > +			meta_out_fmt->code = embedded_code->code_legacy;
> > +			sensor->emb_data_ctrl = 0;
> > +		}
> > +
> > +		if (CCS_LIM(sensor, EMB_DATA_CAPABILITY) &
> > +		    BIT(embedded_code->cap_two_bytes_per_sample) &&
> > +		    code == embedded_code->code_two_bytes) {
> > +			meta_out_fmt->code = embedded_code->code_two_bytes;
> > +			sensor->emb_data_ctrl = embedded_code->ctrl;
> > +			meta_fmt->width <<= 1;
> > +			meta_out_fmt->width <<= 1;
> > +		}
> > +
> > +		break;
> > +	}
> > +	default:
> > +		WARN_ON(1);
> > +		return 0;
> > +	}
> > +
> > +	if (fmt)
> > +		*fmt = *meta_out_fmt;
> > +
> > +	return 0;
> > +}
> > +
> >  static int ccs_set_format(struct v4l2_subdev *subdev,
> >  			  struct v4l2_subdev_state *sd_state,
> >  			  struct v4l2_subdev_format *fmt)
> > @@ -2218,12 +2421,25 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
> >  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> >  	struct v4l2_rect *crops[CCS_PADS];
> >  
> > +	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
> 
> You could also write
> 
> 	if (ssd == sensor->src && fmt->pad == CCS_PAD_META)

Sounds good.

> 
> Same below.
> 
> > +		return ccs_get_format(subdev, sd_state, fmt);
> > +
> >  	mutex_lock(&sensor->mutex);
> 
> Is this needed, shouldn't the state lock be enough ?

Not while the access to the device's state is serialised using the driver's
own mutex. This changes two patches later though.

> 
> >  
> > +	if (subdev == &sensor->src->sd && fmt->stream == CCS_STREAM_META) {
> > +		ccs_set_format_meta(subdev, sd_state, &fmt->format);
> > +
> > +		mutex_unlock(&sensor->mutex);
> > +
> > +		return 0;
> > +	}
> > +
> >  	if (fmt->pad == ssd->source_pad) {
> >  		int rval;
> >  
> >  		rval = ccs_set_format_source(subdev, sd_state, fmt);
> > +		if (sensor->embedded_start != sensor->embedded_end)
> 
> A ccs_sensor_has_embedded_data() (name bikeshedding allowed) inline
> helper could be nice to replace this manual check could be nice, as you
> do the same in many locations below.

Sounds good.

> 
> > +			ccs_set_format_meta(subdev, sd_state, NULL);
> 
> This doesn't seem correct, you shouldn't set the metadata format on
> subdevs that are not the source subdev.

Good point. I'll add a check.

> 
> A comment to explain how the metadata format is propagated would also be
> useful.

I'll add this to the documentation patch which actually could be better
after this patch, not before.

> 
> >  
> >  		mutex_unlock(&sensor->mutex);
> >  
> > @@ -2498,6 +2714,12 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
> >  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> >  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> >  
> > +	if (sel->stream != CCS_STREAM_PIXEL)
> > +		return -EINVAL;
> > +
> > +	if (sel->pad == CCS_PAD_META)
> > +		return -EINVAL;
> > +
> >  	/* We only implement crop in three places. */
> >  	switch (sel->target) {
> >  	case V4L2_SEL_TGT_CROP:
> > @@ -2542,7 +2764,8 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
> >  
> >  	if (sel->pad == ssd->sink_pad) {
> >  		struct v4l2_mbus_framefmt *mfmt =
> > -			v4l2_subdev_state_get_format(sd_state, sel->pad);
> > +			v4l2_subdev_state_get_format(sd_state, sel->pad,
> > +						     CCS_STREAM_PIXEL);
> >  
> >  		src_size.width = mfmt->width;
> >  		src_size.height = mfmt->height;
> > @@ -2603,7 +2826,9 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
> >  		} else if (sel->pad == ssd->sink_pad) {
> >  			struct v4l2_mbus_framefmt *sink_fmt =
> >  				v4l2_subdev_state_get_format(sd_state,
> > -							     ssd->sink_pad);
> > +							     ssd->sink_pad,
> > +							     CCS_STREAM_PIXEL);
> > +
> >  			sel->r.top = sel->r.left = 0;
> >  			sel->r.width = sink_fmt->width;
> >  			sel->r.height = sink_fmt->height;
> > @@ -2686,6 +2911,14 @@ static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> >  	entry++;
> >  	desc->num_entries++;
> >  
> > +	if (sensor->embedded_start != sensor->embedded_end) {
> > +		entry->pixelcode = MEDIA_BUS_FMT_CCS_EMBEDDED;
> 
> I think you need to report the generic pixel code here.

I'll fix that for v10.

> 
> > +		entry->stream = CCS_STREAM_META;
> > +		entry->bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
> > +		entry++;
> > +		desc->num_entries++;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -3004,6 +3237,8 @@ static void ccs_cleanup(struct ccs_sensor *sensor)
> >  	ccs_free_controls(sensor);
> >  }
> >  
> > +static const struct v4l2_subdev_internal_ops ccs_internal_ops;
> > +
> >  static int ccs_init_subdev(struct ccs_sensor *sensor,
> >  			   struct ccs_subdev *ssd, const char *name,
> >  			   unsigned short num_pads, u32 function,
> > @@ -3016,15 +3251,18 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
> >  	if (!ssd)
> >  		return 0;
> >  
> > -	if (ssd != sensor->src)
> > +	if (ssd != sensor->src) {
> >  		v4l2_subdev_init(&ssd->sd, &ccs_ops);
> > +		ssd->sd.internal_ops = &ccs_internal_ops;
> > +	}
> >  
> >  	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >  	ssd->sd.entity.function = function;
> >  	ssd->sensor = sensor;
> >  
> >  	ssd->npads = num_pads;
> > -	ssd->source_pad = num_pads - 1;
> > +	ssd->source_pad =
> > +		ssd == sensor->pixel_array ? CCS_PA_PAD_SRC : CCS_PAD_SRC;
> >  
> >  	v4l2_i2c_subdev_set_name(&ssd->sd, client, sensor->minfo.name, name);
> >  
> > @@ -3038,6 +3276,10 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
> >  		ssd->sd.owner = THIS_MODULE;
> >  		ssd->sd.dev = &client->dev;
> >  		v4l2_set_subdevdata(&ssd->sd, client);
> > +	} else {
> > +		ssd->sd.flags |= V4L2_SUBDEV_FL_STREAMS;
> > +		ssd->pads[CCS_PAD_META].flags =
> > +			MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
> >  	}
> >  
> >  	rval = media_entity_pads_init(&ssd->sd.entity, ssd->npads, ssd->pads);
> > @@ -3055,21 +3297,19 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
> >  	return 0;
> >  }
> >  
> > -static int ccs_init_state(struct v4l2_subdev *sd,
> > -			  struct v4l2_subdev_state *sd_state)
> > +static int __ccs_init_state(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *sd_state)
> >  {
> >  	struct ccs_subdev *ssd = to_ccs_subdev(sd);
> >  	struct ccs_sensor *sensor = ssd->sensor;
> >  	unsigned int pad = ssd == sensor->pixel_array ?
> >  		CCS_PA_PAD_SRC : CCS_PAD_SINK;
> >  	struct v4l2_mbus_framefmt *fmt =
> > -		v4l2_subdev_state_get_format(sd_state, pad);
> > +		v4l2_subdev_state_get_format(sd_state, pad, CCS_STREAM_PIXEL);
> >  	struct v4l2_rect *crop =
> > -		v4l2_subdev_state_get_crop(sd_state, pad);
> > +		v4l2_subdev_state_get_crop(sd_state, pad, CCS_STREAM_PIXEL);
> >  	bool is_active = !sd->active_state || sd->active_state == sd_state;
> >  
> > -	mutex_lock(&sensor->mutex);
> > -
> >  	ccs_get_native_size(ssd, crop);
> >  
> >  	fmt->width = crop->width;
> > @@ -3081,20 +3321,78 @@ static int ccs_init_state(struct v4l2_subdev *sd,
> >  		if (is_active)
> >  			sensor->pa_src = *crop;
> >  
> > -		mutex_unlock(&sensor->mutex);
> >  		return 0;
> >  	}
> >  
> > -	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
> > +	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
> > +					   CCS_STREAM_PIXEL);
> >  	fmt->code = ssd == sensor->src ?
> >  		sensor->csi_format->code : sensor->internal_csi_format->code;
> >  	fmt->field = V4L2_FIELD_NONE;
> >  
> >  	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
> >  
> > +	return 0;
> > +}
> > +
> > +static int ccs_init_state(struct v4l2_subdev *sd,
> > +			  struct v4l2_subdev_state *sd_state)
> > +{
> > +	struct ccs_subdev *ssd = to_ccs_subdev(sd);
> > +	struct ccs_sensor *sensor = ssd->sensor;
> > +	int rval;
> > +
> > +	mutex_lock(&sensor->mutex);
> > +	rval = __ccs_init_state(sd, sd_state);
> >  	mutex_unlock(&sensor->mutex);
> >  
> > -	return 0;
> > +	return rval;
> > +}
> > +
> > +static int ccs_src_init_state(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_state *sd_state)
> > +{
> > +	struct v4l2_subdev_route routes[] = {
> > +		{
> > +			.sink_pad = CCS_PAD_SINK,
> > +			.source_pad = CCS_PAD_SRC,
> > +			.source_stream = CCS_STREAM_PIXEL,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		}, {
> > +			.sink_pad = CCS_PAD_META,
> > +			.source_pad = CCS_PAD_SRC,
> > +			.source_stream = CCS_STREAM_META,
> > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +		}
> > +	};
> > +	struct v4l2_subdev_krouting routing = {
> > +		.routes = routes,
> > +		.num_routes = 1,
> > +	};
> > +	struct ccs_subdev *ssd = to_ccs_subdev(sd);
> > +	struct ccs_sensor *sensor = ssd->sensor;
> > +	int rval;
> > +
> > +	mutex_lock(&sensor->mutex);
> 
> Is this needed, shouldn't the state lock be enough ?

Same as for the other mutex: this will no longer be needed after relying on
the state locks for locking, two patches later.

> 
> > +
> > +	if (sensor->embedded_start != sensor->embedded_end)
> > +		routing.num_routes++;
> > +
> > +	rval = v4l2_subdev_set_routing(sd, sd_state, &routing);
> > +	if (rval)
> > +		goto out;
> > +
> > +	rval = __ccs_init_state(sd, sd_state);
> > +	if (rval)
> > +		goto out;
> > +
> > +	if (sensor->embedded_start != sensor->embedded_end)
> > +		ccs_set_format_meta(sd, sd_state, NULL);
> > +
> > +out:
> > +	mutex_unlock(&sensor->mutex);
> > +
> > +	return rval;
> >  }
> >  
> >  static const struct v4l2_subdev_video_ops ccs_video_ops = {
> > @@ -3109,6 +3407,14 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
> >  	.set_fmt = ccs_set_format,
> >  	.get_selection = ccs_get_selection,
> >  	.set_selection = ccs_set_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops ccs_src_pad_ops = {
> > +	.enum_mbus_code = ccs_enum_mbus_code,
> > +	.get_fmt = ccs_get_format,
> 
> I'm surprised you need to implement .get_fmt(). The
> v4l2_subdev_get_fmt() helper should have been enough.

It should be possible to get rid of that now, too. I'll add a new patch for
this.

> 
> > +	.set_fmt = ccs_set_format,
> > +	.get_selection = ccs_get_selection,
> > +	.set_selection = ccs_set_selection,
> >  	.enable_streams = ccs_enable_streams,
> >  	.disable_streams = ccs_disable_streams,
> >  	.get_frame_desc = ccs_get_frame_desc,
> > @@ -3125,12 +3431,22 @@ static const struct v4l2_subdev_ops ccs_ops = {
> >  	.sensor = &ccs_sensor_ops,
> >  };
> >  
> > +static const struct v4l2_subdev_ops ccs_src_ops = {
> > +	.video = &ccs_video_ops,
> > +	.pad = &ccs_src_pad_ops,
> > +	.sensor = &ccs_sensor_ops,
> > +};
> > +
> >  static const struct media_entity_operations ccs_entity_ops = {
> >  	.link_validate = v4l2_subdev_link_validate,
> >  };
> >  
> > -static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
> > +static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
> >  	.init_state = ccs_init_state,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops ccs_src_internal_ops = {
> > +	.init_state = ccs_src_init_state,
> >  	.registered = ccs_registered,
> >  	.unregistered = ccs_unregistered,
> >  };
> > @@ -3281,8 +3597,8 @@ static int ccs_probe(struct i2c_client *client)
> >  
> >  	sensor->src = &sensor->ssds[sensor->ssds_used];
> >  
> > -	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
> > -	sensor->src->sd.internal_ops = &ccs_internal_src_ops;
> > +	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_src_ops);
> > +	sensor->src->sd.internal_ops = &ccs_src_internal_ops;
> >  
> >  	sensor->regulators = devm_kcalloc(&client->dev,
> >  					  ARRAY_SIZE(ccs_regulators),
> > @@ -3553,12 +3869,20 @@ static int ccs_probe(struct i2c_client *client)
> >  		goto out_cleanup;
> >  	}
> >  
> > -	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
> > +	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler",
> > +			       sensor->ssds_used != CCS_SUBDEVS ?
> > +			       CCS_PADS_NOMETA :
> > +			       sensor->embedded_start == sensor->embedded_end ?
> > +			       CCS_PADS_NOMETA : CCS_PADS,
> >  			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
> >  			       "ccs scaler mutex", &scaler_lock_key);
> >  	if (rval)
> >  		goto out_cleanup;
> > -	rval = ccs_init_subdev(sensor, sensor->binner, " binner", 2,
> > +	rval = ccs_init_subdev(sensor, sensor->binner, " binner",
> > +			       sensor->ssds_used == CCS_SUBDEVS ?
> > +			       CCS_PADS_NOMETA :
> > +			       sensor->embedded_start == sensor->embedded_end ?
> > +			       CCS_PADS_NOMETA : CCS_PADS,
> >  			       MEDIA_ENT_F_PROC_VIDEO_SCALER,
> >  			       "ccs binner mutex", &binner_lock_key);
> >  	if (rval)
> > diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> > index 90b442a3d53e..477b2fb99aa0 100644
> > --- a/drivers/media/i2c/ccs/ccs.h
> > +++ b/drivers/media/i2c/ccs/ccs.h
> > @@ -173,11 +173,18 @@ struct ccs_csi_data_format {
> >  #define CCS_SUBDEVS			3
> >  
> >  #define CCS_PA_PAD_SRC			0
> > -#define CCS_PAD_SINK			0
> > -#define CCS_PAD_SRC			1
> > -#define CCS_PADS			2
> > +enum {
> > +	CCS_PAD_SINK,
> > +	CCS_PAD_SRC,
> > +	CCS_PAD_META,
> > +	CCS_PADS_NOMETA = CCS_PAD_META,
> 
> This doesn't seem to improve readability of the code above :-S

The number of pads is different on sub-devices, with the introduction of
one more internal pad in the source. I don't think another enum for the
purpose would be better as the same code is dealing with all of the
driver's sub-devices.

> 
> > +	CCS_PADS,
> > +};
> >  
> > -#define CCS_STREAM_PIXEL		0
> > +enum {
> > +	CCS_STREAM_PIXEL,
> > +	CCS_STREAM_META,
> > +};
> >  
> >  struct ccs_binning_subtype {
> >  	u8 horizontal:4;
> > @@ -228,6 +235,9 @@ struct ccs_sensor {
> >  	int default_pixel_order;
> >  	struct ccs_data_container sdata, mdata;
> >  
> > +	u32 embedded_mbus_code;
> 
> Not used.

I'll remove it.

> 
> > +	u8 emb_data_ctrl;
> 
> The general direction I'd like to take with v4l2_subdev_state is to
> avoid storing state information in the device private structure. Could
> this be dropped and computed in ccs_enable_streams() instead ?

Deriving this information from mbus code is possible. I'll add a new patch
for this.

> 
> > +
> >  	u8 binning_horizontal;
> >  	u8 binning_vertical;
> >  
> 

-- 
Regards,

Sakari Ailus

