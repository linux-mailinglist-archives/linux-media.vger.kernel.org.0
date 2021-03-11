Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08B733781E
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhCKPl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbhCKPlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:11 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409BDC061760;
        Thu, 11 Mar 2021 07:41:11 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so13062973wmd.5;
        Thu, 11 Mar 2021 07:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xAXG6ZA5Y2HE3m+oHpL1iaPFBMdmoorVW3rcbcNGpAc=;
        b=QI2RhaXaXoLThUOBvp6jXj/Nqah5umuf6W4X4J5HIGNNTPn3Jz5i8eHtW0EMAxfH53
         T57rt98KDm9PM0+OdlQNwRwH0Wh18SxdReu+RmJga1uJX0yZ6e4RJtLDVS5G8xrrOZXp
         LtboAqLpz1BRq4cC27OWQsdb+DnkSGk2wdoOdlJilybsY9Mxg2B2JXZGxcYmkghyaDQp
         xfLL5jWptdc6IKvRQjXMTHDY9sx+RuyclOrp/tZ1V5JtibQY7B7Im1x94JvHjGHQnmpH
         T/bNxOI8haKo1qXu2OODdiA6AcG/+F8LdZf0hKvbkngUW0J0eBPA38mOB/XQpncFZQ/1
         d1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xAXG6ZA5Y2HE3m+oHpL1iaPFBMdmoorVW3rcbcNGpAc=;
        b=Eq4nlQR1XmeHiIowNAMmXVvaiGMZTM5aXaptHSKv7zW96tWIan51HnshpISAyIL8cp
         BB7XV/Eq90MvlZt91VRtYpOO8mHPo5h0HKSWKK7UWpgBtMmCCLDiotEkONgo0egIU0CE
         9hX5oDaPfeXAeN68kWkzWexqnSnYTY2/U9pG8uchV4a21z5LDux7ZbyiE480D1Nor2gz
         NcASqTH2FgZJyZmQ/bIBwVjBOF4QWTvgeLewxNUHq+42jibLOuU1vQQHdx3VaHwNb305
         r8Ko7H/8IdhlriO+AvWwO1xIUam4RwlylsnipMCXdXkiuiY2eFmMJH+Rzsc+fw1MvCGF
         wT1A==
X-Gm-Message-State: AOAM533cIGeWocvF8Ae47FbZ/fD28m1BzUMcV0iyvXjIi/XHDikJ8MRO
        x4UHuIgj3799DjCqdN3IiCw=
X-Google-Smtp-Source: ABdhPJwuz3nP2YREPz0nQBizO+XbjVBcsDxYKqYIiux+SwS/8io3xaehqemQUS9UUA6hAuNztk8KKQ==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr8824624wmj.46.1615477269969;
        Thu, 11 Mar 2021 07:41:09 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:09 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 07/10] media: hantro: add initial SAMA5D4 support
Date:   Thu, 11 Mar 2021 15:40:52 +0000
Message-Id: <20210311154055.3496076-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The SoC features a Hantro G1 compatible video decoder, supporting the
MPEG-2, VP8 and H264 codecs with resolutions up-to 1280x720.

Post-processing core is also available on the SoC.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
v2
 - Split DT and defconfig changes to separate patches (Eze)
 - s/Atmel/Microchip/ (Nicolas)
---
 drivers/staging/media/hantro/Kconfig          |  10 +-
 drivers/staging/media/hantro/Makefile         |   3 +
 drivers/staging/media/hantro/hantro_drv.c     |   3 +
 drivers/staging/media/hantro/hantro_hw.h      |   1 +
 .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
 5 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c

diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index 5b6cf9f62b1a..20b1f6d7b69c 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
-	depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_REQUEST_API
@@ -24,6 +24,14 @@ config VIDEO_HANTRO_IMX8M
 	help
 	  Enable support for i.MX8M SoCs.
 
+config VIDEO_HANTRO_SAMA5D4
+	bool "Hantro VDEC SAMA5D4 support"
+	depends on VIDEO_HANTRO
+	depends on ARCH_AT91 || COMPILE_TEST
+	default y
+	help
+	  Enable support for Microchip SAMA5D4 SoCs.
+
 config VIDEO_HANTRO_ROCKCHIP
 	bool "Hantro VPU Rockchip support"
 	depends on VIDEO_HANTRO
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 3747a32799b2..f4b99901eeee 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -22,6 +22,9 @@ hantro-vpu-y += \
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
 		imx8m_vpu_hw.o
 
+hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
+		sama5d4_vdec_hw.o
+
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rk3288_vpu_hw.o \
 		rk3399_vpu_hw.o
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e5f200e64993..a530c0eda595 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -478,6 +478,9 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
+#endif
+#ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
+	{ .compatible = "microchip,sama5d4-vdec", .data = &sama5d4_vdec_variant, },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 73c71bb2320c..4d39da1d1581 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -152,6 +152,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant sama5d4_vdec_variant;
 
 extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
 
diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
new file mode 100644
index 000000000000..58ae72c2b723
--- /dev/null
+++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VDEC driver
+ *
+ * Copyright (C) 2021 Collabora Ltd, Emil Velikov <emil.velikov@collabora.com>
+ */
+
+#include "hantro.h"
+
+/*
+ * Supported formats.
+ */
+
+static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+};
+
+static const struct hantro_fmt sama5d4_vdec_fmts[] = {
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
+			.max_width = 1280,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 720,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1280,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 720,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1280,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 720,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
+static int sama5d4_hw_init(struct hantro_dev *vpu)
+{
+	return 0;
+}
+
+/*
+ * Supported codec ops.
+ */
+
+static const struct hantro_codec_ops sama5d4_vdec_codec_ops[] = {
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
+	[HANTRO_MODE_H264_DEC] = {
+		.run = hantro_g1_h264_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
+};
+
+static const struct hantro_irq sama5d4_irqs[] = {
+	{ "vdec", hantro_g1_irq },
+};
+
+static const char * const sama5d4_clk_names[] = { "vdec_clk" };
+
+const struct hantro_variant sama5d4_vdec_variant = {
+	.dec_fmts = sama5d4_vdec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(sama5d4_vdec_fmts),
+	.postproc_fmts = sama5d4_vdec_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(sama5d4_vdec_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
+	.codec_ops = sama5d4_vdec_codec_ops,
+	.init = sama5d4_hw_init,
+	.irqs = sama5d4_irqs,
+	.num_irqs = ARRAY_SIZE(sama5d4_irqs),
+	.clk_names = sama5d4_clk_names,
+	.num_clocks = ARRAY_SIZE(sama5d4_clk_names),
+};
-- 
2.30.1

