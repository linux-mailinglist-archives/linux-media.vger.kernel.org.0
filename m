Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807E2B82B1
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392689AbfISUj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:39:26 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47438 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390164AbfISUjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:39:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdLBc117311;
        Thu, 19 Sep 2019 15:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925561;
        bh=9FamtOVE0t1E3ct7dOeSf1tjCva2GwFUhC+rviJoN10=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=SwS/QbAf8xThKhR+i42c6Lq7gU29I6OlbZQ1vjQQtrH/361a9isCwt7I7gjIFhLLF
         nA7bDReC5oYS231rDf6v1dq5djiOApgPjo/UBD2/CCtv5WhRIXvhc+fPo+v7NSDKZN
         AOl+7m/J4//8WddINKBDVcoFr3/d2u7WkvnvpUNE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JKdLRv002131
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 15:39:21 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:39:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:39:17 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdKIU014276;
        Thu, 19 Sep 2019 15:39:21 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 01/13] media: am437x-vpfe: Fix suspend path to always handle pinctrl config
Date:   Thu, 19 Sep 2019 15:41:13 -0500
Message-ID: <20190919204125.15254-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919204125.15254-1-bparrot@ti.com>
References: <20190919204125.15254-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Gerlach <d-gerlach@ti.com>

Currently if vpfe is not active then it returns immediately in the
suspend and resume handlers. Change this so that it always performs the
pinctrl config so that we can still get proper sleep state configuration
on the pins even if we do not need to worry about fully saving and
restoring context.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 46 ++++++++++-----------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 2b42ba1f5949..a3d22f90e64c 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2653,22 +2653,21 @@ static int vpfe_suspend(struct device *dev)
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
 
-	/* if streaming has not started we don't care */
-	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
-		return 0;
-
-	pm_runtime_get_sync(dev);
-	vpfe_config_enable(ccdc, 1);
+	/* only do full suspend if streaming has started */
+	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
+		pm_runtime_get_sync(dev);
+		vpfe_config_enable(ccdc, 1);
 
-	/* Save VPFE context */
-	vpfe_save_context(ccdc);
+		/* Save VPFE context */
+		vpfe_save_context(ccdc);
 
-	/* Disable CCDC */
-	vpfe_pcr_enable(ccdc, 0);
-	vpfe_config_enable(ccdc, 0);
+		/* Disable CCDC */
+		vpfe_pcr_enable(ccdc, 0);
+		vpfe_config_enable(ccdc, 0);
 
-	/* Disable both master and slave clock */
-	pm_runtime_put_sync(dev);
+		/* Disable both master and slave clock */
+		pm_runtime_put_sync(dev);
+	}
 
 	/* Select sleep pin state */
 	pinctrl_pm_select_sleep_state(dev);
@@ -2710,19 +2709,18 @@ static int vpfe_resume(struct device *dev)
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
 
-	/* if streaming has not started we don't care */
-	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
-		return 0;
-
-	/* Enable both master and slave clock */
-	pm_runtime_get_sync(dev);
-	vpfe_config_enable(ccdc, 1);
+	/* only do full resume if streaming has started */
+	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
+		/* Enable both master and slave clock */
+		pm_runtime_get_sync(dev);
+		vpfe_config_enable(ccdc, 1);
 
-	/* Restore VPFE context */
-	vpfe_restore_context(ccdc);
+		/* Restore VPFE context */
+		vpfe_restore_context(ccdc);
 
-	vpfe_config_enable(ccdc, 0);
-	pm_runtime_put_sync(dev);
+		vpfe_config_enable(ccdc, 0);
+		pm_runtime_put_sync(dev);
+	}
 
 	/* Select default pin state */
 	pinctrl_pm_select_default_state(dev);
-- 
2.17.1

