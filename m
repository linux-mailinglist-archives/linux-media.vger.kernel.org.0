Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E667428BAC
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 13:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbhJKLDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 07:03:09 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:25119 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235971AbhJKLDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 07:03:08 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HSbQq5nBPz1DHYp;
        Mon, 11 Oct 2021 18:59:31 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 19:01:06 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 19:01:05 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH] media: lm3560: prevent memory leak of v4l2_ctrl_handler
Date:   Mon, 11 Oct 2021 19:39:15 +0800
Message-ID: <20211011113915.2646960-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If lm3560_subdev_init() or lm3560_init_device() failed, lm3560_probe() will
directly return without free v4l2_ctrl_handler, which results memory leak:

unreferenced object 0xffff8881ea566e00 (size 256):
  comm "xrun", pid 396, jiffies 4294949372 (age 80.376s)
  hex dump (first 32 bytes):
    d8 82 81 4d 81 88 ff ff 00 4c 56 ea 81 88 ff ff  ...M.....LV.....
    10 6e 56 ea 81 88 ff ff 10 6e 56 ea 81 88 ff ff  .nV......nV.....
  backtrace:
    [<0000000055d4bb48>] __kmalloc_node+0x198/0x330
    [<00000000e3b57405>] kvmalloc_node+0x65/0x130
    [<0000000061e6063e>] v4l2_ctrl_new+0x820/0x1d40 [videodev]
    [<00000000d7174c1b>] v4l2_ctrl_new_std+0x1d5/0x2b0 [videodev]
    [<00000000cefb1a26>] lm3560_subdev_init+0x374/0x5e0 [lm3560]
    [<00000000cda4c495>] lm3560_probe+0x1c2/0x61a [lm3560]
    [<00000000d9502788>] i2c_device_probe+0xa07/0xbb0
    [<00000000a5e908d0>] really_probe+0x285/0xc30
    [<000000002fee9400>] __driver_probe_device+0x35f/0x4f0
    [<0000000025fd5e96>] driver_probe_device+0x4f/0x140
    [<00000000d37732ef>] __device_attach_driver+0x24c/0x330
    [<000000001e0f0dfd>] bus_for_each_drv+0x15d/0x1e0
    [<00000000c6c72d57>] __device_attach+0x267/0x410
    [<000000005f7e4b8c>] bus_probe_device+0x1ec/0x2a0
    [<000000001c3d09f6>] device_add+0xc1c/0x1d50
    [<00000000cddb870a>] i2c_new_client_device+0x614/0xb00

Fixes: 7f6b11a18c30 ("[media] media: i2c: add driver for dual LED Flash, lm3560")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/media/i2c/lm3560.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 9e34ccce4fc3..8d2e224c725b 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -432,15 +432,22 @@ static int lm3560_probe(struct i2c_client *client,
 
 	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
 	if (rval < 0)
-		return rval;
+		goto free_led0;
 
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
-		return rval;
+		goto free_led1;
 
 	i2c_set_clientdata(client, flash);
 
 	return 0;
+
+free_led1:
+	v4l2_ctrl_handler_free(&flash->ctrls_led[LM3560_LED1]);
+free_led0:
+	v4l2_ctrl_handler_free(&flash->ctrls_led[LM3560_LED0]);
+
+	return rval;
 }
 
 static int lm3560_remove(struct i2c_client *client)
-- 
2.25.1

