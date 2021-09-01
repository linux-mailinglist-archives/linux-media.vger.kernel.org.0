Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B977D3FD385
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242399AbhIAF5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:57:19 -0400
Received: from mx21.baidu.com ([220.181.3.85]:53230 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242377AbhIAF5O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:57:14 -0400
Received: from BJHW-Mail-Ex02.internal.baidu.com (unknown [10.127.64.12])
        by Forcepoint Email with ESMTPS id 36CC9ABEDD4D5A2387AE;
        Wed,  1 Sep 2021 13:56:16 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex02.internal.baidu.com (10.127.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:16 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:15 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: s5p-jpeg: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:56:09 +0800
Message-ID: <20210901055609.7679-1-caihuoqing@baidu.com>
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
 drivers/media/platform/s5p-jpeg/jpeg-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index d402e456f27d..1faff037cdf7 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -2850,7 +2850,6 @@ static void *jpeg_get_drv_data(struct device *dev);
 static int s5p_jpeg_probe(struct platform_device *pdev)
 {
 	struct s5p_jpeg *jpeg;
-	struct resource *res;
 	int i, ret;
 
 	/* JPEG IP abstraction struct */
@@ -2867,9 +2866,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
 	jpeg->dev = &pdev->dev;
 
 	/* memory-mapped registers */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	jpeg->regs = devm_ioremap_resource(&pdev->dev, res);
+	jpeg->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(jpeg->regs))
 		return PTR_ERR(jpeg->regs);
 
-- 
2.25.1

