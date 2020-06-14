Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3050C1F8BAA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgFOABa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728201AbgFOAB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AE96213F;
        Mon, 15 Jun 2020 02:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179242;
        bh=cynCEWpPq1oBmoKoPcvIp/beW1c4KZQRGqpU1f9VrzE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L/vLBC/vY+BGGDvZh7v/uXDbrjs118IaFcE5NhNi+k5LtTlzuPB4n3uKXUpZ3Ney0
         jMlHpmp+G7VAgymzN/08z8NoJmxLCeSEpmJFSy0gbYRmwd2wc95MbXtQv5dQRN72ys
         VzQ6hv/CxqAK7r7R3MzHkt2u4UilxCDfN75ecQJ8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 069/107] media: ti-vpe: cal: Read hardware revision earlier during probe
Date:   Mon, 15 Jun 2020 02:59:06 +0300
Message-Id: <20200614235944.17716-70-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read the hardware revision and info right after allocating resources, as
there's no need to delay doing so until all initialization is complete.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 6655c0051ccc..33a985300045 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2401,6 +2401,15 @@ static int cal_probe(struct platform_device *pdev)
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
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i) {
 		cal->phy[i] = cal_camerarx_create(cal, i);
@@ -2425,24 +2434,14 @@ static int cal_probe(struct platform_device *pdev)
 		goto error_media;
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
+error_context:
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
 		if (ctx)
@@ -2456,6 +2455,9 @@ static int cal_probe(struct platform_device *pdev)
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

