Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06757BF708
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 11:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjJJJRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 05:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjJJJR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 05:17:28 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BDDA9;
        Tue, 10 Oct 2023 02:17:23 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39A8BCRg012696;
        Tue, 10 Oct 2023 11:16:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding:content-type; s=
        selector1; bh=JSXv5uBlf7Nq7B8f/KA47gP5JBCzVC46AOMucC11/d4=; b=79
        obpjT5Tn7e2Coef7uUwST4cxREoRNsMCgbQUdscsCwnElttKpTA1gSIH9cStHppq
        178l666LR9gfHGrGBQgdr1Waiz19FfE0dh9griAPhT9o+P1fz4H3c3DhvNBRalkK
        iXbUYhyGfyajyt0LrayJxfgs3nQXAiAjpIv8nPIHwnYhAdJ4bT9R8uehY8Y6PAQI
        e9vAZ9JWUiuN7+Qaogsq1OW2W4b/q2VqqkSOAXfzAqVjgj+B+SUjeLtQwtVzbH+X
        2cqEQW50NSOYIBi+v3GwZjU1xbZeskyzraVBx76uUOk25ElU8NQRw8lX8xxHTpgI
        zKPpi5G9X46ya8bWm+sA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhjg9317-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Oct 2023 11:16:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 870A2100064;
        Tue, 10 Oct 2023 11:16:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7BDDB21BF63;
        Tue, 10 Oct 2023 11:16:48 +0200 (CEST)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 11:16:48 +0200
From:   Hugues Fruchet <hugues.fruchet@foss.st.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>
CC:     Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v2 2/5] media: hantro: add support for STM32MP25 VDEC
Date:   Tue, 10 Oct 2023 11:16:40 +0200
Message-ID: <20231010091643.3666290-3-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010091643.3666290-1-hugues.fruchet@foss.st.com>
References: <20231010091643.3666290-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for STM32MP25 VDEC video hardware decoder.
H264/VP8 decoding up to 4080x4080.
No post-processor support.
VDEC has its own reset/clock/irq.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/platform/verisilicon/Kconfig    | 14 ++-
 drivers/media/platform/verisilicon/Makefile   |  3 +
 .../media/platform/verisilicon/hantro_drv.c   |  3 +
 .../media/platform/verisilicon/hantro_hw.h    |  1 +
 .../platform/verisilicon/stm32mp25_vdec_hw.c  | 92 +++++++++++++++++++
 5 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c

diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/platform/verisilicon/Kconfig
index e65b836b9d78..7642ff9cf96c 100644
--- a/drivers/media/platform/verisilicon/Kconfig
+++ b/drivers/media/platform/verisilicon/Kconfig
@@ -4,7 +4,7 @@ comment "Verisilicon media platform drivers"
 
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
-	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || ARCH_SUNXI || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || ARCH_SUNXI || ARCH_STM32 || COMPILE_TEST
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
@@ -16,8 +16,8 @@ config VIDEO_HANTRO
 	select V4L2_VP9
 	help
 	  Support for the Hantro IP based Video Processing Units present on
-	  Rockchip and NXP i.MX8M SoCs, which accelerate video and image
-	  encoding and decoding.
+	  Rockchip, NXP i.MX8M and STM32MP25 SoCs, which accelerate video
+	  and image encoding and decoding.
 	  To compile this driver as a module, choose M here: the module
 	  will be called hantro-vpu.
 
@@ -52,3 +52,11 @@ config VIDEO_HANTRO_SUNXI
 	default y
 	help
 	  Enable support for H6 SoC.
+
+config VIDEO_HANTRO_STM32MP25
+	bool "Hantro STM32MP25 support"
+	depends on VIDEO_HANTRO
+	depends on ARCH_STM32 || COMPILE_TEST
+	default y
+	help
+	  Enable support for STM32MP25 SoCs.
diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index 6ad2ef885920..5854e0f0dd32 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -39,3 +39,6 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
 		sunxi_vpu_hw.o
+
+hantro-vpu-$(CONFIG_VIDEO_HANTRO_STM32MP25) += \
+		stm32mp25_vdec_hw.o
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 423fc85d79ee..8c6e0c66f0cd 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -732,6 +732,9 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_SUNXI
 	{ .compatible = "allwinner,sun50i-h6-vpu-g2", .data = &sunxi_vpu_variant, },
+#endif
+#ifdef CONFIG_VIDEO_HANTRO_STM32MP25
+	{ .compatible = "st,stm32mp25-vdec", .data = &stm32mp25_vdec_variant, },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 7f33f7b07ce4..b7eccc1a96fc 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -406,6 +406,7 @@ extern const struct hantro_variant rk3568_vpu_variant;
 extern const struct hantro_variant rk3588_vpu981_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 extern const struct hantro_variant sunxi_vpu_variant;
+extern const struct hantro_variant stm32mp25_vdec_variant;
 
 extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
 extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
diff --git a/drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c
new file mode 100644
index 000000000000..c9f107bc09db
--- /dev/null
+++ b/drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * STM32MP25 VDEC video decoder driver
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          for STMicroelectronics.
+ *
+ */
+
+#include "hantro.h"
+
+/*
+ * Supported formats.
+ */
+
+static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 4080,
+			.step_width = MB_DIM,
+			.min_height = 96,
+			.max_height = 4080,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 4080,
+			.step_width = MB_DIM,
+			.min_height = 96,
+			.max_height = 4080,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 4080,
+			.step_width = MB_DIM,
+			.min_height = 96,
+			.max_height = 4080,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
+/*
+ * Supported codec ops.
+ */
+
+static const struct hantro_codec_ops stm32mp25_vdec_codec_ops[] = {
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
+static const struct hantro_irq stm32mp25_irqs[] = {
+	{ "vdec", hantro_g1_irq },
+};
+
+static const char * const stm32mp25_clk_names[] = { "vdec-clk" };
+
+const struct hantro_variant stm32mp25_vdec_variant = {
+	.dec_fmts = stm32mp25_vdec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(stm32mp25_vdec_fmts),
+	.codec = HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
+	.codec_ops = stm32mp25_vdec_codec_ops,
+	.irqs = stm32mp25_irqs,
+	.num_irqs = ARRAY_SIZE(stm32mp25_irqs),
+	.clk_names = stm32mp25_clk_names,
+	.num_clocks = ARRAY_SIZE(stm32mp25_clk_names),
+};
-- 
2.25.1

