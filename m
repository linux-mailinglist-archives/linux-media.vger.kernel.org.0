Return-Path: <linux-media+bounces-34232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E070FAD01CA
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942A6189D800
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3731F288C9B;
	Fri,  6 Jun 2025 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SuWL0iqd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kK1vmeEd"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155A288C15;
	Fri,  6 Jun 2025 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211627; cv=none; b=gGMNrzmCrNodnXHGKPwiGwNZSLodJWJH+JR1nPVVn+8ao2heJLH+LMKwwh11BtjeNmszgy2svFsjIsqiELbWdDApiKWha6K60jNOp4ESnAHB9D/T/KyybTxrJZGTsAYf+u1EuyxlgMH5/WaBi17ACGY/avxn2DjtkdQIVhGgAtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211627; c=relaxed/simple;
	bh=lg3kmFZQXaT6RdO/u7P41CZ1HWdm8SPqQvfiJsphDpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvg+RvW/mmEw2zzuOFXHVhw8JnDXOwBNnWaqhZ68+PBlCuiuoonb8AXxHpL7ywvNQrTEmuEhjREO/XngnwHfGY0U+/kKrhWWX7AiELIoHISWim4CltZbhD/UQebZclM/cUt9nlHFKuvv8muYBlZaSbgn/u6M2OLkG6gLFksXR8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SuWL0iqd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kK1vmeEd; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 981871140144;
	Fri,  6 Jun 2025 08:07:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 06 Jun 2025 08:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749211624;
	 x=1749298024; bh=nh5POVPYAuUyoy5LaIyDc334XOD2OOPorQvukFMjFAQ=; b=
	SuWL0iqdM2/T8O4OdKzfzfA5S+UNVDQsq7Aev1PitHbEcj4klwnTP2OFZHvChQzO
	fRjMx1EHxooCVH+xG870jWZcR7KjbSbWrpU86IUQOBq/hDgXk/IuRV4pD+NtEr9l
	vfuh7fLnXKhdylEbMtmkX3+qKeXNc32TRKuCdGZ8heNpff+ejIfIP8B7tBiVd+Br
	erLQrr8HsY69ed1FbROU1TCfGySejYys/AsHBPu2g4PTh2kHBSQdVoPwQO98ritK
	dahQ7jwNJeF9T+lIGlbA98lN4fMcoytC7erAloJ5MEhdcYvuYX1GnHxKp8hUkbSw
	D0XbjY/thJNokBiSajZDaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749211624; x=
	1749298024; bh=nh5POVPYAuUyoy5LaIyDc334XOD2OOPorQvukFMjFAQ=; b=k
	K1vmeEdeAkBavAInnZCPJFGQMc/rJjyaksapEtG/kOxv1WdYBQ502N0aQMZV+c3J
	yl+Sr71EPZFqnXl52uCS4GwCJwJYYf805aQKtcgNXAcEN6qdIOiLy7xa3fOevsQp
	L1A21nRaefdoAQi73SPDr64/NLFneRUQwrowaU1fh0kNcKBpW64bfuzP3jHXQLfn
	vN1TswySlrA9JHMqnhin6YfKQRydV6rHYpdoZi/fVd1hnhjhTBCrben+l9VvP7tJ
	vRm8k5xCIKkQovdnf1RBtlJ9VTg8abBdsez4+jM8/SXKs+pOw4TRBA4m3vQ0mCMd
	qDNxnyesr20g3ajWEo/Tg==
X-ME-Sender: <xms:6NlCaGX0EvBx7EIhyI8FXvc349lBq1sksLkmGRqkh-cyD9wFjaFXng>
    <xme:6NlCaCnptmrJMjcAdypzUKypl37c2aTT4FuMQu6eT1zUvpazrlhX1DwlHdMU0DLb8
    q0B4wysvcSTMDPh3C4>
X-ME-Received: <xmr:6NlCaKZ0iDxJjB8vJ2mBwd6T3DHVPQHj_-d45iplg4ZKzqdLfw1ocJHlL7OC0XRl14TaCOhTnrESkN6W5z9Ia9JvSBDIqA3JvA>
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
X-ME-Proxy: <xmx:6NlCaNU60iCqoZUxCO4TOZGqQNVectzPJOd-XvXGVBAXEuSh-WvLrA>
    <xmx:6NlCaAkv_giklsOeq-tmxLMa4Uroskr-R6hFvNTB9EdS37CWUlJ31w>
    <xmx:6NlCaCe5rt2585NfMWkRqkNvJYvdH_YloVK63NQVBy7quDf11jGXdg>
    <xmx:6NlCaCFxT1Kb_7G0HFEjNSHaTdxKkipAkCzxo70Jy1s0nFuN0HKxvw>
    <xmx:6NlCaE_nwb1jaMssEFXpDARl9as58qtxQdEzp-AVlUyFE0uebzSqQe1c>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:07:03 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:07:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 07/15] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Message-ID: <20250606120702.GD2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-7-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-7-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-05-30 16:50:36 +0300, Tomi Valkeinen wrote:
> With modern drivers supporting link-freq, we don't need to do any
> calculations based on the bpp and number of lanes when figuring out the
> link frequency. However, the code currently always runs code to get the
> bpp and number of lanes.
> 
> Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
> when querying the link-freq is not supported by the upstream subdevice.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

I wonder if it make sens to add a dev_warn_once() for the old call path 
so we won't forget to update all known users of this old way, and once 
fixed we can remove the huristic method all together?

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 50 +++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 90973f3cba38..e0a0fd96459b 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1001,15 +1001,10 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  			   struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	struct v4l2_mbus_framefmt *fmt;
>  	struct media_pad *remote_pad;
>  	struct v4l2_subdev *source;
> -	unsigned int lanes;
> -	unsigned int bpp;
>  	s64 freq;
>  	u64 mbps;
> -	int ret;
>  
>  	if (!priv->remote)
>  		return -ENODEV;
> @@ -1017,28 +1012,41 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  	source = priv->remote;
>  	remote_pad = &source->entity.pads[priv->remote_pad];
>  
> -	ret = rcsi2_get_active_lanes(priv, &lanes);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * First try to get the real link freq. If that fails, try the heuristic
> +	 * method with bpp and lanes (but that only works for one route).
> +	 */
> +	freq = v4l2_get_link_freq(remote_pad, 0, 0);
> +	if (freq < 0) {
> +		const struct rcar_csi2_format *format;
> +		struct v4l2_mbus_framefmt *fmt;
> +		unsigned int lanes;
> +		unsigned int bpp;
> +		int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> -	if (!fmt)
> -		return -EINVAL;
> +		ret = rcsi2_get_active_lanes(priv, &lanes);
> +		if (ret)
> +			return ret;
>  
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +		if (!fmt)
> +			return -EINVAL;
>  
> -	bpp = format->bpp;
> +		format = rcsi2_code_to_fmt(fmt->code);
> +		if (!format)
> +			return -EINVAL;
>  
> -	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> -	if (freq < 0) {
> -		int ret = (int)freq;
> +		bpp = format->bpp;
>  
> -		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> -			source->name, ret);
> +		freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> +		if (freq < 0) {
> +			int ret = (int)freq;
>  
> -		return ret;
> +			dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> +				source->name, ret);
> +
> +			return ret;
> +		}
>  	}
>  
>  	mbps = div_u64(freq * 2, MEGA);
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

