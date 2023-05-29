Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0F171469F
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 10:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjE2IvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 04:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjE2IvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 04:51:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FB8106
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 01:50:55 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DFDBDE1;
        Mon, 29 May 2023 10:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685350229;
        bh=ux2I5k2QzA19ZJBRsB/w84Qns4Rsy75REDsNv8u3aLE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gPGW7tjfRUzT2btQIQ9gnIcOnxDWIBTx588/k6/VYO9KrK+qlgeDp1Oun5afZd+ft
         wLGgJbN/GndGy1kW+x/zKUnwI/+7/8GogwMGAw7azUWF1LJSWrICDVXeIHUuKxmq1K
         1q8+nqG1YrB1WWV8hMTFaGC46gQV0NB8SCG7f2ys=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 4/7] v4l2-ctl/compliance: Add simple routing test
Date:   Mon, 29 May 2023 11:50:00 +0300
Message-Id: <20230529085003.47207-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
References: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a very simple test for
VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.

We can't (at least at the moment) really know here what kind of routings
the driver would accept, but we can test a VIDIOC_SUBDEV_G_ROUTING call,
followed by a VIDIOC_SUBDEV_S_ROUTING call with the routing we
received.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp   | 12 ++++++++++++
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 16 ++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index d7c10482..f082f569 100644
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
index 07192bda..962d9244 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -551,3 +551,19 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
 
 	return have_sel ? 0 : ENOTTY;
 }
+
+int testSubDevRouting(struct node *node, unsigned which)
+{
+	struct v4l2_subdev_routing routing = {};
+	struct v4l2_subdev_route routes[256] = {};
+
+	routing.which = which;
+	routing.routes = (__u64)&routes;
+	routing.num_routes = 256;
+
+	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
+
+	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
+
+	return 0;
+}
-- 
2.34.1

