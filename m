Return-Path: <linux-media+bounces-7535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A073288600E
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 152A91F22115
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DF213174A;
	Thu, 21 Mar 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pi+QeMfi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B76224D7
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711043412; cv=none; b=kAFoi6HGyBg9Lil9vQGLhNUVeeT7OON7/kHxbc8z2sTp+TigeDJJ0Qi3B4E9i0ixuHxvgdf4MICEziYfDdNn6GpxZ+sNO0ow06y/PjHaSU0g1B9uvQ54MUzphoOchnM5tEvR2ONr7N07MHAQJh429/geEatu0e6hRX6koQqn6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711043412; c=relaxed/simple;
	bh=T2cyHJhOibLQR5oXLlvhAOYaZKjd3N0FwYSRPQOdwJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iy/UBPWik5C6vMXPJiG+pQYrJY7cCCLu8pcYWG9Yj/s0umLVGyIEDED4mgXsCQgcOuUxzzZQtP60JtGVSgcRW5gJs8UkON01O8ZDehnqw+7Is/mbKFctZsl9PLiO8urxNOF0zvrG5mtZ4UxPSbHskF4MZG+eV+oYQZ698XGIzMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pi+QeMfi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF3A92B3;
	Thu, 21 Mar 2024 18:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711043379;
	bh=T2cyHJhOibLQR5oXLlvhAOYaZKjd3N0FwYSRPQOdwJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi+QeMfifq0LCiVR1gq7bhvpwhVkpvkFlUnvs9wuYcQ2weOrN8iPMYc+pCogih5iO
	 zik9u8mBn8CevnrM5mv4xJNowN52H+Guotjzx/5oBo9xZd8BBnhcvFxfUUvhlc+eqY
	 DjhnL5lzHOp0tIHaCj8wVUk1vyrhS85+tLxhc+QM=
Date: Thu, 21 Mar 2024 19:50:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 28/38] media: ccs: Compute scaling configuration from
 sub-device state
Message-ID: <20240321175004.GR9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-29-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-29-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:06AM +0200, Sakari Ailus wrote:
> Compute scaling configuration from sub-device state instead of storing it
> to the driver's device context struct.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 60 ++++++++++++++++++++++----------
>  drivers/media/i2c/ccs/ccs.h      |  3 --
>  2 files changed, 41 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 3b80c54453cc..a147dbb9f362 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -547,19 +547,52 @@ ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
>  		*binv = binner_sink_crop->height / binner_sink_comp->height;
>  }
>  
> +static void ccs_get_scaling(struct ccs_sensor *sensor,
> +			    u8 *scaling_mode, u8 *scale_m)
> +{
> +	struct v4l2_subdev_state *scaler_state =
> +		v4l2_subdev_get_locked_active_state(&sensor->scaler->sd);

Have you double-checked that the scaler state is locked in all code
paths that can lead to this ? The function is called at probe time, with
a manual lock of sensor->mutex. That makes me a bit uncomfortable, I
wonder if it wouldn't be better to pass the locked scaler state to the
function explicitly, to let the callers guarantee the locking
requirements.

> +	struct v4l2_rect *scaler_sink_crop =

const

I would also drop the scaler_ prefix here and for the next variable.

> +		v4l2_subdev_state_get_crop(scaler_state, CCS_PAD_SINK,
> +					   CCS_STREAM_PIXEL);
> +	struct v4l2_rect *scaler_sink_comp =
> +		v4l2_subdev_state_get_compose(scaler_state, CCS_PAD_SINK,
> +					      CCS_STREAM_PIXEL);
> +
> +	if (scale_m)
> +		*scale_m = scaler_sink_crop->width *
> +			CCS_LIM(sensor, SCALER_N_MIN) /
> +			scaler_sink_comp->width;
> +
> +	if (scaling_mode) {
> +		if (scaler_sink_crop->width == scaler_sink_comp->width)
> +			*scaling_mode = CCS_SCALING_MODE_NO_SCALING;
> +		else if (scaler_sink_crop->height == scaler_sink_comp->height)
> +			*scaling_mode = CCS_SCALING_MODE_HORIZONTAL;
> +		else
> +			*scaling_mode = SMIAPP_SCALING_MODE_BOTH;
> +	}
> +}
> +
>  static int ccs_pll_update(struct ccs_sensor *sensor)
>  {
>  	struct ccs_pll *pll = &sensor->pll;
>  	u8 binh, binv;
> +	u8 scale_m;
>  	int rval;
>  
>  	ccs_get_binning(sensor, NULL, &binh, &binv);
>  
> +	if (sensor->scaler)
> +		ccs_get_scaling(sensor, NULL, &scale_m);
> +	else
> +		scale_m = CCS_LIM(sensor, SCALER_N_MIN);
> +
>  	pll->binning_horizontal = binh;
>  	pll->binning_vertical = binv;
>  	pll->link_freq =
>  		sensor->link_freq->qmenu_int[sensor->link_freq->val];
> -	pll->scale_m = sensor->scale_m;
> +	pll->scale_m = scale_m;
>  	pll->bits_per_pixel = sensor->csi_format->compressed;
>  
>  	rval = ccs_pll_try(sensor, pll);
> @@ -1202,7 +1235,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
>  	/* Figure out which BPP values can be used with which formats. */
>  	pll->binning_horizontal = 1;
>  	pll->binning_vertical = 1;
> -	pll->scale_m = sensor->scale_m;
> +	pll->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  
>  	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
>  		sensor->compressed_min_bpp =
> @@ -1950,11 +1983,15 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  	/* Scaling */
>  	if (CCS_LIM(sensor, SCALING_CAPABILITY)
>  	    != CCS_SCALING_CAPABILITY_NONE) {
> -		rval = ccs_write(sensor, SCALING_MODE, sensor->scaling_mode);
> +		u8 scaling_mode, scale_m;
> +
> +		ccs_get_scaling(sensor, &scaling_mode, &scale_m);
> +
> +		rval = ccs_write(sensor, SCALING_MODE, scaling_mode);
>  		if (rval < 0)
>  			goto err_pm_put;
>  
> -		rval = ccs_write(sensor, SCALE_M, sensor->scale_m);
> +		rval = ccs_write(sensor, SCALE_M, scale_m);
>  		if (rval < 0)
>  			goto err_pm_put;
>  	}
> @@ -2270,7 +2307,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  			  struct v4l2_subdev_state *sd_state, int which,
>  			  int target)
>  {
> -	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
>  	struct v4l2_rect *comp, *crop;
>  	struct v4l2_mbus_framefmt *fmt;
> @@ -2283,13 +2319,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  						  CCS_STREAM_PIXEL);
>  		comp->width = crop->width;
>  		comp->height = crop->height;
> -		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -			if (ssd == sensor->scaler) {
> -				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
> -				sensor->scaling_mode =
> -					CCS_SCALING_MODE_NO_SCALING;
> -			}
> -		}
>  		fallthrough;
>  	case V4L2_SEL_TGT_COMPOSE:
>  		crop = v4l2_subdev_state_get_crop(sd_state, CCS_PAD_SRC,
> @@ -2674,11 +2703,6 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  			& ~1;
>  	else
>  		sel->r.height = sink_crop->height;
> -
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		sensor->scale_m = scale_m;
> -		sensor->scaling_mode = mode;
> -	}
>  }
>  /* We're only called on source pads. This function sets scaling. */
>  static int ccs_set_compose(struct v4l2_subdev *subdev,
> @@ -3785,8 +3809,6 @@ static int ccs_probe(struct i2c_client *client)
>  	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
>  	sensor->ssds_used++;
>  
> -	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
> -
>  	/* prepare PLL configuration input values */
>  	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
>  	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index e6fc00a9fa11..d33014f2710b 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -237,9 +237,6 @@ struct ccs_sensor {
>  	u32 embedded_mbus_code;
>  	u8 emb_data_ctrl;
>  
> -	u8 scale_m;
> -	u8 scaling_mode;
> -
>  	u8 frame_skip;
>  	u16 embedded_start; /* embedded data start line */
>  	u16 embedded_end;

-- 
Regards,

Laurent Pinchart

