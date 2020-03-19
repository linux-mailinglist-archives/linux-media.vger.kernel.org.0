Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1A4218AD84
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgCSHuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:46 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33278 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgCSHup (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7ogd4114045;
        Thu, 19 Mar 2020 02:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604242;
        bh=g/9shvgeOXqlaZO0ZQlp+0TnLZUEk9yDroAc3WOOoyY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Vx0dcDruqGbv5DNbEYXql5LYfsQDfp2YeMYGuRVXwomjzibomYrDTAvxh7975L1sc
         kpn/ORF8mY3pnDdZ/Uub7yrtosl2tyyvSPnhwI2ekV5V9yFcUohF7r7KDlaangd6Ah
         FCReSiV6MkAtOLIx57tmqc2CYUeY1P+9D+XWbp3I=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7ogY8129264
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:50:42 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:42 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqh047151;
        Thu, 19 Mar 2020 02:50:41 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 04/19] media: ti-vpe: cal: use runtime_resume for errata handling
Date:   Thu, 19 Mar 2020 09:50:08 +0200
Message-ID: <20200319075023.22151-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319075023.22151-1-tomi.valkeinen@ti.com>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to do errata handling every time CAL is being enabled. The code
is currently in cal_runtime_get(), which is not the correct place for
it.

Move the code to cal_runtime_resume, which is called every time CAL is
enabled.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index c418296df0f8..4fe37f284b54 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -653,20 +653,7 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
 
 static int cal_runtime_get(struct cal_dev *dev)
 {
-	int r;
-
-	r = pm_runtime_get_sync(&dev->pdev->dev);
-
-	if (dev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
-		/*
-		 * Apply errata on both port eveytime we (re-)enable
-		 * the clock
-		 */
-		i913_errata(dev, 0);
-		i913_errata(dev, 1);
-	}
-
-	return r;
+	return pm_runtime_get_sync(&dev->pdev->dev);
 }
 
 static inline void cal_runtime_put(struct cal_dev *dev)
@@ -2409,11 +2396,32 @@ static const struct of_device_id cal_of_match[] = {
 MODULE_DEVICE_TABLE(of, cal_of_match);
 #endif
 
+static int cal_runtime_resume(struct device *dev)
+{
+	struct cal_dev *caldev = dev_get_drvdata(dev);
+
+	if (caldev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
+		/*
+		 * Apply errata on both port everytime we (re-)enable
+		 * the clock
+		 */
+		i913_errata(caldev, 0);
+		i913_errata(caldev, 1);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops cal_pm_ops = {
+	.runtime_resume = cal_runtime_resume,
+};
+
 static struct platform_driver cal_pdrv = {
 	.probe		= cal_probe,
 	.remove		= cal_remove,
 	.driver		= {
 		.name	= CAL_MODULE_NAME,
+		.pm	= &cal_pm_ops,
 		.of_match_table = of_match_ptr(cal_of_match),
 	},
 };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

