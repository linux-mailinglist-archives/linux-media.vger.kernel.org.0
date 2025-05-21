Return-Path: <linux-media+bounces-33024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48319ABF5E8
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 089173AC77C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D47A270547;
	Wed, 21 May 2025 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TCz6zwkl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nQXxs0mj"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA5230BEF;
	Wed, 21 May 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833687; cv=none; b=XqeEvtrv+LTYSTC8UwCkoIbVyqO0JaKgYBvqwbjJ1c9qqYelUWM39aUUw7RLr87mL+xA1YcGVfaUCtwEYXJtU2WT95qKr7trzYS6S+Yyr1JX0qS61/QvvPRhBwhEmpQtnSlIgpEJoGatb3P7cgyap8fkoKRmhWiAykYEXCxDoI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833687; c=relaxed/simple;
	bh=GlJseDisEcxA2R8GEbmSOE/JLVmbv6FzrpREDGnTlx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QjspePhFvZtUNyWpbtCpybUCrwB6Ct3VFtwMiCpX20eGGzIFT/M4crgYTYzIiiPVuYBwVqUgQ4B1Bczfo9WdA+O++Y8M5JFay6kN1VHbA6yNcoJzm7RBBCFIjQ2JoWkpkMYrqNug8gst+K0TQ0ic31kHutmZFj282zkDQV4MtPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TCz6zwkl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nQXxs0mj; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EFC172540149;
	Wed, 21 May 2025 09:21:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 21 May 2025 09:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1747833683; x=1747920083; bh=2v
	CRVl6gIJjBSwTFBa/VhOrNIz2Hh5RatasoLQgCO1g=; b=TCz6zwklTAZ4XZsozG
	VsVHuBqslnLBbRrpMxSOFgIr14krgmr6LRZYnrIJCfmty7V6V9remLs2nIPfgIFf
	eLiHjWf4db0d9xm/AfThpQs0n6ACuryZavPpOajq16oih9RXNJCdYGi2u4gz83q+
	cvWZ70+vR8HezJzfG/acfl2puhkj1HM/Nw1Q2PbGTlNmueYeXTxj/etxujolwbSs
	4gNzLtnphyYi7/pi4txA0LodhVfMJqqFFiFnuMO64zJJskBy94koY0OHeUb+zrqN
	gsv9e12U1NoGv7RDzwGxDj8BG4RA7hTaCRuUt3Tve6qqWU38agu5PIAE7dfs4rqT
	55Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1747833683; x=1747920083; bh=2vCRVl6gIJjBSwTFBa/VhOrNIz2H
	h5RatasoLQgCO1g=; b=nQXxs0mjtA9/qiCK9+ZJ7KhN8xQ6V/SkZJVbmkox4DbL
	Pz2/5bwDDmfrJ5j4/z2qvZEFy4N6raOw0+xBlRE10aG/BI+mP4COM2H2ZJwryfIO
	WQsWTDZQdeNezuDW18lH+Pw1ZqU0BMaKC+FJk9/5hojpUti1GCcUCho2CkLT+laE
	uQDsywinj2WrL1hqlX8aZI/n44y1h54zFLk27uazOgSGd6RI5yw/IY+rx508hghK
	QZ21CshxXWWwRBG8JRR3NHYmKP2Ipqn0bTuuRpnvQL+/GRYR/NqjLPpM2L2/JXAC
	45AEp18wgEFLkPb12MM3XE8FKMdmMRRfWa0p/JAT4A==
X-ME-Sender: <xms:U9MtaGXqycpVOdXTlLln3yGQNvscWJSgBXJyLD5OkNYkDrd4KsjNcA>
    <xme:U9MtaCmnobNjjatPyutijxFDqArPjdquy-VTRJQ_J6skBEz2kfPKAvLlUnNZ-VeC6
    dxIi4hVUhvX5Z7Bt2I>
X-ME-Received: <xmr:U9MtaKZaL1eFVFCdF6CVqQ0VNcSahfpgARPnre9hBg23V7FNhTHPnVP7AlMVuLEoK5OEooGptvyZwyxlRfiLmPpm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudekucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgg
    tgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoe
    hnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdr
    shgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevie
    efgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgr
    lhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtg
    hpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorh
    gvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:U9MtaNUohnSwKxh_nwI-j4YEVXlvzsFkWl6rRHJYLpEqQJRJBXEJxg>
    <xmx:U9MtaAmFbrzFoQAFKa02ip5YxVcMzLD1GzezNTnDeLpewLlSb7kbdg>
    <xmx:U9MtaCdXx3m2og4qYTupM2KmKv-hnifDVO8I_cBufPlEmjdcxr3qWw>
    <xmx:U9MtaCG3vo76WnVp3uRwWZAoTd4Q66sW2ciiSkSEws4EUrqfK2fGGg>
    <xmx:U9MtaAlEsmOidpnTG43gbjZsig-kCxWe5EK5-AqoPTQTt5xgBswCL5Oh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 09:21:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 0/6] media: rcar-vin: Unify notifiers and enable MC on Gen2
Date: Wed, 21 May 2025 15:20:31 +0200
Message-ID: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
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

 .../platform/renesas/rcar-vin/rcar-core.c     | 706 +++++++-----------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +-----------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  14 +-
 4 files changed, 305 insertions(+), 919 deletions(-)

-- 
2.49.0


