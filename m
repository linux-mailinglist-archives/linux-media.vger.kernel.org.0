Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553013FD2C1
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241891AbhIAFP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:15:29 -0400
Received: from mx20.baidu.com ([111.202.115.85]:42212 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229731AbhIAFP0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:15:26 -0400
Received: from BC-Mail-Ex16.internal.baidu.com (unknown [172.31.51.56])
        by Forcepoint Email with ESMTPS id 7D640F5D159825ACF693;
        Wed,  1 Sep 2021 13:14:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex16.internal.baidu.com (172.31.51.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 13:14:28 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:14:27 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: cadence: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:14:20 +0800
Message-ID: <20210901051421.5372-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex11.internal.baidu.com (172.31.51.51) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 4 +---
 drivers/media/platform/cadence/cdns-csi2tx.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 7b44ab2b8c9a..cc3ebb0d96f6 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -279,13 +279,11 @@ static const struct v4l2_async_notifier_operations csi2rx_notifier_ops = {
 static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 				struct platform_device *pdev)
 {
-	struct resource *res;
 	unsigned char i;
 	u32 dev_cfg;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	csi2rx->base = devm_ioremap_resource(&pdev->dev, res);
+	csi2rx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2rx->base))
 		return PTR_ERR(csi2rx->base);
 
diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 5a67fba73ddd..8f8c36056354 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -433,13 +433,11 @@ static const struct v4l2_subdev_ops csi2tx_subdev_ops = {
 static int csi2tx_get_resources(struct csi2tx_priv *csi2tx,
 				struct platform_device *pdev)
 {
-	struct resource *res;
 	unsigned int i;
 	u32 dev_cfg;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	csi2tx->base = devm_ioremap_resource(&pdev->dev, res);
+	csi2tx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2tx->base))
 		return PTR_ERR(csi2tx->base);
 
-- 
2.25.1

