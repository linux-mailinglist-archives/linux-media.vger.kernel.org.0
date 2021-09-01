Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039413FD37D
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242353AbhIAF4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:56:53 -0400
Received: from mx20.baidu.com ([111.202.115.85]:52764 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242256AbhIAF4v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:56:51 -0400
Received: from BJHW-Mail-Ex03.internal.baidu.com (unknown [10.127.64.13])
        by Forcepoint Email with ESMTPS id C79E3E8C0E950F215937;
        Wed,  1 Sep 2021 13:55:53 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex03.internal.baidu.com (10.127.64.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:55:53 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:55:53 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Heiko Stuebner" <heiko@sntech.de>, <linux-media@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: rockchip: rga: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:55:46 +0800
Message-ID: <20210901055547.7529-1-caihuoqing@baidu.com>
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
 drivers/media/platform/rockchip/rga/rga.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 6759091b15e0..4de5e8d2b261 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -800,7 +800,6 @@ static int rga_probe(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga;
 	struct video_device *vfd;
-	struct resource *res;
 	int ret = 0;
 	int irq;
 
@@ -821,9 +820,7 @@ static int rga_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(rga->dev);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	rga->regs = devm_ioremap_resource(rga->dev, res);
+	rga->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rga->regs)) {
 		ret = PTR_ERR(rga->regs);
 		goto err_put_clk;
-- 
2.25.1

