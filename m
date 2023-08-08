Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8188C773D3E
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbjHHQPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbjHHQN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:13:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DA93C0E
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:47:34 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63DA32090;
        Tue,  8 Aug 2023 08:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691475528;
        bh=E3JGyBVQU2JsqzU8CPu88Pxvdao6yJRYM+76tiyNuJA=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=S6kQH+dCr011qcX+q9p7K9zN+E5BRFLT4Nc2LH4ZF7NwMOwkwubij/voWpcsiIcBB
         +n+WGD06MS2Vt1RSBYAk0dwUnHuJL7K0G+1PE9Bt2C+6agwIDmlovY7M7M4PD4AvBg
         De/3y1kXBjFGlORJMae6AXxnTluaOGins5p/jlOc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue, 08 Aug 2023 09:19:24 +0300
Subject: [PATCH v7 5/8] v4l2-ctl/compliance: Add simple routing test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-streams-support-v7-5-bd0b42a5826d@ideasonboard.com>
References: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
In-Reply-To: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5173;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=E3JGyBVQU2JsqzU8CPu88Pxvdao6yJRYM+76tiyNuJA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0d6GYa3LOEAftMrjPpL1888/syyOPIL9gavJB
 zZr6KlcGyqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNHehgAKCRD6PaqMvJYe
 9RN+D/4/JEL7TZ+f4gVmBOFATRRf7n9aYt0G0CV3h7gOJkLL3PYbf5G54BOymX9KT12xu40Vo+e
 /jiS5GuElUae0Ew43Uqc1ITQDCQLlHvSJ2XoNczTnRLue4m3E/SgtEWBTTMqKBuviVPvVbOQnoN
 ianj6MVPNlUc5Ex2gzgBfNCGXtARAr+pF3xTYooHg6QksUZSqHSfxP5Z3rYPlBdOGul6UiEH3qn
 w33iv3wcWB7vVS29rVNWUVGbR4faxgIBytFLlRW5/qU7GB+1QncFoihkGjrUx7GNxBiF9ey+z10
 ZCfciYvlqL9ajhsbN7S5NCxsFJIf3wOpFrtx1s7yooE4pL+twYCj0AU9l9xGapIJ0x8SRUFd+r9
 QspRxcjKRxmYg0YpzhFZY9C+PGv7ugWVuGaIsgdEmHdd/ad6D4e5qxvFyRZvEX6wLstMe6bXU6E
 ghDPu947uUvXoJSfitEqHGMpZtbbIF3+hF0QbaKaS8H9i5cd3uBZ9DAKBCS1FzsXt3kHVdL+GqM
 f6ZLvCq1/kHrMJiXHNGfzST8kWgt7G872FbeH0jgLlMIGPu4EVSeMA6RGqWXP/6AkuBV5bPBc2Y
 9lsFLsR/w02c+/FQeDrRNaXBdSnSyuUDuDc/8+TrKNjxc5AdajLagMghzRG/RcLSNms8hCdbZMk
 iTmz2NqHwKJA45A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 utils/v4l2-compliance/v4l2-compliance.cpp   | 12 +++++
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 78 +++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)

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
index 5545b0dc..38339ee3 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -551,3 +551,81 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 
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
+	if (!routing.num_routes)
+		return 0;
+
+	/*
+	 * Then get the actual routes, and verify that the num_routes gets
+	 * updated to the correct number.
+	 */
+
+	uint32_t num_routes = routing.num_routes;
+	routing.num_routes = num_routes + 1;
+	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
+	fail_on_test(routing.num_routes != num_routes);
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
+	}
+
+	return 0;
+}

-- 
2.34.1

