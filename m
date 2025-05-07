Return-Path: <linux-media+bounces-31951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B36AADBAC
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46A8468752
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533B11FFC55;
	Wed,  7 May 2025 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="h0lXN25A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kE7a+d43"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EF1FCCF8;
	Wed,  7 May 2025 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610902; cv=none; b=UZVj/kfLtzm5mRwKKo9WP8EnE5DALgVtWV6Awi1+LE4kjd7cAbd+CM5F9fcwepGhuMWhGjodIIkntiLAFuddP+/BklEp1m20bEU/vWWODe1is0EBKy8dkKZ0w6PJIgGiLRg7j2Eo5L1xWmdYvfjYRth61m2gFMXL3/XuoIOMcjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610902; c=relaxed/simple;
	bh=fMpVMSy/RA0s5VcFuilIRhwoMcdSpqsj2j2kAgdcKjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAEC7wTSroTF9d6U7reFf8KO4Q0wCzyN01ZXIXKXl1qdiQmy4THTo2SFtBsbyMOKDi7TXk5u7BFxadrjIIXXrM/ebVE7JqPixjIyNZtvOKyRt4T4KlHNiGKR5bNslGUuIuBezc/TmXJ3SEqYVCTI88evw/W9CDH2iegxhOj29HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=h0lXN25A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kE7a+d43; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id AA89F138014B;
	Wed,  7 May 2025 05:41:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 May 2025 05:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746610898;
	 x=1746697298; bh=V2F3USovc3hgdQE8Irl7QrBRSWB+JQ32NQcXe6w5izs=; b=
	h0lXN25AcY4n1dbVXlxX1vJkK8OKUCnG5ii9J9Z54uDbtYgEPjjf7RdrxybCzBET
	+MyF5Gi58c/k5c2RjzzcCGcmOyab0763/0TxCiRrGRO+VtgDIgct2Iwz4azEW4Ys
	j2xXLdWOEhTQimLhn59khTq4AxYMqdrQhjRip1kTa9yEllFXCd/APLkHyGfr2iaj
	C9UizW49gRIb8sT80zpclPFWnmKQLznbC9SjhKHnaooxiGltZhptQRaHQN1VCoQt
	RY/fL3/wcF4efuhRXczsELApdXLvuD8gawjJpI8XKg1ZLzf0+4FurkQsKiBjZCUa
	ucHUMQlpWYYZWXOQZiB+uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746610898; x=
	1746697298; bh=V2F3USovc3hgdQE8Irl7QrBRSWB+JQ32NQcXe6w5izs=; b=k
	E7a+d43F2GpuxROLNawg4mLHylVPMNbcH8nRuFbeNBon9Cz+9HAK6wicRALRAwrr
	X0lyYI+yWKqKo7C5WbMbnlimay+KNkyCuZi1rIl2yKuf/NhGuXZZanzkaiUJHQtO
	0Lu+X8wdJSCnRDAFav08060sAnSLd1DJu42jNXVn37Fjo4wbzDYBMKLLGYRLK+Q9
	DQfe5yqdHkprFnS/Y1LxSS0bSRrK3Xh1Y7ERDiPNm6t0rdlgXrFIoBU/Hk6XvkQf
	0QR5bVW+rK5GXdCB66NfIpLRcu927/8dammJ5X3pTNvLqJODaddWFuJpVK28CDf4
	nwpCWZ7XHQ8RyFEN4SiXA==
X-ME-Sender: <xms:0iobaEJSBjU7MYZWqKyVmYJWSCAj3vMBzrboBk341McT_mG-zaEAXQ>
    <xme:0iobaEJuZpp-81cVUxCJJumRVsK2FKfxDbtiytSHKEbQZ5klg94TudcpRXAwTmyUR
    2J0Cvo7QYGeIRn9Tg8>
X-ME-Received: <xmr:0iobaEuW5JwxqeFlGrAfXhqfhgJQD8H-4UZCcxHQqrUQpOwniebufYHCCLkHcHF2jtzHeGfIBKfjFJxZvQV323Al>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeihedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdr
    rghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrg
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruh
    hrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:0iobaBbMYgi2NPrl94m7shWaR4_5vQqO3DpkFJPq2SSpedqCu1dgGQ>
    <xmx:0iobaLZt-Mn-EOL7G93Lj8lOuJ3F-G6xDqrfc7k9_xAE_7md8YLQOw>
    <xmx:0iobaNDWBqqdzucklhskqVVtSBI0AIiYL_Nl0ahWvdHwg7wqJUcR4w>
    <xmx:0iobaBboRWTF13DGK--ovoPo3JA0GRwcxsqVsl-NbJYDDiS4vx7sTQ>
    <xmx:0iobaEqQglwF0KAHpJNtuEjPWST1uiqa-5vnsRNrQW04rHL5lbIHPWpm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 05:41:37 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 6/6] media: rcar-vin: Enable media-graph on Gen2
Date: Wed,  7 May 2025 11:40:14 +0200
Message-ID: <20250507094014.622087-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
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
index f05a30bac608..57bbf9893c72 100644
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
 
 #include <linux/idr.h>
@@ -43,9 +42,6 @@
 
 #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
 
-static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
-					  struct v4l2_subdev *subdev);
-
 /* -----------------------------------------------------------------------------
  * Gen3 Group Allocator
  */
@@ -235,10 +231,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	if (vin->group->link_setup)
-		return vin->group->link_setup(vin->group);
-
-	return  0;
+	return vin->group->link_setup(vin->group);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -286,17 +279,15 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
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
@@ -361,14 +352,6 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
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
@@ -514,7 +497,7 @@ static void rvin_free_controls(struct rvin_dev *vin)
 	vin->vdev.ctrl_handler = NULL;
 }
 
-static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
+static int rvin_create_controls(struct rvin_dev *vin)
 {
 	int ret;
 
@@ -532,115 +515,11 @@ static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev
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
@@ -912,39 +791,17 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
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
@@ -1000,41 +857,19 @@ static int rvin_isp_setup_links(struct rvin_group *group)
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
@@ -1067,7 +902,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
 	 * as we don't know if and in which order the master VINs will
 	 * be resumed.
 	 */
-	if (vin->info->use_mc) {
+	if (vin->info->model == RCAR_GEN3) {
 		unsigned int master_id = rvin_group_id_to_master(vin->id);
 		struct rvin_dev *master = vin->group->vin[master_id];
 		int ret;
@@ -1089,7 +924,6 @@ static int __maybe_unused rvin_resume(struct device *dev)
 
 static const struct rvin_info rcar_info_h1 = {
 	.model = RCAR_H1,
-	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
 	.scaler = rvin_scaler_gen2,
@@ -1097,7 +931,6 @@ static const struct rvin_info rcar_info_h1 = {
 
 static const struct rvin_info rcar_info_m1 = {
 	.model = RCAR_M1,
-	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
 	.scaler = rvin_scaler_gen2,
@@ -1105,7 +938,6 @@ static const struct rvin_info rcar_info_m1 = {
 
 static const struct rvin_info rcar_info_gen2 = {
 	.model = RCAR_GEN2,
-	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
 	.scaler = rvin_scaler_gen2,
@@ -1120,7 +952,6 @@ static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
 
 static const struct rvin_info rcar_info_r8a774e1 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a774e1_routes,
@@ -1136,7 +967,6 @@ static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
 
 static const struct rvin_info rcar_info_r8a7795 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1154,7 +984,6 @@ static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
 
 static const struct rvin_info rcar_info_r8a7796 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1172,7 +1001,6 @@ static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77965 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1187,7 +1015,6 @@ static const struct rvin_group_route rcar_info_r8a77970_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77970 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77970_routes,
@@ -1201,7 +1028,6 @@ static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77980 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1215,7 +1041,6 @@ static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77990 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1229,7 +1054,6 @@ static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
 
 static const struct rvin_info rcar_info_r8a77995 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
@@ -1239,7 +1063,6 @@ static const struct rvin_info rcar_info_r8a77995 = {
 
 static const struct rvin_info rcar_info_gen4 = {
 	.model = RCAR_GEN3,
-	.use_mc = true,
 	.use_isp = true,
 	.nv12 = true,
 	.raw10 = true,
@@ -1402,24 +1225,39 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	if (rvin_id_get(vin))
 		return -EINVAL;
 
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
 		rvin_id_put(vin);
 		return ret;
@@ -1439,10 +1277,14 @@ static void rcar_vin_remove(struct platform_device *pdev)
 
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
 
 	rvin_id_put(vin);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index f7b80e61a987..aa2d80065988 100644
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
@@ -699,9 +696,6 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_FIELD_INTERLACED:
 		/* Default to TB */
 		vnmc = VNMC_IM_FULL;
-		/* Use BT if video standard can be read and is 60 Hz format */
-		if (!vin->info->use_mc && vin->std & V4L2_STD_525_60)
-			vnmc = VNMC_IM_FULL | VNMC_FOC;
 		break;
 	case V4L2_FIELD_INTERLACED_TB:
 		vnmc = VNMC_IM_FULL;
@@ -1317,14 +1311,6 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
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
index ade007a9811f..6562fb675e93 100644
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
@@ -230,101 +229,6 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
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
@@ -333,42 +237,6 @@ static int rvin_querycap(struct file *file, void *priv,
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
@@ -465,6 +333,7 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 
 static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
 {
+	struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
@@ -472,18 +341,11 @@ static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
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
@@ -623,113 +485,6 @@ static int rvin_s_selection(struct file *file, void *fh,
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
@@ -740,167 +495,6 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
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
@@ -979,19 +573,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
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
@@ -1011,11 +592,7 @@ static int rvin_open(struct file *file)
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
 
@@ -1027,10 +604,7 @@ static int rvin_open(struct file *file)
 
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
@@ -1044,23 +618,14 @@ static int rvin_open(struct file *file)
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
 
@@ -1091,18 +656,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
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
@@ -1113,12 +666,6 @@ static void rvin_notify(struct v4l2_subdev *sd,
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
@@ -1134,7 +681,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
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
 
@@ -1162,13 +715,8 @@ int rvin_v4l2_register(struct rvin_dev *vin)
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
index 26b43959b685..6c87c36dbc98 100644
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
@@ -78,8 +77,6 @@ struct rvin_video_format {
  * @mbus_type:	media bus type
  * @bus:	media bus parallel configuration
  * @source_pad:	source pad of remote subdevice
- * @sink_pad:	sink pad of remote subdevice
- *
  */
 struct rvin_parallel_entity {
 	struct v4l2_async_connection *asc;
@@ -89,7 +86,6 @@ struct rvin_parallel_entity {
 	struct v4l2_mbus_config_parallel bus;
 
 	unsigned int source_pad;
-	unsigned int sink_pad;
 };
 
 /**
@@ -116,7 +112,6 @@ struct rvin_group_route {
 /**
  * struct rvin_info - Information about the particular VIN implementation
  * @model:		VIN model
- * @use_mc:		use media controller instead of controlling subdevice
  * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
  * @nv12:		support outputting NV12 pixel format
  * @raw10:		support outputting RAW10 pixel format
@@ -128,7 +123,6 @@ struct rvin_group_route {
  */
 struct rvin_info {
 	enum model_id model;
-	bool use_mc;
 	bool use_isp;
 	bool nv12;
 	bool raw10;
@@ -175,7 +169,6 @@ struct rvin_info {
  * @crop:		active cropping
  * @compose:		active composing
  * @scaler:		Optional scaler
- * @std:		active video standard of the video source
  *
  * @alpha:		Alpha component to fill in for supported pixel formats
  */
@@ -217,7 +210,6 @@ struct rvin_dev {
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
 	void (*scaler)(struct rvin_dev *vin);
-	v4l2_std_id std;
 
 	unsigned int alpha;
 };
-- 
2.49.0


