Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BEB3FD380
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242225AbhIAF5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:57:04 -0400
Received: from mx20.baidu.com ([111.202.115.85]:52938 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242359AbhIAF47 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:56:59 -0400
Received: from BJHW-Mail-Ex06.internal.baidu.com (unknown [10.127.64.16])
        by Forcepoint Email with ESMTPS id 311B31606284DC1B7DCC;
        Wed,  1 Sep 2021 13:56:01 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex06.internal.baidu.com (10.127.64.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:01 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:00 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: s3c-camif: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:55:54 +0800
Message-ID: <20210901055554.7579-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex06_2021-09-01 13:56:01:180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/platform/s3c-camif/camif-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index e1d51fd3e700..b6a03296c923 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -402,7 +402,6 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	struct s3c_camif_plat_data *pdata = dev->platform_data;
 	struct s3c_camif_drvdata *drvdata;
 	struct camif_dev *camif;
-	struct resource *mres;
 	int ret = 0;
 
 	camif = devm_kzalloc(dev, sizeof(*camif), GFP_KERNEL);
@@ -423,9 +422,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	drvdata = (void *)platform_get_device_id(pdev)->driver_data;
 	camif->variant = drvdata->variant;
 
-	mres = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	camif->io_base = devm_ioremap_resource(dev, mres);
+	camif->io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(camif->io_base))
 		return PTR_ERR(camif->io_base);
 
-- 
2.25.1

