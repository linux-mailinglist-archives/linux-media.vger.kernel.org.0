Return-Path: <linux-media+bounces-11256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F39E8C1983
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E06AB1F22F03
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BCA12D1E0;
	Thu,  9 May 2024 22:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lp9Fb5NU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K05feQzG"
X-Original-To: linux-media@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065E0770E0;
	Thu,  9 May 2024 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294467; cv=none; b=sDBOMTagL/zadvDDZjyJ61vF63Pivwj+NDxd5gKJQ4qFkSKzMie6KlKwotypNxNNCDcQQ9n1Zf2SVnmbQSctmEhYcmIwwJhpEl77HV/lMvV9kO97Ec+Fs3IgwBEdPmssD5efKSvSbyRiKHt2ydaIuDrZ2AZIaSOvJgxDHIOfhcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294467; c=relaxed/simple;
	bh=t67Gm3u8vouf07GzNGGFbBw+0C5orDElPfw0fXXG81k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwTrMQI4AYl+d7KbXl8QTxAh4rf8kiGWGRYaLSbltC3I/ht+Equu+nfKCENxcbzDVveuwKPPFENAT1fSzufQFpkfKLUgMkbNNn80YYYGHOlZN+1IqZJ1YUw3igNyajc3DRWrrnEeEJAPgu2VZs2g3NfJ5r6ayVpjVUOs6dNgyyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lp9Fb5NU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K05feQzG; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 46EE0138039F;
	Thu,  9 May 2024 18:41:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 09 May 2024 18:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294461;
	 x=1715380861; bh=QyafVF3kqJtxSb9ZeGP0YRdzhIGH9oKSQuuFfsrYy5g=; b=
	lp9Fb5NUcEILZLo4D7Yfa4qWEFnfp6lvmiC0dShlGd8H70TKOs4uU7MRCVlqx5ZO
	dzurzV3ALK0vmdSJTShkDaZrbxNpNxK+AtnjDnZ2avhmMgQZkUF/VcGig06LYmN0
	xfS/kFfOk5pIpINKk1vlLfz+OmlhJRMNjdqOsfzFV2+Xy4+BAIScmSD6DyE+uLm9
	xGpx9yNq7Igu3dF7tGZbJjcOOzZGCT9yW3NGBkO6D8wZISrQnlztu/YEgZ797j2p
	HrmL+Z8xZUSZLSAjlenYnaRUcTC4OQqN9TfYOEtHonh3JczuqRpNPr9gYhCe4V23
	DP1I38dqhzvcTPzXIOzhJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294461; x=
	1715380861; bh=QyafVF3kqJtxSb9ZeGP0YRdzhIGH9oKSQuuFfsrYy5g=; b=K
	05feQzG8U9wEJJSg62SNjVV/No3xbAjfNmHvGX8k7nypLDUf1dvsDRCJyaD6EYLn
	lSXHUpeQUCK0VK/2V3hc7zhDETPizXd81Kb15ySlPTW2JAJTLd0OipHhyxFYlXXI
	oq91rfXMnSp5rQnUOC328KGQT0zUK4phZjdS9ekny6WS3+LI80GBwzvQBumhC/cj
	onOEm3hszjNG4FR9LLdZLll97nW86e2At3vzC7yaViqfVXMOc0jpdze24LSfpymS
	i/cWaeZ5ewjrMhn7/wos8qGZzPuc3ns/mWY/BqjT8rs3BZQR3PZupMcSKybgxTwa
	TSbOuEJFkZFsz54KG6mXw==
X-ME-Sender: <xms:_VA9ZvpjTPvxtQQ8nP8YQl0oszgAFk66ZrEiTqYXqIQ02CNTpcKFjg>
    <xme:_VA9ZppJx99Fq1158qywG7yZUli_su9GwVjdgYeNf8OVBgYkbXq-pLcfHcHVJjD6q
    -MIcdryAWgFTsRqOBE>
X-ME-Received: <xmr:_VA9ZsMKU7Eh8mAb1gj9cY6Z_mMRbuT0b6OEupUMVgg_LxzKNekW_jsXBYYR-P3hb4l_Sq817Z5hxgs3fqMaF-MDXrZb6M8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:_VA9Zi4zrmZiRxKXhJt7K1-1h1qxKxJRVzhcFSGRQJdhegcuB0xkww>
    <xmx:_VA9Zu7i0oihGcjbgrX9gb21OjKpRXDrSw35442Gx137APnBMwgjig>
    <xmx:_VA9ZqgP-9GiZ7e337BiJ8EiAd1eIDPJ7TnIdNV78Koytahv_mqtxg>
    <xmx:_VA9Zg4sdInjbPn2W-EHjLN9lfO8AHygBAXUkRmxeUmYBdzzxxrVeQ>
    <xmx:_VA9ZgsqNuT-l2vA494Jcm2DTY968jDXmz0FAWPsklxVKEZkcYIVP85_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:41:00 -0400 (EDT)
Date: Fri, 10 May 2024 00:40:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 04/11] media: rcar-csi2: Use the subdev active state
Message-ID: <20240509224059.GR1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-5-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-05-09 18:13:54 +0200, Jacopo Mondi wrote:
> Create the subdevice state with v4l2_subdev_init_finalize() and
> implement the init_state() operation to guarantee the state is initialized.
> 
> Store the current image format in the subdev active state and remove it
> from the driver private structure.
> 
> To guarantee the same image format is applied to all source pads,
> propagate the format from the sink pad to the sources, disallowing
> changing format on a source pad.
> 
> To support both gen3 and gen4, which feature a different number of
> source pads, introduce an helper function to return the correct number
> of pads.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I really like how this turned out, nice work!

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

If you for some reason have too much time on your hands I would break 
out the creation of the number of pads helper to its own patch ;-)

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 152 ++++++++++++---------
>  1 file changed, 90 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 2d464e43a5be..c419ddb4c5a2 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -587,7 +587,8 @@ enum rcar_csi2_pads {
>  struct rcar_csi2_info {
>  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
>  	int (*phy_post_init)(struct rcar_csi2 *priv);
> -	int (*start_receiver)(struct rcar_csi2 *priv);
> +	int (*start_receiver)(struct rcar_csi2 *priv,
> +			      struct v4l2_subdev_state *state);
>  	void (*enter_standby)(struct rcar_csi2 *priv);
>  	const struct rcsi2_mbps_reg *hsfreqrange;
>  	unsigned int csi0clkfreqrange;
> @@ -613,8 +614,6 @@ struct rcar_csi2 {
>  
>  	int channel_vc[4];
>  
> -	struct mutex lock; /* Protects mf and stream_count. */
> -	struct v4l2_mbus_framefmt mf;
>  	int stream_count;
>  
>  	bool cphy;
> @@ -632,6 +631,16 @@ static inline struct rcar_csi2 *notifier_to_csi2(struct v4l2_async_notifier *n)
>  	return container_of(n, struct rcar_csi2, notifier);
>  }
>  
> +static unsigned int rcsi2_num_pads(const struct rcar_csi2 *priv)
> +{
> +	/* Used together with R-Car ISP: one sink and one source pad. */
> +	if (priv->info->use_isp)
> +		return 2;
> +
> +	/* Used together with R-Car VIN: one sink and four source pads. */
> +	return 5;
> +}
> +
>  static u32 rcsi2_read(struct rcar_csi2 *priv, unsigned int reg)
>  {
>  	return ioread32(priv->base + reg);
> @@ -808,20 +817,25 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> -static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> +static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> +				     struct v4l2_subdev_state *state)
>  {
>  	const struct rcar_csi2_format *format;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> +	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	unsigned int i;
>  	int mbps, ret;
>  
> +	/* Use the format on the sink pad to compute the receiver config. */
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +
>  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> -		priv->mf.width, priv->mf.height,
> -		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
> +		fmt->width, fmt->height,
> +		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
>  
>  	/* Code is validated in set_fmt. */
> -	format = rcsi2_code_to_fmt(priv->mf.code);
> +	format = rcsi2_code_to_fmt(fmt->code);
>  	if (!format)
>  		return -EINVAL;
>  
> @@ -849,11 +863,11 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
>  			vcdt2 |= vcdt_part << ((i % 2) * 16);
>  	}
>  
> -	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
> +	if (fmt->field == V4L2_FIELD_ALTERNATE) {
>  		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
>  			| FLD_FLD_EN;
>  
> -		if (priv->mf.height == 240)
> +		if (fmt->height == 240)
>  			fld |= FLD_FLD_NUM(0);
>  		else
>  			fld |= FLD_FLD_NUM(1);
> @@ -1049,15 +1063,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
>  	return 0;
>  }
>  
> -static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> +				    struct v4l2_subdev_state *state)
>  {
>  	const struct rcar_csi2_format *format;
> +	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int msps;
>  	int ret;
>  
> -	/* Calculate parameters */
> -	format = rcsi2_code_to_fmt(priv->mf.code);
> +	/* Use the format on the sink pad to compute the receiver config. */
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +	format = rcsi2_code_to_fmt(fmt->code);
>  	if (!format)
>  		return -EINVAL;
>  
> @@ -1114,7 +1131,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
>  	return 0;
>  }
>  
> -static int rcsi2_start(struct rcar_csi2 *priv)
> +static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>  {
>  	int ret;
>  
> @@ -1122,7 +1139,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = priv->info->start_receiver(priv);
> +	ret = priv->info->start_receiver(priv, state);
>  	if (ret) {
>  		rcsi2_enter_standby(priv);
>  		return ret;
> @@ -1146,17 +1163,16 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
>  static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	struct v4l2_subdev_state *state;
>  	int ret = 0;
>  
> -	mutex_lock(&priv->lock);
> +	if (!priv->remote)
> +		return -ENODEV;
>  
> -	if (!priv->remote) {
> -		ret = -ENODEV;
> -		goto out;
> -	}
> +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
>  
>  	if (enable && priv->stream_count == 0) {
> -		ret = rcsi2_start(priv);
> +		ret = rcsi2_start(priv, state);
>  		if (ret)
>  			goto out;
>  	} else if (!enable && priv->stream_count == 1) {
> @@ -1165,49 +1181,29 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	priv->stream_count += enable ? 1 : -1;
>  out:
> -	mutex_unlock(&priv->lock);
> +	v4l2_subdev_unlock_state(state);
>  
>  	return ret;
>  }
>  
>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_format *format)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	struct v4l2_mbus_framefmt *framefmt;
> +	unsigned int num_pads = rcsi2_num_pads(priv);
>  
> -	mutex_lock(&priv->lock);
> +	if (format->pad > RCAR_CSI2_SINK)
> +		return v4l2_subdev_get_fmt(sd, state, format);
>  
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		priv->mf = format->format;
> -	} else {
> -		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
> -		*framefmt = format->format;
> -	}
> -
> -	mutex_unlock(&priv->lock);
> -
> -	return 0;
> -}
> -
> -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state,
> -				struct v4l2_subdev_format *format)
> -{
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -
> -	mutex_lock(&priv->lock);
> -
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		format->format = priv->mf;
> -	else
> -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> +	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
>  
> -	mutex_unlock(&priv->lock);
> +	/* Propagate the format to the source pads. */
> +	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> +		*v4l2_subdev_state_get_format(state, i) = format->format;
>  
>  	return 0;
>  }
> @@ -1218,7 +1214,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
>  
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.set_fmt = rcsi2_set_pad_format,
> -	.get_fmt = rcsi2_get_pad_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> @@ -1226,6 +1222,33 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>  	.pad	= &rcar_csi2_pad_ops,
>  };
>  
> +static int rcsi2_init_state(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	unsigned int num_pads = rcsi2_num_pads(priv);
> +
> +	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> +		.width		= 1920,
> +		.height		= 1080,
> +		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.field		= V4L2_FIELD_NONE,
> +		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +	};
> +
> +	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
> +		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> +	.init_state = rcsi2_init_state,
> +};
> +
>  static irqreturn_t rcsi2_irq(int irq, void *data)
>  {
>  	struct rcar_csi2 *priv = data;
> @@ -1251,14 +1274,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
>  
>  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  {
> +	struct v4l2_subdev_state *state;
>  	struct rcar_csi2 *priv = data;
>  
> -	mutex_lock(&priv->lock);
> +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> +
>  	rcsi2_stop(priv);
>  	usleep_range(1000, 2000);
> -	if (rcsi2_start(priv))
> +	if (rcsi2_start(priv, state))
>  		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> -	mutex_unlock(&priv->lock);
> +
> +	v4l2_subdev_unlock_state(state);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -1870,23 +1896,23 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	priv->dev = &pdev->dev;
>  
> -	mutex_init(&priv->lock);
>  	priv->stream_count = 0;
>  
>  	ret = rcsi2_probe_resources(priv, pdev);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to get resources\n");
> -		goto error_mutex;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, priv);
>  
>  	ret = rcsi2_parse_dt(priv);
>  	if (ret)
> -		goto error_mutex;
> +		return ret;
>  
>  	priv->subdev.owner = THIS_MODULE;
>  	priv->subdev.dev = &pdev->dev;
> +	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
>  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> @@ -1896,7 +1922,7 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
>  
> -	num_pads = priv->info->use_isp ? 2 : NR_OF_RCAR_CSI2_PAD;
> +	num_pads = rcsi2_num_pads(priv);
>  
>  	priv->pads[RCAR_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
>  	for (i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> @@ -1912,21 +1938,25 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> +	if (ret)
> +		goto error_pm_runtime;
> +
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret < 0)
> -		goto error_pm_runtime;
> +		goto error_subdev;
>  
>  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
>  
>  	return 0;
>  
> +error_subdev:
> +	v4l2_subdev_cleanup(&priv->subdev);
>  error_pm_runtime:
>  	pm_runtime_disable(&pdev->dev);
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
> -error_mutex:
> -	mutex_destroy(&priv->lock);
>  
>  	return ret;
>  }
> @@ -1941,8 +1971,6 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_subdev_cleanup(&priv->subdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	mutex_destroy(&priv->lock);
>  }
>  
>  static struct platform_driver rcar_csi2_pdrv = {
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

