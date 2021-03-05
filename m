Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E41F32F2EE
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 19:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhCESkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 13:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhCESjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 13:39:54 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF25C061765
        for <linux-media@vger.kernel.org>; Fri,  5 Mar 2021 10:39:42 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id r17so5339610ejy.13
        for <linux-media@vger.kernel.org>; Fri, 05 Mar 2021 10:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A1F9ubxjj5JQ7XOnbTnhDg4oJuf5YvuizJOCT/vcunY=;
        b=XLYKR5RUOC1kSxFpfjtgZbggqByY+f5KB4ppJdxH1oWHM8vSLpbqfmH5kLq5dYeW2H
         yXCtg85OY57rEsr/qRasikzHpH/3fEL4AMhNwf1RsS7UcYYlHvkEq8IM6zGOHcuQs0IT
         XVAFMap9kyXsTyavF9A9TC59TF2UlnBYN8YFjDRjKGZJNUD44IoZHfTS8D0wysmXNDtv
         WHB25vdwj27MDbdX4vvzwYRs9beLydMejxiA06W7bIGND3TJWy+ervPXIJOXHmR6w8+W
         F9NGX5A3SmSEwV3czeMnhkU+geTKEIbPr07zz277GgjQq2GCAAMCcuIHpG/nGrhFmRe1
         wMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A1F9ubxjj5JQ7XOnbTnhDg4oJuf5YvuizJOCT/vcunY=;
        b=Oa3oypyuU2e/L62yuq1AR8dyb9ENF1aRPuLQ/RZvvNcPXr/CRYUpe3fndtAa4VFPja
         8/rOFTvXZp3l0Pt3hGIBq+H4hSxehKCibDukd5jFftcbGbbWBdxou2QRuq8y4DjUmAYd
         FDXgygdOVnB5Ou5W+isNApRIhIrmEuuUm3xVH1xTCJzWzDJewbOa3P1Be/LwU5tzPgwH
         U9Vm39/TkwAgfmVAfhdDa5rQdkNy90BQdFRoetRsENqdaj9TIlkeI2y7YCqcFdcz9zv5
         S1oCMNSF5fXCuBiYEv/zlAY6eCH3GpZB75+ohm9mht4fEg7MrYIATNGL2w9Ngq2BFE15
         FLwA==
X-Gm-Message-State: AOAM531FSoxu6CS55qDD9wHmTQTS3Hz7acG+Rv5MZtLX1BabM+izyU+1
        deRnUE++dia2Mj7xIqDBX28=
X-Google-Smtp-Source: ABdhPJwpKsptfl270UR7t8sBcTq0osd0vrvg5ITEvcVBxvxSAceLeOTszUkLpANHXoKSXGXjDzlq9A==
X-Received: by 2002:a17:906:aac5:: with SMTP id kt5mr3665232ejb.548.1614969581543;
        Fri, 05 Mar 2021 10:39:41 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:39:40 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 5/7] media: hantro: introduce hantro_g1.c for common API
Date:   Fri,  5 Mar 2021 18:39:22 +0000
Message-Id: <20210305183924.1754026-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The Hantro G1 IRQ and reset handling it pretty standard. I was this
close to duplicating it, yet again, before reconsidering and refactoring
it to a separate file.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/Makefile        |  1 +
 drivers/staging/media/hantro/hantro_g1.c     | 39 ++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h     |  3 ++
 drivers/staging/media/hantro/imx8m_vpu_hw.c  | 21 +----------
 drivers/staging/media/hantro/rk3288_vpu_hw.c | 36 ++----------------
 5 files changed, 48 insertions(+), 52 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 743ce08eb184..3747a32799b2 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -7,6 +7,7 @@ hantro-vpu-y += \
 		hantro_v4l2.o \
 		hantro_postproc.o \
 		hantro_h1_jpeg_enc.o \
+		hantro_g1.o \
 		hantro_g1_h264_dec.o \
 		hantro_g1_mpeg2_dec.o \
 		hantro_g1_vp8_dec.o \
diff --git a/drivers/staging/media/hantro/hantro_g1.c b/drivers/staging/media/hantro/hantro_g1.c
new file mode 100644
index 000000000000..0ab1cee62218
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_g1.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ * Copyright (C) 2019 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
+ * Copyright (C) 2021 Collabora Ltd, Emil Velikov <emil.velikov@collabora.com>
+ */
+
+#include "hantro.h"
+#include "hantro_g1_regs.h"
+
+irqreturn_t hantro_g1_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vdpu_read(vpu, G1_REG_INTERRUPT);
+	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
+		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
+	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
+
+void hantro_g1_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_IRQ_DIS, G1_REG_INTERRUPT);
+	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
+	vdpu_write(vpu, 1, G1_REG_SOFT_RESET);
+}
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 34c9e4649a25..73c71bb2320c 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -164,6 +164,9 @@ void hantro_irq_done(struct hantro_dev *vpu,
 void hantro_start_prepare_run(struct hantro_ctx *ctx);
 void hantro_end_prepare_run(struct hantro_ctx *ctx);
 
+irqreturn_t hantro_g1_irq(int irq, void *dev_id);
+void hantro_g1_reset(struct hantro_ctx *ctx);
+
 void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
 void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index f36c1bd681ba..9eb556460e52 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 
 #include "hantro.h"
-#include "hantro_g1_regs.h"
 
 #define CTRL_SOFT_RESET		0x00
 #define RESET_G1		BIT(1)
@@ -129,24 +128,6 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 	},
 };
 
-static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vdpu_read(vpu, G1_REG_INTERRUPT);
-	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
-		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
-	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
@@ -191,7 +172,7 @@ static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
  */
 
 static const struct hantro_irq imx8mq_irqs[] = {
-	{ "g1", imx8m_vpu_g1_irq },
+	{ "g1", hantro_g1_irq },
 	{ "g2", NULL /* TODO: imx8m_vpu_g2_irq */ },
 };
 
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index 7b299ee3e93d..fefd45269e52 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -10,7 +10,6 @@
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
-#include "hantro_g1_regs.h"
 #include "hantro_h1_regs.h"
 
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
@@ -127,24 +126,6 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t rk3288_vdpu_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vdpu_read(vpu, G1_REG_INTERRUPT);
-	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
-		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
-	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
 static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLK to max. possible freq. to improve performance. */
@@ -161,15 +142,6 @@ static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
 }
 
-static void rk3288_vpu_dec_reset(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_IRQ_DIS, G1_REG_INTERRUPT);
-	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
-	vdpu_write(vpu, 1, G1_REG_SOFT_RESET);
-}
-
 /*
  * Supported codec ops.
  */
@@ -184,19 +156,19 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
 	},
 	[HANTRO_MODE_H264_DEC] = {
 		.run = hantro_g1_h264_dec_run,
-		.reset = rk3288_vpu_dec_reset,
+		.reset = hantro_g1_reset,
 		.init = hantro_h264_dec_init,
 		.exit = hantro_h264_dec_exit,
 	},
 	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = hantro_g1_mpeg2_dec_run,
-		.reset = rk3288_vpu_dec_reset,
+		.reset = hantro_g1_reset,
 		.init = hantro_mpeg2_dec_init,
 		.exit = hantro_mpeg2_dec_exit,
 	},
 	[HANTRO_MODE_VP8_DEC] = {
 		.run = hantro_g1_vp8_dec_run,
-		.reset = rk3288_vpu_dec_reset,
+		.reset = hantro_g1_reset,
 		.init = hantro_vp8_dec_init,
 		.exit = hantro_vp8_dec_exit,
 	},
@@ -208,7 +180,7 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
 
 static const struct hantro_irq rk3288_irqs[] = {
 	{ "vepu", rk3288_vepu_irq },
-	{ "vdpu", rk3288_vdpu_irq },
+	{ "vdpu", hantro_g1_irq },
 };
 
 static const char * const rk3288_clk_names[] = {
-- 
2.30.1

