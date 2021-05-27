Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F7A3932B5
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235806AbhE0PrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbhE0Pq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:46:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AC5C061760;
        Thu, 27 May 2021 08:45:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id k14so868694eji.2;
        Thu, 27 May 2021 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dc7BQ4sJISrHK3TUt4LRGD0m+TGibdkJMC0YR4wdQHM=;
        b=TXbxUKXPXyPRavgHGNQCsuvDj+mmg7sBHDmsJYh0p0XvrpoYxFajfHBrY9fUxTNOUW
         1cO+1PS+vVMEmziqunnZ6ADT2ZFUcygyLQecchJ+mQqj+rK1iiFnoeDVSp+RspZVeQJR
         5ruuWDySL61UGhgZxxUdmGKJcy3Jm9yMdlTK7qsITSbhycsZ9cLu+PLtxBXSOwFdIiK8
         12r3I33AffO5vXefx4YNudLWH3OML1oJi8TEVLu3B6WzqfEoFRV1lkV+k9fpeJzvP1OP
         AqHi6xqEVBZyXu+8Vl0a/VINVh8tOWOuygkU1uYPqUO++n7/7AmIfkqtnQxE7xibC6ql
         /3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dc7BQ4sJISrHK3TUt4LRGD0m+TGibdkJMC0YR4wdQHM=;
        b=P3+XwwyDiwEb/7y7rfc1j7bYw35R3yOnyk9w34nwxlH72H4cRP0o/MKFg7Ep6PnrwL
         SZVO9bKo9mCto9QLg8V6BdixjSsq3mR+iBqj/TQYSVNUS1NcLW3r4kHnwqjthXy1phsp
         qcihu4vnj6rIfW7xC+tkhw9cA+ZjPvumcSV437aMU3MdaQJnZN1OdFG0S3+S5a9maxop
         w2+AV6atTiG7CZ2AXerilsA6VlU+p8mYgrgHo5v+4vl/mWSzrY7Fo+ZEXnVUnq6jyDPz
         N71nhhnzQP+ZntAmkA0HJbm6lqI5sf5ujqIzkYcf3OyjXx6QIWSdVd2L1WHiiQek1mGM
         X7Lw==
X-Gm-Message-State: AOAM531dAv7m9Wrd+NC8ATDjgBFNLlFP6ptN6tf3lHy0i1u9gI09NtAF
        k/MLr4C0bEIWzuSXxsv32g==
X-Google-Smtp-Source: ABdhPJzZkIM8Y0xoYJKdvFX5cXF/R6nA94c/5IO7v6bB0OptrwtW/xrKtWMY8aCWxjs9QAR2Zm51Bw==
X-Received: by 2002:a17:907:7797:: with SMTP id ky23mr836284ejc.357.1622130322218;
        Thu, 27 May 2021 08:45:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:21 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/12] media: hantro: merge Rockchip platform drivers
Date:   Thu, 27 May 2021 17:44:48 +0200
Message-Id: <20210527154455.358869-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Merge the two Rockchip platform drivers into one as it was suggested at
[1] and [2].
This will hopefully make it easier to add new variants (which are surely
to come for Rockchip).
Also rename from "rk3288" to "v(d/e)pu1" and "rk3399" to "v(d/e)pu2"
where applicable, as this is the dicition the vendor uses and will
also refelect the variants that get added later in this series. Rename
from "rk3288" to "rockchip" if applicable to both hardware versions.

[1] https://patchwork.kernel.org/project/linux-rockchip/patch/20210107134101.195426-6-paul.kocialkowski@bootlin.com/
[2] https://patchwork.kernel.org/project/linux-rockchip/patch/20210525152225.154302-5-knaerzche@gmail.com/

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - added patch

 drivers/staging/media/hantro/Makefile         |   9 +-
 drivers/staging/media/hantro/hantro_hw.h      |  22 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  | 208 ----------
 drivers/staging/media/hantro/rk3399_vpu_hw.c  | 222 -----------
 ...jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} |  30 +-
 ...eg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} |  25 +-
 ...w_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} |   2 +-
 ...rk3399_vpu_regs.h => rockchip_vpu2_regs.h} |   6 +-
 .../staging/media/hantro/rockchip_vpu_hw.c    | 356 ++++++++++++++++++
 9 files changed, 402 insertions(+), 478 deletions(-)
 delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (93%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
 rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index f4b99901eeee..dfa11bd34d41 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -11,9 +11,9 @@ hantro-vpu-y += \
 		hantro_g1_h264_dec.o \
 		hantro_g1_mpeg2_dec.o \
 		hantro_g1_vp8_dec.o \
-		rk3399_vpu_hw_jpeg_enc.o \
-		rk3399_vpu_hw_mpeg2_dec.o \
-		rk3399_vpu_hw_vp8_dec.o \
+		rockchip_vpu2_hw_jpeg_enc.o \
+		rockchip_vpu2_hw_mpeg2_dec.o \
+		rockchip_vpu2_hw_vp8_dec.o \
 		hantro_jpeg.o \
 		hantro_h264.o \
 		hantro_mpeg2.o \
@@ -26,5 +26,4 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
 		sama5d4_vdec_hw.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
-		rk3288_vpu_hw.o \
-		rk3399_vpu_hw.o
+		rockchip_vpu_hw.o
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index bbdbdb90b628..9798c99b0e25 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -148,16 +148,16 @@ struct hantro_codec_ops {
 /**
  * enum hantro_enc_fmt - source format ID for hardware registers.
  *
- * @RK3288_VPU_ENC_FMT_YUV420P: Y/CbCr 4:2:0 planar format
- * @RK3288_VPU_ENC_FMT_YUV420SP: Y/CbCr 4:2:0 semi-planar format
- * @RK3288_VPU_ENC_FMT_YUYV422: YUV 4:2:2 packed format (YUYV)
- * @RK3288_VPU_ENC_FMT_UYVY422: YUV 4:2:2 packed format (UYVY)
+ * @ROCKCHIP_VPU_ENC_FMT_YUV420P: Y/CbCr 4:2:0 planar format
+ * @ROCKCHIP_VPU_ENC_FMT_YUV420SP: Y/CbCr 4:2:0 semi-planar format
+ * @ROCKCHIP_VPU_ENC_FMT_YUYV422: YUV 4:2:2 packed format (YUYV)
+ * @ROCKCHIP_VPU_ENC_FMT_UYVY422: YUV 4:2:2 packed format (UYVY)
  */
 enum hantro_enc_fmt {
-	RK3288_VPU_ENC_FMT_YUV420P = 0,
-	RK3288_VPU_ENC_FMT_YUV420SP = 1,
-	RK3288_VPU_ENC_FMT_YUYV422 = 2,
-	RK3288_VPU_ENC_FMT_UYVY422 = 3,
+	ROCKCHIP_VPU_ENC_FMT_YUV420P = 0,
+	ROCKCHIP_VPU_ENC_FMT_YUV420SP = 1,
+	ROCKCHIP_VPU_ENC_FMT_YUYV422 = 2,
+	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
 };
 
 extern const struct hantro_variant imx8mq_vpu_variant;
@@ -181,7 +181,7 @@ irqreturn_t hantro_g1_irq(int irq, void *dev_id);
 void hantro_g1_reset(struct hantro_ctx *ctx);
 
 void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
-void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
+void rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx);
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
@@ -221,14 +221,14 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 }
 
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
-void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
+void rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 				  const struct v4l2_ctrl_mpeg2_quantisation *ctrl);
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
 
 void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx);
-void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx);
+void rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx);
 int hantro_vp8_dec_init(struct hantro_ctx *ctx);
 void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
 void hantro_vp8_prob_update(struct hantro_ctx *ctx,
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
deleted file mode 100644
index fefd45269e52..000000000000
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ /dev/null
@@ -1,208 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Hantro VPU codec driver
- *
- * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
- *	Jeffy Chen <jeffy.chen@rock-chips.com>
- */
-
-#include <linux/clk.h>
-
-#include "hantro.h"
-#include "hantro_jpeg.h"
-#include "hantro_h1_regs.h"
-
-#define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
-
-/*
- * Supported formats.
- */
-
-static const struct hantro_fmt rk3288_vpu_enc_fmts[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_YUV420M,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420P,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV12M,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420SP,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YUYV,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUYV422,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_UYVY,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_UYVY422,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_JPEG,
-		.codec_mode = HANTRO_MODE_JPEG_ENC,
-		.max_depth = 2,
-		.header_size = JPEG_HEADER_SIZE,
-		.frmsize = {
-			.min_width = 96,
-			.max_width = 8192,
-			.step_width = MB_DIM,
-			.min_height = 32,
-			.max_height = 8192,
-			.step_height = MB_DIM,
-		},
-	},
-};
-
-static const struct hantro_fmt rk3288_vpu_postproc_fmts[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_YUYV,
-		.codec_mode = HANTRO_MODE_NONE,
-	},
-};
-
-static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_NV12,
-		.codec_mode = HANTRO_MODE_NONE,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_H264_SLICE,
-		.codec_mode = HANTRO_MODE_H264_DEC,
-		.max_depth = 2,
-		.frmsize = {
-			.min_width = 48,
-			.max_width = 4096,
-			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2304,
-			.step_height = MB_DIM,
-		},
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
-		.codec_mode = HANTRO_MODE_MPEG2_DEC,
-		.max_depth = 2,
-		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
-			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
-			.step_height = MB_DIM,
-		},
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
-		.codec_mode = HANTRO_MODE_VP8_DEC,
-		.max_depth = 2,
-		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
-			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
-			.step_height = MB_DIM,
-		},
-	},
-};
-
-static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vepu_read(vpu, H1_REG_INTERRUPT);
-	state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
-		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vepu_write(vpu, 0, H1_REG_INTERRUPT);
-	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
-static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
-{
-	/* Bump ACLK to max. possible freq. to improve performance. */
-	clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
-	return 0;
-}
-
-static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
-	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
-	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
-}
-
-/*
- * Supported codec ops.
- */
-
-static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
-	[HANTRO_MODE_JPEG_ENC] = {
-		.run = hantro_h1_jpeg_enc_run,
-		.reset = rk3288_vpu_enc_reset,
-		.init = hantro_jpeg_enc_init,
-		.done = hantro_jpeg_enc_done,
-		.exit = hantro_jpeg_enc_exit,
-	},
-	[HANTRO_MODE_H264_DEC] = {
-		.run = hantro_g1_h264_dec_run,
-		.reset = hantro_g1_reset,
-		.init = hantro_h264_dec_init,
-		.exit = hantro_h264_dec_exit,
-	},
-	[HANTRO_MODE_MPEG2_DEC] = {
-		.run = hantro_g1_mpeg2_dec_run,
-		.reset = hantro_g1_reset,
-		.init = hantro_mpeg2_dec_init,
-		.exit = hantro_mpeg2_dec_exit,
-	},
-	[HANTRO_MODE_VP8_DEC] = {
-		.run = hantro_g1_vp8_dec_run,
-		.reset = hantro_g1_reset,
-		.init = hantro_vp8_dec_init,
-		.exit = hantro_vp8_dec_exit,
-	},
-};
-
-/*
- * VPU variant.
- */
-
-static const struct hantro_irq rk3288_irqs[] = {
-	{ "vepu", rk3288_vepu_irq },
-	{ "vdpu", hantro_g1_irq },
-};
-
-static const char * const rk3288_clk_names[] = {
-	"aclk", "hclk"
-};
-
-const struct hantro_variant rk3288_vpu_variant = {
-	.enc_offset = 0x0,
-	.enc_fmts = rk3288_vpu_enc_fmts,
-	.num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
-	.dec_offset = 0x400,
-	.dec_fmts = rk3288_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
-	.postproc_fmts = rk3288_vpu_postproc_fmts,
-	.num_postproc_fmts = ARRAY_SIZE(rk3288_vpu_postproc_fmts),
-	.postproc_regs = &hantro_g1_postproc_regs,
-	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
-		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
-	.codec_ops = rk3288_vpu_codec_ops,
-	.irqs = rk3288_irqs,
-	.num_irqs = ARRAY_SIZE(rk3288_irqs),
-	.init = rk3288_vpu_hw_init,
-	.clk_names = rk3288_clk_names,
-	.num_clocks = ARRAY_SIZE(rk3288_clk_names)
-};
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
deleted file mode 100644
index 7a7962cf771e..000000000000
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ /dev/null
@@ -1,222 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Hantro VPU codec driver
- *
- * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
- *	Jeffy Chen <jeffy.chen@rock-chips.com>
- */
-
-#include <linux/clk.h>
-
-#include "hantro.h"
-#include "hantro_jpeg.h"
-#include "rk3399_vpu_regs.h"
-
-#define RK3399_ACLK_MAX_FREQ (400 * 1000 * 1000)
-
-/*
- * Supported formats.
- */
-
-static const struct hantro_fmt rk3399_vpu_enc_fmts[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_YUV420M,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420P,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV12M,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420SP,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YUYV,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_YUYV422,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_UYVY,
-		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = RK3288_VPU_ENC_FMT_UYVY422,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_JPEG,
-		.codec_mode = HANTRO_MODE_JPEG_ENC,
-		.max_depth = 2,
-		.header_size = JPEG_HEADER_SIZE,
-		.frmsize = {
-			.min_width = 96,
-			.max_width = 8192,
-			.step_width = MB_DIM,
-			.min_height = 32,
-			.max_height = 8192,
-			.step_height = MB_DIM,
-		},
-	},
-};
-
-static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_NV12,
-		.codec_mode = HANTRO_MODE_NONE,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
-		.codec_mode = HANTRO_MODE_MPEG2_DEC,
-		.max_depth = 2,
-		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
-			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
-			.step_height = MB_DIM,
-		},
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
-		.codec_mode = HANTRO_MODE_VP8_DEC,
-		.max_depth = 2,
-		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
-			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
-			.step_height = MB_DIM,
-		},
-	},
-};
-
-static irqreturn_t rk3399_vepu_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vepu_read(vpu, VEPU_REG_INTERRUPT);
-	state = (status & VEPU_REG_INTERRUPT_FRAME_READY) ?
-		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
-	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t rk3399_vdpu_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
-	state = (status & VDPU_REG_INTERRUPT_DEC_IRQ) ?
-		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
-	vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
-static int rk3399_vpu_hw_init(struct hantro_dev *vpu)
-{
-	/* Bump ACLK to max. possible freq. to improve performance. */
-	clk_set_rate(vpu->clocks[0].clk, RK3399_ACLK_MAX_FREQ);
-	return 0;
-}
-
-static void rk3399_vpu_enc_reset(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
-	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
-	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
-}
-
-static void rk3399_vpu_dec_reset(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
-	vdpu_write(vpu, 0, VDPU_REG_EN_FLAGS);
-	vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
-}
-
-/*
- * Supported codec ops.
- */
-
-static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
-	[HANTRO_MODE_JPEG_ENC] = {
-		.run = rk3399_vpu_jpeg_enc_run,
-		.reset = rk3399_vpu_enc_reset,
-		.init = hantro_jpeg_enc_init,
-		.exit = hantro_jpeg_enc_exit,
-	},
-	[HANTRO_MODE_MPEG2_DEC] = {
-		.run = rk3399_vpu_mpeg2_dec_run,
-		.reset = rk3399_vpu_dec_reset,
-		.init = hantro_mpeg2_dec_init,
-		.exit = hantro_mpeg2_dec_exit,
-	},
-	[HANTRO_MODE_VP8_DEC] = {
-		.run = rk3399_vpu_vp8_dec_run,
-		.reset = rk3399_vpu_dec_reset,
-		.init = hantro_vp8_dec_init,
-		.exit = hantro_vp8_dec_exit,
-	},
-};
-
-/*
- * VPU variant.
- */
-
-static const struct hantro_irq rk3399_irqs[] = {
-	{ "vepu", rk3399_vepu_irq },
-	{ "vdpu", rk3399_vdpu_irq },
-};
-
-static const char * const rk3399_clk_names[] = {
-	"aclk", "hclk"
-};
-
-const struct hantro_variant rk3399_vpu_variant = {
-	.enc_offset = 0x0,
-	.enc_fmts = rk3399_vpu_enc_fmts,
-	.num_enc_fmts = ARRAY_SIZE(rk3399_vpu_enc_fmts),
-	.dec_offset = 0x400,
-	.dec_fmts = rk3399_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
-		 HANTRO_VP8_DECODER,
-	.codec_ops = rk3399_vpu_codec_ops,
-	.irqs = rk3399_irqs,
-	.num_irqs = ARRAY_SIZE(rk3399_irqs),
-	.init = rk3399_vpu_hw_init,
-	.clk_names = rk3399_clk_names,
-	.num_clocks = ARRAY_SIZE(rk3399_clk_names)
-};
-
-static const struct hantro_irq rk3328_irqs[] = {
-	{ "vdpu", rk3399_vdpu_irq },
-};
-
-const struct hantro_variant rk3328_vpu_variant = {
-	.dec_offset = 0x400,
-	.dec_fmts = rk3399_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER,
-	.codec_ops = rk3399_vpu_codec_ops,
-	.irqs = rk3328_irqs,
-	.num_irqs = ARRAY_SIZE(rk3328_irqs),
-	.init = rk3399_vpu_hw_init,
-	.clk_names = rk3399_clk_names,
-	.num_clocks = ARRAY_SIZE(rk3399_clk_names),
-};
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
similarity index 87%
rename from drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
rename to drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
index 3498e6124acd..049bc59bee78 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
@@ -28,12 +28,12 @@
 #include "hantro.h"
 #include "hantro_v4l2.h"
 #include "hantro_hw.h"
-#include "rk3399_vpu_regs.h"
+#include "rockchip_vpu2_regs.h"
 
 #define VEPU_JPEG_QUANT_TABLE_COUNT 16
 
-static void rk3399_vpu_set_src_img_ctrl(struct hantro_dev *vpu,
-					struct hantro_ctx *ctx)
+static void rockchip_vpu2_set_src_img_ctrl(struct hantro_dev *vpu,
+					   struct hantro_ctx *ctx)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
 	u32 reg;
@@ -59,9 +59,9 @@ static void rk3399_vpu_set_src_img_ctrl(struct hantro_dev *vpu,
 	vepu_write_relaxed(vpu, reg, VEPU_REG_ENC_CTRL1);
 }
 
-static void rk3399_vpu_jpeg_enc_set_buffers(struct hantro_dev *vpu,
-					    struct hantro_ctx *ctx,
-					    struct vb2_buffer *src_buf)
+static void rockchip_vpu2_jpeg_enc_set_buffers(struct hantro_dev *vpu,
+					       struct hantro_ctx *ctx,
+					       struct vb2_buffer *src_buf)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
 	dma_addr_t src[3];
@@ -92,9 +92,9 @@ static void rk3399_vpu_jpeg_enc_set_buffers(struct hantro_dev *vpu,
 }
 
 static void
-rk3399_vpu_jpeg_enc_set_qtable(struct hantro_dev *vpu,
-			       unsigned char *luma_qtable,
-			       unsigned char *chroma_qtable)
+rockchip_vpu2_jpeg_enc_set_qtable(struct hantro_dev *vpu,
+				  unsigned char *luma_qtable,
+				  unsigned char *chroma_qtable)
 {
 	u32 reg, i;
 	__be32 *luma_qtable_p;
@@ -118,7 +118,7 @@ rk3399_vpu_jpeg_enc_set_qtable(struct hantro_dev *vpu,
 	}
 }
 
-void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
+void rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -141,11 +141,11 @@ void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
 	vepu_write_relaxed(vpu, VEPU_REG_ENCODE_FORMAT_JPEG,
 			   VEPU_REG_ENCODE_START);
 
-	rk3399_vpu_set_src_img_ctrl(vpu, ctx);
-	rk3399_vpu_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
-	rk3399_vpu_jpeg_enc_set_qtable(vpu,
-				       hantro_jpeg_get_qtable(0),
-				       hantro_jpeg_get_qtable(1));
+	rockchip_vpu2_set_src_img_ctrl(vpu, ctx);
+	rockchip_vpu2_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
+	rockchip_vpu2_jpeg_enc_set_qtable(vpu,
+					  hantro_jpeg_get_qtable(0),
+					  hantro_jpeg_get_qtable(1));
 
 	reg = VEPU_REG_OUTPUT_SWAP32
 		| VEPU_REG_OUTPUT_SWAP16
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_mpeg2_dec.c
similarity index 93%
rename from drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
rename to drivers/staging/media/hantro/rockchip_vpu2_hw_mpeg2_dec.c
index 2527dce7eb18..8bd47672dd7c 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_mpeg2_dec.c
@@ -80,8 +80,8 @@
 #define VDPU_REG_MV_ACCURACY_BWD(v)	((v) ? BIT(1) : 0)
 
 static void
-rk3399_vpu_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
-				      struct hantro_ctx *ctx)
+rockchip_vpu2_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
+					 struct hantro_ctx *ctx)
 {
 	struct v4l2_ctrl_mpeg2_quantisation *q;
 
@@ -91,12 +91,12 @@ rk3399_vpu_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
 }
 
 static void
-rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
-				 struct hantro_ctx *ctx,
-				 struct vb2_buffer *src_buf,
-				 struct vb2_buffer *dst_buf,
-				 const struct v4l2_ctrl_mpeg2_sequence *seq,
-				 const struct v4l2_ctrl_mpeg2_picture *pic)
+rockchip_vpu2_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
+				    struct hantro_ctx *ctx,
+				    struct vb2_buffer *src_buf,
+				    struct vb2_buffer *dst_buf,
+				    const struct v4l2_ctrl_mpeg2_sequence *seq,
+				    const struct v4l2_ctrl_mpeg2_picture *pic)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
@@ -148,7 +148,7 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER3_BASE);
 }
 
-void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
+void rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -233,11 +233,10 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      VDPU_REG_MV_ACCURACY_BWD(1);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(136));
 
-	rk3399_vpu_mpeg2_dec_set_quantisation(vpu, ctx);
+	rockchip_vpu2_mpeg2_dec_set_quantisation(vpu, ctx);
 
-	rk3399_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
-					 &dst_buf->vb2_buf,
-					 seq, pic);
+	rockchip_vpu2_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
+					    &dst_buf->vb2_buf, seq, pic);
 
 	/* Kick the watchdog and start decoding */
 	hantro_end_prepare_run(ctx);
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
similarity index 99%
rename from drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
rename to drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
index 8661a3cc1e6b..d31b88c06e51 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
@@ -503,7 +503,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, dst_dma, VDPU_REG_ADDR_DST);
 }
 
-void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
+void rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_vp8_frame *hdr;
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/staging/media/hantro/rk3399_vpu_regs.h b/drivers/staging/media/hantro/rockchip_vpu2_regs.h
similarity index 99%
rename from drivers/staging/media/hantro/rk3399_vpu_regs.h
rename to drivers/staging/media/hantro/rockchip_vpu2_regs.h
index 88d096920f30..49e40889545b 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_regs.h
+++ b/drivers/staging/media/hantro/rockchip_vpu2_regs.h
@@ -6,8 +6,8 @@
  *	Alpha Lin <alpha.lin@rock-chips.com>
  */
 
-#ifndef RK3399_VPU_REGS_H_
-#define RK3399_VPU_REGS_H_
+#ifndef ROCKCHIP_VPU2_REGS_H_
+#define ROCKCHIP_VPU2_REGS_H_
 
 /* Encoder registers. */
 #define VEPU_REG_VP8_QUT_1ST(i)			(0x000 + ((i) * 0x24))
@@ -597,4 +597,4 @@
 #define     VDPU_REG_PRED_FLT_PRED_BC_TAP_4_3(x)	(((x) & 0x3ff) << 12)
 #define     VDPU_REG_PRED_FLT_PRED_BC_TAP_5_0(x)	(((x) & 0x3ff) << 2)
 
-#endif /* RK3399_VPU_REGS_H_ */
+#endif /* ROCKCHIP_VPU2_REGS_H_ */
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
new file mode 100644
index 000000000000..175d0c5dfdbe
--- /dev/null
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <linux/clk.h>
+
+#include "hantro.h"
+#include "hantro_jpeg.h"
+#include "hantro_h1_regs.h"
+#include "rockchip_vpu2_regs.h"
+
+#define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
+
+/*
+ * Supported formats.
+ */
+
+static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUV420M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUYV422,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_UYVY422,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_JPEG,
+		.codec_mode = HANTRO_MODE_JPEG_ENC,
+		.max_depth = 2,
+		.header_size = JPEG_HEADER_SIZE,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 8192,
+			.step_width = MB_DIM,
+			.min_height = 32,
+			.max_height = 8192,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
+static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+};
+
+static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 4096,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 2304,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1920,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 3840,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 2160,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
+static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1920,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 3840,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 2160,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
+static irqreturn_t rockchip_vpu1_vepu_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vepu_read(vpu, H1_REG_INTERRUPT);
+	state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
+		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vepu_write(vpu, 0, H1_REG_INTERRUPT);
+	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
+	state = (status & VDPU_REG_INTERRUPT_DEC_IRQ) ?
+		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
+	vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vepu_read(vpu, VEPU_REG_INTERRUPT);
+	state = (status & VEPU_REG_INTERRUPT_FRAME_READY) ?
+		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
+	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
+
+static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
+{
+	/* Bump ACLK to max. possible freq. to improve performance. */
+	clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
+	return 0;
+}
+
+static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
+	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
+	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+}
+
+static void rockchip_vpu2_dec_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
+	vdpu_write(vpu, 0, VDPU_REG_EN_FLAGS);
+	vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
+}
+
+static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
+	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
+	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+}
+
+/*
+ * Supported codec ops.
+ */
+
+static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
+	[HANTRO_MODE_JPEG_ENC] = {
+		.run = hantro_h1_jpeg_enc_run,
+		.reset = rockchip_vpu1_enc_reset,
+		.init = hantro_jpeg_enc_init,
+		.done = hantro_jpeg_enc_done,
+		.exit = hantro_jpeg_enc_exit,
+	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = hantro_g1_h264_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+	[HANTRO_MODE_VP8_DEC] = {
+		.run = hantro_g1_vp8_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_vp8_dec_init,
+		.exit = hantro_vp8_dec_exit,
+	},
+};
+
+static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
+	[HANTRO_MODE_JPEG_ENC] = {
+		.run = rockchip_vpu2_jpeg_enc_run,
+		.reset = rockchip_vpu2_enc_reset,
+		.init = hantro_jpeg_enc_init,
+		.exit = hantro_jpeg_enc_exit,
+	},
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = rockchip_vpu2_mpeg2_dec_run,
+		.reset = rockchip_vpu2_dec_reset,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+	[HANTRO_MODE_VP8_DEC] = {
+		.run = rockchip_vpu2_vp8_dec_run,
+		.reset = rockchip_vpu2_dec_reset,
+		.init = hantro_vp8_dec_init,
+		.exit = hantro_vp8_dec_exit,
+	},
+};
+
+/*
+ * VPU variant.
+ */
+
+static const struct hantro_irq rockchip_vpu1_irqs[] = {
+	{ "vepu", rockchip_vpu1_vepu_irq },
+	{ "vdpu", hantro_g1_irq },
+};
+
+static const struct hantro_irq rockchip_vpdu2_irqs[] = {
+	{ "vdpu", rockchip_vpu2_vdpu_irq },
+};
+
+static const struct hantro_irq rockchip_vpu2_irqs[] = {
+	{ "vepu", rockchip_vpu2_vepu_irq },
+	{ "vdpu", rockchip_vpu2_vdpu_irq },
+};
+
+static const char * const rockchip_vpu_clk_names[] = {
+	"aclk", "hclk"
+};
+
+const struct hantro_variant rk3288_vpu_variant = {
+	.enc_offset = 0x0,
+	.enc_fmts = rockchip_vpu_enc_fmts,
+	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
+	.dec_offset = 0x400,
+	.dec_fmts = rk3288_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
+	.postproc_fmts = rockchip_vpu1_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(rockchip_vpu1_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
+		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
+	.codec_ops = rk3288_vpu_codec_ops,
+	.irqs = rockchip_vpu1_irqs,
+	.num_irqs = ARRAY_SIZE(rockchip_vpu1_irqs),
+	.init = rockchip_vpu_hw_init,
+	.clk_names = rockchip_vpu_clk_names,
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
+};
+
+const struct hantro_variant rk3328_vpu_variant = {
+	.dec_offset = 0x400,
+	.dec_fmts = rk3399_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER,
+	.codec_ops = rk3399_vpu_codec_ops,
+	.irqs = rockchip_vpdu2_irqs,
+	.num_irqs = ARRAY_SIZE(rockchip_vpdu2_irqs),
+	.init = rockchip_vpu_hw_init,
+	.clk_names = rockchip_vpu_clk_names,
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names),
+};
+
+const struct hantro_variant rk3399_vpu_variant = {
+	.enc_offset = 0x0,
+	.enc_fmts = rockchip_vpu_enc_fmts,
+	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
+	.dec_offset = 0x400,
+	.dec_fmts = rk3399_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
+		 HANTRO_VP8_DECODER,
+	.codec_ops = rk3399_vpu_codec_ops,
+	.irqs = rockchip_vpu2_irqs,
+	.num_irqs = ARRAY_SIZE(rockchip_vpu2_irqs),
+	.init = rockchip_vpu_hw_init,
+	.clk_names = rockchip_vpu_clk_names,
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
+};
-- 
2.27.0

