Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F2C3FD369
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242274AbhIAFz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:55:56 -0400
Received: from mx21.baidu.com ([220.181.3.85]:51378 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242280AbhIAFzt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:55:49 -0400
Received: from BC-Mail-Ex27.internal.baidu.com (unknown [172.31.51.21])
        by Forcepoint Email with ESMTPS id DDC94C0236DF6AF663DB;
        Wed,  1 Sep 2021 13:54:46 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex27.internal.baidu.com (172.31.51.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 1 Sep 2021 13:54:46 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:54:46 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rc: meson-ir: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:54:39 +0800
Message-ID: <20210901055440.7079-1-caihuoqing@baidu.com>
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
 drivers/media/rc/meson-ir.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index dad55950dfc6..4b769111f78e 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -102,7 +102,6 @@ static int meson_ir_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	struct resource *res;
 	const char *map_name;
 	struct meson_ir *ir;
 	int irq, ret;
@@ -111,8 +110,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ir->reg = devm_ioremap_resource(dev, res);
+	ir->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ir->reg))
 		return PTR_ERR(ir->reg);
 
-- 
2.25.1

