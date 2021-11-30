Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3491546367F
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237442AbhK3OVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbhK3OVs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:21:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C295EC061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 06:18:28 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D102814E2;
        Tue, 30 Nov 2021 15:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281906;
        bh=AwM+0oHI3taCscy5NtwAiNQOdtYDrGjK6QTOFHrsQsM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bfm+taox5D7q4IBXxWFQv0w1XfRRgMJg4pN6BzQuPInhHy/SBlUnhZkLFUhwArcSn
         OqLb460WHyIZIpAWLPorUejOT9b1owmClh5ceU3BRfanxGST2XPpUEHtbuefzUXz49
         1Jt2bNuvGSSbqQdhzoGcXPpFwxjqrQ2eN5kUF6bI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 4/4] v4l2-ctl/compliance: add routing and streams multiplexed streams
Date:   Tue, 30 Nov 2021 16:18:15 +0200
Message-Id: <20211130141815.892354-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add basic support for routing and streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/common/v4l2-info.cpp                  |   2 +
 utils/v4l2-compliance/v4l2-compliance.cpp   | 124 ++++++++++++++++----
 utils/v4l2-compliance/v4l2-compliance.h     |   8 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp |  43 ++++++-
 4 files changed, 143 insertions(+), 34 deletions(-)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index b8f2c865..62c61844 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -111,6 +111,8 @@ static std::string subdevcap2s(unsigned cap)
 
 	if (cap & V4L2_SUBDEV_CAP_RO_SUBDEV)
 		s += "\t\tRead-Only Sub-Device\n";
+	if (cap & V4L2_SUBDEV_CAP_MPLEXED)
+		s += "\t\tSub-Device supports Multiplexed Streams\n";
 	return s;
 }
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 0eeabb2d..e4d21efe 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1210,6 +1210,10 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	if (node.is_subdev()) {
 		bool has_source = false;
 		bool has_sink = false;
+		struct v4l2_subdev_routing sd_routing[2] = {};
+		struct v4l2_subdev_route sd_routes[2][256] = {};
+		bool has_routes = !!(subdevcap.capabilities & V4L2_SUBDEV_CAP_MPLEXED);
+		int ret;
 
 		node.frame_interval_pad = -1;
 		node.enum_frame_interval_pad = -1;
@@ -1221,6 +1225,22 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		}
 		node.is_passthrough_subdev = has_source && has_sink;
 
+		if (has_routes) {
+			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
+				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
+
+				sd_routing[which].which = which;
+				sd_routing[which].routes = (__u64)sd_routes[which];
+				sd_routing[which].num_routes = 256;
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
@@ -1230,32 +1250,86 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
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
+					    (r->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE))
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
index e73ebdd3..16caeae3 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -364,10 +364,10 @@ int testDecoder(struct node *node);
 
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
index 68f97205..f688b377 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -25,7 +25,7 @@
 
 #include "v4l2-compliance.h"
 
-#define VALID_SUBDEV_CAPS (V4L2_SUBDEV_CAP_RO_SUBDEV)
+#define VALID_SUBDEV_CAPS (V4L2_SUBDEV_CAP_RO_SUBDEV | V4L2_SUBDEV_CAP_MPLEXED)
 
 int testSubDevCap(struct node *node)
 {
@@ -53,6 +53,7 @@ static int testSubDevEnumFrameInterval(struct node *node, unsigned which,
 	memset(&fie, 0, sizeof(fie));
 	fie.which = which;
 	fie.pad = pad;
+	fie.stream = 0;
 	fie.code = code;
 	fie.width = width;
 	fie.height = height;
@@ -82,6 +83,7 @@ static int testSubDevEnumFrameInterval(struct node *node, unsigned which,
 	memset(&fie, 0xff, sizeof(fie));
 	fie.which = which;
 	fie.pad = pad;
+	fie.stream = 0;
 	fie.code = code;
 	fie.width = width;
 	fie.height = height;
@@ -127,6 +129,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	memset(&fse, 0, sizeof(fse));
 	fse.which = which;
 	fse.pad = pad;
+	fse.stream = 0;
 	fse.code = code;
 	ret = doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse);
 	node->has_subdev_enum_fsize |= (ret != ENOTTY) << which;
@@ -136,6 +139,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 		memset(&fie, 0, sizeof(fie));
 		fie.which = which;
 		fie.pad = pad;
+		fie.stream = 0;
 		fie.code = code;
 		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY);
 		return ret;
@@ -151,6 +155,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	memset(&fse, 0xff, sizeof(fse));
 	fse.which = which;
 	fse.pad = pad;
+	fse.stream = 0;
 	fse.code = code;
 	fse.index = 0;
 	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse));
@@ -194,7 +199,7 @@ static int testSubDevEnumFrameSize(struct node *node, unsigned which,
 	return 0;
 }
 
-int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
+int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_mbus_code_enum mbus_core_enum;
 	unsigned num_codes;
@@ -203,6 +208,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 	memset(&mbus_core_enum, 0, sizeof(mbus_core_enum));
 	mbus_core_enum.which = which;
 	mbus_core_enum.pad = pad;
+	mbus_core_enum.stream = stream;
 	ret = doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_enum);
 	node->has_subdev_enum_code |= (ret != ENOTTY) << which;
 	if (ret == ENOTTY) {
@@ -213,8 +219,10 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
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
@@ -225,16 +233,19 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
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
@@ -251,6 +262,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 		fail_on_test(!mbus_core_enum.code);
 		fail_on_test(mbus_core_enum.which != which);
 		fail_on_test(mbus_core_enum.pad != pad);
+		fail_on_test(mbus_core_enum.stream != stream);
 		fail_on_test(mbus_core_enum.index != i);
 
 		ret = testSubDevEnumFrameSize(node, which, pad, mbus_core_enum.code);
@@ -259,7 +271,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
 	return 0;
 }
 
-int testSubDevFrameInterval(struct node *node, unsigned pad)
+int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_frame_interval fival;
 	struct v4l2_fract ival;
@@ -267,6 +279,7 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
 
 	memset(&fival, 0xff, sizeof(fival));
 	fival.pad = pad;
+	fival.stream = stream;
 	ret = doioctl(node, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival);
 	if (ret == ENOTTY) {
 		fail_on_test(node->enum_frame_interval_pad >= 0);
@@ -278,6 +291,7 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
 	node->frame_interval_pad = pad;
 	fail_on_test(check_0(fival.reserved, sizeof(fival.reserved)));
 	fail_on_test(fival.pad != pad);
+	fail_on_test(fival.stream != stream);
 	fail_on_test(!fival.interval.numerator);
 	fail_on_test(!fival.interval.denominator);
 	fail_on_test(fival.interval.numerator == ~0U || fival.interval.denominator == ~0U);
@@ -289,20 +303,25 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
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
@@ -339,7 +358,7 @@ static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt)
 	return 0;
 }
 
-int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
+int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_format fmt;
 	struct v4l2_subdev_format s_fmt;
@@ -348,6 +367,7 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
 	memset(&fmt, 0, sizeof(fmt));
 	fmt.which = which;
 	fmt.pad = pad;
+	fmt.stream = stream;
 	ret = doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt);
 	node->has_subdev_fmt |= (ret != ENOTTY) << which;
 	if (ret == ENOTTY) {
@@ -358,14 +378,17 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
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
@@ -378,6 +401,7 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
 	fail_on_test(ret && ret != ENOTTY);
 	fail_on_test(s_fmt.which != which);
 	fail_on_test(s_fmt.pad != pad);
+	fail_on_test(s_fmt.stream != stream);
 	if (ret) {
 		warn("VIDIOC_SUBDEV_G_FMT is supported but not VIDIOC_SUBDEV_S_FMT\n");
 		return 0;
@@ -422,7 +446,7 @@ static target_info targets[] = {
 	{ ~0U },
 };
 
-int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
+int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream)
 {
 	struct v4l2_subdev_selection sel;
 	struct v4l2_subdev_selection s_sel;
@@ -434,10 +458,12 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
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
@@ -450,6 +476,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 	fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
 	fail_on_test(crop.which != which);
 	fail_on_test(crop.pad != pad);
+	fail_on_test(crop.stream != stream);
 	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
 
 	for (unsigned tgt = 0; targets[tgt].target != ~0U; tgt++) {
@@ -457,6 +484,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		memset(&sel, 0xff, sizeof(sel));
 		sel.which = which;
 		sel.pad = pad;
+		sel.stream = stream;
 		sel.target = tgt;
 		ret = doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel);
 		targets[tgt].found = !ret;
@@ -468,6 +496,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		fail_on_test(check_0(sel.reserved, sizeof(sel.reserved)));
 		fail_on_test(sel.which != which);
 		fail_on_test(sel.pad != pad);
+		fail_on_test(sel.stream != stream);
 		fail_on_test(sel.target != tgt);
 		fail_on_test(!sel.r.width);
 		fail_on_test(sel.r.width == ~0U);
@@ -479,9 +508,11 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
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
@@ -495,6 +526,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 				fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
 				fail_on_test(crop.which != which);
 				fail_on_test(crop.pad != pad);
+				fail_on_test(crop.stream != stream);
 				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
 			}
 		}
@@ -503,6 +535,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		fail_on_test(!ret && targets[tgt].readonly);
 		fail_on_test(s_sel.which != which);
 		fail_on_test(s_sel.pad != pad);
+		fail_on_test(s_sel.stream != stream);
 		if (ret && !targets[tgt].readonly && tgt != V4L2_SEL_TGT_NATIVE_SIZE)
 			warn("VIDIOC_SUBDEV_G_SELECTION is supported for target %u but not VIDIOC_SUBDEV_S_SELECTION\n", tgt);
 		if (ret)
-- 
2.25.1

