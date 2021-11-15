Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFD144FF58
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 08:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbhKOHst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 02:48:49 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:55113 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhKOHsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 02:48:47 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1AF7Kqj7080860;
        Mon, 15 Nov 2021 15:20:52 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Nov
 2021 15:44:26 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <hverkuil-cisco@xs4all.nl>,
        <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/9] media: aspeed: move err-handling together to the bottom
Date:   Mon, 15 Nov 2021 15:44:29 +0800
Message-ID: <20211115074437.28079-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115074437.28079-1-jammy_huang@aspeedtech.com>
References: <20211115074437.28079-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AF7Kqj7080860
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

refine aspeed_video_setup_video() flow.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v4:
  - no update
v3:
  - no update
v2:
  - no update
---
 drivers/media/platform/aspeed-video.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index fea5e4d0927e..f5c40d6b4ece 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1641,11 +1641,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 
 	rc = video->ctrl_handler.error;
 	if (rc) {
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to init controls: %d\n", rc);
-		return rc;
+		goto err_ctrl_init;
 	}
 
 	v4l2_dev->ctrl_handler = &video->ctrl_handler;
@@ -1663,11 +1660,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to init vb2 queue\n");
-		return rc;
+		goto err_vb2_init;
 	}
 
 	vdev->queue = vbq;
@@ -1685,15 +1679,19 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	video_set_drvdata(vdev, video);
 	rc = video_register_device(vdev, VFL_TYPE_GRABBER, 0);
 	if (rc) {
-		vb2_queue_release(vbq);
-		v4l2_ctrl_handler_free(&video->ctrl_handler);
-		v4l2_device_unregister(v4l2_dev);
-
 		dev_err(video->dev, "Failed to register video device\n");
-		return rc;
+		goto err_video_reg;
 	}
 
 	return 0;
+
+err_video_reg:
+	vb2_queue_release(vbq);
+err_vb2_init:
+err_ctrl_init:
+	v4l2_ctrl_handler_free(&video->ctrl_handler);
+	v4l2_device_unregister(v4l2_dev);
+	return rc;
 }
 
 static int aspeed_video_init(struct aspeed_video *video)
-- 
2.25.1

