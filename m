Return-Path: <linux-media+bounces-21030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E189BFF50
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F9721C21589
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 07:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CED19645D;
	Thu,  7 Nov 2024 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gmfxSgtu"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C90199FA2;
	Thu,  7 Nov 2024 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965579; cv=none; b=ckApOUKKndFtLKGeG2TbwPX32HPYYCnTDrYqa2JYCLOeF6YznrRRAxA/9tIAS2mhWPMt2fX8fAytHUF7uJCTBru4BFR7gm7+nJ1K6YVWGlxNJn5dE2UHF2wky8YmiaZXgG8UzDFNiW2x4AhQt+8n2HsdSUK1A5nfTl5nuPrYVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965579; c=relaxed/simple;
	bh=9T7TJTUXqL56/VI1b4zQ8JXyy61Zsd7M5F+8j4KRXzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFSM6ODHD5TlyeuN9cYfskSL3Nf3HTSMQqPuBWXlgBTcD1+Ih0uk8SfvfFK0YomHuu9SdjdB3MV2HLWboUv+wjeNMpvYke83pnOH3VZkiydhm1L0cSCV5HPAuqn6fD52Qwr2O9pDEGU2enfFLFTWyVsDec+qGCzyLcR022+9xi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gmfxSgtu; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 593ae6c09cdc11efb88477ffae1fc7a5-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zlyfRqlngzlniW7G/7ypX4cMgZvFroKhG7FazCPse8Y=;
	b=gmfxSgtuZ/DhMZbE+SIaq3zelffqXQIKhlrsHuoSInXL96UZDqt9XuXfEk4LtPsD/onWnW6CYbm1LrQEfNjvSyVyQVi/opvn/ZBH3/vttPu4iWg80YQJK1hxfYFg7xzrJVRFKKu6AhCpDMnXv8zifw50WXI3xgOECbVhqJD/3kQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:0761227e-f27e-48d9-bfa0-4206cbe82153,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:018cb206-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 593ae6c09cdc11efb88477ffae1fc7a5-20241107
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 974510320; Thu, 07 Nov 2024 15:46:07 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 15:46:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Nov 2024 15:46:05 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 2/3] media: mediatek: vcodec: support extended h264 decode
Date: Thu, 7 Nov 2024 15:45:56 +0800
Message-ID: <20241107074603.31998-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107074603.31998-1-yunfei.dong@mediatek.com>
References: <20241107074603.31998-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The address end of working buffer can't be calculated directly with buffer
size in kernel for some special architecture. Adding new extend vsi_ex to
calculate the address end in firmware.
Adding capability to separate extend and non extend driver for different
platform.
At last, hardware can parse the syntax to get nal information in firmware
for extend architecture, needn't to parse it again in kernel.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 487 +++++++++++++++++-
 2 files changed, 472 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 886fa385e2e6..1e697bc810b0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -17,6 +17,7 @@
 
 #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
+#define IS_VDEC_SUPPORT_EX(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EX)
 
 enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_INVAL = 0,
@@ -42,6 +43,7 @@ enum mtk_vdec_format_types {
 	MTK_VDEC_FORMAT_HEVC_FRAME = 0x1000,
 	MTK_VCODEC_INNER_RACING = 0x20000,
 	MTK_VDEC_IS_SUPPORT_10BIT = 0x40000,
+	MTK_VDEC_IS_SUPPORT_EX = 0x80000,
 };
 
 /*
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 851a8490b828..d0aecd9621d9 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -128,6 +128,83 @@ struct vdec_h264_slice_share_info {
 	u16 nal_info;
 };
 
+/*
+ * struct vdec_h264_slice_mem - memory address and size (shared interface with firmware)
+ */
+struct vdec_h264_slice_mem {
+	union {
+		u64 buf;
+		u64 dma_addr;
+	};
+	union {
+		size_t size;
+		u64 dma_addr_end;
+	};
+};
+
+/**
+ * struct vdec_h264_slice_fb - frame buffer for decoding (shared interface with firmware)
+ *
+ * @y:  current y buffer address info
+ * @c:  current c buffer address info
+ */
+struct vdec_h264_slice_fb {
+	struct vdec_h264_slice_mem y;
+	struct vdec_h264_slice_mem c;
+};
+
+/**
+ * struct vdec_h264_slice_info_ex - extend decode information (shared interface with firmware)
+ *
+ * @wdma_end_addr_offset:	offset from buffer start
+ * @nal_info:		nal info of current picture
+ * @timeout:		Decode timeout: 1 timeout, 0 no timeout
+ * @reserved:		reserved
+ * @vdec_fb_va:	VDEC frame buffer struct virtual address
+ * @crc:		Used to check whether hardware's status is right
+ */
+struct vdec_h264_slice_info_ex {
+	u64 wdma_end_addr_offset;
+	u16 nal_info;
+	u16 timeout;
+	u32 reserved;
+	u64 vdec_fb_va;
+	u32 crc[8];
+};
+
+/**
+ * struct vdec_h264_slice_vsi_ex - extend shared memory for decode information exchange
+ *        between SCP and Host (shared interface with firmware).
+ *
+ * @bs:		input buffer info
+ * @fb:		current y/c buffer
+ *
+ * @ube:		ube buffer
+ * @trans:		transcoded buffer
+ * @row_info:		row info buffer
+ * @err_map:		err map buffer
+ * @slice_bc:		slice buffer
+ *
+ * @mv_buf_dma:	HW working motion vector buffer
+ * @dec:		decode information (AP-R, VPU-W)
+ * @h264_slice_params:	decode parameters for hw used
+ */
+struct vdec_h264_slice_vsi_ex {
+	/* LAT dec addr */
+	struct vdec_h264_slice_mem bs;
+	struct vdec_h264_slice_fb fb;
+
+	struct vdec_h264_slice_mem ube;
+	struct vdec_h264_slice_mem trans;
+	struct vdec_h264_slice_mem row_info;
+	struct vdec_h264_slice_mem err_map;
+	struct vdec_h264_slice_mem slice_bc;
+
+	struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
+	struct vdec_h264_slice_info_ex dec;
+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
+};
+
 /**
  * struct vdec_h264_slice_inst - h264 decoder instance
  *
@@ -136,10 +213,10 @@ struct vdec_h264_slice_share_info {
  * @pred_buf:		HW working prediction buffer
  * @mv_buf:		HW working motion vector buffer
  * @vpu:		VPU instance
- * @vsi:		vsi used for lat
- * @vsi_core:		vsi used for core
+ * @vsi_ex:		extend vsi used for lat
+ * @vsi_core_ex:	extend vsi used for core
  *
- * @vsi_ctx:		Local VSI data for this decoding context
+ * @vsi_ctx_ex:	Local extend vsi data for this decoding context
  * @h264_slice_param:	the parameters that hardware use to decode
  *
  * @resolution_changed:resolution changed
@@ -156,10 +233,16 @@ struct vdec_h264_slice_inst {
 	struct mtk_vcodec_mem pred_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
 	struct vdec_vpu_inst vpu;
-	struct vdec_h264_slice_vsi *vsi;
-	struct vdec_h264_slice_vsi *vsi_core;
-
-	struct vdec_h264_slice_vsi vsi_ctx;
+	union {
+		struct vdec_h264_slice_vsi *vsi;
+		struct vdec_h264_slice_vsi *vsi_core;
+		struct vdec_h264_slice_vsi vsi_ctx;
+	};
+	union {
+		struct vdec_h264_slice_vsi_ex *vsi_ex;
+		struct vdec_h264_slice_vsi_ex *vsi_core_ex;
+		struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
+	};
 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
 
 	unsigned int resolution_changed;
@@ -389,10 +472,103 @@ static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
 		       cr->left, cr->top, cr->width, cr->height);
 }
 
+static void vdec_h264_slice_setup_lat_buffer_ex(struct vdec_h264_slice_inst *inst,
+						struct mtk_vcodec_mem *bs,
+						struct vdec_lat_buf *lat_buf)
+{
+	struct mtk_vcodec_mem *mem;
+	int i;
+
+	inst->vsi_ex->bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ex->bs.size = bs->size;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_ex->mv_buf_dma[i].size = mem->size;
+	}
+	inst->vsi_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+
+	inst->vsi_ex->row_info.dma_addr = 0;
+	inst->vsi_ex->row_info.size = 0;
+
+	inst->vsi_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_ex->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi_ex->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi_ex->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
+}
+
+static int vdec_h264_slice_setup_core_buffer_ex(struct vdec_h264_slice_inst *inst,
+						struct vdec_h264_slice_share_info *share_info,
+						struct vdec_lat_buf *lat_buf)
+{
+	struct mtk_vcodec_mem *mem;
+	struct mtk_vcodec_dec_ctx *ctx = inst->ctx;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vdec_fb *fb;
+	u64 y_fb_dma, c_fb_dma = 0;
+	int i;
+
+	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
+	if (!fb) {
+		mtk_vdec_err(ctx, "fb buffer is NULL");
+		return -EBUSY;
+	}
+
+	y_fb_dma = (u64)fb->base_y.dma_addr;
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+		c_fb_dma =
+			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+	else
+		c_fb_dma = (u64)fb->base_c.dma_addr;
+
+	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
+
+	inst->vsi_core_ex->fb.y.dma_addr = y_fb_dma;
+	inst->vsi_core_ex->fb.y.size = ctx->picinfo.fb_sz[0];
+	inst->vsi_core_ex->fb.c.dma_addr = c_fb_dma;
+	inst->vsi_core_ex->fb.c.size = ctx->picinfo.fb_sz[1];
+
+	inst->vsi_core_ex->dec.vdec_fb_va = (unsigned long)fb;
+	inst->vsi_core_ex->dec.nal_info = share_info->nal_info;
+
+	inst->vsi_core_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+
+	inst->vsi_core_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core_ex->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi_core_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi_core_ex->row_info.dma_addr = 0;
+	inst->vsi_core_ex->row_info.size = 0;
+
+	inst->vsi_core_ex->trans.dma_addr = share_info->trans_start;
+	inst->vsi_core_ex->trans.dma_addr_end = share_info->trans_end;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_core_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_core_ex->mv_buf_dma[i].size = mem->size;
+	}
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
+
+	return 0;
+}
+
 static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_h264_slice_inst *inst;
 	int err, vsi_size;
+	unsigned char *temp;
 
 	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
 	if (!inst)
@@ -412,10 +588,21 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_free_inst;
 	}
 
-	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi), VCODEC_DEC_ALIGNED_64);
-	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (IS_VDEC_SUPPORT_EX(ctx->dev->dec_capability)) {
+		vsi_size = sizeof(struct vdec_h264_slice_vsi_ex);
+
+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
+		inst->vsi_ex = inst->vpu.vsi;
+		temp = (unsigned char *)inst->vsi_ex;
+		inst->vsi_core_ex = (struct vdec_h264_slice_vsi_ex *)(temp + vsi_size);
+	} else {
+		vsi_size = sizeof(struct vdec_h264_slice_vsi);
+
+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
+		inst->vsi = inst->vpu.vsi;
+		temp = (unsigned char *)inst->vsi;
+		inst->vsi_core = (struct vdec_h264_slice_vsi *)(temp + vsi_size);
+	}
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
 
@@ -447,6 +634,53 @@ static void vdec_h264_slice_deinit(void *h_vdec)
 	kfree(inst);
 }
 
+static int vdec_h264_slice_core_decode_ex(struct vdec_lat_buf *lat_buf)
+{
+	int err, timeout;
+	struct mtk_vcodec_dec_ctx *ctx = lat_buf->ctx;
+	struct vdec_h264_slice_inst *inst = ctx->drv_handle;
+	struct vdec_h264_slice_share_info *share_info = lat_buf->private_data;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+
+	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
+	memcpy(&inst->vsi_core_ex->h264_slice_params, &share_info->h264_slice_params,
+	       sizeof(share_info->h264_slice_params));
+
+	err = vdec_h264_slice_setup_core_buffer_ex(inst, share_info, lat_buf);
+	if (err)
+		goto vdec_dec_end;
+
+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core_ex->h264_slice_params,
+					    share_info);
+	err = vpu_dec_core(vpu);
+	if (err) {
+		mtk_vdec_err(ctx, "core decode err=%d", err);
+		goto vdec_dec_end;
+	}
+
+	/* wait decoder done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	if (timeout)
+		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
+	inst->vsi_core_ex->dec.timeout = !!timeout;
+
+	vpu_dec_core_end(vpu);
+	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       ctx->decoded_frame_cnt,
+		       inst->vsi_core_ex->dec.crc[0], inst->vsi_core_ex->dec.crc[1],
+		       inst->vsi_core_ex->dec.crc[2], inst->vsi_core_ex->dec.crc[3],
+		       inst->vsi_core_ex->dec.crc[4], inst->vsi_core_ex->dec.crc[5],
+		       inst->vsi_core_ex->dec.crc[6], inst->vsi_core_ex->dec.crc[7]);
+
+vdec_dec_end:
+	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_src);
+	mtk_vdec_debug(ctx, "core decode done err=%d", err);
+	ctx->decoded_frame_cnt++;
+	return 0;
+}
+
 static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 {
 	struct vdec_fb *fb;
@@ -559,6 +793,127 @@ static void vdec_h264_insert_startcode(struct mtk_vcodec_dec_dev *vcodec_dev, un
 	(*bs_size) += 4;
 }
 
+static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs,
+					 struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info;
+	int err, timeout = 0;
+	unsigned int data[2];
+	struct vdec_lat_buf *lat_buf;
+	struct vdec_h264_slice_share_info *share_info;
+
+	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
+				vdec_h264_slice_core_decode_ex,
+				sizeof(*share_info)))
+		return -ENOMEM;
+
+	/* bs NULL means flush decoder */
+	if (!bs) {
+		vdec_msg_queue_wait_lat_buf_full(&inst->ctx->msg_queue);
+		return vpu_dec_reset(vpu);
+	}
+
+	if (inst->is_field_bitstream)
+		return -EINVAL;
+
+	lat_buf = vdec_msg_queue_dqbuf(&inst->ctx->msg_queue.lat_ctx);
+	if (!lat_buf) {
+		mtk_vdec_debug(inst->ctx, "failed to get lat buffer");
+		return -EAGAIN;
+	}
+	share_info = lat_buf->private_data;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
+
+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
+						     &inst->vsi_ex->h264_slice_params);
+	if (err)
+		goto err_free_fb_out;
+
+	vdec_h264_insert_startcode(inst->ctx->dev, bs->va, &bs->size,
+				   &share_info->h264_slice_params.pps);
+
+	*res_chg = inst->resolution_changed;
+	if (inst->resolution_changed) {
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
+		if (inst->realloc_mv_buf) {
+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
+			inst->realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		inst->resolution_changed = false;
+	}
+
+	vdec_h264_slice_setup_lat_buffer_ex(inst, bs, lat_buf);
+	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
+		       inst->vsi_ex->ube.dma_addr, (unsigned long)inst->vsi_ex->ube.size,
+		       inst->vsi_ex->err_map.dma_addr);
+
+	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%llx))",
+		       inst->vsi_ex->slice_bc.dma_addr, (unsigned long)inst->vsi_ex->slice_bc.size,
+		       inst->vsi_ex->trans.dma_addr, inst->vsi_ex->trans.dma_addr_end);
+
+	err = vpu_dec_start(vpu, data, 2);
+	if (err) {
+		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
+		goto err_free_fb_out;
+	}
+
+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+		inst->vsi_ex->dec.wdma_end_addr_offset;
+
+	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
+	share_info->nal_info = inst->vsi_ex->dec.nal_info;
+
+	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
+	}
+
+	/* wait decoder done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+	if (timeout)
+		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
+	inst->vsi_ex->dec.timeout = !!timeout;
+
+	err = vpu_dec_end(vpu);
+	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
+		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
+			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
+		inst->slice_dec_num++;
+		mtk_vdec_err(inst->ctx, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
+		return -EINVAL;
+	}
+
+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+		inst->vsi_ex->dec.wdma_end_addr_offset;
+
+	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
+
+	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
+	}
+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
+		       inst->vsi_ex->dec.crc[0], inst->vsi_ex->dec.crc[1],
+		       inst->vsi_ex->dec.crc[2]);
+
+	inst->slice_dec_num++;
+	return 0;
+err_free_fb_out:
+	vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
+	mtk_vdec_err(inst->ctx, "slice dec number: %d err: %d", inst->slice_dec_num, err);
+	return err;
+}
+
 static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 				      struct vdec_fb *fb, bool *res_chg)
 {
@@ -704,18 +1059,17 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	return err;
 }
 
-static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-					 struct vdec_fb *unused, bool *res_chg)
+static int vdec_h264_slice_single_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs,
+					    struct vdec_fb *unused, bool *res_chg)
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
 	struct vdec_fb *fb;
-	unsigned char *buf;
 	unsigned int data[2], i;
 	u64 y_fb_dma, c_fb_dma;
 	struct mtk_vcodec_mem *mem;
-	int err, nal_start_idx;
+	int err;
 
 	/* bs NULL means flush decoder */
 	if (!bs)
@@ -735,6 +1089,96 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
 		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
 
+	inst->vsi_ctx_ex.bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx_ex.bs.size = bs->size;
+	inst->vsi_ctx_ex.fb.y.dma_addr = y_fb_dma;
+	inst->vsi_ctx_ex.fb.c.dma_addr = c_fb_dma;
+	inst->vsi_ctx_ex.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &dst_buf_info->m2m_buf.vb, true);
+	err = get_vdec_sig_decode_parameters(inst);
+	if (err)
+		goto err_free_fb_out;
+
+	memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx_ex.h264_slice_params));
+
+	*res_chg = inst->resolution_changed;
+	if (inst->resolution_changed) {
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
+		if (inst->realloc_mv_buf) {
+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
+			inst->realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		inst->resolution_changed = false;
+
+		for (i = 0; i < H264_MAX_MV_NUM; i++) {
+			mem = &inst->mv_buf[i];
+			inst->vsi_ctx_ex.mv_buf_dma[i].dma_addr = mem->dma_addr;
+		}
+	}
+
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx_ex, sizeof(inst->vsi_ctx_ex));
+	err = vpu_dec_start(vpu, data, 2);
+	if (err)
+		goto err_free_fb_out;
+
+	/* wait decoder done interrupt */
+	err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	if (err)
+		mtk_vdec_err(inst->ctx, "decode timeout: pic_%d", inst->ctx->decoded_frame_cnt);
+
+	inst->vsi_ex->dec.timeout = !!err;
+	err = vpu_dec_end(vpu);
+	if (err)
+		goto err_free_fb_out;
+
+	memcpy(&inst->vsi_ctx_ex, inst->vpu.vsi, sizeof(inst->vsi_ctx_ex));
+	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       inst->ctx->decoded_frame_cnt,
+		       inst->vsi_ctx_ex.dec.crc[0], inst->vsi_ctx_ex.dec.crc[1],
+		       inst->vsi_ctx_ex.dec.crc[2], inst->vsi_ctx_ex.dec.crc[3],
+		       inst->vsi_ctx_ex.dec.crc[4], inst->vsi_ctx_ex.dec.crc[5],
+		       inst->vsi_ctx_ex.dec.crc[6], inst->vsi_ctx_ex.dec.crc[7]);
+
+	inst->ctx->decoded_frame_cnt++;
+	return 0;
+
+err_free_fb_out:
+	mtk_vdec_err(inst->ctx, "dec frame number: %d err: %d", inst->ctx->decoded_frame_cnt, err);
+	return err;
+}
+
+static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+					 struct vdec_fb *unused, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
+	struct vdec_fb *fb;
+	unsigned char *buf;
+	unsigned int data[2], i;
+	u64 y_fb_dma, c_fb_dma;
+	struct mtk_vcodec_mem *mem;
+	int err, nal_start_idx;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vpu_dec_reset(vpu);
+
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
+	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
+		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
+
 	inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
 	inst->vsi_ctx.dec.bs_buf_size = bs->size;
 	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
@@ -816,8 +1260,17 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (!h_vdec)
 		return -EINVAL;
 
-	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
-		ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
+	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
+		if (IS_VDEC_SUPPORT_EX(inst->ctx->dev->dec_capability))
+			ret = vdec_h264_slice_single_decode_ex(h_vdec, bs, unused, res_chg);
+		else
+			ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
+
+		return ret;
+	}
+
+	if (IS_VDEC_SUPPORT_EX(inst->ctx->dev->dec_capability))
+		ret = vdec_h264_slice_lat_decode_ex(h_vdec, bs, unused, res_chg);
 	else
 		ret = vdec_h264_slice_lat_decode(h_vdec, bs, unused, res_chg);
 
-- 
2.46.0


