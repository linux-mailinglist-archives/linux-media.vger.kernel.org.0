Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE522CE980
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 09:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbgLDIZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 03:25:16 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9378 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgLDIZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 03:25:16 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CnQj16RR5z73yZ;
        Fri,  4 Dec 2020 16:24:05 +0800 (CST)
Received: from compute.localdomain (10.175.112.70) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 4 Dec 2020 16:24:23 +0800
From:   Zhang Changzhong <zhangchangzhong@huawei.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Zhang Changzhong <zhangchangzhong@huawei.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: aspeed: fix error return code in aspeed_video_setup_video()
Date:   Fri, 4 Dec 2020 16:27:58 +0800
Message-ID: <1607070478-32465-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/media/platform/aspeed-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index c46a79e..f2c4dad 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1551,12 +1551,12 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 			       V4L2_JPEG_CHROMA_SUBSAMPLING_420, mask,
 			       V4L2_JPEG_CHROMA_SUBSAMPLING_444);
 
-	if (video->ctrl_handler.error) {
+	rc = video->ctrl_handler.error;
+	if (rc) {
 		v4l2_ctrl_handler_free(&video->ctrl_handler);
 		v4l2_device_unregister(v4l2_dev);
 
-		dev_err(video->dev, "Failed to init controls: %d\n",
-			video->ctrl_handler.error);
+		dev_err(video->dev, "Failed to init controls: %d\n", rc);
 		return rc;
 	}
 
-- 
2.9.5

