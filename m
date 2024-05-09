Return-Path: <linux-media+bounces-11199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2F8C0EDF
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 13:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EBFF1C20FA1
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 11:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7FB1311B7;
	Thu,  9 May 2024 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bsVXApUD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B95130E4D;
	Thu,  9 May 2024 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715254363; cv=none; b=UI+9NQM0y7cn9au+8NkaCmQwZa3ek0uK48aQG5CCjzoFdZLGfO30830iYV5h83/Gp4BZBmlopnAwzY7MVQG3F+KzUMAHlVa5mwp+H54SDzi7MfSfQ/traBrYcuocr6wS0aRoDSK7zr9Ohv+CMRgQPXSwt2nHLXvNJx+LwVz4MPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715254363; c=relaxed/simple;
	bh=7Ap5VZxbhYpVwRJMUrdywxv5vhvmRn9+YGYnA7BFov0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dosf7MEfiP2xIh+uISO3qeswZeo0ZtOficE9ziLCCUbniH3HuOHRWdP76UcFXGO+IZNr0rrp/dFrHHNgrfUpf9GhatfbbU+ijJyWm2+juzrPY2cwSyxF2380ildHjkHBQTsqlJOp9WDLLC/3emt+5RcQCIRIvLnMy87BiqyakBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bsVXApUD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C71F6904;
	Thu,  9 May 2024 13:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715254355;
	bh=7Ap5VZxbhYpVwRJMUrdywxv5vhvmRn9+YGYnA7BFov0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsVXApUDwjfKTAIAc0IP5wTKUcHtNDx1cDQOwVAIldcNVsKqE9Hs6X96yKKkaYe+K
	 nbK/VWR9AMBwq7HkmTKOBIbSfmZhIt7lXE5D0ANd8HuZybgZaX2MIGt0ZB+UAjMwhi
	 7qnMpjbQtEOaKNDMIwXgsRbuu2w1nIZVKl/DgwWg=
Date: Thu, 9 May 2024 13:32:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2.1 04/11] media: rcar-csi2: Use the subdev active state
Message-ID: <7k52r3lmaxl4ibt3yj3scxqh6oh7qhnnmuthacfjw5naaoydh6@wlbi47butqwl>
References: <20240506164941.110389-5-jacopo.mondi@ideasonboard.com>
 <20240509110652.43938-1-jacopo.mondi@ideasonboard.com>
 <20240509112448.GK1385281@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509112448.GK1385281@ragnatech.se>

Hi Niklas

On Thu, May 09, 2024 at 01:24:48PM GMT, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for this fix, I will test it once I get some time. One comment
> already.
>
> On 2024-05-09 13:06:51 +0200, Jacopo Mondi wrote:
> > Create the subdevice state with v4l2_subdev_init_finalize() and
> > implement the init_state() operation to guarantee the state is initialized.
> >
> > Store the current image format in the subdev active state and remove it
> > from the driver private structure.
> >
> > To guarantee the same image format is applied to all source pads,
> > propagate the format from the sink pad to the sources, disallowing
> > changing format on a source pad.
> >
> > While at it, define an enum member for the number of pads supported by
> > gen4 and store the number of active pads in the driver's private
> > structure to handle both gen3 and gen4.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > v2->v2.1
> >
> > - Fix gen4 issue reported by Niklas: store the number of pads in the
> >   driver structure and use it when handling in init_state() and
> >   set_pad_format() when applying a format to the source pads
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 153 ++++++++++++---------
> >  1 file changed, 86 insertions(+), 67 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 2d464e43a5be..8482b155522b 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -579,15 +579,17 @@ enum rcar_csi2_pads {
> >  	RCAR_CSI2_SINK,
> >  	RCAR_CSI2_SOURCE_VC0,
> >  	RCAR_CSI2_SOURCE_VC1,
> > +	NR_OF_RCAR_CSI2_ISP_PADS = RCAR_CSI2_SOURCE_VC1,
> >  	RCAR_CSI2_SOURCE_VC2,
> >  	RCAR_CSI2_SOURCE_VC3,
> > -	NR_OF_RCAR_CSI2_PAD,
> > +	NR_OF_RCAR_CSI2_VIN_PADS,
> >  };
>
> Please don't do this. It's hard to understand the actual values of the
> enum values, and it looks fragile. It's also a hack as the ISP operation
> mode only have the RCAR_CSI2_SINK and RCAR_CSI2_SOURCE_VC0 pads, but
> reading this suggests it also have RCAR_CSI2_SOURCE_VC1.

How does it suggest that ? Isn't the name NR_OF_RCAR_CSI2_ISP_PADS
explicative ?

>
> My preferred solution would be a new helper and not store the number of
> pads in the private data and remove NR_OF_RCAR_CSI2_VIN_PADS. Something
> like,
>
>     static unsigned int rcsi2_num_pads(const struct rcar_csi2 *priv)
>     {
> 	/* Used together with R-Car CSIP, there are one sink and one source pad. */
> 	if (priv->info->use_isp)
> 	    return 2;
>
> 	/* Used together with R-Car VIN, there are one sink and five source pads. */

four souce pads

> 	return 5;
>     }
>

Ok, up to you.

> >
> >  struct rcar_csi2_info {
> >  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
> >  	int (*phy_post_init)(struct rcar_csi2 *priv);
> > -	int (*start_receiver)(struct rcar_csi2 *priv);
> > +	int (*start_receiver)(struct rcar_csi2 *priv,
> > +			      struct v4l2_subdev_state *state);
> >  	void (*enter_standby)(struct rcar_csi2 *priv);
> >  	const struct rcsi2_mbps_reg *hsfreqrange;
> >  	unsigned int csi0clkfreqrange;
> > @@ -605,7 +607,8 @@ struct rcar_csi2 {
> >  	struct reset_control *rstc;
> >
> >  	struct v4l2_subdev subdev;
> > -	struct media_pad pads[NR_OF_RCAR_CSI2_PAD];
> > +	struct media_pad pads[NR_OF_RCAR_CSI2_VIN_PADS];
> > +	unsigned int num_pads;
> >
> >  	struct v4l2_async_notifier notifier;
> >  	struct v4l2_subdev *remote;
> > @@ -613,8 +616,6 @@ struct rcar_csi2 {
> >
> >  	int channel_vc[4];
> >
> > -	struct mutex lock; /* Protects mf and stream_count. */
> > -	struct v4l2_mbus_framefmt mf;
> >  	int stream_count;
> >
> >  	bool cphy;
> > @@ -808,20 +809,25 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> > +static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> > +				     struct v4l2_subdev_state *state)
> >  {
> >  	const struct rcar_csi2_format *format;
> >  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> > +	const struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int lanes;
> >  	unsigned int i;
> >  	int mbps, ret;
> >
> > +	/* Use the format on the sink pad to compute the receiver config. */
> > +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> > +
> >  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> > -		priv->mf.width, priv->mf.height,
> > -		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
> > +		fmt->width, fmt->height,
> > +		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
> >
> >  	/* Code is validated in set_fmt. */
> > -	format = rcsi2_code_to_fmt(priv->mf.code);
> > +	format = rcsi2_code_to_fmt(fmt->code);
> >  	if (!format)
> >  		return -EINVAL;
> >
> > @@ -849,11 +855,11 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> >  			vcdt2 |= vcdt_part << ((i % 2) * 16);
> >  	}
> >
> > -	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
> > +	if (fmt->field == V4L2_FIELD_ALTERNATE) {
> >  		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
> >  			| FLD_FLD_EN;
> >
> > -		if (priv->mf.height == 240)
> > +		if (fmt->height == 240)
> >  			fld |= FLD_FLD_NUM(0);
> >  		else
> >  			fld |= FLD_FLD_NUM(1);
> > @@ -1049,15 +1055,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> > +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> > +				    struct v4l2_subdev_state *state)
> >  {
> >  	const struct rcar_csi2_format *format;
> > +	const struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int lanes;
> >  	int msps;
> >  	int ret;
> >
> > -	/* Calculate parameters */
> > -	format = rcsi2_code_to_fmt(priv->mf.code);
> > +	/* Use the format on the sink pad to compute the receiver config. */
> > +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> > +	format = rcsi2_code_to_fmt(fmt->code);
> >  	if (!format)
> >  		return -EINVAL;
> >
> > @@ -1114,7 +1123,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> >  	return 0;
> >  }
> >
> > -static int rcsi2_start(struct rcar_csi2 *priv)
> > +static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
> >  {
> >  	int ret;
> >
> > @@ -1122,7 +1131,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	ret = priv->info->start_receiver(priv);
> > +	ret = priv->info->start_receiver(priv, state);
> >  	if (ret) {
> >  		rcsi2_enter_standby(priv);
> >  		return ret;
> > @@ -1146,17 +1155,16 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
> >  static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > +	struct v4l2_subdev_state *state;
> >  	int ret = 0;
> >
> > -	mutex_lock(&priv->lock);
> > +	if (!priv->remote)
> > +		return -ENODEV;
> >
> > -	if (!priv->remote) {
> > -		ret = -ENODEV;
> > -		goto out;
> > -	}
> > +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> >
> >  	if (enable && priv->stream_count == 0) {
> > -		ret = rcsi2_start(priv);
> > +		ret = rcsi2_start(priv, state);
> >  		if (ret)
> >  			goto out;
> >  	} else if (!enable && priv->stream_count == 1) {
> > @@ -1165,49 +1173,28 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >
> >  	priv->stream_count += enable ? 1 : -1;
> >  out:
> > -	mutex_unlock(&priv->lock);
> > +	v4l2_subdev_unlock_state(state);
> >
> >  	return ret;
> >  }
> >
> >  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > +				struct v4l2_subdev_state *state,
> >  				struct v4l2_subdev_format *format)
> >  {
> >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -	struct v4l2_mbus_framefmt *framefmt;
> >
> > -	mutex_lock(&priv->lock);
> > +	if (format->pad > RCAR_CSI2_SINK)
> > +		return v4l2_subdev_get_fmt(sd, state, format);
> >
> >  	if (!rcsi2_code_to_fmt(format->format.code))
> >  		format->format.code = rcar_csi2_formats[0].code;
> >
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -		priv->mf = format->format;
> > -	} else {
> > -		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
> > -		*framefmt = format->format;
> > -	}
> > -
> > -	mutex_unlock(&priv->lock);
> > -
> > -	return 0;
> > -}
> > -
> > -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > -				struct v4l2_subdev_format *format)
> > -{
> > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -
> > -	mutex_lock(&priv->lock);
> > +	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> >
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		format->format = priv->mf;
> > -	else
> > -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> > -
> > -	mutex_unlock(&priv->lock);
> > +	/* Propagate the format to the source pads. */
> > +	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < priv->num_pads; i++)
> > +		*v4l2_subdev_state_get_format(state, i) = format->format;
> >
> >  	return 0;
> >  }
> > @@ -1218,7 +1205,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
> >
> >  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
> >  	.set_fmt = rcsi2_set_pad_format,
> > -	.get_fmt = rcsi2_get_pad_format,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> >  };
> >
> >  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> > @@ -1226,6 +1213,32 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> >  	.pad	= &rcar_csi2_pad_ops,
> >  };
> >
> > +static int rcsi2_init_state(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *state)
> > +{
> > +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > +
> > +	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> > +		.width		= 1920,
> > +		.height		= 1080,
> > +		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> > +		.colorspace	= V4L2_COLORSPACE_SRGB,
> > +		.field		= V4L2_FIELD_NONE,
> > +		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> > +		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> > +		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> > +	};
> > +
> > +	for (unsigned int i = RCAR_CSI2_SINK; i < priv->num_pads; i++)
> > +		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> > +	.init_state = rcsi2_init_state,
> > +};
> > +
> >  static irqreturn_t rcsi2_irq(int irq, void *data)
> >  {
> >  	struct rcar_csi2 *priv = data;
> > @@ -1251,14 +1264,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
> >
> >  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
> >  {
> > +	struct v4l2_subdev_state *state;
> >  	struct rcar_csi2 *priv = data;
> >
> > -	mutex_lock(&priv->lock);
> > +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> > +
> >  	rcsi2_stop(priv);
> >  	usleep_range(1000, 2000);
> > -	if (rcsi2_start(priv))
> > +	if (rcsi2_start(priv, state))
> >  		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> > -	mutex_unlock(&priv->lock);
> > +
> > +	v4l2_subdev_unlock_state(state);
> >
> >  	return IRQ_HANDLED;
> >  }
> > @@ -1851,7 +1867,7 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  {
> >  	const struct soc_device_attribute *attr;
> >  	struct rcar_csi2 *priv;
> > -	unsigned int i, num_pads;
> > +	unsigned int i;
> >  	int ret;
> >
> >  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > @@ -1870,23 +1886,23 @@ static int rcsi2_probe(struct platform_device *pdev)
> >
> >  	priv->dev = &pdev->dev;
> >
> > -	mutex_init(&priv->lock);
> >  	priv->stream_count = 0;
> >
> >  	ret = rcsi2_probe_resources(priv, pdev);
> >  	if (ret) {
> >  		dev_err(priv->dev, "Failed to get resources\n");
> > -		goto error_mutex;
> > +		return ret;
> >  	}
> >
> >  	platform_set_drvdata(pdev, priv);
> >
> >  	ret = rcsi2_parse_dt(priv);
> >  	if (ret)
> > -		goto error_mutex;
> > +		return ret;
> >
> >  	priv->subdev.owner = THIS_MODULE;
> >  	priv->subdev.dev = &pdev->dev;
> > +	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
> >  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
> >  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
> >  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> > @@ -1896,13 +1912,14 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> >  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> >
> > -	num_pads = priv->info->use_isp ? 2 : NR_OF_RCAR_CSI2_PAD;
> > +	priv->num_pads = priv->info->use_isp ? NR_OF_RCAR_CSI2_ISP_PADS
> > +					     : NR_OF_RCAR_CSI2_VIN_PADS;
> >
> >  	priv->pads[RCAR_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
> > -	for (i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> > +	for (i = RCAR_CSI2_SOURCE_VC0; i < priv->num_pads; i++)
> >  		priv->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> >
> > -	ret = media_entity_pads_init(&priv->subdev.entity, num_pads,
> > +	ret = media_entity_pads_init(&priv->subdev.entity, priv->num_pads,
> >  				     priv->pads);
> >  	if (ret)
> >  		goto error_async;
> > @@ -1912,21 +1929,25 @@ static int rcsi2_probe(struct platform_device *pdev)
> >
> >  	pm_runtime_enable(&pdev->dev);
> >
> > +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> > +	if (ret)
> > +		goto error_pm_runtime;
> > +
> >  	ret = v4l2_async_register_subdev(&priv->subdev);
> >  	if (ret < 0)
> > -		goto error_pm_runtime;
> > +		goto error_subdev;
> >
> >  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
> >
> >  	return 0;
> >
> > +error_subdev:
> > +	v4l2_subdev_cleanup(&priv->subdev);
> >  error_pm_runtime:
> >  	pm_runtime_disable(&pdev->dev);
> >  error_async:
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> > -error_mutex:
> > -	mutex_destroy(&priv->lock);
> >
> >  	return ret;
> >  }
> > @@ -1941,8 +1962,6 @@ static void rcsi2_remove(struct platform_device *pdev)
> >  	v4l2_subdev_cleanup(&priv->subdev);
> >
> >  	pm_runtime_disable(&pdev->dev);
> > -
> > -	mutex_destroy(&priv->lock);
> >  }
> >
> >  static struct platform_driver rcar_csi2_pdrv = {
> > --
> > 2.44.0
> >
>
> --
> Kind Regards,
> Niklas Söderlund

