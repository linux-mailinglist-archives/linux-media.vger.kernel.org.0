Return-Path: <linux-media+bounces-33026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9AABF5EB
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3CF1BC43E3
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9221A265CDF;
	Wed, 21 May 2025 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="wdiemyA1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qkCv2MAb"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EA1278E67;
	Wed, 21 May 2025 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833691; cv=none; b=I1A34wVzHzHgHLZBUO5v6d2HLPcfnHdVR4uhL2ww8wyQL4WeSKbwaAMPl4k376sX3Lj7Xjcgp70PQgrsD/n7tEC9AAZgQrMHRX4AZ6VJZZf8DxXzZDnyzO29GsTnFRoZPHrPms+yU+7D7jDBzELrV64tZPxQDDBK6lsx6r1dM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833691; c=relaxed/simple;
	bh=eFr8/p+CejtPaw+3KLS9FKp/wCuslpyznqLYTertwKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBLRdr8JVaXd6Ln9uM7Cmt7JEsvYHF8lFFkgbUk0Kgecn1VOi5/4OsGDCOuuEBXdg8bf8ykUlHfKHEPVZEjzqh68SQeySbi8TQaJRKOh1QAZmWrHGozXyUz3qCI6cmRzNnY+3/1MZnykJSle0sbJhNnT+GcmlEvv9wi60ctVKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=wdiemyA1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qkCv2MAb; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E654A2540149;
	Wed, 21 May 2025 09:21:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 21 May 2025 09:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747833688;
	 x=1747920088; bh=KxyoqSurUCvLkYks5TA19wldCVLPGxGPncS4MyQamCE=; b=
	wdiemyA1ZQa6NEi7hBWhPYP7gGbu6CSnjbaGZknfMz7H9iCNcNgqmKQczPwoYx71
	H4IRZ7+oBW7iu4E5bMHJiscB/L4CG86pkpKllcvQ4Q4QkVKtf+5Q8ZfXh5XaevAh
	q8zIvFFh2gKYmgT+l0ppadQTzu41gAQJ5il1OV+qfX8fKxUju8L8EzMKHsV1c9bd
	wJAF/bqMxN62LSUvDdcKwwUFgdsBtR25pNPvYtkZQiaPoQ/Z2qh0TAaMs4ZvHxqE
	dT9TFvCXrIzjiEy9YlzsdDBjyiGj2QabojZgEwJDH0W8WgTqEVVa/9ffTS70aA6i
	hEpMPsJkFp9FXTYiXLJooA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747833688; x=
	1747920088; bh=KxyoqSurUCvLkYks5TA19wldCVLPGxGPncS4MyQamCE=; b=q
	kCv2MAbEA9YHZEaJQ84T4+HGMVlftwg8XY/KDFN/DGeHiKibhWzFzf5ASGtLs+kw
	qbZRxcMM/Jr2Vdg5enFCoinHk8WdpEw4AmKLlSjaS45n2bnVhvlDJECyUoOkGPVm
	aase50bsq1JBatg62oCxJzNVmleAP+XXVlCTxEOdEM7PqD5213hSA2HrsISk/QaZ
	tkhvql1vPf0UFvvHMCPK3xNFSZNSiwGD26i6eYVt+kDu/9ufxq0llGGk1qdloSBb
	OBDGUuhMNyWdPyJ5IxgJm8EBy/A8D0Z1dyqRg4qPVOp9Wmmi9OTZBGiA8Wlc4t6U
	2l0nkY6LTsBOnpbaSqZGA==
X-ME-Sender: <xms:WNMtaMZtArnNzMeGHnQqnDTMaiCqSnxBMUe4wDUikc0oe7rfImxLPg>
    <xme:WNMtaHa9JiNESXrHAtw288x7Cyj85FcR726DxwjNyke3pZIK-EupGMQiuxxwsJvYs
    WM5cmFVgNHodIAIq2A>
X-ME-Received: <xmr:WNMtaG8H37lM6BNhuH5nswWeYdlPVQrIzFEJFR75o20gUdW3s6CMEtyj2V6aUqVcQZIYeMPhvXZKLJMdB0FWvC5z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudekucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgj
    fhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnug
    cuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeuke
    evfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdr
    vhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:WNMtaGpQ2-ULSd_FsE8n8ebJjABodrNZcPv5iwxshRFhI4-R36GigQ>
    <xmx:WNMtaHo9nDLELAihlonm-ir_RNMAgGDC01WxaSyk1sysQZqHNmJ-nw>
    <xmx:WNMtaERlIOVJa3nAbQKQUOB3IC2yQRb4LA3QT4gJqSzGVeRgtuAwsw>
    <xmx:WNMtaHrHE296ROHFD6oQkq6VEm0MA2dfb4oA9IV8MFqAxOhXYOXz6g>
    <xmx:WNMtaJ6ImbmqfZtAMbvH_bk70YQeSLteMTb9JVq5HxmtI3OPevdS8mwd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 09:21:27 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 2/6] media: rcar-vin: Change link setup argument
Date: Wed, 21 May 2025 15:20:33 +0200
Message-ID: <20250521132037.1463746-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The link setup callback once acted on each VIN instance, and expected to
be called once for each VIN instance. This have changed as the driver
grew support for later hardware generations and the callback is now
expected to setup links for all VIN in the group.

The argument to the callback have however remained a pointer to a single
VIN instance. This pointer was then used to get the group structure. Fix
this and pass the group as the single argument to the link setup
callback making the expectation of the function clear.

There is no intentional change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 52 ++++++++++++-------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  2 +-
 2 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index b9ea5b8db559..1be408d6c508 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -65,7 +65,7 @@ static void rvin_group_cleanup(struct rvin_group *group)
 }
 
 static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
-			   int (*link_setup)(struct rvin_dev *),
+			   int (*link_setup)(struct rvin_group *),
 			   const struct media_device_ops *ops)
 {
 	struct media_device *mdev = &group->mdev;
@@ -115,7 +115,7 @@ static void rvin_group_release(struct kref *kref)
 }
 
 static int rvin_group_get(struct rvin_dev *vin,
-			  int (*link_setup)(struct rvin_dev *),
+			  int (*link_setup)(struct rvin_group *),
 			  const struct media_device_ops *ops)
 {
 	struct rvin_group *group;
@@ -246,7 +246,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin);
+	return vin->group->link_setup(vin->group);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -909,35 +909,46 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
-static int rvin_csi2_setup_links(struct rvin_dev *vin)
+static int rvin_csi2_setup_links(struct rvin_group *group)
 {
-	const struct rvin_group_route *route;
+	const struct rvin_group_route *routes, *route;
 	unsigned int id;
 	int ret = -EINVAL;
 
+	/* Find any VIN in group to get route info. */
+	routes = NULL;
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		if (group->vin[i]) {
+			routes = group->vin[i]->info->routes;
+			break;
+		}
+	}
+	if (!routes)
+		return -ENODEV;
+
 	/* Create all media device links between VINs and CSI-2's. */
-	mutex_lock(&vin->group->lock);
-	for (route = vin->info->routes; route->chsel; route++) {
+	mutex_lock(&group->lock);
+	for (route = routes; route->chsel; route++) {
 		/* Check that VIN' master is part of the group. */
-		if (!vin->group->vin[route->master])
+		if (!group->vin[route->master])
 			continue;
 
 		/* Check that CSI-2 is part of the group. */
-		if (!vin->group->remotes[route->csi].subdev)
+		if (!group->remotes[route->csi].subdev)
 			continue;
 
 		for (id = route->master; id < route->master + 4; id++) {
 			/* Check that VIN is part of the group. */
-			if (!vin->group->vin[id])
+			if (!group->vin[id])
 				continue;
 
-			ret = rvin_csi2_create_link(vin->group, id, route);
+			ret = rvin_csi2_create_link(group, id, route);
 			if (ret)
 				goto out;
 		}
 	}
 out:
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
@@ -991,30 +1002,33 @@ static int rvin_csi2_init(struct rvin_dev *vin)
  * ISP
  */
 
-static int rvin_isp_setup_links(struct rvin_dev *vin)
+static int rvin_isp_setup_links(struct rvin_group *group)
 {
 	unsigned int i;
 	int ret = -EINVAL;
 
 	/* Create all media device links between VINs and ISP's. */
-	mutex_lock(&vin->group->lock);
+	mutex_lock(&group->lock);
 	for (i = 0; i < RCAR_VIN_NUM; i++) {
 		struct media_pad *source_pad, *sink_pad;
 		struct media_entity *source, *sink;
 		unsigned int source_slot = i / 8;
 		unsigned int source_idx = i % 8 + 1;
+		struct rvin_dev *vin;
 
-		if (!vin->group->vin[i])
+		vin = group->vin[i];
+
+		if (!vin)
 			continue;
 
 		/* Check that ISP is part of the group. */
-		if (!vin->group->remotes[source_slot].subdev)
+		if (!group->remotes[source_slot].subdev)
 			continue;
 
-		source = &vin->group->remotes[source_slot].subdev->entity;
+		source = &group->remotes[source_slot].subdev->entity;
 		source_pad = &source->pads[source_idx];
 
-		sink = &vin->group->vin[i]->vdev.entity;
+		sink = &vin->vdev.entity;
 		sink_pad = &sink->pads[0];
 
 		/* Skip if link already exists. */
@@ -1030,7 +1044,7 @@ static int rvin_isp_setup_links(struct rvin_dev *vin)
 			break;
 		}
 	}
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 83d1b2734c41..7d4fce248976 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -257,7 +257,7 @@ struct rvin_group {
 	struct v4l2_async_notifier notifier;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
-	int (*link_setup)(struct rvin_dev *vin);
+	int (*link_setup)(struct rvin_group *group);
 
 	struct {
 		struct v4l2_async_connection *asc;
-- 
2.49.0


