Return-Path: <linux-media+bounces-25077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C3A18845
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0338E7A253B
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1F21F8AF9;
	Tue, 21 Jan 2025 23:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="j5L4/n0+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l78uTOQY"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD381AA791;
	Tue, 21 Jan 2025 23:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501635; cv=none; b=OLyNgPF4KyPbovuVY6Gn+rhVpSl9FqS1ituUkKwe5MOVhQcyL7T75tvpct5Tidy7DPPDuA//mr2xJLzch93m4JJhuxMorLni8Sk81A5BdtqEiZQwslMyB9j6yuWQNGNofY+0vgtxVYS3PuZyGwbSUXXJih6oKgo3Mfn/gTfMORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501635; c=relaxed/simple;
	bh=/1rNoWasNEKZjbgLkeArIBKLFV1l+u33st4Wv9xVyRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ubiHVO86M1bkjRQks7ARmt7sNSJFeHlZp26tJ7dZQcZvEUL+uw+FeNFDJFnRZhWPqAio/40gNPct6ay8gig7FNRWMJKB75J62hhBv/TISxCu6m2V5SLxU5VvmVLSLoAHY5FCqM4maCR0j7LJ0UlpF9Qs4+DJau3xtFcj2PoJoPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=j5L4/n0+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l78uTOQY; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BE1772540222;
	Tue, 21 Jan 2025 18:20:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 21 Jan 2025 18:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737501630; x=1737588030; bh=7H
	n8jgkhErA1R0Tlj0M3Rg/SDSF+HMstYXqIT3CYfcc=; b=j5L4/n0++iOBcd/tsZ
	RBr2LrH4SJNUTO/IvNL30nGeDjyCfw/Hx8K/TjLGnVGBYEVTzrZwvIyOLWyw+f16
	ZwuedJZSQ4n3+Chag4flMmaqHlOWdovza0StGQT4GZ6Giam98txsIHznU/FGRAHr
	X0TaMLKWChWDYLvR/EAMbQmBNLsGHfhxUw24H9NJt7i1M0b0SC579D3CcWTugIsd
	KjE8OiVqRALZhoDVTxIvKvfmbc0e8T5Bs+2ytAjYK6n965iD/rW2U7pw3AWXs5bk
	D7fE2HyiOEmx7gTfcIeFx/twQxRvGR7iHUgDIWKWo3MbE1A9wHyKdwHbKp1dhKwk
	h61Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1737501630; x=1737588030; bh=7Hn8jgkhErA1R0Tlj0M3Rg/SDSF+
	HMstYXqIT3CYfcc=; b=l78uTOQYGtFa5Ai84fisMG76R0pSaIud0U6MWaWa0suh
	SU5fWIMqmF9G6gIw/FFJpVGohwkAgkLMRRoO19LdeACYnAHctaidpH+dPvmG+sxP
	vw2fwvn/GjBcbt04m/A3+gmDiylds8wHHB1UJaIECR0/dfpV2B3dN81orLBmDCXc
	9f3WdeQyPgNuENPzX2tXvHPFoNyKtQ+RWxoEQzb6mDdEwzsPibVlqzGm16UR8ePY
	jZ3a8yjYZ/JR9jDRLLyox8Z0BSuq5QmRWdQ+wtaYQGwhFvuDvlEw769QRzKjyvF4
	0aQvwafzK4/R4BpcMgk4YCTVDoIeUDfhkE5QdBDaHw==
X-ME-Sender: <xms:viuQZ7Bdduwa3rQ-t2pRK6BvrSgCtNzQch_Y7DI4AMbLWn-VjPf34g>
    <xme:viuQZxggyEzloSr1FreFKfmY-FTYPspP4ivdwXJevvjNL7e7rIv4naLbaj2ssL3EN
    Y03kvrDj43AAe7I4Yk>
X-ME-Received: <xmr:viuQZ2mSi9vNMEOG2DrBWsR2sv4u8imh3Us_dLgwt6mVMocYIIk1HQ6EDiSWJ4D1739dcSGxf97r6sluUQNNR82W9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    sheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgv
    shgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmh
    gvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhr
    vghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnh
    hikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhs
    vg
X-ME-Proxy: <xmx:viuQZ9wYpyuNatvAgR-mkqccgZkzhpcQd75_N18rbgyKqMd9LW80xg>
    <xmx:viuQZwQCj6WywjcX0uUhnU_s2iznT1RCDGjwwtJRajgNNT5ecs9ndg>
    <xmx:viuQZwYQSs6H9WyfqRR6GeTxvNdn-sb9_9j_x0ZVRZTIf1XyPtiiHA>
    <xmx:viuQZxTIE8xZM42lDtiIq5LU_H_2RDzHY9u48bt2Dm_MHBzrFUFuqg>
    <xmx:viuQZ_GO9hU53Jbe5EGtr81lg7__EhwCXQprj0rvHjctlqbq54cBfRi8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 18:20:29 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
Date: Wed, 22 Jan 2025 00:19:22 +0100
Message-ID: <20250121231927.187463-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

When the driver was converted from soc_camera emulated support for
V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT where added. This was done by
capturing twice to the same VB2 buffer, but at different offsets.

This trend out to be a bad idea and the wrong place to try and emulate 
this kind of thing. Further more it is fragile when it comes to things 
like suspend/resume and scaling. Just how fragile it was have been made 
more apparent when more features where added to the driver for things 
the hardware really can do.

If user-space really want to capture things in a SEQ_{TB,BT} fashion 
this emulation of capturing twice to the same buffer with a different 
offset can be emulated their instead of the kernel, where it always 
should have been.

This series removes this emulation in patch 1/5 and then proceeds to 
remove a lot of cruft code needed to support it. The primary cleanups in 
patch 2/5 - 4/5 revolve around simplifying the VIN internal state 
tracking from 5 to 2 states needed to support the emulation.

Finally patch 5/5 removes a hack in the R-Car CSI-2 driver which was 
added to support this emulation, and is no longer needed.

I have tested this on Gen2, Gen3 and Gen4 without hitting any 
regressions or other issues, other then of course SEQ_{TB,BT} are no 
longer enumerated as output formats.

Niklas Söderlund (5):
  media: rcar-vin: Remove emulated SEQ_{TB,BT}
  media: rcar-vin: Remove superfluous suspended state
  media: rcar-vin: Remove superfluous starting state
  media: rcar-vin: Simplify the shutdown process
  media: rcar-csi2: Remove hack to detect NTSC content

 drivers/media/platform/renesas/rcar-csi2.c    |   8 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |   6 +-
 .../platform/renesas/rcar-vin/rcar-dma.c      | 129 ++++--------------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   7 -
 .../platform/renesas/rcar-vin/rcar-vin.h      |  40 +-----
 5 files changed, 33 insertions(+), 157 deletions(-)

-- 
2.48.1


