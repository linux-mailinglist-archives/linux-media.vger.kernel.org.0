Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8843C25E9
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhGIO3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232269AbhGIO3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:18 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F57C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:34 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id w13so6453659wmc.3
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WGBILjqVuCEg9Arg1B3FHXYEywA5LBHK1MGj4lmboxY=;
        b=MW4WgYZRo5GxfGh4PHtp86JL8Omfw/0QYbLv06sU0Sp1jBuoz7jKdgi3EtHhAEpRI+
         4f4U45vK2Xu/K7PfcsWOe7uorJt0Y5/V600fuHgtp5Z8KEW6rBsY7Ai188XZImA0/zmJ
         TZSe8aO+J3VqzkEiep97VhhRwbX9AWMmiEohMD92OD513zNVMf8vpU+LyrcDSAfkWUzZ
         6pBZZABozowNPQHi05xq75k/gROj31ZPG15Mnqp6P6IwujbBimtFZ+45Ro7msszweuhv
         HVD65/c250MK0iaeSaR6WseARVy//MBO84+SsWzhqsOlZYf0EagBYuh5IdXddeiHokBI
         6Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGBILjqVuCEg9Arg1B3FHXYEywA5LBHK1MGj4lmboxY=;
        b=j66BfZ7DsQnQ56d+0kEJ42OZFMJor6hjC31VKeRYm8cB6oqaYPqYdPNGrVF84vClpk
         TL9iMbvZWIdXM7CjblRjePeWIKQW+X/ccK3ag0izYrqSvCyFNZGXSiTWjobjr1nd8YUA
         /26RIVMo5SVOInXiPPN1qsSim1w0jGHTv1I4iz55tXQEFGL9DzEdJ5h1vR26Xolwju6Y
         P8zBUWTWEBSKreR295wib6J+Tk5IZJCFC1r3lQc4WjSfaHICWKCK0z5UB4ETtsoXYrXK
         LC7hu+8Exd27RBMd7Qc6ToXTprXIS2LHw3MHwSSEBVIpdqf7belpQqODQtKWLSagDck0
         PpfA==
X-Gm-Message-State: AOAM530PBWd6jJD9jgA0xwGo5/KP+UCtQR7j+Zk6QOHnd6wsrow68Gbo
        wEsTis+zbOHSEaU4wN7dWGEsnQ==
X-Google-Smtp-Source: ABdhPJxfpcGJ5/ts3yGk5Bm4su2+kThayKnWJmuZ2FIElf9HDidSVdkfjvCLq+EMlridLNzQgXMTwQ==
X-Received: by 2002:a7b:c1c6:: with SMTP id a6mr41209925wmj.159.1625840792880;
        Fri, 09 Jul 2021 07:26:32 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:32 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 06/11] rcar-vin: Move group async notifier
Date:   Fri,  9 Jul 2021 16:25:55 +0200
Message-Id: <20210709142600.651718-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIN group notifier code is intertwined with the media graph layout
code for R-Car CSI-2 subdevices, this makes it hard to extend the group
to also support the R-Car ISP channel selector.

Before breaking the two concepts apart and extending it move the group
code to its final location. There is no functional change and all
functions are moved verbatim.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 460 ++++++++++----------
 1 file changed, 230 insertions(+), 230 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index a44cfa993ec8893d..3585985e822560ea 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -383,6 +383,176 @@ static void rvin_group_put(struct rvin_dev *vin)
 	kref_put(&group->refcount, rvin_group_release);
 }
 
+static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
+	const struct rvin_group_route *route;
+	unsigned int i;
+	int ret;
+
+	ret = media_device_register(&vin->group->mdev);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
+	if (ret) {
+		vin_err(vin, "Failed to register subdev nodes\n");
+		return ret;
+	}
+
+	/* Register all video nodes for the group. */
+	for (i = 0; i < RCAR_VIN_NUM; i++) {
+		if (vin->group->vin[i] &&
+		    !video_is_registered(&vin->group->vin[i]->vdev)) {
+			ret = rvin_v4l2_register(vin->group->vin[i]);
+			if (ret)
+				return ret;
+		}
+	}
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
+
+	return ret;
+}
+
+static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
+				     struct v4l2_subdev *subdev,
+				     struct v4l2_async_subdev *asd)
+{
+	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
+	unsigned int i;
+
+	for (i = 0; i < RCAR_VIN_NUM; i++)
+		if (vin->group->vin[i])
+			rvin_v4l2_unregister(vin->group->vin[i]);
+
+	mutex_lock(&vin->group->lock);
+
+	for (i = 0; i < RVIN_CSI_MAX; i++) {
+		if (vin->group->remotes[i].asd != asd)
+			continue;
+		vin->group->remotes[i].subdev = NULL;
+		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
+		break;
+	}
+
+	mutex_unlock(&vin->group->lock);
+
+	media_device_unregister(&vin->group->mdev);
+}
+
+static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *subdev,
+				   struct v4l2_async_subdev *asd)
+{
+	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
+	unsigned int i;
+
+	mutex_lock(&vin->group->lock);
+
+	for (i = 0; i < RVIN_CSI_MAX; i++) {
+		if (vin->group->remotes[i].asd != asd)
+			continue;
+		vin->group->remotes[i].subdev = subdev;
+		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
+		break;
+	}
+
+	mutex_unlock(&vin->group->lock);
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
+	.bound = rvin_group_notify_bound,
+	.unbind = rvin_group_notify_unbind,
+	.complete = rvin_group_notify_complete,
+};
+
+static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
+{
+	struct fwnode_handle *ep, *fwnode;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct v4l2_async_subdev *asd;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
+	if (!ep)
+		return 0;
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (!of_device_is_available(to_of_node(fwnode))) {
+		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
+			to_of_node(fwnode));
+		ret = -ENOTCONN;
+		goto out;
+	}
+
+	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
+						    fwnode,
+						    struct v4l2_async_subdev);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out;
+	}
+
+	vin->group->remotes[vep.base.id].asd = asd;
+
+	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
+		to_of_node(fwnode), vep.base.id);
+out:
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
 static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 {
 	mutex_lock(&vin->group->lock);
@@ -393,6 +563,65 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 	mutex_unlock(&vin->group->lock);
 }
 
+static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
+{
+	unsigned int count = 0, vin_mask = 0;
+	unsigned int i, id;
+	int ret;
+
+	mutex_lock(&vin->group->lock);
+
+	/* If not all VIN's are registered don't register the notifier. */
+	for (i = 0; i < RCAR_VIN_NUM; i++) {
+		if (vin->group->vin[i]) {
+			count++;
+			vin_mask |= BIT(i);
+		}
+	}
+
+	if (vin->group->count != count) {
+		mutex_unlock(&vin->group->lock);
+		return 0;
+	}
+
+	mutex_unlock(&vin->group->lock);
+
+	v4l2_async_notifier_init(&vin->group->notifier);
+
+	/*
+	 * Have all VIN's look for CSI-2 subdevices. Some subdevices will
+	 * overlap but the parser function can handle it, so each subdevice
+	 * will only be registered once with the group notifier.
+	 */
+	for (i = 0; i < RCAR_VIN_NUM; i++) {
+		if (!(vin_mask & BIT(i)))
+			continue;
+
+		for (id = 0; id < RVIN_CSI_MAX; id++) {
+			if (vin->group->remotes[id].asd)
+				continue;
+
+			ret = rvin_mc_parse_of(vin->group->vin[i], id);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (list_empty(&vin->group->notifier.asd_list))
+		return 0;
+
+	vin->group->notifier.ops = &rvin_group_notify_ops;
+	ret = v4l2_async_notifier_register(&vin->v4l2_dev,
+					   &vin->group->notifier);
+	if (ret < 0) {
+		vin_err(vin, "Notifier registration failed\n");
+		v4l2_async_notifier_cleanup(&vin->group->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -720,238 +949,9 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 }
 
 /* -----------------------------------------------------------------------------
- * Group async notifier
+ * CSI-2
  */
 
-static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	const struct rvin_group_route *route;
-	unsigned int i;
-	int ret;
-
-	ret = media_device_register(&vin->group->mdev);
-	if (ret)
-		return ret;
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
-
-	return ret;
-}
-
-static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
-				     struct v4l2_subdev *subdev,
-				     struct v4l2_async_subdev *asd)
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
-		if (vin->group->remotes[i].asd != asd)
-			continue;
-		vin->group->remotes[i].subdev = NULL;
-		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
-		break;
-	}
-
-	mutex_unlock(&vin->group->lock);
-
-	media_device_unregister(&vin->group->mdev);
-}
-
-static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
-				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
-
-	mutex_lock(&vin->group->lock);
-
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
-		if (vin->group->remotes[i].asd != asd)
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
-static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
-{
-	struct fwnode_handle *ep, *fwnode;
-	struct v4l2_fwnode_endpoint vep = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY,
-	};
-	struct v4l2_async_subdev *asd;
-	int ret;
-
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
-	if (!ep)
-		return 0;
-
-	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	fwnode_handle_put(ep);
-	if (ret) {
-		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (!of_device_is_available(to_of_node(fwnode))) {
-		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
-			to_of_node(fwnode));
-		ret = -ENOTCONN;
-		goto out;
-	}
-
-	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
-						    fwnode,
-						    struct v4l2_async_subdev);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto out;
-	}
-
-	vin->group->remotes[vep.base.id].asd = asd;
-
-	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
-		to_of_node(fwnode), vep.base.id);
-out:
-	fwnode_handle_put(fwnode);
-
-	return ret;
-}
-
-static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
-{
-	unsigned int count = 0, vin_mask = 0;
-	unsigned int i, id;
-	int ret;
-
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
-	}
-
-	mutex_unlock(&vin->group->lock);
-
-	v4l2_async_notifier_init(&vin->group->notifier);
-
-	/*
-	 * Have all VIN's look for CSI-2 subdevices. Some subdevices will
-	 * overlap but the parser function can handle it, so each subdevice
-	 * will only be registered once with the group notifier.
-	 */
-	for (i = 0; i < RCAR_VIN_NUM; i++) {
-		if (!(vin_mask & BIT(i)))
-			continue;
-
-		for (id = 0; id < RVIN_CSI_MAX; id++) {
-			if (vin->group->remotes[id].asd)
-				continue;
-
-			ret = rvin_mc_parse_of(vin->group->vin[i], id);
-			if (ret)
-				return ret;
-		}
-	}
-
-	if (list_empty(&vin->group->notifier.asd_list))
-		return 0;
-
-	vin->group->notifier.ops = &rvin_group_notify_ops;
-	ret = v4l2_async_notifier_register(&vin->v4l2_dev,
-					   &vin->group->notifier);
-	if (ret < 0) {
-		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_notifier_cleanup(&vin->group->notifier);
-		return ret;
-	}
-
-	return 0;
-}
-
 static void rvin_csi2_cleanup(struct rvin_dev *vin)
 {
 	rvin_parallel_cleanup(vin);
-- 
2.32.0

