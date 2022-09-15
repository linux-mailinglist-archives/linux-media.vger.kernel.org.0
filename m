Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FA25B9DD5
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 16:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiIOO4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 10:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiIOO4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 10:56:16 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E7B8672A
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 07:56:13 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MT0Y462M9zmVDF;
        Thu, 15 Sep 2022 22:52:24 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 22:56:11 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 22:56:11 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH -next 01/13] media: platform: stm32-cec: Switch to use dev_err_probe() helper
Date:   Thu, 15 Sep 2022 23:03:12 +0800
Message-ID: <20220915150324.688062-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915150324.688062-1-yangyingliang@huawei.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the probe path, dev_err() can be replace with dev_err_probe()
which will check if error code is -EPROBE_DEFER.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/cec/platform/stm32/stm32-cec.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index 40db7911b437..7b2db46a5722 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -288,12 +288,9 @@ static int stm32_cec_probe(struct platform_device *pdev)
 		return ret;
 
 	cec->clk_cec = devm_clk_get(&pdev->dev, "cec");
-	if (IS_ERR(cec->clk_cec)) {
-		if (PTR_ERR(cec->clk_cec) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Cannot get cec clock\n");
-
-		return PTR_ERR(cec->clk_cec);
-	}
+	if (IS_ERR(cec->clk_cec))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cec->clk_cec),
+				     "Cannot get cec clock\n");
 
 	ret = clk_prepare(cec->clk_cec);
 	if (ret) {
-- 
2.25.1

