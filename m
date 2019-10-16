Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6A07D8BE9
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 10:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbfJPI4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 04:56:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3779 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726968AbfJPI4n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 04:56:43 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 452EDFC2962ADAF91686;
        Wed, 16 Oct 2019 16:56:41 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 16:56:30 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mripard@kernel.org>, <paul.kocialkowski@bootlin.com>,
        <mchehab@kernel.org>, <gregkh@linuxfoundation.org>, <wens@csie.org>
CC:     <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] staging: media: cedrus: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 16 Oct 2019 16:56:04 +0800
Message-ID: <20191016085604.21076-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index a942cd9..f19b87c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -146,7 +146,6 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 int cedrus_hw_probe(struct cedrus_dev *dev)
 {
 	const struct cedrus_variant *variant;
-	struct resource *res;
 	int irq_dec;
 	int ret;
 
@@ -225,8 +224,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		goto err_sram;
 	}
 
-	res = platform_get_resource(dev->pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(dev->dev, res);
+	dev->base = devm_platform_ioremap_resource(dev->pdev, 0);
 	if (IS_ERR(dev->base)) {
 		dev_err(dev->dev, "Failed to map registers\n");
 
-- 
2.7.4


