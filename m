Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1AC05F3021
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 14:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiJCMTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 08:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiJCMTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 08:19:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7859C3A496
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 05:19:30 -0700 (PDT)
Received: from desky.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8274FFD;
        Mon,  3 Oct 2022 14:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799565;
        bh=xJkbMYopDnyoIO35OI5rtrkp2aBLRhuH71pLTO7PTFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JG3y87FasFztiLF64ngF1jKnX1IwwgcH50L4sSIhSLZE/apLKTdSHkHRvKAHqvUeh
         jcFln9iqkJqkMb0bxjo+nVBAzAm0LiXztCbg3kW6wXjw5LZDuDIv7/Gdj7Aaw4ZB2C
         hFNnZzQrDNJkanAyxBLnIp1TABnA0fG9esjK1r9I=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v15 08/19] media: subdev: Add for_each_active_route() macro
Date:   Mon,  3 Oct 2022 15:18:41 +0300
Message-Id: <20221003121852.616745-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
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
index 1247d54f9e49..31f39ae78f7b 100644
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
index 3ae4f39a50e4..1049c07d2e49 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1212,6 +1212,26 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
 
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
index 7962e6572bda..89e58208e330 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1435,6 +1435,19 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    const struct v4l2_subdev_krouting *routing);
 
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

