Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF78D6FC9C9
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 17:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236018AbjEIPDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 11:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235824AbjEIPDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 11:03:07 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DCC210E
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 08:03:03 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f315712406so212852915e9.0
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason.is; s=google; t=1683644582; x=1686236582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiiCFHEosqMsCxH4XI80X8lEQ3JLMfR1TMA28RRGwNE=;
        b=Vq31+bD8BmUMKDR2yIRO+WwAKTomtKCl8AFDzULseMjyEc0Z62L3dSqL0a/wPZmDUB
         JGRvYzFVcTKEzt2O/ZBlDKc6gQuBmKipuV9QnpZiO+yi0z3URYwcc+0EBuMv/q5u547X
         98c3NRtivO5Y6/T/H5notMvmWkKWV+1JzTbp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644582; x=1686236582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiiCFHEosqMsCxH4XI80X8lEQ3JLMfR1TMA28RRGwNE=;
        b=hLDzFDt1G8P+CnHpieQzu3Jdu38kR+zHWSeKyL5wpYE2TnkL5DZLWynd2pcVd1cORO
         ie4vt7ZsoCD7ZQg4fi2sS2q4gfTGyy39aRhJR3vO5xmkPvs84lQQLtxnFqJz1nsy9hRo
         soJz4lu4NTeJXZxNu1u7JbU8HwooLNcP0IfC88EEBrQZhZLyFzN0j6SlmBbW5UAqk/d8
         uaGqnShP8Ymsw9HU6/nfp3Gt4Xv/XVvXVpNXW/+L8zHqbVlGpdrxQT618+mlvBeROAzg
         fWthIQcssrMCZYU0SBPbNdIzo2hKmn3KTl/kNuT10RH20OSFvCNxevqoLa5rnK4S/+ju
         +8Ug==
X-Gm-Message-State: AC+VfDw7pZ6FnRTV4B8wDFiAiyQhYbOeqM6JaP8JaFHUMdGDpGlEGITv
        yDmwBJbSo3qcMgafi71lGi0SwA==
X-Google-Smtp-Source: ACHHUZ4gjz4q+PyY6d+zetOBkLBeMQVa9bwTVYN5JzodVoQDnsveCJ/cK4ILy5y5ZL3eTDfWh0fF3A==
X-Received: by 2002:adf:db01:0:b0:307:9d14:eeee with SMTP id s1-20020adfdb01000000b003079d14eeeemr3587019wri.3.1683644580856;
        Tue, 09 May 2023 08:03:00 -0700 (PDT)
Received: from andri-workstation.turninn.appdynamic.com ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d400a000000b00307a3045d65sm2588373wrp.46.2023.05.09.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:03:00 -0700 (PDT)
From:   Andri Yngvason <andri@yngvason.is>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Andri Yngvason <andri@yngvason.is>
Subject: [PATCH 1/2] media: verisilicon: rockchip_vpu2_hw_jpeg_enc: Consolidate setting of source buffer addresses
Date:   Tue,  9 May 2023 15:02:48 +0000
Message-Id: <20230509150249.824440-1-andri@yngvason.is>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Andri Yngvason <andri@yngvason.is>
---
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c   | 36 ++++++++++---------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
index 8395c4d48dd0..52c76fb91c56 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
@@ -32,6 +32,16 @@
 
 #define VEPU_JPEG_QUANT_TABLE_COUNT 16
 
+static inline u32 __vepu_reg_addr_for_plane(int plane)
+{
+	switch (plane) {
+	case 0: return VEPU_REG_ADDR_IN_PLANE_0;
+	case 1: return VEPU_REG_ADDR_IN_PLANE_1;
+	case 2: return VEPU_REG_ADDR_IN_PLANE_2;
+	}
+	return 0;
+}
+
 static void rockchip_vpu2_set_src_img_ctrl(struct hantro_dev *vpu,
 					   struct hantro_ctx *ctx)
 {
@@ -70,35 +80,27 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(struct hantro_dev *vpu,
 					       struct vb2_buffer *dst_buf)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
-	dma_addr_t src[3];
+	unsigned int num_planes = pix_fmt->num_planes;
+	unsigned int i;
+	dma_addr_t src;
 	u32 size_left;
 
 	size_left = vb2_plane_size(dst_buf, 0) - ctx->vpu_dst_fmt->header_size;
 	if (WARN_ON(vb2_plane_size(dst_buf, 0) < ctx->vpu_dst_fmt->header_size))
 		size_left = 0;
 
-	WARN_ON(pix_fmt->num_planes > 3);
+	WARN_ON(num_planes > 3);
+	if (num_planes > 3)
+		num_planes = 3;
 
 	vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
 				ctx->vpu_dst_fmt->header_size,
 			   VEPU_REG_ADDR_OUTPUT_STREAM);
 	vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
 
-	if (pix_fmt->num_planes == 1) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
-	} else if (pix_fmt->num_planes == 2) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
-		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
-		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
-	} else {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
-		src[2] = vb2_dma_contig_plane_dma_addr(src_buf, 2);
-		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
-		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
-		vepu_write_relaxed(vpu, src[2], VEPU_REG_ADDR_IN_PLANE_2);
+	for (i = 0; i < num_planes; i++) {
+		src = vb2_dma_contig_plane_dma_addr(src_buf, i);
+		vepu_write_relaxed(vpu, src, __vepu_reg_addr_for_plane(i));
 	}
 }
 
-- 
2.40.1

