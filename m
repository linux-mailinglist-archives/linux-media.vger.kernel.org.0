Return-Path: <linux-media+bounces-40650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D80B30243
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87BF61CC2640
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6D12EAB80;
	Thu, 21 Aug 2025 18:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VgBZe121";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HFgACVPb"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CE5343D8A;
	Thu, 21 Aug 2025 18:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755801923; cv=none; b=BhIjvMIYF6Pi40DHZjflAfBWynZZwJbljRd72ZEHizzVVTSomDtkE+GyeV+Y3z3YdtqIKj+bDSPWtRzK3d2t5QoNARjwmKTlJJmP9oRQlCqXa5gqEAijlmZwzQ1LYbnKse0+igU6QZ25xAaqxV7TmftdacCGjSEZi1p9MvciGDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755801923; c=relaxed/simple;
	bh=IFXUlx+m6ia+iAeyC/QQLg53gENo62SxdMAs+i9FJM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeurMIPe0KoSyxLyHiYNs0g3jnVH50HXqgT6T1EDSEhP/BZSuIPdJp/Tfs/6NK8DmKakB2zHo6TqXEHVBlvDK66zDE/5Y3U7oJ0r3BrUSdosyFnVsK9UBjfJ5/doyYlr1rv6ePFz5/yumDU3FR54wVuWH407+71dxrCdZogTJOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VgBZe121; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HFgACVPb; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C803F1400739;
	Thu, 21 Aug 2025 14:45:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 21 Aug 2025 14:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755801917;
	 x=1755888317; bh=sTbBCHeYh9SBjVQRP6FkYrIR5p7xcav7CZ/jExjE4GM=; b=
	VgBZe121ku0NjMpTzwYd1Cf5L2Vy99GdnBB/i2eF1+3YfUMxwIe7QuOc0cAYKBFl
	EhNZkILKuN5YaKE2FK5BBSWIy3AxcrESH3ojLTN7T2j2JIxHgbY9WkvlJOlcaiU6
	CDIK+aWBOIjOPgI12lwID2zC2cJynnT6AM33G9XxSRIIyH7HHF1AMxsOtq7ivWxL
	KUQpRSQ7pObFqZclz+LOJIHElsvfxPvh7gRGR/GXxXLhCVm1EHBQVO7DWOwx143v
	mZ+l9wAOiP2HMwfg3WqzhLhorUKQ75uqSDzzYGWFSXY5X4ZEQyYzf0Pq2tFNK/1I
	ixxJrl4LN777xlau6aw/tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755801917; x=
	1755888317; bh=sTbBCHeYh9SBjVQRP6FkYrIR5p7xcav7CZ/jExjE4GM=; b=H
	FgACVPbtCIQ/Y3/81ZgmWw2Tk9W9MDACTDyRWx0gbsVSZpcR4sE1RQ0hhsVSVfdC
	5ZDfmt+N2YCf4EL5Ld+icg4bWUFoP+dRDVo4TE2Cj9gH/gCpsiOrTOfqPsmFBhSn
	J/WeUAmoi8N+3lUwYy8s2J5YkAq+vr5tTch9dGuCt7v8Hb+SwQdKGKlIzISdjxfR
	TASwBnM/VV+fj0d7aYiTOmNXFebvelDIhBwXPGKYtphIWTA/vdAdpKEkxLGzCBCk
	cxdMonCzIe4l2cnVtJjgf2YbY+AtabQjdMhBvdp0iVFVipeJq62IKD30RjCimy5Q
	dH4vF5pfpWa4r7By9XDxg==
X-ME-Sender: <xms:PWmnaMx5NLKGaCGpLsuiW2muVygT-NReZNgoE5dM1r20EZawGx128g>
    <xme:PWmnaONrDozBaW9mMClBt52QZbT4zi0ZRvRM6G1sQwCQh7tn9iRgSv0k4j-Hytyql
    LxpdFwNds7B2mX_8iQ>
X-ME-Received: <xmr:PWmnaAojx90TKvyiA7t-BwCB9Tv4Yguo4gGTqBjlGaCIgEcs8jkeRCzWgPopQy4NTn8t8JiJAuc_BtCwUl-z8DxC2TS7Ga2sDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieduleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdorhgvnhgvshgrshesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhs
    ohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmoh
    hnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehsthgrsghlvges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PWmnaPFBQJmdZcBoOnn6GAWN8uyNjPg5gQSuMcQf-8OrR39jVu4CsQ>
    <xmx:PWmnaFoJtKdGbNO9HbH9nBCVctMiCEqbud2GOD5zgF9FIyDwDm-QNw>
    <xmx:PWmnaIamfDlsSNiWu0QdNS_6tfpDOPBuWFrQ9RkbeE2ZrCjHDhb1Gg>
    <xmx:PWmnaOVpZ74FPlsfWCUcVOuBEW6pSAOX2n1f3bUTCLB9M9z5VTYUlw>
    <xmx:PWmnaMGSPqlqr0M4eV3kARcQ9jnt50qqUKpe2kmJjC6xv7BttUD6SZNE>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 14:45:17 -0400 (EDT)
Date: Thu, 21 Aug 2025 20:45:15 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Export missing vsp1_isp_free_buffer symbol
Message-ID: <20250821184515.GF2197757@ragnatech.se>
References: <20250821154241.24348-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821154241.24348-1-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for spotting this.

On 2025-08-21 18:42:41 +0300, Laurent Pinchart wrote:
> The vsp1_isp_free_buffer() function implemented by the vsp1 driver is
> part of the API exposed to the rcar-isp driver. All other symbols except
> that one are properly exported. Fix it.
> 
> Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> index a754b92232bd..1673479be0ff 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> @@ -286,6 +286,7 @@ void vsp1_isp_free_buffer(struct device *dev,
>  	dma_free_coherent(bus_master, buffer_desc->size, buffer_desc->cpu_addr,
>  			  buffer_desc->dma_addr);
>  }
> +EXPORT_SYMBOL_GPL(vsp1_isp_free_buffer);
>  
>  /**
>   * vsp1_isp_start_streaming - Start processing VSPX jobs
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund

