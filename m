Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8A762536A
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 07:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbiKKGLI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Nov 2022 01:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiKKGLG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Nov 2022 01:11:06 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77442BB0E
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 22:11:05 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N7pGz6lCbzRp6x;
        Fri, 11 Nov 2022 14:10:51 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 14:11:03 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <ming.qian@nxp.com>, <shijie.qin@nxp.com>, <eagle.zhou@nxp.com>,
        <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] media: amphion: Fix error handling in vpu_driver_init()
Date:   Fri, 11 Nov 2022 06:09:26 +0000
Message-ID: <20221111060926.18508-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A problem about modprobe amphion-vpu failed is triggered with the
following log given:

 [ 2208.634841] Error: Driver 'amphion-vpu' is already registered, aborting...
 modprobe: ERROR: could not insert 'amphion_vpu': Device or resource busy

The reason is that vpu_driver_init() returns vpu_core_driver_init()
directly without checking its return value, if vpu_core_driver_init()
failed, it returns without unregister amphion_vpu_driver, resulting the
amphion-vpu can never be installed later.
A simple call graph is shown as below:

 vpu_driver_init()
   platform_driver_register() # register amphion_vpu_driver
   vpu_core_driver_init()
     platform_driver_register()
       driver_register()
         bus_add_driver()
           dev = kzalloc(...) # OOM happened
   # return without unregister amphion_vpu_driver

Fix by unregister amphion_vpu_driver when vpu_core_driver_init() returns
error.

Fixes: b50a64fc54af ("media: amphion: add amphion vpu device driver")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/media/platform/amphion/vpu_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
index 9d5a5075343d..f01ce49d27e8 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -245,7 +245,11 @@ static int __init vpu_driver_init(void)
 	if (ret)
 		return ret;
 
-	return vpu_core_driver_init();
+	ret = vpu_core_driver_init();
+	if (ret)
+		platform_driver_unregister(&amphion_vpu_driver);
+
+	return ret;
 }
 
 static void __exit vpu_driver_exit(void)
-- 
2.17.1

