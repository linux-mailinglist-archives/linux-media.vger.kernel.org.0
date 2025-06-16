Return-Path: <linux-media+bounces-34998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C720BADB92E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019CE16339F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4479D289E24;
	Mon, 16 Jun 2025 18:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BvCp8Gi3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nsXoN/5d"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01757204C1A;
	Mon, 16 Jun 2025 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100314; cv=none; b=uJFi6g5W3yJaGAc8jDYz8D0yP8BH79A5DChC8GVIYBsVW684EHYXFM5Bf7J/USd0Zpi5AFkm/Xnd8WwkY6rifQ2O/NFBTOgbFQnqX/iLdp3yXBuvT0RO3TNKaygY6Gar0pNuq7Bxw5chLfnyCbBd/2jpkxOImeWE301/bLG9HW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100314; c=relaxed/simple;
	bh=oeJRLLSwtRkQcKAdtfO5hAWD0B/mo5uE8GkCFYaDDjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q6z5Oh9P8K6Xtyhde94gUgO06aoeNXWOg4fhFh76CGNvu5OuygTyE7+5lxAbuoLr7FGaeswonyzE25fLfSIJMH+YyvY4kyF3ysb+6DA4R9UWaEv2Mvdtwt4NBCWj3HRJ2HWlqB1fAvJxQ6hQhHWCXDYHRJfAKdVNpQZ2Pn7SnWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BvCp8Gi3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nsXoN/5d; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0962F1140191;
	Mon, 16 Jun 2025 14:58:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 16 Jun 2025 14:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1750100311; x=1750186711; bh=v/
	TXx1dkm7xsWBo9OfUL4i6toTBkkYNGAFxAjhVZ8q4=; b=BvCp8Gi3DQzw/0p+rI
	LciRyqRjRZG17SF5Y3Ya0gzowogs0R2IkFVAwAYTfgDvVqznIQ2N3dWZZMA78wXm
	k0lFaydebtW4Aw1+RDyzecpQyGpNo4SA/tyKZFWXrSbwnhLOnOfK6IBiXgA3NOgO
	b3QLOjv9o9EGqRtj4R5kpNWOXZWqgxmmgguDj4fxu48+shNJGQyuOziNnKFbyKB5
	OXOVmwyuYELu0rvqeKsgMFbQbkJ9p8166xgNAY6m4G6VZ7U7wi85vDP7rNtS3mrs
	aymQKq7E3wjxPA1XezoTvBdwexuwvK97WD4e4Y/bkVlTWfY9CqUsBxcmM4vjh8Ss
	UGQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1750100311; x=1750186711; bh=v/TXx1dkm7xsWBo9OfUL4i6toTBk
	kYNGAFxAjhVZ8q4=; b=nsXoN/5dP18oVPf5gPSposM0WpIMOlyrmDmH2X0MLODa
	iI/oyV9DA6fe05E4P+RFxuZNPjtIqIno3UuShJOtk358fvPfCNQMugzJZ+6i8glj
	yupwNf/v6T38BnUK6+TaH7KBYxcOGhDDYI2qbafOcbK1qk3uJFUCH/GPIqr7yidB
	+fc2l4ZVAljZ3V+ukgSzOZ4DCeuc3KgDREMjjVeQP9yO+XqsMFKlnz3ZI4pztBd0
	KEEo89NZzs5lu9GmI3nSc9etJJmf7Crr/8rtek1oLQTeXNxgaqJlFnby5tIxbAbb
	B3GB6n2E8wDhJz9926v14MM8wdkvDCdZbMjPk+9VYQ==
X-ME-Sender: <xms:VWlQaJfCH4_QCKeK9gXe3iyiSZGwNCvJ9O2vhRVrkVx9tpSqahHUOg>
    <xme:VWlQaHOggxZXS-XIV7Lexi_5Pm-i7zPB-9s1De311xe83_8u1aqFfJpPSKWyIItUQ
    mPn_ZU13AVmhksWHF0>
X-ME-Received: <xmr:VWlQaCj7lnPFO-oGP33UvPwhL-iMOS_SIKnFqZUVWu7YubWla8kqOX16ZA0HZLwZDWMe9CTgpnZRppXPhHBG4ltdHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjeefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrsh
    honhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsoh
    gtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:VmlQaC9MslqgyBXPQ54NZeVgTbSB830i67fMv1wwpeot6UVunB5crg>
    <xmx:VmlQaFtu9AeRxnEU0jkp7C0kQLWBIMHFek9SoXvGSRSuM8pY5yrrmA>
    <xmx:VmlQaBFbAyU0aZcM6MUEHyJsZOfrvOMtKxf-8rdmxXA02ei4xPSnjQ>
    <xmx:VmlQaMOdiOqIBLegpFhxgMhZdQai47rFLCaCP2BYORBMI33IYf4LDg>
    <xmx:V2lQaN5417xnN8bvIWiH_hU811K_SQ7Vw4CxErfg22r4ZgCje-yw5AqN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 14:58:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] media: rcar-vin: Generate FRAME_SYNC events
Date: Mon, 16 Jun 2025 20:57:19 +0200
Message-ID: <20250616185722.980722-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series extend the VIN interrupt handling to be able to generate
FRAME_SYNC events. Having these events in user-space is a great help to
know when a sensor starts to expose a new frame.

Patch 1/3 and 2/3 prepays the existing interrupt infrastructure to
support more then "frame captured" interrupts. While patch 3/3 enables
and checks for VSYNC detection and generates the new event.

The feature is tested on Gen2, Gen3 and Gen4 and all devices correctly
generate FRAME_SYNC events.

See individual patches for changelog.

Niklas Söderlund (3):
  media: rcar-vin: Fold interrupt helpers into only callers
  media: rcar-vin: Check for correct capture interrupt event
  media: rcar-vin: Generate FRAME_SYNC events

 .../platform/renesas/rcar-vin/rcar-dma.c      | 54 ++++++++++---------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  2 +
 2 files changed, 32 insertions(+), 24 deletions(-)

-- 
2.49.0


