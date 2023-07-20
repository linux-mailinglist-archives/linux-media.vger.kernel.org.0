Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25DA75A83E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbjGTHvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbjGTHvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:51:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3B42704
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:51:22 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4636B2F5E;
        Thu, 20 Jul 2023 09:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689839410;
        bh=+J3mQaDG7ENMEK7OF0d9lA5UvEHRVf6H0KkoPHx2xWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d68RTDF+CzaB5Jb25SRJX1J95JNBoqR22IKbLcsrMY0ubAm+akApo9RIapSkbQDZz
         7chgQ+PTilqj2yNVBM3hlUfj2zkwSRqTEVPYVdcEdONn1xwuTNSZv/qCLadrDkCVjP
         4AlpTG644DYIiXHMcFtw3DkFwtf0Qitx68Z6sVI8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 5/8] v4l2-ctl/compliance: Add simple routing test
Date:   Thu, 20 Jul 2023 10:50:41 +0300
Message-Id: <20230720075044.442021-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
References: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a simple test for VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.

We can't (at least at the moment) really know here what kind of routings
the driver would accept, but we can test a VIDIOC_SUBDEV_G_ROUTING call,
followed by a VIDIOC_SUBDEV_S_ROUTING call with the routing we
received.

Additionally, we can check that the returned pads and flags look fine,
and also that setting obviously invalid routing will fail.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp   | 12 ++++
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 74 +++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index e8359b2f..4b232314 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1249,6 +1249,18 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.is_passthrough_subdev = has_source && has_sink;
 
 		if (has_routes) {
+			printf("Sub-Device routing ioctls:\n");
+
+			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
+				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
+
+				printf("\ttest %s VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: %s\n",
+				       which ? "Active" : "Try",
+				       ok(testSubDevRouting(&node, which)));
+			}
+
+			printf("\n");
+
 			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
 				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 0cd43980..35b2274b 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -375,6 +375,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned str
 int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream);
 int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream);
 int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream);
+int testSubDevRouting(struct node *node, unsigned which);
 
 // Buffer ioctl tests
 int testReqBufs(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 5545b0dc..e59d67f7 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -551,3 +551,77 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 
 	return have_sel ? 0 : ENOTTY;
 }
+
+int testSubDevRouting(struct node *node, unsigned which)
+{
+	const uint32_t all_route_flags_mask = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+	struct v4l2_subdev_routing routing = {};
+	struct v4l2_subdev_route routes[NUM_ROUTES_MAX] = {};
+	unsigned int i;
+	int ret;
+
+	routing.which = which;
+	routing.routes = (__u64)&routes;
+	routing.num_routes = 0;
+	memset(routing.reserved, 0xff, sizeof(routing.reserved));
+
+	/*
+	 * First test that G_ROUTING either returns success, or ENOSPC and
+	 * updates num_routes.
+	 */
+
+	ret = doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing);
+	fail_on_test(ret && ret != ENOSPC);
+	fail_on_test(ret == ENOSPC && routing.num_routes == 0);
+	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
+
+	if (routing.num_routes)
+		return 0;
+
+	/* Then get the actual routes */
+
+	routing.num_routes = NUM_ROUTES_MAX;
+	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
+
+	/* Check the validity of route pads and flags */
+
+	if (node->pads) {
+		for (i = 0; i < routing.num_routes; ++i) {
+			const struct v4l2_subdev_route *route = &routes[i];
+			const struct media_pad_desc *sink;
+			const struct media_pad_desc *source;
+
+			fail_on_test(route->sink_pad >= node->entity.pads);
+			fail_on_test(route->source_pad >= node->entity.pads);
+
+			sink = &node->pads[route->sink_pad];
+			source = &node->pads[route->source_pad];
+
+			fail_on_test(!(sink->flags & MEDIA_PAD_FL_SINK));
+			fail_on_test(!(source->flags & MEDIA_PAD_FL_SOURCE));
+			fail_on_test(route->flags & ~all_route_flags_mask);
+		}
+	}
+
+	/* Set the same routes back, which should always succeed. */
+
+	memset(routing.reserved, 0xff, sizeof(routing.reserved));
+	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
+	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
+
+	/* Test setting invalid pads */
+
+	if (node->pads) {
+		for (i = 0; i < routing.num_routes; ++i) {
+			struct v4l2_subdev_route *route = &routes[i];
+
+			route->sink_pad = node->entity.pads + 1;
+		}
+
+		memset(routing.reserved, 0xff, sizeof(routing.reserved));
+		fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing) != EINVAL);
+		fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
+	}
+
+	return 0;
+}
-- 
2.34.1

