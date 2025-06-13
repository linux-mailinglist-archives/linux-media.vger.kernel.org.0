Return-Path: <linux-media+bounces-34770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E45AD9162
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F6FB1BC3B97
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310771EB19B;
	Fri, 13 Jun 2025 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YKiymQfw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="frWXuzEo"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9CE1E8353;
	Fri, 13 Jun 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828912; cv=none; b=BRkYv4YLvCzswJ5DdHrXjbnMo9n5wClpoZbkndQmAOjik70BxdTLd/h0lkrWD65j+tcSk5fosoRMjwLOBj2eSdCHuNpxR1U1vb0HmqnZL2pwVmg5yjKtWK7sYi7rudIhWLYCYZ6O0bpQpjjc5sNW/0dpNLcyYkZGlz6XAbS/E+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828912; c=relaxed/simple;
	bh=3/c2fxXy++32RKfjs+AkJWQfdPxCShIxKNU7dKtfvgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oyWI+084IheklPDx7Jup2TemUJXO+vAG7pAG71AR9Uszd4QWrZBCrt3kOt4urHfG0JL+zkceOxQtNlBCBVzPgJPmnRqVCyiCejayVdoPqVk1J+rtSiSgWZllhFdhgTcqX4Fuc5YVtOpUVPl5xkSJuLQDT9jE81qkeKauqIDK/0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YKiymQfw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=frWXuzEo; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6C82411400DA;
	Fri, 13 Jun 2025 11:35:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 11:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1749828908; x=1749915308; bh=d2
	1xr80g7IgqTkjNvgkr05UA5lkkAZCzXdiLH5HGR3k=; b=YKiymQfwMe8OHockrn
	EU/3q+gSF2xKk77gYoJyU5DRIKvraljoJvrr52iX17oR3XSR3VNyl39l4Jn5NOWl
	oPAWVwXkk0Wn/3pJPfACAebMlrmmeIxJFcsU3rD19dnA75Hl0Xmr4ZL12q/VsgP1
	z7iC7tnhjkT2epO6JdZzehKRicRvaZCSfuWxps9KvHx3kDpW/6z1UP5Ewa+e4T8N
	9EJMOSNFQGHGuKlNAFkW1rKMyWtXZIeV24ihHu0o6Fb9jt6IXSddCvxWjjo4E0CV
	QlG4zK3DWJw0GSnNSAg96Co4qjvW+K8G+w76NsK5kKRtTLYIuFJPGl6mpLqoDfPa
	b6aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1749828908; x=1749915308; bh=d21xr80g7IgqTkjNvgkr05UA5lkk
	AZCzXdiLH5HGR3k=; b=frWXuzEoYa07p5lAnXfq19oODDNbwEqLNMCpIJB00XSZ
	CADFGkMxvJoHigemxI72ckogi8o4CFDUkb/hu8w02LUwp0gKxX/0vEzlSfN2Y4kw
	oG+QTLdw2VS+wMVCPD2fdUH2jcBhsBbXlS2Si4grTuUN2r14E/XKyoTOQvj6JGm5
	a/MZUb0gAEpKiNmBshIySL/pPgbq/73rjx8H55Wd0tBAe3U6h8Tz7Nlqz5xBX7U6
	mgiP3UDe7mmZwV9C4hQ8y0+A05I361EsmZvhWpiic/DsWthQrh9xjWCaN2TNek6y
	GQmLhc05f6jUF0D2Pb+8MrYNbJPGvyM2n5a54XSgkw==
X-ME-Sender: <xms:LEVMaO2osXv7YuF6UOLNkM09oIqtg9TvYi0e3mNcd-KdK9FL2MPZ5g>
    <xme:LEVMaBH329DcgHAmlBJ1qobJuF6GkNJ_PFNgSfTot1elVUI_t2Grra5sL9-S5Gd-X
    Kv8twlXxp8bvHi8oI8>
X-ME-Received: <xmr:LEVMaG7QrQZQ-Xgw4WjrtOFZ6pIkmSleWTl3U1_qMZ5Cdu7mg91WhnM6XZ15hJRFakpHGeXB0YIoQMwsmCJLsHXv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghn
    vghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnh
    htrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    lhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvg
X-ME-Proxy: <xmx:LEVMaP3-j8_2DbVlmT6Dgy9U6WWviJai-kb0BpebCj8J-5uaRu2J0A>
    <xmx:LEVMaBGk5nLDi3SZuDSEFg3wdTkdvYFF132x0ddUuoEO-M2wVfMTCQ>
    <xmx:LEVMaI-9LaI0D_qPs2wjyCnEzNoy5Ci3ucj-XcLHKWw5knWp03R6sQ>
    <xmx:LEVMaGnBOVpbbFpJjd9nP3-4cP0gorR_ZKtd5ZhYZN4OwoVfbMEKrw>
    <xmx:LEVMaDGCQg-iJChYRHE6Nti38oyfdZFI8_nmnHoMJbyeKntEAJiiy5RF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:07 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 00/13] media: rcar-vin: Unify notifiers and enable MC on Gen2
Date: Fri, 13 Jun 2025 17:34:21 +0200
Message-ID: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
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

Patch 1/13, 2/13 3/13 and 4/13 are drive-by fixes correcting issues in the
existing design. Patch 5/13 prepares for Gen2 MC by making sure each VIN
instance on Gen2 gets a unique ID which will be needed to support VIN
groups. Compared to Gen3 and later the group ID does not match what it
can do in the group and does not need to be set from DT, all that
matters is that each VIN instance have a unique ID.

Patch 6/13, 7/13 and 8/13 uses the fact that VIN instances on Gen2 now
have unique IDs and greatly simplifies the unnecessarily complex
vl4-async notifier usage in the VIN driver. This have in the past lead
to some subtle bugs and having only a single notifier for all VIN will
remove a lot of possibilities for this to go wrong in the future.

Patch 9/13 10/13 and 11/13 make to adapt Gen2 to MC in incremental steps
to ease review. These two patches where previously part of a larger
one-patch to change it all (now 12/13). There is on state of the series
with 11/13 applied where controls from the sub-device are not exposed to
user-space that is then addressed in 12/13.

Finally patch 12/13 removes all non MC code paths and have the Gen2
devices register a media device and configure links. While patch 13/13
is a small cleanup that was previously part of 12/13.

This have been tested on Gen3 and Gen4 devices without any regressions.
And on Gen2 to make sure the media-graph behaves as it should. As a
bonus the Gen2 devices can now join the VIN CI and any future issues
should be caught as they are for Gen3 and Gen4.

See individual patches for changelog.

Niklas Söderlund (13):
  media: rcar-vin: Use correct count of remote subdevices
  media: rcar-vin: Store platform info with group structure
  media: rcar-vin: Change link setup argument
  media: rcar-vin: Use error labels in probe
  media: rcar-vin: Generate a VIN group ID for Gen2
  media: rcar-vin: Prepare for unifying all v4l-async notifiers
  media: rcar-vin: Improve error paths for parallel devices
  media: rcar-vin: Merge all notifiers
  media: rcar-vin: Always create a media pad
  media: rcar-vin: Remove NTSC workaround
  media: rcar-vin: Only expose VIN controls
  media: rcar-vin: Enable media-graph on Gen2
  media: rcar-vin: Fold event notifier into only user

 .../platform/renesas/rcar-vin/rcar-core.c     | 696 +++++++-----------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  23 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 490 +-----------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  16 +-
 4 files changed, 295 insertions(+), 930 deletions(-)

-- 
2.49.0


