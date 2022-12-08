Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1DC646A0A
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 09:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiLHIB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 03:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiLHIBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 03:01:54 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A92F54751
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 00:01:52 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NSRRY62b6zRprZ;
        Thu,  8 Dec 2022 16:00:57 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 8 Dec
 2022 16:01:49 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <tian.shu.qiu@intel.com>, <shawnx.tu@intel.com>,
        <bingbu.cao@intel.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH 1/2] media: ov2740: Fix memleak in ov2740_init_controls()
Date:   Thu, 8 Dec 2022 15:59:37 +0800
Message-ID: <20221208075938.13764-2-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221208075938.13764-1-shangxiaojing@huawei.com>
References: <20221208075938.13764-1-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a kmemleak when testing the media/i2c/ov2740.c with bpf mock
device:

unreferenced object 0xffff8881090e19e0 (size 16):
  comm "51-i2c-ov2740", pid 278, jiffies 4294781584 (age 23.613s)
  hex dump (first 16 bytes):
    00 f3 7c 0b 81 88 ff ff 80 75 6a 09 81 88 ff ff  ..|......uj.....
  backtrace:
    [<000000004e9fad8f>] __kmalloc_node+0x44/0x1b0
    [<0000000039c802f4>] kvmalloc_node+0x34/0x180
    [<000000009b8b5c63>] v4l2_ctrl_handler_init_class+0x11d/0x180
[videodev]
    [<0000000038644056>] ov2740_probe+0x37d/0x84f [ov2740]
    [<0000000092489f59>] i2c_device_probe+0x28d/0x680
    [<000000001038babe>] really_probe+0x17c/0x3f0
    [<0000000098c7af1c>] __driver_probe_device+0xe3/0x170
    [<00000000e1b3dc24>] device_driver_attach+0x34/0x80
    [<000000005a04a34d>] bind_store+0x10b/0x1a0
    [<00000000ce25d4f2>] drv_attr_store+0x49/0x70
    [<000000007d9f4e9a>] sysfs_kf_write+0x8c/0xb0
    [<00000000be6cff0f>] kernfs_fop_write_iter+0x216/0x2e0
    [<0000000031ddb40a>] vfs_write+0x658/0x810
    [<0000000041beecdd>] ksys_write+0xd6/0x1b0
    [<0000000023755840>] do_syscall_64+0x38/0x90
    [<00000000b2cc2da2>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

ov2740_init_controls() won't clean all the allocated resources in fail
path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
prevent memleak.

Fixes: 866edc895171 ("media: i2c: Add ov2740 image sensor driver")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/media/i2c/ov2740.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 5d74ad479214..628ab86698c0 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -630,8 +630,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
 				     0, 0, ov2740_test_pattern_menu);
-	if (ctrl_hdlr->error)
+	if (ctrl_hdlr->error) {
+		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ctrl_hdlr->error;
+	}
 
 	ov2740->sd.ctrl_handler = ctrl_hdlr;
 
-- 
2.17.1

