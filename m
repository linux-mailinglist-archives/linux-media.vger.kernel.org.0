Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F8258248C
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbiG0Khl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbiG0Khe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB266474EE
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:31 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 536561B46;
        Wed, 27 Jul 2022 12:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918234;
        bh=ad6e712f+oBGE55QkoIjF/IdbsmL/Y2je7I7zGK1+no=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qHRfLGRqg7Sbals7/hfAbIYteSHniyoWZkEkETt4eHfa25gTn5lK/Zv9Ckl0ezW8a
         EbBMoE8lPcYQi0koou+kVE0cxOGPq5fBXBY4ve1ZXekvR+77khE+EiFBWDKKA8dGB7
         7JdqX2TKL9RT1HzYXtX5AMad/+UFIfZ2s4yr1+WA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 23/30] media: subdev: Add for_each_active_route() macro
Date:   Wed, 27 Jul 2022 13:36:32 +0300
Message-Id: <20220727103639.581567-24-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add a for_each_active_route() macro to replace the repeated pattern
of iterating on the active routes of a routing table.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .clang-format                         |  1 +
 drivers/media/v4l2-core/v4l2-subdev.c | 20 ++++++++++++++++++++
 include/media/v4l2-subdev.h           | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/.clang-format b/.clang-format
index 9b87ea1fc16e..2629a5051bf8 100644
--- a/.clang-format
+++ b/.clang-format
@@ -190,6 +190,7 @@ ForEachMacros:
   - 'for_each_active_dev_scope'
   - 'for_each_active_drhd_unit'
   - 'for_each_active_iommu'
+  - 'for_each_active_route'
   - 'for_each_aggr_pgid'
   - 'for_each_available_child_of_node'
   - 'for_each_bench'
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c9f3d1a0ede1..f3219c8a6317 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1734,6 +1734,26 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate);
 
+struct v4l2_subdev_route *
+__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
+				struct v4l2_subdev_route *route)
+{
+	if (route)
+		++route;
+	else
+		route = &routing->routes[0];
+
+	for (; route < routing->routes + routing->num_routes; ++route) {
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		return route;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_next_active_route);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a088ff1ecdc1..f749effadde2 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1593,6 +1593,19 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				 const struct v4l2_subdev_krouting *routing,
 				 enum v4l2_subdev_routing_restriction disallow);
 
+struct v4l2_subdev_route *
+__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
+				struct v4l2_subdev_route *route);
+
+/**
+ * for_each_active_route - iterate on all active routes of a routing table
+ * @routing: The routing table
+ * @route: The route iterator
+ */
+#define for_each_active_route(routing, route) \
+	for ((route) = NULL;                  \
+	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.34.1

