Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD333513AE
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 12:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234150AbhDAKcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 06:32:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15571 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbhDAKc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 06:32:26 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9zw90gJhz17PPH;
        Thu,  1 Apr 2021 18:30:17 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Thu, 1 Apr 2021
 18:32:19 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <mchehab@kernel.org>, <todor.too@gmail.com>
Subject: [PATCH -next] media: camss: csiphy: Remove redundant dev_err call in msm_csiphy_subdev_init()
Date:   Thu, 1 Apr 2021 18:35:00 +0800
Message-ID: <20210401103500.1558058-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is an error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 6ceb6d7d53d1..b3c3bf19e522 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -593,20 +593,16 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
 	csiphy->base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(csiphy->base)) {
-		dev_err(dev, "could not map memory\n");
+	if (IS_ERR(csiphy->base))
 		return PTR_ERR(csiphy->base);
-	}
 
 	if (camss->version == CAMSS_8x16 ||
 	    camss->version == CAMSS_8x96) {
 		r = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						 res->reg[1]);
 		csiphy->base_clk_mux = devm_ioremap_resource(dev, r);
-		if (IS_ERR(csiphy->base_clk_mux)) {
-			dev_err(dev, "could not map memory\n");
+		if (IS_ERR(csiphy->base_clk_mux))
 			return PTR_ERR(csiphy->base_clk_mux);
-		}
 	} else {
 		csiphy->base_clk_mux = NULL;
 	}
-- 
2.25.1

