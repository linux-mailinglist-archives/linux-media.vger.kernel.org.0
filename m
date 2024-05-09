Return-Path: <linux-media+bounces-11254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D68C196F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A44B0B22098
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDBB129E75;
	Thu,  9 May 2024 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mfopLlbs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NFA+78Ha"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5310A0D;
	Thu,  9 May 2024 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294119; cv=none; b=rTqmxSg8RKKGWR6OruaL3eAb6RK0UeiXoj96awjovsBQKlvUvpENgRmea88R8d2JEPuO6eIRVdvs71JP3/IQd19AzpXXJ7jojZKyL0X4lEvMAr8CI/sauJyK0raD7RXuvjOXYCBMAoySiQG1ZbQakN+FRYP1cWhMnsbC4x7Vtzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294119; c=relaxed/simple;
	bh=69VksyzYvuZo27GogmUOM05ZPGjnE5eMOdwwUd9qG5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogD3hWVknH+ce9+4RoxzLWliXDckDBsleyzpHp6aVn4HSKe7TB+HwkIGMFfTBjxcnnjAp8YZG1x+LMcApoZ0aUjSC7ryRIkaXJvnGElxDudIYRpNgV94YWIzFqmx7ExsklXwX0hyELTTT7QATogPyoi6TC77/ktM17WO1d9xLsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mfopLlbs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NFA+78Ha; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6279311400CD;
	Thu,  9 May 2024 18:35:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 09 May 2024 18:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294116;
	 x=1715380516; bh=WBfwUQqqf/P+fzPqGDhmMNrHhyhweyvpE0bfa2ZNWPA=; b=
	mfopLlbsoipBLqafD8sUZ7U4O0o1C2W38AHxsZDuUS2s1XLD1pdAHwLdrmT2Djco
	ZKGqhwNNmBV9JP7KGWQ8t1QCFlwEF9cj5uZjcpKQ0m46G+iLMan+ZHyJWVIiEfG3
	QFaZcnOfvB/pdfk2H96ZfI1/aON39+g6P7f31H0YTLGBj8xHtuz1rMR2uXPySnrJ
	UjZMMvp7RvE9eB8fOgn5VFqYYUBJgQNa4FjnJ2goFD+r1ho/NAZtcewCt9KoZUoT
	2nWDLKcwAFc0WH9bJZwB0XXD983hN8tceJwOza49kPvtpuUWRql4jrH8p9rhFKLx
	2yD69fP2/15GtaSR1YgXOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294116; x=
	1715380516; bh=WBfwUQqqf/P+fzPqGDhmMNrHhyhweyvpE0bfa2ZNWPA=; b=N
	FA+78Ha4TyvLkvdJ8IzXO9S5F2qFZrsZ5AFdVg9V64xDoCLDVIHdFKpYoxIRqqkK
	0jZwkgQar+E6gz7HNRr+NBKXnLCo6h9TqwBuq6fpVUnO5gwPk6cCl3+Tb8uSzPDq
	HKQ3WPgePkWoRfJuyWRV5QhnC+XlgNyznPBrp7EF1LMbypBJIvOdZtzP2xTmsF2x
	ms/oug17Giezygqn2KofbeBQJpcsjL13C8LhinJW+w5CKMuXawOjgoHUNyk7l+dO
	RtSsv6MYlE8nfiUJVTsLmFJuJCfeHBrDlMXeeFNpsiCHIk1u2VFvFROBfOqhJ7HM
	7FPq47DYVkIhqTgwubOAA==
X-ME-Sender: <xms:pE89Zjr4DA9rqrWfEl_c-9_ux2Fk7MibsCtIzg15DzpU_NmMQf8MBQ>
    <xme:pE89Ztro93j47WBw_ZldjtZq3SeIJxljkTcphV7okEgK5zewE9UCmHcSpemIlTWwf
    EgOD2SYcjUb5e6DkWs>
X-ME-Received: <xmr:pE89ZgNZGulEatUJxu6_qACyWRHYo6liVx6JWT0SNVhua3xYMI7H1qu14KFvJM9R36Q4d4lOi6r_aFl4F1-j4JwiMXAYGto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:pE89Zm4E2Nkoj2uX9fZ-kUogR4IfrHPSp4BgVtnL0yhfno-TWxinkw>
    <xmx:pE89Zi57oIptX9LRi6-DaNGFXkwyrODJEDsR9fNBQjjyx8qWEI3dwQ>
    <xmx:pE89ZuhiTihYgRAUQ0bGYMuvKHZBEvenIxMUFpu1aPKWrk8U5p3ANA>
    <xmx:pE89Zk4eumb6imvP6xDS7DwEC3kya8pYBzG5A3NQyHWlyYj6iIPNEA>
    <xmx:pE89ZkuIbRHJsHAdc-SkZYuJSZQOPhlkG4En0jzc5786W2JllweU12M1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:35:15 -0400 (EDT)
Date: Fri, 10 May 2024 00:35:14 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 02/11] media: rcar-csi2: Disable runtime_pm in probe
 error
Message-ID: <20240509223514.GP1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your patch.

On 2024-05-09 18:13:52 +0200, Jacopo Mondi wrote:
> Disable pm_runtime in the probe() function error path.
> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 582d5e35db0e..249e58c77176 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1914,12 +1914,14 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret < 0)
> -		goto error_async;
> +		goto error_pm_runtime;
>  
>  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
>  
>  	return 0;
>  
> +error_pm_runtime:
> +	pm_runtime_disable(&pdev->dev);
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

