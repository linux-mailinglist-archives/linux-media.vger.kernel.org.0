Return-Path: <linux-media+bounces-41735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A3B42B72
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 991FE4E12A3
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF6D2DD5EF;
	Wed,  3 Sep 2025 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WL06sWiu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00322BE64D
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756933242; cv=none; b=iEGTjwharVp3keVydwnNV/OulLNP3JUxRqqzLwqCAlgSWhooiTJ88/brfn8zlWTd5+S3MQqPr84BhNulE5ZlD/83r3avLynCYE7XFPqHwfHXpnW/pf0hnngw3M5bqIoOpaiKnx4Y4szHnp1K2Qdszf9S+2Ej7E+MFMst73EoMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756933242; c=relaxed/simple;
	bh=Zt9a78CI+SobvsqXBqL3McrXS4a4T5sXcSbxrY44vLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e57wDlnd76zvgWet0vp8qnI0D/PYit4eyikFJPcFpAx5iOWop+3Z+S33mPjJRYxl2xVQaEom9BGCglhP6fj8heu+CBDzBM3AZ2nrANACQdYAJJWueh/k0RtkigdiB6i9iUfMLvPZ0kToKaM80q8QYZwTZdfvPzSvloT2bv/OWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WL06sWiu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5AC7C928;
	Wed,  3 Sep 2025 22:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756933169;
	bh=Zt9a78CI+SobvsqXBqL3McrXS4a4T5sXcSbxrY44vLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WL06sWiujz+0xRCZAYZq2+Xf3FA2PHPUBqvb6xQWyDFiz5H2EYvmBUBdF/2hxv7Eq
	 PqBFtDu1THVTidLOD0qXQByZXjmx72LAjCabS71CTb5Ht+ho8+wxmemU4utEWNYqQx
	 ZmNmWlr1zcxOLO/Rqg8dY5xsDhDIXbOy09my3zZA=
Date: Wed, 3 Sep 2025 23:00:15 +0200
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
Subject: Re: [PATCH v11 33/66] media: ccs: Compute binning configuration from
 sub-device state
Message-ID: <20250903210015.GY3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-34-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-34-sakari.ailus@linux.intel.com>

On Mon, Aug 25, 2025 at 12:50:34PM +0300, Sakari Ailus wrote:
> Calculate binning configuration from sub-device state so the state related
> configuration can be removed from the driver's device context struct.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I gave a

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

on v9.

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 56 +++++++++++++++++++-------------
>  drivers/media/i2c/ccs/ccs.h      |  3 --
>  2 files changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 2d2ae568739b..1eb63956ef1f 100644
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
> @@ -1258,8 +1281,11 @@ static void ccs_update_blanking(struct ccs_sensor *sensor,
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
> @@ -1827,7 +1853,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
>  					   CCS_STREAM_PIXEL);
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	unsigned int binning_mode;
> +	u8 binning_mode, binh, binv;
>  	int rval;
>  
>  	if (pad != CCS_PAD_SRC)
> @@ -1849,19 +1875,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
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
> @@ -2260,9 +2279,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  				sensor->scaling_mode =
>  					CCS_SCALING_MODE_NO_SCALING;
> -			} else if (ssd == sensor->binner) {
> -				sensor->binning_horizontal = 1;
> -				sensor->binning_vertical = 1;
>  			}
>  		}
>  		fallthrough;
> @@ -2542,10 +2558,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
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
> @@ -3736,8 +3748,6 @@ static int ccs_probe(struct i2c_client *client)
>  				sensor->binning_subtypes[i].vertical);
>  		}
>  	}
> -	sensor->binning_horizontal = 1;
> -	sensor->binning_vertical = 1;
>  
>  	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
>  		dev_err(&client->dev, "sysfs ident entry creation failed\n");
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 338209950fcb..9671883e4885 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -238,9 +238,6 @@ struct ccs_sensor {
>  
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

