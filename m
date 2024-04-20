Return-Path: <linux-media+bounces-9801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F58ABA6C
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F13B51C21336
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB9814AA8;
	Sat, 20 Apr 2024 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q34FJhmV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9DEAE5
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713603879; cv=none; b=RRVAr5hN9BD7UHvtdf4K4gmNA6c15aVVLBU/XuxLJ8T9CoXzT5Hq7QuPJlUV2qqdJz2NeBPZcTPyrQUYVuFeoE5xBQgiINWc1DEUewxFpbZRL/JAtyrNRryfldpdUhLijb6b+XvWdLiL6dMHUTDhXI+Ua4pjieH4lA2/Ped/ES0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713603879; c=relaxed/simple;
	bh=Th1cdKSHBvCPxMzhl1PYip5CXegjPUBzOKIWJVGlW0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekDdwIWwg3EYg7N0fu+o/xq7Punp4wNKtv8nPPBw1I2mN/1lar2et4UtFRZ5n5btch/WEtE5jYSP3QX+TL/tykjD72YWvtxxAEBh6ybYjwwG4y6GGdMbUBGaILl3TODgI+VepXZ2cHSNWypeVA8Rk2YPXsuWWkawXyUMQSaHOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q34FJhmV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A43F61A2;
	Sat, 20 Apr 2024 11:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713603826;
	bh=Th1cdKSHBvCPxMzhl1PYip5CXegjPUBzOKIWJVGlW0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q34FJhmVnvvrbKQMmVAPKsQIV+nhtIFpdBxAkd1Hj4ce7H7b5H6lodV0LP9StiZ00
	 nPjt2Q7gaMcbs6viY1lr9JZ3+XPvmHhaMb2n4G36WOSqp0gOQrbXcGcWU3dr7lrgNi
	 ROozwUWbosZN1iPqXB6Emppc70t04qTNQec+VC0o=
Date: Sat, 20 Apr 2024 12:04:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 31/46] media: ccs: Remove ccs_get_crop_compose helper
Message-ID: <20240420090426.GT6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-32-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-32-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:04PM +0300, Sakari Ailus wrote:
> As it's now easier to obtain the necessary information on crop and compose
> rectangles after moving to sub-device state, remove the
> ccs_get_crop_compose helper.
> 
> Also remove the comp arguments of the compose goodness calculators and
> make related local variables and function arguments const where
> applicable.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 164 ++++++++++++++-----------------
>  1 file changed, 72 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index ba629eafec43..299b5ac6538c 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2223,24 +2223,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
>  	return rval;
>  }
>  
> -static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
> -				 struct v4l2_subdev_state *sd_state,
> -				 struct v4l2_rect **crops,
> -				 struct v4l2_rect **comps)
> -{
> -	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	unsigned int i;
> -
> -	if (crops)
> -		for (i = 0; i < subdev->entity.num_pads; i++)
> -			crops[i] =
> -				v4l2_subdev_state_get_crop(sd_state, i,
> -							   CCS_STREAM_PIXEL);
> -	if (comps)
> -		*comps = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> -						       CCS_STREAM_PIXEL);
> -}
> -
>  /* Changes require propagation only on sink pad. */
>  static void ccs_propagate(struct v4l2_subdev *subdev,
>  			  struct v4l2_subdev_state *sd_state, int which,
> @@ -2248,15 +2230,17 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect *comp, *crops[CCS_PADS];
> +	struct v4l2_rect *comp, *crop;
>  	struct v4l2_mbus_framefmt *fmt;
>  
> -	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
> -
> +	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> +					     CCS_STREAM_PIXEL);
>  	switch (target) {
>  	case V4L2_SEL_TGT_CROP:
> -		comp->width = crops[CCS_PAD_SINK]->width;
> -		comp->height = crops[CCS_PAD_SINK]->height;
> +		crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SINK,
> +						  CCS_STREAM_PIXEL);
> +		comp->width = crop->width;
> +		comp->height = crop->height;
>  		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  			if (ssd == sensor->scaler) {
>  				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
> @@ -2270,13 +2254,15 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  		}
>  		fallthrough;
>  	case V4L2_SEL_TGT_COMPOSE:
> -		*crops[CCS_PAD_SRC] = *comp;
> +		crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SRC,
> +						  CCS_STREAM_PIXEL);
> +		*crop = *comp;
>  		fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
>  						   CCS_STREAM_PIXEL);
>  		fmt->width = comp->width;
>  		fmt->height = comp->height;
>  		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
> -			sensor->src_src = *crops[CCS_PAD_SRC];
> +			sensor->src_src = *crop;
>  		break;
>  	default:
>  		WARN_ON_ONCE(1);
> @@ -2419,7 +2405,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect *crops[CCS_PADS];
> +	struct v4l2_rect *crop;
>  
>  	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
>  		return ccs_get_format(subdev, sd_state, fmt);
> @@ -2461,12 +2447,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
>  		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
>  		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
>  
> -	ccs_get_crop_compose(subdev, sd_state, crops, NULL);
> +	crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
> +					  CCS_STREAM_PIXEL);
>  
> -	crops[ssd->sink_pad]->left = 0;
> -	crops[ssd->sink_pad]->top = 0;
> -	crops[ssd->sink_pad]->width = fmt->format.width;
> -	crops[ssd->sink_pad]->height = fmt->format.height;
> +	crop->left = 0;
> +	crop->top = 0;
> +	crop->width = fmt->format.width;
> +	crop->height = fmt->format.height;
>  	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
>  
>  	mutex_unlock(&sensor->mutex);
> @@ -2521,26 +2508,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
>  static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_selection *sel,
> -				   struct v4l2_rect **crops,
> -				   struct v4l2_rect *comp)
> +				   const struct v4l2_rect *sink_crop)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	unsigned int i;
>  	unsigned int binh = 1, binv = 1;
> -	int best = scaling_goodness(
> -		subdev,
> -		crops[CCS_PAD_SINK]->width, sel->r.width,
> -		crops[CCS_PAD_SINK]->height, sel->r.height, sel->flags);
> +	int best = scaling_goodness(subdev, sink_crop->width, sel->r.width,
> +				    sink_crop->height, sel->r.height,
> +				    sel->flags);
>  
>  	for (i = 0; i < sensor->nbinning_subtypes; i++) {
> -		int this = scaling_goodness(
> -			subdev,
> -			crops[CCS_PAD_SINK]->width
> -			/ sensor->binning_subtypes[i].horizontal,
> -			sel->r.width,
> -			crops[CCS_PAD_SINK]->height
> -			/ sensor->binning_subtypes[i].vertical,
> -			sel->r.height, sel->flags);
> +		int this = scaling_goodness(subdev,
> +					    sink_crop->width
> +					    / sensor->binning_subtypes[i].horizontal,
> +					    sel->r.width,
> +					    sink_crop->height
> +					    / sensor->binning_subtypes[i].vertical,
> +					    sel->r.height, sel->flags);
>  
>  		if (this > best) {
>  			binh = sensor->binning_subtypes[i].horizontal;
> @@ -2553,8 +2537,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
>  		sensor->binning_horizontal = binh;
>  	}
>  
> -	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
> -	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
> +	sel->r.width = (sink_crop->width / binh) & ~1;
> +	sel->r.height = (sink_crop->height / binv) & ~1;
>  }
>  
>  /*
> @@ -2569,8 +2553,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
>  static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_selection *sel,
> -				   struct v4l2_rect **crops,
> -				   struct v4l2_rect *comp)
> +				   const struct v4l2_rect *sink_crop)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(subdev);
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> @@ -2582,17 +2565,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  	unsigned int i;
>  	int best = INT_MIN;
>  
> -	sel->r.width = min_t(unsigned int, sel->r.width,
> -			     crops[CCS_PAD_SINK]->width);
> -	sel->r.height = min_t(unsigned int, sel->r.height,
> -			      crops[CCS_PAD_SINK]->height);
> -
> -	a = crops[CCS_PAD_SINK]->width
> -		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
> -	b = crops[CCS_PAD_SINK]->height
> -		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
> -	max_m = crops[CCS_PAD_SINK]->width
> -		* CCS_LIM(sensor, SCALER_N_MIN)
> +	sel->r.width = min_t(unsigned int, sel->r.width, sink_crop->width);
> +	sel->r.height = min_t(unsigned int, sel->r.height, sink_crop->height);
> +
> +	a = sink_crop->width * CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
> +	b = sink_crop->height * CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
> +	max_m = sink_crop->width * CCS_LIM(sensor, SCALER_N_MIN)
>  		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
>  
>  	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
> @@ -2623,14 +2601,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  	}
>  
>  	for (i = 0; i < ntry; i++) {
> -		int this = scaling_goodness(
> -			subdev,
> -			crops[CCS_PAD_SINK]->width
> -			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
> -			sel->r.width,
> -			crops[CCS_PAD_SINK]->height,
> -			sel->r.height,
> -			sel->flags);
> +		int this = scaling_goodness(subdev,
> +					    sink_crop->width
> +					    / try[i]
> +					    * CCS_LIM(sensor, SCALER_N_MIN),
> +					    sel->r.width, sink_crop->height,
> +					    sel->r.height, sel->flags);
>  
>  		dev_dbg(&client->dev, "trying factor %u (%u)\n", try[i], i);
>  
> @@ -2645,12 +2621,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  			continue;
>  
>  		this = scaling_goodness(
> -			subdev, crops[CCS_PAD_SINK]->width
> -			/ try[i]
> +			subdev, sink_crop->width / try[i]
>  			* CCS_LIM(sensor, SCALER_N_MIN),
>  			sel->r.width,
> -			crops[CCS_PAD_SINK]->height
> -			/ try[i]
> +			sink_crop->height / try[i]
>  			* CCS_LIM(sensor, SCALER_N_MIN),
>  			sel->r.height,
>  			sel->flags);
> @@ -2662,18 +2636,13 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  		}
>  	}
>  
> -	sel->r.width =
> -		(crops[CCS_PAD_SINK]->width
> -		 / scale_m
> -		 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
> +	sel->r.width = (sink_crop->width / scale_m
> +			* CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
>  	if (mode == SMIAPP_SCALING_MODE_BOTH)
> -		sel->r.height =
> -			(crops[CCS_PAD_SINK]->height
> -			 / scale_m
> -			 * CCS_LIM(sensor, SCALER_N_MIN))
> -			& ~1;
> +		sel->r.height = (sink_crop->height / scale_m
> +				 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
>  	else
> -		sel->r.height = crops[CCS_PAD_SINK]->height;
> +		sel->r.height = sink_crop->height;
>  
>  	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		sensor->scale_m = scale_m;
> @@ -2687,17 +2656,21 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect *comp, *crops[CCS_PADS];
> +	const struct v4l2_rect *sink_crop;
> +	struct v4l2_rect *comp;
>  
> -	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
> +	sink_crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SINK,
> +					       CCS_STREAM_PIXEL);
> +	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> +					     CCS_STREAM_PIXEL);
>  
>  	sel->r.top = 0;
>  	sel->r.left = 0;
>  
>  	if (ssd == sensor->binner)
> -		ccs_set_compose_binner(subdev, sd_state, sel, crops, comp);
> +		ccs_set_compose_binner(subdev, sd_state, sel, sink_crop);
>  	else
> -		ccs_set_compose_scaler(subdev, sd_state, sel, crops, comp);
> +		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop);
>  
>  	*comp = sel->r;
>  	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
> @@ -2758,9 +2731,13 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect src_size = { 0 }, *crops[CCS_PADS], *comp;
> +	struct v4l2_rect src_size = { 0 }, *crop;
> +	const struct v4l2_rect *comp;
>  
> -	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
> +	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad,
> +					  CCS_STREAM_PIXEL);
> +	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> +					     CCS_STREAM_PIXEL);
>  
>  	if (sel->pad == ssd->sink_pad) {
>  		struct v4l2_mbus_framefmt *mfmt =
> @@ -2784,7 +2761,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
>  	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
>  	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
>  
> -	*crops[sel->pad] = sel->r;
> +	*crop = sel->r;
>  
>  	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
>  		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
> @@ -2809,14 +2786,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect *comp, *crops[CCS_PADS];
> +	const struct v4l2_rect *crop, *comp;
>  	int ret;
>  
>  	ret = ccs_sel_supported(subdev, sel);
>  	if (ret)
>  		return ret;
>  
> -	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
> +	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad,
> +					  CCS_STREAM_PIXEL);
> +	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> +					     CCS_STREAM_PIXEL);
>  
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> @@ -2838,7 +2818,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
>  		break;
>  	case V4L2_SEL_TGT_CROP:
>  	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> -		sel->r = *crops[sel->pad];
> +		sel->r = *crop;
>  		break;
>  	case V4L2_SEL_TGT_COMPOSE:
>  		sel->r = *comp;

-- 
Regards,

Laurent Pinchart

