Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432494525F3
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 02:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352305AbhKPCAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 21:00:40 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:49956 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1382839AbhKPB6h (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 20:58:37 -0500
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Nov 2021 20:58:36 EST
Received: from localhost.localdomain (unknown [124.16.141.244])
        by APP-01 (Coremail) with SMTP id qwCowAAXHQnDDZNhY8amBw--.13846S2;
        Tue, 16 Nov 2021 09:47:48 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     rick.chang@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: Remove unnecessary print function dev_err()
Date:   Tue, 16 Nov 2021 01:47:26 +0000
Message-Id: <20211116014726.1452-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXHQnDDZNhY8amBw--.13846S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWrWF45tw4ktFWrArWrZrb_yoWfurbEg3
        409FyxWr48GwnYvr1Iy3W3ZryxtrZ8CF4rJ3Z3KFWagFy5C3WUJry7AFs8uF4xZ3WIvFyU
        ArW3urW7CrnxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVWkMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
        CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zc_3UUUUU==
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQcHA102atLl6AABsV
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The print function dev_err() is redundant because
platform_get_irq() already prints an error.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index af994b9913a6..f332beb06d51 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1361,10 +1361,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	}
 
 	jpeg_irq = platform_get_irq(pdev, 0);
-	if (jpeg_irq < 0) {
-		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
+	if (jpeg_irq < 0)
 		return jpeg_irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, jpeg_irq,
 			       jpeg->variant->irq_handler, 0, pdev->name, jpeg);
-- 
2.25.1

