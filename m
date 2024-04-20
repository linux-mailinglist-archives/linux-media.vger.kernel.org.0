Return-Path: <linux-media+bounces-9803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B93C8ABABD
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA67282009
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5751417592;
	Sat, 20 Apr 2024 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JHZynNtf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB1914F65
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713604803; cv=none; b=cS8nNOficaj1dwP9JiW2R4DU8psrNbG8mtOPlRDzbjFmmP8nc6jgIuLHywBSJcA8jh9suoVRHGc0Wpb13P5LiXwprb2CstMGpAeNKGX1niBUzplhhnAD62UpDSXfd/Hj/3boSTWoJpBjiVUmgXmZH951RWK8nV6gQFLjLNhUiDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713604803; c=relaxed/simple;
	bh=OiglxGkFGIO9XrBR41oWmRKs/8j21PmLPc4gd3TvUww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpD9z3OTbfI1wLJ8/kUKm2Naoy7xVahDFQOC2rB0zS48AFDa+SlkYF2/QgDvH28c2zZsUSgQ1M0AJJrySIHgt/1ivzvbHfKBGPvopyo7SGy23FZQpVwWz/d4TTdPnpweAY/TETXU/LGQzQxfP62zMgDLGP0ttMFgD/6/Bm45DFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JHZynNtf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2377855;
	Sat, 20 Apr 2024 11:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713604751;
	bh=OiglxGkFGIO9XrBR41oWmRKs/8j21PmLPc4gd3TvUww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHZynNtfkSqbS7/JtXgcvbQMaZbVQcPY+umYWdE65hXYD5j07C+yvK/FjVad5U+mh
	 fiHk+TdzHogOxU8wNf99M+NiREeJVDsHzq64+vygHCuR14CFYpRaGC17Htu4G3I+d/
	 o1OXhMyi1992zYd0lFzbQlMItY5EepyAK/yalQIs=
Date: Sat, 20 Apr 2024 12:19:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 33/46] media: ccs: Compute binning configuration from
 sub-device state
Message-ID: <20240420091950.GV6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-34-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-34-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:06PM +0300, Sakari Ailus wrote:
> Calculate binning configuration from sub-device state so the state related
> configuration can be removed from the driver's device context struct.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 56 +++++++++++++++++++-------------
>  drivers/media/i2c/ccs/ccs.h      |  3 --
>  2 files changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index f82f3ec37c7c..08e719d611fb 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -511,13 +511,36 @@ static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
>  	return ccs_pll_calculate(&client->dev, &lim, pll);
>  }
>  
> +static void
> +ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
> +{
> +	struct v4l2_subdev_state *state =
> +		v4l2_subdev_get_locked_active_state(&sensor->binner->sd);
> +	const struct v4l2_rect *sink_crop =
> +		v4l2_subdev_state_get_crop(state, CCS_PAD_SINK,
> +					   CCS_STREAM_PIXEL);
> +	const struct v4l2_rect *sink_comp =
> +		v4l2_subdev_state_get_compose(state, CCS_PAD_SINK,
> +					      CCS_STREAM_PIXEL);
> +
> +	if (binning_mode)
> +		*binning_mode =	sink_crop->width == sink_comp->width &&
> +				sink_crop->height == sink_comp->height ? 0 : 1;
> +
> +	*binh = sink_crop->width / sink_comp->width;
> +	*binv = sink_crop->height / sink_comp->height;
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
> @@ -1241,8 +1264,11 @@ static void ccs_update_blanking(struct ccs_sensor *sensor,
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
> @@ -1814,7 +1840,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
>  					   CCS_STREAM_PIXEL);
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	unsigned int binning_mode;
> +	u8 binning_mode, binh, binv;
>  	int rval;
>  
>  	if (pad != CCS_PAD_SRC)
> @@ -1836,19 +1862,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
> @@ -2254,9 +2273,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  				sensor->scaling_mode =
>  					CCS_SCALING_MODE_NO_SCALING;
> -			} else if (ssd == sensor->binner) {
> -				sensor->binning_horizontal = 1;
> -				sensor->binning_vertical = 1;
>  			}
>  		}
>  		fallthrough;
> @@ -2530,10 +2546,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
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
> @@ -3715,8 +3727,6 @@ static int ccs_probe(struct i2c_client *client)
>  				sensor->binning_subtypes[i].vertical);
>  		}
>  	}
> -	sensor->binning_horizontal = 1;
> -	sensor->binning_vertical = 1;
>  
>  	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
>  		dev_err(&client->dev, "sysfs ident entry creation failed\n");
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index dcca3f88ea67..aadbd4302607 100644
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

