Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA6842EE28
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 11:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbhJOJxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 05:53:38 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:14358 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhJOJxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 05:53:37 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HW1ct0Cqmz9040;
        Fri, 15 Oct 2021 17:46:38 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 15 Oct 2021 17:51:28 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 15 Oct
 2021 17:51:27 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>
Subject: [PATCH] media: si470x-i2c: fix possible memory leak in si470x_i2c_probe()
Date:   Fri, 15 Oct 2021 17:58:55 +0800
Message-ID: <20211015095855.3621089-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

n the 'radio->hdl.error' error handling, ctrl handler allocated by
v4l2_ctrl_new_std() does not released, and caused memory leak as
follows:

unreferenced object 0xffff888033d54200 (size 256):
  comm "i2c-si470x-19", pid 909, jiffies 4294914203 (age 8.072s)
  hex dump (first 32 bytes):
    e8 69 11 03 80 88 ff ff 00 46 d5 33 80 88 ff ff  .i.......F.3....
    10 42 d5 33 80 88 ff ff 10 42 d5 33 80 88 ff ff  .B.3.....B.3....
  backtrace:
    [<00000000086bd4ed>] __kmalloc_node+0x1eb/0x360
    [<00000000bdb68871>] kvmalloc_node+0x66/0x120
    [<00000000fac74e4c>] v4l2_ctrl_new+0x7b9/0x1c60 [videodev]
    [<00000000693bf940>] v4l2_ctrl_new_std+0x19b/0x270 [videodev]
    [<00000000c0cb91bc>] si470x_i2c_probe+0x2d3/0x9a0 [radio_si470x_i2c]
    [<0000000056a6f01f>] i2c_device_probe+0x4d8/0xbe0

Fix the error handling path to avoid memory leak.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 8c081b6f9a9b ("media: radio: Critical v4l2 registration...")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index f491420d7b53..eb1b777245ee 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -368,7 +368,7 @@ static int si470x_i2c_probe(struct i2c_client *client)
 	if (radio->hdl.error) {
 		retval = radio->hdl.error;
 		dev_err(&client->dev, "couldn't register control\n");
-		goto err_dev;
+		goto err_all;
 	}
 
 	/* video device initialization */
@@ -463,7 +463,6 @@ static int si470x_i2c_probe(struct i2c_client *client)
 	return 0;
 err_all:
 	v4l2_ctrl_handler_free(&radio->hdl);
-err_dev:
 	v4l2_device_unregister(&radio->v4l2_dev);
 err_initial:
 	return retval;
-- 
2.25.1

