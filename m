Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62803DA1EC
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 13:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236577AbhG2LQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 07:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236312AbhG2LQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 07:16:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547A0C061765;
        Thu, 29 Jul 2021 04:16:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id EFFE71F43E00
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH] media: vivid: drop CONFIG_FB dependency
Date:   Thu, 29 Jul 2021 12:16:15 +0100
Message-Id: <bf74a4670438864ca2e6bde47121554490350729.1627557341.git.guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the vivid dependency on CONFIG_FB by compiling out parts of the
code that make use of the framebuffer API when not enabled.  This is
particularly useful as CONFIG_FB is not selected any more by
DRM_FBDEV_EMULATION.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 drivers/media/test-drivers/vivid/Kconfig       | 5 +----
 drivers/media/test-drivers/vivid/Makefile      | 5 ++++-
 drivers/media/test-drivers/vivid/vivid-core.c  | 7 +++++++
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 4 ++++
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
index c3abde2986b2..06ad350f1903 100644
--- a/drivers/media/test-drivers/vivid/Kconfig
+++ b/drivers/media/test-drivers/vivid/Kconfig
@@ -1,13 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_VIVID
 	tristate "Virtual Video Test Driver"
-	depends on VIDEO_DEV && VIDEO_V4L2 && !SPARC32 && !SPARC64 && FB
+	depends on VIDEO_DEV && VIDEO_V4L2 && !SPARC32 && !SPARC64
 	depends on HAS_DMA
 	select FONT_SUPPORT
 	select FONT_8x16
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select VIDEOBUF2_VMALLOC
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEO_V4L2_TPG
diff --git a/drivers/media/test-drivers/vivid/Makefile b/drivers/media/test-drivers/vivid/Makefile
index b12ad0152a3e..a9e4bc8dc599 100644
--- a/drivers/media/test-drivers/vivid/Makefile
+++ b/drivers/media/test-drivers/vivid/Makefile
@@ -3,10 +3,13 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
 		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
 		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
 		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
-		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o \
+		vivid-meta-cap.o vivid-meta-out.o \
 		vivid-kthread-touch.o vivid-touch-cap.o
 ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
   vivid-objs += vivid-cec.o
 endif
+ifeq ($(CONFIG_FB),y)
+  vivid-objs += vivid-osd.o
+endif
 
 obj-$(CONFIG_VIDEO_VIVID) += vivid.o
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index d2bd2653cf54..71f3b9af4ffc 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1021,9 +1021,11 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 	/* do we have a modulator? */
 	*has_modulator = dev->has_radio_tx;
 
+#if IS_ENABLED(CONFIG_FB)
 	if (dev->has_vid_cap)
 		/* do we have a framebuffer for overlay testing? */
 		dev->has_fb = node_type & 0x10000;
+#endif
 
 	/* can we do crop/compose/scaling while capturing? */
 	if (no_error_inj && *ccs_cap == -1)
@@ -1355,6 +1357,7 @@ static int vivid_create_queues(struct vivid_dev *dev)
 			return ret;
 	}
 
+#if IS_ENABLED(CONFIG_FB)
 	if (dev->has_fb) {
 		/* Create framebuffer for testing capture/output overlay */
 		ret = vivid_fb_init(dev);
@@ -1363,6 +1366,8 @@ static int vivid_create_queues(struct vivid_dev *dev)
 		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
 			  dev->fb_info.node);
 	}
+#endif
+
 	return 0;
 }
 
@@ -2069,12 +2074,14 @@ static int vivid_remove(struct platform_device *pdev)
 				video_device_node_name(&dev->radio_tx_dev));
 			video_unregister_device(&dev->radio_tx_dev);
 		}
+#if IS_ENABLED(CONFIG_FB)
 		if (dev->has_fb) {
 			v4l2_info(&dev->v4l2_dev, "unregistering fb%d\n",
 				dev->fb_info.node);
 			unregister_framebuffer(&dev->fb_info);
 			vivid_fb_release_buffers(dev);
 		}
+#endif
 		if (dev->has_meta_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				  video_device_node_name(&dev->meta_cap_dev));
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8dc50fe22972..081470a1d88a 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -305,6 +305,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 
 /* Framebuffer Controls */
 
+#if IS_ENABLED(CONFIG_FB)
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vivid_dev *dev = container_of(ctrl->handler,
@@ -328,6 +329,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_clear_fb = {
 	.name = "Clear Framebuffer",
 	.type = V4L2_CTRL_TYPE_BUTTON,
 };
+#endif /* IS_ENABLED(CONFIG_FB) */
 
 
 /* Video User Controls */
@@ -1761,8 +1763,10 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	    (dev->has_vbi_cap && dev->has_vbi_out))
 		v4l2_ctrl_new_custom(hdl_loop_cap, &vivid_ctrl_loop_video, NULL);
 
+#if IS_ENABLED(CONFIG_FB)
 	if (dev->has_fb)
 		v4l2_ctrl_new_custom(hdl_fb, &vivid_ctrl_clear_fb, NULL);
+#endif
 
 	if (dev->has_radio_rx) {
 		v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_hw_seek_mode, NULL);
-- 
2.20.1

