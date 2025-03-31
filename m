Return-Path: <linux-media+bounces-29090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22538A76FFD
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 23:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B4633AA198
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 21:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F6F21B9FC;
	Mon, 31 Mar 2025 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fn/e1LwL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JU2Lwn5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907314601C;
	Mon, 31 Mar 2025 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743455786; cv=none; b=d+FM7FUClWse2M2zP/J5FXqap6kf3fXSHGAfcZxELx//4OpclSBWfsA+IjBWYhRp1azYSlZ3FhPJjDZHVCH2zA3W0ZSUX+j4tCHZzBofP/dC2tFrikKMEZ43Sx7dM3Go7ukTmt+1rdtP806mDAjcpYLX88ntKcixsJjiL+yuco0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743455786; c=relaxed/simple;
	bh=0MsS3fEORZu0b4bxgp0Sf7f1Pjb1PR45/XZhsw0O3fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeCJeqOk7bJmKWZI9piijcOl/J52roGcSBsq1tNVmhaizzUyN98MHyF0+JcM6XE/pGCUGQWjHv1QdMwT/cLkkbkJORVHdmwjjSrsKkNtHi2idniGHNCrzyb0PHj3zkJ4WNpD90NSulladi2mWwR3B97yuxQ0To/88CVeWCz5ShM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fn/e1LwL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JU2Lwn5Y; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 38B77138443D;
	Mon, 31 Mar 2025 17:16:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 31 Mar 2025 17:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743455784;
	 x=1743542184; bh=mX+ZFzMAss4tBFVuniXnFZM3h0fUtgOUseN+LaFKoLA=; b=
	fn/e1LwLt71b3jTWpEfFGkxDxENRil+LmkrFNz39YAjfBybZ89FL5PhGrp4hFMb7
	pjuAgIMwYyW+/BVDTRX9+pGVzNBm/n+f+bCSN9IlqepK5wEqs4jrtAfn1xOEJuIg
	Py5M5t0kdL7P0/QVFLJ71JVSYuy/D6wPMRTrZJ2GpQ8yryRWP9MNIisZghDWcwvP
	P6o90rYYJF+XbPcW9gtlUBRJA3Nud4B5r3OEoX4s7/xl8mBuQ/5szaFeGYYNBGuy
	bnu7++ov4qQVfV9O8Ed9ZTq5Gsr3IoWdxQ4JNG6pfz392fWFamkoNSKitBkKKzZy
	s+OmLB0ZmD4jjZT40PKu8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743455784; x=
	1743542184; bh=mX+ZFzMAss4tBFVuniXnFZM3h0fUtgOUseN+LaFKoLA=; b=J
	U2Lwn5YuAhxF4LKu1+qUAuB/cwyXrhnUr4YGL1BVbqLtpkhQq67F7ZHp5qcQ3Yrr
	cyQfauyHSqzyFcX2PqrOStwp+TY0bTE8WjE5ryeb5Exh0P97S+f6jssluoxyb20A
	g5ElJWEc3cF2shRoTjDa5C06x0a7GaSiJLS94tXW6b9eRBO9w1jqR+naWyFKNAOf
	exukRJ6JnPpCfJVZkY2286UDiwT6AaXMFhjCxO2HIbOO8ZwH1GfvREf89zATEIKM
	QHj+FUbpPnmLh4/jXozc39ueENQUOKsBgFXnnvtT/24JWfKtWa+X56xkyMKepkBW
	XnGYafxZbeSgPrg3Rw1VQ==
X-ME-Sender: <xms:JwbrZ_0FXVu60OLjqsTFP_w58H2wvip1mQl0vGeD-bJ1FlvLq8iO7w>
    <xme:JwbrZ-H2Lq35I5S_z1TL2LTbS-UJFDtSy0GdRNZvXhXQDLJ1ZFCJ2R3YaJ5dG-HoQ
    mBjCbmADDlQs2fTKZY>
X-ME-Received: <xmr:JwbrZ_6bmZvA2AiHShDPstsCXIKN7UyW06b20V-It-9RCLxVgrT4_UwaOKeiNkUcD9Fqw0GG4dGISMGwSz6YKN2YPXiRw_jbSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthh
    gvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgv
    hhgrsgdohhhurgifvghisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:KAbrZ00LmZk7fkZU3HktcX69QwW8WJDqCibk70OWSuUyfyYHRxCDxA>
    <xmx:KAbrZyHCkFOZ8izCbKXfu79nslcGGxrW3CZxuDaC4aGDLFNaZIM1TA>
    <xmx:KAbrZ1_qXriEavJCKIz7uOUiACgRTfiolQrUq7mEJSixprxz7A2QJg>
    <xmx:KAbrZ_m1LKvcKwNpbBG-yXrOyzZ-aJWrjiOGwdInQrymn1t7YQg8Qg>
    <xmx:KAbrZ137N4d8ifcbdvS_zL_sDwi8kheACjzWF1FQiA-GZb2RK4DwG9b6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 17:16:23 -0400 (EDT)
Date: Mon, 31 Mar 2025 23:16:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 2/3] media: rcar-vin: Fix RAW8
Message-ID: <20250331211621.GC1240431@ragnatech.se>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
 <20250324-rcar-fix-raw-v1-2-ae56c1c7a2f6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324-rcar-fix-raw-v1-2-ae56c1c7a2f6@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2025-03-24 13:48:53 +0200, Tomi Valkeinen wrote:
> On Gen4 we need to set VNMC's EXINF to a different value (1) than in
> Gen3 (0). Add a define for this, and set the bit for Gen4.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 972ae2cb3314..53046614f7a1 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -94,6 +94,7 @@
>  #define VNMC_INF_YUV16		(5 << 16)
>  #define VNMC_INF_RGB888		(6 << 16)
>  #define VNMC_INF_RGB666		(7 << 16)
> +#define VNMC_EXINF_RAW8		(1 << 12) /* Gen4 specific */
>  #define VNMC_VUP		(1 << 10)
>  #define VNMC_IM_ODD		(0 << 3)
>  #define VNMC_IM_ODD_EVEN	(1 << 3)
> @@ -791,6 +792,8 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  	case MEDIA_BUS_FMT_Y8_1X8:
>  		vnmc |= VNMC_INF_RAW8;
> +		if (vin->info->model == RCAR_GEN4)
> +			vnmc |= VNMC_EXINF_RAW8;

This is a partial fix for RAW8, but more was needed to capture it 
correctly. But that issue covers more then just RAW8, I will send a 
proper patch to fix that. For this patch,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  		break;
>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>  	case MEDIA_BUS_FMT_SGBRG10_1X10:
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

