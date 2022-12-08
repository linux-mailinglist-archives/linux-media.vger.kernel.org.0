Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252EB646A08
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 09:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiLHIBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 03:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiLHIBx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 03:01:53 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2668154747
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 00:01:52 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NSRRb3n51zmWTD;
        Thu,  8 Dec 2022 16:00:59 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 8 Dec
 2022 16:01:49 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <tian.shu.qiu@intel.com>, <shawnx.tu@intel.com>,
        <bingbu.cao@intel.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH 2/2] media: ov5675: Fix memleak in ov5675_init_controls()
Date:   Thu, 8 Dec 2022 15:59:38 +0800
Message-ID: <20221208075938.13764-3-shangxiaojing@huawei.com>
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

There is a kmemleak when testing the media/i2c/ov5675.c with bpf mock
device:

AssertionError: unreferenced object 0xffff888107362160 (size 16):
  comm "python3", pid 277, jiffies 4294832798 (age 20.722s)
  hex dump (first 16 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000abe7d67c>] __kmalloc_node+0x44/0x1b0
    [<000000008a725aac>] kvmalloc_node+0x34/0x180
    [<000000009a53cd11>] v4l2_ctrl_handler_init_class+0x11d/0x180
[videodev]
    [<0000000055b46db0>] ov5675_probe+0x38b/0x897 [ov5675]
    [<00000000153d886c>] i2c_device_probe+0x28d/0x680
    [<000000004afb7e8f>] really_probe+0x17c/0x3f0
    [<00000000ff2f18e4>] __driver_probe_device+0xe3/0x170
    [<000000000a001029>] driver_probe_device+0x49/0x120
    [<00000000e39743c7>] __device_attach_driver+0xf7/0x150
    [<00000000d32fd070>] bus_for_each_drv+0x114/0x180
    [<000000009083ac41>] __device_attach+0x1e5/0x2d0
    [<0000000015b4a830>] bus_probe_device+0x126/0x140
    [<000000007813deaf>] device_add+0x810/0x1130
    [<000000007becb867>] i2c_new_client_device+0x386/0x540
    [<000000007f9cf4b4>] of_i2c_register_device+0xf1/0x110
    [<00000000ebfdd032>] of_i2c_notify+0xfc/0x1f0

ov5675_init_controls() won't clean all the allocated resources in fail
path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
prevent memleak.

Fixes: bf27502b1f3b ("media: ov5675: Add support for OV5675 sensor")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/media/i2c/ov5675.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 94dc8cb7a7c0..a6e6b367d128 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -820,8 +820,10 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
 			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 
-	if (ctrl_hdlr->error)
+	if (ctrl_hdlr->error) {
+		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ctrl_hdlr->error;
+	}
 
 	ov5675->sd.ctrl_handler = ctrl_hdlr;
 
-- 
2.17.1

