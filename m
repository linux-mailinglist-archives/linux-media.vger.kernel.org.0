Return-Path: <linux-media+bounces-26861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64881A42BC1
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E40517A405
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E6D2661B8;
	Mon, 24 Feb 2025 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gR0L9xv0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="3dxF1Qlo"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B569A266188;
	Mon, 24 Feb 2025 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422431; cv=none; b=ZUFS7ofZ551VIJM8Q+dLa9fSGRHQsHfmIsOHgzGjN2CH6r/mMMct+IwV+0xT68F4wfEjXmEYvYKqe0nwMNpON7eaQBAWhPv35+A7wqcb98WUDGI4DAGz29XXOS67mlc+NKvIQ+Mk7hG9DI2oWFsAEOn8TxeyUNJYjGwKmgwl6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422431; c=relaxed/simple;
	bh=BK9DSjiwh1/KPwMnNT+dNR1Cl4/OQ574rA92JhXRGho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cU8glvzQviW6TmLfyFRW5d0J3LEnWNr7r46xboo+zb8eG0QW4CgIk4CQss2BURqe8bE13kmZy3kgpKzbF1nafDD91UfpJUbfwdhU1E1iBcQHjVxDRybwgKrzb/ec+hPRBHWqzXZsSWEmlh7tFwTVhz+y+RT2t873yKVAT6o4FA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gR0L9xv0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=3dxF1Qlo; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id C6DC51381130;
	Mon, 24 Feb 2025 13:40:28 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 24 Feb 2025 13:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740422428;
	 x=1740508828; bh=jns65N7Mh8OrAzqzfQeXmVS4VxVjbDQZB013QFFMEHg=; b=
	gR0L9xv0GV2iRfcsoI8wRp66XSEg1WQgRtU2YyPFVPm0ExpROBd02o5bSBd0p1ch
	gWgk/HysD6a+QqEkvCPXYTSyMqfsPXkonioC2qndormH8zCq19YO5/j4I+lTJDBf
	1zOd95FxSzC1oq8iPKWDgblNutQt4WpX+lzRDWVly6ty+5a/MwEDA7ksauk0oWrt
	ab/+xc3UG16ni+CheLfS7eLD9rS3BmjFCyVmQFJs4eA6Eef69Px8N8pDrqjRSCUC
	h4f99yScJcoaK0F+G8M3x8tuZKd/D/Hw2WgSSmHUNTC8z8h65n61e2Qq64yex3kJ
	zdhM+VR7hxtmzTnHrQWGaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740422428; x=
	1740508828; bh=jns65N7Mh8OrAzqzfQeXmVS4VxVjbDQZB013QFFMEHg=; b=3
	dxF1QloIXvRqIjnriNfLjEZ7eei2+i8gwZoXPPIj7s7iujjK0VkPutfA9GXBinS5
	db/1vIBn3GrWrAZxurbFM1hAt2lwUEc4ZwmOuNDkB0Kih43lHosahUrq2NXoemf1
	qyGHOcaj0v+G4ojivXWeCuWZYGZ4qpUNSeV60iZplhZi15Idg3ZulqHIYX9wPPGj
	VSS/x8C8cYHXiVtmxvUZRlLktCHYM0bEuYhsyZTkoRvO30ds6oQ1Ypm8OYUA4Got
	/V6fCB5hT/UYHn6WLmNjkhHoW47TNm5j/BFQFlx3/WSlr+V2IfWDo3T9NOZJNwcV
	nUGEWqHKU4VIRUsAbOiHQ==
X-ME-Sender: <xms:HL28Z2C5dSLuH2YV4Amd5OAxMEsyc9KIhWzQEHfw9oPgiEv79-MobA>
    <xme:HL28ZwhKIt006wqAQtiDj90--BFKL7YN4tIRrr5LgP-82WlibQDQLT5g3FYSlpubN
    mr3E2boc7y-_1l7pOw>
X-ME-Received: <xmr:HL28Z5kN3Rz4FRduI9aMI91ocM0dGIu3iBcYpgT8mps3iyAAP3xe-IP64co0KM8Vqax-gZtc7as1c8X1VpQiQAjEhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:HL28Z0ysRWBfyBf0TqQ1ECxlzisgKPbtKkPGb9xa1Zged_hyRVU1og>
    <xmx:HL28Z7RoypAJqAldEw9iKvUl9n5LIxYqjXyepmZBnpTda7zxyfDtOg>
    <xmx:HL28Z_boFp_TxjtUpot6DFxds3wQNOru2AF2jukiBshVV5uyN4zJFQ>
    <xmx:HL28Z0TGc9t8ehm9Nw0huc99LkqcWYVbJHtQB0UJ4JV5EExw4fwRlg>
    <xmx:HL28Z6E2RFYlKbht38rEDJNVh0RZj2DspNbWX5nV0caIW0kR5RK4r91q>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 13:40:28 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/6] media: rcar-vin: Change link setup argument
Date: Mon, 24 Feb 2025 19:39:34 +0100
Message-ID: <20250224183938.3800317-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224183938.3800317-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250224183938.3800317-1-niklas.soderlund+renesas@ragnatech.se>
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
index fcb3162f9ab6..91e871580e70 100644
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
index f87d4bc9e53e..1131d43e38e3 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -290,7 +290,7 @@ struct rvin_group {
 	struct v4l2_async_notifier notifier;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
-	int (*link_setup)(struct rvin_dev *vin);
+	int (*link_setup)(struct rvin_group *group);
 
 	struct {
 		struct v4l2_async_connection *asc;
-- 
2.48.1


