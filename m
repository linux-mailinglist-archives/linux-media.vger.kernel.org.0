Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A380C3932B7
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235949AbhE0PrE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235707AbhE0PrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:47:00 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F84C061574;
        Thu, 27 May 2021 08:45:25 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id b9so755422ejc.13;
        Thu, 27 May 2021 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yNDXks9FLR1I5yslIUR5VMwMt2vdynAEYi3WAzNuIhY=;
        b=ncyQy3M9qBDJzY5vF/S1HSzx/jwBbS/sZ18FCaJIY0QmuxnuKy6Nw39Af+ur2XPCeU
         cUAuZItPTeR903uCj2gYnNSmi1pgjTdBLB5Gz1zHjElN0IDM4XpN7EJOGIFbQSST7G7D
         Fz6ScxZr0CJpqq+EGMXOAgC+XSJMKsoP1Wkg/I7EdtMy4C+kWThmzC/DenjSDKTcBbRS
         179gDcPh080+junPRS5niCTiKSyL1hCqfNFdQXJMq2cIJ5zIQEV5njD4kTk0VDIW8CcK
         2nuXbnfF6Hg8pcDqjxRN6GDDpn4XAiy/6oqL1xDc1aRVA+mgQMPsffTW7sEDT5QJg+r3
         i7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yNDXks9FLR1I5yslIUR5VMwMt2vdynAEYi3WAzNuIhY=;
        b=QBsJoUVP5FwTgYQGbFCShxUgZskPr9pb9ZrX1OOjnlq4N+la0qTYZ2EhVCiFXBNGns
         W6PoHJiBpfr/nNEAOda4krFsDDCCre995cpx9WNd4aqNV+IRTNTZWtT9JpzJjfW+/P0V
         sG5Zq04rq6aFaFD9CFxYiEaUFwKuagVi9MzTwk2blnnvEV4HSIPers81vJh1CB5kpB8D
         1QXZAVbzRFKhDIlJviliy8PfO9A1rlAPvNSFOqNn9JChM3hoHCkTcuPDTtEL+DeHWcYA
         GH4qVsqIK6EQAEp6kDYCkazSvWXxyOW2bBC/7+X+PsZjFC1a4zyzEvx3I/sewVGG+gfi
         Z1Ow==
X-Gm-Message-State: AOAM532r10Y4umiAK4XT98FSAuZQgeWyhIDavpC2HS8MuTYlLdRV2xCd
        cWqNOlUpWcNGSGlZXHUhbg==
X-Google-Smtp-Source: ABdhPJxyulIDT7lZSx+lDZc2lTMakSrt9KZVAuVh6gIHusstZGS92ceQkIkm8InG6m1lyq5JmMXkJQ==
X-Received: by 2002:a17:906:454b:: with SMTP id s11mr4489001ejq.3.1622130324450;
        Thu, 27 May 2021 08:45:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:24 -0700 (PDT)
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
Subject: [PATCH v2 07/12] media: hantro: add support for Rockchip RK3036
Date:   Thu, 27 May 2021 17:44:50 +0200
Message-Id: <20210527154455.358869-8-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
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

 Changes in v2:
 - rename rk3036_irqs -> rockchip_vdpu1_irqs
 - fix spelling error

 drivers/staging/media/hantro/hantro_drv.c     |  1 +
 drivers/staging/media/hantro/hantro_hw.h      |  1 +
 .../staging/media/hantro/rockchip_vpu_hw.c    | 49 +++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ae6d970b7536..64cb91d102cc 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -486,6 +486,7 @@ static const struct v4l2_file_operations hantro_fops = {
 
 static const struct of_device_id of_hantro_match[] = {
 #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
+	{ .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
 	{ .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 0da8da753447..f44dc5921e87 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -161,6 +161,7 @@ enum hantro_enc_fmt {
 };
 
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant rk3036_vpu_variant;
 extern const struct hantro_variant rk3066_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index deb263de8fec..d4b048d3b6b9 100644
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

