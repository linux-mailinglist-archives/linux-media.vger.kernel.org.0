Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48C12DC11D
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgLPNVl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:21:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9622 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPNVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:21:41 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwwjK6sdjz15cRM;
        Wed, 16 Dec 2020 21:20:21 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:20:51 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <p.zabel@pengutronix.de>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] media/platform/coda: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:21:23 +0800
Message-ID: <20201216132123.15099-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/media/platform/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 87a2c706f747..547ad34b1424 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2861,7 +2861,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	strscpy(vfd->name, dev->devtype->vdevs[i]->name, sizeof(vfd->name));
 	vfd->fops	= &coda_fops;
 	vfd->ioctl_ops	= &coda_ioctl_ops;
-	vfd->release	= video_device_release_empty,
+	vfd->release	= video_device_release_empty;
 	vfd->lock	= &dev->dev_mutex;
 	vfd->v4l2_dev	= &dev->v4l2_dev;
 	vfd->vfl_dir	= VFL_DIR_M2M;
-- 
2.22.0

