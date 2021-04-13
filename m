Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0308135E5E0
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347512AbhDMSE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:28 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:27673 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343920AbhDMSEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:24 -0400
X-Halon-ID: a132f1c5-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a132f1c5-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:03 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 04/11] rcar-vin: Improve reuse of parallel notifier
Date:   Tue, 13 Apr 2021 20:02:46 +0200
Message-Id: <20210413180253.2575451-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for adding a new media graph layout move the code reuse
of the parallel notifier setup from probe directly to the current media
graph initialization function. This is needed as there will be no
parallel interface in the new graph layout.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 48 ++++++++++-----------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index da23d55aa72b7f0d..81574bf33116ad59 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -702,9 +702,8 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 	if (ret)
 		return ret;
 
-	/* If using mc, it's fine not to have any input registered. */
 	if (!vin->parallel.asd)
-		return vin->info->use_mc ? 0 : -ENODEV;
+		return -ENODEV;
 
 	vin_dbg(vin, "Found parallel subdevice %pOF\n",
 		to_of_node(vin->parallel.asd->match.fwnode));
@@ -955,11 +954,9 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 
 static void rvin_csi2_cleanup(struct rvin_dev *vin)
 {
-	if (!vin->info->use_mc)
-		return;
-
 	rvin_group_notifier_cleanup(vin);
 	rvin_group_put(vin);
+	rvin_free_controls(vin);
 }
 
 static int rvin_csi2_init(struct rvin_dev *vin)
@@ -979,11 +976,18 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret)
 		goto err_controls;
 
-	ret = rvin_mc_parse_of_graph(vin);
-	if (ret)
+	/* It's OK to not have a parallel subdevice. */
+	ret = rvin_parallel_init(vin);
+	if (ret && ret != -ENODEV)
 		goto err_group;
 
+	ret = rvin_mc_parse_of_graph(vin);
+	if (ret)
+		goto err_parallel;
+
 	return 0;
+err_parallel:
+	rvin_parallel_cleanup(vin);
 err_group:
 	rvin_group_put(vin);
 err_controls:
@@ -1469,27 +1473,20 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
-	if (vin->info->use_mc) {
+	if (vin->info->use_mc)
 		ret = rvin_csi2_init(vin);
-		if (ret)
-			goto error_dma_unregister;
-	}
+	else
+		ret = rvin_parallel_init(vin);
 
-	ret = rvin_parallel_init(vin);
-	if (ret)
-		goto error_group_unregister;
+	if (ret) {
+		rvin_dma_unregister(vin);
+		return ret;
+	}
 
 	pm_suspend_ignore_children(&pdev->dev, true);
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-error_group_unregister:
-	rvin_free_controls(vin);
-	rvin_csi2_cleanup(vin);
-error_dma_unregister:
-	rvin_dma_unregister(vin);
-
-	return ret;
 }
 
 static int rcar_vin_remove(struct platform_device *pdev)
@@ -1500,11 +1497,10 @@ static int rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	rvin_parallel_cleanup(vin);
-
-	rvin_csi2_cleanup(vin);
-
-	rvin_free_controls(vin);
+	if (vin->info->use_mc)
+		rvin_csi2_cleanup(vin);
+	else
+		rvin_parallel_cleanup(vin);
 
 	rvin_dma_unregister(vin);
 
-- 
2.31.1

