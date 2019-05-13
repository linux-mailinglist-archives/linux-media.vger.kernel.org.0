Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA701B0D9
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 09:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfEMHJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 03:09:40 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42854 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725980AbfEMHJk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 03:09:40 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A9CC21403EFB371D35F4;
        Mon, 13 May 2019 15:09:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 13 May 2019 15:09:31 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] media: vim2m: fix two double-free issues
Date:   Mon, 13 May 2019 15:18:29 +0800
Message-ID: <20190513071829.140076-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vim2m_device_release() will be called by video_unregister_device() to release
various objects.

There are two double-free issue,
1. dev->m2m_dev will be freed twice in error_m2m path/vim2m_device_release
2. the error_v4l2 and error_free path in vim2m_probe() will release
   same objects, since vim2m_device_release has done.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: ea6c7e34f3b2 ("media: vim2m: replace devm_kzalloc by kzalloc")
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/media/platform/vim2m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vim2m.c b/drivers/media/platform/vim2m.c
index 243c82b5d537..acd3bd48c7e2 100644
--- a/drivers/media/platform/vim2m.c
+++ b/drivers/media/platform/vim2m.c
@@ -1359,7 +1359,7 @@ static int vim2m_probe(struct platform_device *pdev)
 						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
-		goto error_m2m;
+		goto error_dev;
 	}
 
 	ret = media_device_register(&dev->mdev);
@@ -1373,11 +1373,11 @@ static int vim2m_probe(struct platform_device *pdev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 error_m2m_mc:
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
-error_m2m:
-	v4l2_m2m_release(dev->m2m_dev);
 #endif
 error_dev:
 	video_unregister_device(&dev->vfd);
+	/* vim2m_device_release called by video_unregister_device to release various objects */
+	return ret;
 error_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
 error_free:
-- 
2.20.1

