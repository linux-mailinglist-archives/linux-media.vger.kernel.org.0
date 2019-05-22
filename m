Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6363A26026
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbfEVJJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:09:49 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52145 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728625AbfEVJJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:09:49 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hTNFr-0003Zr-Lq; Wed, 22 May 2019 11:09:47 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH v2] media: coda: add decoder MPEG-4 profile and level controls
Date:   Wed, 22 May 2019 11:09:46 +0200
Message-Id: <20190522090946.3814-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521082940.774cb91e@coco.lan>
References: <20190521082940.774cb91e@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MPEG-4 decoder firmware reports profile and level indication values
that can be used to update V4L2 MPEG-4 profile and level controls.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v1 [1]:
 - Fix coda_decode_ctrls trying to set mpeg2_level_ctrl read-only,
   that should be mpeg4_level_ctrl.

[1] https://patchwork.linuxtv.org/patch/55647/
---
 drivers/media/platform/coda/Makefile      |  2 +-
 drivers/media/platform/coda/coda-common.c | 23 +++++++++++
 drivers/media/platform/coda/coda-mpeg4.c  | 48 +++++++++++++++++++++++
 drivers/media/platform/coda/coda.h        |  5 +++
 4 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/coda/coda-mpeg4.c

diff --git a/drivers/media/platform/coda/Makefile b/drivers/media/platform/coda/Makefile
index 858284328af9..3a068206cea8 100644
--- a/drivers/media/platform/coda/Makefile
+++ b/drivers/media/platform/coda/Makefile
@@ -1,6 +1,6 @@
 ccflags-y += -I$(src)
 
-coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-jpeg.o
+coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg4.o coda-jpeg.o
 
 obj-$(CONFIG_VIDEO_CODA) += coda.o
 obj-$(CONFIG_VIDEO_IMX_VDOA) += imx-vdoa.o
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 1856b782fdde..01b641996ed2 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1590,6 +1590,15 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 		profile = coda_h264_profile(profile_idc);
 		level = coda_h264_level(level_idc);
 		break;
+	case V4L2_PIX_FMT_MPEG4:
+		codec_name = "MPEG-4";
+		profile_cid = V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE;
+		level_cid = V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL;
+		profile_ctrl = ctx->mpeg4_profile_ctrl;
+		level_ctrl = ctx->mpeg4_level_ctrl;
+		profile = coda_mpeg4_profile(profile_idc);
+		level = coda_mpeg4_level(level_idc);
+		break;
 	default:
 		return;
 	}
@@ -2119,6 +2128,20 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
 		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL, max, 0, max);
 	if (ctx->h264_level_ctrl)
 		ctx->h264_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ctx->mpeg4_profile_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
+		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
+		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY, 0,
+		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY);
+	if (ctx->mpeg4_profile_ctrl)
+		ctx->mpeg4_profile_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ctx->mpeg4_level_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
+		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
+		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5, 0,
+		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5);
+	if (ctx->mpeg4_level_ctrl)
+		ctx->mpeg4_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 }
 
 static int coda_ctrls_setup(struct coda_ctx *ctx)
diff --git a/drivers/media/platform/coda/coda-mpeg4.c b/drivers/media/platform/coda/coda-mpeg4.c
new file mode 100644
index 000000000000..762091ae1956
--- /dev/null
+++ b/drivers/media/platform/coda/coda-mpeg4.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Coda multi-standard codec IP - MPEG-4 helper functions
+ *
+ * Copyright (C) 2019 Pengutronix, Philipp Zabel
+ */
+
+#include <linux/kernel.h>
+#include <linux/videodev2.h>
+#include <coda.h>
+
+int coda_mpeg4_profile(int profile_idc)
+{
+	switch (profile_idc) {
+	case 0:
+		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE;
+	case 15:
+		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE;
+	case 2:
+		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_CORE;
+	case 1:
+		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE;
+	case 11:
+		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY;
+	default:
+		return -EINVAL;
+	}
+}
+
+int coda_mpeg4_level(int level_idc)
+{
+	switch (level_idc) {
+	case 0:
+		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_0;
+	case 1:
+		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_1;
+	case 2:
+		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_2;
+	case 3:
+		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_3;
+	case 4:
+		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_4;
+	case 5:
+		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_5;
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 1c822dfdb3ce..d8c8b3777db8 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -217,6 +217,8 @@ struct coda_ctx {
 	struct v4l2_ctrl_handler	ctrls;
 	struct v4l2_ctrl		*h264_profile_ctrl;
 	struct v4l2_ctrl		*h264_level_ctrl;
+	struct v4l2_ctrl		*mpeg4_profile_ctrl;
+	struct v4l2_ctrl		*mpeg4_level_ctrl;
 	struct v4l2_fh			fh;
 	int				gopcounter;
 	int				runcounter;
@@ -328,6 +330,9 @@ int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb);
 int coda_h264_sps_fixup(struct coda_ctx *ctx, int width, int height, char *buf,
 			int *size, int max_size);
 
+int coda_mpeg4_profile(int profile_idc);
+int coda_mpeg4_level(int level_idc);
+
 void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 				     u8 level_idc);
 
-- 
2.20.1

