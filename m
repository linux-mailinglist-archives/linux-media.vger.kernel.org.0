Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3A239CE1A
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 10:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFFIZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 04:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbhFFIZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 04:25:43 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DADC061789;
        Sun,  6 Jun 2021 01:23:40 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id g20so21464896ejt.0;
        Sun, 06 Jun 2021 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckHIT+W+zFdzF0pdvXxvN2EcXoFnHIBls4vcXGLYoGY=;
        b=LU58Y66UQ9FitfV6F/zH772RT9rVk1M9TCGwX2oEhpI4rXAHoIw0OPVl4OJ1WTMY4n
         JDpht2Wjw+RwsgesIQObYGC5wk0NUhq/Pk+qnI6pkXG8GmaAnErP4fSR8IWx+d4ke2Ya
         HIQdgTN62PvP/mWxrvmbVuIHZ/qTzuADinlXKupdjLFwsg5SYAr//OUZtsKslDZcVTD6
         ytvHsN/vClD9RKVTqbTXCQbboJl3uopVYSHmoXJB8Bp9A/S4Q8/5pGWb02bt1C0AQ5Hd
         Jxrol1ybnNTP3LxpxJFndvn8Pf4uByKrbvQ5p0Lrn2fhvDWXVG7BXWwtdmk7WOrKomrK
         yy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckHIT+W+zFdzF0pdvXxvN2EcXoFnHIBls4vcXGLYoGY=;
        b=LfT8ULtuOCJgHkSm7JXLg3HM7kg4ZRT8f0XJimwFUapjiJGPGkW+AqOkyp5ZLetgMf
         iluHbXAwZmgNt89B+hXrEkHFxuSkhKJBBVLfXqYH3TeTwVdLkmPnCDM5VWf5fc+9Jj1Z
         Yol5sXGVOllNT81lDVFO2ur7xd2KUy6+lbK+8ubzzOxIn1eanh/2WIOBAHA2IKVm5AVY
         gF5n99bLHvZNp8wsi6YKkSGzHtCEkySCY0xRr9m+gPH9btrIgGMKtkqDRhfgq+8nfhFG
         ouekMq6rc0rNhvaL+AuzuRCgZHeeXmYmSzLw6oyqm1N5n9j317tss6sxeaPwSM73ZqqE
         3QOQ==
X-Gm-Message-State: AOAM531fHXlREPbYu/Zieg9/aX8L+6qRAMrhVvoliawly5/zz+i/yXDo
        DAPkwe/sgXQ8UGkJNmAlSu2x8kFB5X+Khw==
X-Google-Smtp-Source: ABdhPJw1X2nuGFVnO9OCSUzei4cPO5JAv5OhSvfeDHG7Se/qVMnOjKe9TTZzzbz7LUdrSmuRs9dL/g==
X-Received: by 2002:a17:906:2ec6:: with SMTP id s6mr12422415eji.65.1622967818617;
        Sun, 06 Jun 2021 01:23:38 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id y1sm4945908ejl.7.2021.06.06.01.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 01:23:38 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        benjamin.gaignard@collabora.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] media: cedrus: hevc: Add support for multiple slices
Date:   Sun,  6 Jun 2021 10:23:14 +0200
Message-Id: <20210606082314.454193-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210606082314.454193-1-jernej.skrabec@gmail.com>
References: <20210606082314.454193-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that segment address is available, support for multi-slice frames
can be easily added.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 26 ++++++++++++-------
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 6821e3d05d34..ef0311a16d01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -247,6 +247,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	const struct v4l2_ctrl_hevc_slice_params *slice_params;
 	const struct v4l2_ctrl_hevc_decode_params *decode_params;
 	const struct v4l2_hevc_pred_weight_table *pred_weight_table;
+	unsigned int width_in_ctb_luma, ctb_size_luma;
+	unsigned int log2_max_luma_coding_block_size;
 	dma_addr_t src_buf_addr;
 	dma_addr_t src_buf_end_addr;
 	u32 chroma_log2_weight_denom;
@@ -260,15 +262,17 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	decode_params = run->h265.decode_params;
 	pred_weight_table = &slice_params->pred_weight_table;
 
+	log2_max_luma_coding_block_size =
+		sps->log2_min_luma_coding_block_size_minus3 + 3 +
+		sps->log2_diff_max_min_luma_coding_block_size;
+	ctb_size_luma = 1UL << log2_max_luma_coding_block_size;
+	width_in_ctb_luma =
+		DIV_ROUND_UP(sps->pic_width_in_luma_samples, ctb_size_luma);
+
 	/* MV column buffer size and allocation. */
 	if (!ctx->codec.h265.mv_col_buf_size) {
 		unsigned int num_buffers =
 			run->dst->vb2_buf.vb2_queue->num_buffers;
-		unsigned int log2_max_luma_coding_block_size =
-			sps->log2_min_luma_coding_block_size_minus3 + 3 +
-			sps->log2_diff_max_min_luma_coding_block_size;
-		unsigned int ctb_size_luma =
-			1UL << log2_max_luma_coding_block_size;
 
 		/*
 		 * Each CTB requires a MV col buffer with a specific unit size.
@@ -322,15 +326,17 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	reg = VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_end_addr);
 	cedrus_write(dev, VE_DEC_H265_BITS_END_ADDR, reg);
 
-	/* Coding tree block address: start at the beginning. */
-	reg = VE_DEC_H265_DEC_CTB_ADDR_X(0) | VE_DEC_H265_DEC_CTB_ADDR_Y(0);
+	/* Coding tree block address */
+	reg = VE_DEC_H265_DEC_CTB_ADDR_X(slice_params->slice_segment_addr % width_in_ctb_luma);
+	reg |= VE_DEC_H265_DEC_CTB_ADDR_Y(slice_params->slice_segment_addr / width_in_ctb_luma);
 	cedrus_write(dev, VE_DEC_H265_DEC_CTB_ADDR, reg);
 
 	cedrus_write(dev, VE_DEC_H265_TILE_START_CTB, 0);
 	cedrus_write(dev, VE_DEC_H265_TILE_END_CTB, 0);
 
 	/* Clear the number of correctly-decoded coding tree blocks. */
-	cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
+	if (ctx->fh.m2m_ctx->new_frame)
+		cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
 
 	/* Initialize bitstream access. */
 	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_INIT_SWDEC);
@@ -482,8 +488,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT,
 				slice_params->flags);
 
-	/* FIXME: For multi-slice support. */
-	reg |= VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PIC;
+	if (ctx->fh.m2m_ctx->new_frame)
+		reg |= VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PIC;
 
 	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO0, reg);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 9ddd789d0b1f..247ff90a26b9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -340,6 +340,7 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
 
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_HEVC_SLICE:
 		vq->subsystem_flags |=
 			VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 		break;
-- 
2.31.1

