Return-Path: <linux-media+bounces-232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FD7E9C2F
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 043941C2094C
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642251D6A7;
	Mon, 13 Nov 2023 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k0qkCsag"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B21F1D533
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:32:18 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC25173C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:15 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc316ccc38so31654615ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878735; x=1700483535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l9/1j9sjZZ2BXUTB8Pi8Ur9IwYgx7ZdJLqIWsrQ8y4=;
        b=k0qkCsagaO0vSOzqQtVzUVi2j7EJUkQou2cS1seNLy1Fa1kWHjiHPwVRQ0HaLT+0Eo
         K8IMyS6OOKV6Bf3g5j9DGJTMwZ8ULN38B4NDXbL79FGbND22y61LJmHUBqCsbx+h+7aN
         eWnWO7XK4GbY76O4yZOOto2jxNl2yQCuxs3oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878735; x=1700483535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1l9/1j9sjZZ2BXUTB8Pi8Ur9IwYgx7ZdJLqIWsrQ8y4=;
        b=on1L8TMPrwJ1FJkCrF4Vs2Clbp+aVvH27LwaS90HWSP9AlSyba+MKN+cZdu5Tnk8Ec
         9CIpGC8wQPCLc1C87Qvo0hzjHb+yhi/e09Y+ABb7aYZzpakX1i2t82mNVqDGWkQX2/i7
         OEPPl/LI5MTpxNy0MTkPsxghVZsWd7AQTe1IKxAvZu880b3WAA2BNsPFFPjpOQfmblr3
         vhvNh6hazLJCvKStl5bmT5wEAKt4nF1fEEgQT3ZoSf68rB3BbCqSNBncgRnNoqbQWrKG
         Dwr2xefImGlYMqPm5+8zqCfDOPNk3EOhaFSQUbayIGJ8lVYxWJnwVSKK8Ty9rGnI53H4
         SL2w==
X-Gm-Message-State: AOJu0YwaYr4N8Q7AorYF14SkCznhq0zo2prIhzE3IRQngx3L986v2vBr
	QvsvaLEvJX1R7m9C64l/w5lWsw==
X-Google-Smtp-Source: AGHT+IEMPEPVTROVC7v3ad0FBJLxgc1+VDI9tFXkhh0wJtVxrutbFHZkxOsjApHYbaQhth4nsfx9lw==
X-Received: by 2002:a17:902:e801:b0:1cc:25b7:e30d with SMTP id u1-20020a170902e80100b001cc25b7e30dmr4771233plg.60.1699878735055;
        Mon, 13 Nov 2023 04:32:15 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:14 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Irui Wang <irui.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/4] media: mediatek: vcodec: Drop VA check against mtk_vcodec_mem_free()
Date: Mon, 13 Nov 2023 20:26:52 +0800
Message-ID: <20231113123049.4117280-5-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231113123049.4117280-1-fshao@chromium.org>
References: <20231113123049.4117280-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now mtk_vcodec_mem_free() handles the VA-is-NULL case without generating
excess error log, so we don't need to check that every time before using
it in the driver.

Remove all the unnecessary if branches against mtk_vcodec_mem_free().

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 18 ++++--------
 .../vcodec/decoder/vdec/vdec_h264_if.c        |  9 ++----
 .../vcodec/decoder/vdec/vdec_h264_req_if.c    |  9 ++----
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  6 ++--
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  9 ++----
 .../vcodec/decoder/vdec/vdec_vp8_if.c         |  4 +--
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     | 12 +++-----
 .../vcodec/decoder/vdec/vdec_vp9_if.c         | 15 ++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 29 +++++++------------
 .../mediatek/vcodec/decoder/vdec_msg_queue.c  | 15 ++++------
 10 files changed, 43 insertions(+), 83 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2b6a5adbc419..cd3a85cd4a98 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -783,8 +783,7 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
 
 	mtk_vdec_debug(ctx, "map cdf table to 0x%p\n", remote_cdf_table);
 
-	if (instance->cdf_table.va)
-		mtk_vcodec_mem_free(ctx, &instance->cdf_table);
+	mtk_vcodec_mem_free(ctx, &instance->cdf_table);
 	instance->cdf_table.size = vsi->cdf_table_size;
 
 	ret = mtk_vcodec_mem_alloc(ctx, &instance->cdf_table);
@@ -814,8 +813,7 @@ static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance
 
 	mtk_vdec_debug(ctx, "map iq table to 0x%p\n", remote_iq_table);
 
-	if (instance->iq_table.va)
-		mtk_vcodec_mem_free(ctx, &instance->iq_table);
+	mtk_vcodec_mem_free(ctx, &instance->iq_table);
 	instance->iq_table.size = vsi->iq_table_size;
 
 	ret = mtk_vcodec_mem_alloc(ctx, &instance->iq_table);
@@ -970,22 +968,19 @@ static int vdec_av1_slice_alloc_working_buffer(struct vdec_av1_slice_instance *i
 	max_sb_h = DIV_ROUND_UP(max_h, 128);
 
 	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
-		if (instance->mv[i].va)
-			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
+		mtk_vcodec_mem_free(ctx, &instance->mv[i]);
 		instance->mv[i].size = max_sb_w * max_sb_h * SZ_1K;
 		ret = mtk_vcodec_mem_alloc(ctx, &instance->mv[i]);
 		if (ret)
 			goto err;
 
-		if (instance->seg[i].va)
-			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
+		mtk_vcodec_mem_free(ctx, &instance->seg[i]);
 		instance->seg[i].size = max_sb_w * max_sb_h * 512;
 		ret = mtk_vcodec_mem_alloc(ctx, &instance->seg[i]);
 		if (ret)
 			goto err;
 
-		if (instance->cdf[i].va)
-			mtk_vcodec_mem_free(ctx, &instance->cdf[i]);
+		mtk_vcodec_mem_free(ctx, &instance->cdf[i]);
 		instance->cdf[i].size = AV1_CDF_TABLE_BUFFER_SIZE;
 		ret = mtk_vcodec_mem_alloc(ctx, &instance->cdf[i]);
 		if (ret)
@@ -1001,8 +996,7 @@ static int vdec_av1_slice_alloc_working_buffer(struct vdec_av1_slice_instance *i
 		vsi->cdf_tmp.size = instance->cdf_temp.size;
 	}
 
-	if (instance->tile.va)
-		mtk_vcodec_mem_free(ctx, &instance->tile);
+	mtk_vcodec_mem_free(ctx, &instance->tile);
 
 	instance->tile.size = AV1_TILE_BUF_SIZE * V4L2_AV1_MAX_TILE_COUNT;
 	ret = mtk_vcodec_mem_alloc(ctx, &instance->tile);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c
index bf7dffe60d07..16f8fd407e09 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c
@@ -157,8 +157,7 @@ static void free_predication_buf(struct vdec_h264_inst *inst)
 
 	inst->vsi->pred_buf_dma = 0;
 	mem = &inst->pred_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 }
 
 static int alloc_mv_buf(struct vdec_h264_inst *inst, struct vdec_pic_info *pic)
@@ -170,8 +169,7 @@ static int alloc_mv_buf(struct vdec_h264_inst *inst, struct vdec_pic_info *pic)
 
 	for (i = 0; i < H264_MAX_FB_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
@@ -192,8 +190,7 @@ static void free_mv_buf(struct vdec_h264_inst *inst)
 	for (i = 0; i < H264_MAX_FB_NUM; i++) {
 		inst->vsi->mv_buf_dma[i] = 0;
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
index 5600f1df653d..6793fcc0fcc8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
@@ -174,8 +174,7 @@ static void free_predication_buf(struct vdec_h264_slice_inst *inst)
 	struct mtk_vcodec_mem *mem = &inst->pred_buf;
 
 	inst->vsi_ctx.pred_buf_dma = 0;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 }
 
 static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
@@ -189,8 +188,7 @@ static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
 	mtk_v4l2_vdec_dbg(3, inst->ctx, "size = 0x%x", buf_sz);
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
@@ -211,8 +209,7 @@ static void free_mv_buf(struct vdec_h264_slice_inst *inst)
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		inst->vsi_ctx.mv_buf_dma[i] = 0;
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 0e741e0dc8ba..81d21ddf5ced 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -316,8 +316,7 @@ static int vdec_h264_slice_alloc_mv_buf(struct vdec_h264_slice_inst *inst,
 	mtk_v4l2_vdec_dbg(3, inst->ctx, "size = 0x%x", buf_sz);
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
@@ -336,8 +335,7 @@ static void vdec_h264_slice_free_mv_buf(struct vdec_h264_slice_inst *inst)
 
 	for (i = 0; i < H264_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index 06ed47df693b..17c07feedb56 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -651,8 +651,7 @@ static int vdec_hevc_slice_alloc_mv_buf(struct vdec_hevc_slice_inst *inst,
 	mtk_v4l2_vdec_dbg(3, inst->ctx, "allocate mv buffer size = 0x%x", buf_sz);
 	for (i = 0; i < HEVC_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
@@ -671,8 +670,7 @@ static void vdec_hevc_slice_free_mv_buf(struct vdec_hevc_slice_inst *inst)
 
 	for (i = 0; i < HEVC_MAX_MV_NUM; i++) {
 		mem = &inst->mv_buf[i];
-		if (mem->va)
-			mtk_vcodec_mem_free(inst->ctx, mem);
+		mtk_vcodec_mem_free(inst->ctx, mem);
 	}
 }
 
@@ -913,8 +911,7 @@ static void vdec_hevc_slice_deinit(void *h_vdec)
 	vdec_hevc_slice_free_mv_buf(inst);
 
 	mem = &inst->wrap_addr;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 
 	vdec_msg_queue_deinit(&inst->ctx->msg_queue, inst->ctx);
 	kfree(inst);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
index 19407f9bc773..7bcc3566371c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
@@ -379,9 +379,7 @@ static void free_working_buf(struct vdec_vp8_inst *inst)
 {
 	struct mtk_vcodec_mem *mem = &inst->working_buf;
 
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
-
+	mtk_vcodec_mem_free(inst->ctx, mem);
 	inst->vsi->dec.working_buf_dma = 0;
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index f64b21c07169..9a2710104a16 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -192,23 +192,19 @@ static void vdec_vp8_slice_free_working_buf(struct vdec_vp8_slice_inst *inst)
 	struct mtk_vcodec_mem *mem;
 
 	mem = &inst->seg_id_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 	inst->vsi->dec.seg_id_buf_dma = 0;
 
 	mem = &inst->wrap_y_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 	inst->vsi->dec.wrap_y_dma = 0;
 
 	mem = &inst->wrap_c_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 	inst->vsi->dec.wrap_c_dma = 0;
 
 	mem = &inst->vld_wrapper_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 	inst->vsi->dec.vld_wrapper_dma = 0;
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
index 55355fa70090..5def2d228fa3 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
@@ -387,8 +387,7 @@ static bool vp9_alloc_work_buf(struct vdec_vp9_inst *inst)
 		       vsi->pic_h, vsi->buf_w, vsi->buf_h);
 
 	mem = &inst->mv_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 
 	mem->size = ((vsi->buf_w / 64) *
 		    (vsi->buf_h / 64) + 2) * 36 * 16;
@@ -405,8 +404,7 @@ static bool vp9_alloc_work_buf(struct vdec_vp9_inst *inst)
 
 
 	mem = &inst->seg_id_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 
 	mem->size = VP9_SEG_ID_SZ;
 	result = mtk_vcodec_mem_alloc(inst->ctx, mem);
@@ -567,8 +565,7 @@ static void vp9_free_inst(struct vdec_vp9_inst *inst)
 	struct mtk_vcodec_mem mem;
 
 	mem = inst->mem;
-	if (mem.va)
-		mtk_vcodec_mem_free(inst->ctx, &mem);
+	mtk_vcodec_mem_free(inst->ctx, &mem);
 }
 
 static bool vp9_decode_end_proc(struct vdec_vp9_inst *inst)
@@ -761,12 +758,10 @@ static void vdec_vp9_deinit(void *h_vdec)
 		mtk_vdec_err(inst->ctx, "vpu_dec_deinit failed");
 
 	mem = &inst->mv_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 
 	mem = &inst->seg_id_buf;
-	if (mem->va)
-		mtk_vcodec_mem_free(inst->ctx, mem);
+	mtk_vcodec_mem_free(inst->ctx, mem);
 
 	vp9_free_all_sf_ref_fb(inst);
 	vp9_free_inst(inst);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index e393e3e668f8..b885730826fb 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -590,8 +590,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 
 	size = (max_sb_w * max_sb_h + 2) * 576;
 	for (i = 0; i < 2; i++) {
-		if (instance->mv[i].va)
-			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
+		mtk_vcodec_mem_free(ctx, &instance->mv[i]);
 		instance->mv[i].size = size;
 		if (mtk_vcodec_mem_alloc(ctx, &instance->mv[i]))
 			goto err;
@@ -599,8 +598,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 
 	size = (max_sb_w * max_sb_h * 32) + 256;
 	for (i = 0; i < 2; i++) {
-		if (instance->seg[i].va)
-			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
+		mtk_vcodec_mem_free(ctx, &instance->seg[i]);
 		instance->seg[i].size = size;
 		if (mtk_vcodec_mem_alloc(ctx, &instance->seg[i]))
 			goto err;
@@ -637,20 +635,15 @@ static void vdec_vp9_slice_free_working_buffer(struct vdec_vp9_slice_instance *i
 	struct mtk_vcodec_dec_ctx *ctx = instance->ctx;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(instance->mv); i++) {
-		if (instance->mv[i].va)
-			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
-	}
-	for (i = 0; i < ARRAY_SIZE(instance->seg); i++) {
-		if (instance->seg[i].va)
-			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
-	}
-	if (instance->tile.va)
-		mtk_vcodec_mem_free(ctx, &instance->tile);
-	if (instance->prob.va)
-		mtk_vcodec_mem_free(ctx, &instance->prob);
-	if (instance->counts.va)
-		mtk_vcodec_mem_free(ctx, &instance->counts);
+	for (i = 0; i < ARRAY_SIZE(instance->mv); i++)
+		mtk_vcodec_mem_free(ctx, &instance->mv[i]);
+
+	for (i = 0; i < ARRAY_SIZE(instance->seg); i++)
+		mtk_vcodec_mem_free(ctx, &instance->seg[i]);
+
+	mtk_vcodec_mem_free(ctx, &instance->tile);
+	mtk_vcodec_mem_free(ctx, &instance->prob);
+	mtk_vcodec_mem_free(ctx, &instance->counts);
 
 	instance->level = VP9_RES_NONE;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
index f283c4703dc6..7b426bb8b1de 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
@@ -206,26 +206,21 @@ void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
 	int i;
 
 	mem = &msg_queue->wdma_addr;
-	if (mem->va)
-		mtk_vcodec_mem_free(ctx, mem);
+	mtk_vcodec_mem_free(ctx, mem);
 	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
 		lat_buf = &msg_queue->lat_buf[i];
 
 		mem = &lat_buf->wdma_err_addr;
-		if (mem->va)
-			mtk_vcodec_mem_free(ctx, mem);
+		mtk_vcodec_mem_free(ctx, mem);
 
 		mem = &lat_buf->slice_bc_addr;
-		if (mem->va)
-			mtk_vcodec_mem_free(ctx, mem);
+		mtk_vcodec_mem_free(ctx, mem);
 
 		mem = &lat_buf->rd_mv_addr;
-		if (mem->va)
-			mtk_vcodec_mem_free(ctx, mem);
+		mtk_vcodec_mem_free(ctx, mem);
 
 		mem = &lat_buf->tile_addr;
-		if (mem->va)
-			mtk_vcodec_mem_free(ctx, mem);
+		mtk_vcodec_mem_free(ctx, mem);
 
 		kfree(lat_buf->private_data);
 		lat_buf->private_data = NULL;
-- 
2.42.0.869.gea05f2083d-goog


