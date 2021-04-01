Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BB4351B98
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237872AbhDASI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237969AbhDASFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:05:10 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD1BC0045EB;
        Thu,  1 Apr 2021 07:43:51 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x21so2256688eds.4;
        Thu, 01 Apr 2021 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//s5GXhvTYBFxepTOFjvgKPgNSSVEMfEdoDacbVrJhc=;
        b=srOwqToty+vlDNm7oWtGDR2rnfrMWI9xJ/AbSrtKPS6ImnqjGhLG4EF5aj0htMsX+m
         6ZzqPZuGSwy++hrcbJqmzOiAV6L4AFMvuwQIYYejhQVV6xLcLjQgA1bjYAnO7vVNm7Od
         3JcGJJ+rvbkXtDVlK3U2lQ4PRQ+J9jwyIejQqDC4nPseYN92yjwErLnsI6ff9U52E0Ib
         XlY3RLi30q7jfkGGOnTEOnW9DBltSSL9CWl93FRNAZmiAB2yGzb5vIeLmDwpnUaa8FDS
         rXJiKcSW4tDPKW4wnWdMZmMy45OLwDf6wc5zxXDN4BE6lauX8r6NG0CRDWuyufmoVO9V
         W8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//s5GXhvTYBFxepTOFjvgKPgNSSVEMfEdoDacbVrJhc=;
        b=Z51wGTWvPXEri6xnILTZug08mioAM4Xp3utFeZgs7iCXk+kPo1AFo+jrTS0LHdwfAz
         IQfOUbxIq12HE3QdmGputEYJYgRKqtqfy8DyNMhCjHdiL0nNwJheIlRT3+PqvzlyV6pv
         En7ytPxF+ygtPkyZpgMCV7bKPCyTXPW06lbrifK2RT2tSi8Dn2PehMyUCcfULP69cdQX
         UFFn8mDN64fzqyQ4dugdNnk/0OB0EEw/j4yyaStnJUHZQTYRPwGiLgYsnx9HvCqwhP/o
         XMQR6ehtg0yHvuDCIG967vpQ5JhMRCrRrexfIHsMCXk2O3BZIw9IGzEtZH0A2pvbRnzK
         ohQg==
X-Gm-Message-State: AOAM5308iFv2TA+U5JDNsmODzgUXwFjbxpxfGuQQ3XhJru7gP1e8EPTi
        6SnbGfqpyeJ4Rm6yJ9R4yUP3V8JGKnK5uA==
X-Google-Smtp-Source: ABdhPJzRF3IZ7eUDkITHBb5jDzzgzF/Uytq1qkOWxgyKdzjQJXYQ75EK0bm6BTY2xxVf/P8SRYopRQ==
X-Received: by 2002:a05:6402:447:: with SMTP id p7mr10216224edw.89.1617288230479;
        Thu, 01 Apr 2021 07:43:50 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:50 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v4 5/9] media: hantro: introduce hantro_g1.c for common API
Date:   Thu,  1 Apr 2021 15:43:32 +0100
Message-Id: <20210401144336.2495479-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The Hantro G1 IRQ and reset handling it pretty standard. I was this
close to duplicating it, yet again, before reconsidering and refactoring
it to a separate file.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
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
2.31.1

