Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A041434AA0
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 13:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJTMBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 08:01:38 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:25304 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhJTMBh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 08:01:37 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZ8DR2WtCzcfdv;
        Wed, 20 Oct 2021 19:54:47 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (7.193.23.3) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 19:59:20 +0800
Received: from huawei.com (10.175.104.82) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 19:59:20 +0800
From:   Wang Hai <wanghai38@huawei.com>
To:     <mchehab@kernel.org>, <gshark.jeong@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: i2c: lm3560: Fix possible memory leak in lm3560_probe()
Date:   Wed, 20 Oct 2021 19:58:24 +0800
Message-ID: <20211020115824.2013778-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600001.china.huawei.com (7.193.23.3)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the error handling path of lm3560_probe(), ctrl handler allocated by
lm3560_subdev_init() does not released, and caused memory leak as
follows:

unreferenced object 0xffff888257dbac10 (size 16):
  comm "35", pid 6061, jiffies 4299029793 (age 201.830s)
  hex dump (first 16 bytes):
    40 06 ff 0c 81 88 ff ff 40 24 ff 0c 81 88 ff ff  @.......@$......
  backtrace:
    [<ffffffff8167939c>] slab_post_alloc_hook+0x9c/0x490
    [<ffffffff8167e3eb>] __kmalloc_node+0x16b/0x3a0
    [<ffffffff815a27df>] kvmalloc_node+0x4f/0xf0
    [<ffffffff832807a9>] v4l2_ctrl_handler_init_class+0xf9/0x160
    [<ffffffffa01f8180>] lm3560_subdev_init+0x120/0x340 [lm3560]
    [<ffffffffa01f882c>] lm3560_probe+0x17c/0x370 [lm3560]
    [<ffffffff8321d463>] i2c_device_probe+0x5d3/0x600
    [<ffffffff82b59630>] really_probe+0x190/0x480
    [<ffffffff82b59a19>] __driver_probe_device+0xf9/0x180
    [<ffffffff82b59af3>] driver_probe_device+0x53/0x130
    [<ffffffff82b5a075>] __device_attach_driver+0x105/0x130
    [<ffffffff82b55949>] bus_for_each_drv+0x129/0x190
    [<ffffffff82b593c9>] __device_attach+0x1c9/0x270
    [<ffffffff82b5a250>] device_initial_probe+0x20/0x30
    [<ffffffff82b579c2>] bus_probe_device+0x142/0x160
    [<ffffffff82b52e49>] device_add+0x829/0x1300
unreferenced object 0xffff888255118100 (size 256):

Fix the error handling path to avoid memory leak.

Fixes: 7f6b11a18c30 ("[media] media: i2c: add driver for dual LED Flash, lm3560")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/media/i2c/lm3560.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 9e34ccce4fc3..8bd60b14b867 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -432,15 +432,22 @@ static int lm3560_probe(struct i2c_client *client,
 
 	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
 	if (rval < 0)
-		return rval;
+		goto err_subdev_init_led1;
 
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
-		return rval;
+		goto err_init_device;
 
 	i2c_set_clientdata(client, flash);
 
 	return 0;
+
+err_init_device:
+	v4l2_ctrl_handler_free(&flash->ctrls_led[LM3560_LED1]);
+err_subdev_init_led1:
+	v4l2_ctrl_handler_free(&flash->ctrls_led[LM3560_LED0]);
+
+	return rval;
 }
 
 static int lm3560_remove(struct i2c_client *client)
-- 
2.25.1

