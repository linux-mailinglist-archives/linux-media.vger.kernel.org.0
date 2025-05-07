Return-Path: <linux-media+bounces-31945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35FAADBAE
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27B6B7B2569
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949ED201002;
	Wed,  7 May 2025 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="yvJqsneo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AH2p41Q2"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAD81FC0E3;
	Wed,  7 May 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610890; cv=none; b=Vg1heKhostsregj1sE7tl5vsPrgp+cLVwJ3X7mJlBRnveK7U7YfqxuCDyiFTB4D+ImY5jfucxLBKbMztmsGfMr7WHJkR+qiCu0CKBQ6BYY1W41w8vMwsCSjlvDQhbcnk9PaxtraF4VjPCFAXeEjOjipRtczr+zdiocgXBthQKAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610890; c=relaxed/simple;
	bh=XtiUjo8ZJB1Y2IN3eC+aLcl6MGDqiC4VJFhLguTdzCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g9MCnbFJsehM3rfufV9u87MxZwzhfwFSglkiv0DjmRJLKG4pgJV/3aIwRopJDaN5a90a2BtgMU3xYN4ljAjkzHXFAonBa0ze4Jg1ulIRvjZz+FXLDakrOEb08dC1g5w0OKqLYswFNTmD+36U8CH7oD60QP3+NIcNIqtHedDOrb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=yvJqsneo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AH2p41Q2; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C6CFA1140101;
	Wed,  7 May 2025 05:41:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 07 May 2025 05:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746610886; x=1746697286; bh=li
	Ph0Tmzxgbax/Mf5ctLxtGhwmFgii6Sjc9QeWjyKCE=; b=yvJqsneo4uESiHodW+
	WEUKeDv1K88MCyq30mzgWT7a1auKqDztw109qDHpjdnsYZlzkNJT8v3LhDcgtwLA
	c9uHKOVjq+/5iCK+AP5AJefGV7vssEs5qURBvCP57ESGUUXYe1nox1E1DAN2OkLl
	RLmjtyunat2KQ5pDhdJy/v5IKTHpxPY8wVVDPYpnTVYxNgzkol6W3joD3cs8q9Iw
	f5h9cJUvFhqzsb6dVkJViz4InctNAKZrSCCKi93JRcj5weGNIsCDwdOc3vT78jz7
	fB6uecHXK0BI/UNXO7H4c0WMijOyr6womMc2fZRPuaCSkT9mSZ7stRWRy0lbGftw
	Hj4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746610886; x=1746697286; bh=liPh0Tmzxgbax/Mf5ctLxtGhwmFg
	ii6Sjc9QeWjyKCE=; b=AH2p41Q2cMFy89kwZPG2whXV4b00z/COztj6uxml8rC9
	oFCkpM+tXW0fYdSobZkVcrWUE6l9EnrXIvw3qU0aXuIr6ytU8PBuDXZvM4Wti4aG
	LkNcw35FAk4F11AtcVdwXWfMJ1bgTvkeBTqknnN1vtGufdei1sPlKqRExg7Sclaw
	gNjotLKuYsUnkEpjouYDQnxg60ASMqWIrrsVOpcjyF0HOvTxx8hdwbG9PNLRoD2F
	4IbUbyp+QJ2SNXyUEb5SsJwPL8wMTovOAf2pIAmvwDvqeMDd95bXuPh6N/cQ9bm7
	rBwJkU3I/N9slg5tSNMLE+YcglcIur2wuE2MpuvQ1w==
X-ME-Sender: <xms:xiobaOGCm3LJY1V-d6_CyCCTSJr3kdVcXzZCSf1TAzYv_1su2XtHFw>
    <xme:xiobaPX7LpHVdO70n9PXjBLiSlzRQrwhxN2SXM3nk2Ofi-5nPeaBnKwHRVdapkTZQ
    Qi50x7dM4LHWoz0PTU>
X-ME-Received: <xmr:xiobaIK9m7poiazK7z84ZiesU8PV5QOo7rBP86iZ9yW4OogNC3cZsQXLA3KFA0b0WxnIGEkOxW3d4-LPwioAWMB3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeihedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:xiobaIHoTRX69w3lL_Orr5KD-U1H2nMujH8Srf3BqGsxK6_YaKXzpQ>
    <xmx:xiobaEWpP4Ipwn4d36Vr-uhmq82xRzK59_nU88jTcV-BshK_mQ4eoA>
    <xmx:xiobaLOssQnbvh-PmxT0oPrxge-8R53tPLHUpoLNU5F_tDncbWO82w>
    <xmx:xiobaL3rcKONVIY-bauLVs-Lo3CrnWbbLeNpsv68Dt2P5mMbvp0uIw>
    <xmx:xiobaLWPv1hpsP2pJKNdYoaAY2grvZ3gMaOfB4K8GuVuJT2BMpn9bnKe>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 05:41:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/6] media: rcar-vin: Unify notifiers and enable MC on Gen2
Date: Wed,  7 May 2025 11:40:08 +0200
Message-ID: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
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

This series completes the conversion of the soc_camera VIN driver to a
full fledge media-graph enabled driver for R-Car Gen2 devices, Gen3 and
later have been media-graph centric from the start. Having a single
driver supporting both MC and non-MC operation have lead do odd design
decisions in the driver, and it have prevented improving the driver over
all.

New features and bug fixes have always been more important then fixing
this old generation to be MC-centric. But in order to start to play with
libcamera support for the R-Car pipeline it have become more pressing to
make take the time to make this driver MC-only, and more importantly
test it to make sure nothing really breaks.

Patch 1/6 and 2/6 are drive-by fixes correcting issues in the existing
design. Patch 3/6 prepares for Gen2 MC by making sure each VIN instance
on Gen2 gets a unique ID which will be needed to support VIN groups.
Compared to Gen3 and later the group ID does not match what it can do in
the group and does not need to be set from DT, all that matters is that
each VIN instance have a unique ID.

Patch 4/6 and 5/6 uses the fact that VIN instances on Gen2 now have
unique IDs and greatly simplifies the unnecessarily complex vl4-async
notifier usage in the VIN driver. This have in the past lead to some
subtle bugs and having only a single notifier for all VIN will remove a
lot of possibilities for this to go wrong in the future.

Finally patch 6/6 removes all non MC code paths and have the Gen2
devices register a media device and configure links.

This have been tested on Gen3 and Gen4 devices without any regressions.
And on Gen2 to make sure the media-graph behaves as it should. As a
bonus the Gen2 devices can now join the VIN CI and any future issues
should be caught as they are for Gen3 and Gen4.

See individual patches for changelog.

Niklas Söderlund (6):
  media: rcar-vin: Use correct count of remote subdevices
  media: rcar-vin: Change link setup argument
  media: rcar-vin: Generate a VIN group ID for Gen2
  media: rcar-vin: Prepare for unifying all v4l-async notifiers
  media: rcar-vin: Merge all notifiers
  media: rcar-vin: Enable media-graph on Gen2

 .../platform/renesas/rcar-vin/rcar-core.c     | 703 +++++++-----------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +-----------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  14 +-
 4 files changed, 302 insertions(+), 919 deletions(-)

-- 
2.49.0


