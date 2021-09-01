Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940C83FD8DE
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 13:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243818AbhIALjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 07:39:39 -0400
Received: from mx21.baidu.com ([220.181.3.85]:37262 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243543AbhIALjj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 07:39:39 -0400
Received: from BC-Mail-Ex17.internal.baidu.com (unknown [172.31.51.11])
        by Forcepoint Email with ESMTPS id DA4574A7C94E65D6871F;
        Wed,  1 Sep 2021 19:38:40 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex17.internal.baidu.com (172.31.51.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 1 Sep 2021 19:38:40 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 19:38:40 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] media: rcar_drif: Make use of the helper function devm_platform_get_and_ioremap_resource()
Date:   Wed, 1 Sep 2021 19:38:34 +0800
Message-ID: <20210901113834.31427-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex21.internal.baidu.com (172.31.51.15) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_get_and_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2:
Use devm_platform_get_and_ioremap_resource() instead of
devm_platform_ioremap_resource().
v2->v3:
Update commit message.
 
 drivers/media/platform/rcar_drif.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index a505d991548b..e50673276d93 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -1376,7 +1376,7 @@ static int rcar_drif_probe(struct platform_device *pdev)
 	struct rcar_drif_sdr *sdr;
 	struct device_node *np;
 	struct rcar_drif *ch;
-	struct resource	*res;
+	struct resource *res;
 	int ret;
 
 	/* Reserve memory for enabled channel */
@@ -1395,8 +1395,7 @@ static int rcar_drif_probe(struct platform_device *pdev)
 	}
 
 	/* Register map */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ch->base = devm_ioremap_resource(&pdev->dev, res);
+	ch->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ch->base))
 		return PTR_ERR(ch->base);
 
-- 
2.25.1

