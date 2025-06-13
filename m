Return-Path: <linux-media+bounces-34773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A793AD9167
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2FC13A9960
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2FA1F30BB;
	Fri, 13 Jun 2025 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FxR4zqf5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A9hVDZfv"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA41F2B90;
	Fri, 13 Jun 2025 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828917; cv=none; b=DIQYQkMYnor66/MZFin2ZH2P+zvV9oebIrtFZx+wo0vyyrc45CSm38oIdG7J7ugAcTIMQMsj0k7++dPTPjZH/xG3Pr397/KBhnhbU42JfDCuuDAebwGK/wljk3BpXwCXMd1hi0m6XKWhvEwFsJLQPpzcoA5rOx9bk/2vdOoatic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828917; c=relaxed/simple;
	bh=sqpjF3Odi6ypfcyalh3BmQOZz0T0w9glIatZ6nLmCZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCG6bIEFXPCyrbPimJDcbB3oVjHZsop/qK+LqPUQf1YYN484YN4PpJOvgYMytTdl1bEGTMzpTEAQ7T2mMNdOD1XEhCwtv1HGZi+tvE1sej7l6zy1h1ci7yPWceZIBZQlWHsCuXBSlnM6CT3GTAGHdLoD/EWbfcUYmkfj/AO3V3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FxR4zqf5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A9hVDZfv; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C674B11400DA;
	Fri, 13 Jun 2025 11:35:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 13 Jun 2025 11:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828914;
	 x=1749915314; bh=7B6deaCNv2Hzl76cPCiRAw0SIYD773H4NRfoZ+Q9Mh8=; b=
	FxR4zqf50k+YuFgxBjhMR7xxXm9G3+KyZ82jSNPq3sCcyRRJBiTZO3yv47SVHjrH
	p2MwdJ983FUdr2o75VBFifSd0mZzOAwt6fPaVBujE/N0Tn0ljSERDV1qI+QgZugB
	tm+rycWgpI8AjscKtKzNGJQFQwqlU5Tbai2PmxbJV0KML501+Lp7+ZzHsAPWuG2Z
	QdcTWlXnbyc9S7CJgu8SFjjo22vXr0d46GNcaJe+5cTGiZIFkS/YjEnot7d3aEdW
	i01ao+8VfW1X7fUxAoWeNGrBqqghFv9idp/BBCZ4iIy6QrD57QgC++duVQ9cColC
	4b/HNEkQC8NcU3gsexyUSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828914; x=
	1749915314; bh=7B6deaCNv2Hzl76cPCiRAw0SIYD773H4NRfoZ+Q9Mh8=; b=A
	9hVDZfvNVKS6Ivu1n1f2vp1LolhAV652kU2NVkfLOqGXWIPDkgGG3p13GWEQw4/f
	2SLLBbDSF6lLizjLb9uOKzSUk1AWXN3hMKxqS8zTgnz/BD75t2Ox961o3KxvIcC3
	VFRmPs12LzGmVxKsUXYX6ymHpl3LDm0P/8fTULsJjSuZgyr0yg6Z11OOFJROymTT
	SttE+rAz0u1TSLe9Xw/tIQOQH7oyxEzjmIkBc5bn5v8E89YuzUgF8d4TllmXsjQQ
	3RCN+KoZ5wLX+3tuDcq1LfF1VAsYKXfPAXUgwI+0iGFu7Xtsrndg38iZDTjjowpo
	OUx30VArrkv/L+PeDlfvA==
X-ME-Sender: <xms:MkVMaLJVLw-GINXDxjMtptRdhvRB1wm2KH8IJLN1ZashAjvBAdS2yQ>
    <xme:MkVMaPKEM6JudoQbIruLNAvPcrv5XH2Pm8rY0FNtYa4QXEdGU3WP_d7qnhWEP0xGR
    ANSWk9CFiFQpqp4dtA>
X-ME-Received: <xmr:MkVMaDtf2bvda_NhqDp3SRbYB2OMAwFaVz3hd_aRmY2W2xGs-UYPIjqGeVLYgA_4YXPJ9DydTQ8ClUstf_lKD_86>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
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
X-ME-Proxy: <xmx:MkVMaEb6Y4BqNNAdyT7kXnM97hwrp7ffeRd1xfwfcMh6Tzehy9zIGA>
    <xmx:MkVMaCY4OCbfFWph8gKX8ukpAdVj1kwarHAdY2mEygxGY7JiP1Xejg>
    <xmx:MkVMaICoUAC_hdbWaTXck9xJzzb6V9FNWVvGT5XZVKYsDSal-yKOfA>
    <xmx:MkVMaAZQWGJDuizQ4riDphSKZBkF0QzjEcg2jYoEGjR0J2Pjctcv-A>
    <xmx:MkVMaJ22Sw1tgx7GDwZMQ9YxM_spw8PeCPiXsspPavfNZGsdnnO2nD2h>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:14 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 03/13] media: rcar-vin: Change link setup argument
Date: Fri, 13 Jun 2025 17:34:24 +0200
Message-ID: <20250613153434.2001800-4-niklas.soderlund+renesas@ragnatech.se>
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

The link setup callback once acted on each VIN instance, and expected to
be called once for each VIN instance. This have changed as the driver
grew support for later hardware generations and the callback is now
expected to setup links for all VIN in the group.

The argument to the callback has however remained a pointer to a single
VIN instance. This pointer was then used to get the group structure. Fix
this and pass the group as the single argument to the link setup
callback making the expectation of the function clear.

There is no intentional change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v5
- Fix spelling in commit message.

* Changes since v4
- Use the group->info structure added in previous patch instead of
  iterating over all VIN to find one that is instantiated to get the
  same information.
- Condense variable declaration in rvin_isp_setup_links().
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 37 ++++++++++---------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  2 +-
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 66efe075adae..73d713868391 100644
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
@@ -247,7 +247,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin);
+	return vin->group->link_setup(vin->group);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -910,35 +910,35 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
-static int rvin_csi2_setup_links(struct rvin_dev *vin)
+static int rvin_csi2_setup_links(struct rvin_group *group)
 {
 	const struct rvin_group_route *route;
 	unsigned int id;
 	int ret = -EINVAL;
 
 	/* Create all media device links between VINs and CSI-2's. */
-	mutex_lock(&vin->group->lock);
-	for (route = vin->info->routes; route->chsel; route++) {
+	mutex_lock(&group->lock);
+	for (route = group->info->routes; route->chsel; route++) {
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
@@ -992,30 +992,31 @@ static int rvin_csi2_init(struct rvin_dev *vin)
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
+		struct rvin_dev *vin = group->vin[i];
 
-		if (!vin->group->vin[i])
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
@@ -1031,7 +1032,7 @@ static int rvin_isp_setup_links(struct rvin_dev *vin)
 			break;
 		}
 	}
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 313703cd1103..cb8e8fa54f96 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -259,7 +259,7 @@ struct rvin_group {
 	const struct rvin_info *info;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
-	int (*link_setup)(struct rvin_dev *vin);
+	int (*link_setup)(struct rvin_group *group);
 
 	struct {
 		struct v4l2_async_connection *asc;
-- 
2.49.0


