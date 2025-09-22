Return-Path: <linux-media+bounces-42899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6512CB8F50A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 385B2189E86C
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261672F5A1E;
	Mon, 22 Sep 2025 07:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZ1BUOu6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871824167A
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758526727; cv=none; b=KSZocISeLsZ+sL3z78pRJeswWTS0uRHCD5JQZgUoX2bfMBioYwZesQOSU7J370suvzcgeiY5ydpXEH16pT9MI3PlYsWTeUeJ2QZw3cjWP5gXXij58ZHdRe3YBLYtCdQXbuikDqYSpR0MChUO3NUiBoJIYQX1qNIPIPMYdF5xLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758526727; c=relaxed/simple;
	bh=jqtTlZK4/unizdyJeTwF0YmgRnhQsacUe2F4KU9yi8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMA9kBQYhnZGT8aXV2VSRtAgjl4Qb29CqzzHD76HcVDNnPdHsHQZzv/qDxTW6AZtjDKZNVQXI5V1DfCn0IPHBLdLpERt1gEtRw0FQcKV9V+I7p1efgqwgjjbD42N+NCfcjn75MaSTrpc3dN+vhVGlu9KEIsnTK0MRJ2/NipXP30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZ1BUOu6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758526726; x=1790062726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jqtTlZK4/unizdyJeTwF0YmgRnhQsacUe2F4KU9yi8E=;
  b=PZ1BUOu6dCEdrr/Qwv5pu/8hhROOtbo+n+4yDphjUG7Eq5jpfxAEakuB
   lkmENn9D58xy8zp0ffSxCsGjhQAVzGbvPuRZyd9sxmtzd2/uG3vBVY2+5
   o7neb+uVa9p38qgI4Yu3JFadSEwN7Ihn3w14S+ln1JyB77Li87I36Kfnm
   k8QpBVPt5d4wrgGx9ot5sEFYorX6mR5ZRpgFUsdqapYG0H2JRCHaWpuWt
   CTULKDrD9VpgOWd8cEwBpfsf6QPR+ELvd8XnjXW3FiYIjmkf6NCbNs+IV
   7Wmp49UEBoaMk3oUJk9kzB/cObWOEZrF9DpWpxE3vlN1FUkEjV24v0Voy
   w==;
X-CSE-ConnectionGUID: j+NdEiWkRhaGOvtANiGQTA==
X-CSE-MsgGUID: 4dhDg9KcT5CWVh67QzItYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64420892"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="64420892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:38:45 -0700
X-CSE-ConnectionGUID: 94Tkq8yHRi2ISRJaUC4c2g==
X-CSE-MsgGUID: 4YaIzsArSVKt+73jSBwnug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="200125598"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:38:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9DAAB1202BC;
	Mon, 22 Sep 2025 10:38:38 +0300 (EEST)
Date: Mon, 22 Sep 2025 10:38:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 32/46] media: ccs: Rely on sub-device state locking
Message-ID: <aND8_l6zCH3vuCHe@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-33-sakari.ailus@linux.intel.com>
 <20240420091628.GU6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420091628.GU6414@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Apr 20, 2024 at 12:16:28PM +0300, Laurent Pinchart wrote:
> >  static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
> >  {
> > +	struct v4l2_subdev_state *state =
> > +		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
> > +	struct v4l2_rect *pa_src =
> > +		v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
> > +					   CCS_STREAM_PIXEL);
> 
> You can guess what I will say :-)

Sorry, I can't. What is it? :-)

> 
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> >  	int rval;
> >  
> > @@ -1271,15 +1286,15 @@ static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
> >  		return rval;
> >  
> >  	/* Output from pixel array, including blanking */
> > -	ccs_update_blanking(sensor);
> > +	ccs_update_blanking(sensor, pa_src);
> >  
> >  	dev_dbg(&client->dev, "vblank\t\t%d\n", sensor->vblank->val);
> >  	dev_dbg(&client->dev, "hblank\t\t%d\n", sensor->hblank->val);
> >  
> >  	dev_dbg(&client->dev, "real timeperframe\t100/%d\n",
> >  		sensor->pll.pixel_rate_pixel_array /
> > -		((sensor->pa_src.width + sensor->hblank->val) *
> > -		 (sensor->pa_src.height + sensor->vblank->val) / 100));
> > +		((pa_src->width + sensor->hblank->val) *
> > +		 (pa_src->height + sensor->vblank->val) / 100));
> >  
> >  	return 0;
> >  }
> > @@ -1788,6 +1803,16 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
> >  			      u64 streams_mask)
> >  {
> >  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > +	struct v4l2_subdev_state *pa_state =
> > +		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
> > +	struct v4l2_subdev_state *src_state =
> > +		v4l2_subdev_get_locked_active_state(&sensor->src->sd);
> > +	struct v4l2_rect *pa_src =
> > +		v4l2_subdev_state_get_crop(pa_state, CCS_PA_PAD_SRC,
> > +					   CCS_STREAM_PIXEL);
> > +	struct v4l2_rect *src_src =
> > +		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
> > +					   CCS_STREAM_PIXEL);
> 
> Same for pa_src and src_src.
> 
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> >  	unsigned int binning_mode;
> >  	int rval;
> > @@ -1835,22 +1860,20 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
> >  		goto err_pm_put;
> >  
> >  	/* Analog crop start coordinates */
> > -	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
> > +	rval = ccs_write(sensor, X_ADDR_START, pa_src->left);
> >  	if (rval < 0)
> >  		goto err_pm_put;
> >  
> > -	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
> > +	rval = ccs_write(sensor, Y_ADDR_START, pa_src->top);
> >  	if (rval < 0)
> >  		goto err_pm_put;
> >  
> >  	/* Analog crop end coordinates */
> > -	rval = ccs_write(sensor, X_ADDR_END,
> > -			 sensor->pa_src.left + sensor->pa_src.width - 1);
> > +	rval = ccs_write(sensor, X_ADDR_END, pa_src->left + pa_src->width - 1);
> >  	if (rval < 0)
> >  		goto err_pm_put;
> >  
> > -	rval = ccs_write(sensor, Y_ADDR_END,
> > -			 sensor->pa_src.top + sensor->pa_src.height - 1);
> > +	rval = ccs_write(sensor, Y_ADDR_END, pa_src->top + pa_src->height - 1);
> >  	if (rval < 0)
> >  		goto err_pm_put;
> >  
> > @@ -1862,23 +1885,30 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
> >  	/* Digital crop */
> >  	if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
> >  	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
> > +		struct v4l2_subdev_state *scaler_state =
> > +			v4l2_subdev_get_locked_active_state(&sensor->scaler->sd);
> > +		struct v4l2_rect *scaler_sink =
> > +			v4l2_subdev_state_get_crop(scaler_state,
> > +						   sensor->scaler->sink_pad,
> > +						   CCS_STREAM_PIXEL);
> 
> Here too.
> 
> > +
> >  		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
> > -				 sensor->scaler_sink.left);
> > +				 scaler_sink->left);
> >  		if (rval < 0)
> >  			goto err_pm_put;
> >  
> >  		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
> > -				 sensor->scaler_sink.top);
> > +				 scaler_sink->top);
> >  		if (rval < 0)
> >  			goto err_pm_put;
> >  
> >  		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
> > -				 sensor->scaler_sink.width);
> > +				 scaler_sink->width);
> >  		if (rval < 0)
> >  			goto err_pm_put;
> >  
> >  		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
> > -				 sensor->scaler_sink.height);
> > +				 scaler_sink->height);
> >  		if (rval < 0)
> >  			goto err_pm_put;
> >  	}
> > @@ -1896,10 +1926,10 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
> >  	}
> >  
> >  	/* Output size from sensor */
> > -	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
> > +	rval = ccs_write(sensor, X_OUTPUT_SIZE, src_src->width);
> >  	if (rval < 0)
> >  		goto err_pm_put;
> > -	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
> > +	rval = ccs_write(sensor, Y_OUTPUT_SIZE, src_src->height);
> >  	if (rval < 0)
> >  		goto err_pm_put;
> >  
> > @@ -2088,9 +2118,6 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
> >  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> >  	unsigned int i;
> >  	int idx = -1;
> > -	int rval = -EINVAL;
> > -
> > -	mutex_lock(&sensor->mutex);
> >  
> >  	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
> >  		subdev->name, code->pad, code->index);
> > @@ -2098,12 +2125,11 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
> >  	if (subdev == &sensor->src->sd) {
> >  		if (code->pad == CCS_PAD_META) {
> >  			if (code->index)
> > -				goto out;
> > +				return -EINVAL;
> >  
> >  			code->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
> >  
> > -			rval = 0;
> > -			goto out;
> > +			return 0;
> >  		}
> >  		if (code->stream == CCS_STREAM_META) {
> >  			struct v4l2_mbus_framefmt *pix_fmt =
> > @@ -2150,21 +2176,21 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
> >  			}
> >  
> >  			if (WARN_ON(i > ARRAY_SIZE(codes)) || code->index >= i)
> > -				goto out;
> > +				return -EINVAL;
> >  
> >  			code->code = codes[code->index];
> > -			rval = 0;
> > -			goto out;
> > +
> > +			return 0;
> >  		}
> >  	}
> >  
> >  	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
> >  		if (code->index)
> > -			goto out;
> > +			return -EINVAL;
> >  
> >  		code->code = sensor->internal_csi_format->code;
> > -		rval = 0;
> > -		goto out;
> > +
> > +		return 0;
> >  	}
> >  
> >  	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
> > @@ -2175,18 +2201,14 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
> >  			code->code = ccs_csi_data_formats[i].code;
> >  			dev_err(&client->dev, "found index %u, i %u, code %x\n",
> >  				code->index, i, code->code);
> > -			rval = 0;
> > -			break;
> > +			return 0;
> >  		}
> >  	}
> >  
> > -out:
> > -	mutex_unlock(&sensor->mutex);
> > -
> > -	return rval;
> > +	return -EINVAL;
> >  }
> >  
> > -static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
> > +static u32 ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
> >  {
> >  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> >  
> > @@ -2196,33 +2218,19 @@ static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
> >  		return sensor->internal_csi_format->code;
> >  }
> >  
> > -static int __ccs_get_format(struct v4l2_subdev *subdev,
> > -			    struct v4l2_subdev_state *sd_state,
> > -			    struct v4l2_subdev_format *fmt)
> > +static int ccs_get_format(struct v4l2_subdev *subdev,
> > +			  struct v4l2_subdev_state *sd_state,
> > +			  struct v4l2_subdev_format *fmt)
> >  {
> >  	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad,
> >  						    fmt->stream);
> >  
> >  	if (fmt->pad != CCS_PAD_META && fmt->stream != CCS_STREAM_META)
> > -		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
> > +		fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
> >  
> >  	return 0;
> >  }
> 
> Any chance to switch to v4l2_subdev_get_fmt() ?

The mbus code is affected by the flipping controls and there are many of
the mbus codes to change, in various pads. I'd leave this as-is.

-- 
Kind regards,

Sakari Ailus

