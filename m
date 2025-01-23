Return-Path: <linux-media+bounces-25223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC0A1A9EF
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 20:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434DB3A296F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 19:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA94919149F;
	Thu, 23 Jan 2025 19:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WFli8LfM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W5YGi/HI"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3D14A4FB;
	Thu, 23 Jan 2025 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659023; cv=none; b=kJi4pKN3ybQk4SphOhDEkJfT03VEgfdSnmOzK5VLOtJTzAUn5X5LlHRTgYC6nZTqyA6gkZ+MzYj3evWJTILYOdOP9IBqwXyJU6+kvA2G3E21THujgGVGSBSvPhBSxo15WUgdBYE9t0P0vl2royF8fxwwCTPjzJEtnt0yyRmfRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659023; c=relaxed/simple;
	bh=aqKhhZyLMJ02KbE3BUyXrgG2c62RhuPxkrX4PbCOI24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/WenPjV5kZtyLiGVA6y7RyiFdDbncPZqCKLBLLOn8sFwzFwj7qPn4DRaeUQ10Na70QQAb4hc6OtWvUPDgI8oNtf45N9sg/Ug9vtEH1yJsiTgz1JJoAV73cLLJAwuQOecKsqpz0pF3AKgxMs3szr9aBikGKDGEWHHZuQP4rdUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WFli8LfM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W5YGi/HI; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 3EE0B138022E;
	Thu, 23 Jan 2025 14:03:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 23 Jan 2025 14:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737659019;
	 x=1737745419; bh=/xNJNntAkqVXokkAiicd7XjwXlL2R+5Nf9sPmUX9AeA=; b=
	WFli8LfMv3ozi+cJ2j5VlJaApD4ZHoTLgSq4MRw0wRRoPuMnfiVqyaqlolMS6IDf
	Lw/Pf9yYcQXSU6ubuAAbz7DdNwu6nld4QKhq818qHlvYPNAK+xDEGI1wODyLOt6R
	9WC913GW2rkGqLNgIY2itOWERbWthoAaqph4d8bP8Q+BW+VG+/kTNwzy170+rJwG
	9i/zvgjeaMyvjxWi3E0g8GzP347DtTLDizOv65rozVlW1v6PyZkKlin/WzamiZWx
	QP1pWU/BcdsLPQqbeku4Abt1M2xA6XTOCTrtXzPlByGRU0LLqiIDXPzvzT5VAH1p
	UXKwWu4X8C8O7XJ2iwbJHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737659019; x=
	1737745419; bh=/xNJNntAkqVXokkAiicd7XjwXlL2R+5Nf9sPmUX9AeA=; b=W
	5YGi/HICvv/Tta3XVXxCbBbUB2rugw4sZGos05TCVE3kM4Yym14oHd5xSejOKAxg
	Iaskkzug4lozEz02LVXDbbmTvEbq3lRPJEocoVyhcz3jjgqJ1IKxFj/W/Kmb+gFU
	LiUoi54T70fo3gUere4lefZH2ipARdQLeSy2pBE8ET1o7QeZal4kZu3CcWL7QSYj
	FMCXVWQPCkEBf3ZZIKbjoGJ7Zsr9prH+qe5K1V+N/olPWbOGiMAUy5xrayMVTTkL
	zccHkFxAZ1bIfIiGc0gMlqHzRBS9R63UsOTVcwRj4vLhfhu/UYOLaclz639qOs5o
	VPCKU1yxgO8r+AzXSzixQ==
X-ME-Sender: <xms:ipKSZ0RvNj-6lpveGBwTrcbwaWzO8QLhYkw52gdwshQ_kx8SZAqh6g>
    <xme:ipKSZxyUyqSnkxqsaiAtMYucUdoVRf4RwHLTCBzqRQPOaodNB_zOPWjDsPjwDPzYR
    oDCXUmRTIvwp1Khays>
X-ME-Received: <xmr:ipKSZx2QgvSI5R7lDZTPuHE--PBgOnHypND8kmNC_A4GXdSkl79ZbVVxdb3z74T5RwS-ukM0FwS8Q2y66s-bTMK1kUw0Ne_pJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvdeghecutefuodetggdotefrod
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
    drtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:ipKSZ4DWsK45kwg7novTi8mUxWsTODImbTNipx0p5p1Zk9Xeat8xOQ>
    <xmx:i5KSZ9gYRjzQIQ7galVX4fY3W5Ca3aFQE3nJ9scuEbwWgNAAIKKi0g>
    <xmx:i5KSZ0pAMVw3D5Nqo0ZyX-xjyFcBWSppMx1Y4WSIOKEm2Fy4i1M9sw>
    <xmx:i5KSZwhtkGOk7LaIB_qI9TC-TCfQcR-gu0-xvc5badE-dY4ZwwVrWA>
    <xmx:i5KSZ1hdsftsAlfrcNycmajprtvyYO3CN9pEoZ-n1533MEFlrDgoZpuE>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 14:03:38 -0500 (EST)
Date: Thu, 23 Jan 2025 20:03:37 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/6] media: renesas: vsp1: Add support for IIF
Message-ID: <20250123190337.GL3436806@ragnatech.se>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>

Hi Jacopo,

Thanks for your series.

On 2025-01-23 18:04:01 +0100, Jacopo Mondi wrote:
> The IIF (ISP InterFace) is specialized BRU version that reads data from
> external memory using two RPF instances and feed it to the ISP.
> 
> The IIF support is modeled in the vsp1 driver as a new, simple, entity type.
> 
> IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
> interfacing. To prepare to support VSPX, support IIF first by
> introducing a new entity and by adjusting the RPF/WPF drivers to
> operate correctly when an IIF is present.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

I'm no expert on the VSP1, but the changes looks good. For the whole 
series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Jacopo Mondi (6):
>       media: vsp1: Add support IIF ISP Interface
>       media: vsp1: Enable FREE interrupt
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
>  drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 134 ++++++++++++++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  31 +++++
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   7 ++
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |  66 ++++++-----
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   |  42 +++++--
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  23 +++-
>  14 files changed, 293 insertions(+), 47 deletions(-)
> ---
> base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
> change-id: 20250123-v4h-iif-a1dda640c95d
> 
> Best regards,
> -- 
> Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

