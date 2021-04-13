Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165A135E5D9
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244923AbhDMSEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:22 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:27647 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244803AbhDMSEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:21 -0400
X-Halon-ID: 9f9d3d8d-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 9f9d3d8d-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:00 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 01/11] rcar-vin: Refactor controls creation for video device
Date:   Tue, 13 Apr 2021 20:02:43 +0200
Message-Id: <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The controls for the video device are created in different code paths
depending on if the driver is using the media graph centric model (Gen3)
or the device centric model (Gen2 and earlier). This have lead to code
duplication that can be consolidated.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 82 +++++++++++----------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index cb3025992817d625..c798dc9409e4cdcd 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -405,6 +405,45 @@ static const struct v4l2_ctrl_ops rvin_ctrl_ops = {
 	.s_ctrl = rvin_s_ctrl,
 };
 
+static void rvin_free_controls(struct rvin_dev *vin)
+{
+	v4l2_ctrl_handler_free(&vin->ctrl_handler);
+	vin->vdev.ctrl_handler = NULL;
+}
+
+static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
+{
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
+	if (ret < 0)
+		return ret;
+
+	/* The VIN directly deals with alpha component. */
+	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
+			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
+
+	if (vin->ctrl_handler.error) {
+		ret = vin->ctrl_handler.error;
+		rvin_free_controls(vin);
+		return ret;
+	}
+
+	/* For the non-MC mode add controls from the subdevice. */
+	if (subdev) {
+		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
+					    subdev->ctrl_handler, NULL, true);
+		if (ret < 0) {
+			rvin_free_controls(vin);
+			return ret;
+		}
+	}
+
+	vin->vdev.ctrl_handler = &vin->ctrl_handler;
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Async notifier
  */
@@ -490,28 +529,10 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 		return ret;
 
 	/* Add the controls */
-	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
+	ret = rvin_create_controls(vin, subdev);
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
-			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
-
-	if (vin->ctrl_handler.error) {
-		ret = vin->ctrl_handler.error;
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		return ret;
-	}
-
-	ret = v4l2_ctrl_add_handler(&vin->ctrl_handler, subdev->ctrl_handler,
-				    NULL, true);
-	if (ret < 0) {
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		return ret;
-	}
-
-	vin->vdev.ctrl_handler = &vin->ctrl_handler;
-
 	vin->parallel.subdev = subdev;
 
 	return 0;
@@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
 	rvin_v4l2_unregister(vin);
 	vin->parallel.subdev = NULL;
 
-	if (!vin->info->use_mc) {
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		vin->vdev.ctrl_handler = NULL;
-	}
+	if (!vin->info->use_mc)
+		rvin_free_controls(vin);
 }
 
 static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
@@ -935,21 +954,10 @@ static int rvin_mc_init(struct rvin_dev *vin)
 	if (ret)
 		rvin_group_put(vin);
 
-	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
+	ret = rvin_create_controls(vin, NULL);
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
-			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
-
-	if (vin->ctrl_handler.error) {
-		ret = vin->ctrl_handler.error;
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		return ret;
-	}
-
-	vin->vdev.ctrl_handler = &vin->ctrl_handler;
-
 	return ret;
 }
 
@@ -1446,7 +1454,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	return 0;
 
 error_group_unregister:
-	v4l2_ctrl_handler_free(&vin->ctrl_handler);
+	rvin_free_controls(vin);
 
 	if (vin->info->use_mc) {
 		mutex_lock(&vin->group->lock);
@@ -1481,7 +1489,7 @@ static int rcar_vin_remove(struct platform_device *pdev)
 		rvin_group_put(vin);
 	}
 
-	v4l2_ctrl_handler_free(&vin->ctrl_handler);
+	rvin_free_controls(vin);
 
 	rvin_dma_unregister(vin);
 
-- 
2.31.1

