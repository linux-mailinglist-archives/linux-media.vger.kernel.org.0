Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D722849D0E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 11:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfFRJYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 05:24:24 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2113 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbfFRJYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 05:24:24 -0400
X-Greylist: delayed 583 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Jun 2019 05:24:04 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee45d08ab5c0ad-79f15; Tue, 18 Jun 2019 17:14:04 +0800 (CST)
X-RM-TRANSID: 2ee45d08ab5c0ad-79f15
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.105.0.243])
        by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25d08ab5bebf-69608;
        Tue, 18 Jun 2019 17:14:04 +0800 (CST)
X-RM-TRANSID: 2ee25d08ab5bebf-69608
From:   Ding Xiang <dingxiang@cmss.chinamobile.com>
To:     mchehab@kernel.org
Cc:     sean@mess.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: remove redundant dev_err message
Date:   Tue, 18 Jun 2019 17:13:09 +0800
Message-Id: <1560849189-12031-1-git-send-email-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

devm_ioremap_resource already contains error message, so remove
the redundant dev_err message

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/media/rc/meson-ir.c  | 4 +---
 drivers/media/rc/mtk-cir.c   | 4 +---
 drivers/media/rc/sunxi-cir.c | 1 -
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 9e1a978..bdcf9e9 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -113,10 +113,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ir->reg = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ir->reg)) {
-		dev_err(dev, "failed to map registers\n");
+	if (IS_ERR(ir->reg))
 		return PTR_ERR(ir->reg);
-	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 46101ef..50fb0ae 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -320,10 +320,8 @@ static int mtk_ir_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ir->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ir->base)) {
-		dev_err(dev, "failed to map registers\n");
+	if (IS_ERR(ir->base))
 		return PTR_ERR(ir->base);
-	}
 
 	ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
 	if (!ir->rc) {
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index a48f685..aa719d0 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -195,7 +195,6 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ir->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ir->base)) {
-		dev_err(dev, "failed to map registers\n");
 		ret = PTR_ERR(ir->base);
 		goto exit_clkdisable_clk;
 	}
-- 
1.9.1



