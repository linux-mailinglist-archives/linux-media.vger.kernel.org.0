Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872BA4254DC
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 15:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241651AbhJGN6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 09:58:21 -0400
Received: from phobos.denx.de ([85.214.62.61]:59828 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241895AbhJGN6K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 09:58:10 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:504a:a293:7842:1da9:a906])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6024F80644;
        Thu,  7 Oct 2021 15:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1633614976;
        bh=43AkR0XBW3VazJuFE5kJ/6Qc8SLYasfSn53jK6dNziw=;
        h=From:To:Cc:Subject:Date:From;
        b=JdjId6pnZUBwZxnBcKubbO5/zuArmVAQ7AcQTlsXzZT3V4x8OOx+p0N3QfBo6jNHw
         EZS+bRhgYPti4O7KuKiyayLtn+BJR9KmM4eyosvdGdpGJQM0ppUEwg+Ve91D038S6k
         +w4M5nJmooMVTXi6+ElFIFaMkNqzzPq1Zz5Y66cV4R1/eFN1w8NWLMIcUnIpj5Rb44
         cR+HXhKk8Zd14vTmgrwmLBL+rtVbh0w1eTjbeq07VHOi7p4GPWS3ClE6O4LD9OZzOf
         nQQAQC6Y9baBRPbGJksRwVGzJ6NwEYwUaR90O+XfyTwYR3WKAYEILi8IFSudQZuyzc
         TYeW7BxMFF8Qw==
From:   Fabio Estevam <festevam@denx.de>
To:     p.zabel@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: imx-pxp: Initialize the spinlock prior to using it
Date:   Thu,  7 Oct 2021 10:56:01 -0300
Message-Id: <20211007135601.2068291-1-festevam@denx.de>
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
---
 drivers/media/platform/imx-pxp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index acfc77f9d58f..7d1768ec7fcd 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -1693,6 +1693,8 @@ static int pxp_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	spin_lock_init(&dev->irqlock);
+
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, pxp_irq_handler,
 			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
 	if (ret < 0) {
@@ -1710,8 +1712,6 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	spin_lock_init(&dev->irqlock);
-
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret)
 		goto err_clk;
-- 
2.25.1

