Return-Path: <linux-media+bounces-34242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B807AAD0229
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78F991795BC
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9DC288511;
	Fri,  6 Jun 2025 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UdM7Ona6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xm7vQ7c+"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E1727FD5A;
	Fri,  6 Jun 2025 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212705; cv=none; b=eiGgWQ19/GV5sOc2dqr4K7l2Bz28hRFAD+B21RCUiWbxmRiLhDxK9qCdKO9cYTifZomXnQzmNGPt7f3OTGLT6ElmXtex5WgGC6EK7YOGUhD7vJ/wANrQ5q1pxeh5gn1YaHppFB3Knpe2LbcduuRjsHLJ0AfZohprmZb0rNhfi/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212705; c=relaxed/simple;
	bh=/LwMGNERnTE/Re/wZKCZmRuWogdYPaqVaY5+sEEkS74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvRg0Oj1LJCM2QUQ1ny+SksyKMsYow282KzemnLrQtog0t7dJvYYa01o0Jr5SPlldA3LtPTq+leEg5dod4PXDv1C1InjnI3X/hV0AkHI3sa3Mp7ya9D5t6w/FmPmEenDzslaXWqKdG8PEcvAgu8dV3UAT3rsOtreiZ8B4ZsnCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UdM7Ona6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xm7vQ7c+; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id F298C138036D;
	Fri,  6 Jun 2025 08:25:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Jun 2025 08:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749212702;
	 x=1749299102; bh=+Yz74keYzlcBJNNckM7243Jd6xVKNRMOXRAFhHTjxas=; b=
	UdM7Ona6Ut6PD/qIdX82XAxCiZuA/Adbumg/LCKzkMK0NLe4qu3PSXrMBziA5CYz
	yRefFtROBCuzKl3ZSbN32jbfWaqlxA7jYAWykS3FexMo5Npsdx0TykmLQLRXMZ2E
	BNL0SXAAxXoeHbR4P4GNJGs4nmoETzapCUh5nngJ8ssfiKCi3XAqFwjz4HlxP4tj
	CtyiRujKGqyRuVT6G8xA/BSdN4jlb3+ZMlkLAWxpGxlnfNzjVXxbsAaWzs/cFiUq
	H0CH93D7gIH+uW02qIqNOx9L2rdzBwkNjPCoa9aRt5rk9mfli619Pz9a32CFBRbj
	1/hId4bVBh99J+lP5ALhqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749212702; x=
	1749299102; bh=+Yz74keYzlcBJNNckM7243Jd6xVKNRMOXRAFhHTjxas=; b=X
	m7vQ7c+IJ/MTG99KovrXlXaMcJjLxF0WGTj5CzvktubnhaEff7q5G3wijb1PJJgY
	jov1HjVoXboW4t8WwxBQ3H/BZGbTorgr0A528ZC3h6PYQq1XSO5/vhmksuZL0pO4
	oe/D7XNJwnqxyxS6kHtZv8+HKLkM0lJGTuJ+VkqzNv1Uofz1xSVaO9jDj1UzGLqJ
	zarGv7ME/cQYjKY/9cH2rVgFZlownRB/lOD+4ncSWCqA8IVhvAqL10hiPveOoYnq
	pwW0WEZ4T2/Y9qS+bMslr9MhcOCkgDkZLWU9OvVWVKfHAu0bR/Hq2OmHWbA2Hc8j
	6TYXD9VdePZqPMLyCi0dA==
X-ME-Sender: <xms:Ht5CaGkusookHOrOUDU6-qelVeXWxQlDx3Yplu0BSrN5i2olUjDXnw>
    <xme:Ht5CaN00UkJvH4GaDmUCx-Yr6FoJd504FUQQBERoqhIrpA6EZA7M78JW7JzeMo8YE
    c1iplg5RI4IuUYrZ_Q>
X-ME-Received: <xmr:Ht5CaEpom3F2vzEHktGzPLyWjqsj7i2ba7D47hTWoys_gMh39kjALn2TA9iqH3XPuK66r8ZwBjRSQDfeXYP1QvIQc__4Sh56Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Ht5CaKlP-ZMblpyyypBd6H9uCIWZdisxthkJsSdIknbwWfUo5y5Uzw>
    <xmx:Ht5CaE2FyDglCNfV38epkX9UGNUgEU1Gq1R13FHkiC182b18mU1HRA>
    <xmx:Ht5CaBuMBn9ScmrenkmJorZzbDhgPCqTB6CDC6bMOckiUXEn9JQEdQ>
    <xmx:Ht5CaAV7K_1Dr4LVAcN0xsFnopFTHKqikrTlA8W39NKl2omvWgNR5w>
    <xmx:Ht5CaIMUBaTPPx0JbdivynujZCNEotjvaPSsWmzHLCGuDPmsiX_0EUEq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:25:01 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:25:00 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 12/15] media: rcar-csi2: Add more stream support to
 rcsi2_calc_mbps()
Message-ID: <20250606122500.GI2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-12-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-12-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2025-05-30 16:50:41 +0300, Tomi Valkeinen wrote:
> In the case where link-freq is not available, make sure we fail if there
> are more than one stream configured, and also use the correct stream
> number for that single stream.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

With Laurent's comments addressed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 65c7f3040696..b9f83aae725a 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1018,17 +1018,22 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  	 */
>  	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>  	if (freq < 0) {
> +		struct v4l2_subdev_route *route = &state->routing.routes[0];
>  		const struct rcar_csi2_format *format;
>  		struct v4l2_mbus_framefmt *fmt;
>  		unsigned int lanes;
>  		unsigned int bpp;
>  		int ret;
>  
> +		if (state->routing.num_routes > 1)
> +			return -EINVAL;
> +
>  		ret = rcsi2_get_active_lanes(priv, &lanes);
>  		if (ret)
>  			return ret;
>  
> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
>  		if (!fmt)
>  			return -EINVAL;
>  
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

