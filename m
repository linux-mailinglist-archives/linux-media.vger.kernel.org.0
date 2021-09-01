Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FB33FD391
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242422AbhIAF5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:57:52 -0400
Received: from mx21.baidu.com ([220.181.3.85]:53924 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242410AbhIAF5w (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:57:52 -0400
Received: from BJHW-Mail-Ex14.internal.baidu.com (unknown [10.127.64.37])
        by Forcepoint Email with ESMTPS id 4E6572330115207845F5;
        Wed,  1 Sep 2021 13:56:53 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex14.internal.baidu.com (10.127.64.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:52 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:56:52 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: stm32-cec: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:56:45 +0800
Message-ID: <20210901055646.7929-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex14_2021-09-01 13:56:53:174
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/cec/platform/stm32/stm32-cec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index 0ffd89712536..40db7911b437 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -255,7 +255,6 @@ static const struct regmap_config stm32_cec_regmap_cfg = {
 static int stm32_cec_probe(struct platform_device *pdev)
 {
 	u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_PHYS_ADDR | CEC_MODE_MONITOR_ALL;
-	struct resource *res;
 	struct stm32_cec *cec;
 	void __iomem *mmio;
 	int ret;
@@ -266,8 +265,7 @@ static int stm32_cec_probe(struct platform_device *pdev)
 
 	cec->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mmio = devm_ioremap_resource(&pdev->dev, res);
+	mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mmio))
 		return PTR_ERR(mmio);
 
-- 
2.25.1

