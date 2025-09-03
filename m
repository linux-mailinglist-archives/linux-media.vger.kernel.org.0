Return-Path: <linux-media+bounces-41736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A661B42B7B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F405661E7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA832E7BAC;
	Wed,  3 Sep 2025 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h6hW9Nga"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D62C325C
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756933360; cv=none; b=KUkbweXtaFBopviQWSf2ljFl1POc+5rVmQWB1pCRD9lvr+EqEzGJaZxPWGgFXb1dZvkWmF9xkt9G3fn7gzvzfH5kWSB4g9+ozoaaO1rpymsfnKidMA4cPywUaiXrbUtvnvISAuFYNvqAbxUxnQGaaQS6vljSA1yo8yFxXOKX4f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756933360; c=relaxed/simple;
	bh=hU9eajkyGVwCtI3urBoBt8jkdAJeMJ8xe7iqrjLncdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhiqcXIkLh35X9M1TagStcp3XGkdcb02Z8Mqn4M0UevAfMPlre6jLDFkC2gmbfXf9/D6By/D5voeOWX2TIA9HGt3ChLk1O+FrBlLqN6rII0qxxLCCbE9s+1leRZ3PHh/5S/eOj7dsGI2rRVQQtNLU4AkGf1Y0dbTpuHECAEnkTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h6hW9Nga; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6D9E68CB;
	Wed,  3 Sep 2025 23:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756933286;
	bh=hU9eajkyGVwCtI3urBoBt8jkdAJeMJ8xe7iqrjLncdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6hW9NgabSR/2rCq53Jm2e8fHDZWEzKiyKQ1bt8M+/fI/vQhiQKbv7bqweQmYypnt
	 9aofuJix28+yLPp/+SOqfLmopNJLfiSRVhiW8KzmCF09nDvrSGRIOZZLr/ypEcBcE1
	 EmFgGP5+rwSDn0SWKFV1lqJ3Bg0djxKJ/DQQzN7M=
Date: Wed, 3 Sep 2025 23:02:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 34/66] media: ccs: Compute scaling configuration from
 sub-device state
Message-ID: <20250903210212.GZ3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-35-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-35-sakari.ailus@linux.intel.com>

Hi Sakari,

You seem to have missed taking my review comments from v9 into account
here. As that was the case for other ccs patches earlier in this series
I'll assume the rest of the ccs patches are also affected and will skip
reviewing them. Please look at v9 and address the comments in v12.

On Mon, Aug 25, 2025 at 12:50:35PM +0300, Sakari Ailus wrote:
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
> index 1eb63956ef1f..7b451684e1ed 100644
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
> @@ -1203,7 +1235,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
>  	/* Figure out which BPP values can be used with which formats. */
>  	pll->binning_horizontal = 1;
>  	pll->binning_vertical = 1;
> -	pll->scale_m = sensor->scale_m;
> +	pll->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  
>  	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
>  		sensor->compressed_min_bpp =
> @@ -1948,11 +1980,15 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
> @@ -2261,7 +2297,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  			  struct v4l2_subdev_state *sd_state, int which,
>  			  int target)
>  {
> -	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
>  	struct v4l2_rect *comp, *crop;
>  	struct v4l2_mbus_framefmt *fmt;
> @@ -2274,13 +2309,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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
> @@ -2665,11 +2693,6 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
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
> @@ -3784,8 +3807,6 @@ static int ccs_probe(struct i2c_client *client)
>  	sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
>  	sensor->ssds_used++;
>  
> -	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
> -
>  	/* prepare PLL configuration input values */
>  	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
>  	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 9671883e4885..3fddbe267409 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -238,9 +238,6 @@ struct ccs_sensor {
>  
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

