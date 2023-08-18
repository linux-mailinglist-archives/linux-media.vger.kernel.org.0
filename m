Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F22D7809D6
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 12:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358423AbjHRKQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 06:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358543AbjHRKQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 06:16:12 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E1530C2
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 03:16:07 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RRyR659bxz1GDtN;
        Fri, 18 Aug 2023 18:14:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 18:16:05 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] media: c8sectpfe: Use the devm_clk_get_enabled() helper function
Date:   Fri, 18 Aug 2023 18:15:40 +0800
Message-ID: <20230818101541.1129209-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With devm_clk_get_enabled() the call to clk_disable_unprepare() can be
dropped from the error path and the remove callback.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 .../st/sti/c8sectpfe/c8sectpfe-core.c         | 26 +++++--------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 5dc1f908b49b..e4cf27b5a072 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -695,16 +695,10 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fei);
 
-	fei->c8sectpfeclk = devm_clk_get(dev, "c8sectpfe");
+	fei->c8sectpfeclk = devm_clk_get_enabled(dev, "c8sectpfe");
 	if (IS_ERR(fei->c8sectpfeclk)) {
-		dev_err(dev, "c8sectpfe clk not found\n");
-		return PTR_ERR(fei->c8sectpfeclk);
-	}
-
-	ret = clk_prepare_enable(fei->c8sectpfeclk);
-	if (ret) {
 		dev_err(dev, "Failed to enable c8sectpfe clock\n");
-		return ret;
+		return PTR_ERR(fei->c8sectpfeclk);
 	}
 
 	/* to save power disable all IP's (on by default) */
@@ -722,7 +716,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 			0, "c8sectpfe-idle-irq", fei);
 	if (ret) {
 		dev_err(dev, "Can't register c8sectpfe-idle-irq IRQ.\n");
-		goto err_clk_disable;
+		return ret;
 	}
 
 	ret = devm_request_irq(dev, fei->error_irq,
@@ -730,7 +724,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 				"c8sectpfe-error-irq", fei);
 	if (ret) {
 		dev_err(dev, "Can't register c8sectpfe-error-irq IRQ.\n");
-		goto err_clk_disable;
+		return ret;
 	}
 
 	fei->tsin_count = of_get_child_count(np);
@@ -739,16 +733,14 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		fei->tsin_count > fei->hw_stats.num_ib) {
 
 		dev_err(dev, "More tsin declared than exist on SoC!\n");
-		ret = -EINVAL;
-		goto err_clk_disable;
+		return -EINVAL;
 	}
 
 	fei->pinctrl = devm_pinctrl_get(dev);
 
 	if (IS_ERR(fei->pinctrl)) {
 		dev_err(dev, "Error getting tsin pins\n");
-		ret = PTR_ERR(fei->pinctrl);
-		goto err_clk_disable;
+		return PTR_ERR(fei->pinctrl);
 	}
 
 	for_each_child_of_node(np, child) {
@@ -859,7 +851,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "c8sectpfe_tuner_register_frontend failed (%d)\n",
 			ret);
-		goto err_clk_disable;
+		return ret;
 	}
 
 	c8sectpfe_debugfs_init(fei);
@@ -868,8 +860,6 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 
 err_node_put:
 	of_node_put(child);
-err_clk_disable:
-	clk_disable_unprepare(fei->c8sectpfeclk);
 	return ret;
 }
 
@@ -903,8 +893,6 @@ static void c8sectpfe_remove(struct platform_device *pdev)
 
 	if (readl(fei->io + SYS_OTHER_CLKEN))
 		writel(0, fei->io + SYS_OTHER_CLKEN);
-
-	clk_disable_unprepare(fei->c8sectpfeclk);
 }
 
 
-- 
2.34.1

