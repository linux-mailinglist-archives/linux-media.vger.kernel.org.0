Return-Path: <linux-media+bounces-9804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CCC8ABAC5
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4CE6281FE6
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663F517584;
	Sat, 20 Apr 2024 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AjXBoVKU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C76946F
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713605055; cv=none; b=iFTsG+NwDxCDe+m3Dy7OFcU+UhNuhB0INXEX4KvyzhEF4YJUJTuz1ktJ/4vOx4vJZo9UN1IQW0vny5nZhLNigLKSizPT5kbeSyAa4fG4wTpA9vj5PIn03sK13JMACoii+Ex+Fqyx1vK6Mqq5WQhfKpmEkdLfeWcXwuluusSHn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713605055; c=relaxed/simple;
	bh=WMILzgUQ8O52F2+pjVlYouyXx+J/VlfF1z282cvoBXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdkQl+W0udtydG9lsBepDd3upqGSyciuqUrUpdGXFxbr/oIASzUBlUtAPCA3gIcpPnf9HOg17tzoeEloXakYIFKjfKtbJs69Nr5gjLIKeLxk0oTjJXIKzX1+tEj8KKH0fp4iTOBX8ZzOGRmtBr6TO5SUBlZrXsd4zSCMRTHfYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AjXBoVKU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5123755;
	Sat, 20 Apr 2024 11:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713605003;
	bh=WMILzgUQ8O52F2+pjVlYouyXx+J/VlfF1z282cvoBXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjXBoVKUrov8QNYfuzdgJS1C4amisBW/qLBgNIXVDbxMZZb3KWarWqUUZ0dsiI0ow
	 opbiwBTxHpVeIqymGhlLhxrpLzt4Q7xuF4GJlf65pU2dtNHcPOoA078hIbIdqwWjL/
	 HZDrn+AOiITSi5yBvPPItE0oYkTQRTba/8ABu1iQ=
Date: Sat, 20 Apr 2024 12:24:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 34/46] media: ccs: Compute scaling configuration from
 sub-device state
Message-ID: <20240420092403.GB15761@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-35-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-35-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:07PM +0300, Sakari Ailus wrote:
> Compute scaling configuration from sub-device state instead of storing it
> to the driver's device context struct.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 59 ++++++++++++++++++++++----------
>  drivers/media/i2c/ccs/ccs.h      |  3 --
>  2 files changed, 40 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 08e719d611fb..541faa7d84a6 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -531,19 +531,51 @@ ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
>  	*binv = sink_crop->height / sink_comp->height;
>  }
>  
> +static void ccs_get_scaling(struct ccs_sensor *sensor, u8 *scaling_mode,
> +			    u8 *scale_m)
> +{
> +	struct v4l2_subdev_state *state =
> +		v4l2_subdev_get_locked_active_state(&sensor->scaler->sd);
> +	const struct v4l2_rect *sink_crop =
> +		v4l2_subdev_state_get_crop(state, CCS_PAD_SINK,
> +					   CCS_STREAM_PIXEL);
> +	const struct v4l2_rect *sink_comp =
> +		v4l2_subdev_state_get_compose(state, CCS_PAD_SINK,
> +					      CCS_STREAM_PIXEL);
> +
> +	*scale_m = sink_crop->width * CCS_LIM(sensor, SCALER_N_MIN) /
> +		sink_comp->width;
> +
> +	if (!scaling_mode)
> +		return;
> +
> +	if (sink_crop->width == sink_comp->width)
> +		*scaling_mode = CCS_SCALING_MODE_NO_SCALING;
> +	else if (sink_crop->height == sink_comp->height)
> +		*scaling_mode = CCS_SCALING_MODE_HORIZONTAL;
> +	else
> +		*scaling_mode = SMIAPP_SCALING_MODE_BOTH;
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
> @@ -1186,7 +1218,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
>  	/* Figure out which BPP values can be used with which formats. */
>  	pll->binning_horizontal = 1;
>  	pll->binning_vertical = 1;
> -	pll->scale_m = sensor->scale_m;
> +	pll->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  
>  	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
>  		sensor->compressed_min_bpp =
> @@ -1935,11 +1967,15 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
> @@ -2255,7 +2291,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  			  struct v4l2_subdev_state *sd_state, int which,

You can now drop the which parameter to this function \o/ With this, and
the is_active variable removed from the caller,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			  int target)
>  {
> -	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
>  	struct v4l2_rect *comp, *crop;
>  	struct v4l2_mbus_framefmt *fmt;
> @@ -2268,13 +2303,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
> @@ -2653,11 +2681,6 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  				 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
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
> @@ -3763,8 +3786,6 @@ static int ccs_probe(struct i2c_client *client)
>  	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
>  	sensor->ssds_used++;
>  
> -	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
> -
>  	/* prepare PLL configuration input values */
>  	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
>  	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index aadbd4302607..1c30fa85bed6 100644
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

