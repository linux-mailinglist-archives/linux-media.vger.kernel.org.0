Return-Path: <linux-media+bounces-11255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA18C1971
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8245C1C21BAA
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5A9129E76;
	Thu,  9 May 2024 22:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="boNpuWSu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kU6nZW9l"
X-Original-To: linux-media@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7F10A0D;
	Thu,  9 May 2024 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294154; cv=none; b=WCIjwbvl7BmrSmBljT8c0v+KJVPClmrJdFuVVFNb8Rpstig7WpeDkX66p5vplhxXLbtcxwOZzysSiZTAX+8R7r7cEsobkmDKluhhtLK+Bg3NBkb+jd915sR9mvFO6AaTPxIiI7DtgjnZo0Io+pF8P9kC3zXHPk8P3STv69yHR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294154; c=relaxed/simple;
	bh=3HGpHL4QZuI6cjIXLJRIGioMPFet/ME0InzWrtzT1yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiBa0R4ySZ/mCnSTveZUF8+XZA8mKjgcRwM46EiqP6DugDMwTCuUl62WwmW5TjuJRZoqCbjhh0CHj9LJXLCXXKk20SrDweZlVeRVqo35sqjbIZKyB/jvE+gpSc586VLrTdY1qVOGvn9FjPAVQOWvMPiIdXqDf2GK5AebhwBopA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=boNpuWSu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kU6nZW9l; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 65C5F1380282;
	Thu,  9 May 2024 18:35:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 09 May 2024 18:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294150;
	 x=1715380550; bh=X63oLvDpF5E2+/s5P5YgybXWOkVeSXE8aJGEM0HUp3Q=; b=
	boNpuWSuqyWPUMW6SYiSq3KMHJnfHbvR5AkXpcJ+cSRiAARhsPfiQapW1KEBJ3eB
	igHBw7IIL1+8czMCsa0YeakGi2Wzu7B/MZ03e66q1n+coWGIba169nPltBF0pQET
	DKdEx9z7Q9nMXf/gEiWqM7ND904T4nKr84TkU8HTpAwYy3IZLrh972AyTK4Izirw
	FpHQTNzWelrQALqA6YjnmKU3WJmbpy1riL3ZI/O9RifhGfeLs+Lz52gSrib58oxm
	qIMSutJQ8IexYYr9bua4L87uXrh8DZOYeaJut9EujAufm0xuFraJ1AOg0aCwaNfx
	F51GE1c40VumM58N7TAt2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294150; x=
	1715380550; bh=X63oLvDpF5E2+/s5P5YgybXWOkVeSXE8aJGEM0HUp3Q=; b=k
	U6nZW9luLAq/RI5pje1YuqqpikL+Ce598ProkTKfm/8PvnL50DZUgIS6ktB//8gm
	bnFEsv9o/oLmgWnGgr/+kQ9EU7njpJsGtj7XtknYPWbyG20bjVBxuMyMLLWbVYD0
	PXUatdJXVk5dLzH61nc0Y2yzIdsEFYS/H3aIZCFveKJ6X9cOESau/VP++SDpLSzo
	jS3qPTvJA0yLSG/+Ip5+/1pIu2pSQmMESQxWfYSeXfZN4o3iqv6vAKC0BaN8WYWE
	FV9SaNNyYFeRDSIWp3jCgOwr4nnZQlIVAALOsMwY8WG2NydZBiuvL5ApUuYlv9gD
	+NqWr3+uilr8lX4DspnVA==
X-ME-Sender: <xms:xk89ZoPYdWcTokejFgsnuwDTD2kJzNjYUJDkP8mkIJUsX-lHgTL_FA>
    <xme:xk89Zu_9bGjP_Z0WpX_Ee3USKHwjdoHjzzWBUx2heJp7PhvTUb2HsWsFWp9e2Bxmr
    qtGQfPFBZHRraOF1Eg>
X-ME-Received: <xmr:xk89ZvQwQbShtt1D1Rk52mHDAQ_F92aKIjpEknWVxRHFFF2VqRgGkpPIxK3NOn07CKQexcFdm0RvGxRBVZbmYnB2DJbf0P4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:xk89Zgt8kE_JYbcY7840uAEGwXDa8xraEimGsnL0DxRlNapfWh-GZw>
    <xmx:xk89Zgd3XtC8YqLycRztVRhqHJ7SECHcxVWbrGtlu-JT5MOUCiy70g>
    <xmx:xk89Zk2Ug-TT0rV1XjMCWI-bMpJmp-IwJ7N_AA73S3GMX0jKKUqtNg>
    <xmx:xk89Zk_k3HLJbZvDN0EGUS1IptEyISzfw2tUhpYB1AVT4SpHJETRbw>
    <xmx:xk89Znw-Li2QWVzeES17g8JC6ILFgwTCsPtgqsZXIgVT614qo01MYIfw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:35:49 -0400 (EDT)
Date: Fri, 10 May 2024 00:35:48 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 03/11] media: rcar-csi2: Cleanup subdevice in remove()
Message-ID: <20240509223548.GQ1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-4-jacopo.mondi@ideasonboard.com>

HI Jacopo,

Thanks for your work.

On 2024-05-09 18:13:53 +0200, Jacopo Mondi wrote:
> Cleanup the V4L2 subdevice in the driver's remove function to
> ensure its async connection are freed, and guarantee in future that
> the subdev active state is cleaned up.
> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 249e58c77176..2d464e43a5be 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1938,6 +1938,7 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
>  	v4l2_async_unregister_subdev(&priv->subdev);
> +	v4l2_subdev_cleanup(&priv->subdev);
>  
>  	pm_runtime_disable(&pdev->dev);
>  
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

