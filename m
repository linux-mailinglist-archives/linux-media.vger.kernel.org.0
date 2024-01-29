Return-Path: <linux-media+bounces-4377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 784DE84142D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 21:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E520EB25088
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 20:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00992157056;
	Mon, 29 Jan 2024 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XAqyOuRQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D030152E18
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559823; cv=none; b=N4KRYo+H3YPDWlXBzlXISqEeX6ig111eG/sDGIy+dBh1zNN+qZ1D1C/OmKuEID6gOfDFLs/cYRImmoXobQ2QUZCDqVAmZam32a7mbE/1ykP4N+1LB+a5FOGawMhy0J76TtEjRffD9ddTFZLG1V0dfsGMUCzEmsK45PV2yueq7os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559823; c=relaxed/simple;
	bh=w1rgm+8bn6ewhLDtOfMuk/lZnIHSpWMrmAeDlZO48Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVP3sPlK7GffAeqOip0HbLzZ7Ssch3MPpWcAsl6ZbpD7VnC3vBXUQkDzZr6R4Od4mpS7c9uGgb0HhFzkinWbbde43smCciLNrb1eNZoRcizTzkyAwBALmDNiF03fZbTFhOwb/T1HWPJIyqaOsl8fHI0T1yfxtXMbPU8DtVRCAYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XAqyOuRQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so371555466b.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559818; x=1707164618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQQ1hVp7NyJkoWfXBt9DQSLCSFrTcU53ZHxhAmbxAlA=;
        b=XAqyOuRQuqAexsZAzCk/QkIGZCjvXDmJC24VA5ne+sHS7eBPlVnlocd9phy9fEjeK8
         K3p+Bg5qvrFTKDv6lnifbv0i1aQndBhaGDU1goVH3AMOmxw8b59HA+F//SHjwIsaauu3
         A4BVCbTUcF1LMI/uklJXdwMwU9tDuun+zcT2FsYs1CUnZrF07reUq0TftNqCm5qFTT8+
         500Ag4pwfwtncBjkXAfjPgpCtYNhc3OCmYZtwOuCwiBy/9dOVbg0NmhEOnWxLpJY6wpY
         eO/SIrjfBvAPZLf0evcmXdERkokRnkPJ8E0JU/7vcPhOQobgvDnX6OIU0YKW+n7YK31C
         gw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559818; x=1707164618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQQ1hVp7NyJkoWfXBt9DQSLCSFrTcU53ZHxhAmbxAlA=;
        b=RlB0DUwg8oUdtMXMr0ztOBXLTTfmjsBmuh4HohBY/vdNED1aWnLHCWMRC+HCoF5igD
         RVr1e1Kj12DwMtPXwqiQPskpPRgMCUiNFHIGrenh5cMEiXuO0ZsW3JC2sHSxhvyJDz3Q
         mIN96u+6Q4I4H5aizqOimPl/s9ANmmMeIx9Wemzgli6O1uqnrvtwuRMQgq11beWrmb/b
         wvrGE6iwSv4HfIIQJCpcXh26b2mwl2dzfNRuR3qDQ/P8fYQszdsDaYGfb/O7MzI2li9F
         mGBKNQW+B4odvRk6zcggMT9FcIu/4A59QxcZujyryUEl0B+UTWfb2P8DPval+nx92IVZ
         sQsg==
X-Gm-Message-State: AOJu0Yw6rFJSmkeyx3FqpterHhHo7cnrOu+qAVw4OH+kbKGaIcEJqekE
	DTyfHSSyYUg5/5ltusZKkJ+f7yDQNznx77wnhUTWWFUVK88vQp5NnsXK1cmGzJ0=
X-Google-Smtp-Source: AGHT+IEVd7Au8unaq3yu/SGSI//ceLctgsaZ/eroaloMAa94CL7WmmRXegeAtc2G2HFq1jhNOi7itQ==
X-Received: by 2002:a17:906:13da:b0:a29:11dc:8181 with SMTP id g26-20020a17090613da00b00a2911dc8181mr4382856ejc.50.1706559818607;
        Mon, 29 Jan 2024 12:23:38 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:38 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/6] media: rcar-vin: Remove the shared group notifier
Date: Mon, 29 Jan 2024 21:22:53 +0100
Message-ID: <20240129202254.1126012-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the addition of Gen3 support to rcar-vin the driver have worked
around the limitation in v4l-async that a subdevice could only be bound
to one notifier. This was needed as each VIN instance can be connected
to the same CSI-2 receiver and each capture a different virtual channel.

The workaround was implemented as a single notifier that was registered
by the last VIN driver instance to attach to the device, and
unregistered by the last VIN driver instance to go away. This lead to a
lot of complexities as the driver had to synchronize between them at
different points in the life-cycle (probe, v4l-async complete, remove,
etc).

To complicate things even more some VIN instances had access to its own
private parallel interface that also needed to be a part of the media
graph. This lead to some VIN driver instances having to deal with one
private notifier for the parallel interface and interacting with the
shared group notifier.

The limitation in v4l-async have now been addressed by [1]. This
simplify things quiet a bit for drivers and this patch removes the
concept of a shared group notifier and implements a single notifier for
each VIN instance. This single notifier covers both the parallel
interface for the VIN instances that have it and all shared subdevices
that are readable for each VIN. This also simplify the media link
creation.

The group context is however retained for two reasons.

- All VIN driver instances needs to be part of the same media graph. So
  the media device is still created by the first VIN driver to be probed
  and are deleted by the last VIN instance to be removed.

- On Gen3 the hardware design requires the link notification
  implementation to access control registers only present in some VIN
  instances. These registers controls which VIN instances are connected
  to which CSI-2 receiver. This is controlled by the links in the media
  graph.

There is no intentional functional change. This patch only removes a
workaround for a functionality that now exists in v4l-async.

1. commit 28a1295795d8 ("media: v4l: async: Allow multiple connections
   between entities")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 457 ++++++------------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  44 +-
 .../platform/renesas/rcar-vin/rcar-vin.h      |  25 +-
 3 files changed, 162 insertions(+), 364 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index ffc79c26a303..244ab1b3a8c0 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -43,16 +43,7 @@
 #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
 
 /* -----------------------------------------------------------------------------
- * Gen3 Group Allocator
- */
-
-/* FIXME:  This should if we find a system that supports more
- * than one group for the whole system be replaced with a linked
- * list of groups. And eventually all of this should be replaced
- * with a global device allocator API.
- *
- * But for now this works as on all supported systems there will
- * be only one group for all instances.
+ * Group Allocator
  */
 
 static DEFINE_MUTEX(rvin_group_lock);
@@ -62,18 +53,9 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 {
 	struct media_device *mdev = &group->mdev;
 	const struct of_device_id *match;
-	struct device_node *np;
 
 	mutex_init(&group->lock);
 
-	/* Count number of VINs in the system */
-	group->count = 0;
-	for_each_matching_node(np, vin->dev->driver->of_match_table)
-		if (of_device_is_available(np))
-			group->count++;
-
-	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
-
 	mdev->dev = vin->dev;
 	mdev->ops = vin->info->media_ops;
 
@@ -194,8 +176,7 @@ static void rvin_group_put(struct rvin_dev *vin)
 	kref_put(&group->refcount, rvin_group_release);
 }
 
-/* group lock should be held when calling this function. */
-static int rvin_group_entity_to_remote_id(struct rvin_group *group,
+static int rvin_group_entity_to_remote_id(struct rvin_dev *vin,
 					  struct media_entity *entity)
 {
 	struct v4l2_subdev *sd;
@@ -204,89 +185,12 @@ static int rvin_group_entity_to_remote_id(struct rvin_group *group,
 	sd = media_entity_to_v4l2_subdev(entity);
 
 	for (i = 0; i < RVIN_REMOTES_MAX; i++)
-		if (group->remotes[i].subdev == sd)
+		if (vin->remotes[i].subdev == sd)
 			return i;
 
 	return -ENODEV;
 }
 
-static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
-	int ret;
-
-	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
-	if (ret) {
-		vin_err(vin, "Failed to register subdev nodes\n");
-		return ret;
-	}
-
-	/* Register all video nodes for the group. */
-	for (i = 0; i < RCAR_VIN_NUM; i++) {
-		if (vin->group->vin[i] &&
-		    !video_is_registered(&vin->group->vin[i]->vdev)) {
-			ret = rvin_v4l2_register(vin->group->vin[i]);
-			if (ret)
-				return ret;
-		}
-	}
-
-	return vin->info->link_setup(vin);
-}
-
-static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
-				     struct v4l2_subdev *subdev,
-				     struct v4l2_async_connection *asc)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
-
-	for (i = 0; i < RCAR_VIN_NUM; i++)
-		if (vin->group->vin[i])
-			rvin_v4l2_unregister(vin->group->vin[i]);
-
-	mutex_lock(&vin->group->lock);
-
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
-		if (vin->group->remotes[i].asc != asc)
-			continue;
-		vin->group->remotes[i].subdev = NULL;
-		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
-		break;
-	}
-
-	mutex_unlock(&vin->group->lock);
-}
-
-static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
-				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_connection *asc)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
-
-	mutex_lock(&vin->group->lock);
-
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
-		if (vin->group->remotes[i].asc != asc)
-			continue;
-		vin->group->remotes[i].subdev = subdev;
-		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
-		break;
-	}
-
-	mutex_unlock(&vin->group->lock);
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
-	.bound = rvin_group_notify_bound,
-	.unbind = rvin_group_notify_unbind,
-	.complete = rvin_group_notify_complete,
-};
-
 static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 			       unsigned int id)
 {
@@ -310,16 +214,16 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 		goto out;
 	}
 
-	asc = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
+	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
 				       struct v4l2_async_connection);
 	if (IS_ERR(asc)) {
 		ret = PTR_ERR(asc);
 		goto out;
 	}
 
-	vin->group->remotes[vep.base.id].asc = asc;
+	vin->remotes[vep.base.id].asc = asc;
 
-	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
+	vin_dbg(vin, "Add device %pOF to slot %u\n",
 		to_of_node(fwnode), vep.base.id);
 out:
 	fwnode_handle_put(fwnode);
@@ -327,70 +231,24 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
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
 static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 				    unsigned int max_id)
 {
-	unsigned int count = 0, vin_mask = 0;
-	unsigned int i, id;
+	unsigned int id;
 	int ret;
 
-	mutex_lock(&vin->group->lock);
-
-	/* If not all VIN's are registered don't register the notifier. */
-	for (i = 0; i < RCAR_VIN_NUM; i++) {
-		if (vin->group->vin[i]) {
-			count++;
-			vin_mask |= BIT(i);
-		}
-	}
-
-	if (vin->group->count != count) {
-		mutex_unlock(&vin->group->lock);
-		return 0;
+	for (id = 0; id < max_id; id++) {
+		ret = rvin_group_parse_of(vin, port, id);
+		if (ret)
+			return ret;
 	}
 
-	mutex_unlock(&vin->group->lock);
-
-	v4l2_async_nf_init(&vin->group->notifier, &vin->v4l2_dev);
-
-	/*
-	 * Some subdevices may overlap but the parser function can handle it and
-	 * each subdevice will only be registered once with the group notifier.
-	 */
-	for (i = 0; i < RCAR_VIN_NUM; i++) {
-		if (!(vin_mask & BIT(i)))
-			continue;
-
-		for (id = 0; id < max_id; id++) {
-			if (vin->group->remotes[id].asc)
-				continue;
-
-			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
-			if (ret)
-				return ret;
-		}
-	}
-
-	if (list_empty(&vin->group->notifier.waiting_list))
-		return 0;
-
-	vin->group->notifier.ops = &rvin_group_notify_ops;
-	ret = v4l2_async_nf_register(&vin->group->notifier);
-	if (ret < 0) {
-		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_nf_cleanup(&vin->group->notifier);
-		return ret;
-	}
+	/* Make sure at least one remote was described. */
+	for (id = 0; id < max_id; id++)
+		if (vin->remotes[id].asc)
+			return 0;
 
-	return 0;
+	return -ENODEV;
 }
 
 /* -----------------------------------------------------------------------------
@@ -472,10 +330,6 @@ static int rvin_find_pad(struct v4l2_subdev *sd, int direction)
 	return -EINVAL;
 }
 
-/* -----------------------------------------------------------------------------
- * Parallel async notifier
- */
-
 /* The vin lock should be held when calling the subdevice attach and detach */
 static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 					  struct v4l2_subdev *subdev)
@@ -494,10 +348,8 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 	ret = rvin_find_pad(subdev, MEDIA_PAD_FL_SINK);
 	vin->parallel.sink_pad = ret < 0 ? 0 : ret;
 
-	if (vin->info->use_mc) {
-		vin->parallel.subdev = subdev;
+	if (vin->info->use_mc)
 		return 0;
-	}
 
 	/* Find compatible subdevices mbus format */
 	vin->mbus_code = 0;
@@ -543,16 +395,48 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 	if (ret < 0)
 		return ret;
 
-	vin->parallel.subdev = subdev;
-
 	return 0;
 }
 
-static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
+static int rvin_notify_bound(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *subdev,
+			     struct v4l2_async_connection *asc)
+{
+	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
+	unsigned int i;
+	int ret = 0;
+
+	mutex_lock(&vin->lock);
+
+	/* Parallel */
+	if (vin->parallel.asc == asc) {
+		ret = rvin_parallel_subdevice_attach(vin, subdev);
+		if (ret)
+			goto out;
+
+		vin->parallel.subdev = subdev;
+
+		v4l2_set_subdev_hostdata(subdev, vin);
+		vin_dbg(vin, "Bound parallel subdev %su\n", subdev->name);
+	}
+
+	/* CSI or ISP */
+	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
+		if (vin->remotes[i].asc != asc)
+			continue;
+		vin->remotes[i].subdev = subdev;
+		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
+		break;
+	}
+out:
+	mutex_unlock(&vin->lock);
+
+	return ret;
+}
+
+static int rvin_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	struct media_entity *source;
-	struct media_entity *sink;
 	int ret;
 
 	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
@@ -570,64 +454,58 @@ static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
 	if (!vin->info->use_mc)
 		return 0;
 
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
+	return vin->info->link_setup(vin);
 }
 
-static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
-					struct v4l2_subdev *subdev,
-					struct v4l2_async_connection *asc)
+static void rvin_notify_unbind(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *subdev,
+			       struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-
-	vin_dbg(vin, "unbind parallel subdev %s\n", subdev->name);
+	unsigned int i;
 
 	mutex_lock(&vin->lock);
+
 	rvin_v4l2_unregister(vin);
-	vin->parallel.subdev = NULL;
 
-	if (!vin->info->use_mc)
-		rvin_free_controls(vin);
-	mutex_unlock(&vin->lock);
-}
+	/* Parallel */
+	if (vin->parallel.asc == asc) {
+		vin->parallel.subdev = NULL;
+		if (!vin->info->use_mc)
+			rvin_free_controls(vin);
+		vin_dbg(vin, "Unbind parallel subdev %s\n", subdev->name);
+	}
 
-static int rvin_parallel_notify_bound(struct v4l2_async_notifier *notifier,
-				      struct v4l2_subdev *subdev,
-				      struct v4l2_async_connection *asc)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	int ret;
+	/* CSI or ISP */
+	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
+		if (vin->remotes[i].asc != asc)
+			continue;
+		vin->remotes[i].subdev = NULL;
+		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
+		break;
+	}
 
-	mutex_lock(&vin->lock);
-	ret = rvin_parallel_subdevice_attach(vin, subdev);
 	mutex_unlock(&vin->lock);
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
 }
 
-static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
-	.bound = rvin_parallel_notify_bound,
-	.unbind = rvin_parallel_notify_unbind,
-	.complete = rvin_parallel_notify_complete,
+static const struct v4l2_async_notifier_operations rvin_notify_ops = {
+	.bound = rvin_notify_bound,
+	.complete = rvin_notify_complete,
+	.unbind = rvin_notify_unbind,
 };
 
+/* -----------------------------------------------------------------------------
+ * Parallel interface, found on Gen2 and some Gen3
+ */
+
+static int rvin_parallel_setup_link(struct rvin_dev *vin)
+{
+	struct media_entity *source = &vin->parallel.subdev->entity;
+	struct media_entity *sink = &vin->vdev.entity;
+
+	return media_create_pad_link(source, vin->parallel.source_pad, sink, 0, 0);
+}
+
 static int rvin_parallel_parse_of(struct rvin_dev *vin)
 {
 	struct fwnode_handle *ep, *fwnode;
@@ -681,18 +559,10 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 	return ret;
 }
 
-static void rvin_parallel_cleanup(struct rvin_dev *vin)
-{
-	v4l2_async_nf_unregister(&vin->notifier);
-	v4l2_async_nf_cleanup(&vin->notifier);
-}
-
 static int rvin_parallel_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	v4l2_async_nf_init(&vin->notifier, &vin->v4l2_dev);
-
 	ret = rvin_parallel_parse_of(vin);
 	if (ret)
 		return ret;
@@ -703,14 +573,6 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 	vin_dbg(vin, "Found parallel subdevice %pOF\n",
 		to_of_node(vin->parallel.asc->match.fwnode));
 
-	vin->notifier.ops = &rvin_parallel_notify_ops;
-	ret = v4l2_async_nf_register(&vin->notifier);
-	if (ret < 0) {
-		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_nf_cleanup(&vin->notifier);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -776,7 +638,7 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 
 	mutex_lock(&group->lock);
 
-	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
+	csi_id = rvin_group_entity_to_remote_id(vin, link->source->entity);
 	if (csi_id == -ENODEV) {
 		struct v4l2_subdev *sd;
 
@@ -860,11 +722,11 @@ static const struct media_device_ops rvin_csi2_media_ops = {
 	.link_notify = rvin_csi2_link_notify,
 };
 
-static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
+static int rvin_csi2_create_link(struct rvin_dev *vin,
 				 const struct rvin_group_route *route)
 {
-	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
-	struct media_entity *sink = &group->vin[id]->vdev.entity;
+	struct media_entity *source = &vin->remotes[route->csi].subdev->entity;
+	struct media_entity *sink = &vin->vdev.entity;
 	struct media_pad *sink_pad = &sink->pads[0];
 	unsigned int channel;
 	int ret;
@@ -888,29 +750,29 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 static int rvin_csi2_setup_links(struct rvin_dev *vin)
 {
 	const struct rvin_group_route *route;
-	unsigned int id;
 	int ret = -EINVAL;
 
-	/* Create all media device links between VINs and CSI-2's. */
+	if (vin->parallel.subdev) {
+		ret = rvin_parallel_setup_link(vin);
+		if (ret)
+			return ret;
+	}
+
+	/* Create all media device links between VIN and CSI-2's. */
 	mutex_lock(&vin->group->lock);
 	for (route = vin->info->routes; route->chsel; route++) {
-		/* Check that VIN' master is part of the group. */
+		/* Check that VIN's master is present. */
 		if (!vin->group->vin[route->master])
 			continue;
 
-		/* Check that CSI-2 is part of the group. */
-		if (!vin->group->remotes[route->csi].subdev)
+		/* Check if remote is present. */
+		if (!vin->remotes[route->csi].subdev)
 			continue;
 
-		for (id = route->master; id < route->master + 4; id++) {
-			/* Check that VIN is part of the group. */
-			if (!vin->group->vin[id])
-				continue;
-
-			ret = rvin_csi2_create_link(vin->group, id, route);
-			if (ret)
-				goto out;
-		}
+		/* Create links between VIN and CSI-2 source pads. */
+		ret = rvin_csi2_create_link(vin, route);
+		if (ret)
+			goto out;
 	}
 out:
 	mutex_unlock(&vin->group->lock);
@@ -918,17 +780,10 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
 	return ret;
 }
 
-static void rvin_csi2_cleanup(struct rvin_dev *vin)
-{
-	rvin_parallel_cleanup(vin);
-	rvin_group_notifier_cleanup(vin);
-	rvin_group_put(vin);
-	rvin_free_controls(vin);
-}
-
 static int rvin_csi2_init(struct rvin_dev *vin)
 {
 	int ret;
+	bool have_parallel, have_remote;
 
 	vin->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
@@ -943,18 +798,24 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret)
 		goto err_controls;
 
-	/* It's OK to not have a parallel subdevice. */
 	ret = rvin_parallel_init(vin);
 	if (ret && ret != -ENODEV)
 		goto err_group;
+	have_parallel = ret != -ENODEV;
+
 
 	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
-	if (ret)
-		goto err_parallel;
+	if (ret && ret != -ENODEV)
+		goto err_group;
+	have_remote = ret != -ENODEV;
+
+	/* One parallel or CSI-2 subdevice needed. */
+	if (!have_parallel && !have_remote) {
+		ret = -ENODEV;
+		goto err_group;
+	}
 
 	return 0;
-err_parallel:
-	rvin_parallel_cleanup(vin);
 err_group:
 	rvin_group_put(vin);
 err_controls:
@@ -969,53 +830,16 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 
 static int rvin_isp_setup_links(struct rvin_dev *vin)
 {
-	unsigned int i;
-	int ret = -EINVAL;
+	struct media_entity *source, *sink;
+	unsigned int source_slot = vin->id / 8;
+	unsigned int source_idx = vin->id % 8 + 1;
 
-	/* Create all media device links between VINs and ISP's. */
-	mutex_lock(&vin->group->lock);
-	for (i = 0; i < RCAR_VIN_NUM; i++) {
-		struct media_pad *source_pad, *sink_pad;
-		struct media_entity *source, *sink;
-		unsigned int source_slot = i / 8;
-		unsigned int source_idx = i % 8 + 1;
+	source = &vin->remotes[source_slot].subdev->entity;
+	sink = &vin->vdev.entity;
 
-		if (!vin->group->vin[i])
-			continue;
-
-		/* Check that ISP is part of the group. */
-		if (!vin->group->remotes[source_slot].subdev)
-			continue;
-
-		source = &vin->group->remotes[source_slot].subdev->entity;
-		source_pad = &source->pads[source_idx];
-
-		sink = &vin->group->vin[i]->vdev.entity;
-		sink_pad = &sink->pads[0];
-
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
-
-		ret = media_create_pad_link(source, source_idx, sink, 0,
-					    MEDIA_LNK_FL_ENABLED |
-					    MEDIA_LNK_FL_IMMUTABLE);
-		if (ret) {
-			vin_err(vin, "Error adding link from %s to %s\n",
-				source->name, sink->name);
-			break;
-		}
-	}
-	mutex_unlock(&vin->group->lock);
-
-	return ret;
-}
-
-static void rvin_isp_cleanup(struct rvin_dev *vin)
-{
-	rvin_group_notifier_cleanup(vin);
-	rvin_group_put(vin);
-	rvin_free_controls(vin);
+	return media_create_pad_link(source, source_idx, sink, 0,
+				     MEDIA_LNK_FL_ENABLED |
+				     MEDIA_LNK_FL_IMMUTABLE);
 }
 
 static int rvin_isp_init(struct rvin_dev *vin)
@@ -1386,6 +1210,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
+	v4l2_async_nf_init(&vin->notifier, &vin->v4l2_dev);
+	vin->notifier.ops = &rvin_notify_ops;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1406,6 +1233,13 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = v4l2_async_nf_register(&vin->notifier);
+	if (ret < 0) {
+		vin_err(vin, "Notifier registration failed\n");
+		v4l2_async_nf_cleanup(&vin->notifier);
+		return ret;
+	}
+
 	pm_suspend_ignore_children(&pdev->dev, true);
 	pm_runtime_enable(&pdev->dev);
 
@@ -1420,12 +1254,13 @@ static void rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	if (vin->info->use_isp)
-		rvin_isp_cleanup(vin);
-	else if (vin->info->use_mc)
-		rvin_csi2_cleanup(vin);
-	else
-		rvin_parallel_cleanup(vin);
+	v4l2_async_nf_unregister(&vin->notifier);
+	v4l2_async_nf_cleanup(&vin->notifier);
+
+	if (vin->info->use_isp || vin->info->use_mc) {
+		rvin_group_put(vin);
+		rvin_free_controls(vin);
+	}
 
 	rvin_dma_unregister(vin);
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 073f70c6ac68..9e166ee2d9a1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -1052,50 +1052,18 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
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
-	struct v4l2_subdev *remote;
-	struct rvin_group *group;
-	struct media_pad *pad;
 	struct rvin_dev *vin =
 		container_of(sd->v4l2_dev, struct rvin_dev, v4l2_dev);
-	unsigned int i;
 
-	/* If no media controller, no need to route the event. */
-	if (!vin->info->use_mc) {
-		rvin_notify_video_device(vin, notification, arg);
-		return;
-	}
-
-	group = vin->group;
-
-	for (i = 0; i < RCAR_VIN_NUM; i++) {
-		vin = group->vin[i];
-		if (!vin)
-			continue;
-
-		pad = media_pad_remote_pad_first(&vin->pad);
-		if (!pad)
-			continue;
-
-		remote = media_entity_to_v4l2_subdev(pad->entity);
-		if (remote != sd)
-			continue;
-
-		rvin_notify_video_device(vin, notification, arg);
+	switch (notification) {
+	case V4L2_DEVICE_NOTIFY_EVENT:
+		v4l2_event_queue(&vin->vdev, arg);
+		break;
+	default:
+		break;
 	}
 }
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 4bfe8ea031c5..7810a1cbbc23 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -183,10 +183,12 @@ struct rvin_info {
  * @vdev:		V4L2 video device associated with VIN
  * @v4l2_dev:		V4L2 device
  * @ctrl_handler:	V4L2 control handler
+ *
+ * @parallel:		Parallel input subdevice descriptor
+ * @remotes:		Array of pairs of async connection and subdev pointers
+ *			to remote subdevices on CSI-2 or CS-ISP.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
- * @parallel:		parallel input subdevice descriptor
- *
  * @group:		Gen3 CSI group
  * @id:			Gen3 group id for this VIN
  * @pad:		media pad for the video device entity
@@ -222,9 +224,13 @@ struct rvin_dev {
 	struct video_device vdev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_async_notifier notifier;
 
 	struct rvin_parallel_entity parallel;
+	struct {
+		struct v4l2_async_connection *asc;
+		struct v4l2_subdev *subdev;
+	} remotes[RVIN_REMOTES_MAX];
+	struct v4l2_async_notifier notifier;
 
 	struct rvin_group *group;
 	unsigned int id;
@@ -272,12 +278,8 @@ struct rvin_dev {
  *
  * @mdev:		media device which represents the group
  *
- * @lock:		protects the count, notifier, vin and csi members
- * @count:		number of enabled VIN instances found in DT
- * @notifier:		group notifier for CSI-2 async connections
+ * @lock:		Protects the vin member
  * @vin:		VIN instances which are part of the group
- * @remotes:		array of pairs of async connection and subdev pointers
- *			to all remote subdevices.
  */
 struct rvin_group {
 	struct kref refcount;
@@ -285,14 +287,7 @@ struct rvin_group {
 	struct media_device mdev;
 
 	struct mutex lock;
-	unsigned int count;
-	struct v4l2_async_notifier notifier;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
-
-	struct {
-		struct v4l2_async_connection *asc;
-		struct v4l2_subdev *subdev;
-	} remotes[RVIN_REMOTES_MAX];
 };
 
 int rvin_dma_register(struct rvin_dev *vin, int irq);
-- 
2.43.0


