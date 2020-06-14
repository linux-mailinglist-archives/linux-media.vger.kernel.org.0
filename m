Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798521F8BA5
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgFOABX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbgFOABV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:21 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 614D82158;
        Mon, 15 Jun 2020 02:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179238;
        bh=sQjsUJmNF22btEKo+UQLWtpe3aeVbh0lFZtJnhL/Tm0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P4InYXzM8bGgxkAjaDp1UamV2pJ3wyrrAgCQf6Ct5x/r1x30oIdLjDPGzPnvubZcH
         6Il5ZinsQ3NbXggx8F+hBtXX4GUH99oUITIh0aSErWSRTJnl9e2Zsgfpv79A0fkDVW
         iFzxma43B6UHJcbYWuf6q2eJappwg3CyJQ2ncNLA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 061/107] media: ti-vpe: cal: Move async notifiers from contexts to cal_dev
Date:   Mon, 15 Jun 2020 02:58:58 +0300
Message-Id: <20200614235944.17716-62-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to create one async notifier per CAL context. Merge them
all in a single notifier, stored in cal_dev.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 119 +++++++++++++++++-----------
 1 file changed, 72 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 0ae88f3593c6..1c9a0369d025 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -292,6 +292,7 @@ struct cal_dev {
 	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
 
 	struct v4l2_device	v4l2_dev;
+	struct v4l2_async_notifier notifier;
 };
 
 /*
@@ -300,7 +301,6 @@ struct cal_dev {
 struct cal_ctx {
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct video_device	vdev;
-	struct v4l2_async_notifier notifier;
 
 	struct cal_dev		*cal;
 	struct cal_camerarx	*phy;
@@ -336,11 +336,6 @@ struct cal_ctx {
 	bool dma_act;
 };
 
-static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
-{
-	return container_of(n, struct cal_ctx, notifier);
-}
-
 /* ------------------------------------------------------------------
  *	Platform Data
  * ------------------------------------------------------------------
@@ -2115,9 +2110,9 @@ to_cal_asd(struct v4l2_async_subdev *asd)
 	return container_of(asd, struct cal_v4l2_async_subdev, asd);
 }
 
-static int cal_async_bound(struct v4l2_async_notifier *notifier,
-			   struct v4l2_subdev *subdev,
-			   struct v4l2_async_subdev *asd)
+static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *subdev,
+				    struct v4l2_async_subdev *asd)
 {
 	struct cal_ctx *ctx = to_cal_asd(asd)->ctx;
 
@@ -2130,52 +2125,84 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 	ctx->phy->sensor = subdev;
 	ctx_dbg(1, ctx, "Using sensor %s for capture\n", subdev->name);
 
-	return cal_ctx_v4l2_init_formats(ctx);
+	return 0;
 }
 
-static int cal_async_complete(struct v4l2_async_notifier *notifier)
+static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
 {
-	struct cal_ctx *ctx = notifier_to_ctx(notifier);
+	struct cal_dev *cal = container_of(notifier, struct cal_dev, notifier);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+		struct cal_ctx *ctx = cal->ctx[i];
+
+		if (!ctx)
+			continue;
+
+		ret = cal_ctx_v4l2_init_formats(ctx);
+		if (ret)
+			continue;
+
+		cal_ctx_v4l2_register(ctx);
+	}
 
-	cal_ctx_v4l2_register(ctx);
 	return 0;
 }
 
-static const struct v4l2_async_notifier_operations cal_async_ops = {
-	.bound = cal_async_bound,
-	.complete = cal_async_complete,
+static const struct v4l2_async_notifier_operations cal_async_notifier_ops = {
+	.bound = cal_async_notifier_bound,
+	.complete = cal_async_notifier_complete,
 };
 
-static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
+static int cal_async_notifier_register(struct cal_dev *cal)
 {
-	struct cal_v4l2_async_subdev *casd;
-	struct v4l2_async_subdev *asd;
-	struct fwnode_handle *fwnode;
+	unsigned int i;
 	int ret;
 
-	v4l2_async_notifier_init(&ctx->notifier);
-	ctx->notifier.ops = &cal_async_ops;
-
-	fwnode = of_fwnode_handle(ctx->phy->sensor_node);
-	asd = v4l2_async_notifier_add_fwnode_subdev(&ctx->notifier, fwnode,
-						    sizeof(*asd));
-	if (IS_ERR(asd)) {
-		ctx_err(ctx, "Failed to add subdev to notifier\n");
-		return PTR_ERR(asd);
+	v4l2_async_notifier_init(&cal->notifier);
+	cal->notifier.ops = &cal_async_notifier_ops;
+
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+		struct cal_ctx *ctx = cal->ctx[i];
+		struct cal_v4l2_async_subdev *casd;
+		struct v4l2_async_subdev *asd;
+		struct fwnode_handle *fwnode;
+
+		if (!ctx)
+			continue;
+
+		fwnode = of_fwnode_handle(ctx->phy->sensor_node);
+		asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
+							    fwnode,
+							    sizeof(*asd));
+		if (IS_ERR(asd)) {
+			ctx_err(ctx, "Failed to add subdev to notifier\n");
+			ret = PTR_ERR(asd);
+			goto error;
+		}
+
+		casd = to_cal_asd(asd);
+		casd->ctx = ctx;
 	}
 
-	casd = to_cal_asd(asd);
-	casd->ctx = ctx;
-
-	ret = v4l2_async_notifier_register(&ctx->cal->v4l2_dev,
-					   &ctx->notifier);
+	ret = v4l2_async_notifier_register(&cal->v4l2_dev, &cal->notifier);
 	if (ret) {
-		ctx_err(ctx, "Error registering async notifier\n");
-		v4l2_async_notifier_cleanup(&ctx->notifier);
-		return ret;
+		cal_err(cal, "Error registering async notifier\n");
+		goto error;
 	}
 
 	return 0;
+
+error:
+	v4l2_async_notifier_cleanup(&cal->notifier);
+	return ret;
+}
+
+static void cal_async_notifier_unregister(struct cal_dev *cal)
+{
+	v4l2_async_notifier_unregister(&cal->notifier);
+	v4l2_async_notifier_cleanup(&cal->notifier);
 }
 
 /* ------------------------------------------------------------------
@@ -2201,10 +2228,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	if (ret)
 		return NULL;
 
-	ret = of_cal_create_instance(ctx, inst);
-	if (ret)
-		return NULL;
-
 	return ctx;
 }
 
@@ -2336,6 +2359,11 @@ static int cal_probe(struct platform_device *pdev)
 	cal_get_hwinfo(cal);
 	pm_runtime_put_sync(&pdev->dev);
 
+	/* Register the async notifier. */
+	ret = cal_async_notifier_register(cal);
+	if (ret)
+		goto error_pm_runtime;
+
 	return 0;
 
 error_pm_runtime:
@@ -2344,11 +2372,8 @@ static int cal_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
-		if (ctx) {
-			v4l2_async_notifier_unregister(&ctx->notifier);
-			v4l2_async_notifier_cleanup(&ctx->notifier);
+		if (ctx)
 			cal_ctx_v4l2_cleanup(ctx);
-		}
 	}
 
 error_v4l2:
@@ -2371,6 +2396,8 @@ static int cal_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 
+	cal_async_notifier_unregister(cal);
+
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
 		if (ctx) {
@@ -2378,8 +2405,6 @@ static int cal_remove(struct platform_device *pdev)
 				video_device_node_name(&ctx->vdev));
 			cal_ctx_v4l2_unregister(ctx);
 			cal_camerarx_disable(ctx->phy);
-			v4l2_async_notifier_unregister(&ctx->notifier);
-			v4l2_async_notifier_cleanup(&ctx->notifier);
 			cal_ctx_v4l2_cleanup(ctx);
 		}
 	}
-- 
Regards,

Laurent Pinchart

