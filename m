Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A2E390537
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhEYPY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhEYPY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:26 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6698C061756;
        Tue, 25 May 2021 08:22:54 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gb17so29920413ejc.8;
        Tue, 25 May 2021 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xbjO6MkLDNXminXQSV71qX7NG5pVEmjmWyRuZG5Ty2c=;
        b=llNRDe9RMU29A0NrEoe6BmjikGjL9mkBhGstzytPy/hAU28oKS7ysAUAABvpLc8ozR
         tKcWh1L7/GIbePfJSniDbItGVbJFox4CFA8RCuKuEVinCzMKXWsABN1/2+4lm7SSgS+c
         lzA+g53/kLTElJNsKWZzmecCjWyyteGaJiIFxGaQ+BvxcnwFdaxYIiUl0KDcGMydidUv
         dTRhd8qaJZdUOTtcno/yqvIt2yzvizkWNcUORZHdTJcWu1Pg7+ZIyk27ah8nvan03sBI
         oVMFR3BCvSue1u+WpaDeruVyMMh9A3UtQH4wsqHDyVVBI/VX/F0JJox/EliD02a0oHsQ
         Hb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xbjO6MkLDNXminXQSV71qX7NG5pVEmjmWyRuZG5Ty2c=;
        b=EroASeiwtYaZFud71aw109pXPqWhryEwkq1h0gIUE/7VKiGFd2RHFRQXw1bnTE6hEU
         uax+mBaZKYKWF5d77nIgryleY69kYQ/8bI+Uvq5JjsDE0HFeixJ7F/Kx/O9vffgaHjZN
         oYVo53l+0mQNrJatVe6e1xJUa8mjB6Yrmncm1Ftcq61VZzabe4z5nsCgHanJ8ShSeQFe
         NLzlHaJUXqllOUIbRz+7HMdapTfc30BUb9kR6f1JOzF+UxVypvK2wlb+0/B47/L5QLgT
         zZClAFNUNoPTPdT5aU7O+fVL71eri4Fg7vN9lmU+dSaKRnBQzOQ+7rKN7GXzwIH+xkDA
         DL6g==
X-Gm-Message-State: AOAM533MqTv4vzavgFhxJ9AekdEYiTnkKAswShug0kjXAfD5DyajBmyT
        m65/SzFI5pj/Xx8N9EWWnw==
X-Google-Smtp-Source: ABdhPJyy+8pHf98xy+TmTCBUPyexGSiqfb1hzVkVkL4TPZ6uUr9EzrLC3APYKifcQvsTXrL8S2tWpg==
X-Received: by 2002:a17:906:1299:: with SMTP id k25mr29402657ejb.139.1621956173419;
        Tue, 25 May 2021 08:22:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:53 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 04/10] media: hantro: add support for Rockchip RK3066
Date:   Tue, 25 May 2021 17:22:19 +0200
Message-Id: <20210525152225.154302-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RK3066's VPU IP block is the predecessor from what RK3288 has.
The hardware differences are:
  - supports decoding frame sizes up to 1920x1088 only
  - doesn't have the 'G1_REG_SOFT_RESET' register
    (requires another .reset callback for hantro_codec_ops,
     since writing this register will result in non-working
     IP block)
  - has one ACLK/HCLK per vdpu/vepu
  - ACLKs can be clocked up to 300 MHz only
  - no MMU
    (no changes required: CMA will be transparently used)

Add a new RK3066 variant which reflect this differences. This variant
can be used for RK3188 as well.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c    |   1 +
 drivers/staging/media/hantro/hantro_hw.h     |   1 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c | 116 +++++++++++++++++++
 3 files changed, 118 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 2f6b01c7a6a0..38ea7b24036e 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -489,6 +489,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
+	{ .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 3d8b53567f16..de2bc367a15a 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -163,6 +163,7 @@ enum hantro_enc_fmt {
 extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
+extern const struct hantro_variant rk3066_vpu_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index fefd45269e52..29805c4bd92f 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -10,8 +10,10 @@
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
+#include "hantro_g1_regs.h"
 #include "hantro_h1_regs.h"
 
+#define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
 
 /*
@@ -62,6 +64,52 @@ static const struct hantro_fmt rk3288_vpu_postproc_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt rk3066_vpu_dec_fmts[] = {
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
+			.max_width = 1920,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
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
+			.max_width = 1920,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
 static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
@@ -126,6 +174,14 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
+{
+	/* Bump ACLKs to max. possible freq. to improve performance. */
+	clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
+	clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
+	return 0;
+}
+
 static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLK to max. possible freq. to improve performance. */
@@ -133,6 +189,14 @@ static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
 	return 0;
 }
 
+static void rk3066_vpu_dec_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_IRQ_DIS, G1_REG_INTERRUPT);
+	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
+}
+
 static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -145,6 +209,33 @@ static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
 /*
  * Supported codec ops.
  */
+static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
+	[HANTRO_MODE_JPEG_ENC] = {
+		.run = hantro_h1_jpeg_enc_run,
+		.reset = rk3288_vpu_enc_reset,
+		.init = hantro_jpeg_enc_init,
+		.done = hantro_jpeg_enc_done,
+		.exit = hantro_jpeg_enc_exit,
+	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = hantro_g1_h264_dec_run,
+		.reset = rk3066_vpu_dec_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
+		.reset = rk3066_vpu_dec_reset,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+	[HANTRO_MODE_VP8_DEC] = {
+		.run = hantro_g1_vp8_dec_run,
+		.reset = rk3066_vpu_dec_reset,
+		.init = hantro_vp8_dec_init,
+		.exit = hantro_vp8_dec_exit,
+	},
+};
 
 static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
 	[HANTRO_MODE_JPEG_ENC] = {
@@ -183,10 +274,35 @@ static const struct hantro_irq rk3288_irqs[] = {
 	{ "vdpu", hantro_g1_irq },
 };
 
+static const char * const rk3066_clk_names[] = {
+	"aclk_vdpu", "hclk_vdpu",
+	"aclk_vepu", "hclk_vepu"
+};
+
 static const char * const rk3288_clk_names[] = {
 	"aclk", "hclk"
 };
 
+const struct hantro_variant rk3066_vpu_variant = {
+	.enc_offset = 0x0,
+	.enc_fmts = rk3288_vpu_enc_fmts,
+	.num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
+	.dec_offset = 0x400,
+	.dec_fmts = rk3066_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3066_vpu_dec_fmts),
+	.postproc_fmts = rk3288_vpu_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(rk3288_vpu_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
+		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
+	.codec_ops = rk3066_vpu_codec_ops,
+	.irqs = rk3288_irqs,
+	.num_irqs = ARRAY_SIZE(rk3288_irqs),
+	.init = rk3066_vpu_hw_init,
+	.clk_names = rk3066_clk_names,
+	.num_clocks = ARRAY_SIZE(rk3066_clk_names)
+};
+
 const struct hantro_variant rk3288_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3288_vpu_enc_fmts,
-- 
2.27.0

