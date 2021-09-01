Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7FA3FD38A
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242393AbhIAF53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:57:29 -0400
Received: from mx21.baidu.com ([220.181.3.85]:53522 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242377AbhIAF52 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:57:28 -0400
Received: from BJHW-Mail-Ex11.internal.baidu.com (unknown [10.127.64.34])
        by Forcepoint Email with ESMTPS id CA5AAACEF784CE2ECCE6;
        Wed,  1 Sep 2021 13:56:30 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:30 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:30 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: sti: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:56:23 +0800
Message-ID: <20210901055624.7779-1-caihuoqing@baidu.com>
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
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 3 +--
 drivers/media/platform/sti/hva/hva-hw.c       | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index 6413cd279125..7d467f2ba072 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -1315,8 +1315,7 @@ static int bdisp_probe(struct platform_device *pdev)
 	mutex_init(&bdisp->lock);
 
 	/* get resources */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	bdisp->regs = devm_ioremap_resource(dev, res);
+	bdisp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdisp->regs)) {
 		ret = PTR_ERR(bdisp->regs);
 		goto err_wq;
diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
index 30fb1aa4a351..15e8f83b1b56 100644
--- a/drivers/media/platform/sti/hva/hva-hw.c
+++ b/drivers/media/platform/sti/hva/hva-hw.c
@@ -298,15 +298,13 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
 int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *regs;
 	struct resource *esram;
 	int ret;
 
 	WARN_ON(!hva);
 
 	/* get memory for registers */
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hva->regs = devm_ioremap_resource(dev, regs);
+	hva->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hva->regs)) {
 		dev_err(dev, "%s     failed to get regs\n", HVA_PREFIX);
 		return PTR_ERR(hva->regs);
-- 
2.25.1

