Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E663A7171
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 23:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhFNVgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 17:36:32 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:45732 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhFNVgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 17:36:31 -0400
Received: by mail-wr1-f46.google.com with SMTP id z8so15999221wrp.12;
        Mon, 14 Jun 2021 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O9ExEfI8smsY8pVgfSWlbEFVVdj0jjSRoSg8s9hKtvk=;
        b=tG+4H7tXI41JWsmLa497HX1A4+INNIzuHIu1RhC2v5dj4CuQmaQFVOrTF4AVU1/Fqy
         g84438Zb1aJZp9pkF/saIlcFjCj8ERu4R21BVagEmmqmsmGG+4LgrWCfZ6qzQVUxsKhr
         8DbBIZCmJ67qOe+I8Cf02mhtpIzSbrTKFv01R8HqII28L1fNdQad34gN7ty24/tFotex
         OEhwX6IIexKS2S62mfwsJG2nQl7pkatU67CSkbM01BY8DBChc2wTmpnqZHiiZIoYFmVV
         kuMzf8+cmhduqO3DxtZ8mXm38E5taLhtlt1HReTo/5fHSMjqGXsVm9esWGXcdrSZWES+
         bo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O9ExEfI8smsY8pVgfSWlbEFVVdj0jjSRoSg8s9hKtvk=;
        b=hFGWrHA9OtOuT5KFYeUD90jwFcFyU27YvGCQ43DqQnF6RnVGEfJ0woWHrtBIZO1scH
         iGhOQwwMcq9yW93EiXrXK/aLKUuYe97mFAizeDQhGvP6qa/Oov+Z9R8Wk9RrCGe5s6AW
         VHgBhUjbEyNwWcyEprw0/5FKeZwmglVfvybD4ydQpfLbPc+OKyA4jlQ5RaHGxOdazh97
         xJZ1cY5EYgHJ6yVH3QM/bVPnvKSrb5n4+Nq5ACShuVPpMOrzcgx9SKb9NqLbLHJ6xKbE
         p21Rwn03lUceEtdRXmqj6h1ymSoTjT5YAJDu2bLS46eVzwftFRXv/nT4aZmjjGIPpi8w
         9RHA==
X-Gm-Message-State: AOAM531sqEfO0ydaGkJOS3oYBStnDdm0p6RJtL0u78GfKE+EfuPxFuO9
        1m1DcO9ciTHwu/mJw8h7e7G7wJShAA==
X-Google-Smtp-Source: ABdhPJyG/RKWAmir0AONi40wwGGCi5zze6Jpy3mkSnZJxvYvTK7ygDVhLwgJ7QdHqeEd01Zb7BcBew==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr1323477wrp.252.1623706407550;
        Mon, 14 Jun 2021 14:33:27 -0700 (PDT)
Received: from localhost.localdomain ([91.67.75.139])
        by smtp.googlemail.com with ESMTPSA id g23sm989525wmk.3.2021.06.14.14.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:33:27 -0700 (PDT)
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
Subject: [PATCH v3 6/6] media: hantro: add support for Rockchip RK3036
Date:   Mon, 14 Jun 2021 23:32:15 +0200
Message-Id: <20210614213215.99389-7-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614213215.99389-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210614213215.99389-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RK3036's VPU IP block is the same as RK3288 has, except that it doesn't
have an encoder, decoding is supported up to 1920x1088 only and the axi
clock can be set to 300 MHz max.

Add a new RK3036 variant which reflects these differences.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---

 Changes in v3:
 - collect Reviewed-tag

 Changes in v2:
 - rename rk3036_irqs -> rockchip_vdpu1_irqs
 - fix spelling error

 drivers/staging/media/hantro/hantro_drv.c     |  1 +
 drivers/staging/media/hantro/hantro_hw.h      |  1 +
 .../staging/media/hantro/rockchip_vpu_hw.c    | 49 +++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index aaef66c4c795..31d8449ca1d2 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -582,6 +582,7 @@ static const struct v4l2_file_operations hantro_fops = {
 
 static const struct of_device_id of_hantro_match[] = {
 #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
+	{ .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
 	{ .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 77df0eba4e6f..5dcf65805396 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -205,6 +205,7 @@ enum hantro_enc_fmt {
 
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant rk3036_vpu_variant;
 extern const struct hantro_variant rk3066_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index b370b5e802fa..3ccc16413f42 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -244,6 +244,13 @@ static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int rk3036_vpu_hw_init(struct hantro_dev *vpu)
+{
+	/* Bump ACLK to max. possible freq. to improve performance. */
+	clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
+	return 0;
+}
+
 static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLKs to max. possible freq. to improve performance. */
@@ -297,6 +304,27 @@ static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
 /*
  * Supported codec ops.
  */
+static const struct hantro_codec_ops rk3036_vpu_codec_ops[] = {
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
 static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
 	[HANTRO_MODE_JPEG_ENC] = {
 		.run = hantro_h1_jpeg_enc_run,
@@ -378,6 +406,10 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
  * VPU variant.
  */
 
+static const struct hantro_irq rockchip_vdpu1_irqs[] = {
+	{ "vdpu", hantro_g1_irq },
+};
+
 static const struct hantro_irq rockchip_vpu1_irqs[] = {
 	{ "vepu", rockchip_vpu1_vepu_irq },
 	{ "vdpu", hantro_g1_irq },
@@ -401,6 +433,23 @@ static const char * const rockchip_vpu_clk_names[] = {
 	"aclk", "hclk"
 };
 
+const struct hantro_variant rk3036_vpu_variant = {
+	.dec_offset = 0x400,
+	.dec_fmts = rk3066_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3066_vpu_dec_fmts),
+	.postproc_fmts = rockchip_vpu1_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(rockchip_vpu1_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
+	.codec_ops = rk3036_vpu_codec_ops,
+	.irqs = rockchip_vdpu1_irqs,
+	.num_irqs = ARRAY_SIZE(rockchip_vdpu1_irqs),
+	.init = rk3036_vpu_hw_init,
+	.clk_names = rockchip_vpu_clk_names,
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
+};
+
 /*
  * Despite this variant has separate clocks for decoder and encoder,
  * it's still required to enable all four of them for either decoding
-- 
2.27.0

