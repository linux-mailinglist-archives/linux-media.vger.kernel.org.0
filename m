Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42B9426B7C
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 15:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241543AbhJHNMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 09:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhJHNMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 09:12:52 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC54C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 06:10:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:504a:c805:3148:c0be:5fdf])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 475BD8018E;
        Fri,  8 Oct 2021 15:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1633698655;
        bh=xLIEoTYo641+w+duY9sTqTWmgeMa8Zw3ILj0mM/r2pI=;
        h=From:To:Cc:Subject:Date:From;
        b=EGJoyenasBBZDZuk/W9Ri93JD2x4vUb64QToy6F6sqlg6imh9AdiMiKFZjTqXnwKm
         WONosl+Bi05U7MybGptfqmeNmYdOpKTLOJHGWiE733EG8WkWaQ++5luWe0U/b9cVWi
         zbwddGzicuneRnR3pQtcAsk7zJmJDwn3BG+jboyFxke4ERJars0YWnnkJFE6hFDuh5
         gqP/O7+d5vF9+3KRzu6TW5+7Uhaprha5lSJ24Q7s/bN87oN3dX+TXgP+pHQrtDOIyF
         FWL59z2uDTsBiBlIDido7yFDJA5FgD2IALQa8d8ACc9BobCPAxg+/cmN5Q7f2rePVK
         tyEZcZBHRU1tg==
From:   Fabio Estevam <festevam@denx.de>
To:     p.zabel@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 1/2] media: imx-pxp: Initialize the spinlock prior to using it
Date:   Fri,  8 Oct 2021 10:10:14 -0300
Message-Id: <20211008131015.3303915-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After devm_request_threaded_irq() is called there is a chance that an
interrupt may occur before the spinlock is initialized, which will trigger
a kernel oops.

To prevent that, move the initialization of the spinlock prior to
requesting the interrupts.

Fixes: 51abcf7fdb70 ("media: imx-pxp: add i.MX Pixel Pipeline driver")
Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v3:
- None. Just made it part of a series.

 drivers/media/platform/imx-pxp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index 723b096fedd1..b7174778db53 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -1659,6 +1659,8 @@ static int pxp_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	spin_lock_init(&dev->irqlock);
+
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
 			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
 	if (ret < 0) {
@@ -1676,8 +1678,6 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	spin_lock_init(&dev->irqlock);
-
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret)
 		goto err_clk;
-- 
2.25.1

