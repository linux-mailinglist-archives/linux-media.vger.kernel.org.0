Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183D83FD362
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242139AbhIAFz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:55:28 -0400
Received: from mx21.baidu.com ([220.181.3.85]:51072 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242192AbhIAFzZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:55:25 -0400
Received: from BC-Mail-Ex29.internal.baidu.com (unknown [172.31.51.23])
        by Forcepoint Email with ESMTPS id 8C0DEB4ACB6C369C6EB9;
        Wed,  1 Sep 2021 13:54:27 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex29.internal.baidu.com (172.31.51.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 13:54:26 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:54:26 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rc: img-ir: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:54:20 +0800
Message-ID: <20210901055420.6979-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/rc/img-ir/img-ir-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/rc/img-ir/img-ir-core.c b/drivers/media/rc/img-ir/img-ir-core.c
index 094aa6a06315..6f8464872033 100644
--- a/drivers/media/rc/img-ir/img-ir-core.c
+++ b/drivers/media/rc/img-ir/img-ir-core.c
@@ -76,7 +76,6 @@ static void img_ir_ident(struct img_ir_priv *priv)
 static int img_ir_probe(struct platform_device *pdev)
 {
 	struct img_ir_priv *priv;
-	struct resource *res_regs;
 	int irq, error, error2;
 
 	/* Get resources from platform device */
@@ -94,8 +93,7 @@ static int img_ir_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->lock);
 
 	/* Ioremap the registers */
-	res_regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->reg_base = devm_ioremap_resource(&pdev->dev, res_regs);
+	priv->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->reg_base))
 		return PTR_ERR(priv->reg_base);
 
-- 
2.25.1

