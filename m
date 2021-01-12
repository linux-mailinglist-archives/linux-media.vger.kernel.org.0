Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B052F3195
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 14:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbhALNYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 08:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbhALNYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 08:24:44 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092FFC061795
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 05:24:04 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1ED691F451D7
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 06/13] media: atmel: Use v4l2_async_notifier_add_fwnode_remote_subdev helpers
Date:   Tue, 12 Jan 2021 10:23:32 -0300
Message-Id: <20210112132339.5621-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112132339.5621-1-ezequiel@collabora.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of v4l2_async_notifier_add_subdev is discouraged.
Drivers are instead encouraged to use a helper such as
v4l2_async_notifier_add_fwnode_remote_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev,
removing some boilerplate code while at it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/atmel/atmel-isc.h      |  1 +
 drivers/media/platform/atmel/atmel-isi.c      | 46 ++++++-------------
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 44 ++++++------------
 3 files changed, 29 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 24b784b893d6..fab8eca58d93 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -41,6 +41,7 @@ struct isc_buffer {
 struct isc_subdev_entity {
 	struct v4l2_subdev		*sd;
 	struct v4l2_async_subdev	*asd;
+	struct device_node		*epn;
 	struct v4l2_async_notifier      notifier;
 
 	u32 pfe_cfg0;
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index d74aa73f26be..c1a6dd7af002 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -70,7 +70,6 @@ struct frame_buffer {
 struct isi_graph_entity {
 	struct device_node *node;
 
-	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *subdev;
 };
 
@@ -1136,45 +1135,26 @@ static const struct v4l2_async_notifier_operations isi_graph_notify_ops = {
 	.complete = isi_graph_notify_complete,
 };
 
-static int isi_graph_parse(struct atmel_isi *isi, struct device_node *node)
-{
-	struct device_node *ep = NULL;
-	struct device_node *remote;
-
-	ep = of_graph_get_next_endpoint(node, ep);
-	if (!ep)
-		return -EINVAL;
-
-	remote = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
-	if (!remote)
-		return -EINVAL;
-
-	/* Remote node to connect */
-	isi->entity.node = remote;
-	isi->entity.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-	isi->entity.asd.match.fwnode = of_fwnode_handle(remote);
-	return 0;
-}
-
 static int isi_graph_init(struct atmel_isi *isi)
 {
+	struct v4l2_async_subdev *asd;
+	struct device_node *ep;
 	int ret;
 
-	/* Parse the graph to extract a list of subdevice DT nodes. */
-	ret = isi_graph_parse(isi, isi->dev->of_node);
-	if (ret < 0) {
-		dev_err(isi->dev, "Graph parsing failed\n");
-		return ret;
-	}
+	ep = of_graph_get_next_endpoint(isi->dev->of_node, NULL);
+	if (!ep)
+		return -EINVAL;
 
 	v4l2_async_notifier_init(&isi->notifier);
 
-	ret = v4l2_async_notifier_add_subdev(&isi->notifier, &isi->entity.asd);
-	if (ret) {
-		of_node_put(isi->entity.node);
-		return ret;
-	}
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+						&isi->notifier,
+						of_fwnode_handle(ep),
+						sizeof(*asd));
+	of_node_put(ep);
+
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	isi->notifier.ops = &isi_graph_notify_ops;
 
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index a3304f49e499..9ee2cd194f93 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -57,7 +57,7 @@
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL, *rem;
+	struct device_node *epn = NULL;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
 	int ret;
@@ -71,17 +71,9 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 		if (!epn)
 			return 0;
 
-		rem = of_graph_get_remote_port_parent(epn);
-		if (!rem) {
-			dev_notice(dev, "Remote device at %pOF not found\n",
-				   epn);
-			continue;
-		}
-
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			of_node_put(rem);
 			ret = -EINVAL;
 			dev_err(dev, "Could not parse the endpoint\n");
 			break;
@@ -90,21 +82,10 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			of_node_put(rem);
-			ret = -ENOMEM;
-			break;
-		}
-
-		/* asd will be freed by the subsystem once it's added to the
-		 * notifier list
-		 */
-		subdev_entity->asd = kzalloc(sizeof(*subdev_entity->asd),
-					     GFP_KERNEL);
-		if (!subdev_entity->asd) {
-			of_node_put(rem);
 			ret = -ENOMEM;
 			break;
 		}
+		subdev_entity->epn = epn;
 
 		flags = v4l2_epn.bus.parallel.flags;
 
@@ -121,12 +102,10 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 			subdev_entity->pfe_cfg0 |= ISC_PFE_CFG0_CCIR_CRC |
 					ISC_PFE_CFG0_CCIR656;
 
-		subdev_entity->asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
-		subdev_entity->asd->match.fwnode = of_fwnode_handle(rem);
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-
 	of_node_put(epn);
+
 	return ret;
 }
 
@@ -228,13 +207,20 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	}
 
 	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
+		struct v4l2_async_subdev *asd;
+
 		v4l2_async_notifier_init(&subdev_entity->notifier);
 
-		ret = v4l2_async_notifier_add_subdev(&subdev_entity->notifier,
-						     subdev_entity->asd);
-		if (ret) {
-			fwnode_handle_put(subdev_entity->asd->match.fwnode);
-			kfree(subdev_entity->asd);
+		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+					&subdev_entity->notifier,
+					of_fwnode_handle(subdev_entity->epn),
+					sizeof(*asd));
+
+		of_node_put(subdev_entity->epn);
+		subdev_entity->epn = NULL;
+
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
 			goto cleanup_subdev;
 		}
 
-- 
2.29.2

