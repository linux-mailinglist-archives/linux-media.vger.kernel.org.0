Return-Path: <linux-media+bounces-34783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0FAD917B
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EFEF1BC3A09
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63321F5834;
	Fri, 13 Jun 2025 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RdBwemEs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m40lkdG7"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735771EFF8B;
	Fri, 13 Jun 2025 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828936; cv=none; b=eiQ1k3xsogwmHJyUju5RasURU+ryVAI8oZUzKQ3snWdBRYPFaOebf0dFvxcHHseAmhXQM8vRXuRDCPJZQ73z9Aw2MWRs+WoI+ZhEKQ2IbGXgky8EnnjjkMruXhXG3Jk+ZG1IZGhqINDVB8+Fg9cxCN1nT7t52Om6TMy6VVUMzO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828936; c=relaxed/simple;
	bh=VrEBwwMReLYJxYrAda2HKAhIsvebqHhh8z3siGal90U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aTj0VF7Q0hisBJTxMQ9amk4T7mQF+/90WQ1PcY+1U1CYflh7g7nB0N7FLSqaDgNZInuJgDxMJA1TJjNaK9xf4BWufL5GFzo9KCR2UPxkUszrNjExxfToFyyfgBHOw8H6Kw4d9BmDGJ31kR1DBQdKBzCb+OChqTqhQ38aEwfa5Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RdBwemEs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m40lkdG7; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A5FF0114014E;
	Fri, 13 Jun 2025 11:35:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 13 Jun 2025 11:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828933;
	 x=1749915333; bh=nP0T6OrDHDzUlOCarMDQsLhaE5gcUaPlvOGPYxbh/FI=; b=
	RdBwemEs23U1BE+jM5W9yvT3FBkZ0hWmpJpDnpJ/AgSy7AuqgVXGmc6wa6r1PMQP
	KAh/N6mnfmrCDZUmUo298QrFx+iK/xCa7vfeJuSs3KeLQLKW37GT8HpDosvbXCfz
	6ihoedCOoHkg4nQg0wHvOK7uY/wmIOvsnjoQC4UQk/CArfqjtTXteXdTEIVoK9lO
	AzLtqqfO9BwIJ639cKuLqWkXd5Aop3KvhgM2y5jVS5iKWE47XKFXa9RpQG1i4bB6
	HPOqPVTP/OfVjGMJEbXww1FVO1yv9mVpaFsVWZE34MP01ROtQlLD6e/Ez+yQJcIB
	RReixHbwrU/5JQD47KUH1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828933; x=
	1749915333; bh=nP0T6OrDHDzUlOCarMDQsLhaE5gcUaPlvOGPYxbh/FI=; b=m
	40lkdG7P8kvRbr1o8Gjn3pXBc25kNHA/TBRT31m+aapf31fkvtHpH05ROy37/Saf
	kkJf7sgJzr/mF5Ho5+yPDCoQ7qW2XFmXPEd9EPEiuqTU+sRmSXX0b6CcAWibtK62
	aI35P13Jt5ckc8juEccfar6SGVIaV9mMuUawoo1ooHsRtzfQ6Vl5DnSESSpJVHP7
	CZMpuBRDHzTgjBI9fWdM5x8LkYzsplJ7udNYzV9aGvwyn/oxYrLIHeZbqHFr/C5m
	sIwI3Dze3xMlP9xebVD4LrTdy2NOZ8D7uHGMFdIJX0IH9JjoG3UXnhSWFZj8iGjl
	2fYyF8eOfSp5oK4Hc3JmQ==
X-ME-Sender: <xms:RUVMaI3WEiuN2ats35e8nNtcr_-YJ0MqXYHhMvVxl30Ol1GLOuP2pA>
    <xme:RUVMaDEkupuUHKMujlOkmKg08e9RctQLaRVp7LcvDyQIRPQiqFAl_eSTErNWipykT
    VlkVzlbAtMEH3iUMDY>
X-ME-Received: <xmr:RUVMaA7HUV3QTM-VZfxIIMn1iRppzJdaZvMRUwNMSJ8vuta1K5EbxnmhVENoWXp_pd1S9dXzNUQ1rn73kKUkTDl2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:RUVMaB3Bcx6IHWnLy79kLmcUoRO1gH7aINdFQTG_X5j6YFSKwGqK2w>
    <xmx:RUVMaLELyV8_JBzDLVutAy4QzwlYxjvdT2YwnvAOsJv6DSkCyvoy0A>
    <xmx:RUVMaK-cLS_cGUToljnIX9Yb0uVVghcCZLvQZ4xtMucWWTy99ctlWw>
    <xmx:RUVMaAmCIreWGg9YsmfYxtY89ns2v9gR6G_63XcRp59KTl2HzSCQdA>
    <xmx:RUVMaCiNCtBrwLxBrdXsZ1v-te0NOekBCFHqjufPjv1rSF3ZJlIq0Pgl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:33 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 13/13] media: rcar-vin: Fold event notifier into only user
Date: Fri, 13 Jun 2025 17:34:34 +0200
Message-ID: <20250613153434.2001800-14-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With Gen2 converted to use the common media device there is only one
caller left for the helper to notify a video device of an event, fold it
in.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- Broken out from larger patch.
---
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 3a4c7433f061..9b1e3a9d3249 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -656,18 +656,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
 	video_unregister_device(&vin->vdev);
 }
 
-static void rvin_notify_video_device(struct rvin_dev *vin,
-				     unsigned int notification, void *arg)
-{
-	switch (notification) {
-	case V4L2_DEVICE_NOTIFY_EVENT:
-		v4l2_event_queue(&vin->vdev, arg);
-		break;
-	default:
-		break;
-	}
-}
-
 static void rvin_notify(struct v4l2_subdev *sd,
 			unsigned int notification, void *arg)
 {
@@ -693,7 +681,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
 		if (remote != sd)
 			continue;
 
-		rvin_notify_video_device(vin, notification, arg);
+		switch (notification) {
+		case V4L2_DEVICE_NOTIFY_EVENT:
+			v4l2_event_queue(&vin->vdev, arg);
+			break;
+		default:
+			break;
+		}
 	}
 }
 
-- 
2.49.0


