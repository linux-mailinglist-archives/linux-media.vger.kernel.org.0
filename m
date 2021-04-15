Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FD1360A09
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbhDONFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbhDONFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:49 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ACC81C65;
        Thu, 15 Apr 2021 15:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491925;
        bh=x9z+5i+BGPsZ331alD/LpISQCltKNQh99igUhFawEbI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kGsNGZVlCyzENNOMXFZndup9DV+rxpua0dVsM3WTFzBvJWCUHqzfozcP/KBJT5xsU
         bnBhi/qyC/zL69LpRp4E4Kol7FJzbCPrMZgvod2HX/pHHCTerNJI8+KPz0OTwBy3qL
         XPQo8TLdkx1+G+oHa16m5g+AF6AuCo6dDQJ/cs4Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 20/24] v4l: mc: Add an S_ROUTING helper function for power state changes
Date:   Thu, 15 Apr 2021 16:04:46 +0300
Message-Id: <20210415130450.421168-21-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

With the addition of the has_route() media entity operation, all pads of an
entity are no longer interconnected. The S_ROUTING IOCTL for sub-devices can
be used to enable and disable routes for an entity. The consequence is that
the routing information has to be taken into account in use count
calculation: disabling a route has a very similar effect on use counts as
has disabling a link.

Add a helper function for drivers implementing VIDIOC_SUBDEV_S_ROUTING
IOCTL to take the change into account.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-mc.c | 34 +++++++++++++++++++++++++++++++
 include/media/v4l2-mc.h           | 22 ++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 35d18ed89fa5..71acb389aa7b 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -588,3 +588,37 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(v4l2_pipeline_link_notify);
+
+int v4l2_subdev_routing_pm_use(struct media_entity *entity,
+			       struct v4l2_subdev_route *route)
+{
+	struct media_graph *graph =
+		&entity->graph_obj.mdev->pm_count_walk;
+	struct media_pad *source = &entity->pads[route->source_pad];
+	struct media_pad *sink = &entity->pads[route->sink_pad];
+	int source_use;
+	int sink_use;
+	int ret;
+
+	source_use = pipeline_pm_use_count(source, graph);
+	sink_use = pipeline_pm_use_count(sink, graph);
+
+	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
+		/* Route disabled. */
+		pipeline_pm_power(source, -sink_use, graph);
+		pipeline_pm_power(sink, -source_use, graph);
+		return 0;
+	}
+
+	/* Route enabled. */
+	ret = pipeline_pm_power(source, sink_use, graph);
+	if (ret < 0)
+		return ret;
+
+	ret = pipeline_pm_power(sink, source_use, graph);
+	if (ret < 0)
+		pipeline_pm_power(source, -sink_use, graph);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_pm_use);
diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index c181685923d5..ab8f4dc143aa 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -18,6 +18,7 @@
 /* We don't need to include pci.h or usb.h here */
 struct pci_dev;
 struct usb_device;
+struct v4l2_subdev_route;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 /**
@@ -184,6 +185,22 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
 int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 			      unsigned int notification);
 
+/**
+ * v4l2_subdev_routing_pm_use - Handle power state changes due to S_ROUTING
+ * @entity: The entity
+ * @route: The new state of the route
+ *
+ * Propagate the use count across a route in a pipeline whenever the
+ * route is enabled or disabled. The function is called before
+ * changing the route state when enabling a route, and after changing
+ * the route state when disabling a route.
+ *
+ * Return 0 on success or a negative error code on failure. Powering entities
+ * off is assumed to never fail. This function will not fail for disconnection
+ * events.
+ */
+int v4l2_subdev_routing_pm_use(struct media_entity *entity,
+			       struct v4l2_subdev_route *route);
 #else /* CONFIG_MEDIA_CONTROLLER */
 
 static inline int v4l2_mc_create_media_graph(struct media_device *mdev)
@@ -219,5 +236,10 @@ static inline int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
 	return 0;
 }
 
+static inline int v4l2_subdev_routing_pm_use(struct media_entity *entity,
+					     struct v4l2_subdev_route *route)
+{
+	return 0;
+}
 #endif /* CONFIG_MEDIA_CONTROLLER */
 #endif /* _V4L2_MC_H */
-- 
2.25.1

