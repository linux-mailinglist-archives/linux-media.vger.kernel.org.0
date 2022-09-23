Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21DAA5E773C
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 11:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbiIWJdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 05:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbiIWJc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 05:32:59 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B91761B22
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 02:32:57 -0700 (PDT)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYmzx4CZ1z1P6t1;
        Fri, 23 Sep 2022 17:28:45 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:32:53 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 17:32:52 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <hugues.fruchet@foss.st.com>, <mchehab@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH -next] media: stm32: dcmi: Remove redundant dev_err call
Date:   Fri, 23 Sep 2022 18:07:08 +0800
Message-ID: <20220923100708.17392-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 2ca95ab2b0fe..70e1b6af0448 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1997,10 +1997,8 @@ static int dcmi_probe(struct platform_device *pdev)
 	}
 
 	dcmi->regs = devm_ioremap_resource(&pdev->dev, dcmi->res);
-	if (IS_ERR(dcmi->regs)) {
-		dev_err(&pdev->dev, "Could not map registers\n");
+	if (IS_ERR(dcmi->regs))
 		return PTR_ERR(dcmi->regs);
-	}
 
 	mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(mclk)) {
-- 
2.17.1

