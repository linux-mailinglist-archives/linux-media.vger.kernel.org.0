Return-Path: <linux-media+bounces-41759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026AB435CB
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 10:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2206F686284
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EB22C11D9;
	Thu,  4 Sep 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="a7Oz2wp/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OZmivB4d"
X-Original-To: linux-media@vger.kernel.org
Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7042BE7AB;
	Thu,  4 Sep 2025 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756974793; cv=none; b=kaHnrTlmNra2ksSUHnwlA85qm8g8SDASA+SfuDJZYoRZhZS/bPJXbH4MyGvjdU3RGN9fbNfT6k7yXrf8z2rDR2Wu3WTCneG8XoZ3KhCZwln99TAUdUYHTgzhZMozHnl1rhx/taInVUGNJlooBFoFFnBpZYwH/h4TsztrIXrzwZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756974793; c=relaxed/simple;
	bh=QMc156WtoSHwoqi/fQG9Zopo7d5WjIyJWFRe9bvzkjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvldXcFlbovTaXCAGts33vMMyDwsz70ugojNgnG7z1zyfOoPeC5jG2RNylfHksTfkaEALiEYAIWtoCytIJdfxtYyb2eGg4EpfARHG0tfYtFxCH4Pw5OmtLQ+4IMxMqW/xdKo2hgD8yrwLhMRfI2P6vRUnZqSv+wpIBmv+RVZxUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=a7Oz2wp/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OZmivB4d; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id 22471138007E;
	Thu,  4 Sep 2025 04:33:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 04 Sep 2025 04:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756974790;
	 x=1756981990; bh=Ge3LWeRDjf/4/fWFaTRcCNOOaVH7hBOVvV6LtBvwLVs=; b=
	a7Oz2wp/Lr6CCXTbEtXTQEqdnaTzqhuXeg5oAOW0OYoOq1/zLlt26Alb1NclkU7G
	AQWNVACneUSVnPLAogLUlJI4WM28+ZygiP9zvCK2KvaR1ajJVE8CuDPO+Htreelz
	xmPCRnIXUw6IZgZQaxS+Ei8LZWfFwC/3SjkgHYpmCAIz5u/2W+cw9B7qk4A6gfpW
	XD8cSQ1Vi4FFVoum1ZoBcitQwW4jiAhpMr2GKowGyDcZ+s7jpIBrkvZcGTEDwFpF
	rmg+lUlYJd28kq+1WC5BS0oTgWHQNWOFzZCQL6xDS7WFkRKl8wfHTRn4bb3jZ6QD
	ixauGULjU5XMHY0PY5fhYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756974790; x=
	1756981990; bh=Ge3LWeRDjf/4/fWFaTRcCNOOaVH7hBOVvV6LtBvwLVs=; b=O
	ZmivB4dwZfPVlmHBopD+QagJYu9aK0XzRL3SxwQeOZGC2hMB4If2zUlcHc6dOiQI
	o8K0O9QjMJ2oI2bHgfpPsDCFkGohRoYEgi+6HUwlMVimXDlBWvBDqrLppu0mk6D1
	0WWKSykTDHxRCEeNyGo00zPQ4xj64H9eiJIYZDfxWof7bFTy0seHDLPQeZubzxvT
	Kgysk65/vgvI99FEmEQXIRJZ73AkhfnjEQFN9Eux+Zad8n3aKJYH3fIIYmCG9Gfl
	yl0CSRSv2ANx3TcFFGd4Pdw7ZYcQQwZT3DjN6I4amQBhD9qQ8LmL8ThRnFCsaDtA
	SXzkVhQHqWZU5jOr1RvxA==
X-ME-Sender: <xms:xE65aGfSXTWUUuxu7iDfpgGuvPVwRuT1NKP-HzqqVOT5onUvr5-KtA>
    <xme:xE65aDsFsbNHLZcT0zJQ0PWoDLlG0dDtdX_-UR_uA0xEyN1qE8PvrLDq5PS3lFzjl
    R90s63gER2kDbukHYc>
X-ME-Received: <xmr:xE65aADjh086tO-IuSzPWv7R1qNG5Z3zGVzswPyP5yNyufUj_Qe3j342lkCqxyoJ7TaTmpyucnlriRybyObqo1LIUU6jbei_Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffejgfef
    udfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedvvd
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhsrggrtgdrshgtohhtthesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthh
    grrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehrmhhfrhhfshes
    ghhmrghilhdrtghomhdprhgtphhtthhopehmrghrthhinhhksehpohhsthgvohdruggvpd
    hrtghpthhtohepkhgvrhhnvghlsehpuhhrihdrshhmpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdp
    rhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:xE65aGxDyAQ6_yrAXEMOTPSgYThOClOvGXdEEO1oug1sNJvkY_PrLQ>
    <xmx:xE65aHKwuMdz-ly42WbDA4PFvkqJkKfobcOSyKJ4ft4Ca_khjrum-Q>
    <xmx:xE65aF6dbdUYkHURtEB47_QbLsMA0ynfFfnxWShE4MiwUDuq4PzYLg>
    <xmx:xE65aOlEWf7Rr4n6CKQSb4nafNMcjineDvT8anmeS6WBpe0nRKenYw>
    <xmx:xk65aJmNvrPwa1r7bi4tEiJzKLtX8i2tvdZALOj_b44Gnn7pTqJIgwKx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 04:33:07 -0400 (EDT)
Date: Thu, 4 Sep 2025 10:33:05 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hverkuil@kernel.org, nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v2 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <20250904083305.GB1207681@ragnatech.se>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903102243.1563527-2-isaac.scott@ideasonboard.com>

Hi Issac,

Thanks for your work.

On 2025-09-03 11:22:40 +0100, Isaac Scott wrote:
> Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> connecting to the MIPI CSI receiver of their device. Add a helper
> function that checks the mbus_config for the device driver to allow
> users to define the number of active data lanes through the
> get_mbus_config op.
> 
> If the driver does not implement this op, fall back to using the number
> of data lanes specified in device tree.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
>  include/media/v4l2-common.h           |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6e585bc76367..8683107b3704 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> +
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes)
> +{
> +	struct v4l2_mbus_config mbus_config = {};
> +	struct v4l2_subdev *sd;
> +	unsigned int lanes;
> +	int ret;
> +
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> +			       &mbus_config);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		return ret;

The function prototype is 'unsigned int' and here you return a signed 
value here.

> +

Maybe add a comment here that this check depends on mbus_config being 
zeroed at init if the call above pass with -ENOIOCTLCMD? It's not 
immediately clear what is going on here even tho the code is clever ;-)

> +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> +		return dt_lanes;
> +
> +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +
> +	if (lanes < 0 || lanes > dt_lanes)
> +		return -EINVAL;
> +
> +	return lanes;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /*
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..3f8937260c76 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  	(pad, mul, div)
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div);
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes);
>  #else
>  #define v4l2_get_link_freq(handler, mul, div)		\
>  	__v4l2_get_link_freq_ctrl(handler, mul, div)
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

