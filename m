Return-Path: <linux-media+bounces-34645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A48AD7984
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 20:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F64A1895DBE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 18:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773922C3260;
	Thu, 12 Jun 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VoLgJNLO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QkyK7T6d"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA81DE4EC;
	Thu, 12 Jun 2025 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749751344; cv=none; b=TILMjCq4w0P4phX5zzpONPR5JBasIlsnKBRVJ+6tGnsQKrh2875S62CvZ2TYAuAA0wcK1kBwR/ou3BaSH1UVsIoqMq9Cpe8lyr8YJLHuu4wsTuJnO1uzylZ3wdS2CkazVClVaeHnDJdUfOJNDREGvLHLddp/Y+m01gwK6IQvAvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749751344; c=relaxed/simple;
	bh=MGNrLspyBuVpm/4SZnjMSy7+VeVU4JeBXhsZCCkfqAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n403zhN+PHIcAQPE8yfxsxITRfzp6yS+U3IBTOIvJX205banAeI/q62pZKaPB1drURAyQ156BVcB8lCYbSov9hJOWbKM+Qlslp+IGC4teQ38gPU3l9gjXz6EZztcgUxLlZtlRRsQkmOuGARJytbtA3W0DHmiaRiQzPMGjRqVxjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VoLgJNLO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QkyK7T6d; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CD85B11401DF;
	Thu, 12 Jun 2025 14:02:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 12 Jun 2025 14:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1749751341; x=1749837741; bh=Zz
	F9BcLlRSYQfOzzleyPakkKKInfN0nDB3cc4YLylRs=; b=VoLgJNLO8b9BmhqKGB
	lRJ5lEacg0SsQnRLzM6dIXRhZQ62nX5woUYtmAoHeWia8i8ALc4Q9gjPatNwKrzI
	V004/kXQ1nKaJiGRBtNePOOYmczwmxogD2D0vGZyMG4CexTzMHDpgiIAoQICwudx
	XOes+h3vZvsUXHAgcwwJ8ezFnK4HCScYGyUDpI+q85dvNYVrdBx64liG75UcDzjC
	oA0awdMUX5+y587FLQ4PZM7ZoEMdYnanwo69q5nTc/FfRLL6n1gOV7CqE/wHD7Gc
	w6+Pl3rcB72JZ+23k5PG/YUq3cq6HVRxGM+Vj5f6931Xq0jM56RF88o9omswG1lk
	nkdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1749751341; x=1749837741; bh=ZzF9BcLlRSYQfOzzleyPakkKKInf
	N0nDB3cc4YLylRs=; b=QkyK7T6d8CJmCl2K/WLi9mQ9npT6R4vSzam92yRP0ilf
	W/rQaQDIlSWw9K1loHGhw0qpzvQBDB9+Ic7i71DqoK9PFI1EWElC1cT2XZrTgs2c
	QVmdMtg9aL4P0uVYnZk+/cg8eFfIQko+jRQZjSCx2kH8riY/oNuvA30Ompf5351h
	NF67m/TzWDAcA2NlHwrk779mT1tDWDgBDKptUQ0U9eR3X/J8xWCqh3CStReFC+O8
	iqFzCMnjI5T+zlfn7gyDkODvUp4ZZFDdijw8P1REvrNiKLTzJk/j3+90gyGd3/rC
	pXq376zOQcThne2EgB62+3YZfecSuQprY6yVzvWp8Q==
X-ME-Sender: <xms:LRZLaF_s08jROAw4VDSS6iZnmMpTqCtGwBfV59yiTX1VKnDssKLP-Q>
    <xme:LRZLaJsaI3pbxfsXCJTsBZVLl0Ktd0wTxdCfHOX4I0qqZ5vJFR4QOCJDGcHP717uS
    sF0LJhDtc7o8cx33iY>
X-ME-Received: <xmr:LRZLaDDuHXOIt8fOIH8-4DYSRYBVc9_lSWoVSBO8gONi5z_KZk8TDb2kP8lH1nRWy5ixePgIe-ObwXNp-glMSE5x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrsh
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhi
    nhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvg
    gthhdrshgv
X-ME-Proxy: <xmx:LRZLaJf24GBTWIr_8RXhIR_1bMtzGyAbzPu4IKIvQoLxrFRS1ULJjA>
    <xmx:LRZLaKNszN5oFEAvUGFYnil0BxA9V7g3tDM2GuMvJnNqzneFkT5InA>
    <xmx:LRZLaLlPz4ei4Oisp92jVv8BOvjRNNm64YMRU8F4ms9-9WOX90RSSw>
    <xmx:LRZLaEu5DnSlimx2Rl-ZfuapZOUhHoLH4IyM_yyUbIU3WG1u0H49dQ>
    <xmx:LRZLaPmuu9OYCMby7xwAq141uAqyAItp5jsp8c8hBwel25zUgO6f_TFv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 14:02:20 -0400 (EDT)
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
Subject: [PATCH v4 0/4] media: rcar-csi2: Add D-PHY support for V4H
Date: Thu, 12 Jun 2025 19:59:00 +0200
Message-ID: <20250612175904.1126717-1-niklas.soderlund+renesas@ragnatech.se>
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
devices. Previously only C-PHY reception was supported due lack of
documentation and no hardware to test D-PHY on.

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

The work is tested at many different link speed and number of lanes. In 
2-lane mode using an IMX219 and in 4-lane mode using IMX462 sensors.

See individual patches for change log.

Niklas Söderlund (4):
  media: rcar-csi2: Clarify usage of mbps and msps
  media: rcar-csi2: Rework macros to access AFE lanes
  media: rcar-csi2: Update start procedure for V4H
  media: rcar-csi2: Add D-PHY support for V4H

 drivers/media/platform/renesas/rcar-csi2.c | 332 ++++++++++++++++++---
 1 file changed, 287 insertions(+), 45 deletions(-)

-- 
2.49.0


