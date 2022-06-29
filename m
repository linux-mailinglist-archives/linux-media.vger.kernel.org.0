Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF79560AB5
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 21:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiF2T4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 15:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiF2T4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 15:56:37 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BAB3466C
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 12:56:35 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-101ab23ff3fso22935196fac.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 12:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtdRhSHcHimjcfa9P8DWUGduGozUxk97f29FSzqKU1M=;
        b=5TfzXq83oIyevEF+IeSWvMk0ZpiPfDEDEHO3GjO2kffbe0v1qsHB0TF9v3xvrEIewZ
         duxgcAAsgG4Um2lP1p7aYrezoJDwzv692aJNTB2ZHEbfJghdRpMhqVxXH4vAdNB6GdVV
         487j22Pa6VSMCkTSLWmrK6gI6Fb0te+uLGxr78vWARrqx8SlnYQO1EKHZMkbwQG3QFJC
         M1CkrszxN8xYVcLIhEsvr9JH73phmzOFoxOunIjIrlt/6qielHMTEloT4SL3+Xk2XiOi
         JH3Y+JwZ6O+l/58Cy5nqkJ8rWjd24vbta+ajUSTrYLpszC0YnXhofcvPn1/z5DTU+5KZ
         vcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtdRhSHcHimjcfa9P8DWUGduGozUxk97f29FSzqKU1M=;
        b=aUDXXWV8zX7Iri/PVJcO7DAlQas8E7BPvwdv4pJwjgj16MGo2IZwVv6gQp/I94kRTr
         WagEZcaHx0HLEWD6sxU2W3MircoYDB/O8r6HDSHwQw4sJt3Ve91Nj0PZzMTaqF6Gq5DW
         jnbAm1RQ3tlsrYly3kKMPJcTUS68R8w9tsggvLSCAerHo9hqsu27eSopjJgiZQuZGe49
         cSZKWNfn9cYg4LIQUwwtHiiKy6pNI18h7t097yEO+NHkqHWYXBG/tZPzhYia5UUf3jDH
         9B7w+buK0+CTm3lJd7bXysKxj6uMHnmzvdmJF0idFJ72WscI1TeTHeUEhwDz44LExuyI
         +eYw==
X-Gm-Message-State: AJIora9eIEXbHSxpgnmIW7sucgnCGuJjQreugQaHvaPhyarPU6mrkkoB
        mV2USi9PTw1MMonTmaOFybMd2ZzPklwMvEbe
X-Google-Smtp-Source: AGRyM1s37hb7eYCfhTiM6cxfJWY2g9MwFk2rcYGA5QyZ0WxQhiUoZub24fc+kBX6l+1lngRgXdajQg==
X-Received: by 2002:a05:6870:88a8:b0:101:6409:ae26 with SMTP id m40-20020a05687088a800b001016409ae26mr2895502oam.160.1656532595027;
        Wed, 29 Jun 2022 12:56:35 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id o31-20020a056870911f00b000f5e33aaa66sm11573057oae.0.2022.06.29.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:56:34 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] hantro: Fix RK3399 H.264 format advertising
Date:   Wed, 29 Jun 2022 16:56:23 -0300
Message-Id: <20220629195624.45745-1-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 1f82f2df523cb ("media: hantro: Enable H.264 on Rockchip VDPU2")
enabled H.264 on some SoCs with VDPU2 cores. This had the side-effect
of exposing H.264 coded format as supported on RK3399.

Fix this and clarify how the codec is explicitly disabled on RK399 on
this driver.

Fixes: 1f82f2df523cb ("media: hantro: Enable H.264 on Rockchip VDPU2")
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 .../staging/media/hantro/rockchip_vpu_hw.c    | 60 ++++++++++++++++---
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index 098486b9ec27..26e16b5a6a70 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -182,7 +182,7 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 	},
 };
 
-static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
+static const struct hantro_fmt rockchip_vdpu2_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
@@ -236,6 +236,47 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
 static irqreturn_t rockchip_vpu1_vepu_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
@@ -548,8 +589,8 @@ const struct hantro_variant rk3288_vpu_variant = {
 
 const struct hantro_variant rk3328_vpu_variant = {
 	.dec_offset = 0x400,
-	.dec_fmts = rk3399_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
+	.dec_fmts = rockchip_vdpu2_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
 	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
 		 HANTRO_H264_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
@@ -560,6 +601,11 @@ const struct hantro_variant rk3328_vpu_variant = {
 	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names),
 };
 
+/*
+ * H.264 decoding explicitly disabled in RK3399.
+ * This ensures userspace applications use the Rockchip VDEC core,
+ * which has better performance.
+ */
 const struct hantro_variant rk3399_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rockchip_vpu_enc_fmts,
@@ -579,8 +625,8 @@ const struct hantro_variant rk3399_vpu_variant = {
 
 const struct hantro_variant rk3568_vpu_variant = {
 	.dec_offset = 0x400,
-	.dec_fmts = rk3399_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
+	.dec_fmts = rockchip_vdpu2_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
 	.codec = HANTRO_MPEG2_DECODER |
 		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
@@ -596,8 +642,8 @@ const struct hantro_variant px30_vpu_variant = {
 	.enc_fmts = rockchip_vpu_enc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
 	.dec_offset = 0x400,
-	.dec_fmts = rk3399_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
+	.dec_fmts = rockchip_vdpu2_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
 		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
-- 
2.31.1

