Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B70769573
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 14:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjGaMDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 08:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbjGaMC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 08:02:58 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABD8E7A
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 05:02:52 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RDxcF1HPwzNmfp;
        Mon, 31 Jul 2023 19:59:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 20:02:49 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <prabhakar.csengg@gmail.com>, <mchehab@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] media: platform: ti: fix the return value handle for platform_get_irq()
Date:   Mon, 31 Jul 2023 20:02:12 +0800
Message-ID: <20230731120212.2017996-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no possible for platform_get_irq() to return 0,
and the return value of platform_get_irq() is more sensible
to show the error reason.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 4 +---
 drivers/media/platform/ti/omap3isp/isp.c       | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 81a63a3865cf..a85b97107de7 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2420,10 +2420,8 @@ static int vpfe_probe(struct platform_device *pdev)
 	}
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
-		ret = -ENODEV;
+	if (ret < 0)
 		goto probe_out_cleanup;
-	}
 	vpfe->irq = ret;
 
 	ret = devm_request_irq(vpfe->pdev, vpfe->irq, vpfe_isr, 0,
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f3aaa9e76492..226db75221cd 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2398,10 +2398,8 @@ static int isp_probe(struct platform_device *pdev)
 
 	/* Interrupt */
 	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
-		ret = -ENODEV;
+	if (ret < 0)
 		goto error_iommu;
-	}
 	isp->irq_num = ret;
 
 	if (devm_request_irq(isp->dev, isp->irq_num, isp_isr, IRQF_SHARED,
-- 
2.34.1

