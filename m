Return-Path: <linux-media+bounces-60450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE3TCmsL+mlsIgMAu9opvQ
	(envelope-from <linux-media+bounces-60450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:23:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF66F4D0235
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0380301B4C5
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 15:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F80C481672;
	Tue,  5 May 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ntYGHvNL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fprwOWxz"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181748097C;
	Tue,  5 May 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994598; cv=none; b=l62MwfCEEpbSmIJdmVwxPjVNEKfB9DrPpNGuFZqBCkZ+shntuhmrNR8lBw4SHCnjjW9uM32DvdH0FlpfHA2WtaUbAwFAvw06ncRgbxET+FrW0pk7Xycv+hKOKJ3/Cjbjp4roEjSLXg3cbnEgeAil1S/bqfmePHWjvHzH6HMEip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994598; c=relaxed/simple;
	bh=w7Usc8DvG9s4dYSZIamtu/5mLk2vhYHVIjuyQQ6J644=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWxmdGBKssNhg3COBqOsWSdIeezGfPewHkEF6tnn2O56734bpn2KD+gXqsH70VEOuuB+QcnTjOt1tG99bcRaUs6bNO5+Gwe4P4+SHWoXkPoEsjRdaoU9smoMMbEsphL0eiug73c5BiWjH6WY/p7G4cmpQf5tlSqCa2gbqBchTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ntYGHvNL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fprwOWxz; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6DDEE1D0008F;
	Tue,  5 May 2026 11:23:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 05 May 2026 11:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777994596;
	 x=1778080996; bh=fz/w0oN2ynZI5HZrsKY8slTvp8bAetNzyz/hKWXVBRs=; b=
	ntYGHvNLivQxEl/r9/ukhu1Dhs7xvShQAuhLz638n89q+/jriEHM9VFeb1VRbGC4
	ZXSiuYYwThCA9YpDMHFD6DxHY5faxucnqJDHuWN0BGZ3IpH7QTQPAmZTiIv/lAwZ
	7F3ahkomwLtP+rk6FNrbRxQtsn1ydazXgj/1X8n2mDv5IWRX7ME3F/XEu7J+iIaT
	1mEuag3sal1IKwRMQCQSIJodZanJZWFoKlDPnJLzD2H1euuasMMygXXOfhpKtexX
	xrdTMCveNjdeE78VaXvBE7MoQvPd7OeYVJkn1dzpNALt6gTQk0lYRG+OntI0/ilJ
	72YEpcWh/e34nyIDJDf5Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777994596; x=
	1778080996; bh=fz/w0oN2ynZI5HZrsKY8slTvp8bAetNzyz/hKWXVBRs=; b=f
	prwOWxzs8HRJjFs4SjdWvdbHYjD8DD4yuRbzUcEO/K2u34rWxdVWMdLgpRVdAAgK
	mh3eiAD1R7mZ9/ODKPElrORTAu1rWUicJtFoBQLJAO84QB0ukAd/Gq1mArjEy744
	5mmc3eP/8IM32PxSUUKLx96Q5rKIXyUTT8dIsaLKQ+O3mio0GsTfm73fgFZsmjiS
	dGG7JkOkQ3b/UqWzW1VuEkZ8TsGOVvFPCLgN+5YnRv9uQ7QngYc75lK6MyaEzF+W
	+U8E3p/BQuv834LhmjuE1hT3BXwWk+2deLjM4+vxsIu+Q69qmZo2OQLlu+uQVVrj
	o6GgrZNwMm6dWqmISVTng==
X-ME-Sender: <xms:Ywv6adaNDsVdATJLWmWjYVNHoxCvi72_2cM6UKOK2hruO_bSJEt46A>
    <xme:Ywv6aaYf6yhnVGoEMPrRYnjSztKdxjdXWnC-0XQHVSxMn8IYhVBWxsHoUSGYWGh-Q
    zYe9IbtNgfbQbAs2DQMN7lVP8FB-Hbu0fSbM7PFqHg4ZWVOCLeLuA>
X-ME-Received: <xmr:Ywv6aawGVF-03eODMg9pU5Oj2tYxPN9BSDjVxPjcP8h0-rmLNNoqUVRdk1R-G2X-SsIudtBrHsGJ-MWbZmALTTPFNqvZhJVXdZoc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddvtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsoh
    grrhgurdgtohhmpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrsehiuggvrghsohhnsgho
    rghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthht
    ohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Ywv6aedvxyX01R3BgtK7rSABzJFD5yuf0KJHRtIfWf3QfdgkENH1wA>
    <xmx:Ywv6aX7x4kju-GYmAsZAKovR2tjk7Eb5Z8BwQtoiCiJVWzmlYPUqKw>
    <xmx:Ywv6abKMODQiFPtZtt--f-FdyKal5yGKNegRqgu0wKpENlbdzErRsw>
    <xmx:Ywv6aXwX4hH1paAJ1DohhYcqoh7kY_FawSkeNGqAStzSho_eHM357g>
    <xmx:ZAv6aXOYsjvIjY5l5VIacUtylwUF0J-mYXDMqW9Q1mb_VM1VF7scakjF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 11:23:15 -0400 (EDT)
Date: Tue, 5 May 2026 17:23:14 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: rcar-vin: Drop min_queued_buffers
Message-ID: <20260505152314.GF683841@ragnatech.se>
References: <20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com>
X-Rspamd-Queue-Id: DF66F4D0235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60450-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]

Hi Jacopo,

Thanks for your work.

On 2026-05-04 14:43:14 +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The R-Car VIN driver already uses a scratch buffer to sustain capture
> operations in absence of a frame buffer provided by userspace.
> 
> There is no reason to require 4 buffers queued at all times for the
> driver to operate. Drop min_queued_buffers from the VIN driver to allow
> single-frame capture operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> This allows to capture a single frame when the R-Car VIN is used
> to feed the R-Car ISP on R-Car V4H.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index f9af9177e02f..73cda0e2d45a 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1494,7 +1494,6 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
>  	q->ops = &rvin_qops;
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 4;
>  	q->dev = vin->dev;
>  
>  	ret = vb2_queue_init(q);
> 
> ---
> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
> change-id: 20260504-rcar-vin-min-queued-buffs-31891f226fe6
> 
> Best regards,
> -- 
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

