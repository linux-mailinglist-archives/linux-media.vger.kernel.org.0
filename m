Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46911F8BA6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbgFOABZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgFOABW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:22 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDA9A215A;
        Mon, 15 Jun 2020 02:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179239;
        bh=ngoKVgzG1YWkamn52gYjpUUxtJQHRCl6El5wgthJpaI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rlFzuAw060oI0AUhZgPt0pc315tvt2wmMq6kZBRG91Ip0sAchBFTK7/D4DPrStf/H
         4jhxebUU7gF33Ht5CRjv+O+fptplbnCsZMcCaUIpzMBa4mXhqPJ5fDuDcU0jV0Z4Uc
         JQ7t7gqSCzwV/5JcpaLtuYbKXIYQ/Bg3MS/zior8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 062/107] media: ti-vpe: cal: Replace context with phy in async notifier entries
Date:   Mon, 15 Jun 2020 02:58:59 +0300
Message-Id: <20200614235944.17716-63-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The async notifier is meant to bind to subdevs connected to the CSI-2
ports. Those ports are modelled by the CAMERARX phy instances. To
prepare for additional decoupling of contexts and phys, make the
notifier operate on phys. We still initialize and register the context
V4L2 support in the async notifier complete operation as that's our
signal that the userspace API is ready to be exposed.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 1c9a0369d025..d551f1d9895b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2101,7 +2101,7 @@ static void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
 
 struct cal_v4l2_async_subdev {
 	struct v4l2_async_subdev asd;
-	struct cal_ctx *ctx;
+	struct cal_camerarx *phy;
 };
 
 static inline struct cal_v4l2_async_subdev *
@@ -2114,16 +2114,16 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
 				    struct v4l2_subdev *subdev,
 				    struct v4l2_async_subdev *asd)
 {
-	struct cal_ctx *ctx = to_cal_asd(asd)->ctx;
+	struct cal_camerarx *phy = to_cal_asd(asd)->phy;
 
-	if (ctx->phy->sensor) {
-		ctx_info(ctx, "Rejecting subdev %s (Already set!!)",
+	if (phy->sensor) {
+		phy_info(phy, "Rejecting subdev %s (Already set!!)",
 			 subdev->name);
 		return 0;
 	}
 
-	ctx->phy->sensor = subdev;
-	ctx_dbg(1, ctx, "Using sensor %s for capture\n", subdev->name);
+	phy->sensor = subdev;
+	phy_dbg(1, phy, "Using sensor %s for capture\n", subdev->name);
 
 	return 0;
 }
@@ -2163,27 +2163,27 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 	v4l2_async_notifier_init(&cal->notifier);
 	cal->notifier.ops = &cal_async_notifier_ops;
 
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-		struct cal_ctx *ctx = cal->ctx[i];
+	for (i = 0; i < ARRAY_SIZE(cal->phy); ++i) {
+		struct cal_camerarx *phy = cal->phy[i];
 		struct cal_v4l2_async_subdev *casd;
 		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *fwnode;
 
-		if (!ctx)
+		if (!phy)
 			continue;
 
-		fwnode = of_fwnode_handle(ctx->phy->sensor_node);
+		fwnode = of_fwnode_handle(phy->sensor_node);
 		asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
 							    fwnode,
 							    sizeof(*asd));
 		if (IS_ERR(asd)) {
-			ctx_err(ctx, "Failed to add subdev to notifier\n");
+			phy_err(phy, "Failed to add subdev to notifier\n");
 			ret = PTR_ERR(asd);
 			goto error;
 		}
 
 		casd = to_cal_asd(asd);
-		casd->ctx = ctx;
+		casd->phy = phy;
 	}
 
 	ret = v4l2_async_notifier_register(&cal->v4l2_dev, &cal->notifier);
-- 
Regards,

Laurent Pinchart

