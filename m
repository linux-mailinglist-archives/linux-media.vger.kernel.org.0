Return-Path: <linux-media+bounces-11198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E8B8C0ED3
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 13:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0E41281C9E
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 11:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81C9131196;
	Thu,  9 May 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="W4eEINsL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MllbeA0j"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0026ACD;
	Thu,  9 May 2024 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715253897; cv=none; b=u4ybQ7pCq2YPZf3vWkePm297MyOZrhGyd/EI7Nj/WV7tjI8n8sru0a8GJr58UWZK+iZ08b0i7JHAcUOYcBamkYAISQ3zMF9f15A770Ys9s7RGAc+G3sU2fH2CoZE7niFVQrGgXq13xCQiJr0oSYGWsvLhEBPIFbe2Z8VcELjEL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715253897; c=relaxed/simple;
	bh=2OAOCe55eQ70engNxvACiRCDuyEDvJscI77xW5fPqWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3svvQj4T2AOb88wMQLOnuYSNhbuy3awypmUEwFItDReDtA2bKW2OI8odxrdMNJ0hxZgDv0nGqBzyFTWh1cI5ouoIDoIpsZGAz0BnsP+fe04w6xi3IjDOFLFN4kXeaHKL+Gs/p6uy5iNVd8anvKUlcYgI/hQa9C35O4WXQz3hVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=W4eEINsL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MllbeA0j; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7EF351140166;
	Thu,  9 May 2024 07:24:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 09 May 2024 07:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715253892;
	 x=1715340292; bh=JFpEIBNIw8FOYdbFDN5J7gHHSNbntXz4xVlCDbtRTUI=; b=
	W4eEINsLwuxWxztmvan2dHSsPYxOv+tQu3YdNSk0ChBlUNgvBEucoRrabSZgoYg1
	9vPk0gcJk1qtTDIOz5s3qPPiWIbqJJAE88PoV4mBwKw2oDTDSVp/CbmssLZD9/Lm
	Pu3Y6m/3ClBeu2sTUhCBWUWxUgAhP9EG3OGk9bwP9Yoa71FrzIltwj61WajdP8kw
	NUwLCIT+q8otC2oWhv2Jz9hBBsnAgS8/QysKFwjrV8mosdpXsxyaqbBVoxdkWE6I
	VYtIQUTmJVJ948imuLLC+xLX8J8rJn7lvWo7Z6EPq63M7BQcZf0a0y02J673e/3S
	1m1iwgF8Iy0XihRK5IGFgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715253892; x=
	1715340292; bh=JFpEIBNIw8FOYdbFDN5J7gHHSNbntXz4xVlCDbtRTUI=; b=M
	llbeA0jRIh5Jgb4dOo13ku3jIeHhtHV0GCl86WWZxcPr1fzuJiTd+rxTDlUDvAob
	q5eKtelq4fB0rosdHRb0CtRWZE+gUpeil1+IIfMoMkpW1ClrNyIHwZ58elProBWj
	uHyVCbhcRbzWZ/6z523X8Ow4Fjj7SkSWNNjNMu1j1v3+W7N+Pp2IPWilyD3UpuXj
	H2H3cWkDieVOA0L8fLVgLZKkdf+2oxkJXf7/WH0L1S31PYNpnI4zXuolb8Vut23+
	cSRok6QO47L/BjMSqOmUQwKmaR6qrdThfAnDZb+wtHSTLEpRWHJs1yux7SdrGb5S
	i7kJW60nZGiFnSbk7OQ8Q==
X-ME-Sender: <xms:hLI8ZkSDhqfUq5txh4TuFTIFf8If1Eplpl6X2g60OlcQJWfdwXW73Q>
    <xme:hLI8ZhwY23ANsJXrITx_swCQRT2JNvrjsOevSFeersPXnZ2O2r7-ZjXHH_IP4KQbI
    ywl2iSHkkIJTGA0xtM>
X-ME-Received: <xmr:hLI8Zh3EIl4t34ej-0voqvmLDFMM1971uIwRbtV3OtziNRYOp8FVgcxtFjKbHKnTDEPepoWaZjIkFo0NJ3hbvAEqlrQJIKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefvddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:hLI8ZoD6nob62Mqf08-eU_yPcQL6hA7GjolOlRocdpghnyoirbGFRg>
    <xmx:hLI8ZthsA1Gci_NiGc0T9Nf-EZ02oiJ4vv9X2h_gxF3TANs3DE0tqw>
    <xmx:hLI8ZkoERrqSPH32DIIPv-Aw4kGxcTfabt-D3D2fUIJBFGuo3Bkk_w>
    <xmx:hLI8Zgjhf8ryf3N9MSc2SuKDo0JzSUJv2Mw4f_GE42HynhBQ1rIfmQ>
    <xmx:hLI8ZuXtLiHVsk0iU3_unx8mBb3_O4JbOfNbamwC_f-m3A_vdGv8l1Pz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 07:24:51 -0400 (EDT)
Date: Thu, 9 May 2024 13:24:48 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2.1 04/11] media: rcar-csi2: Use the subdev active state
Message-ID: <20240509112448.GK1385281@ragnatech.se>
References: <20240506164941.110389-5-jacopo.mondi@ideasonboard.com>
 <20240509110652.43938-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509110652.43938-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for this fix, I will test it once I get some time. One comment 
already.

On 2024-05-09 13:06:51 +0200, Jacopo Mondi wrote:
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
> While at it, define an enum member for the number of pads supported by
> gen4 and store the number of active pads in the driver's private
> structure to handle both gen3 and gen4.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> v2->v2.1
> 
> - Fix gen4 issue reported by Niklas: store the number of pads in the
>   driver structure and use it when handling in init_state() and
>   set_pad_format() when applying a format to the source pads
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 153 ++++++++++++---------
>  1 file changed, 86 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 2d464e43a5be..8482b155522b 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -579,15 +579,17 @@ enum rcar_csi2_pads {
>  	RCAR_CSI2_SINK,
>  	RCAR_CSI2_SOURCE_VC0,
>  	RCAR_CSI2_SOURCE_VC1,
> +	NR_OF_RCAR_CSI2_ISP_PADS = RCAR_CSI2_SOURCE_VC1,
>  	RCAR_CSI2_SOURCE_VC2,
>  	RCAR_CSI2_SOURCE_VC3,
> -	NR_OF_RCAR_CSI2_PAD,
> +	NR_OF_RCAR_CSI2_VIN_PADS,
>  };

Please don't do this. It's hard to understand the actual values of the 
enum values, and it looks fragile. It's also a hack as the ISP operation 
mode only have the RCAR_CSI2_SINK and RCAR_CSI2_SOURCE_VC0 pads, but 
reading this suggests it also have RCAR_CSI2_SOURCE_VC1.

My preferred solution would be a new helper and not store the number of 
pads in the private data and remove NR_OF_RCAR_CSI2_VIN_PADS. Something 
like,

    static unsigned int rcsi2_num_pads(const struct rcar_csi2 *priv)
    {
	/* Used together with R-Car CSIP, there are one sink and one source pad. */
	if (priv->info->use_isp)
	    return 2;

	/* Used together with R-Car VIN, there are one sink and five source pads. */
	return 5;
    }

> 
>  struct rcar_csi2_info {
>  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
>  	int (*phy_post_init)(struct rcar_csi2 *priv);
> -	int (*start_receiver)(struct rcar_csi2 *priv);
> +	int (*start_receiver)(struct rcar_csi2 *priv,
> +			      struct v4l2_subdev_state *state);
>  	void (*enter_standby)(struct rcar_csi2 *priv);
>  	const struct rcsi2_mbps_reg *hsfreqrange;
>  	unsigned int csi0clkfreqrange;
> @@ -605,7 +607,8 @@ struct rcar_csi2 {
>  	struct reset_control *rstc;
> 
>  	struct v4l2_subdev subdev;
> -	struct media_pad pads[NR_OF_RCAR_CSI2_PAD];
> +	struct media_pad pads[NR_OF_RCAR_CSI2_VIN_PADS];
> +	unsigned int num_pads;
> 
>  	struct v4l2_async_notifier notifier;
>  	struct v4l2_subdev *remote;
> @@ -613,8 +616,6 @@ struct rcar_csi2 {
> 
>  	int channel_vc[4];
> 
> -	struct mutex lock; /* Protects mf and stream_count. */
> -	struct v4l2_mbus_framefmt mf;
>  	int stream_count;
> 
>  	bool cphy;
> @@ -808,20 +809,25 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
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
> @@ -849,11 +855,11 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
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
> @@ -1049,15 +1055,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
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
> @@ -1114,7 +1123,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
>  	return 0;
>  }
> 
> -static int rcsi2_start(struct rcar_csi2 *priv)
> +static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>  {
>  	int ret;
> 
> @@ -1122,7 +1131,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
>  	if (ret < 0)
>  		return ret;
> 
> -	ret = priv->info->start_receiver(priv);
> +	ret = priv->info->start_receiver(priv, state);
>  	if (ret) {
>  		rcsi2_enter_standby(priv);
>  		return ret;
> @@ -1146,17 +1155,16 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
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
> @@ -1165,49 +1173,28 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
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
> +	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> 
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		format->format = priv->mf;
> -	else
> -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> -
> -	mutex_unlock(&priv->lock);
> +	/* Propagate the format to the source pads. */
> +	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < priv->num_pads; i++)
> +		*v4l2_subdev_state_get_format(state, i) = format->format;
> 
>  	return 0;
>  }
> @@ -1218,7 +1205,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
> 
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.set_fmt = rcsi2_set_pad_format,
> -	.get_fmt = rcsi2_get_pad_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  };
> 
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> @@ -1226,6 +1213,32 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>  	.pad	= &rcar_csi2_pad_ops,
>  };
> 
> +static int rcsi2_init_state(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
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
> +	for (unsigned int i = RCAR_CSI2_SINK; i < priv->num_pads; i++)
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
> @@ -1251,14 +1264,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
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
> @@ -1851,7 +1867,7 @@ static int rcsi2_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *attr;
>  	struct rcar_csi2 *priv;
> -	unsigned int i, num_pads;
> +	unsigned int i;
>  	int ret;
> 
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -1870,23 +1886,23 @@ static int rcsi2_probe(struct platform_device *pdev)
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
> @@ -1896,13 +1912,14 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> 
> -	num_pads = priv->info->use_isp ? 2 : NR_OF_RCAR_CSI2_PAD;
> +	priv->num_pads = priv->info->use_isp ? NR_OF_RCAR_CSI2_ISP_PADS
> +					     : NR_OF_RCAR_CSI2_VIN_PADS;
> 
>  	priv->pads[RCAR_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
> -	for (i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> +	for (i = RCAR_CSI2_SOURCE_VC0; i < priv->num_pads; i++)
>  		priv->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> 
> -	ret = media_entity_pads_init(&priv->subdev.entity, num_pads,
> +	ret = media_entity_pads_init(&priv->subdev.entity, priv->num_pads,
>  				     priv->pads);
>  	if (ret)
>  		goto error_async;
> @@ -1912,21 +1929,25 @@ static int rcsi2_probe(struct platform_device *pdev)
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
> @@ -1941,8 +1962,6 @@ static void rcsi2_remove(struct platform_device *pdev)
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

