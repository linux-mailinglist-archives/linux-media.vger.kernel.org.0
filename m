Return-Path: <linux-media+bounces-10617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD38B9C47
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270331F2235E
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 14:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0A1140365;
	Thu,  2 May 2024 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QbWPFpC8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vou4YwMv"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF83A13EFE3;
	Thu,  2 May 2024 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714660261; cv=none; b=qXWnATr7cC9aG6fiVbTtZDzOJ1vXBvWumZdqo8fV0WQySsoyIZgwkXOQH08wKhGvbt/6Q4oat1IwKbJs1Ek6p4aaEeQOPPN7y2nHQ0BhEY4JEYyNQilDUKepzhSHFPv+O9u47Da2MaZqBG0ijOk9qUiitIfIZRMVMSEHuPUhPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714660261; c=relaxed/simple;
	bh=n4xVVrgrGecwQHv3SHguDeg4tqPFbQNtEMglDdX9z8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdbdCxOjBAg/qiPAAWZMJM6w8Y4GE719LN1oIUdTG3MYc2i+JD2O2ji6t+8toUrnbm8p6nd13tIOkh/vZV2mysseGJWkbxNmePe5g4nqFVaDCC/pN8gOlLMJJIg06lKULQiq+A5/nmYjrww0KRrJ+cChfYCLc5R/V/R0VHgHngA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QbWPFpC8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vou4YwMv; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 991A618000FD;
	Thu,  2 May 2024 10:30:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 02 May 2024 10:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714660256;
	 x=1714746656; bh=zyzwDSsoJKrTUqqaIeBWMWmxwLqBxHA8TsSB2IPRGMM=; b=
	QbWPFpC8IyBFTsIGqKp/Hy6oVrFgYG4gr4/krFc0eyRRQmkdouY2Bmzm3CBfoJMf
	IQ8sQDEk9xXK9mAEnbuu4XZVZStyv4PLgFX0cPFZj6lS0FgVRY5m0/Tg7UBMUCXH
	ieBK/WkFBVNcf7ERGyCzC3Nc7ay/JU7vxMTROIRWKmBFRMsS4KTW0mfWErBfJmpr
	Usv11IXg2NukM09tbm6K2QWUQM+r2Bm5zJCqBMrrAJLo4S0YNg9Kef/efd2XaYd/
	Is+6VO9FPTW7xqLBUb6uzqPd7L0VeDh+WN/cqDa4m0I5fGJaBQaaa3Ucdziwtoic
	N1nqsRkJn1az9023IGCaUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714660256; x=
	1714746656; bh=zyzwDSsoJKrTUqqaIeBWMWmxwLqBxHA8TsSB2IPRGMM=; b=V
	ou4YwMvr8MpJATQq55CNpp/4SEAZg+bSekLA3SeWDlkzzyhcl1TXLYrU/+SeGJ0J
	oI5SsKSj66Obea1FXkFhVkQASOa4xFnP9C+21dUc7PryqfGq6BbsXIjnqGrQHC92
	xgcgVg1bIYBen26QC6UtGFoOekARBaj86jobUzhAQO+E/ljFkq2y2rS5bJZmID/a
	lg449ubdBUfj1jQBdatP9dEXMuWuAo+f7AIWNeSbdotWhja+J5VYC6ntlowE+4Qc
	Rh6w7Pg/6YXnkw/J92eemTyizrLDvB7kVqV9AhNmC+1AxPSuowa6VNWYlsofbnSq
	OukkGnFzkzaElxZ5eqozA==
X-ME-Sender: <xms:n6MzZpgO5knhryXjq4dnaDh7WGloo3BX_gxQ7KwbUFtNXmwGqS81WQ>
    <xme:n6MzZuDiJrS4lzXbZDSZkT6oPW8f9zkiG-6ShusyOeRZdy-ABrbC3QZxrgYbCMH3T
    1NP_zQIXMeC_LIrt-8>
X-ME-Received: <xmr:n6MzZpExRAKLOSTQ4c96mSx2qPSgUgF_x8WI2B9acYENKJx9zYunKjsUh5AjV7SsaX9qhN7_RWb4-kXqnWKrk7_7fgZcK8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeduvefghfet
    kedvieehfeduvdeikeejgfehlefgvddvgfefvdeuhedtvddvgfffudenucffohhmrghinh
    eptghsihdvrdhvtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrg
    htvggthhdrshgv
X-ME-Proxy: <xmx:n6MzZuTMIPBAz1hzHf494IlbajKU6vasbSyTcRt365M57hZ9xROFOw>
    <xmx:n6MzZmzZf4wHSK_cxiTju23TG7AhO1Y-9vKHzyFkV2pEyQ0ThmcNyQ>
    <xmx:n6MzZk43PUgbAt8JsY5cakID_gnak_uKve6467bxSxmxgJaHXLmMJQ>
    <xmx:n6MzZrwxRtR-h4N0tnyLaaGgOoeuBRKxIbyhD3j4yusuCj0W6x2A7A>
    <xmx:oKMzZhzljstWL6MQ3M0n7MFoyvj6dCLzN5kCGGGkNMfNdlplPCUH3rmq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 10:30:55 -0400 (EDT)
Date: Thu, 2 May 2024 16:30:54 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 16/19] media: rcar-csi2: Support multiplexed transmitters
Message-ID: <20240502143054.GB3927860@ragnatech.se>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-17-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430103956.60190-17-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-04-30 12:39:52 +0200, Jacopo Mondi wrote:
> Rework the R-Car CSI-2 start routine to support multiplexed
> transmitters.
> 
> Configure the CSI-2 receiver MIPI CSI-2 Data Type filtering by inspecting
> the remote subdev frame_desc instead of relying on the image format
> configured on the sink pad.
> 
> Enable MIPI CSI-2 Data Type filtering by inspecting the remote subdevice
> frame descriptor to discern which Data Type is transmitted on which
> Virtual Channel. If multiple Data Types are transmitted on the same VC
> then Data Type filtering is disabled.
> 
> Rework the per-lane bandwidth calculation to use the LINK_FREQ control
> if a transmitter sends multiple streams on the same data link. The
> current usage of the PIXEL_RATE control does not support multiplexed
> transmitters, as there's not a unique pixel rate among all the possible
> source streams.
> 
> This change makes mandatory for any subdevice that operates with
> the R-Car CSI-2 receiver to implement the .get_frame_desc() operation.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 280 ++++++++++++++-------
>  1 file changed, 191 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 82dc0b92b8d3..ffb73272543b 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -69,10 +69,7 @@ struct rcar_csi2;
>  #define FLD_REG				0x1c
>  #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
>  #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
> -#define FLD_FLD_EN4			BIT(3)
> -#define FLD_FLD_EN3			BIT(2)
> -#define FLD_FLD_EN2			BIT(1)
> -#define FLD_FLD_EN			BIT(0)
> +#define FLD_FLD_EN(n)			BIT((n) & 0xf)
>  
>  /* Automatic Standby Control */
>  #define ASTBY_REG			0x20
> @@ -575,6 +572,16 @@ static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
>  	return NULL;
>  }
>  
> +static const struct rcar_csi2_format *rcsi2_datatype_to_fmt(unsigned int dt)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(rcar_csi2_formats); i++) {
> +		if (rcar_csi2_formats[i].datatype == dt)
> +			return &rcar_csi2_formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
>  enum rcar_csi2_pads {
>  	RCAR_CSI2_SINK,
>  	RCAR_CSI2_SOURCE_VC0,
> @@ -587,7 +594,8 @@ enum rcar_csi2_pads {
>  struct rcar_csi2_info {
>  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
>  	int (*phy_post_init)(struct rcar_csi2 *priv);
> -	int (*start_receiver)(struct rcar_csi2 *priv);
> +	int (*start_receiver)(struct rcar_csi2 *priv,
> +			      struct v4l2_subdev_state *state);
>  	void (*enter_standby)(struct rcar_csi2 *priv);
>  	const struct rcsi2_mbps_reg *hsfreqrange;
>  	unsigned int csi0clkfreqrange;
> @@ -676,6 +684,32 @@ static int rcsi2_exit_standby(struct rcar_csi2 *priv)
>  	return 0;
>  }
>  
> +static int rcsi2_get_remote_frame_desc(struct rcar_csi2 *priv,
> +				       struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct media_pad *pad;
> +	int ret;
> +
> +	if (!priv->remote)
> +		return -ENOLINK;
> +
> +	pad = media_pad_remote_pad_unique(&priv->pads[RCAR_CSI2_SINK]);
> +	if (IS_ERR(pad))
> +		return PTR_ERR(pad);
> +
> +	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
> +			       pad->index, fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		dev_err(priv->dev, "Frame desc does not describe a CSI-2 link");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
>  				unsigned int lanes)
>  {
> @@ -726,41 +760,6 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  	return 0;
>  }
>  
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> -			   unsigned int lanes)
> -{
> -	struct v4l2_subdev *source;
> -	struct v4l2_ctrl *ctrl;
> -	u64 mbps;
> -
> -	if (!priv->remote)
> -		return -ENODEV;
> -
> -	source = priv->remote;
> -
> -	/* Read the pixel rate control from remote. */
> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> -	if (!ctrl) {
> -		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
> -			source->name);
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * Calculate the phypll in mbps.
> -	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
> -	 * bps = link_freq * 2
> -	 */
> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> -	do_div(mbps, lanes * 1000000);
> -
> -	/* Adjust for C-PHY, divide by 2.8. */
> -	if (priv->cphy)
> -		mbps = div_u64(mbps * 5, 14);
> -
> -	return mbps;
> -}
> -
>  static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  				  unsigned int *lanes)
>  {
> @@ -808,52 +807,146 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> -static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
> +			   struct v4l2_mbus_frame_desc *fd, unsigned int lanes)
>  {

Is there a reason you need to move the rcsi2_calc_mbps()? No problem if 
so, else if you keep it where it is the diff is easier to read ;-)

> -	const struct rcar_csi2_format *format;
> +	struct v4l2_subdev *source;
> +	unsigned int bpp;
> +	s64 link_freq;
> +	u64 mbps;
> +
> +	if (!priv->remote)
> +		return -ENODEV;
> +
> +	source = priv->remote;
> +
> +	/*
> +	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
> +	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
> +	 *
> +	 * With multistream input there is no single pixel rate, and thus we
> +	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
> +	 * causes v4l2_get_link_freq() to return an error if it falls back to
> +	 * V4L2_CID_PIXEL_RATE.
> +	 */
> +
> +	if (fd->num_entries > 1) {
> +		bpp = 0;
> +	} else {
> +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
> +		const struct rcar_csi2_format *format;
> +
> +		format = rcsi2_datatype_to_fmt(entry->bus.csi2.dt);
> +		if (WARN_ON(!format))
> +			return -EINVAL;
> +
> +		bpp = format->bpp;
> +	}
> +
> +	/*
> +	 * Calculate the phypll in mbps.
> +	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
> +	 * bps = link_freq * 2
> +	 */
> +	link_freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> +	if (link_freq < 0) {
> +		dev_err(priv->dev, "Failed to get remote subdev link freq\n");
> +		return link_freq;
> +	}

I just want to make sure I understand our discussion about on IRC about 
this. It's this call you aim to replace by getting the link frequency 
from the frame descriptor once it's available there? If so I think it 
would be good to make this series depend on that work already and list 
it as a dependency.

> +
> +	mbps = 2 * link_freq;
> +	do_div(mbps, 1000000);
> +
> +	/* Adjust for C-PHY, divide by 2.8. */
> +	if (priv->cphy)
> +		mbps = div_u64(mbps * 5, 14);
> +
> +	return mbps;
> +}
> +
> +static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> +				     struct v4l2_subdev_state *state)
> +{
> +	const struct v4l2_subdev_stream_configs *configs;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> +	struct v4l2_mbus_frame_desc fd;
>  	unsigned int lanes;
> -	unsigned int i;
>  	int mbps, ret;
>  
> -	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> -		priv->mf.width, priv->mf.height,
> -		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
> -
> -	/* Code is validated in set_fmt. */
> -	format = rcsi2_code_to_fmt(priv->mf.code);
> -	if (!format)
> -		return -EINVAL;
> +	/* Get information about multiplexed link. */
> +	ret = rcsi2_get_remote_frame_desc(priv, &fd);
> +	if (ret)
> +		return ret;
>  
>  	/*
> -	 * Enable all supported CSI-2 channels with virtual channel and
> -	 * data type matching.
> +	 * Configure and enable the R-Car CSI-2 channels.
>  	 *
> -	 * NOTE: It's not possible to get individual datatype for each
> -	 *       source virtual channel. Once this is possible in V4L2
> -	 *       it should be used here.
> +	 * The VC transmitted on the channel is configured by the [CSI-2->VIN]
> +	 * link_setup operation, while the data type to match comes from the
> +	 * remote subdevice.
>  	 */
> -	for (i = 0; i < priv->info->num_channels; i++) {
> -		u32 vcdt_part;
> +	for (unsigned int i = 0; i < priv->info->num_channels; i++) {
> +		struct v4l2_mbus_frame_desc_entry *entry = NULL;
>  
> +		/* CSI-2 channel disabled (not linked to any VIN). */
>  		if (priv->channel_vc[i] < 0)
>  			continue;
>  
> -		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
> -			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
> +		u32 vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) |
> +				VCDT_VCDTN_EN | VCDT_SEL_DTN_ON;
> +
> +		/*
> +		 * Search the entries that describe the data types on the
> +		 * MIPI CSI-2 Virtual Channel assigned to this CSI-2 channel.
> +		 */
> +		for (unsigned int e = 0; e < fd.num_entries; e++) {
> +			if (fd.entry[e].bus.csi2.vc != priv->channel_vc[i])
> +				continue;
> +
> +			/*
> +			 * If multiple data types are sent on the same MIPI
> +			 * CSI-2 Virtual Channel, disable Data Type matching.
> +			 */
> +			if (entry) {
> +				vcdt_part &= ~VCDT_SEL_DTN_ON;
> +				break;
> +			}
> +
> +			entry = &fd.entry[e];
> +			vcdt_part |= VCDT_SEL_DT(entry->bus.csi2.dt);
> +		}
> +
> +		if (!entry)
> +			continue;
>  
>  		/* Store in correct reg and offset. */
>  		if (i < 2)
>  			vcdt |= vcdt_part << ((i % 2) * 16);
>  		else
>  			vcdt2 |= vcdt_part << ((i % 2) * 16);
> +
> +		dev_dbg(priv->dev, "channel %u: VC = %d, datatype = 0x%x\n",
> +			i, priv->channel_vc[i], entry->bus.csi2.dt);
>  	}
>  
> -	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
> -		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
> -			| FLD_FLD_EN;
> +	/*
> +	 * Configure field handling inspecting the formats of the
> +	 * sink pad streams.
> +	 */
> +	configs = &state->stream_configs;
> +	for (unsigned int i = 0; i < configs->num_configs; ++i) {
> +		const struct v4l2_subdev_stream_config *config = configs->configs;
> +
> +		if (config->pad != RCAR_CSI2_SINK)
> +			continue;
>  
> -		if (priv->mf.height == 240)
> +		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
> +			continue;
> +
> +		fld |= FLD_DET_SEL(1) | FLD_FLD_EN(config->stream);
> +
> +		/* PAL vs NTSC. */
> +		if (config->fmt.height == 240)
>  			fld |= FLD_FLD_NUM(0);
>  		else
>  			fld |= FLD_FLD_NUM(1);
> @@ -870,7 +963,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
>  	phycnt = PHYCNT_ENABLECLK;
>  	phycnt |= (1 << lanes) - 1;
>  
> -	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	mbps = rcsi2_calc_mbps(priv, &fd, lanes);
>  	if (mbps < 0)
>  		return mbps;
>  
> @@ -1049,23 +1142,24 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
>  	return 0;
>  }
>  
> -static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> +				    struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> +	struct v4l2_mbus_frame_desc fd;
>  	unsigned int lanes;
>  	int msps;
>  	int ret;
>  
>  	/* Calculate parameters */
> -	format = rcsi2_code_to_fmt(priv->mf.code);
> -	if (!format)
> -		return -EINVAL;
> -
>  	ret = rcsi2_get_active_lanes(priv, &lanes);
>  	if (ret)
>  		return ret;
>  
> -	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	ret = rcsi2_get_remote_frame_desc(priv, &fd);
> +	if (ret)
> +		return ret;
> +
> +	msps = rcsi2_calc_mbps(priv, &fd, lanes);
>  	if (msps < 0)
>  		return msps;
>  
> @@ -1114,7 +1208,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
>  	return 0;
>  }
>  
> -static int rcsi2_start(struct rcar_csi2 *priv)
> +static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>  {
>  	int ret;
>  
> @@ -1122,7 +1216,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = priv->info->start_receiver(priv);
> +	ret = priv->info->start_receiver(priv, state);
>  	if (ret) {
>  		rcsi2_enter_standby(priv);
>  		return ret;
> @@ -1146,26 +1240,24 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
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
> -	if (enable && priv->stream_count == 0) {
> -		ret = rcsi2_start(priv);
> -		if (ret)
> -			goto out;
> -	} else if (!enable && priv->stream_count == 1) {
> +	if (enable && priv->stream_count == 0)
> +		ret = rcsi2_start(priv, state);
> +	else if (!enable && priv->stream_count == 1)
>  		rcsi2_stop(priv);
> -	}
> +	if (ret)
> +		goto out;
>  
>  	priv->stream_count += enable ? 1 : -1;
>  out:
> -	mutex_unlock(&priv->lock);
> +	v4l2_subdev_unlock_state(state);
>  
>  	return ret;
>  }
> @@ -1310,14 +1402,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
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
> @@ -1340,6 +1435,13 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
>  		return pad;
>  	}
>  
> +	if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {
> +		dev_err(priv->dev,
> +			"Subdev %s bound failed: missing get_frame_desc()\n",
> +			subdev->name);
> +		return -EINVAL;
> +	}
> +
>  	priv->remote = subdev;
>  	priv->remote_pad = pad;
>  
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

