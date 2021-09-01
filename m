Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977EF3FD393
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242439AbhIAF57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:57:59 -0400
Received: from mx20.baidu.com ([111.202.115.85]:54084 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242438AbhIAF56 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:57:58 -0400
Received: from BJHW-Mail-Ex15.internal.baidu.com (unknown [10.127.64.38])
        by Forcepoint Email with ESMTPS id 99AEA8CAD256AF771766;
        Wed,  1 Sep 2021 13:57:00 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:57:00 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:59 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Yong Deng <yong.deng@magewell.com>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: sunxi: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:56:53 +0800
Message-ID: <20210901055654.7979-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex15_2021-09-01 13:57:00:553
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 4 +---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 4 +---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 94e98e470aff..80a10f238bbe 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -154,7 +154,6 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	struct v4l2_subdev *subdev;
 	struct video_device *vdev;
 	struct sun4i_csi *csi;
-	struct resource *res;
 	int ret;
 	int irq;
 
@@ -179,8 +178,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_init(&csi->mdev);
 	csi->v4l.mdev = &csi->mdev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	csi->regs = devm_ioremap_resource(&pdev->dev, res);
+	csi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi->regs))
 		return PTR_ERR(csi->regs);
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 4b8d66fec3cf..fc96921b0583 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -833,13 +833,11 @@ static const struct regmap_config sun6i_csi_regmap_config = {
 static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
 				      struct platform_device *pdev)
 {
-	struct resource *res;
 	void __iomem *io_base;
 	int ret;
 	int irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io_base = devm_ioremap_resource(&pdev->dev, res);
+	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 671e4a928993..aa65d70b6270 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -803,7 +803,6 @@ static int deinterlace_probe(struct platform_device *pdev)
 {
 	struct deinterlace_dev *dev;
 	struct video_device *vfd;
-	struct resource *res;
 	int irq, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -825,8 +824,7 @@ static int deinterlace_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(&pdev->dev, res);
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base))
 		return PTR_ERR(dev->base);
 
-- 
2.25.1

