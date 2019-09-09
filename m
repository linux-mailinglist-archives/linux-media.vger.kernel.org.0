Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21740ADD10
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389588AbfIIQZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:25:54 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49126 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389577AbfIIQZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:25:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GPpAD070397;
        Mon, 9 Sep 2019 11:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046351;
        bh=ZUNgq9Kc07s4hJ1BQZTNPqbFYkBH7lGyGY7xvKH4+OU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rUn5IfzU1qUcKQd82OgL90VTwjR0uDLp2WAOzdIdp8ow7+yxERaX+1o2OR7istcbV
         Flq2Dq8YD3RatPoenXTIruDe1f5NU/BT+AVI8uk/8c6osGoPe48ueFBiXazO6kyVvn
         LdJkd+gOOvm901IuPnBchH5/2r8rhXfn95NHsOyI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GPpOD026755
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 11:25:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:25:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:25:51 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoP056522;
        Mon, 9 Sep 2019 11:25:51 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 01/13] media: am437x-vpfe: Fix suspend path to always handle pinctrl config
Date:   Mon, 9 Sep 2019 11:27:31 -0500
Message-ID: <20190909162743.30114-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
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
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 44 ++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 2b42ba1f5949..ab959d61f9c9 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2653,22 +2653,22 @@ static int vpfe_suspend(struct device *dev)
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
 
-	/* if streaming has not started we don't care */
-	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
-		return 0;
+	/* only do full suspend if streaming has started */
+	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
 
-	pm_runtime_get_sync(dev);
-	vpfe_config_enable(ccdc, 1);
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
@@ -2710,19 +2710,19 @@ static int vpfe_resume(struct device *dev)
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
 
-	/* if streaming has not started we don't care */
-	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
-		return 0;
+	/* only do full resume if streaming has started */
+	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
 
-	/* Enable both master and slave clock */
-	pm_runtime_get_sync(dev);
-	vpfe_config_enable(ccdc, 1);
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

