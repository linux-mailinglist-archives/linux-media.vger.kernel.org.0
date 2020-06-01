Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701411EAF86
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 21:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgFATWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 15:22:02 -0400
Received: from v6.sk ([167.172.42.174]:45480 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbgFATWB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jun 2020 15:22:01 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id D5A2761306;
        Mon,  1 Jun 2020 19:21:29 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [RESEND 2 PATCH] media: marvell-ccic: Add support for runtime PM
Date:   Mon,  1 Jun 2020 21:21:24 +0200
Message-Id: <20200601192124.172650-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On MMP3, the camera block lives on na separate power island. We want to
turn it off if the CCIC is not in use to conserve power.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/media/platform/marvell-ccic/mcam-core.c  |  3 +++
 drivers/media/platform/marvell-ccic/mmp-driver.c | 12 ++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 09775b6624c6b..c2cd1d461bd06 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -24,6 +24,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/videodev2.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
@@ -901,6 +902,7 @@ static void mcam_clk_enable(struct mcam_camera *mcam)
 {
 	unsigned int i;
 
+	pm_runtime_get_sync(mcam->dev);
 	for (i = 0; i < NR_MCAM_CLK; i++) {
 		if (!IS_ERR(mcam->clk[i]))
 			clk_prepare_enable(mcam->clk[i]);
@@ -915,6 +917,7 @@ static void mcam_clk_disable(struct mcam_camera *mcam)
 		if (!IS_ERR(mcam->clk[i]))
 			clk_disable_unprepare(mcam->clk[i]);
 	}
+	pm_runtime_put(mcam->dev);
 }
 
 /* ---------------------------------------------------------------------- */
diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index 92b92255dac66..eec482d16805b 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -24,6 +24,7 @@
 #include <linux/list.h>
 #include <linux/pm.h>
 #include <linux/clk.h>
+#include <linux/pm_runtime.h>
 
 #include "mcam-core.h"
 
@@ -313,10 +314,12 @@ static int mmpcam_probe(struct platform_device *pdev)
 	cam->irq = res->start;
 	ret = devm_request_irq(&pdev->dev, cam->irq, mmpcam_irq, IRQF_SHARED,
 					"mmp-camera", mcam);
-	if (ret == 0) {
-		mmpcam_add_device(cam);
-		return 0;
-	}
+	if (ret)
+		goto out;
+
+	mmpcam_add_device(cam);
+	pm_runtime_enable(&pdev->dev);
+	return 0;
 
 out:
 	fwnode_handle_put(mcam->asd.match.fwnode);
@@ -332,6 +335,7 @@ static int mmpcam_remove(struct mmp_camera *cam)
 
 	mmpcam_remove_device(cam);
 	mccic_shutdown(mcam);
+	pm_runtime_force_suspend(mcam->dev);
 	return 0;
 }
 
-- 
2.26.2

