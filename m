Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17EDE3FD378
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242315AbhIAF4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:56:38 -0400
Received: from mx21.baidu.com ([220.181.3.85]:52492 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242346AbhIAF4h (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:56:37 -0400
Received: from BC-Mail-Ex18.internal.baidu.com (unknown [172.31.51.12])
        by Forcepoint Email with ESMTPS id E429D5185CF41109C31D;
        Wed,  1 Sep 2021 13:55:38 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex18.internal.baidu.com (172.31.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 13:55:38 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:55:38 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rcar_jpu: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:55:32 +0800
Message-ID: <20210901055532.7429-1-caihuoqing@baidu.com>
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
 drivers/media/platform/rcar_jpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
index f57158bf2b11..56bb464629ed 100644
--- a/drivers/media/platform/rcar_jpu.c
+++ b/drivers/media/platform/rcar_jpu.c
@@ -1590,7 +1590,6 @@ MODULE_DEVICE_TABLE(of, jpu_dt_ids);
 static int jpu_probe(struct platform_device *pdev)
 {
 	struct jpu *jpu;
-	struct resource *res;
 	int ret;
 	unsigned int i;
 
@@ -1603,8 +1602,7 @@ static int jpu_probe(struct platform_device *pdev)
 	jpu->dev = &pdev->dev;
 
 	/* memory-mapped registers */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	jpu->regs = devm_ioremap_resource(&pdev->dev, res);
+	jpu->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(jpu->regs))
 		return PTR_ERR(jpu->regs);
 
-- 
2.25.1

