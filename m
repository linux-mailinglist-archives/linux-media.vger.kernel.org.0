Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D5D359440
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 07:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhDIFDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 01:03:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15992 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhDIFDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 01:03:21 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGmDQ16BmzyPBM;
        Fri,  9 Apr 2021 13:00:54 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 13:03:02 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <robert.foss@linaro.org>, <todor.too@gmail.com>,
        <mchehab@kernel.org>
Subject: [PATCH -next] media: camss: ispif: Remove redundant dev_err call in msm_ispif_subdev_init()
Date:   Fri, 9 Apr 2021 13:06:33 +0800
Message-ID: <20210409050633.671223-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/qcom/camss/camss-ispif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index a30e453de162..37611c8861da 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1145,17 +1145,13 @@ int msm_ispif_subdev_init(struct camss *camss,
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
 	ispif->base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(ispif->base)) {
-		dev_err(dev, "could not map memory\n");
+	if (IS_ERR(ispif->base))
 		return PTR_ERR(ispif->base);
-	}
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[1]);
 	ispif->base_clk_mux = devm_ioremap_resource(dev, r);
-	if (IS_ERR(ispif->base_clk_mux)) {
-		dev_err(dev, "could not map memory\n");
+	if (IS_ERR(ispif->base_clk_mux))
 		return PTR_ERR(ispif->base_clk_mux);
-	}
 
 	/* Interrupt */
 
-- 
2.25.1

