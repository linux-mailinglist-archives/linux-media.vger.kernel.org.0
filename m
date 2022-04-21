Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8ACE50AC1F
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442671AbiDUXpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442670AbiDUXpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E61DF94
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:43:00 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DE5D4A8;
        Fri, 22 Apr 2022 01:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584571;
        bh=2yIKGV9kIEjg/0vtc/CzTcUTC+yOP9BxXKGpf4lI0CM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LGdIB5HfFlBWYGYuIJqUpIKfvJ4zV2dDTRH3V1Vyhv6ga9eVfCh0DCNbt4Ba2Ho4D
         m/rN+756zDNo67cqmcCW9vb8f/Tw0XM8tV/8016ULcRkgpZoU3eAKNFjyDT1X1mLcY
         d/wWz2+LFwfLi3rOV2hgBz0itPDuY8hXlJdtvV4U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 12/21] media: rkisp1: Move debugfs code to a separate file
Date:   Fri, 22 Apr 2022 02:42:31 +0300
Message-Id: <20220421234240.1694-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To avoid cluttering the main rkisp1-dev.c driver file, move debugfs code
to a separate source file. This prepares for extensions to the debugfs
infrastructure.

While at it, add a missing forward declaration for struct dentry in
rkisp1-common.h to avoid depending on indirect includes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../media/platform/rockchip/rkisp1/Makefile   |  1 +
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  5 ++
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 50 +++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 33 +-----------
 4 files changed, 57 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c

diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
index ab32a77db8f7..1a39bdcc608e 100644
--- a/drivers/media/platform/rockchip/rkisp1/Makefile
+++ b/drivers/media/platform/rockchip/rkisp1/Makefile
@@ -3,6 +3,7 @@
 obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
 rockchip-isp1-objs += 	rkisp1-capture.o \
 			rkisp1-common.o \
+			rkisp1-debug.o \
 			rkisp1-dev.o \
 			rkisp1-isp.o \
 			rkisp1-resizer.o \
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 3b36ab05ac34..07a92ed8bdc8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -23,6 +23,8 @@
 
 #include "rkisp1-regs.h"
 
+struct dentry;
+
 /*
  * flags on the 'direction' field in struct 'rkisp1_isp_mbus_info' that indicate
  * on which pad the media bus format is supported
@@ -516,4 +518,7 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
 int rkisp1_params_register(struct rkisp1_device *rkisp1);
 void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
+void rkisp1_debug_init(struct rkisp1_device *rkisp1);
+void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
+
 #endif /* _RKISP1_COMMON_H */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
new file mode 100644
index 000000000000..64b33774cbdf
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - Base driver
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+
+#include "rkisp1-common.h"
+
+void rkisp1_debug_init(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_debug *debug = &rkisp1->debug;
+
+	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
+
+	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
+			     &debug->data_loss);
+	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
+			     &debug->outform_size_error);
+	debugfs_create_ulong("img_stabilization_size_error", 0444,
+			     debug->debugfs_dir,
+			     &debug->img_stabilization_size_error);
+	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
+			     &debug->inform_size_error);
+	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
+			     &debug->irq_delay);
+	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
+			     &debug->mipi_error);
+	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
+			     &debug->stats_error);
+	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
+			     &debug->stop_timeout[RKISP1_MAINPATH]);
+	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
+			     &debug->stop_timeout[RKISP1_SELFPATH]);
+	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
+			     &debug->frame_drop[RKISP1_MAINPATH]);
+	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
+			     &debug->frame_drop[RKISP1_SELFPATH]);
+}
+
+void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
+{
+	debugfs_remove_recursive(rkisp1->debug.debugfs_dir);
+}
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index f8b2573aa9da..c7ad1986e67b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -460,36 +459,6 @@ static const struct of_device_id rkisp1_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rkisp1_of_match);
 
-static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
-{
-	struct rkisp1_debug *debug = &rkisp1->debug;
-
-	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
-	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
-			     &debug->data_loss);
-	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
-			     &debug->outform_size_error);
-	debugfs_create_ulong("img_stabilization_size_error", 0444,
-			     debug->debugfs_dir,
-			     &debug->img_stabilization_size_error);
-	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
-			     &debug->inform_size_error);
-	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
-			     &debug->irq_delay);
-	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
-			     &debug->mipi_error);
-	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
-			     &debug->stats_error);
-	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
-			     &debug->stop_timeout[RKISP1_MAINPATH]);
-	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
-			     &debug->stop_timeout[RKISP1_SELFPATH]);
-	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
-			     &debug->frame_drop[RKISP1_MAINPATH]);
-	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
-			     &debug->frame_drop[RKISP1_SELFPATH]);
-}
-
 static int rkisp1_probe(struct platform_device *pdev)
 {
 	const struct rkisp1_match_data *match_data;
@@ -586,13 +555,13 @@ static int rkisp1_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&rkisp1->notifier);
 
 	rkisp1_entities_unregister(rkisp1);
+	rkisp1_debug_cleanup(rkisp1);
 
 	media_device_unregister(&rkisp1->media_dev);
 	v4l2_device_unregister(&rkisp1->v4l2_dev);
 
 	pm_runtime_disable(&pdev->dev);
 
-	debugfs_remove_recursive(rkisp1->debug.debugfs_dir);
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

