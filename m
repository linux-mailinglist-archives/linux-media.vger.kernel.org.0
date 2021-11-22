Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4EB459507
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240505AbhKVSum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240441AbhKVSu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:50:29 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE41C06175C;
        Mon, 22 Nov 2021 10:47:20 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w1so81354913edc.6;
        Mon, 22 Nov 2021 10:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z9L9K9afDfGzZhgB3VAoZcgQKRIi9kdlnMnveIs9hGM=;
        b=BRxS+8yAcgmCQcJp4YNDuTB8byRCypZj9xo5gNtQcbiKBt681fiAf88Y+WLAT9d/e4
         fetY3WJ25hiJZKVC7lxyYb/WArh2bIk3zcrkkv8jeyB+XWHKpVXRCYOKvdrjJbmEXM22
         a6SYkIXI4zfG5Nv6POY9MH/2zZocIl07ryVdollYn66jm3qwK0U4Oh/NUvEHn3w68bqS
         U5F4tKqiLUUbWyH3U7J0daRBCXUXYQ07K4qMvwEKzF4iQapHt8vLAiW4CtDDR9++6EP1
         SsyscYQ3EY3G3Fd/PPgew4vSbrFPJNJiZh0YcGMkraEfswE6Lk2Lv1BPm8eBH8vVNkoz
         Aj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z9L9K9afDfGzZhgB3VAoZcgQKRIi9kdlnMnveIs9hGM=;
        b=PtPWtORztn+RtIWAW+5D257SOPIbTuWUcErNgZ802Qo/KxL+UQTOZZ5Fts1NDO4iPW
         V1yN+K/WBrWlESh+e6Fw7k8pveEZxO0SmMlMWlS6XXp9CY61+V/RcjDrcgP+iu9GmKkY
         WytfjNWFZ/4z93YBVBXJBYHXPtmtIdSHWXhlz1wfIUeUwWsgBKWR4JImlK4r3FyZj8Uf
         DOU2hMO235JEwA+SVESgti4dss4LS1BbKjl3weULl0DImeLz+kiBg4Wn6qNrnY2qhO2L
         i91UScsnbAV2mqjDyeu6WqZmxgWxKzgXu5OwAzh7q/ALoM/QDxE+YrMjhd/3HJoW1dXa
         sfhQ==
X-Gm-Message-State: AOAM531Hngb8b/oDv7vJYQl/VnAYNS4DXdzlC/xFrJLiMyS09PNXX9Xy
        iiS4yyzWnO6ARLuiuUcL1zozCwJTs1zqSg==
X-Google-Smtp-Source: ABdhPJzYW1EnZvfuFWL5GZzaMTUa4TCLyF5KNfG2GeEz/7tIXLfJis8XSSb2m6JcDcJBCBLf1DBbeA==
X-Received: by 2002:a05:6402:5156:: with SMTP id n22mr69186707edd.222.1637606839460;
        Mon, 22 Nov 2021 10:47:19 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:19 -0800 (PST)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 6/7] media: hantro: Add support for Allwinner H6
Date:   Mon, 22 Nov 2021 19:47:01 +0100
Message-Id: <20211122184702.768341-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner H6 has a Hantro G2 core used for VP9 decoding. It's not clear
at this time if HEVC is also supported or not.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/Kconfig        |  10 +-
 drivers/staging/media/hantro/Makefile       |   3 +
 drivers/staging/media/hantro/hantro_drv.c   |   3 +
 drivers/staging/media/hantro/hantro_hw.h    |   1 +
 drivers/staging/media/hantro/sunxi_vpu_hw.c | 104 ++++++++++++++++++++
 5 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/hantro/sunxi_vpu_hw.c

diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index 00a57d88c92e..3c5d833322c8 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
-	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || ARCH_SUNXI || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_REQUEST_API
@@ -40,3 +40,11 @@ config VIDEO_HANTRO_ROCKCHIP
 	default y
 	help
 	  Enable support for RK3288, RK3328, and RK3399 SoCs.
+
+config VIDEO_HANTRO_SUNXI
+	bool "Hantro VPU Allwinner support"
+	depends on VIDEO_HANTRO
+	depends on ARCH_SUNXI || COMPILE_TEST
+	default y
+	help
+	  Enable support for H6 SoC.
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 28af0a1ee4bf..ebd5ede7bef7 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -33,3 +33,6 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rockchip_vpu_hw.o
+
+hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
+		sunxi_vpu_hw.o
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 530994ab3024..54f34644ecdf 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -620,6 +620,9 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
 	{ .compatible = "microchip,sama5d4-vdec", .data = &sama5d4_vdec_variant, },
+#endif
+#ifdef CONFIG_VIDEO_HANTRO_SUNXI
+	{ .compatible = "allwinner,sun50i-h6-vpu-g2", .data = &sunxi_vpu_variant, },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index dbe51303724b..0676989b986b 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -308,6 +308,7 @@ extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
+extern const struct hantro_variant sunxi_vpu_variant;
 
 extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
 extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
diff --git a/drivers/staging/media/hantro/sunxi_vpu_hw.c b/drivers/staging/media/hantro/sunxi_vpu_hw.c
new file mode 100644
index 000000000000..05e964dc0499
--- /dev/null
+++ b/drivers/staging/media/hantro/sunxi_vpu_hw.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner Hantro G2 VPU codec driver
+ *
+ * Copyright (C) 2021 Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#include <linux/clk.h>
+
+#include "hantro.h"
+#include "hantro_g2_regs.h"
+
+static const struct hantro_fmt sunxi_vpu_postproc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.postprocessed = true,
+	},
+};
+
+static const struct hantro_fmt sunxi_vpu_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12_4L4,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
+		.codec_mode = HANTRO_MODE_VP9_DEC,
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
+static irqreturn_t sunxi_vpu_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vdpu_read(vpu, G2_REG_INTERRUPT);
+	state = (status & G2_REG_INTERRUPT_DEC_RDY_INT) ?
+		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vdpu_write(vpu, 0, G2_REG_INTERRUPT);
+	vdpu_write(vpu, G2_REG_CONFIG_DEC_CLK_GATE_E, G2_REG_CONFIG);
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
+
+static int sunxi_vpu_hw_init(struct hantro_dev *vpu)
+{
+	clk_set_rate(vpu->clocks[0].clk, 300000000);
+
+	return 0;
+}
+
+static void sunxi_vpu_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	reset_control_reset(vpu->resets);
+}
+
+static const struct hantro_codec_ops sunxi_vpu_codec_ops[] = {
+	[HANTRO_MODE_VP9_DEC] = {
+		.run = hantro_g2_vp9_dec_run,
+		.done = hantro_g2_vp9_dec_done,
+		.reset = sunxi_vpu_reset,
+		.init = hantro_vp9_dec_init,
+		.exit = hantro_vp9_dec_exit,
+	},
+};
+
+static const struct hantro_irq sunxi_irqs[] = {
+	{ NULL, sunxi_vpu_irq },
+};
+
+static const char * const sunxi_clk_names[] = { "mod", "bus" };
+
+const struct hantro_variant sunxi_vpu_variant = {
+	.dec_fmts = sunxi_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(sunxi_vpu_dec_fmts),
+	.postproc_fmts = sunxi_vpu_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(sunxi_vpu_postproc_fmts),
+	.postproc_ops = &hantro_g2_postproc_ops,
+	.codec = HANTRO_VP9_DECODER,
+	.codec_ops = sunxi_vpu_codec_ops,
+	.init = sunxi_vpu_hw_init,
+	.irqs = sunxi_irqs,
+	.num_irqs = ARRAY_SIZE(sunxi_irqs),
+	.clk_names = sunxi_clk_names,
+	.num_clocks = ARRAY_SIZE(sunxi_clk_names),
+	.double_buffer = 1,
+	.legacy_regs = 1,
+};
-- 
2.34.0

