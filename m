Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5309476DE7E
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 04:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjHCCrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 22:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbjHCCrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 22:47:45 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638F19B;
        Wed,  2 Aug 2023 19:47:33 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGY884x9BztRqc;
        Thu,  3 Aug 2023 10:44:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 10:47:30 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <sylvester.nawrocki@gmail.com>, <mchehab@kernel.org>,
        <ezequiel@vanguardiasur.com.ar>, <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/2] media: verisilicon: Do not check for 0 return after calling platform_get_irq()
Date:   Thu, 3 Aug 2023 10:46:45 +0800
Message-ID: <20230803024645.2716057-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803024645.2716057-1-ruanjinjie@huawei.com>
References: <20230803024645.2716057-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is not possible for platform_get_irq() or platform_get_irq_byname()
to return 0. Use the return value from platform_get_irq()
or platform_get_irq_byname().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 35ca71b19def..423fc85d79ee 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1085,8 +1085,8 @@ static int hantro_probe(struct platform_device *pdev)
 			irq_name = "default";
 			irq = platform_get_irq(vpu->pdev, 0);
 		}
-		if (irq <= 0)
-			return -ENXIO;
+		if (irq < 0)
+			return irq;
 
 		ret = devm_request_irq(vpu->dev, irq,
 				       vpu->variant->irqs[i].handler, 0,
-- 
2.34.1

