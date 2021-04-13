Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD01035E5ED
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347520AbhDMSEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:40 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:27752 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347503AbhDMSEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:31 -0400
X-Halon-ID: a4c651df-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a4c651df-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:09 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 10/11] rcar-vin: Move and rename CSI-2 link notifications
Date:   Tue, 13 Apr 2021 20:02:52 +0200
Message-Id: <20210413180253.2575451-11-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI-2 link notifications are no longer the only option for the VIN
group. Change the symbol prefix to rvin_csi2_ for all CSI-2 specific
code and move the link notification code to the correct section to not
mix it with the soon to be added R-Car ISP channel selector notification
helpers.

There is no functional change and apart from the symbol prefix change
all functions are moved verbatim.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 360 ++++++++++----------
 1 file changed, 178 insertions(+), 182 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 28bf9e8f19a1a27b..763be02f507e6f3f 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -44,187 +44,6 @@
 
 #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
 
-/* -----------------------------------------------------------------------------
- * Media Controller link notification
- */
-
-/* group lock should be held when calling this function. */
-static int rvin_group_entity_to_remote_id(struct rvin_group *group,
-					  struct media_entity *entity)
-{
-	struct v4l2_subdev *sd;
-	unsigned int i;
-
-	sd = media_entity_to_v4l2_subdev(entity);
-
-	for (i = 0; i < RVIN_REMOTES_MAX; i++)
-		if (group->remotes[i].subdev == sd)
-			return i;
-
-	return -ENODEV;
-}
-
-static unsigned int rvin_group_get_mask(struct rvin_dev *vin,
-					enum rvin_csi_id csi_id,
-					unsigned char channel)
-{
-	const struct rvin_group_route *route;
-	unsigned int mask = 0;
-
-	for (route = vin->info->routes; route->mask; route++) {
-		if (route->vin == vin->id &&
-		    route->csi == csi_id &&
-		    route->channel == channel) {
-			vin_dbg(vin,
-				"Adding route: vin: %d csi: %d channel: %d\n",
-				route->vin, route->csi, route->channel);
-			mask |= route->mask;
-		}
-	}
-
-	return mask;
-}
-
-/*
- * Link setup for the links between a VIN and a CSI-2 receiver is a bit
- * complex. The reason for this is that the register controlling routing
- * is not present in each VIN instance. There are special VINs which
- * control routing for themselves and other VINs. There are not many
- * different possible links combinations that can be enabled at the same
- * time, therefor all already enabled links which are controlled by a
- * master VIN need to be taken into account when making the decision
- * if a new link can be enabled or not.
- *
- * 1. Find out which VIN the link the user tries to enable is connected to.
- * 2. Lookup which master VIN controls the links for this VIN.
- * 3. Start with a bitmask with all bits set.
- * 4. For each previously enabled link from the master VIN bitwise AND its
- *    route mask (see documentation for mask in struct rvin_group_route)
- *    with the bitmask.
- * 5. Bitwise AND the mask for the link the user tries to enable to the bitmask.
- * 6. If the bitmask is not empty at this point the new link can be enabled
- *    while keeping all previous links enabled. Update the CHSEL value of the
- *    master VIN and inform the user that the link could be enabled.
- *
- * Please note that no link can be enabled if any VIN in the group is
- * currently open.
- */
-static int rvin_group_link_notify(struct media_link *link, u32 flags,
-				  unsigned int notification)
-{
-	struct rvin_group *group = container_of(link->graph_obj.mdev,
-						struct rvin_group, mdev);
-	unsigned int master_id, channel, mask_new, i;
-	unsigned int mask = ~0;
-	struct media_entity *entity;
-	struct video_device *vdev;
-	struct media_pad *csi_pad;
-	struct rvin_dev *vin = NULL;
-	int csi_id, ret;
-
-	ret = v4l2_pipeline_link_notify(link, flags, notification);
-	if (ret)
-		return ret;
-
-	/* Only care about link enablement for VIN nodes. */
-	if (!(flags & MEDIA_LNK_FL_ENABLED) ||
-	    !is_media_entity_v4l2_video_device(link->sink->entity))
-		return 0;
-
-	/*
-	 * Don't allow link changes if any entity in the graph is
-	 * streaming, modifying the CHSEL register fields can disrupt
-	 * running streams.
-	 */
-	media_device_for_each_entity(entity, &group->mdev)
-		if (entity->stream_count)
-			return -EBUSY;
-
-	mutex_lock(&group->lock);
-
-	/* Find the master VIN that controls the routes. */
-	vdev = media_entity_to_video_device(link->sink->entity);
-	vin = container_of(vdev, struct rvin_dev, vdev);
-	master_id = rvin_group_id_to_master(vin->id);
-
-	if (WARN_ON(!group->vin[master_id])) {
-		ret = -ENODEV;
-		goto out;
-	}
-
-	/* Build a mask for already enabled links. */
-	for (i = master_id; i < master_id + 4; i++) {
-		if (!group->vin[i])
-			continue;
-
-		/* Get remote CSI-2, if any. */
-		csi_pad = media_entity_remote_pad(
-				&group->vin[i]->vdev.entity.pads[0]);
-		if (!csi_pad)
-			continue;
-
-		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
-		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
-
-		mask &= rvin_group_get_mask(group->vin[i], csi_id, channel);
-	}
-
-	/* Add the new link to the existing mask and check if it works. */
-	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
-
-	if (csi_id == -ENODEV) {
-		struct v4l2_subdev *sd;
-
-		/*
-		 * Make sure the source entity subdevice is registered as
-		 * a parallel input of one of the enabled VINs if it is not
-		 * one of the CSI-2 subdevices.
-		 *
-		 * No hardware configuration required for parallel inputs,
-		 * we can return here.
-		 */
-		sd = media_entity_to_v4l2_subdev(link->source->entity);
-		for (i = 0; i < RCAR_VIN_NUM; i++) {
-			if (group->vin[i] &&
-			    group->vin[i]->parallel.subdev == sd) {
-				group->vin[i]->is_csi = false;
-				ret = 0;
-				goto out;
-			}
-		}
-
-		vin_err(vin, "Subdevice %s not registered to any VIN\n",
-			link->source->entity->name);
-		ret = -ENODEV;
-		goto out;
-	}
-
-	channel = rvin_group_csi_pad_to_channel(link->source->index);
-	mask_new = mask & rvin_group_get_mask(vin, csi_id, channel);
-	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
-
-	if (!mask_new) {
-		ret = -EMLINK;
-		goto out;
-	}
-
-	/* New valid CHSEL found, set the new value. */
-	ret = rvin_set_channel_routing(group->vin[master_id], __ffs(mask_new));
-	if (ret)
-		goto out;
-
-	vin->is_csi = true;
-
-out:
-	mutex_unlock(&group->lock);
-
-	return ret;
-}
-
-static const struct media_device_ops rvin_media_ops = {
-	.link_notify = rvin_group_link_notify,
-};
-
 /* -----------------------------------------------------------------------------
  * Gen3 CSI2 Group Allocator
  */
@@ -389,6 +208,22 @@ static void rvin_group_put(struct rvin_dev *vin)
 	kref_put(&group->refcount, rvin_group_release);
 }
 
+/* group lock should be held when calling this function. */
+static int rvin_group_entity_to_remote_id(struct rvin_group *group,
+					  struct media_entity *entity)
+{
+	struct v4l2_subdev *sd;
+	unsigned int i;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+
+	for (i = 0; i < RVIN_REMOTES_MAX; i++)
+		if (group->remotes[i].subdev == sd)
+			return i;
+
+	return -ENODEV;
+}
+
 static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
@@ -921,6 +756,167 @@ static int rvin_parallel_init(struct rvin_dev *vin)
  * CSI-2
  */
 
+static unsigned int rvin_csi2_get_mask(struct rvin_dev *vin,
+				       enum rvin_csi_id csi_id,
+				       unsigned char channel)
+{
+	const struct rvin_group_route *route;
+	unsigned int mask = 0;
+
+	for (route = vin->info->routes; route->mask; route++) {
+		if (route->vin == vin->id &&
+		    route->csi == csi_id &&
+		    route->channel == channel) {
+			vin_dbg(vin,
+				"Adding route: vin: %d csi: %d channel: %d\n",
+				route->vin, route->csi, route->channel);
+			mask |= route->mask;
+		}
+	}
+
+	return mask;
+}
+
+/*
+ * Link setup for the links between a VIN and a CSI-2 receiver is a bit
+ * complex. The reason for this is that the register controlling routing
+ * is not present in each VIN instance. There are special VINs which
+ * control routing for themselves and other VINs. There are not many
+ * different possible links combinations that can be enabled at the same
+ * time, therefor all already enabled links which are controlled by a
+ * master VIN need to be taken into account when making the decision
+ * if a new link can be enabled or not.
+ *
+ * 1. Find out which VIN the link the user tries to enable is connected to.
+ * 2. Lookup which master VIN controls the links for this VIN.
+ * 3. Start with a bitmask with all bits set.
+ * 4. For each previously enabled link from the master VIN bitwise AND its
+ *    route mask (see documentation for mask in struct rvin_group_route)
+ *    with the bitmask.
+ * 5. Bitwise AND the mask for the link the user tries to enable to the bitmask.
+ * 6. If the bitmask is not empty at this point the new link can be enabled
+ *    while keeping all previous links enabled. Update the CHSEL value of the
+ *    master VIN and inform the user that the link could be enabled.
+ *
+ * Please note that no link can be enabled if any VIN in the group is
+ * currently open.
+ */
+static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
+				 unsigned int notification)
+{
+	struct rvin_group *group = container_of(link->graph_obj.mdev,
+						struct rvin_group, mdev);
+	unsigned int master_id, channel, mask_new, i;
+	unsigned int mask = ~0;
+	struct media_entity *entity;
+	struct video_device *vdev;
+	struct media_pad *csi_pad;
+	struct rvin_dev *vin = NULL;
+	int csi_id, ret;
+
+	ret = v4l2_pipeline_link_notify(link, flags, notification);
+	if (ret)
+		return ret;
+
+	/* Only care about link enablement for VIN nodes. */
+	if (!(flags & MEDIA_LNK_FL_ENABLED) ||
+	    !is_media_entity_v4l2_video_device(link->sink->entity))
+		return 0;
+
+	/*
+	 * Don't allow link changes if any entity in the graph is
+	 * streaming, modifying the CHSEL register fields can disrupt
+	 * running streams.
+	 */
+	media_device_for_each_entity(entity, &group->mdev)
+		if (entity->stream_count)
+			return -EBUSY;
+
+	mutex_lock(&group->lock);
+
+	/* Find the master VIN that controls the routes. */
+	vdev = media_entity_to_video_device(link->sink->entity);
+	vin = container_of(vdev, struct rvin_dev, vdev);
+	master_id = rvin_group_id_to_master(vin->id);
+
+	if (WARN_ON(!group->vin[master_id])) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/* Build a mask for already enabled links. */
+	for (i = master_id; i < master_id + 4; i++) {
+		if (!group->vin[i])
+			continue;
+
+		/* Get remote CSI-2, if any. */
+		csi_pad = media_entity_remote_pad(
+				&group->vin[i]->vdev.entity.pads[0]);
+		if (!csi_pad)
+			continue;
+
+		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
+		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
+
+		mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
+	}
+
+	/* Add the new link to the existing mask and check if it works. */
+	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
+
+	if (csi_id == -ENODEV) {
+		struct v4l2_subdev *sd;
+
+		/*
+		 * Make sure the source entity subdevice is registered as
+		 * a parallel input of one of the enabled VINs if it is not
+		 * one of the CSI-2 subdevices.
+		 *
+		 * No hardware configuration required for parallel inputs,
+		 * we can return here.
+		 */
+		sd = media_entity_to_v4l2_subdev(link->source->entity);
+		for (i = 0; i < RCAR_VIN_NUM; i++) {
+			if (group->vin[i] &&
+			    group->vin[i]->parallel.subdev == sd) {
+				group->vin[i]->is_csi = false;
+				ret = 0;
+				goto out;
+			}
+		}
+
+		vin_err(vin, "Subdevice %s not registered to any VIN\n",
+			link->source->entity->name);
+		ret = -ENODEV;
+		goto out;
+	}
+
+	channel = rvin_group_csi_pad_to_channel(link->source->index);
+	mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
+	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
+
+	if (!mask_new) {
+		ret = -EMLINK;
+		goto out;
+	}
+
+	/* New valid CHSEL found, set the new value. */
+	ret = rvin_set_channel_routing(group->vin[master_id], __ffs(mask_new));
+	if (ret)
+		goto out;
+
+	vin->is_csi = true;
+
+out:
+	mutex_unlock(&group->lock);
+
+	return ret;
+}
+
+static const struct media_device_ops rvin_csi2_media_ops = {
+	.link_notify = rvin_csi2_link_notify,
+};
+
 static void rvin_csi2_setup_links(struct rvin_dev *vin)
 {
 	const struct rvin_group_route *route;
@@ -986,7 +982,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret < 0)
 		return ret;
 
-	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_media_ops);
+	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_csi2_media_ops);
 	if (ret)
 		goto err_controls;
 
-- 
2.31.1

