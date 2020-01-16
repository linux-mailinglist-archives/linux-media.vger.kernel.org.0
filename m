Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F6B13DDB0
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 15:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgAPOme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 09:42:34 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9179 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726084AbgAPOmd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 09:42:33 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2F2F0DC97D1261389457;
        Thu, 16 Jan 2020 22:42:30 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 16 Jan 2020
 22:42:23 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <jernej.skrabec@siol.net>, <mchehab@kernel.org>,
        <mripard@kernel.org>, <wens@csie.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] media: sun8i: Remove redundant platform_get_irq error message
Date:   Thu, 16 Jan 2020 22:36:30 +0800
Message-ID: <20200116143630.58904-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

platform_get_irq() will call dev_err() itself on failure,
so there is no need for the driver to also do this.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index b61f3de..5325a63 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -814,11 +814,8 @@ static int deinterlace_probe(struct platform_device *pdev)
 	dev->dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(dev->dev, "Failed to get IRQ\n");
-
+	if (irq <= 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(dev->dev, irq, deinterlace_irq,
 			       0, dev_name(dev->dev), dev);
-- 
2.7.4


