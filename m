Return-Path: <linux-media+bounces-7536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AB1886026
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BDAE1F22C82
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA31762EB;
	Thu, 21 Mar 2024 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U+5XYPNN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6855485938
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711043834; cv=none; b=Rj4eRxOz9FJiXUvAFV8lBleoY7xubiUBdoBUvHeq3287vZv16QV2ctbNm/iOHI3hPLUZtvHU9OoVe2TCM4YFx4YLejqyp+wWcdqdYHWDjk0xqeLS+HZvRszoLxvHUFdiHN1xolGWuFtmOaU6cXng64HoiAC/Z1USlHSLq1dp+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711043834; c=relaxed/simple;
	bh=o80iU4BJi1h42VnIgqJUvXuOrZSGdX6KiSOKteryu0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1tBxgQIh1qj/dEeD3ohI3ChrVODAX2bGOBfLWWPPKv4CJRqzdSiXwZegG1H3Pt0j11D7t19BzlYuX67wm5qlxQmfbffC93DfCfbIX+xMYJ/uVHKSbkw+bWAwHsdVNuIldROkLDNqMO5mwWQa0o/zTCt0CIlmlIaytiW3qtPpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U+5XYPNN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 636FB2B3;
	Thu, 21 Mar 2024 18:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711043802;
	bh=o80iU4BJi1h42VnIgqJUvXuOrZSGdX6KiSOKteryu0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+5XYPNN7/Sl+Pw9SFNg68uze4WK01vWdq7POdv4GzeV122QqB5QhICmtq82ei4Zj
	 ZmaiKlrVCi0k+ZwVpTD4LTEkrTkz0o99DT7aOCj4PpZumZAHB6nFy3x9TqgWD6gChv
	 iKJV0HPqnKgbRvbXlSWzxSrrqRrTaufZ3n3BufdQ=
Date: Thu, 21 Mar 2024 19:57:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 27/38] media: ccs: Compute binning configuration from
 sub-device state
Message-ID: <20240321175707.GT9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-28-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-28-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:05AM +0200, Sakari Ailus wrote:
> Calculate binning configuration from sub-device state so the state related
> configuration can be removed from the driver's device context struct.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 72 ++++++++++++++++++++++----------
>  drivers/media/i2c/ccs/ccs.h      |  3 --
>  2 files changed, 49 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index a8c48abd2e30..3b80c54453cc 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -511,13 +511,52 @@ static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
>  	return ccs_pll_calculate(&client->dev, &lim, pll);
>  }
>  
> +static void
> +ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
> +{
> +	struct v4l2_subdev_state *binner_state =
> +		v4l2_subdev_get_locked_active_state(&sensor->binner->sd);
> +	struct v4l2_rect *binner_sink_crop =
> +		v4l2_subdev_state_get_crop(binner_state, CCS_PAD_SINK,
> +					   CCS_STREAM_PIXEL);
> +	struct v4l2_rect *binner_sink_comp =
> +		v4l2_subdev_state_get_compose(binner_state, CCS_PAD_SINK,
> +					      CCS_STREAM_PIXEL);

I like this patch very much :-) The comments I made to 28/28 apply there
too.

> +
> +	if (binner_sink_crop->width == binner_sink_comp->width &&
> +	    binner_sink_crop->height == binner_sink_comp->height) {
> +		if (binning_mode)
> +			*binning_mode = 0;
> +
> +		if (binh)
> +			*binh = 1;
> +
> +		if (binv)
> +			*binv = 1;
> +
> +		return;
> +	}
> +
> +	if (binning_mode)
> +		*binning_mode = 1;
> +
> +	if (binh)
> +		*binh = binner_sink_crop->width / binner_sink_comp->width;
> +
> +	if (binv)
> +		*binv = binner_sink_crop->height / binner_sink_comp->height;

binh and binv are never NULL. How about the following ?

	if (binning_mode)
		*binning_mode = sink_crop->width != sink_comp->width ||
				sink_crop->height != sink_comp->height;

	*binh = sink_crop->width / sink_comp->width;
	*binv = sink_crop->height / sink_comp->height;

> +}
> +
>  static int ccs_pll_update(struct ccs_sensor *sensor)
>  {
>  	struct ccs_pll *pll = &sensor->pll;
> +	u8 binh, binv;
>  	int rval;
>  
> -	pll->binning_horizontal = sensor->binning_horizontal;
> -	pll->binning_vertical = sensor->binning_vertical;
> +	ccs_get_binning(sensor, NULL, &binh, &binv);
> +
> +	pll->binning_horizontal = binh;
> +	pll->binning_vertical = binv;
>  	pll->link_freq =
>  		sensor->link_freq->qmenu_int[sensor->link_freq->val];
>  	pll->scale_m = sensor->scale_m;
> @@ -1241,8 +1280,11 @@ static void ccs_update_blanking(struct ccs_sensor *sensor,
>  	struct v4l2_ctrl *hblank = sensor->hblank;
>  	u16 min_fll, max_fll, min_llp, max_llp, min_lbp;
>  	int min, max;
> +	u8 binh, binv;
> +
> +	ccs_get_binning(sensor, NULL, &binh, &binv);
>  
> -	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
> +	if (binv > 1 || binh > 1) {
>  		min_fll = CCS_LIM(sensor, MIN_FRAME_LENGTH_LINES_BIN);
>  		max_fll = CCS_LIM(sensor, MAX_FRAME_LENGTH_LINES_BIN);
>  		min_llp = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN);
> @@ -1813,7 +1855,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
>  					   CCS_STREAM_PIXEL);
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	unsigned int binning_mode;
> +	u8 binning_mode, binh, binv;
>  	int rval;
>  
>  	if (pad != CCS_PAD_SRC)
> @@ -1835,19 +1877,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  		goto err_pm_put;
>  
>  	/* Binning configuration */
> -	if (sensor->binning_horizontal == 1 &&
> -	    sensor->binning_vertical == 1) {
> -		binning_mode = 0;
> -	} else {
> -		u8 binning_type =
> -			(sensor->binning_horizontal << 4)
> -			| sensor->binning_vertical;
> +	ccs_get_binning(sensor,	&binning_mode, &binh, &binv);
>  
> -		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
> +	if (binning_mode) {
> +		rval = ccs_write(sensor, BINNING_TYPE, (binh << 4) | binv);
>  		if (rval < 0)
>  			goto err_pm_put;
> -
> -		binning_mode = 1;
>  	}
>  	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
>  	if (rval < 0)
> @@ -2253,9 +2288,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  				sensor->scaling_mode =
>  					CCS_SCALING_MODE_NO_SCALING;
> -			} else if (ssd == sensor->binner) {
> -				sensor->binning_horizontal = 1;
> -				sensor->binning_vertical = 1;
>  			}
>  		}
>  		fallthrough;
> @@ -2529,10 +2561,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
>  			best = this;
>  		}
>  	}
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		sensor->binning_vertical = binv;
> -		sensor->binning_horizontal = binh;
> -	}
>  
>  	sel->r.width = (sink_crop->width / binh) & ~1;
>  	sel->r.height = (sink_crop->height / binv) & ~1;
> @@ -3721,8 +3749,6 @@ static int ccs_probe(struct i2c_client *client)
>  				sensor->binning_subtypes[i].vertical);
>  		}
>  	}
> -	sensor->binning_horizontal = 1;
> -	sensor->binning_vertical = 1;
>  
>  	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
>  		dev_err(&client->dev, "sysfs ident entry creation failed\n");
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index a2a461cda338..e6fc00a9fa11 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -237,9 +237,6 @@ struct ccs_sensor {
>  	u32 embedded_mbus_code;
>  	u8 emb_data_ctrl;
>  
> -	u8 binning_horizontal;
> -	u8 binning_vertical;
> -
>  	u8 scale_m;
>  	u8 scaling_mode;
>  

-- 
Regards,

Laurent Pinchart

