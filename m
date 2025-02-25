Return-Path: <linux-media+bounces-26988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD394A45093
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 23:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D68116F45B
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 22:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA41235364;
	Tue, 25 Feb 2025 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="sRiT5u/F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mo6A19Mf"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C023237B;
	Tue, 25 Feb 2025 22:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740524174; cv=none; b=DhvLlnkLvsp+RK8lNOrAL8QGAiM8ezcU/9ZAyf6M1E5qXZB0nUsg6nCqHy53wUi94Kva/tJtB0zqb6G3LvSNezl8B+QWGAOcMLswcsUKTDlUU7th/Hj0au/kjdV98XU1EDxRQ/LM8NDjHNBFCRCNnVVICMuU9Xgk1fc27TaD7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740524174; c=relaxed/simple;
	bh=MLXsjM4OpYPkGdtcQe1WJfFmLK0HKbZxON1wdjGZOE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDw9J+BF9zUAHmR4UpH4uCGpwBXkVpzDrvJchi1dOKXBi5KNVvmUkyHsBDpZwrqiL0w+MngSrRJV2HorrcjtExvGtHTkoXRL+I3XfUP5eFcB3VgREXC3tQYbmXx8Ej2T0uKWwGg4JzmiTEx9/2Xb0WVGdcDRELJkNzng5oqW7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=sRiT5u/F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mo6A19Mf; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 8657A114018F;
	Tue, 25 Feb 2025 17:56:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 25 Feb 2025 17:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740524169;
	 x=1740610569; bh=K598ZDf++Qaq8RRv1ivt1GifhME6grtmW2GDDOtSqEY=; b=
	sRiT5u/FvWW4NmZQx1iSBe7KgVD6a9ZDcsklCaAsUtiwPykwadoR6YCJXluTPRfj
	khykLO9FeSVCsgNkxAPSxJcte2q8yv0OM9hAdODe/ysIM7GRetxHwSZ9hFAHuCNy
	QIH/xIXyF/HIjO0Nxk8v7krfvC9v1s1mYjphkGlodRm+Sc2jsrK4meYozWwoQzX9
	PnmHsxJQ1gEUwdwZoj4fWtFmnAozyYFtGRwgZYETQvbL6RuBe2WlslToP+J052oT
	wBnCP7EVWKXB04e7A5TgbHD5l31mQhFB4VykOs+FX6ro6rFGUvIxdl2daMyV1b6D
	Ag9FHsfuJbMPGDbg5SDGTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740524169; x=
	1740610569; bh=K598ZDf++Qaq8RRv1ivt1GifhME6grtmW2GDDOtSqEY=; b=m
	o6A19Mf71H/0dWgLV2p34JK8b2CJk25P5iX8PYvTyfmLPNFfnbF4iLjmrrQjC6u6
	yBXxd7xhzFrxzS6MzOl0oG/BTGsCSLTtw/lXjJFsKMu5uHehUi05K11aw24hADPP
	aL5WGeyXJG2KMBuHVzOVDcDcYArPK/zZ3F72O2Dyy6sPMynNwx80Pk+fFuUlJM4V
	ZKwBLgsh1DZ0XYnSIl802QQSJZP1h3tHcOFEP2Xf3xz6kKQbLGseCH/QTTue3HQb
	P6HtTDDCtaT4DSX3WDq8j8/dp3ycBhQOZCJdNd1gmQ+x19/W4RMfR+1ZUnKsUo4H
	2Ztysx9iWvlKaAjBxzvIA==
X-ME-Sender: <xms:iUq-Z7iC2c6g9MgtvrLdoi6oHiUZpcznCPbXz7PZzgKWp_GH2IRteQ>
    <xme:iUq-Z4AUpNehvIF1s5pkAJL0VkA-lIo1Gt_qUlnhZpegUz_nqj39iQrJ8OV8GcId7
    iXBFiDDTI-jW7F5yus>
X-ME-Received: <xmr:iUq-Z7ESqBiLEfqlY76Iacf6yhtwhFDjtS8fuYP9WXahhBEGs5Cn8-3KU35x-PBXc3i1E751dB2oq3tNXGnaXQNteAlJEOiqZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrtghophhordhmohhnughiodhrvghn
    vghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnh
    htrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    khhivghrrghnrdgsihhnghhhrghmodhrvghnvghsrghssehiuggvrghsohhnsghorghrug
    drtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    dorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:iUq-Z4Rnan5b3Ch2cS0gU_i3LyWmsjk77fHQI3PPBmZpBvG6AmSIEQ>
    <xmx:iUq-Z4xvQo5c88fYTtEIWR_rG-KqTejovQsUTj99hPMKjxSpJ2rwcw>
    <xmx:iUq-Z-7idwCF4A80qDqbnF9fWHAQIiuMa1O1-TB0OYGv-4ERW48MWA>
    <xmx:iUq-Z9wE8_KnJS0qdqKYEgPjTAnyEEsYpAnNLD-HHVWyoNPN1_uicQ>
    <xmx:iUq-Z7y-O0Wiqn2xnMvva0lANV8_5T49i8yW9qCUWFLhUtW_Jw4-NyNJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 17:56:08 -0500 (EST)
Date: Tue, 25 Feb 2025 23:56:05 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/6] media: renesas: vsp1: Add support for IIF
Message-ID: <20250225225605.GA2676269@ragnatech.se>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2025-02-24 21:19:40 +0100, Jacopo Mondi wrote:
> The IIF (ISP InterFace) is a VSP2 function that reads data from
> external memory using two RPF instances and feed it to the ISP.
> 
> The IIF support is modeled in the vsp1 driver as a new, simple,
> entity type.
> 
> IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
> interfacing. To prepare to support VSPX, support IIF first by
> introducing a new entity and by adjusting the RPF/WPF drivers to
> operate correctly when an IIF is present.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Changes in v2:
> - Collect tags
> - Address review comments from Laurent, a lot of tiny changes here and
>   there but no major redesign worth an entry in the patchset changelog

I'm still no expert on the VSP1 but the changes looks good, so FWIW.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I also tested this with the ISP and it all works as expected,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
> Jacopo Mondi (6):
>       media: vsp1: Add support IIF ISP Interface
>       media: vsp1: Clean FRE interrupt status
>       media: vsp1: dl: Use singleshot DL for VSPX
>       media: vsp1: rwpf: Break out format handling
>       media: vsp1: rwpf: Support RAW Bayer and ISP config
>       media: vsp1: rwpf: Support operations with IIF
> 
>  drivers/media/platform/renesas/vsp1/Makefile      |   2 +-
>  drivers/media/platform/renesas/vsp1/vsp1.h        |   3 +
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c     |   7 +-
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  14 ++-
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 ++
>  drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 133 ++++++++++++++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  26 +++++
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   8 ++
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |  18 ++-
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   | 110 ++++++++++++++++--
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  14 ++-
>  14 files changed, 327 insertions(+), 19 deletions(-)
> ---
> base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
> change-id: 20250123-v4h-iif-a1dda640c95d
> 
> Best regards,
> -- 
> Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

