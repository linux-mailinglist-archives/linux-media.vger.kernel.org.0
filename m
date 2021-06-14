Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416CA3A7168
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 23:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbhFNVfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 17:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhFNVfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 17:35:44 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB8AC0617AF;
        Mon, 14 Jun 2021 14:33:25 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a11so15977757wrt.13;
        Mon, 14 Jun 2021 14:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eyIEZL68jj7JT8Ia9HjhIBFKDKA+/iyQrH+Xcjh3B1k=;
        b=fhoTw1MsbqiOpcQTkS0pcT3PeiGqHn+a7/EF+e7hrZYXaWPVUJl0N0qKjq6dO2y8e1
         CX6cFIziEsua7CU7BOUzwnqLxn6S3fRweH2z9fSQ99ZlZa4hbV9yvOh3cZRAtmP30RLS
         6fb04Uyu32Mgh4nyMh2w9lh+m4usMtOGMeAcoNfZ2G1MgRQF5JfJT459H6yOUZb9hTXx
         hlE1ZfycasJ/gG/ytXQTbx+Iuaa34SFHHafsFSo4r56KosjBvgLycDfKvjn6szDzRlAI
         08B8ONFigV2tQydEfpBrJMX5UKCfMfJlzb/5MQhTipg6te3BEbSvdLWz2LfWJcsDdZQ9
         t2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eyIEZL68jj7JT8Ia9HjhIBFKDKA+/iyQrH+Xcjh3B1k=;
        b=m4D9iWqFRjF5t3P/eXs2aWzAGVpXQ7uLE5CQYlxgCrQrz5NwzgZ/+09fCHYUsKaH8c
         SR5Q4njYZm9kgKOIMjFPx7XOp1qB0YBXQyr20grzcSe98idLo+4+1T5FXsevooZhSN7O
         mqASrKzjJNCahAVGJ2lkie4RRuQLSiBN/7w6SkaXFlUvaXT4ckvsdU4cIuJvoSmkGtNS
         Ch6XbDhrAFhWOneZF5uBK6vggfEHwrCjKLWi7QNIHK75GbRIhaNlb6TO/yl1YAaqtRTz
         ne0wNhr2MkL/xsFzQhXz/UTd3egmP35E84bzFb6Rbe0OnwU81rUyVdsukk4ydYPdiaQv
         b1gA==
X-Gm-Message-State: AOAM532T0qyLqvvZleZ3WPzCxYnKwjiP/qYsnVtzTYVsTc02NkBhrzmp
        LmzaT6t47YBb7TOxl3/1nQ==
X-Google-Smtp-Source: ABdhPJybFEsWfxmOk0GCEzrGhNBvGThF74R/wBRCbEntj7h8QAc0KwQoqxYnDDfe6Dee4QDJ8Yp6kg==
X-Received: by 2002:adf:cd8d:: with SMTP id q13mr16193569wrj.78.1623706403979;
        Mon, 14 Jun 2021 14:33:23 -0700 (PDT)
Received: from localhost.localdomain ([91.67.75.139])
        by smtp.googlemail.com with ESMTPSA id g23sm989525wmk.3.2021.06.14.14.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:33:23 -0700 (PDT)
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
Subject: [PATCH v3 5/6] media: hantro: add support for Rockchip RK3066
Date:   Mon, 14 Jun 2021 23:32:14 +0200
Message-Id: <20210614213215.99389-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614213215.99389-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210614213215.99389-1-knaerzche@gmail.com>
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
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---

 Changes in v3:
 - rename rk3066_clk_names -> rk3066_vpu_clk_names
 - collect Reviewed-tag

 Changes in v2:
 - fixed wrong index in clk array for vepu clock in rk3066_vpu_hw_init
 - added comment, why this variant can't be splitted in g1/h1 variants

 drivers/staging/media/hantro/hantro_drv.c     |   1 +
 drivers/staging/media/hantro/hantro_hw.h      |   1 +
 .../staging/media/hantro/rockchip_vpu_hw.c    | 121 ++++++++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 34e778e1cea1..aaef66c4c795 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -582,6 +582,7 @@ static const struct v4l2_file_operations hantro_fops = {
 
 static const struct of_device_id of_hantro_match[] = {
 #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
+	{ .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index a7b75b05e849..77df0eba4e6f 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -205,6 +205,7 @@ enum hantro_enc_fmt {
 
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant rk3066_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3399_vpu_variant;
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index bf760e8e65ce..b370b5e802fa 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -10,9 +10,11 @@
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
+#include "hantro_g1_regs.h"
 #include "hantro_h1_regs.h"
 #include "rockchip_vpu2_regs.h"
 
+#define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
 
 /*
@@ -63,6 +65,52 @@ static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] = {
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
@@ -196,6 +244,14 @@ static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
+{
+	/* Bump ACLKs to max. possible freq. to improve performance. */
+	clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
+	clk_set_rate(vpu->clocks[2].clk, RK3066_ACLK_MAX_FREQ);
+	return 0;
+}
+
 static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLK to max. possible freq. to improve performance. */
@@ -203,6 +259,14 @@ static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
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
 static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -233,6 +297,33 @@ static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
 /*
  * Supported codec ops.
  */
+static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
+	[HANTRO_MODE_JPEG_ENC] = {
+		.run = hantro_h1_jpeg_enc_run,
+		.reset = rockchip_vpu1_enc_reset,
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
@@ -301,10 +392,40 @@ static const struct hantro_irq rockchip_vpu2_irqs[] = {
 	{ "vdpu", rockchip_vpu2_vdpu_irq },
 };
 
+static const char * const rk3066_vpu_clk_names[] = {
+	"aclk_vdpu", "hclk_vdpu",
+	"aclk_vepu", "hclk_vepu"
+};
+
 static const char * const rockchip_vpu_clk_names[] = {
 	"aclk", "hclk"
 };
 
+/*
+ * Despite this variant has separate clocks for decoder and encoder,
+ * it's still required to enable all four of them for either decoding
+ * or encoding and we can't split it in separate g1/h1 variants.
+ */
+const struct hantro_variant rk3066_vpu_variant = {
+	.enc_offset = 0x0,
+	.enc_fmts = rockchip_vpu_enc_fmts,
+	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
+	.dec_offset = 0x400,
+	.dec_fmts = rk3066_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3066_vpu_dec_fmts),
+	.postproc_fmts = rockchip_vpu1_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(rockchip_vpu1_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
+		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
+	.codec_ops = rk3066_vpu_codec_ops,
+	.irqs = rockchip_vpu1_irqs,
+	.num_irqs = ARRAY_SIZE(rockchip_vpu1_irqs),
+	.init = rk3066_vpu_hw_init,
+	.clk_names = rk3066_vpu_clk_names,
+	.num_clocks = ARRAY_SIZE(rk3066_vpu_clk_names)
+};
+
 const struct hantro_variant rk3288_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rockchip_vpu_enc_fmts,
-- 
2.27.0

