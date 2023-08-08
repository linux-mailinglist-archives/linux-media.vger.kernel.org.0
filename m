Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 383E9773D3D
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbjHHQO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjHHQNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:13:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BB57EFA
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:47:30 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F9DF208C;
        Tue,  8 Aug 2023 08:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691475528;
        bh=BxBuu7NdmKqbSqB+Bircs+myhDQvOE4ABsQudHBFvHE=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=kEn69MPJ8Cq0QpOR1U2E/Q8mVl8G4ItwV2TMR/NeVSWXZu3BAIQr7KX6loAIyZYec
         4bxaNWzJGi1AL3mnF9wYS/KNNhook5BOUTML5w/5R6Qq1mMcs1UvzyIk7ztPB8czyk
         vxKTuU4j2WL8OK0cL1hqjybFpSZBILhnwGte/rJs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue, 08 Aug 2023 09:19:23 +0300
Subject: [PATCH v7 4/8] v4l2-ctl/compliance: Add routing and streams
 multiplexed streams
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-streams-support-v7-4-bd0b42a5826d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19526;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BxBuu7NdmKqbSqB+Bircs+myhDQvOE4ABsQudHBFvHE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0d6FJISCdV/3A2u4pWfyZTxfDmXxTzAhU679C
 WAXzfQms+yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNHehQAKCRD6PaqMvJYe
 9UnMD/9hT0sOmxB566OlXcQaqMh+oY5CW5zqHJkdr5SIb0M+FhLIIlNJY4aeJ1lyLKUcjIk4gEO
 w3E4SUAld3F7jQRgrfaGbFyoXgDYQIbF3/zqzUP3/G8sP1vagks2sYlwJxkbAgkjvHUHx/Qr/Af
 Hotn4Nn5uee800F6gpzpS08XXL8EiY+SI1HvhcWYLTie9+nT9f90Kw4mEkrGB85vY4a/rkORCX2
 gMbZIDiLws3sb7lu4RuEC06kdtRvSAKtjolf8mKVTH8H023I/7CYDrxqfDtScN9DLiFS0P+eOC3
 3lkF8rgqcX2CdH0mkHddBx5RE0GenN2pip7L7fOgAkHWaWRBrsM+KCygkYxwVFPX+P++kKGGTeQ
 P9oDg73YpcHbzdGr8o16+Ce7hIlfbZZtb7XFAQRw/vlfxbw+RIv5WK5dtWY6eSKdJie4GWWXl/s
 fvr8DdAGmXIyRBFYYNletujifrn7rqdEnFsgb2P/yOzeK0b24cKWKHjYmrDCtu6DCwy3t6keloe
 XqBXhU4zFa8VonWpICKpWxmd1oYophjIa+j6MtYMTB4vZ0hwdiWWy/oSBLLMG9UGMJvnrr8rB+Y
 xKkfvS4+xWzJ90+ZbbJt9YKVO3pO1mWpgx+gxd53y4oNPM9PIqR7A9EUZbUji5jBMF5LKAO4HIz
 IZNQpzWhRnDDrSA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add basic support for routing and streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp   | 120 ++++++++++++++++++++++------
 utils/v4l2-compliance/v4l2-compliance.h     |   8 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp |  43 ++++++++--
 3 files changed, 137 insertions(+), 34 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index e3556b1f..e8359b2f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1233,6 +1233,10 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	if (node.is_subdev()) {
 		bool has_source = false;
 		bool has_sink = false;
+		struct v4l2_subdev_routing sd_routing[2] = {};
+		struct v4l2_subdev_route sd_routes[2][NUM_ROUTES_MAX] = {};
+		bool has_routes = !!(subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
+		int ret;
 
 		node.frame_interval_pad = -1;
 		node.enum_frame_interval_pad = -1;
@@ -1244,6 +1248,22 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		}
 		node.is_passthrough_subdev = has_source && has_sink;
 
+		if (has_routes) {
+			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
+				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
+
+				sd_routing[which].which = which;
+				sd_routing[which].routes = (__u64)sd_routes[which];
+				sd_routing[which].num_routes = NUM_ROUTES_MAX;
+
+				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
+				if (ret) {
+					fail("VIDIOC_SUBDEV_G_ROUTING: failed to get routing\n");
+					sd_routing[which].num_routes = 0;
+				}
+			}
+		}
+
 		for (unsigned pad = 0; pad < node.entity.pads; pad++) {
 			printf("Sub-Device ioctls (%s Pad %u):\n",
 			       (node.pads[pad].flags & MEDIA_PAD_FL_SINK) ?
@@ -1253,32 +1273,82 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 			node.has_subdev_enum_fival = 0;
 			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
 			     which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
-				printf("\ttest %s VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: %s\n",
-				       which ? "Active" : "Try",
-				       ok(testSubDevEnum(&node, which, pad)));
-				printf("\ttest %s VIDIOC_SUBDEV_G/S_FMT: %s\n",
-				       which ? "Active" : "Try",
-				       ok(testSubDevFormat(&node, which, pad)));
-				printf("\ttest %s VIDIOC_SUBDEV_G/S_SELECTION/CROP: %s\n",
-				       which ? "Active" : "Try",
-				       ok(testSubDevSelection(&node, which, pad)));
-				if (which)
-					printf("\ttest VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: %s\n",
-					       ok(testSubDevFrameInterval(&node, pad)));
+				struct v4l2_subdev_routing dummy_routing;
+				struct v4l2_subdev_route dummy_routes[1];
+
+				const struct v4l2_subdev_routing *routing;
+				const struct v4l2_subdev_route *routes;
+
+				if (has_routes) {
+					routing = &sd_routing[which];
+					routes = sd_routes[which];
+				} else {
+					dummy_routing.num_routes = 1;
+					dummy_routing.routes = (__u64)&dummy_routes;
+					dummy_routes[0].source_pad = pad;
+					dummy_routes[0].source_stream = 0;
+					dummy_routes[0].sink_pad = pad;
+					dummy_routes[0].sink_stream = 0;
+					dummy_routes[0].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+
+					routing = &dummy_routing;
+					routes = dummy_routes;
+				}
+
+				for (unsigned i = 0; i < routing->num_routes; ++i) {
+					const struct v4l2_subdev_route *r = &routes[i];
+					unsigned stream;
+
+					if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+						continue;
+
+					if ((node.pads[pad].flags & MEDIA_PAD_FL_SINK) &&
+					    (r->sink_pad == pad))
+						stream = r->sink_stream;
+					else if ((node.pads[pad].flags & MEDIA_PAD_FL_SOURCE) &&
+					    (r->source_pad == pad))
+						stream = r->source_stream;
+					else
+						continue;
+
+					printf("\t%s Stream %u\n",which ? "Active" : "Try",
+					       stream);
+
+					printf("\ttest %s VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: %s\n",
+					       which ? "Active" : "Try",
+					       ok(testSubDevEnum(&node, which, pad, stream)));
+					printf("\ttest %s VIDIOC_SUBDEV_G/S_FMT: %s\n",
+					       which ? "Active" : "Try",
+					       ok(testSubDevFormat(&node, which, pad, stream)));
+					printf("\ttest %s VIDIOC_SUBDEV_G/S_SELECTION/CROP: %s\n",
+					       which ? "Active" : "Try",
+					       ok(testSubDevSelection(&node, which, pad, stream)));
+					if (which)
+						printf("\ttest VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: %s\n",
+						       ok(testSubDevFrameInterval(&node, pad, stream)));
+				}
+			}
+
+			/*
+			 * These tests do not make sense for subdevs with multiplexed streams,
+			 * as the try & active cases may have different routing and thus different
+			 * behavior.
+			 */
+			if (!has_routes) {
+				if (node.has_subdev_enum_code && node.has_subdev_enum_code < 3)
+					fail("VIDIOC_SUBDEV_ENUM_MBUS_CODE: try/active mismatch\n");
+				if (node.has_subdev_enum_fsize && node.has_subdev_enum_fsize < 3)
+					fail("VIDIOC_SUBDEV_ENUM_FRAME_SIZE: try/active mismatch\n");
+				if (node.has_subdev_enum_fival && node.has_subdev_enum_fival < 3)
+					fail("VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: try/active mismatch\n");
+				if (node.has_subdev_fmt && node.has_subdev_fmt < 3)
+					fail("VIDIOC_SUBDEV_G/S_FMT: try/active mismatch\n");
+				if (node.has_subdev_selection && node.has_subdev_selection < 3)
+					fail("VIDIOC_SUBDEV_G/S_SELECTION: try/active mismatch\n");
+				if (node.has_subdev_selection &&
+				    node.has_subdev_selection != node.has_subdev_fmt)
+					fail("VIDIOC_SUBDEV_G/S_SELECTION: fmt/selection mismatch\n");
 			}
-			if (node.has_subdev_enum_code && node.has_subdev_enum_code < 3)
-				fail("VIDIOC_SUBDEV_ENUM_MBUS_CODE: try/active mismatch\n");
-			if (node.has_subdev_enum_fsize && node.has_subdev_enum_fsize < 3)
-				fail("VIDIOC_SUBDEV_ENUM_FRAME_SIZE: try/active mismatch\n");
-			if (node.has_subdev_enum_fival && node.has_subdev_enum_fival < 3)
-				fail("VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: try/active mismatch\n");
-			if (node.has_subdev_fmt && node.has_subdev_fmt < 3)
-				fail("VIDIOC_SUBDEV_G/S_FMT: try/active mismatch\n");
-			if (node.has_subdev_selection && node.has_subdev_selection < 3)
-				fail("VIDIOC_SUBDEV_G/S_SELECTION: try/active mismatch\n");
-			if (node.has_subdev_selection &&
-			    node.has_subdev_selection != node.has_subdev_fmt)
-				fail("VIDIOC_SUBDEV_G/S_SELECTION: fmt/selection mismatch\n");
 			printf("\n");
 		}
 	}
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 88b792cd..0cd43980 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -371,10 +371,10 @@ int testDecoder(struct node *node);
 
 // SubDev ioctl tests
 int testSubDevCap(struct node *node);
-int testSubDevEnum(struct node *node, unsigned which, unsigned pad);
-int testSubDevFormat(struct node *node, unsigned which, unsigned pad);
-int testSubDevSelection(struct node *node, unsigned which, unsigned pad);
-int testSubDevFrameInterval(struct node *node, unsigned pad);
+int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned stream);
+int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream);
+int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream);
+int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream);
 
 // Buffer ioctl tests
 int testReqBufs(struct node *node);
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 27f26576..5545b0dc 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -25,7 +25,7 @@
 
 #include "v4l2-compliance.h"
 
-#define VALID_SUBDEV_CAPS (V4L2_SUBDEV_CAP_RO_SUBDEV)
+#define VALID_SUBDEV_CAPS (V4L2_SUBDEV_CAP_RO_SUBDEV | V4L2_SUBDEV_CAP_STREAMS)
 
 int testSubDevCap(struct node *node)
 {
@@ -54,6 +54,7 @@ static int testSubDevEnumFrameInterval(struct node *node, unsigned which,
 	memset(&fie, 0, sizeof(fie));
 	fie.which = which;
 	fie.pad = pad;
+	fie.stream = 0;
 	fie.code = code;
 	fie.width = width;
 	fie.height = height;
@@ -83,6 +84,7 @@ static int testSubDevEnumFrameInterval(struct node *node, unsigned which,
 	memset(&fie, 0xff, sizeof(fie));
 	fie.which = which;
 	fie.pad = pad;
+	fie.stream = 0;
 	fie.code = code;
 	fie.width = width;
 	fie.height = height;
@@ -128,6 +130,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	memset(&fse, 0, sizeof(fse));
 	fse.which = which;
 	fse.pad = pad;
+	fse.stream = 0;
 	fse.code = code;
 	ret = doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse);
 	node->has_subdev_enum_fsize |= (ret != ENOTTY) << which;
@@ -137,6 +140,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 		memset(&fie, 0, sizeof(fie));
 		fie.which = which;
 		fie.pad = pad;
+		fie.stream = 0;
 		fie.code = code;
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY);
 		return ret;
@@ -152,6 +156,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	memset(&fse, 0xff, sizeof(fse));
 	fse.which = which;
 	fse.pad = pad;
+	fse.stream = 0;
 	fse.code = code;
 	fse.index = 0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse));
@@ -195,7 +200,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	return 0;
 }
 
-int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
+int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_mbus_code_enum mbus_core_enum;
 	unsigned num_codes;
@@ -204,6 +209,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 	memset(&mbus_core_enum, 0, sizeof(mbus_core_enum));
 	mbus_core_enum.which = which;
 	mbus_core_enum.pad = pad;
+	mbus_core_enum.stream = stream;
 	ret = doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_enum);
 	node->has_subdev_enum_code |= (ret != ENOTTY) << which;
 	if (ret == ENOTTY) {
@@ -214,8 +220,10 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 		memset(&fie, 0, sizeof(fie));
 		fse.which = which;
 		fse.pad = pad;
+		fse.stream = stream;
 		fie.which = which;
 		fie.pad = pad;
+		fie.stream = stream;
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse) != ENOTTY);
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY);
 		return ret;
@@ -226,16 +234,19 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 	mbus_core_enum.index = ~0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_enum) != EINVAL);
 	mbus_core_enum.pad = node->entity.pads;
+	mbus_core_enum.stream = stream;
 	mbus_core_enum.index = 0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_enum) != EINVAL);
 	memset(&mbus_core_enum, 0xff, sizeof(mbus_core_enum));
 	mbus_core_enum.which = which;
 	mbus_core_enum.pad = pad;
+	mbus_core_enum.stream = stream;
 	mbus_core_enum.index = 0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_enum));
 	fail_on_test(check_0(mbus_core_enum.reserved, sizeof(mbus_core_enum.reserved)));
 	fail_on_test(mbus_core_enum.code == ~0U);
 	fail_on_test(mbus_core_enum.pad != pad);
+	fail_on_test(mbus_core_enum.stream != stream);
 	fail_on_test(mbus_core_enum.index);
 	fail_on_test(mbus_core_enum.which != which);
 	do {
@@ -252,6 +263,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 		fail_on_test(!mbus_core_enum.code);
 		fail_on_test(mbus_core_enum.which != which);
 		fail_on_test(mbus_core_enum.pad != pad);
+		fail_on_test(mbus_core_enum.stream != stream);
 		fail_on_test(mbus_core_enum.index != i);
 
 		ret = testSubDevEnumFrameSize(node, which, pad, mbus_core_enum.code);
@@ -260,7 +272,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 	return 0;
 }
 
-int testSubDevFrameInterval(struct node *node, unsigned pad)
+int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_frame_interval fival;
 	struct v4l2_fract ival;
@@ -268,6 +280,7 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
 
 	memset(&fival, 0xff, sizeof(fival));
 	fival.pad = pad;
+	fival.stream = stream;
 	ret = doioctl(node, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival);
 	if (ret == ENOTTY) {
 		fail_on_test(node->enum_frame_interval_pad >= 0);
@@ -279,6 +292,7 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
 	node->frame_interval_pad = pad;
 	fail_on_test(check_0(fival.reserved, sizeof(fival.reserved)));
 	fail_on_test(fival.pad != pad);
+	fail_on_test(fival.stream != stream);
 	fail_on_test(!fival.interval.numerator);
 	fail_on_test(!fival.interval.denominator);
 	fail_on_test(fival.interval.numerator == ~0U || fival.interval.denominator == ~0U);
@@ -290,20 +304,25 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
 	}
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival));
 	fail_on_test(fival.pad != pad);
+	fail_on_test(fival.stream != stream);
 	fail_on_test(ival.numerator != fival.interval.numerator);
 	fail_on_test(ival.denominator != fival.interval.denominator);
 	fail_on_test(check_0(fival.reserved, sizeof(fival.reserved)));
 	memset(&fival, 0, sizeof(fival));
 	fival.pad = pad;
+	fival.stream = stream;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival));
 	fail_on_test(fival.pad != pad);
+	fail_on_test(fival.stream != stream);
 	fail_on_test(ival.numerator != fival.interval.numerator);
 	fail_on_test(ival.denominator != fival.interval.denominator);
 
 	fival.pad = node->entity.pads;
+	fival.stream = stream;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival) != EINVAL);
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival) != EINVAL);
 	fival.pad = pad;
+	fival.stream = stream;
 	fival.interval = ival;
 	fival.interval.numerator = 0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival));
@@ -340,7 +359,7 @@ static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt)
 	return 0;
 }
 
-int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
+int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_format fmt;
 	struct v4l2_subdev_format s_fmt;
@@ -349,6 +368,7 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.which = which;
 	fmt.pad = pad;
+	fmt.stream = stream;
 	ret = doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt);
 	node->has_subdev_fmt |= (ret != ENOTTY) << which;
 	if (ret == ENOTTY) {
@@ -359,14 +379,17 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt) != EINVAL);
 	fmt.which = 0;
 	fmt.pad = node->entity.pads;
+	fmt.stream = stream;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt) != EINVAL);
 	memset(&fmt, 0xff, sizeof(fmt));
 	fmt.which = which;
 	fmt.pad = pad;
+	fmt.stream = stream;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt));
 	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
 	fail_on_test(fmt.which != which);
 	fail_on_test(fmt.pad != pad);
+	fail_on_test(fmt.stream != stream);
 	fail_on_test(checkMBusFrameFmt(node, fmt.format));
 	s_fmt = fmt;
 	memset(s_fmt.reserved, 0xff, sizeof(s_fmt.reserved));
@@ -379,6 +402,7 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
 	fail_on_test(ret && ret != ENOTTY);
 	fail_on_test(s_fmt.which != which);
 	fail_on_test(s_fmt.pad != pad);
+	fail_on_test(s_fmt.stream != stream);
 	if (ret) {
 		warn("VIDIOC_SUBDEV_G_FMT is supported but not VIDIOC_SUBDEV_S_FMT\n");
 		return 0;
@@ -423,7 +447,7 @@ static target_info targets[] = {
 	{ ~0U },
 };
 
-int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
+int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_selection sel;
 	struct v4l2_subdev_selection s_sel;
@@ -435,10 +459,12 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 	targets[V4L2_SEL_TGT_NATIVE_SIZE].readonly = is_sink;
 	memset(&crop, 0, sizeof(crop));
 	crop.pad = pad;
+	crop.stream = stream;
 	crop.which = which;
 	memset(&sel, 0, sizeof(sel));
 	sel.which = which;
 	sel.pad = pad;
+	sel.stream = stream;
 	sel.target = V4L2_SEL_TGT_CROP;
 	ret = doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel);
 	node->has_subdev_selection |= (ret != ENOTTY) << which;
@@ -451,6 +477,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 	fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
 	fail_on_test(crop.which != which);
 	fail_on_test(crop.pad != pad);
+	fail_on_test(crop.stream != stream);
 	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
 
 	for (unsigned tgt = 0; targets[tgt].target != ~0U; tgt++) {
@@ -458,6 +485,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		memset(&sel, 0xff, sizeof(sel));
 		sel.which = which;
 		sel.pad = pad;
+		sel.stream = stream;
 		sel.target = tgt;
 		ret = doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel);
 		targets[tgt].found = !ret;
@@ -469,6 +497,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		fail_on_test(check_0(sel.reserved, sizeof(sel.reserved)));
 		fail_on_test(sel.which != which);
 		fail_on_test(sel.pad != pad);
+		fail_on_test(sel.stream != stream);
 		fail_on_test(sel.target != tgt);
 		fail_on_test(!sel.r.width);
 		fail_on_test(sel.r.width == ~0U);
@@ -480,9 +509,11 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel) != EINVAL);
 		sel.which = 0;
 		sel.pad = node->entity.pads;
+		sel.stream = stream;
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel) != EINVAL);
 		sel.which = which;
 		sel.pad = pad;
+		sel.stream = stream;
 		s_sel = sel;
 		memset(s_sel.reserved, 0xff, sizeof(s_sel.reserved));
 		ret = doioctl(node, VIDIOC_SUBDEV_S_SELECTION, &s_sel);
@@ -496,6 +527,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 				fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
 				fail_on_test(crop.which != which);
 				fail_on_test(crop.pad != pad);
+				fail_on_test(crop.stream != stream);
 				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
 			}
 		}
@@ -504,6 +536,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		fail_on_test(!ret && targets[tgt].readonly);
 		fail_on_test(s_sel.which != which);
 		fail_on_test(s_sel.pad != pad);
+		fail_on_test(s_sel.stream != stream);
 		if (ret && !targets[tgt].readonly && tgt != V4L2_SEL_TGT_NATIVE_SIZE)
 			warn("VIDIOC_SUBDEV_G_SELECTION is supported for target %u but not VIDIOC_SUBDEV_S_SELECTION\n", tgt);
 		if (ret)

-- 
2.34.1

