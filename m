Return-Path: <linux-media+bounces-26864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDAA42BC6
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F7118874C2
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63223266564;
	Mon, 24 Feb 2025 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="vYU/RCrc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PcrAoGf9"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F9266568;
	Mon, 24 Feb 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422438; cv=none; b=gV80irhaVs3Zr3MAl5re6m4VUBv/Gn5g5XFmunUtwApBO3bmnBNl8ztFffbcBdIMoGCPOURKhMXqhE7tzasuQ+yJw1VuwfcYSq9loSRJOfzTlGOP/8oJ+UztmQ966v7SFpWzLqpTF6Y8RJr1DtoqabwEIAG1NtKEz5yzlLU2M30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422438; c=relaxed/simple;
	bh=oAijH2MgGBl1lJ+uQOZLseh98+X+tnX0UtK8mtllpzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGAv9GAcvJUTU9Z8+gMVE3U8VoNAwv+CczZnWVBTRr9sZ8CbINfpTb2ehvuvSA5YjJkvKTSywkXO73QVWzqwA6TN6O0XNocd3clSQNzSrKYEOyUZ7mRbwmfetIJu9WKCnH/BBVmePLOpjWyhUVMNSRT/ZUFA3ho6hDFEL9CNh9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=vYU/RCrc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PcrAoGf9; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6AF991140213;
	Mon, 24 Feb 2025 13:40:34 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 24 Feb 2025 13:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740422434;
	 x=1740508834; bh=HL0a6tTCvvTxac1+lghVwTpqm5WNsV5ZK3oF946N9lc=; b=
	vYU/RCrc6wmxm+ZShvxQDhh1ctoooUr1SyltqkQbJS6tcFCkuj17yGlL4mDH4LLB
	k8GAvlO4eKI8JmsuofhGoGXTB9pZb40+V4XQiPqRxubA6hH1RNbEuqnA2L7BUtXS
	WSvBotn0ncnHowiMbSfMHWYpCqmYJwKmKnKD98QkQVQ03UENIDVTNTkOTJho3Elv
	UQ181h3oXg9Qfj5Cq7jt9McWtpky2IHVOYmc1D82JAGxM7AdAJTKTT2/Q2M28WQn
	gTcIioWEF6YVtT6zxvw/ZANGvierGDZFt1k77teMchgYvo+RNi1PijQwpA4o5fjw
	qqmmA+BqJWwoJ68m0UgtrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740422434; x=
	1740508834; bh=HL0a6tTCvvTxac1+lghVwTpqm5WNsV5ZK3oF946N9lc=; b=P
	crAoGf9Wu29zm1clBEb2ObjhTk8FpeL9iAZxDLDfBLvD7mI8U7q6QwBnq7GCeTmC
	+M+lsOc7fU88CVpXV9phxiIrgazk00S3NKmPX6J23AQAewd3h2MXpDly7Fz2Wl73
	rWPFXieyMXiTQrdFbKuPINIG4cCaffVWIdNGitn+6lM5MVO6+3+bPb6oWm2MWuiK
	Wk3TDbVCv92vNjmhOChZ9j3MnbWYeS/OAHFWhCEsW4Oq3c5LJW3dJvQ3w14EkY1W
	O8B8PvnZUR2TMAoibPNwkyK7Fszh8ILtFzZ2w6Ze7zIf3QJCJraBeDHPwVYLh3Cx
	bAsP7Y84QmJ6qu5MMkWQA==
X-ME-Sender: <xms:Ir28Z1FuCG_edrdUnlSag4v4DlQs4obdQNseq-iFhY6lb6bvigRLXw>
    <xme:Ir28Z6XaVRJZyVIB1j1slULlIkE5QK5IO2X50TpjjO9r58UTpxkvbWYbokFXtd9Tp
    mXCbOxDV-cZuoQRPV0>
X-ME-Received: <xmr:Ir28Z3Kueo5dmUg_znI9WglTCgK00dU1Fsg_GIN7Ga3pib8LWh8Hkh_9-Z6E9Mv_Igj4w6okm3B8UzgZk5njrv-74w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleehfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Ir28Z7Ee8tR3Nrp6e4a8wiAQEfsmugP_Q0j0AOZyGoh_ii5y_b3iDA>
    <xmx:Ir28Z7XbGTilnzDIK5RHJZOlIsbRrmrEajLEVKnIocPdKh9kzO8woA>
    <xmx:Ir28Z2PGKSAt4TELn7_TkyAQI7CZrWHuaYtbONWVXa5Mjx9LEMWK4g>
    <xmx:Ir28Z63752khwAf5PlfyrYJGTZ3nzYOweuLRMTIp0R_e_Jw4ZJIvHw>
    <xmx:Ir28Z9IJIkrgOq_i5-Z4RX3z2A1S93N0HcMDtQvuZNjEf8UfoQVWjDrO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 13:40:33 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/6] media: rcar-vin: Merge all notifiers
Date: Mon, 24 Feb 2025 19:39:37 +0100
Message-ID: <20250224183938.3800317-6-niklas.soderlund+renesas@ragnatech.se>
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

The VIN usage of v4l-async is complex and stems from organic growth of
the driver of supporting both private local subdevices (Gen2, Gen3) and
subdevices shared between all VIN instances (Gen3 and Gen4).

The driver used a separate notifier for each VIN for the private local
ones, and a shared group notifier for the shared ones. This was complex
and lead to subtle bugs when unbinding and later rebinding subdevices in
on of the notifiers having to handle different edge cases depending on
if it also had subdevices in the other notifiers etc.

To simplify this have the Gen2 devices allocate and form a VIN group
too. This way all subdevices on all models can be collect in a
single group notifier. Then there is only a single complete callback for
all where the video devices and subdevice nodes can be registered etc.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 263 ++++++++----------
 .../platform/renesas/rcar-vin/rcar-vin.h      |   2 -
 2 files changed, 114 insertions(+), 151 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 3821863d8d5c..3b9860e45573 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -42,6 +42,9 @@
 
 #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
 
+static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
+					  struct v4l2_subdev *subdev);
+
 /* -----------------------------------------------------------------------------
  * Gen3 Group Allocator
  */
@@ -264,7 +267,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin->group);
+	if (vin->group->link_setup)
+		return vin->group->link_setup(vin->group);
+
+	return  0;
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -272,22 +278,31 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 				     struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
+	struct rvin_group *group = vin->group;
 
-	for (i = 0; i < RCAR_VIN_NUM; i++)
-		if (vin->group->vin[i])
-			rvin_v4l2_unregister(vin->group->vin[i]);
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++)
+		if (group->vin[i])
+			rvin_v4l2_unregister(group->vin[i]);
 
 	mutex_lock(&vin->group->lock);
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
+			continue;
+
+		group->vin[i]->parallel.subdev = NULL;
+
+		vin_dbg(group->vin[i], "Unbind parallel subdev %s\n",
+			subdev->name);
+	}
 
-	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
-		if (vin->group->remotes[i].asc != asc)
+	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
+		if (group->remotes[i].asc != asc)
 			continue;
-		vin->group->remotes[i].subdev = NULL;
+
+		group->remotes[i].subdev = NULL;
+
 		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
-		break;
 	}
-
 	mutex_unlock(&vin->group->lock);
 
 	media_device_unregister(&vin->group->mdev);
@@ -298,21 +313,38 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
+	struct rvin_group *group = vin->group;
 
-	mutex_lock(&vin->group->lock);
+	guard(mutex)(&group->lock);
 
-	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		int ret;
+
+		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
+			continue;
+
+		ret = rvin_parallel_subdevice_attach(group->vin[i], subdev);
+		if (ret)
+			return ret;
+
+		v4l2_set_subdev_hostdata(subdev, group->vin[i]);
+
+		vin_dbg(group->vin[i], "Bound subdev %s\n", subdev->name);
+
+		return 0;
+	}
+
+	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
+
 		vin->group->remotes[i].subdev = subdev;
 		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
-		break;
+
+		return 0;
 	}
 
-	mutex_unlock(&vin->group->lock);
-
-	return 0;
+	return -ENODEV;
 }
 
 static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
@@ -406,7 +438,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 		goto out;
 	}
 
-	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
+	asc = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
 				       struct v4l2_async_connection);
 	if (IS_ERR(asc)) {
 		ret = PTR_ERR(asc);
@@ -456,6 +488,12 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		if (!(vin_mask & BIT(i)))
 			continue;
 
+		/* Parse local subdevice. */
+		ret = rvin_parallel_parse_of(vin->group->vin[i]);
+		if (ret)
+			return ret;
+
+		/* Prase shared subdevices. */
 		for (id = 0; id < max_id; id++) {
 			if (vin->group->remotes[id].asc)
 				continue;
@@ -635,124 +673,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 	return 0;
 }
 
-static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
-{
-	rvin_v4l2_unregister(vin);
-	vin->parallel.subdev = NULL;
-
-	if (!vin->info->use_mc)
-		rvin_free_controls(vin);
-}
-
-static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	struct media_entity *source;
-	struct media_entity *sink;
-	int ret;
-
-	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
-	if (ret < 0) {
-		vin_err(vin, "Failed to register subdev nodes\n");
-		return ret;
-	}
-
-	if (!video_is_registered(&vin->vdev)) {
-		ret = rvin_v4l2_register(vin);
-		if (ret < 0)
-			return ret;
-	}
-
-	if (!vin->info->use_mc)
-		return 0;
-
-	/* If we're running with media-controller, link the subdevs. */
-	source = &vin->parallel.subdev->entity;
-	sink = &vin->vdev.entity;
-
-	ret = media_create_pad_link(source, vin->parallel.source_pad,
-				    sink, vin->parallel.sink_pad, 0);
-	if (ret)
-		vin_err(vin, "Error adding link from %s to %s: %d\n",
-			source->name, sink->name, ret);
-
-	return ret;
-}
-
-static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
-					struct v4l2_subdev *subdev,
-					struct v4l2_async_connection *asc)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-
-	vin_dbg(vin, "unbind parallel subdev %s\n", subdev->name);
-
-	mutex_lock(&vin->lock);
-	rvin_parallel_subdevice_detach(vin);
-	mutex_unlock(&vin->lock);
-}
-
-static int rvin_parallel_notify_bound(struct v4l2_async_notifier *notifier,
-				      struct v4l2_subdev *subdev,
-				      struct v4l2_async_connection *asc)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	int ret;
-
-	mutex_lock(&vin->lock);
-	ret = rvin_parallel_subdevice_attach(vin, subdev);
-	mutex_unlock(&vin->lock);
-	if (ret)
-		return ret;
-
-	v4l2_set_subdev_hostdata(subdev, vin);
-
-	vin_dbg(vin, "bound subdev %s source pad: %u sink pad: %u\n",
-		subdev->name, vin->parallel.source_pad,
-		vin->parallel.sink_pad);
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
-	.bound = rvin_parallel_notify_bound,
-	.unbind = rvin_parallel_notify_unbind,
-	.complete = rvin_parallel_notify_complete,
-};
-
-static void rvin_parallel_cleanup(struct rvin_dev *vin)
-{
-	v4l2_async_nf_unregister(&vin->notifier);
-	v4l2_async_nf_cleanup(&vin->notifier);
-}
-
-static int rvin_parallel_init(struct rvin_dev *vin)
-{
-	int ret;
-
-	v4l2_async_nf_init(&vin->notifier, &vin->v4l2_dev);
-
-	ret = rvin_parallel_parse_of(vin);
-	if (ret)
-		return ret;
-
-	if (!vin->parallel.asc)
-		return -ENODEV;
-
-	vin_dbg(vin, "Found parallel subdevice %pOF\n",
-		to_of_node(vin->parallel.asc->match.fwnode));
-
-	vin->notifier.ops = &rvin_parallel_notify_ops;
-	ret = v4l2_async_nf_register(&vin->notifier);
-	if (ret < 0) {
-		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_nf_cleanup(&vin->notifier);
-		return ret;
-	}
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * CSI-2
  */
@@ -927,11 +847,63 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
+static int rvin_parallel_setup_links(struct rvin_group *group)
+{
+	u32 flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
+	int ret = 0;
+
+	mutex_lock(&group->lock);
+	/* If the group also have links don't enable the link. */
+	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
+		if (group->remotes[i].subdev) {
+			flags = 0;
+			break;
+		}
+	}
+
+	/* Create links */
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		struct rvin_dev *vin = group->vin[i];
+		struct media_entity *source;
+		struct media_entity *sink;
+
+		/* Noting to do if their is no VIN or parallel subdev. */
+		if (!vin || !vin->parallel.subdev)
+			continue;
+
+		source = &vin->parallel.subdev->entity;
+		sink = &vin->vdev.entity;
+
+		ret = media_create_pad_link(source, vin->parallel.source_pad,
+					    sink, 0, flags);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&group->lock);
+
+	return ret;
+}
+
 static int rvin_csi2_setup_links(struct rvin_group *group)
 {
 	const struct rvin_group_route *routes, *route;
 	unsigned int id;
-	int ret = -EINVAL;
+	int ret;
+
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
+	ret = rvin_parallel_setup_links(group);
+	if (ret)
+		return ret;
 
 	/* Find any VIN in group to get route info. */
 	routes = NULL;
@@ -946,6 +918,7 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
 
 	/* Create all media device links between VINs and CSI-2's. */
 	mutex_lock(&group->lock);
+	ret = -EINVAL;
 	for (route = routes; route->chsel; route++) {
 		/* Check that VIN' master is part of the group. */
 		if (!group->vin[route->master])
@@ -973,7 +946,6 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
 
 static void rvin_csi2_cleanup(struct rvin_dev *vin)
 {
-	rvin_parallel_cleanup(vin);
 	rvin_group_notifier_cleanup(vin);
 	rvin_group_put(vin);
 	rvin_free_controls(vin);
@@ -996,18 +968,11 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret)
 		goto err_controls;
 
-	/* It's OK to not have a parallel subdevice. */
-	ret = rvin_parallel_init(vin);
-	if (ret && ret != -ENODEV)
-		goto err_group;
-
 	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
 	if (ret)
-		goto err_parallel;
+		goto err_group;
 
 	return 0;
-err_parallel:
-	rvin_parallel_cleanup(vin);
 err_group:
 	rvin_group_put(vin);
 err_controls:
@@ -1431,7 +1396,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		    rvin_group_id_to_master(vin->id) == vin->id)
 			vin->scaler = vin->info->scaler;
 	} else {
-		ret = rvin_parallel_init(vin);
+		ret = rvin_group_get(vin, NULL, NULL);
+		if (!ret)
+			ret = rvin_group_notifier_init(vin, 0, 0);
 
 		if (vin->info->scaler)
 			vin->scaler = vin->info->scaler;
@@ -1460,8 +1427,6 @@ static void rcar_vin_remove(struct platform_device *pdev)
 		rvin_isp_cleanup(vin);
 	else if (vin->info->use_mc)
 		rvin_csi2_cleanup(vin);
-	else
-		rvin_parallel_cleanup(vin);
 
 	rvin_dma_unregister(vin);
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 1131d43e38e3..47253de5681c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -181,7 +181,6 @@ struct rvin_info {
  * @vdev:		V4L2 video device associated with VIN
  * @v4l2_dev:		V4L2 device
  * @ctrl_handler:	V4L2 control handler
- * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @parallel:		parallel input subdevice descriptor
  *
@@ -221,7 +220,6 @@ struct rvin_dev {
 	struct video_device vdev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_async_notifier notifier;
 
 	struct rvin_parallel_entity parallel;
 
-- 
2.48.1


