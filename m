Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C355C3FD361
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242156AbhIAFzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:55:18 -0400
Received: from mx21.baidu.com ([220.181.3.85]:50866 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242142AbhIAFzS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:55:18 -0400
Received: from BC-Mail-Ex30.internal.baidu.com (unknown [172.31.51.24])
        by Forcepoint Email with ESMTPS id 1530ACC968E1FAB6A5D6;
        Wed,  1 Sep 2021 13:54:10 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex30.internal.baidu.com (172.31.51.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 13:54:09 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:54:09 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: mx2_emmaprp: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:54:03 +0800
Message-ID: <20210901055403.6929-1-caihuoqing@baidu.com>
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
 drivers/media/platform/mx2_emmaprp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
index 08a5473b5610..3ce84d0f078c 100644
--- a/drivers/media/platform/mx2_emmaprp.c
+++ b/drivers/media/platform/mx2_emmaprp.c
@@ -804,7 +804,6 @@ static int emmaprp_probe(struct platform_device *pdev)
 {
 	struct emmaprp_dev *pcdev;
 	struct video_device *vfd;
-	struct resource *res;
 	int irq, ret;
 
 	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
@@ -822,8 +821,7 @@ static int emmaprp_probe(struct platform_device *pdev)
 	if (IS_ERR(pcdev->clk_emma_ahb))
 		return PTR_ERR(pcdev->clk_emma_ahb);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pcdev->base_emma = devm_ioremap_resource(&pdev->dev, res);
+	pcdev->base_emma = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pcdev->base_emma))
 		return PTR_ERR(pcdev->base_emma);
 
-- 
2.25.1

