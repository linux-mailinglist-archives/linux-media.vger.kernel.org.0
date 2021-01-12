Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003C22F3B35
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 20:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436747AbhALTwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 14:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406358AbhALTwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 14:52:22 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EF6C061794
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 11:51:41 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 40B971F45506
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 2/6] media: pxa_camera: Drop the v4l2-clk clock register
Date:   Tue, 12 Jan 2021 16:49:15 -0300
Message-Id: <20210112194919.50176-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112194919.50176-1-ezequiel@collabora.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that mach-based PXA platforms are registering proper
fixed-rate clocks through the CCF, the v4l2-clk clock
is no longer required.

Drop this clock, so the driver no longer depends on the
legacy v4l2-clk API.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/pxa_camera.c | 30 +----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index b664ce7558a1..8cfa39108162 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -31,7 +31,6 @@
 #include <linux/dma/pxa-dma.h>
 
 #include <media/v4l2-async.h>
-#include <media/v4l2-clk.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -677,7 +676,6 @@ struct pxa_camera_dev {
 	unsigned long		ciclk;
 	unsigned long		mclk;
 	u32			mclk_divisor;
-	struct v4l2_clk		*mclk_clk;
 	u16			width_flags;	/* max 10 bits */
 
 	struct list_head	capture;
@@ -2030,9 +2028,6 @@ static const struct v4l2_ioctl_ops pxa_camera_ioctl_ops = {
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
 
-static const struct v4l2_clk_ops pxa_camera_mclk_ops = {
-};
-
 static const struct video_device pxa_camera_videodev_template = {
 	.name = "pxa-camera",
 	.minor = -1,
@@ -2140,11 +2135,6 @@ static void pxa_camera_sensor_unbind(struct v4l2_async_notifier *notifier,
 
 	pxa_camera_destroy_formats(pcdev);
 
-	if (pcdev->mclk_clk) {
-		v4l2_clk_unregister(pcdev->mclk_clk);
-		pcdev->mclk_clk = NULL;
-	}
-
 	video_unregister_device(&pcdev->vdev);
 	pcdev->sensor = NULL;
 
@@ -2278,7 +2268,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
 		.src_maxburst = 8,
 		.direction = DMA_DEV_TO_MEM,
 	};
-	char clk_name[V4L2_CLK_NAME_SIZE];
 	int irq;
 	int err = 0, i;
 
@@ -2417,23 +2406,11 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (err)
 		goto exit_notifier_cleanup;
 
-	v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
-			  pcdev->asd.match.i2c.adapter_id,
-			  pcdev->asd.match.i2c.address);
-
-	pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops, clk_name, NULL);
-	if (IS_ERR(pcdev->mclk_clk)) {
-		err = PTR_ERR(pcdev->mclk_clk);
-		goto exit_notifier_cleanup;
-	}
-
 	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev->notifier);
 	if (err)
-		goto exit_free_clk;
+		goto exit_notifier_cleanup;
 
 	return 0;
-exit_free_clk:
-	v4l2_clk_unregister(pcdev->mclk_clk);
 exit_notifier_cleanup:
 	v4l2_async_notifier_cleanup(&pcdev->notifier);
 exit_free_v4l2dev:
@@ -2463,11 +2440,6 @@ static int pxa_camera_remove(struct platform_device *pdev)
 	v4l2_async_notifier_unregister(&pcdev->notifier);
 	v4l2_async_notifier_cleanup(&pcdev->notifier);
 
-	if (pcdev->mclk_clk) {
-		v4l2_clk_unregister(pcdev->mclk_clk);
-		pcdev->mclk_clk = NULL;
-	}
-
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 
 	dev_info(&pdev->dev, "PXA Camera driver unloaded\n");
-- 
2.29.2

