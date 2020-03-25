Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBB21927F5
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgCYMQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60938 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFxV9012937;
        Wed, 25 Mar 2020 07:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138559;
        bh=N05zgg4Sh4fmyfWz3z1buQNniicw8t02htoHXgY6qK0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CEl42kteC+q5tWq5sk1wYe5bzqNGaBy6KhhCjY7/tSpEAoiTpiGLrsjFImpR7Jnnw
         q248kS2AsLezjSr9Fr9/XPx6+q+dk+tE5xChLgeuN+gDdoTj29njsNHGjReh28+VMm
         QdRikUnvyJspKr67MHlOpQKQ2dG/jVnTV5UCosjU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCFxDA096857
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:15:59 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:15:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:15:58 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm53085323;
        Wed, 25 Mar 2020 07:15:57 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 04/19] media: ti-vpe: cal: use runtime_resume for errata handling
Date:   Wed, 25 Mar 2020 14:14:55 +0200
Message-ID: <20200325121510.25923-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325121510.25923-1-tomi.valkeinen@ti.com>
References: <20200325121510.25923-1-tomi.valkeinen@ti.com>
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
Reviewed-by: Benoit Parrot <bparrot@ti.com>
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

