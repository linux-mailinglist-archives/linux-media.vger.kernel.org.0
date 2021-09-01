Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5158B3FD351
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242186AbhIAFwX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:52:23 -0400
Received: from mx21.baidu.com ([220.181.3.85]:48122 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242162AbhIAFwW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:52:22 -0400
Received: from BC-Mail-Ex06.internal.baidu.com (unknown [172.31.51.46])
        by Forcepoint Email with ESMTPS id 7E80665A55DD29220EE3;
        Wed,  1 Sep 2021 13:51:23 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex06.internal.baidu.com (172.31.51.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 13:51:23 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:51:22 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: davinci: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:51:16 +0800
Message-ID: <20210901055117.6579-1-caihuoqing@baidu.com>
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
 drivers/media/platform/davinci/vpbe_venc.c |  9 ++-------
 drivers/media/platform/davinci/vpif.c      |  5 ++---
 drivers/media/platform/davinci/vpss.c      | 10 ++--------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe_venc.c b/drivers/media/platform/davinci/vpbe_venc.c
index bde241c26d79..4c8e31de12b1 100644
--- a/drivers/media/platform/davinci/vpbe_venc.c
+++ b/drivers/media/platform/davinci/vpbe_venc.c
@@ -621,7 +621,6 @@ static int venc_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *pdev_id;
 	struct venc_state *venc;
-	struct resource *res;
 
 	if (!pdev->dev.platform_data) {
 		dev_err(&pdev->dev, "No platform data for VENC sub device");
@@ -640,16 +639,12 @@ static int venc_probe(struct platform_device *pdev)
 	venc->pdev = &pdev->dev;
 	venc->pdata = pdev->dev.platform_data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	venc->venc_base = devm_ioremap_resource(&pdev->dev, res);
+	venc->venc_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(venc->venc_base))
 		return PTR_ERR(venc->venc_base);
 
 	if (venc->venc_type != VPBE_VERSION_1) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-
-		venc->vdaccfg_reg = devm_ioremap_resource(&pdev->dev, res);
+		venc->vdaccfg_reg = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(venc->vdaccfg_reg))
 			return PTR_ERR(venc->vdaccfg_reg);
 	}
diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
index f1ce10828b8e..5a89d885d0e3 100644
--- a/drivers/media/platform/davinci/vpif.c
+++ b/drivers/media/platform/davinci/vpif.c
@@ -425,12 +425,11 @@ EXPORT_SYMBOL(vpif_channel_getfid);
 
 static int vpif_probe(struct platform_device *pdev)
 {
-	static struct resource	*res, *res_irq;
+	static struct resource *res_irq;
 	struct platform_device *pdev_capture, *pdev_display;
 	struct device_node *endpoint = NULL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	vpif_base = devm_ioremap_resource(&pdev->dev, res);
+	vpif_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vpif_base))
 		return PTR_ERR(vpif_base);
 
diff --git a/drivers/media/platform/davinci/vpss.c b/drivers/media/platform/davinci/vpss.c
index 7000f0bf0b35..d15b991ab17c 100644
--- a/drivers/media/platform/davinci/vpss.c
+++ b/drivers/media/platform/davinci/vpss.c
@@ -392,7 +392,6 @@ EXPORT_SYMBOL(dm365_vpss_set_pg_frame_size);
 
 static int vpss_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	char *platform_name;
 
 	if (!pdev->dev.platform_data) {
@@ -413,17 +412,12 @@ static int vpss_probe(struct platform_device *pdev)
 	}
 
 	dev_info(&pdev->dev, "%s vpss probed\n", platform_name);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	oper_cfg.vpss_regs_base0 = devm_ioremap_resource(&pdev->dev, res);
+	oper_cfg.vpss_regs_base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(oper_cfg.vpss_regs_base0))
 		return PTR_ERR(oper_cfg.vpss_regs_base0);
 
 	if (oper_cfg.platform == DM355 || oper_cfg.platform == DM365) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-
-		oper_cfg.vpss_regs_base1 = devm_ioremap_resource(&pdev->dev,
-								 res);
+		oper_cfg.vpss_regs_base1 = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(oper_cfg.vpss_regs_base1))
 			return PTR_ERR(oper_cfg.vpss_regs_base1);
 	}
-- 
2.25.1

