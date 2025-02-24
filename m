Return-Path: <linux-media+bounces-26859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96263A42BBE
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F28227A51F8
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B260E266570;
	Mon, 24 Feb 2025 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HSM9Irs+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1nIqd1d2"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B956E266563;
	Mon, 24 Feb 2025 18:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422428; cv=none; b=chcC9rqH8vyjA/B3T8qu0ONpZlUkBbALEUxBtlxcqBpgantuoKi7LSt11JrdprCQLAJRB5juyWrUXIx5+qQ7MT92zomy9X+CZSTDVIw9f6ikc0jsyvy9xEtO2lXzlx8NF2n0VTabCe2iEpm7JWZ3q+vo0E24fZGEnaktSYQlwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422428; c=relaxed/simple;
	bh=Bi9CEA0Floogm/rZg+QKQjMsKJWT4qYuiQGn5/AEG7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qLZiIz8FeqHmJKqCkb4JF2pbZJEFoiUA1d6pAKhRKlFIylvS+X5re5QQ6FrfaEG9UcLF/bWb+S5yvOoZWC6Hm20O7fRK4Qn7VkTaQ6i2kEsT3w48lQT0vLjlUkU2Q1af9FICxO4rYIYj3AvCDm+KmPzQHu3UGfNcRI4Pt/I4uuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HSM9Irs+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1nIqd1d2; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 778DA1140213;
	Mon, 24 Feb 2025 13:40:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 24 Feb 2025 13:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1740422424; x=1740508824; bh=TM
	AvXEJBgrk62yHzFoQ+rrG5FloJ4Efcs5Oxp62KlO4=; b=HSM9Irs+E570u58oUI
	cUyUqn1xmkJg+/VktFPhx621aESRJ5CXzfNwJq+qiE0dPRYwF/+2Zx81k+5IHyqY
	bYBCaOIYkDTqF/QjTIxONiElURRwnAKiO5Z8LNsM7vga+W9kK/NsXCRdX9geBnLO
	UN41nfqd5nKL/bBd5WjnAofqyofvOm+c+RQE4h0UehSTcCkWXmILDj37OPVcMAaC
	dipK4YM3xqMomh+mwZF9YmHWeTAppT/UPNaqfdNmlDozycIz7ETb7Ma79ubkzhF/
	VqUlDWrKTsoZmk9BSWiu/zIXeMi293tpwOJ8B2ckghlsAGCKe5gCTqiGVeZPefXi
	Gjkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1740422424; x=1740508824; bh=TMAvXEJBgrk62yHzFoQ+rrG5FloJ
	4Efcs5Oxp62KlO4=; b=1nIqd1d26gHW6WLSZDkf3n4esDLmo4k/LrxqO5rmhREX
	ypTtj3ucEAjb2MvshPbesz4pDgxvUNkwNE37alqCb7IvG0dj0hM1QSHjSzoizB0k
	BQZqEGv2OyfU6lE9awZY6a9SA3TnP2mj5orJ+VxduvY+qRgn1exyjAdrNnbaKPTy
	l5C7Gx9WyTvoqm0UuNLbsumEXrJ40R/oqyCTnTj/CUyArFJluJBzY8V3MMMVgIAQ
	8RLqG6Uhz2+kl/Z+4My/fY3CxLVC6F1+/5SmXn5iso2Y+EOX/um1v4MxR2llvdXK
	5huXiUMiIiIiE4uvAp8pGVATDDluz3mWnTzhs8JCBw==
X-ME-Sender: <xms:F728Z1fPvueuFieLyTnpun69dT_xy2ntOn7vfCtGFRRVvz4wNAlG1Q>
    <xme:F728ZzOOsPiEIkYm6AY-wvIldJCGQ2c9gslDLjXu8AupqlI8QTZ7xGFng06Q3xFsH
    gWTiJadhF_-DHbZDEA>
X-ME-Received: <xmr:F728Z-i1UssL6LXUBmp87V3d2mRfLvYn4IXjOtfXisSo0rKvBilTEYTp-FFnaFFkDzIPllfAM1Iz9Opd4x1nGRJwrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghn
    vghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdr
    shgv
X-ME-Proxy: <xmx:GL28Z-9PaQjDRbJB78C7J1RfKXCqDZZtDyVdfoRtfe8dVOuBCepGjw>
    <xmx:GL28ZxuHP2HinFxapMAwTvr0dRC5RSZdJb0S76IG4jvDI2tAzTXvfg>
    <xmx:GL28Z9FkOfN009numt5F1IF1LHcy_-xY35WEnmLOrSQqOVk3BEzcIQ>
    <xmx:GL28Z4NETcEqLyAG01O48TJ_RvLUoX2u2oc9mEG3Ji890v4bLgdEiQ>
    <xmx:GL28Z1i46pPNccs-zfm45hkPcBWc3gj0ApWsjkvIoxhhtwOcz7sK9A63>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 13:40:23 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/6] media: rcar-vin: Unify notifiers and enable MC on Gen2
Date: Mon, 24 Feb 2025 19:39:32 +0100
Message-ID: <20250224183938.3800317-1-niklas.soderlund+renesas@ragnatech.se>
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

Niklas Söderlund (6):
  media: rcar-vin: Use correct count of remote subdevices
  media: rcar-vin: Change link setup argument
  media: rcar-vin: Generate a VIN group ID for Gen2
  media: rcar-vin: Prepare for unifying all v4l-async notifiers
  media: rcar-vin: Merge all notifiers
  media: rcar-vin: Enable media-graph on Gen2

 .../platform/renesas/rcar-vin/rcar-core.c     | 665 +++++++-----------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +------------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  14 +-
 4 files changed, 273 insertions(+), 910 deletions(-)

-- 
2.48.1


