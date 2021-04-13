Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1401235E5EA
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347521AbhDMSEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:38 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:27720 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347514AbhDMSEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:30 -0400
X-Halon-ID: a3ab2610-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a3ab2610-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:07 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 08/11] rcar-vin: Create a callback to setup media links
Date:   Tue, 13 Apr 2021 20:02:50 +0200
Message-Id: <20210413180253.2575451-9-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New IP versions will have different media graphs and require a different
link setup. Breakout the specific link setup to a callback that are
associated with the group.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 97 ++++++++++++---------
 drivers/media/platform/rcar-vin/rcar-vin.h  |  3 +
 2 files changed, 57 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 2628637084ae2aa9..d03ecd443b01c2b3 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -247,7 +247,8 @@ static void rvin_group_cleanup(struct rvin_group *group)
 	mutex_destroy(&group->lock);
 }
 
-static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
+static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
+			   void (*link_setup)(struct rvin_dev *))
 {
 	struct media_device *mdev = &group->mdev;
 	const struct of_device_id *match;
@@ -263,6 +264,8 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 
 	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
 
+	group->link_setup = link_setup;
+
 	mdev->dev = vin->dev;
 	mdev->ops = &rvin_media_ops;
 
@@ -295,7 +298,8 @@ static void rvin_group_release(struct kref *kref)
 	mutex_unlock(&rvin_group_lock);
 }
 
-static int rvin_group_get(struct rvin_dev *vin)
+static int rvin_group_get(struct rvin_dev *vin,
+			  void (*link_setup)(struct rvin_dev *))
 {
 	struct rvin_group *group;
 	u32 id;
@@ -327,7 +331,7 @@ static int rvin_group_get(struct rvin_dev *vin)
 			goto err_group;
 		}
 
-		ret = rvin_group_init(group, vin);
+		ret = rvin_group_init(group, vin, link_setup);
 		if (ret) {
 			kfree(group);
 			vin_err(vin, "Failed to initialize group\n");
@@ -386,7 +390,6 @@ static void rvin_group_put(struct rvin_dev *vin)
 static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	const struct rvin_group_route *route;
 	unsigned int i;
 	int ret;
 
@@ -410,44 +413,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	/* Create all media device links between VINs and CSI-2's. */
-	mutex_lock(&vin->group->lock);
-	for (route = vin->info->routes; route->mask; route++) {
-		struct media_pad *source_pad, *sink_pad;
-		struct media_entity *source, *sink;
-		unsigned int source_idx;
-
-		/* Check that VIN is part of the group. */
-		if (!vin->group->vin[route->vin])
-			continue;
-
-		/* Check that VIN' master is part of the group. */
-		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
-			continue;
-
-		/* Check that CSI-2 is part of the group. */
-		if (!vin->group->remotes[route->csi].subdev)
-			continue;
-
-		source = &vin->group->remotes[route->csi].subdev->entity;
-		source_idx = rvin_group_csi_channel_to_pad(route->channel);
-		source_pad = &source->pads[source_idx];
-
-		sink = &vin->group->vin[route->vin]->vdev.entity;
-		sink_pad = &sink->pads[0];
-
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
-
-		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
-		if (ret) {
-			vin_err(vin, "Error adding link from %s to %s\n",
-				source->name, sink->name);
-			break;
-		}
-	}
-	mutex_unlock(&vin->group->lock);
+	vin->group->link_setup(vin);
 
 	return ret;
 }
@@ -953,6 +919,51 @@ static int rvin_parallel_init(struct rvin_dev *vin)
  * CSI-2
  */
 
+static void rvin_csi2_setup_links(struct rvin_dev *vin)
+{
+	const struct rvin_group_route *route;
+	int ret;
+
+	/* Create all media device links between VINs and CSI-2's. */
+	mutex_lock(&vin->group->lock);
+	for (route = vin->info->routes; route->mask; route++) {
+		struct media_pad *source_pad, *sink_pad;
+		struct media_entity *source, *sink;
+		unsigned int source_idx;
+
+		/* Check that VIN is part of the group. */
+		if (!vin->group->vin[route->vin])
+			continue;
+
+		/* Check that VIN' master is part of the group. */
+		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
+			continue;
+
+		/* Check that CSI-2 is part of the group. */
+		if (!vin->group->remotes[route->csi].subdev)
+			continue;
+
+		source = &vin->group->remotes[route->csi].subdev->entity;
+		source_idx = rvin_group_csi_channel_to_pad(route->channel);
+		source_pad = &source->pads[source_idx];
+
+		sink = &vin->group->vin[route->vin]->vdev.entity;
+		sink_pad = &sink->pads[0];
+
+		/* Skip if link already exists. */
+		if (media_entity_find_link(source_pad, sink_pad))
+			continue;
+
+		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
+		if (ret) {
+			vin_err(vin, "Error adding link from %s to %s\n",
+				source->name, sink->name);
+			break;
+		}
+	}
+	mutex_unlock(&vin->group->lock);
+}
+
 static void rvin_csi2_cleanup(struct rvin_dev *vin)
 {
 	rvin_group_notifier_cleanup(vin);
@@ -973,7 +984,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret < 0)
 		return ret;
 
-	ret = rvin_group_get(vin);
+	ret = rvin_group_get(vin, rvin_csi2_setup_links);
 	if (ret)
 		goto err_controls;
 
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 39207aaf39ef9391..f2c32d5ceb7f83d9 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -269,6 +269,7 @@ struct rvin_dev {
  * @count:		number of enabled VIN instances found in DT
  * @notifier:		group notifier for CSI-2 async subdevices
  * @vin:		VIN instances which are part of the group
+ * @link_setup:		Callback to create all links for the media graph
  * @remotes:		array of pairs of fwnode and subdev pointers
  *			to all remote subdevices.
  */
@@ -282,6 +283,8 @@ struct rvin_group {
 	struct v4l2_async_notifier notifier;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
+	void (*link_setup)(struct rvin_dev *vin);
+
 	struct {
 		struct v4l2_async_subdev *asd;
 		struct v4l2_subdev *subdev;
-- 
2.31.1

