Return-Path: <linux-media+bounces-32227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6FEAB2545
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 22:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AA993A849B
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 20:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09FA286D5F;
	Sat, 10 May 2025 20:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="1pwFxPve";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kYDq7t10"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421C230273;
	Sat, 10 May 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746910586; cv=none; b=DdnrwdkdtsEFjSZDajpO4kt19rWSosSBmhvTEQp4iNgTNoVWLFi5EXz1SWScN6B4a7uvAvVEsdwkGziAifGAmUjf626CPqX+pAYnlQ0YAt8SwuzjlSH4nsFVHnIuCUM8Dk1JoJDlWafRV9e3543vXQAHlevrLuMzxzYiEGbyFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746910586; c=relaxed/simple;
	bh=5J7TRMVchJVl8++ZLtMN5hGGzV1nL5LnvljRkQossLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RVqyseKwnAy8KTjV6sZLuB/D6SSVH4n+yI0NnHFR+Fh/LO/+nmgRaVABQCaawRbdtMtBmV9tmrkv9wvhNvYixR1PpS6lSernjW9k99+YJTApD1btjIqFLL1ARDx0CJTMmdrbF3152UVKYCHfd0om+etp8UKhFpo+tbsQg2rZau0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=1pwFxPve; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kYDq7t10; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 6295311400B7;
	Sat, 10 May 2025 16:56:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 10 May 2025 16:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746910582; x=1746996982; bh=2f
	0cUafOkqIKcX/I29ItzdbA/M0WMUdt1VVU21EMayY=; b=1pwFxPvepPGI0UmOVm
	+A9GdoauxTLVbqgi6lSSQS5tbsGDB2ZP55kdt7diN2yVuhgPnIN+IL2StuW8/fFq
	z77NjGyvl4grIRm0tguFsUbialE+KillxZrqxlvFrwszrYomLj7MFtJWxFyUWJzt
	WP4MRH1kSC8Qnpm4Mc1il1tGfiDF51779dox5+P5IccETQotvnmnZW4s7Y+k9PHJ
	iXgf7yT3F6o8L+8bVvhzPnzACCJGeiZt1M1+p2SupQJLtXrffcmgrdIBsFfzbBmb
	5xnSnIF0eeIb0Aq4ZEHAUfuR85WVOOOm6BLP7RhMKUqEYLlHh/DOpL0sYuAPcbBp
	ZqZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746910582; x=1746996982; bh=2f0cUafOkqIKcX/I29ItzdbA/M0W
	MUdt1VVU21EMayY=; b=kYDq7t10aW23E9A3YAFwn1zRjhaxIInWeMTPSDAZ9r+l
	6KylwbvEu5tQYBuI3pZAn77KIErw+AA7dx0nPytTHmM1kN5Y4MhKeDMtIHZa4W4F
	uOOchS3RJuk5kYtQEOQojzri2FxjZIZdHVM+btnE6Pdq10T6VDG5upPTyNLzhucM
	zGPd67TSQfokWH1LX4joQwP2gg6GSX+Ph81SpZH24JPdfHml12g7CQyVx9rDIyLU
	3GsM1R8wij391Ps/wc5DDJZr0iyskyQqPhktsRkqqBS+lQYr6/0eINs1oss251vS
	sJkZShi6xXYtEm1TG0nBHdNDvS/BjmGVymnrp/Cwtg==
X-ME-Sender: <xms:db0faEbecWLxvK0BMLR-x7i0nR1k1KJfsp-MBfQjc_AEONpdemlb0g>
    <xme:db0faPajrBwWtPSQNQd5RjTtafJagJHVIizknCli3-Yz0BUCfP7JjLF1jy8XRdxBM
    uM0wjVphyo6WQMkg_I>
X-ME-Received: <xmr:db0faO8r-cKKmVzK7qoBmqWOH9ARO-oECrwiMjLu7u19iqicSElUxYLh0KmSLOzIa0i_h7O1GEd6xabGxSkDjAq3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiug
    gvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhht
    vghlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrg
    hssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhp
    ihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinh
    hugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvg
X-ME-Proxy: <xmx:db0faOrax-iI7ZV_RySVwGbc_gD4ZyL_Epi8WLmh31l6aTU9jy852g>
    <xmx:db0faPo1wqMlNpRpYljQCNM7kO7fXbn9ffA9zi5Wa7vj_oc5JsjMUQ>
    <xmx:db0faMQzjkXZax37thQKxFxp0_YnO4tMsacWhhksiNDjaWt4peQBJg>
    <xmx:db0faPqzW4Opt4vLFQ_aKik8TSKiL2fjhwrypgMPmZH3e0f_TAUfZg>
    <xmx:dr0faPljpsOQZ91WOQWvVMNSgoc0OxvQMEmMCIvyO-2IuO5-MMIS6yI5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 May 2025 16:56:20 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] media: rcar-csi2: Add D-PHY support for V4H
Date: Sat, 10 May 2025 22:55:30 +0200
Message-ID: <20250510205534.4163066-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds support for CSI-2 D-PHY reception on R-Car Gen4 V4H 
devices. Previously only C-PHY reception due to poor documentation and 
no hardware to test D-PHY on.

Later revisions of the datasheet (Rev.1.21) describes the start-up 
procedure in some detail, and we now have hardware to test on! The 
documentation however only sparsely documents the registers involved and 
instead mostly document magic values and an order to write them to 
register offsets without much documentation.

This series tries to in the extend possible to at least used named 
register and use formulas and lookup tables to make some sens of the 
magic values. Still most of them comes of a table of magic values in the 
datasheet.

Patch 1/4 clears up a unfortunate mix of the name mbps (mega bits per 
second) used in the D-PHY context and msps (mega symbols per second) 
used in the C-PHY context.

Patch 2/4 and 3/4 prepares for adding D-PHY support by cleaning up 
register names and an updated common startup procedure for V4H which 
have been revised in later versions of the datasheet since the initial 
C-PHY V4H support was added.

Finally patch 4/4 adds D-PHY support.

The work is to great extent at many different link speed and number of 
lanes. In 2-lane mode using an IMX219 and in 4-lane mode using IMX462 
sensors.

Niklas Söderlund (4):
  media: rcar-csi2: Clarify usage of mbps and msps
  media: rcar-csi2: Rework macros to access AFE lanes
  media: rcar-csi2: Update start procedure for V4H
  media: rcar-csi2: Add D-PHY support for V4H

 drivers/media/platform/renesas/rcar-csi2.c | 449 ++++++++++++++++++---
 1 file changed, 404 insertions(+), 45 deletions(-)

-- 
2.49.0


