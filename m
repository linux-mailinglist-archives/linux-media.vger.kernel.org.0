Return-Path: <linux-media+bounces-34231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32AAD019F
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 641473B1A81
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA33288531;
	Fri,  6 Jun 2025 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OwyHz0dS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EirVsUt+"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1934D2882DE;
	Fri,  6 Jun 2025 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211404; cv=none; b=fu0Mim8lfY8/jbl7fkAMa4xIeY7htS5BburiBhA/APQn4NWgl1M4bjy4vn8pUSVWxrMDbceHvxU3OWp9e8B1b1f+vd74OXjPsH52dPa5rJ9BAs0ezKl+/hbnO1mGgxPsYoX53Mv3sESW45IZ/AbdRntPqaC1Lkm5Bkn1W+4RoGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211404; c=relaxed/simple;
	bh=ItXu5mV3/0ntWGHFjikM6fudcBK1Ei0an4X8RtRpgPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEoCR4//d+r/lGALbI9LPjVubYKeA/J69DImO6iRaz0za57KrQgmqKyN/ivOpnT2eypQOZMt6xZzrY0bkO2Z8AEtRffGTPJisedSzEBGc7WiaWecZCVkXzbYa8xFYAnymUkz1ghjysK5gsIFrburT0BQLFx0S6VPmz5UNcZG46A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OwyHz0dS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EirVsUt+; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 04F261140152;
	Fri,  6 Jun 2025 08:03:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Jun 2025 08:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749211402;
	 x=1749297802; bh=Fj022TFRzcr09PkipTT8Q855tluX6YSmqn8UnY8RXu0=; b=
	OwyHz0dSLwPVcoLeXuaP0b5MRtkMztGA4LtJVm37ydNGv4DJnfwjYPRMsA8GQLW0
	/+SrsEkjPbKK9PJOomZY9Uf+DVtGO8koKs9cIOdvm68oen6v7NihXNMQNhi4LAoL
	8Ke1ZG5NRRYLFvmsrBQbbYrLIOReD4ovWA3fV8i36Xd2/ZuKi++f2GGT59csgP8o
	kAEnL8cLrNlKDio2qa06kCsiayYvRVMJDg1CH7qUhx8qJx6Hapd+x7Dm1Hje+QJY
	eGDl3TxGK2D2zj2yurTBgSNIRrpPW2OT108tH9gSAzthlDiLeb6FQ4W3bm2S7lFf
	YZDSAAanVPS0EQFVV0g7ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749211402; x=
	1749297802; bh=Fj022TFRzcr09PkipTT8Q855tluX6YSmqn8UnY8RXu0=; b=E
	irVsUt+PxjIyCePH5JIZJFHjUpeoGsvbuOMd9BSkgnZoi28+1qaKPljAhKo2vPNy
	JW1Dr7Rlrkt8QsJ0YBga8RBkJFbwZHz1b8lUABciaSLPvP3+Zl0NyF5isWk+7Hq+
	BfeQUXHruLm4n4kyRk/xxUTFetci0Zv9PfhfZIHdZuLeSuENzu4KIW0LTzrBzN2Z
	4ek0ggaW6vpU+89665So3sGFiODiUUrRiC6wpskj0koE9Sas+iPO7hk+VhpTtPuQ
	YSq+JLOgKH6YFktkJ62fwwBfKMfn2UYU9O2KJJUGEtdaEWm/UEYWUfMGMLYSaV3w
	zNkn5zTwNJdv3CZdqt4cA==
X-ME-Sender: <xms:CdlCaDwPTm1hi8gYSLFy2ZATppFxodORt-E2FrYDRMq_Zxo7pjQ0Sw>
    <xme:CdlCaLSAMgcySFfUTch5Nc8Sofo5D1ppoWFpnJQtWYQxy4loq9GNltlm3HH2Sz7tC
    GFhyKDQjlah6YzG8H0>
X-ME-Received: <xmr:CdlCaNXcciVIy7sPbAG2gu5AhE5SWzPoiaoZYZtOnCmzYZujLG9YYIRPRrnb8cjA63hVAOsEBpsqTPLScgaOuNMT2i0-T3uRAA>
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
X-ME-Proxy: <xmx:CdlCaNjQjrPfEpgyQMz76ef_hakII1BIPfZEDOgw6o_WQtbiShfUdA>
    <xmx:CdlCaFDA1NZea8SDZmBmzKOFGhaj-gVSr6vLMK_kaFSXo4A0RYqOXA>
    <xmx:CdlCaGJeBMgnxpZrpzYRxZZDzODHDPYHDn-hA1NW0U3RJ6y9sgBMdw>
    <xmx:CdlCaEDNnYfCIBUXbWR7UnBDJNxwhMohqO3NGC5j9rkzY8yPJJWKbA>
    <xmx:CdlCaHrHYaqkCswSHLZvN9Tds5TJ6CAP8dkCG2Cl0BQQsi8yqpbUM2NV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:03:21 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:03:20 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 05/15] media: rcar-csi2: Move rcar2_calc_mbps()
Message-ID: <20250606120320.GC2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-5-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-5-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-05-30 16:50:34 +0300, Tomi Valkeinen wrote:
> Move the function so that it can call rcsi2_get_active_lanes() in the
> following patch.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 66 +++++++++++++++---------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 698eb0e60f32..8aca35096408 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -951,39 +951,6 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  	return 0;
>  }
>  
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> -			   unsigned int lanes)
> -{
> -	struct media_pad *remote_pad;
> -	struct v4l2_subdev *source;
> -	s64 freq;
> -	u64 mbps;
> -
> -	if (!priv->remote)
> -		return -ENODEV;
> -
> -	source = priv->remote;
> -	remote_pad = &source->entity.pads[priv->remote_pad];
> -
> -	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> -	if (freq < 0) {
> -		int ret = (int)freq;
> -
> -		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> -			source->name, ret);
> -
> -		return ret;
> -	}
> -
> -	mbps = div_u64(freq * 2, MEGA);
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
> @@ -1031,6 +998,39 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> +			   unsigned int lanes)
> +{
> +	struct media_pad *remote_pad;
> +	struct v4l2_subdev *source;
> +	s64 freq;
> +	u64 mbps;
> +
> +	if (!priv->remote)
> +		return -ENODEV;
> +
> +	source = priv->remote;
> +	remote_pad = &source->entity.pads[priv->remote_pad];
> +
> +	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> +	if (freq < 0) {
> +		int ret = (int)freq;
> +
> +		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
> +			source->name, ret);
> +
> +		return ret;
> +	}
> +
> +	mbps = div_u64(freq * 2, MEGA);
> +
> +	/* Adjust for C-PHY, divide by 2.8. */
> +	if (priv->cphy)
> +		mbps = div_u64(mbps * 5, 14);
> +
> +	return mbps;
> +}
> +
>  static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  				     struct v4l2_subdev_state *state)
>  {
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

