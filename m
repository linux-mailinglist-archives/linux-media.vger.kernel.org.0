Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750D33FD2B9
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241930AbhIAFKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:10:45 -0400
Received: from mx20.baidu.com ([111.202.115.85]:38164 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230483AbhIAFKp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:10:45 -0400
Received: from BJHW-Mail-Ex11.internal.baidu.com (unknown [10.127.64.34])
        by Forcepoint Email with ESMTPS id A8B943E761B4E2572B0B;
        Wed,  1 Sep 2021 13:09:46 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:09:46 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:09:46 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: am437x: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:07:24 +0800
Message-ID: <20210901050725.5273-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex18.internal.baidu.com (172.31.51.12) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 48bb0c93729c..2dfae9bc0bba 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2393,7 +2393,6 @@ static int vpfe_probe(struct platform_device *pdev)
 	struct vpfe_config *vpfe_cfg;
 	struct vpfe_device *vpfe;
 	struct vpfe_ccdc *ccdc;
-	struct resource	*res;
 	int ret;
 
 	vpfe = devm_kzalloc(&pdev->dev, sizeof(*vpfe), GFP_KERNEL);
@@ -2411,8 +2410,7 @@ static int vpfe_probe(struct platform_device *pdev)
 	vpfe->cfg = vpfe_cfg;
 	ccdc = &vpfe->ccdc;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ccdc->ccdc_cfg.base_addr = devm_ioremap_resource(&pdev->dev, res);
+	ccdc->ccdc_cfg.base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ccdc->ccdc_cfg.base_addr)) {
 		ret = PTR_ERR(ccdc->ccdc_cfg.base_addr);
 		goto probe_out_cleanup;
-- 
2.25.1

