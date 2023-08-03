Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B9976DDF4
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 04:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjHCCVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 22:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjHCCVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 22:21:21 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0FFB2
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 19:21:20 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RGXbm4GlGzVk1Z;
        Thu,  3 Aug 2023 10:19:32 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 10:21:18 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 10:21:17 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <prabhakar.csengg@gmail.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next] media: davinci: vpif_capture: fix error return code in vpif_probe()
Date:   Thu, 3 Aug 2023 10:18:35 +0800
Message-ID: <20230803021835.3740766-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set error return code, when get platform data failed.

Fixes: b4a4547371b9 ("media: davinci: Init async notifier after registering V4L2 device")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/ti/davinci/vpif_capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index bf5330b6fcd5..99fae8830c41 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1644,6 +1644,7 @@ static __init int vpif_probe(struct platform_device *pdev)
 	pdev->dev.platform_data =
 		vpif_capture_get_pdata(pdev, &vpif_obj.v4l2_dev);
 	if (!pdev->dev.platform_data) {
+		err = -EINVAL;
 		dev_warn(&pdev->dev, "Missing platform data. Giving up.\n");
 		goto vpif_unregister;
 	}
-- 
2.25.1

