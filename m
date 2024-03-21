Return-Path: <linux-media+bounces-7537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775B886043
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 19:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934381F2358D
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82CE1332BC;
	Thu, 21 Mar 2024 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kUfKPZnh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2612BF3E
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711044323; cv=none; b=OjDa8a+hnysPGW+eLu8mAV7tz5s0uMTvoPVBT/pCRMTy1xZuD7w3nJE5EOg457l2O0QuzGeTybIvENVenydx366YivEj4whFC9mlS1SSvzHlGB7fOaqty7I7Fx7QwCo7WmaOqlzyZn6qTlJTKcVcpsC9L1zZt7jej9wm1+zh2Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711044323; c=relaxed/simple;
	bh=1QmIiP1xvOQWPy1XCzmC6gbFdRtvhva9WJitEhk09Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRkpZ8guPFHM7aBIGnDUSdXDulPYG8ZSsaTfjQmjXZrlinV9Bx/6C8cyPaB/ouCRktxxJuqf1LosucGt6HLALUl7yPFkebCbb0olK8mrfTC2es9gzX29AN4eM2Cz09MLyqcn7TH+p2FwvWk7UamxY1aeJ6oB/lQK2ARfLr5+jZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kUfKPZnh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1D32672;
	Thu, 21 Mar 2024 19:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711044291;
	bh=1QmIiP1xvOQWPy1XCzmC6gbFdRtvhva9WJitEhk09Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUfKPZnhMbks5lfnVNwz/1f1PgGFWY25zT0ulDUNqgvcFR3weyWAy2CD0qJZ0uBmQ
	 HisaPa5PYOIX+O3rKiwnvsTyV1Iyoig2TJLd82r6a2fgVPFwN7wEzqepuXy1t3Vmx8
	 iZk41yFvKteI1x1g35kT4I4XXPeyNb3jnvpCBYQ0=
Date: Thu, 21 Mar 2024 20:05:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 25/38] media: ccs: Remove ccs_get_crop_compose helper
Message-ID: <20240321180515.GU9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-26-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-26-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:03AM +0200, Sakari Ailus wrote:
> As it's now easier to obtain the necessary information on crop and compose
> rectangles after moving to sub-device state, remove the
> ccs_get_crop_compose helper.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 130 ++++++++++++++-----------------
>  1 file changed, 58 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 1f91af25eac6..6c7eb4f04070 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2222,24 +2222,6 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
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
> @@ -2247,15 +2229,17 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
> @@ -2269,13 +2253,15 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
> @@ -2416,7 +2402,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect *crops[CCS_PADS];
> +	struct v4l2_rect *crop;
>  
>  	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
>  		return ccs_get_format(subdev, sd_state, fmt);
> @@ -2458,12 +2444,13 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
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
> @@ -2518,24 +2505,23 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
>  static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_selection *sel,
> -				   struct v4l2_rect **crops,
> +				   struct v4l2_rect *sink_crop,

const

>  				   struct v4l2_rect *comp)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	unsigned int i;
>  	unsigned int binh = 1, binv = 1;
>  	int best = scaling_goodness(
> -		subdev,
> -		crops[CCS_PAD_SINK]->width, sel->r.width,
> -		crops[CCS_PAD_SINK]->height, sel->r.height, sel->flags);
> +		subdev,	sink_crop->width, sel->r.width,

s/\tsink_crop/ sink_crop/

> +		sink_crop->height, sel->r.height, sel->flags);

	int best = scaling_goodness(subdev, sink_crop->width, sel->r.width,
				    sink_crop->height, sel->r.height,
				    sel->flags);

>  
>  	for (i = 0; i < sensor->nbinning_subtypes; i++) {
>  		int this = scaling_goodness(
>  			subdev,
> -			crops[CCS_PAD_SINK]->width
> +			sink_crop->width
>  			/ sensor->binning_subtypes[i].horizontal,
>  			sel->r.width,
> -			crops[CCS_PAD_SINK]->height
> +			sink_crop->height
>  			/ sensor->binning_subtypes[i].vertical,
>  			sel->r.height, sel->flags);

You know this is horrible to read, right ? :-)

>  
> @@ -2550,8 +2536,8 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
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
> @@ -2566,7 +2552,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
>  static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_selection *sel,
> -				   struct v4l2_rect **crops,
> +				   struct v4l2_rect *sink_crop,

const

>  				   struct v4l2_rect *comp)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(subdev);
> @@ -2579,17 +2565,12 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
> @@ -2622,10 +2603,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  	for (i = 0; i < ntry; i++) {
>  		int this = scaling_goodness(
>  			subdev,
> -			crops[CCS_PAD_SINK]->width
> +			sink_crop->width
>  			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
>  			sel->r.width,
> -			crops[CCS_PAD_SINK]->height,
> +			sink_crop->height,
>  			sel->r.height,
>  			sel->flags);
>  
> @@ -2642,12 +2623,10 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
> @@ -2660,17 +2639,15 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  	}
>  
>  	sel->r.width =
> -		(crops[CCS_PAD_SINK]->width
> -		 / scale_m
> +		(sink_crop->width / scale_m
>  		 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;

	sel->r.width = (sink_crop->width / scale_m
		* CCS_LIM(sensor, SCALER_N_MIN)) & ~1;

>  	if (mode == SMIAPP_SCALING_MODE_BOTH)
>  		sel->r.height =
> -			(crops[CCS_PAD_SINK]->height
> -			 / scale_m
> +			(sink_crop->height / scale_m
>  			 * CCS_LIM(sensor, SCALER_N_MIN))
>  			& ~1;
>  	else
> -		sel->r.height = crops[CCS_PAD_SINK]->height;
> +		sel->r.height = sink_crop->height;
>  
>  	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		sensor->scale_m = scale_m;
> @@ -2684,17 +2661,20 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect *comp, *crops[CCS_PADS];
> +	struct v4l2_rect *comp, *sink_crop;

sink_crop can be const.

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
> +		ccs_set_compose_binner(subdev, sd_state, sel, sink_crop, comp);
>  	else
> -		ccs_set_compose_scaler(subdev, sd_state, sel, crops, comp);
> +		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop, comp);
>  
>  	*comp = sel->r;
>  	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
> @@ -2755,9 +2735,12 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect src_size = { 0 }, *crops[CCS_PADS], *comp;
> +	struct v4l2_rect src_size = { 0 }, *crop, *comp;

comp can be const.

>  
> -	ccs_get_crop_compose(subdev, sd_state, crops, &comp);
> +	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad,
> +					  CCS_STREAM_PIXEL);
> +	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> +					     CCS_STREAM_PIXEL);
>  
>  	if (sel->pad == ssd->sink_pad) {
>  		struct v4l2_mbus_framefmt *mfmt =
> @@ -2781,7 +2764,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
>  	sel->r.left = min_t(int, sel->r.left, src_size.width - sel->r.width);
>  	sel->r.top = min_t(int, sel->r.top, src_size.height - sel->r.height);
>  
> -	*crops[sel->pad] = sel->r;
> +	*crop = sel->r;
>  
>  	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
>  		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
> @@ -2806,14 +2789,17 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
> -	struct v4l2_rect *comp, *crops[CCS_PADS];
> +	struct v4l2_rect *crop, *comp;

const

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
> @@ -2835,7 +2821,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
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

