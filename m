Return-Path: <linux-media+bounces-34243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8567DAD023E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 815E316DBD3
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FA7288538;
	Fri,  6 Jun 2025 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CBAKSw+f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TH90LD6l"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D282874FD;
	Fri,  6 Jun 2025 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213168; cv=none; b=ZUf5IZzyv9g0JvJYvhoei4f2vJ8L3OOl77djYTLBIGz5jr8UhQwHQxsQTF+np4niNGvS4IpNm+uHm/SohNeocKn4XKXe8B0n6P0WXfHVutekLYGeSlteXvduQQLaGTcmWFDLy5+Q5VMXhifVNyD7DCiwFvQZMbNi4s/rPHTrk3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213168; c=relaxed/simple;
	bh=VfMJbgI6+Va2HlS14BKQfeSmAAZDJKqJta7tPbt6A2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIIEHr1hpQiUa0UMTXS5g9SIXO97B/H3y0EmgD7Z/ZwRtMVyaqi+kg71hKxJBwC9P04myJAt24BA+AYBbHh1i9ynAA0+9VTHvxT/aPA8GNmDTVGq0tShuycNNbMzy/twfHcfVnW6ca4cIECFQZjzIPsQPVo/vbWQAgH5uNJKjwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CBAKSw+f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TH90LD6l; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 46CF21380389;
	Fri,  6 Jun 2025 08:32:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 06 Jun 2025 08:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749213166;
	 x=1749299566; bh=HPIAifU+UcaEAaPCiVEIuHnUY6hZnG7Z1iHdlmvHPAo=; b=
	CBAKSw+fniOt4tdCZo/m/9E7RSH1uUI5rdvJUwW0PmqJsmN2WHIOgmZ4WW2h6qvq
	gQbDPobOGRYDSqt0DGfQp+VJf6Dvy1DpAJZsACXEFAwIHri0KskIOH1CbB1nPP1K
	RZifZ47qrquB8vH6K7C0Sfn3u3FciQl3uVbgYgBhN9hhF15HB+PNKO1p2BoecrGK
	Kv8ymP5dsPkoMRl0ywvy/K7DeotV50HzGaEku/cY8ajNuij9M0KCsDCmofD3fd78
	gdX9c6bdqa6fPbShBUjbYJrAcS6Pjgk/tM2NPCDXyMDObgLGFfqS9ojSTF40TyBw
	LJs7gnu15fiYohkaWwOZdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749213166; x=
	1749299566; bh=HPIAifU+UcaEAaPCiVEIuHnUY6hZnG7Z1iHdlmvHPAo=; b=T
	H90LD6lHWo0G+6Nk+T1PN1nS7MHs091yZR5JzcXcnTrSn5vH+IqnMK6lvYX/J/Ej
	u7GIMeLFURICnvApM4DvyOrUuptGG5nHdQYpKatmE36b4TynQ6qgalgjd8FGnX55
	p6EuJ314G2AwHsYQ2awl1sd1h/Qd5zgWdkBPTh2WVIr4XoLWmhXPgBsn0054rnBO
	9cmAj3QKnBT4fzMCa/BDqoq6SXw9D2dfb0TmIoCY91FzqjGneM3LhNQ2YouoY566
	HhR7yeSGc+O3JPsKNp1VOLVxRT1DF3QZ87H6arl4hTrhThgjBDBhdurFfhj9x/NB
	54U7GtQWke/z7kHjin2SQ==
X-ME-Sender: <xms:7t9CaLu6GFBFcBuRMHpySN4rnZZ8nZFh8IuE_gvb7WTrvRsHHS0i7Q>
    <xme:7t9CaMefpeiyGTXq89K4nQh1XVTgOuXklfEeW7LKbqaNtagshYQYfLPdRUJai4qYr
    Gk6-ptsprJTxpla6rI>
X-ME-Received: <xmr:7t9CaOwp5rBppbKowAybQVFAkBBfUtvxpr8eIsYjvWt95umOAJOzRX8O483m640Hp2M-AZikE4_l4ciqbNHLRQyhJXFgHp3_OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefftdeg
    feevfefguedtveevlefgleekuedvfeeggfefheefieejhedulefhjeekgfenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtg
    hhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorg
    hrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrsh
    honhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:7t9CaKNNHa5KJhQ2ZFZcMVysl0_A3Xuqm8vEDv3QuY2Q-yQbRg7fFQ>
    <xmx:7t9CaL9Ewp7KVZSDBpAF9xf7U74j9m2KDX0deoNzys7iJewEK0ZImQ>
    <xmx:7t9CaKV7daV4s0iMhXSl43HbqvVAjhBve8EUmMXc0daB6tPW7Mwmrg>
    <xmx:7t9CaMd01YQngZBkCLrH_sJrKo7PVGK5stVgYYBbnYjCWyjmjYV1UQ>
    <xmx:7t9CaC2u6PO2-BjohjHk64f5C4gEA8HaxZralPVG3DRG20HFugRPH0N4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:32:45 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:32:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 00/15] media: rcar: Streams support
Message-ID: <20250606123244.GJ2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>

Hi Tomi,

On 2025-05-30 16:50:29 +0300, Tomi Valkeinen wrote:
> Add streams support to Renesas rcar platform driver.
> 
> The series attempts to keep compatibility with the current upstream.
> However, in upstream there's some kind of custom multi-stream support
> implemented to the rcar driver, which breaks at patch "media: rcar-csi2:
> Simplify rcsi2_calc_mbps()".
> 
> The behavior should not change when using a single stream.
> 
> Testing is problematic, as the only way currently for me to get multiple
> streams is by using the GMSL2 deserializer add-on board with GMSL2
> serializers. These are not supported in upstream. If someone has the
> hardware and wants to test, I can share the very-WIP branch that
> contains the missing pieces.

I'm happy to see this new version of this work, it looks so clean! I'm 
equally happy to see all the hard-coded assumptions we needed in the 
pipeline to emulate streams before being replaced with core 
functionality!

I have tested this with the single stream use-cases I have had before on 
Gen2, Gen3 and Gen4 and they all seem to function as before, nice work!

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

As this is a rather large series do you think it would make sens to try 
and get some of the preparation/clean up patches merged before the new 
streams support?

> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> Changes in v3:
> - Rebased on top of latest linux-media
> - Dropped dependencies which are already in linux-media (only remaining
>   dependency is v4l2_subdev_get_frame_desc_passthrough)
> - Tested on white-hawk board, using the staging deser TPG
> - Also tested in a WIP branch for GMSL2 (two video streams)
> - Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com
> 
> Changes in v2:
> - Rebased on top of latest upstream, and updated the dependencies to
>   match the latest serieses sent.
> - Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
> - Drop "media: rcar-csi2: Fix typo" (it was not a typo)
> - Update the code in calc_mbps(). The previous method relied on
>   V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
>   provided via get_mbus_config().
> - Dropped dependencies to Niklas' old series which doesn't apply
>   cleanly. It's needed for multi-stream, but not for the current
>   upstream which only has a single stream use case.
> - Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com
> 
> ---
> Tomi Valkeinen (15):
>       media: rcar-csi2: Use the pad version of v4l2_get_link_freq()
>       media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
>       media: rcar-isp: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Move rcar2_calc_mbps()
>       media: rcar-csi2: Simplify rcsi2_calc_mbps()
>       media: rcar-csi2: Optimize rcsi2_calc_mbps()
>       media: rcar-csi2: Switch to Streams API
>       media: rcar-isp: Switch to Streams API
>       media: rcar-csi2: Add .get_frame_desc op
>       media: rcar-isp: Call get_frame_desc to find out VC & DT
>       media: rcar-csi2: Add more stream support to rcsi2_calc_mbps()
>       media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
>       media: rcar-csi2: Add full streams support
>       media: rcar-isp: Add full streams support
> 
>  drivers/media/platform/renesas/rcar-csi2.c      | 426 +++++++++++++++++-------
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 228 ++++++++++---
>  2 files changed, 479 insertions(+), 175 deletions(-)
> ---
> base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
> change-id: 20250219-rcar-streams-1fdea8860e5e
> prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v4
> prerequisite-patch-id: bce4a915a29a64f88ed1bb600c08df37d2ba20c6
> prerequisite-patch-id: 69b75e7dad9ced905cb39a72f18bebbf3e8f998a
> prerequisite-patch-id: 58463f6944c76acd6cf203b14a2836cdb0db2461
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

