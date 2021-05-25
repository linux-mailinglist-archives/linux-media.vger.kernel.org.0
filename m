Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1131839053B
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhEYPYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232327AbhEYPY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:28 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79283C06138A;
        Tue, 25 May 2021 08:22:56 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j10so19157398edw.8;
        Tue, 25 May 2021 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jnFLOy9hjOHw4JROlHPDAo4HEdlEJqV6yVCmx9E7WOE=;
        b=oa9lM0axOA6a8j8/i3nk3fXMoTXlmmiLWvhNkLN+nYIK5YQjn61rpphcXQdThsYdVj
         ngLYS5BOVGnxCQgI4Yz/RwDC6w02DdFipoQSoM45ahKa0pRIpOzRCE08dDL8aWoF+S6P
         bIzPuS7LCVu2j++NKqGzzVHaTYsc0lfQgiXxNnmHWsAGNi9Affh05Bq9BhpgeaQrDRmV
         VBXUzVBIn1tJDILupIL4RGPLtf+Xw0nGOg8AW3bvSbNdYeYla91BnLy3ZXs/b5ke15SJ
         3N+D02V872xzNju3cVNgyf9OPJrR9GPn4XJ6eVqLEyZDJf1j+eGAZTG3qnwaTqaSMfVN
         FHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnFLOy9hjOHw4JROlHPDAo4HEdlEJqV6yVCmx9E7WOE=;
        b=f+VMEWuseSYf+iKA35vK+i4k6kGj2P5tGTV7N+DJiKcg/m19hNU7v8Ysqf8SO7p/Tp
         sJ3Zp0/Be2fi6TcRyX3jeGIaQJ9dXrFCo6F2m3NLrpnGib1CTmb4FpkYPSZznAhratON
         6Rvuay9OdDFk6iVZvXcGB0+HSSZckzuYoykcgvbB0wuh5WDISao2N2YFaSUkEjdFA80z
         NYkQaEGfBLBpdxUJBqJN6aFLssN4gA9U1u+M4HrXjMp51hingn2Nyp7Bubh+bDDXy4sz
         AF5YOLscyM4D+DMkebmICR9gpsZH0C5oGKYvgcDVC9mXznkgMTX9ThZ6D06XlwSEfHkR
         AfWw==
X-Gm-Message-State: AOAM531eTutxZ6Lfc1e69pc20BvYJMrfcY/nahYge2UZEgAF4QjnjpAi
        mayMvwllFQxYPkOG/0cLxg==
X-Google-Smtp-Source: ABdhPJzDbtN0x4SCapimaWgBqEVuQDZAoY1t1mav7kl1qZ2LhBOHzWEBRnS37VTdBle6YLSXA3xCdA==
X-Received: by 2002:a05:6402:281:: with SMTP id l1mr32126552edv.58.1621956174713;
        Tue, 25 May 2021 08:22:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:54 -0700 (PDT)
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
Subject: [PATCH 05/10] media: hantro: add support for Rockchip RK3036
Date:   Tue, 25 May 2021 17:22:20 +0200
Message-Id: <20210525152225.154302-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RK3036's VPU IP block is the same as RK3288 has, except that it doesn't
have an encoder, decoding is supported up to 1920x1088 only and the axi
clock can be set to 300 MHz max.

Add a new RK3036 variant which reflect this differences.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c    |  1 +
 drivers/staging/media/hantro/hantro_hw.h     |  1 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c | 49 ++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 38ea7b24036e..4f3c08e85bb8 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -490,6 +490,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
 	{ .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
+	{ .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index de2bc367a15a..d8d6b0d3c3b3 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -164,6 +164,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant rk3066_vpu_variant;
+extern const struct hantro_variant rk3036_vpu_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index 29805c4bd92f..c4684df4e012 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -174,6 +174,13 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int rk3036_vpu_hw_init(struct hantro_dev *vpu)
+{
+	/* Bump ACLKs to max. possible freq. to improve performance. */
+	clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
+	return 0;
+}
+
 static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
 {
 	/* Bump ACLKs to max. possible freq. to improve performance. */
@@ -209,6 +216,27 @@ static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
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
@@ -269,6 +297,10 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
  * VPU variant.
  */
 
+static const struct hantro_irq rk3036_irqs[] = {
+	{ "vdpu", hantro_g1_irq },
+};
+
 static const struct hantro_irq rk3288_irqs[] = {
 	{ "vepu", rk3288_vepu_irq },
 	{ "vdpu", hantro_g1_irq },
@@ -283,6 +315,23 @@ static const char * const rk3288_clk_names[] = {
 	"aclk", "hclk"
 };
 
+const struct hantro_variant rk3036_vpu_variant = {
+	.dec_offset = 0x400,
+	.dec_fmts = rk3066_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3066_vpu_dec_fmts),
+	.postproc_fmts = rk3288_vpu_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(rk3288_vpu_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
+	.codec_ops = rk3036_vpu_codec_ops,
+	.irqs = rk3036_irqs,
+	.num_irqs = ARRAY_SIZE(rk3036_irqs),
+	.init = rk3036_vpu_hw_init,
+	.clk_names = rk3288_clk_names,
+	.num_clocks = ARRAY_SIZE(rk3288_clk_names)
+};
+
 const struct hantro_variant rk3066_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3288_vpu_enc_fmts,
-- 
2.27.0

