Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9026A215EB5
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729981AbgGFSih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbgGFSig (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:36 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E0B01968;
        Mon,  6 Jul 2020 20:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060694;
        bh=fncyAv9+/Otyo9caEMqPS2EWO1WCNDqQiOaEvbDwMM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uixWKEV7VH5dGSyhBUxCiqDR0CSXbQkHuTspAZ0EtE+X1q6cuKR5DAbtm6Rv+OA8h
         QfhzSJ5LRkjh5K+yr83pvGwOFOga6W2JzxmjArJmanDSmoLneRP+6LniaHrlnorJBW
         duA9QTv0EoeoZJmZhPsN4cVz8M7Mo2YoDiLLfkRs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 070/108] media: ti-vpe: cal: Read hardware revision earlier during probe
Date:   Mon,  6 Jul 2020 21:36:31 +0300
Message-Id: <20200706183709.12238-71-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read the hardware revision and info right after allocating resources, as
there's no need to delay doing so until all initialization is complete.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 340cbf385d42..fca591a94aca 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2408,6 +2408,15 @@ static int cal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Read the revision and hardware info to verify hardware access. */
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret)
+		goto error_pm_runtime;
+
+	cal_get_hwinfo(cal);
+	pm_runtime_put_sync(&pdev->dev);
+
 	/* Create CAMERARX PHYs. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		cal->phy[i] = cal_camerarx_create(cal, i);
@@ -2445,25 +2454,13 @@ static int cal_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Read the revision and hardware info to verify hardware access. */
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret)
-		goto error_pm_runtime;
-
-	cal_get_hwinfo(cal);
-	pm_runtime_put_sync(&pdev->dev);
-
 	/* Register the media device. */
 	ret = cal_media_register(cal);
 	if (ret)
-		goto error_pm_runtime;
+		goto error_context;
 
 	return 0;
 
-error_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
 error_context:
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
@@ -2477,6 +2474,9 @@ static int cal_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
+error_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+
 	return ret;
 }
 
-- 
Regards,

Laurent Pinchart

