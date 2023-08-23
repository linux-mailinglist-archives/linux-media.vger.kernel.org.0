Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E596785A60
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 16:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbjHWOYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 10:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236360AbjHWOYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 10:24:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5E8E74
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 07:24:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC2366637F
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 14:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28346C433C9;
        Wed, 23 Aug 2023 14:24:03 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 2/3] media: include v4l2-mem2mem-codec.h in codec drivers
Date:   Wed, 23 Aug 2023 16:23:58 +0200
Message-Id: <20230823142359.602411-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823142359.602411-1-hverkuil-cisco@xs4all.nl>
References: <20230823142359.602411-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The codec specific parts of v4l2-mem2mem.h will move to
v4l2-mem2mem-codec.h in the next patch, so include this
new header where needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/allegro-dvt/allegro-core.c               | 2 +-
 drivers/media/platform/amphion/vdec.c                           | 2 +-
 drivers/media/platform/amphion/venc.c                           | 2 +-
 drivers/media/platform/chips-media/coda-common.c                | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c            | 2 +-
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c | 2 +-
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 2 +-
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 2 +-
 drivers/media/platform/nvidia/tegra-vde/vde.h                   | 2 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                  | 2 +-
 drivers/media/platform/verisilicon/hantro_drv.c                 | 2 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c                | 2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c               | 2 +-
 drivers/media/test-drivers/visl/visl-dec.c                      | 2 +-
 drivers/staging/media/meson/vdec/vdec.c                         | 2 +-
 drivers/staging/media/rkvdec/rkvdec.c                           | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c                 | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c                  | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c               | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index da61f9beb6b4..032bec973095 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -27,7 +27,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 133d77d1ea0c..4c4ffbd2967c 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -13,7 +13,7 @@
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 4eb57d793a9c..ceb3c88e971f 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -16,7 +16,7 @@
 #include <linux/vmalloc.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index cc4892129aaf..ae01d517e2db 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -32,7 +32,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-vmalloc.h>
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 621038aab116..cde3fa5dc76d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -18,7 +18,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 91ed576d6821..c401fcf662ff 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -6,7 +6,7 @@
  */
 
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/videobuf2-dma-contig.h>
 
 #include "mtk_vcodec_dec_drv.h"
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index e29c9c58f3da..85a633f7f22e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -3,7 +3,7 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <linux/module.h>
 
 #include "mtk_vcodec_dec.h"
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 8e44a051edda..a2316eb71201 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -6,7 +6,7 @@
 */
 
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/videobuf2-dma-contig.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.h b/drivers/media/platform/nvidia/tegra-vde/vde.h
index 0fbb1f3d2c88..3417594b2661 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.h
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.h
@@ -23,7 +23,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 
 #define ICMDQUE_WR		0x00
 #define CMDQUE_CONTROL		0x08
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b7a720198ce5..0141b4b45ee2 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -54,7 +54,7 @@
 #include <linux/string.h>
 
 #include <media/v4l2-jpeg.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 423fc85d79ee..c5f408ed14b4 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -20,7 +20,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index b3ae037a50f6..879c36b72024 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -22,7 +22,7 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 
 #include "hantro.h"
 #include "hantro_hw.h"
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 6f0e20df74e9..e35876efc551 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -16,7 +16,7 @@
 #include <linux/slab.h>
 
 #include <linux/platform_device.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index 318d675e5668..a31772f8bef6 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -16,7 +16,7 @@
 
 #include <linux/delay.h>
 #include <linux/workqueue.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/tpg/v4l2-tpg.h>
 
 static void *plane_vaddr(struct tpg_data *tpg, struct vb2_buffer *buf,
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5ca4b1200831..42177c07e33b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -16,7 +16,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/v4l2-dev.h>
 #include <media/videobuf2-dma-contig.h>
 
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 84a41792cb4b..fc9d96824049 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -20,7 +20,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index fbbf9e6f0f50..5f4026693e98 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -16,7 +16,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 
 #include "cedrus.h"
 #include "cedrus_dec.h"
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index fa86a658fdc6..4e62a2afc920 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -25,7 +25,7 @@
 #include <linux/soc/sunxi/sunxi_sram.h>
 
 #include <media/videobuf2-core.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 
 #include "cedrus.h"
 #include "cedrus_hw.h"
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index b00feaf4072c..a8ddf5bc7361 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -19,7 +19,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-mem2mem-codec.h>
 
 #include "cedrus.h"
 #include "cedrus_video.h"
-- 
2.40.1

