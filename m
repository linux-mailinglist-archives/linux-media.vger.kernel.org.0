Return-Path: <linux-media+bounces-34230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53757AD0199
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B43467A284A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FEE2882C2;
	Fri,  6 Jun 2025 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eqFQyPfQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e+XB/RZV"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806BE1E25ED;
	Fri,  6 Jun 2025 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211329; cv=none; b=N0dl3ceEzzpDBuwfsMBHLME/8GNT0ZhmDUZKUNRaJ8ZgqCQCbOHlCh3l4UPz6zCmW3WwaUUz5cA2Dbg91qaWdBDw0eQv9wr6b9RLcBJSXrvwYJK9zGWh4qY2XHzSDLeAyDl2hJWDwnQbpFCVocgk1WiT5geoSyDajGbyqoXK+mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211329; c=relaxed/simple;
	bh=lehcra6IGALpqmalurFJkLUkRed2UEtrzqdw0mPZm84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ9GcF5XGr82SyZxSU3BGw+uAYXrJfE2kAYIbb3n/ZEmTswbcKX2ZtRqGFwc1oqNy20RkL0oXFJbY6khI2UGPpgLggOBDdUAkaMaauYRqtA1siHGtC7SOShciynAuYcREqFAsbI3PrAolNYM5pzQJvCFv4OEeYd+6X+HJYl9sok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eqFQyPfQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e+XB/RZV; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 8D983138034B;
	Fri,  6 Jun 2025 08:02:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 06 Jun 2025 08:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749211326;
	 x=1749297726; bh=Obfl9LVjZme1N6jc3cwqyAP+xIrat0n5RtphV2HZsYo=; b=
	eqFQyPfQ/2uz2Hf90IC7OpGPKwzj2va86tcIwI74xuggpcGj0V1DTWPziBGqrOOl
	jmIVqUh0tHevUARLzv6NGTuQ043gBlNO39iJ9+BGflLkeMqrdinEJF1cAH1JrVFE
	gG+l8c+yU7lTxvjkh3aWMJMdTN+tesP58yZC+i6nP7zz17IysYaUBdoxiIJs/nMX
	i6jRolK/n1ZFvXau8ayW+yYFiD7eNeAxirSglx+9LTlCUWxdXNTQkil38kVKWmpG
	fl90Ciy/+2aEhg9BJNTPTb5xU6EXHlnqJt5uVKpEj9AfkmSOR43ThRZ9HyGbckM5
	XeSK2t7uLdRe3Jvl7b5X8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749211326; x=
	1749297726; bh=Obfl9LVjZme1N6jc3cwqyAP+xIrat0n5RtphV2HZsYo=; b=e
	+XB/RZVVF5um3WjDqG+JtiNfzuEiG5U7WYHRXrg7LCaAPG8jMy7dt4KdHTjJIuIT
	W0JO5Zo2dhXHtpBql0BUsIgQWa6WDYsLbjU+M8bkMelzKQB8IVADMdFuYIWFMQxe
	hjFmXmZWdE5SSI0p7Tbcgu9Hwaet0NWVkZnkdveqW0shywnKqUKxkGADi6XIa69x
	tCXwdTgWA773qwNhynSBpnA1FRHWy+oUrZ/ooK6KKkOpn/R+sUCSmMXYf3B3Nrk1
	ijrXxwrNZ8BGc4oKG8ErGYW69/mQeUzhHbsK9WqTxJBV1vBVsyAerq2txzk6hFOS
	82r4nfCiyFB9R0GhOo0gQ==
X-ME-Sender: <xms:vthCaG79hNryUfREJyuP0Dwf47hMh9OxsqNNHK0QSXYQHRqirXU6_A>
    <xme:vthCaP7XrtNJbzZBjAch0FStDLfrd_EMhIXIwraY4zwVa8HrvCl9ElPkfBJ1bU8ys
    i65wZ2i05H6kRY8pUw>
X-ME-Received: <xmr:vthCaFeDCJE3rVQTtWvFp9PWls1Eg3VNz_KL7Nx71oWu5a648oq9OXxNJsO66IdG8ZYZz4pwARr6T34ftYex7Do6TfSaLDM-yQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhh
    grsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghs
    qdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgr
    sgdohhhurgifvghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrd
    hpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgr
    tghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:vthCaDKCtzFjbKXjC3thKaN-8KY038v7xA66A-3tWHnd-ieicRkuWA>
    <xmx:vthCaKIfd6jP1gRXqGjWMqnFzEby_UHoAcU_yK5jNTtGi9eYfwQ-bg>
    <xmx:vthCaEygYudWqvWGx_N_kRHEYco4K_pv_Ul4lghc4vBWlWkl7tqD1A>
    <xmx:vthCaOIZsEHL9CI8J-k_H6K6jLuubDIn2O3lnDmc950b-UwOXwC9ww>
    <xmx:vthCaIQBknF3LjVfWfs5ad4Z32s5y7Xwblc3kH41SNxCeuyncEJoG6hP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:02:05 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:02:04 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 06/15] media: rcar-csi2: Simplify rcsi2_calc_mbps()
Message-ID: <20250606120204.GB2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-6-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-6-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2025-05-30 16:50:35 +0300, Tomi Valkeinen wrote:
> Instead of taking the bpp and the number of lanes as parameters to
> rcsi2_calc_mbps(), change the function to get those parameters inside
> the function. This centralizes the code a bit and makes it easier to add
> streams support.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 45 ++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 8aca35096408..90973f3cba38 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -998,13 +998,18 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> -			   unsigned int lanes)
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
> +			   struct v4l2_subdev_state *state)
>  {
> +	const struct rcar_csi2_format *format;
> +	struct v4l2_mbus_framefmt *fmt;
>  	struct media_pad *remote_pad;
>  	struct v4l2_subdev *source;
> +	unsigned int lanes;
> +	unsigned int bpp;
>  	s64 freq;
>  	u64 mbps;
> +	int ret;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
> @@ -1012,6 +1017,20 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  	source = priv->remote;
>  	remote_pad = &source->entity.pads[priv->remote_pad];
>  
> +	ret = rcsi2_get_active_lanes(priv, &lanes);
> +	if (ret)
> +		return ret;
> +
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	format = rcsi2_code_to_fmt(fmt->code);
> +	if (!format)
> +		return -EINVAL;
> +
> +	bpp = format->bpp;
> +
>  	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
>  	if (freq < 0) {
>  		int ret = (int)freq;
> @@ -1092,7 +1111,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  	phycnt = PHYCNT_ENABLECLK;
>  	phycnt |= (1 << lanes) - 1;
>  
> -	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	mbps = rcsi2_calc_mbps(priv, state);
>  	if (mbps < 0)
>  		return mbps;
>  
> @@ -1300,23 +1319,15 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
>  static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>  				    struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int msps;
>  	int ret;
>  
> -	/* Use the format on the sink pad to compute the receiver config. */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> -
>  	ret = rcsi2_get_active_lanes(priv, &lanes);
>  	if (ret)
>  		return ret;
>  
> -	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	msps = rcsi2_calc_mbps(priv, state);
>  	if (msps < 0)
>  		return msps;
>  
> @@ -1494,23 +1505,15 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
>  static int rcsi2_start_receiver_v4m(struct rcar_csi2 *priv,
>  				    struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	const struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int mbps;
>  	int ret;
>  
> -	/* Calculate parameters */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> -
>  	ret = rcsi2_get_active_lanes(priv, &lanes);
>  	if (ret)
>  		return ret;
>  
> -	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	mbps = rcsi2_calc_mbps(priv, state);
>  	if (mbps < 0)
>  		return mbps;
>  
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

