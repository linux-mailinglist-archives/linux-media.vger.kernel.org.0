Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 914695B9DD7
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 16:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiIOO41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 10:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiIOO4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 10:56:18 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790DA857E6
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 07:56:17 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MT0ZN6BVhznVDs;
        Thu, 15 Sep 2022 22:53:32 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 22:56:15 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 22:56:15 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH -next 09/13] media: xilinx: csi2rxss: Switch to use dev_err_probe() helper
Date:   Thu, 15 Sep 2022 23:03:20 +0800
Message-ID: <20220915150324.688062-10-yangyingliang@huawei.com>
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
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 29b53febc2e7..080e2483cc92 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -976,11 +976,9 @@ static int xcsi2rxss_probe(struct platform_device *pdev)
 	/* Reset GPIO */
 	xcsi2rxss->rst_gpio = devm_gpiod_get_optional(dev, "video-reset",
 						      GPIOD_OUT_HIGH);
-	if (IS_ERR(xcsi2rxss->rst_gpio)) {
-		if (PTR_ERR(xcsi2rxss->rst_gpio) != -EPROBE_DEFER)
-			dev_err(dev, "Video Reset GPIO not setup in DT");
-		return PTR_ERR(xcsi2rxss->rst_gpio);
-	}
+	if (IS_ERR(xcsi2rxss->rst_gpio))
+		return dev_err_probe(dev, PTR_ERR(xcsi2rxss->rst_gpio),
+				     "Video Reset GPIO not setup in DT");
 
 	ret = xcsi2rxss_parse_of(xcsi2rxss);
 	if (ret < 0)
-- 
2.25.1

