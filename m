Return-Path: <linux-media+bounces-26865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36EA42BDD
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698363B11FD
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC78266B42;
	Mon, 24 Feb 2025 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="N33OULZA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MmXXe5RM"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9C26659F;
	Mon, 24 Feb 2025 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422440; cv=none; b=J8jatlXHn1fecjFzORfR575Wfs9udziSSWbEL0ghnJodILd/LomXI4j1cWaT2k46n5ZhAIUT4gl6m/8BLLsLQaopTuEbnPavrZKlEcapwxIECeQYDs4m9inkHpxtNurKv6uoDg948Ovcg1N4dkJG+JXPzGt6RimQWA9wLySx0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422440; c=relaxed/simple;
	bh=y9IDGx5h/PqW0/tiLIdmkRgIH1onLGZDHCwbFoNEzXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TiIno8RtNuSK4fsxEQJJwBvF0j4V4nu31zzchquEyBj4D/Sp6kviCjTssmELbdWLbL/5MdxWnC+0FK3VSUKIxnlUnpqW2IgxMdzSj8NelP3DkHmz45nmXtrXjHg9/ttdwrSBRRHxB7iFngyPXVIKdlcMLdYouByq4PPdY4wtETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=N33OULZA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MmXXe5RM; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 630101140222;
	Mon, 24 Feb 2025 13:40:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 24 Feb 2025 13:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740422436;
	 x=1740508836; bh=u2vtq+u4efnopq7W3IqXKTuqGLHufOSqxH6yBn6v244=; b=
	N33OULZAdpux3xPHErCjk6qnawKEtIJH3Pk8DY1wrKDQpyrBh/j5C1OVXqcU5XjB
	bi3OQPH2xTBIq4eD2HKt8RTH/ZNUH5+yCI/xMUmlqvtFDcY6BAi3n2ZSyKlJpIjB
	2G0F1zYYwPwKuscBiAXML6mlqzvt8mXZ26HOdxJUdpm00J6jhv5trfn3nyMvEvQS
	CZFW2sfzYsGwFK4cpQX/AUQ/0jW7tFCS3i9cCvFQa5Lv0CeUYybMWLpuRmNBC89S
	NUtrKKmRShiSpzmSbd2LozSzpuo/d9LGCmDJMI+yW94jweYcsax17e3N6CnizATh
	opR1xa4M7TueGMqr4vYDgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740422436; x=
	1740508836; bh=u2vtq+u4efnopq7W3IqXKTuqGLHufOSqxH6yBn6v244=; b=M
	mXXe5RMEgTGd33p7hB+xhifNqJAhXr5j/cmx2d5L+PShzuLxzWq/Pgo9bU1AJ32k
	wHpuPH2Jq9HpOENtT7UCuDwPdmKzf68IxLm1+jmGojOfxTNYvjYrth7TyzZ2zSO0
	baIT9LPt8YV+yWMVJeIc5lRcDNP/f/Z2l/H713KlKMqbGClHW4arUdPJJ3SdFKdd
	Nf9+iyjaFbZTY9RPMw8YSP34SKthJTsC1h51QgSUo8awlK16ix78STrq+djOaUZ0
	6Q39kFqdXZtlXCNoq1PZDj3T75ABJetgVWXd+DOwZMLViKDNbVeBJJAgHSVygmLj
	Ar9QTHh6wlyFQNr2+cSRQ==
X-ME-Sender: <xms:JL28Z4RzRcWjNDVb0pwrBw1zktZSm3rpqbKc8YbLsVbog4psskd6AA>
    <xme:JL28Z1zjAKJWYxB8-RsJgiY_2SOv6cHJKh2wwwROjGwP_D8i9bo7kOlz2ThufkGiW
    0ZA3BbLrwiYpgUcfBU>
X-ME-Received: <xmr:JL28Z13O1R74vih4cOB--oa_edBpp4eLgfvVlr-TG7kdMmdYplcg3C39frx4Q7fNIGqkq1NV51bO3A_w3IYOaFaT0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:JL28Z8DXD2FqaHv4JRQmmfTo86nvLopffQzSwPolzAl4uNno_HGWhA>
    <xmx:JL28Zxgh2TD5JuQg4K8pis6uZgCOihVhYrAr1QP1T50kZCic5X4nyw>
    <xmx:JL28Z4pDNbOhUqFhHLarY8G6hOLM3gDxXEYSCaEzcHyTb5fK1F1beQ>
    <xmx:JL28Z0hPMYrT0SLfaoPrItD609FNtBUtC8reH2OmkGKndfPKk5uQdQ>
    <xmx:JL28Z8XBxiR-Keuq3yw50eWxYNxuhgETo1GMhjDd7BrUq1hOER6eVu4Q>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 13:40:35 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 6/6] media: rcar-vin: Enable media-graph on Gen2
Date: Mon, 24 Feb 2025 19:39:38 +0100
Message-ID: <20250224183938.3800317-7-niklas.soderlund+renesas@ragnatech.se>
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

Complete the conversion from soc_camera to a full fledge media
controller enabled devices for all supported generations of the device.
All work is already done as this is already supported on Gen3, and
later.

All that is missing is some small touch ups of the unified v4l-notifier,
unconditionally creation of a media pad for each VIN and removing all
special cases for the non media-graph call paths.

Mark the completion of converting from soc_camera by injecting an
attribution of myself in the header.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 248 ++-------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +-----------------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  10 +-
 4 files changed, 65 insertions(+), 697 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 3b9860e45573..4bfbeae7cced 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -2,12 +2,11 @@
 /*
  * Driver for Renesas R-Car VIN
  *
+ * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2011-2013 Renesas Solutions Corp.
  * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
  * Copyright (C) 2008 Magnus Damm
- *
- * Based on the soc-camera rcar_vin driver
  */
 
 #include <linux/module.h>
@@ -42,9 +41,6 @@
 
 #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
 
-static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
-					  struct v4l2_subdev *subdev);
-
 /* -----------------------------------------------------------------------------
  * Gen3 Group Allocator
  */
@@ -267,10 +263,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	if (vin->group->link_setup)
-		return vin->group->link_setup(vin->group);
-
-	return  0;
+	return vin->group->link_setup(vin->group);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -318,17 +311,15 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 	guard(mutex)(&group->lock);
 
 	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
-		int ret;
-
 		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
 			continue;
 
-		ret = rvin_parallel_subdevice_attach(group->vin[i], subdev);
-		if (ret)
-			return ret;
-
-		v4l2_set_subdev_hostdata(subdev, group->vin[i]);
+		group->vin[i]->parallel.source_pad = 0;
+		for (unsigned int pad = 0; pad < subdev->entity.num_pads; pad++)
+			if (subdev->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)
+				group->vin[i]->parallel.source_pad = pad;
 
+		group->vin[i]->parallel.subdev = subdev;
 		vin_dbg(group->vin[i], "Bound subdev %s\n", subdev->name);
 
 		return 0;
@@ -393,14 +384,6 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 	return ret;
 }
 
-static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
-{
-	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
-		v4l2_async_nf_unregister(&vin->group->notifier);
-		v4l2_async_nf_cleanup(&vin->group->notifier);
-	}
-}
-
 static int rvin_parallel_parse_of(struct rvin_dev *vin)
 {
 	struct fwnode_handle *ep, *fwnode;
@@ -546,7 +529,7 @@ static void rvin_free_controls(struct rvin_dev *vin)
 	vin->vdev.ctrl_handler = NULL;
 }
 
-static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
+static int rvin_create_controls(struct rvin_dev *vin)
 {
 	int ret;
 
@@ -564,115 +547,11 @@ static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev
 		return ret;
 	}
 
-	/* For the non-MC mode add controls from the subdevice. */
-	if (subdev) {
-		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
-					    subdev->ctrl_handler, NULL, true);
-		if (ret < 0) {
-			rvin_free_controls(vin);
-			return ret;
-		}
-	}
-
 	vin->vdev.ctrl_handler = &vin->ctrl_handler;
 
 	return 0;
 }
 
-/* -----------------------------------------------------------------------------
- * Async notifier
- */
-
-static int rvin_find_pad(struct v4l2_subdev *sd, int direction)
-{
-	unsigned int pad;
-
-	if (sd->entity.num_pads <= 1)
-		return 0;
-
-	for (pad = 0; pad < sd->entity.num_pads; pad++)
-		if (sd->entity.pads[pad].flags & direction)
-			return pad;
-
-	return -EINVAL;
-}
-
-/* -----------------------------------------------------------------------------
- * Parallel async notifier
- */
-
-/* The vin lock should be held when calling the subdevice attach and detach */
-static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
-					  struct v4l2_subdev *subdev)
-{
-	struct v4l2_subdev_mbus_code_enum code = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	int ret;
-
-	/* Find source and sink pad of remote subdevice */
-	ret = rvin_find_pad(subdev, MEDIA_PAD_FL_SOURCE);
-	if (ret < 0)
-		return ret;
-	vin->parallel.source_pad = ret;
-
-	ret = rvin_find_pad(subdev, MEDIA_PAD_FL_SINK);
-	vin->parallel.sink_pad = ret < 0 ? 0 : ret;
-
-	if (vin->info->use_mc) {
-		vin->parallel.subdev = subdev;
-		return 0;
-	}
-
-	/* Find compatible subdevices mbus format */
-	vin->mbus_code = 0;
-	code.index = 0;
-	code.pad = vin->parallel.source_pad;
-	while (!vin->mbus_code &&
-	       !v4l2_subdev_call(subdev, pad, enum_mbus_code, NULL, &code)) {
-		code.index++;
-		switch (code.code) {
-		case MEDIA_BUS_FMT_YUYV8_1X16:
-		case MEDIA_BUS_FMT_UYVY8_1X16:
-		case MEDIA_BUS_FMT_UYVY8_2X8:
-		case MEDIA_BUS_FMT_UYVY10_2X10:
-		case MEDIA_BUS_FMT_RGB888_1X24:
-			vin->mbus_code = code.code;
-			vin_dbg(vin, "Found media bus format for %s: %d\n",
-				subdev->name, vin->mbus_code);
-			break;
-		default:
-			break;
-		}
-	}
-
-	if (!vin->mbus_code) {
-		vin_err(vin, "Unsupported media bus format for %s\n",
-			subdev->name);
-		return -EINVAL;
-	}
-
-	/* Read tvnorms */
-	ret = v4l2_subdev_call(subdev, video, g_tvnorms, &vin->vdev.tvnorms);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
-		return ret;
-
-	/* Read standard */
-	vin->std = V4L2_STD_UNKNOWN;
-	ret = v4l2_subdev_call(subdev, video, g_std, &vin->std);
-	if (ret < 0 && ret != -ENOIOCTLCMD)
-		return ret;
-
-	/* Add the controls */
-	ret = rvin_create_controls(vin, subdev);
-	if (ret < 0)
-		return ret;
-
-	vin->parallel.subdev = subdev;
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * CSI-2
  */
@@ -944,39 +823,17 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
 	return ret;
 }
 
-static void rvin_csi2_cleanup(struct rvin_dev *vin)
-{
-	rvin_group_notifier_cleanup(vin);
-	rvin_group_put(vin);
-	rvin_free_controls(vin);
-}
-
 static int rvin_csi2_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	vin->pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
-	if (ret)
-		return ret;
-
-	ret = rvin_create_controls(vin, NULL);
-	if (ret < 0)
-		return ret;
-
 	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_csi2_media_ops);
 	if (ret)
-		goto err_controls;
+		return ret;
 
 	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
 	if (ret)
-		goto err_group;
-
-	return 0;
-err_group:
-	rvin_group_put(vin);
-err_controls:
-	rvin_free_controls(vin);
+		rvin_group_put(vin);
 
 	return ret;
 }
@@ -1032,41 +889,19 @@ static int rvin_isp_setup_links(struct rvin_group *group)
 	return ret;
 }
 
-static void rvin_isp_cleanup(struct rvin_dev *vin)
-{
-	rvin_group_notifier_cleanup(vin);
-	rvin_group_put(vin);
-	rvin_free_controls(vin);
-}
-
 static int rvin_isp_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	vin->pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
-	if (ret)
-		return ret;
-
-	ret = rvin_create_controls(vin, NULL);
-	if (ret < 0)
-		return ret;
-
 	ret = rvin_group_get(vin, rvin_isp_setup_links, NULL);
 	if (ret)
-		goto err_controls;
+		return ret;
 
 	ret = rvin_group_notifier_init(vin, 2, RVIN_ISP_MAX);
 	if (ret)
-		goto err_group;
+		rvin_group_put(vin);
 
 	return 0;
-err_group:
-	rvin_group_put(vin);
-err_controls:
-	rvin_free_controls(vin);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1101,7 +936,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
 	 * as we don't know if and in which order the master VINs will
 	 * be resumed.
 	 */
-	if (vin->info->use_mc) {
+	if (vin->info->model == RCAR_GEN3) {
 		unsigned int master_id = rvin_group_id_to_master(vin->id);
 		struct rvin_dev *master = vin->group->vin[master_id];
 		int ret;
@@ -1123,7 +958,6 @@ static int __maybe_unused rvin_resume(struct device *dev)
 
 static const struct rvin_info rcar_info_h1 = {
 	.model = RCAR_H1,
-	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
 	.scaler = rvin_scaler_gen2,
@@ -1131,7 +965,6 @@ static const struct rvin_info rcar_info_h1 = {
 
 static const struct rvin_info rcar_info_m1 = {
 	.model = RCAR_M1,
-	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
 	.scaler = rvin_scaler_gen2,
@@ -1139,7 +972,6 @@ static const struct rvin_info rcar_info_m1 = {
 
 static const struct rvin_info rcar_info_gen2 = {
 	.model = RCAR_GEN2,
-	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
 	.scaler = rvin_scaler_gen2,
@@ -1154,7 +986,6 @@ static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
 
 static const struct rvin_info rcar_info_r8a774e1 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a774e1_routes,
@@ -1170,7 +1001,6 @@ static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
 
 static const struct rvin_info rcar_info_r8a7795 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1188,7 +1018,6 @@ static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
 
 static const struct rvin_info rcar_info_r8a7796 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1206,7 +1035,6 @@ static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77965 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1221,7 +1049,6 @@ static const struct rvin_group_route rcar_info_r8a77970_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77970 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77970_routes,
@@ -1235,7 +1062,6 @@ static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77980 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1249,7 +1075,6 @@ static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77990 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1263,7 +1088,6 @@ static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77995 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1273,7 +1097,6 @@ static const struct rvin_info rcar_info_r8a77995 = {
 
 static const struct rvin_info rcar_info_gen4 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.use_isp = true,
 	.nv12 = true,
 	.raw10 = true,
@@ -1387,24 +1210,39 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
-	if (vin->info->use_isp) {
-		ret = rvin_isp_init(vin);
-	} else if (vin->info->use_mc) {
-		ret = rvin_csi2_init(vin);
+	vin->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
+	if (ret)
+		return ret;
 
-		if (vin->info->scaler &&
-		    rvin_group_id_to_master(vin->id) == vin->id)
-			vin->scaler = vin->info->scaler;
-	} else {
-		ret = rvin_group_get(vin, NULL, NULL);
+	ret = rvin_create_controls(vin);
+	if (ret < 0)
+		return ret;
+
+	switch (vin->info->model) {
+	case RCAR_GEN3:
+		if (vin->info->use_isp) {
+			ret = rvin_isp_init(vin);
+		} else {
+			ret = rvin_csi2_init(vin);
+
+			if (vin->info->scaler &&
+			    rvin_group_id_to_master(vin->id) == vin->id)
+				vin->scaler = vin->info->scaler;
+		}
+		break;
+	default:
+		ret = rvin_group_get(vin, rvin_parallel_setup_links, NULL);
 		if (!ret)
 			ret = rvin_group_notifier_init(vin, 0, 0);
 
 		if (vin->info->scaler)
 			vin->scaler = vin->info->scaler;
+		break;
 	}
 
 	if (ret) {
+		rvin_free_controls(vin);
 		rvin_dma_unregister(vin);
 		return ret;
 	}
@@ -1423,10 +1261,14 @@ static void rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	if (vin->info->use_isp)
-		rvin_isp_cleanup(vin);
-	else if (vin->info->use_mc)
-		rvin_csi2_cleanup(vin);
+	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
+		v4l2_async_nf_unregister(&vin->group->notifier);
+		v4l2_async_nf_cleanup(&vin->group->notifier);
+	}
+
+	rvin_group_put(vin);
+
+	rvin_free_controls(vin);
 
 	rvin_dma_unregister(vin);
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8773998101ff..c12c7f7cf3ab 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -2,12 +2,11 @@
 /*
  * Driver for Renesas R-Car VIN
  *
+ * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2011-2013 Renesas Solutions Corp.
  * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
  * Copyright (C) 2008 Magnus Damm
- *
- * Based on the soc-camera rcar_vin driver
  */
 
 #include <linux/delay.h>
@@ -559,8 +558,6 @@ void rvin_scaler_gen2(struct rvin_dev *vin)
 
 	/* Set scaling coefficient */
 	crop_height = vin->crop.height;
-	if (V4L2_FIELD_HAS_BOTH(vin->format.field))
-		crop_height *= 2;
 
 	ys = 0;
 	if (crop_height != vin->compose.height)
@@ -717,9 +714,6 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_FIELD_INTERLACED:
 		/* Default to TB */
 		vnmc = VNMC_IM_FULL;
-		/* Use BT if video standard can be read and is 60 Hz format */
-		if (!vin->info->use_mc && vin->std & V4L2_STD_525_60)
-			vnmc = VNMC_IM_FULL | VNMC_FOC;
 		break;
 	case V4L2_FIELD_INTERLACED_TB:
 		vnmc = VNMC_IM_FULL;
@@ -1381,14 +1375,6 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	struct media_pad *pad;
 	int ret;
 
-	/* No media controller used, simply pass operation to subdevice. */
-	if (!vin->info->use_mc) {
-		ret = v4l2_subdev_call(vin->parallel.subdev, video, s_stream,
-				       on);
-
-		return ret == -ENOIOCTLCMD ? 0 : ret;
-	}
-
 	pad = media_pad_remote_pad_first(&vin->pad);
 	if (!pad)
 		return -EPIPE;
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 756fdfdbce61..542c6c93d20d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -2,12 +2,11 @@
 /*
  * Driver for Renesas R-Car VIN
  *
+ * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2011-2013 Renesas Solutions Corp.
  * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
  * Copyright (C) 2008 Magnus Damm
- *
- * Based on the soc-camera rcar_vin driver
  */
 
 #include <linux/pm_runtime.h>
@@ -235,101 +234,6 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
  * V4L2
  */
 
-static int rvin_reset_format(struct rvin_dev *vin)
-{
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad = vin->parallel.source_pad,
-	};
-	int ret;
-
-	ret = v4l2_subdev_call(vin_to_source(vin), pad, get_fmt, NULL, &fmt);
-	if (ret)
-		return ret;
-
-	v4l2_fill_pix_format(&vin->format, &fmt.format);
-
-	vin->crop.top = 0;
-	vin->crop.left = 0;
-	vin->crop.width = vin->format.width;
-	vin->crop.height = vin->format.height;
-
-	/*  Make use of the hardware interlacer by default. */
-	if (vin->format.field == V4L2_FIELD_ALTERNATE) {
-		vin->format.field = V4L2_FIELD_INTERLACED;
-		vin->format.height *= 2;
-	}
-
-	rvin_format_align(vin, &vin->format);
-
-	vin->compose.top = 0;
-	vin->compose.left = 0;
-	vin->compose.width = vin->format.width;
-	vin->compose.height = vin->format.height;
-
-	return 0;
-}
-
-static int rvin_try_format(struct rvin_dev *vin, u32 which,
-			   struct v4l2_pix_format *pix,
-			   struct v4l2_rect *src_rect)
-{
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	struct v4l2_subdev_state *sd_state;
-	static struct lock_class_key key;
-	struct v4l2_subdev_format format = {
-		.which = which,
-		.pad = vin->parallel.source_pad,
-	};
-	enum v4l2_field field;
-	u32 width, height;
-	int ret;
-
-	/*
-	 * FIXME: Drop this call, drivers are not supposed to use
-	 * __v4l2_subdev_state_alloc().
-	 */
-	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
-	if (IS_ERR(sd_state))
-		return PTR_ERR(sd_state);
-
-	if (!rvin_format_from_pixel(vin, pix->pixelformat))
-		pix->pixelformat = RVIN_DEFAULT_FORMAT;
-
-	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
-
-	/* Allow the video device to override field and to scale */
-	field = pix->field;
-	width = pix->width;
-	height = pix->height;
-
-	ret = v4l2_subdev_call(sd, pad, set_fmt, sd_state, &format);
-	if (ret < 0 && ret != -ENOIOCTLCMD)
-		goto done;
-	ret = 0;
-
-	v4l2_fill_pix_format(pix, &format.format);
-
-	if (src_rect) {
-		src_rect->top = 0;
-		src_rect->left = 0;
-		src_rect->width = pix->width;
-		src_rect->height = pix->height;
-	}
-
-	if (field != V4L2_FIELD_ANY)
-		pix->field = field;
-
-	pix->width = width;
-	pix->height = height;
-
-	rvin_format_align(vin, pix);
-done:
-	__v4l2_subdev_state_free(sd_state);
-
-	return ret;
-}
-
 static int rvin_querycap(struct file *file, void *priv,
 			 struct v4l2_capability *cap)
 {
@@ -338,42 +242,6 @@ static int rvin_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rvin_try_fmt_vid_cap(struct file *file, void *priv,
-				struct v4l2_format *f)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-
-	return rvin_try_format(vin, V4L2_SUBDEV_FORMAT_TRY, &f->fmt.pix, NULL);
-}
-
-static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
-			      struct v4l2_format *f)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_rect fmt_rect, src_rect;
-	int ret;
-
-	if (vb2_is_busy(&vin->queue))
-		return -EBUSY;
-
-	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
-			      &src_rect);
-	if (ret)
-		return ret;
-
-	vin->format = f->fmt.pix;
-
-	fmt_rect.top = 0;
-	fmt_rect.left = 0;
-	fmt_rect.width = vin->format.width;
-	fmt_rect.height = vin->format.height;
-
-	v4l2_rect_map_inside(&vin->crop, &src_rect);
-	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
-
-	return 0;
-}
-
 static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
@@ -470,6 +338,7 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 
 static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
 {
+	struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
@@ -477,18 +346,11 @@ static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
 	unsigned int index;
 	int ret;
 
-	if (vin->info->use_mc) {
-		struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
+	if (!pad)
+		return -EINVAL;
 
-		if (!pad)
-			return -EINVAL;
-
-		sd = media_entity_to_v4l2_subdev(pad->entity);
-		index = pad->index;
-	} else {
-		sd = vin_to_source(vin);
-		index = vin->parallel.source_pad;
-	}
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+	index = pad->index;
 
 	fmt.pad = index;
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
@@ -630,113 +492,6 @@ static int rvin_s_selection(struct file *file, void *fh,
 	return 0;
 }
 
-static int rvin_g_parm(struct file *file, void *priv,
-		       struct v4l2_streamparm *parm)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-
-	return v4l2_g_parm_cap(&vin->vdev, sd, parm);
-}
-
-static int rvin_s_parm(struct file *file, void *priv,
-		       struct v4l2_streamparm *parm)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-
-	return v4l2_s_parm_cap(&vin->vdev, sd, parm);
-}
-
-static int rvin_g_pixelaspect(struct file *file, void *priv,
-			      int type, struct v4l2_fract *f)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-
-	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-
-	return v4l2_subdev_call(sd, video, g_pixelaspect, f);
-}
-
-static int rvin_enum_input(struct file *file, void *priv,
-			   struct v4l2_input *i)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	int ret;
-
-	if (i->index != 0)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(sd, video, g_input_status, &i->status);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
-		return ret;
-
-	i->type = V4L2_INPUT_TYPE_CAMERA;
-
-	if (v4l2_subdev_has_op(sd, pad, dv_timings_cap)) {
-		i->capabilities = V4L2_IN_CAP_DV_TIMINGS;
-		i->std = 0;
-	} else {
-		i->capabilities = V4L2_IN_CAP_STD;
-		i->std = vin->vdev.tvnorms;
-	}
-
-	strscpy(i->name, "Camera", sizeof(i->name));
-
-	return 0;
-}
-
-static int rvin_g_input(struct file *file, void *priv, unsigned int *i)
-{
-	*i = 0;
-	return 0;
-}
-
-static int rvin_s_input(struct file *file, void *priv, unsigned int i)
-{
-	if (i > 0)
-		return -EINVAL;
-	return 0;
-}
-
-static int rvin_querystd(struct file *file, void *priv, v4l2_std_id *a)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-
-	return v4l2_subdev_call(sd, video, querystd, a);
-}
-
-static int rvin_s_std(struct file *file, void *priv, v4l2_std_id a)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	int ret;
-
-	ret = v4l2_subdev_call(vin_to_source(vin), video, s_std, a);
-	if (ret < 0)
-		return ret;
-
-	vin->std = a;
-
-	/* Changing the standard will change the width/height */
-	return rvin_reset_format(vin);
-}
-
-static int rvin_g_std(struct file *file, void *priv, v4l2_std_id *a)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-
-	if (v4l2_subdev_has_op(vin_to_source(vin), pad, dv_timings_cap))
-		return -ENOIOCTLCMD;
-
-	*a = vin->std;
-
-	return 0;
-}
-
 static int rvin_subscribe_event(struct v4l2_fh *fh,
 				const struct v4l2_event_subscription *sub)
 {
@@ -747,167 +502,6 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
-static int rvin_enum_dv_timings(struct file *file, void *priv_fh,
-				struct v4l2_enum_dv_timings *timings)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	int ret;
-
-	if (timings->pad)
-		return -EINVAL;
-
-	timings->pad = vin->parallel.sink_pad;
-
-	ret = v4l2_subdev_call(sd, pad, enum_dv_timings, timings);
-
-	timings->pad = 0;
-
-	return ret;
-}
-
-static int rvin_s_dv_timings(struct file *file, void *priv_fh,
-			     struct v4l2_dv_timings *timings)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	int ret;
-
-	ret = v4l2_subdev_call(sd, pad, s_dv_timings,
-			       vin->parallel.sink_pad, timings);
-	if (ret)
-		return ret;
-
-	/* Changing the timings will change the width/height */
-	return rvin_reset_format(vin);
-}
-
-static int rvin_g_dv_timings(struct file *file, void *priv_fh,
-			     struct v4l2_dv_timings *timings)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-
-	return v4l2_subdev_call(sd, pad, g_dv_timings,
-				vin->parallel.sink_pad, timings);
-}
-
-static int rvin_query_dv_timings(struct file *file, void *priv_fh,
-				 struct v4l2_dv_timings *timings)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-
-	return v4l2_subdev_call(sd, pad, query_dv_timings,
-				vin->parallel.sink_pad, timings);
-}
-
-static int rvin_dv_timings_cap(struct file *file, void *priv_fh,
-			       struct v4l2_dv_timings_cap *cap)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	int ret;
-
-	if (cap->pad)
-		return -EINVAL;
-
-	cap->pad = vin->parallel.sink_pad;
-
-	ret = v4l2_subdev_call(sd, pad, dv_timings_cap, cap);
-
-	cap->pad = 0;
-
-	return ret;
-}
-
-static int rvin_g_edid(struct file *file, void *fh, struct v4l2_edid *edid)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	int ret;
-
-	if (edid->pad)
-		return -EINVAL;
-
-	edid->pad = vin->parallel.sink_pad;
-
-	ret = v4l2_subdev_call(sd, pad, get_edid, edid);
-
-	edid->pad = 0;
-
-	return ret;
-}
-
-static int rvin_s_edid(struct file *file, void *fh, struct v4l2_edid *edid)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	int ret;
-
-	if (edid->pad)
-		return -EINVAL;
-
-	edid->pad = vin->parallel.sink_pad;
-
-	ret = v4l2_subdev_call(sd, pad, set_edid, edid);
-
-	edid->pad = 0;
-
-	return ret;
-}
-
-static const struct v4l2_ioctl_ops rvin_ioctl_ops = {
-	.vidioc_querycap		= rvin_querycap,
-	.vidioc_try_fmt_vid_cap		= rvin_try_fmt_vid_cap,
-	.vidioc_g_fmt_vid_cap		= rvin_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap		= rvin_s_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
-
-	.vidioc_g_selection		= rvin_g_selection,
-	.vidioc_s_selection		= rvin_s_selection,
-
-	.vidioc_g_parm			= rvin_g_parm,
-	.vidioc_s_parm			= rvin_s_parm,
-
-	.vidioc_g_pixelaspect		= rvin_g_pixelaspect,
-
-	.vidioc_enum_input		= rvin_enum_input,
-	.vidioc_g_input			= rvin_g_input,
-	.vidioc_s_input			= rvin_s_input,
-
-	.vidioc_dv_timings_cap		= rvin_dv_timings_cap,
-	.vidioc_enum_dv_timings		= rvin_enum_dv_timings,
-	.vidioc_g_dv_timings		= rvin_g_dv_timings,
-	.vidioc_s_dv_timings		= rvin_s_dv_timings,
-	.vidioc_query_dv_timings	= rvin_query_dv_timings,
-
-	.vidioc_g_edid			= rvin_g_edid,
-	.vidioc_s_edid			= rvin_s_edid,
-
-	.vidioc_querystd		= rvin_querystd,
-	.vidioc_g_std			= rvin_g_std,
-	.vidioc_s_std			= rvin_s_std,
-
-	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
-	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
-	.vidioc_querybuf		= vb2_ioctl_querybuf,
-	.vidioc_qbuf			= vb2_ioctl_qbuf,
-	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
-	.vidioc_expbuf			= vb2_ioctl_expbuf,
-	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
-	.vidioc_streamon		= vb2_ioctl_streamon,
-	.vidioc_streamoff		= vb2_ioctl_streamoff,
-
-	.vidioc_log_status		= v4l2_ctrl_log_status,
-	.vidioc_subscribe_event		= rvin_subscribe_event,
-	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
-};
-
-/* -----------------------------------------------------------------------------
- * V4L2 Media Controller
- */
-
 static void rvin_mc_try_format(struct rvin_dev *vin,
 			       struct v4l2_pix_format *pix)
 {
@@ -986,19 +580,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
  * File Operations
  */
 
-static int rvin_power_parallel(struct rvin_dev *vin, bool on)
-{
-	struct v4l2_subdev *sd = vin_to_source(vin);
-	int power = on ? 1 : 0;
-	int ret;
-
-	ret = v4l2_subdev_call(sd, core, s_power, power);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
-		return ret;
-
-	return 0;
-}
-
 static int rvin_open(struct file *file)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -1018,11 +599,7 @@ static int rvin_open(struct file *file)
 	if (ret)
 		goto err_unlock;
 
-	if (vin->info->use_mc)
-		ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
-	else if (v4l2_fh_is_singular_file(file))
-		ret = rvin_power_parallel(vin, true);
-
+	ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
 	if (ret < 0)
 		goto err_open;
 
@@ -1034,10 +611,7 @@ static int rvin_open(struct file *file)
 
 	return 0;
 err_power:
-	if (vin->info->use_mc)
-		v4l2_pipeline_pm_put(&vin->vdev.entity);
-	else if (v4l2_fh_is_singular_file(file))
-		rvin_power_parallel(vin, false);
+	v4l2_pipeline_pm_put(&vin->vdev.entity);
 err_open:
 	v4l2_fh_release(file);
 err_unlock:
@@ -1051,23 +625,14 @@ static int rvin_open(struct file *file)
 static int rvin_release(struct file *file)
 {
 	struct rvin_dev *vin = video_drvdata(file);
-	bool fh_singular;
 	int ret;
 
 	mutex_lock(&vin->lock);
 
-	/* Save the singular status before we call the clean-up helper */
-	fh_singular = v4l2_fh_is_singular_file(file);
-
 	/* the release helper will cleanup any on-going streaming */
 	ret = _vb2_fop_release(file, NULL);
 
-	if (vin->info->use_mc) {
-		v4l2_pipeline_pm_put(&vin->vdev.entity);
-	} else {
-		if (fh_singular)
-			rvin_power_parallel(vin, false);
-	}
+	v4l2_pipeline_pm_put(&vin->vdev.entity);
 
 	mutex_unlock(&vin->lock);
 
@@ -1098,18 +663,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
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
@@ -1120,12 +673,6 @@ static void rvin_notify(struct v4l2_subdev *sd,
 		container_of(sd->v4l2_dev, struct rvin_dev, v4l2_dev);
 	unsigned int i;
 
-	/* If no media controller, no need to route the event. */
-	if (!vin->info->use_mc) {
-		rvin_notify_video_device(vin, notification, arg);
-		return;
-	}
-
 	group = vin->group;
 
 	for (i = 0; i < RCAR_VIN_NUM; i++) {
@@ -1141,7 +688,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
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
 
@@ -1169,13 +722,8 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 	vin->format.field = RVIN_DEFAULT_FIELD;
 	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
 
-	if (vin->info->use_mc) {
-		vdev->device_caps |= V4L2_CAP_IO_MC;
-		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
-	} else {
-		vdev->ioctl_ops = &rvin_ioctl_ops;
-		rvin_reset_format(vin);
-	}
+	vdev->device_caps |= V4L2_CAP_IO_MC;
+	vdev->ioctl_ops = &rvin_mc_ioctl_ops;
 
 	rvin_format_align(vin, &vin->format);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 47253de5681c..0e37af54c7b0 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -2,12 +2,11 @@
 /*
  * Driver for Renesas R-Car VIN
  *
+ * Copyright (C) 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2011-2013 Renesas Solutions Corp.
  * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
  * Copyright (C) 2008 Magnus Damm
- *
- * Based on the soc-camera rcar_vin driver
  */
 
 #ifndef __RCAR_VIN__
@@ -111,8 +110,6 @@ struct rvin_video_format {
  * @mbus_type:	media bus type
  * @bus:	media bus parallel configuration
  * @source_pad:	source pad of remote subdevice
- * @sink_pad:	sink pad of remote subdevice
- *
  */
 struct rvin_parallel_entity {
 	struct v4l2_async_connection *asc;
@@ -122,7 +119,6 @@ struct rvin_parallel_entity {
 	struct v4l2_mbus_config_parallel bus;
 
 	unsigned int source_pad;
-	unsigned int sink_pad;
 };
 
 /**
@@ -149,7 +145,6 @@ struct rvin_group_route {
 /**
  * struct rvin_info - Information about the particular VIN implementation
  * @model:		VIN model
- * @use_mc:		use media controller instead of controlling subdevice
  * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
  * @nv12:		support outputting NV12 pixel format
  * @raw10:		support outputting RAW10 pixel format
@@ -161,7 +156,6 @@ struct rvin_group_route {
  */
 struct rvin_info {
 	enum model_id model;
-	bool use_mc;
 	bool use_isp;
 	bool nv12;
 	bool raw10;
@@ -208,7 +202,6 @@ struct rvin_info {
  * @crop:		active cropping
  * @compose:		active composing
  * @scaler:		Optional scaler
- * @std:		active video standard of the video source
  *
  * @alpha:		Alpha component to fill in for supported pixel formats
  */
@@ -251,7 +244,6 @@ struct rvin_dev {
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
 	void (*scaler)(struct rvin_dev *vin);
-	v4l2_std_id std;
 
 	unsigned int alpha;
 };
-- 
2.48.1


