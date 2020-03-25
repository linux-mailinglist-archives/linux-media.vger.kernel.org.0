Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801E81927F6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgCYMQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:06 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39300 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCG0ik078490;
        Wed, 25 Mar 2020 07:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138560;
        bh=cTBRrkkOCtyyKiB5onm+WPH8Vyk6Vkq4AOUoUNY4Ruw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NF6mU7aXpaGMz4NXPqqGfv2cxv2ycFw25XMEiXITJjXJ9TgrIO6CT3YGZk+frDqXW
         C3qz1v1CBG8hVPBkXwfFW7/gmFw7AAth6pmtuo86Ibu57CrYe0KHRdNaS7g1Z0kc14
         O8sLlx2YXc5PhdY2SvZRGfCnhQ9QcgSv0/ly3pKc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCG0To096908
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:16:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:00 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm54085323;
        Wed, 25 Mar 2020 07:15:58 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 05/19] media: ti-vpe: cal: drop cal_runtime_get/put
Date:   Wed, 25 Mar 2020 14:14:56 +0200
Message-ID: <20200325121510.25923-6-tomi.valkeinen@ti.com>
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

Now that cal_runtime_get and cal_runtime_put are only direct wrappers to
pm_runtime_get/put, we can drop cal_runtime_get and cal_runtime_put.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 4fe37f284b54..4f9dee3474ba 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -651,16 +651,6 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
 	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);
 }
 
-static int cal_runtime_get(struct cal_dev *dev)
-{
-	return pm_runtime_get_sync(&dev->pdev->dev);
-}
-
-static inline void cal_runtime_put(struct cal_dev *dev)
-{
-	pm_runtime_put_sync(&dev->pdev->dev);
-}
-
 static void cal_quickdump_regs(struct cal_dev *dev)
 {
 	cal_info(dev, "CAL Registers @ 0x%pa:\n", &dev->res->start);
@@ -1666,7 +1656,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 	}
 
-	cal_runtime_get(ctx->dev);
+	pm_runtime_get_sync(&ctx->dev->pdev->dev);
 
 	csi2_ctx_config(ctx);
 	pix_proc_config(ctx);
@@ -1681,7 +1671,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret) {
 		v4l2_subdev_call(ctx->sensor, core, s_power, 0);
 		ctx_err(ctx, "stream on failed in subdev\n");
-		cal_runtime_put(ctx->dev);
+		pm_runtime_put_sync(&ctx->dev->pdev->dev);
 		goto err;
 	}
 
@@ -1761,7 +1751,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	ctx->next_frm = NULL;
 	spin_unlock_irqrestore(&ctx->slock, flags);
 
-	cal_runtime_put(ctx->dev);
+	pm_runtime_put_sync(&ctx->dev->pdev->dev);
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -2316,14 +2306,14 @@ static int cal_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	ret = cal_runtime_get(dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret)
 		goto runtime_disable;
 
 	/* Just check we can actually access the module */
 	cal_get_hwinfo(dev);
 
-	cal_runtime_put(dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 
@@ -2351,7 +2341,7 @@ static int cal_remove(struct platform_device *pdev)
 
 	cal_dbg(1, dev, "Removing %s\n", CAL_MODULE_NAME);
 
-	cal_runtime_get(dev);
+	pm_runtime_get_sync(&pdev->dev);
 
 	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
 		ctx = dev->ctx[i];
@@ -2367,7 +2357,7 @@ static int cal_remove(struct platform_device *pdev)
 		}
 	}
 
-	cal_runtime_put(dev);
+	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

