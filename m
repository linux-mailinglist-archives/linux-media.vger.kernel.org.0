Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBAB2631A2
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 18:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731024AbgIIQV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 12:21:58 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51068 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731011AbgIIQVu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 12:21:50 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B4FE2D48F4A63D882E9F;
        Wed,  9 Sep 2020 22:24:17 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 22:24:11 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <ezequiel@collabora.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>, <hverkuil-cisco@xs4all.nl>,
        <boris.brezillon@collabora.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>, <devel@driverdev.osuosl.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] media: rkvdec: Remove redundant platform_get_irq error message
Date:   Wed, 9 Sep 2020 22:24:07 +0800
Message-ID: <20200909142407.31720-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
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
 drivers/staging/media/rkvdec/rkvdec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d25c4a37e2af..552e0bd12ecf 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1038,10 +1038,8 @@ static int rkvdec_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(&pdev->dev, "Could not get vdec IRQ\n");
+	if (irq <= 0)
 		return -ENXIO;
-	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					rkvdec_irq_handler, IRQF_ONESHOT,
-- 
2.17.1


