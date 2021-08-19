Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1973E3F1D4C
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 17:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240583AbhHSPuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 11:50:19 -0400
Received: from mail.ispras.ru ([83.149.199.84]:47272 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238776AbhHSPuS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 11:50:18 -0400
Received: from kleverstation.intra.ispras.ru (unknown [10.10.2.220])
        by mail.ispras.ru (Postfix) with ESMTPS id 0E9424076273;
        Thu, 19 Aug 2021 15:49:41 +0000 (UTC)
From:   Nadezda Lutovinova <lutovinova@ispras.ru>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Nadezda Lutovinova <lutovinova@ispras.ru>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: allegro: request irq after initializing mbox_status
Date:   Thu, 19 Aug 2021 18:49:35 +0300
Message-Id: <20210819154935.19826-1-lutovinova@ispras.ru>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If IRQ occurs between calling  devm_request_threaded_irq() and
allegro_firmware_request_nowait(), then null pointer dereference
occurs since dev->mbox_status wasn't initialized yet but used
in allegro_mbox_notify(). 

The patch puts registration of the interrupt handler after
initializing of neccesery data.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>
---
 .../media/platform/allegro-dvt/allegro-core.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 887b492e4ad1..9c1997ff74e8 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3707,18 +3707,6 @@ static int allegro_probe(struct platform_device *pdev)
 		return PTR_ERR(dev->sram);
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-	ret = devm_request_threaded_irq(&pdev->dev, irq,
-					allegro_hardirq,
-					allegro_irq_thread,
-					IRQF_SHARED, dev_name(&pdev->dev), dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
-		return ret;
-	}
-
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret)
 		return ret;
@@ -3732,6 +3720,18 @@ static int allegro_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					allegro_hardirq,
+					allegro_irq_thread,
+					IRQF_SHARED, dev_name(&pdev->dev), dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.17.1

