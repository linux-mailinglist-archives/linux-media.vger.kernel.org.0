Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4747935E5DE
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347510AbhDMSE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:26 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:27662 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245234AbhDMSEX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:23 -0400
X-Halon-ID: a0b27051-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a0b27051-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:02 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 03/11] rcar-vin: Improve async notifier cleanup paths
Date:   Tue, 13 Apr 2021 20:02:45 +0200
Message-Id: <20210413180253.2575451-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cleanup code for the async notifiers can be refactored to own
functions to reduce code duplication and improve readability. While at
it rename the CSI-2 initialization function _csi2_ instead of _mc_ to
match.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 51 ++++++++++++---------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index d4932f7b42647ee1..da23d55aa72b7f0d 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -383,6 +383,16 @@ static void rvin_group_put(struct rvin_dev *vin)
 	kref_put(&group->refcount, rvin_group_release);
 }
 
+static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
+{
+	mutex_lock(&vin->group->lock);
+	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
+		v4l2_async_notifier_unregister(&vin->group->notifier);
+		v4l2_async_notifier_cleanup(&vin->group->notifier);
+	}
+	mutex_unlock(&vin->group->lock);
+}
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -676,6 +686,12 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 	return ret;
 }
 
+static void rvin_parallel_cleanup(struct rvin_dev *vin)
+{
+	v4l2_async_notifier_unregister(&vin->notifier);
+	v4l2_async_notifier_cleanup(&vin->notifier);
+}
+
 static int rvin_parallel_init(struct rvin_dev *vin)
 {
 	int ret;
@@ -937,7 +953,16 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 	return 0;
 }
 
-static int rvin_mc_init(struct rvin_dev *vin)
+static void rvin_csi2_cleanup(struct rvin_dev *vin)
+{
+	if (!vin->info->use_mc)
+		return;
+
+	rvin_group_notifier_cleanup(vin);
+	rvin_group_put(vin);
+}
+
+static int rvin_csi2_init(struct rvin_dev *vin)
 {
 	int ret;
 
@@ -1445,7 +1470,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, vin);
 
 	if (vin->info->use_mc) {
-		ret = rvin_mc_init(vin);
+		ret = rvin_csi2_init(vin);
 		if (ret)
 			goto error_dma_unregister;
 	}
@@ -1458,20 +1483,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-
 error_group_unregister:
 	rvin_free_controls(vin);
-
-	if (vin->info->use_mc) {
-		mutex_lock(&vin->group->lock);
-		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
-			v4l2_async_notifier_unregister(&vin->group->notifier);
-			v4l2_async_notifier_cleanup(&vin->group->notifier);
-		}
-		mutex_unlock(&vin->group->lock);
-		rvin_group_put(vin);
-	}
-
+	rvin_csi2_cleanup(vin);
 error_dma_unregister:
 	rvin_dma_unregister(vin);
 
@@ -1486,14 +1500,9 @@ static int rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	v4l2_async_notifier_unregister(&vin->notifier);
-	v4l2_async_notifier_cleanup(&vin->notifier);
+	rvin_parallel_cleanup(vin);
 
-	if (vin->info->use_mc) {
-		v4l2_async_notifier_unregister(&vin->group->notifier);
-		v4l2_async_notifier_cleanup(&vin->group->notifier);
-		rvin_group_put(vin);
-	}
+	rvin_csi2_cleanup(vin);
 
 	rvin_free_controls(vin);
 
-- 
2.31.1

