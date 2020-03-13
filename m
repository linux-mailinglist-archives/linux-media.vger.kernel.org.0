Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04FC7184614
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgCMLlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36972 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgCMLlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfg4q041365;
        Fri, 13 Mar 2020 06:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099702;
        bh=g5+zMFFQq8aGYl5J60LftXpLAVQfHqKzFlkEEHwvw+c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=v12ZMMS4o/E5deYbglZz7Kw5OHUJJduNtoJ93GbNh8olM4l7n9490AmlSW8Dpkg+Z
         R2f27bLpM7oHvx/U6j0SXMQrPbQt4djBk4y1w3CSlS86QCm9Sli3B9u0sPnVavxSoM
         RkVRaY+Yj4FII5j/ohKSf1nEoojWcKPu4AEQEf5Y=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBfgPU010583
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:41:42 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:42 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcok044014;
        Fri, 13 Mar 2020 06:41:40 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 02/16] media: ti-vpe: cal: use runtime_resume for errata handling
Date:   Fri, 13 Mar 2020 13:41:07 +0200
Message-ID: <20200313114121.32182-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313114121.32182-1-tomi.valkeinen@ti.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 4b584c419e98..b4a9f4d16ce4 100644
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
@@ -2397,11 +2384,32 @@ static const struct of_device_id cal_of_match[] = {
 MODULE_DEVICE_TABLE(of, cal_of_match);
 #endif
 
+static int cal_runtime_resume(struct device *dev)
+{
+	struct cal_dev *caldev = dev_get_drvdata(dev);
+
+	if (caldev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
+		/*
+		 * Apply errata on both port eveytime we (re-)enable
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

