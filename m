Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85DF5F1A11
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 16:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731952AbfKFPdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 10:33:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:5737 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728292AbfKFPdH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 10:33:07 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id A26C2B8C276769C42595;
        Wed,  6 Nov 2019 23:33:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Wed, 6 Nov 2019 23:32:58 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] media: sun8i: Remove redundant dev_err call in deinterlace_probe()
Date:   Wed, 6 Nov 2019 15:32:12 +0000
Message-ID: <20191106153213.13752-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index aaa1dc159ac2..b61f3dea7c93 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -834,11 +834,8 @@ static int deinterlace_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(dev->base)) {
-		dev_err(dev->dev, "Failed to map registers\n");
-
+	if (IS_ERR(dev->base))
 		return PTR_ERR(dev->base);
-	}
 
 	dev->bus_clk = devm_clk_get(dev->dev, "bus");
 	if (IS_ERR(dev->bus_clk)) {



