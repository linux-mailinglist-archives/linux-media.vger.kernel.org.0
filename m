Return-Path: <linux-media+bounces-27857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7DA57914
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 09:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F2E17345D
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 08:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A04F1A5B99;
	Sat,  8 Mar 2025 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XjHLl0+Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C755617583;
	Sat,  8 Mar 2025 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741421000; cv=none; b=pRhd3h6UWMjk6HiWTxh/u7ysfXjQe+spZZtcOaq62jYSgekyNGo8dMxEcglwmju0bYG4BYscXFpPV1uqqYUtg/w1SnrOEaHKI4AipBwLVP1fDTvK4fWVlMHOgVdUNcQxTSEgisHnPrMadH+cDaRhkWESmyOpY4lv01OJh6a2ziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741421000; c=relaxed/simple;
	bh=S2VUT9kk/Yq87HaCPcJYMBJm6Kx4iuA7iI+gH06P+XU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VdqAiSe/8vYehkvjxyj9XGnSTy0G9+vqWdZcWZeZNl8zkT9Qd9GJT3UMQAFgyQVLFR5uAcRvPMvGnJ2vJByHoEDY1qneHr9BAbM0jicfxOTj6V/jy7gpc0xHINDQivB71F+hIJcBMwb0xN7UK8yeXmIgIHmYLuUrvN6jlk0sY5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=XjHLl0+Z; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ac740866fbf111efaae1fd9735fae912-20250308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oKZHkfMGHh0joDtzj2IeLaBB2/paommyDIsSHeUAM50=;
	b=XjHLl0+ZY1ZseKjX652oyRjQ8s5tHHRfdianvHl2LXYDeG7lcw2SfQD+IGbxAqwMS/RXsBZdCz7ol5/3kZhC4NYuR9CqvLXovH5Ima0MoFyW95hwwcjEKyva4h0v9sivxS7bmrQgxVv1cfztop9q7BJ37sHEUcr8IHLWSV6S8HE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b96db9e5-9e19-4c23-8285-f7f5692a4e6d,IP:0,UR
	L:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-50
X-CID-META: VersionHash:0ef645f,CLOUDID:20242dce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ac740866fbf111efaae1fd9735fae912-20250308
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1330225439; Sat, 08 Mar 2025 15:48:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Mar 2025 15:48:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Mar 2025 15:48:04 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 2/3] media: mediatek: vcodec: support extended h264 decode
Date: Sat, 8 Mar 2025 15:47:56 +0800
Message-ID: <20250308074802.18929-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250308074802.18929-1-yunfei.dong@mediatek.com>
References: <20250308074802.18929-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add a new extended vsi_ext struct besides the existing vsi struct, to
enable calculating the end of the address range of the current working
buffer for architectures, where simply adding the buffer size to the
start of the address range isn't sufficient.
Additionally, on extended architectures, the NAL information can be
fetched directly from the firmware, which allows skipping the parsing
step within the kernel.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 634 +++++++++++++++---
 2 files changed, 552 insertions(+), 84 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index ac568ed14fa2..aececca7ecf8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -17,6 +17,7 @@
 
 #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
+#define IS_VDEC_SUPPORT_EXT(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EXT)
 
 enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_INVAL = 0,
@@ -42,6 +43,7 @@ enum mtk_vdec_format_types {
 	MTK_VDEC_FORMAT_HEVC_FRAME = 0x1000,
 	MTK_VCODEC_INNER_RACING = 0x20000,
 	MTK_VDEC_IS_SUPPORT_10BIT = 0x40000,
+	MTK_VDEC_IS_SUPPORT_EXT = 0x80000,
 };
 
 /*
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index ab192ce0b851..13d14187e4f5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -74,21 +74,20 @@ struct vdec_h264_slice_info {
  * struct vdec_h264_slice_vsi - shared memory for decode information exchange
  *        between SCP and Host.
  *
- * @wdma_err_addr:		wdma error dma address
- * @wdma_start_addr:		wdma start dma address
- * @wdma_end_addr:		wdma end dma address
- * @slice_bc_start_addr:	slice bc start dma address
- * @slice_bc_end_addr:		slice bc end dma address
- * @row_info_start_addr:	row info start dma address
- * @row_info_end_addr:		row info end dma address
- * @trans_start:		trans start dma address
- * @trans_end:			trans end dma address
- * @wdma_end_addr_offset:	wdma end address offset
+ * @wdma_err_addr:        wdma error dma address
+ * @wdma_start_addr:      wdma start dma address
+ * @wdma_end_addr:        wdma end dma address
+ * @slice_bc_start_addr:  slice bc start dma address
+ * @slice_bc_end_addr:    slice bc end dma address
+ * @row_info_start_addr:  row info start dma address
+ * @row_info_end_addr:    row info end dma address
+ * @trans_start:          trans start dma address
+ * @trans_end:            trans end dma address
+ * @wdma_end_addr_offset: wdma end address offset
  *
- * @mv_buf_dma:		HW working motion vector buffer
- *				dma address (AP-W, VPU-R)
- * @dec:			decode information (AP-R, VPU-W)
- * @h264_slice_params:		decode parameters for hw used
+ * @mv_buf_dma:           HW working motion vector buffer
+ * @dec:                  decode information (AP-R, VPU-W)
+ * @h264_slice_params:    decode parameters for hw used
  */
 struct vdec_h264_slice_vsi {
 	/* LAT dec addr */
@@ -112,12 +111,12 @@ struct vdec_h264_slice_vsi {
  * struct vdec_h264_slice_share_info - shared information used to exchange
  *                                     message between lat and core
  *
- * @sps:		sequence header information from user space
- * @dec_params:	decoder params from user space
- * @h264_slice_params:	decoder params used for hardware
- * @trans_start:	trans start dma address
- * @trans_end:		trans end dma address
- * @nal_info:		nal info of current picture
+ * @sps:               sequence header information from user space
+ * @dec_params:        decoder params from user space
+ * @h264_slice_params: decoder params used for hardware
+ * @trans_start:       trans start dma address
+ * @trans_end:         trans end dma address
+ * @nal_info:          nal info of current picture
  */
 struct vdec_h264_slice_share_info {
 	struct v4l2_ctrl_h264_sps sps;
@@ -128,6 +127,86 @@ struct vdec_h264_slice_share_info {
 	u16 nal_info;
 };
 
+/*
+ * struct vdec_h264_slice_mem - memory address and size
+ *        (shared data between host and firmware)
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
+ * struct vdec_h264_slice_fb - frame buffer for decoding
+ *        (shared data between host and firmware)
+ *
+ * @y:  current luma buffer address info
+ * @c:  current chroma buffer address info
+ */
+struct vdec_h264_slice_fb {
+	struct vdec_h264_slice_mem y;
+	struct vdec_h264_slice_mem c;
+};
+
+/**
+ * struct vdec_h264_slice_info_ext - extend decode information
+ *        (shared data between host and firmware)
+ *
+ * @wdma_end_addr_offset: offset from buffer start
+ * @nal_info:             nal info of current picture
+ * @timeout:              toggles whether a decode operation is timeout
+ * @reserved:             reserved
+ * @vdec_fb_va:           vdec frame buffer struct virtual address
+ * @crc:                  displays the hardware status
+ */
+struct vdec_h264_slice_info_ext {
+	u64 wdma_end_addr_offset;
+	u16 nal_info;
+	u16 timeout;
+	u32 reserved;
+	u64 vdec_fb_va;
+	u32 crc[8];
+};
+
+/**
+ * struct vdec_h264_slice_vsi_ext - extend shared memory for decode information exchange
+ *        between SCP and Host (shared data between host and firmware).
+ *
+ * @bs:                input buffer info
+ * @fb:                current y/c buffer
+ *
+ * @ube:               buffer used to share date between lat and core
+ * @trans:             transcoded buffer used for core decode
+ * @row_info:          row info buffer
+ * @err_map:           error map buffer
+ * @slice_bc:          slice buffer
+ *
+ * @mv_buf_dma:        store hardware motion vector data
+ * @dec:               decode information (AP-R, VPU-W)
+ * @h264_slice_params: decode parameters used for the hw
+ */
+struct vdec_h264_slice_vsi_ext {
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
+	struct vdec_h264_slice_info_ext dec;
+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
+};
+
 /**
  * struct vdec_h264_slice_inst - h264 decoder instance
  *
@@ -138,17 +217,21 @@ struct vdec_h264_slice_share_info {
  * @vpu:		VPU instance
  * @vsi:		vsi used for lat
  * @vsi_core:		vsi used for core
- *
- * @vsi_ctx:		Local VSI data for this decoding context
+ * @vsi_ctx:		vsi data for this decoding context
+ * @vsi_ext:		extended vsi used for lat
+ * @vsi_core_ext:	extended vsi used for core
+ * @vsi_ctx_ext:	extended vsi data for this decoding context
  * @h264_slice_param:	the parameters that hardware use to decode
  *
- * @resolution_changed:resolution changed
+ * @resolution_changed: resolution changed
  * @realloc_mv_buf:	reallocate mv buffer
  * @cap_num_planes:	number of capture queue plane
  *
  * @dpb:		decoded picture buffer used to store reference
  *			buffer information
- *@is_field_bitstream:	is field bitstream
+ * @is_field_bitstream: not support field bitstream, only support frame
+ *
+ * @decode:		lat decoder pointer for different architectures
  */
 struct vdec_h264_slice_inst {
 	unsigned int slice_dec_num;
@@ -156,10 +239,18 @@ struct vdec_h264_slice_inst {
 	struct mtk_vcodec_mem pred_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
 	struct vdec_vpu_inst vpu;
-	struct vdec_h264_slice_vsi *vsi;
-	struct vdec_h264_slice_vsi *vsi_core;
-
-	struct vdec_h264_slice_vsi vsi_ctx;
+	union {
+		struct {
+			struct vdec_h264_slice_vsi *vsi;
+			struct vdec_h264_slice_vsi *vsi_core;
+			struct vdec_h264_slice_vsi vsi_ctx;
+		};
+		struct {
+			struct vdec_h264_slice_vsi_ext *vsi_ext;
+			struct vdec_h264_slice_vsi_ext *vsi_core_ext;
+			struct vdec_h264_slice_vsi_ext vsi_ctx_ext;
+		};
+	};
 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
 
 	unsigned int resolution_changed;
@@ -168,6 +259,9 @@ struct vdec_h264_slice_inst {
 
 	struct v4l2_h264_dpb_entry dpb[16];
 	bool is_field_bitstream;
+
+	int (*decode)(void *h_vdec, struct mtk_vcodec_mem *bs,
+		      struct vdec_fb *unused, bool *res_chg);
 };
 
 static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
@@ -389,68 +483,148 @@ static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
 		       cr->left, cr->top, cr->width, cr->height);
 }
 
-static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
+static void vdec_h264_slice_setup_lat_buffer_ext(struct vdec_h264_slice_inst *inst,
+						 struct mtk_vcodec_mem *bs,
+						 struct vdec_lat_buf *lat_buf)
 {
-	struct vdec_h264_slice_inst *inst;
-	int err, vsi_size;
+	struct mtk_vcodec_mem *mem;
+	int i;
 
-	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
-	if (!inst)
-		return -ENOMEM;
+	inst->vsi_ext->bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ext->bs.size = bs->size;
 
-	inst->ctx = ctx;
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_ext->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_ext->mv_buf_dma[i].size = mem->size;
+	}
+	inst->vsi_ext->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_ext->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
 
-	inst->vpu.id = SCP_IPI_VDEC_LAT;
-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
-	inst->vpu.ctx = ctx;
-	inst->vpu.codec_type = ctx->current_codec;
-	inst->vpu.capture_type = ctx->capture_fourcc;
+	inst->vsi_ext->row_info.dma_addr = 0;
+	inst->vsi_ext->row_info.size = 0;
 
-	err = vpu_dec_init(&inst->vpu);
-	if (err) {
-		mtk_vdec_err(ctx, "vdec_h264 init err=%d", err);
-		goto error_free_inst;
+	inst->vsi_ext->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_ext->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi_ext->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_ext->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi_ext->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi_ext->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
+}
+
+static int vdec_h264_slice_setup_core_buffer_ext(struct vdec_h264_slice_inst *inst,
+						 struct vdec_h264_slice_share_info *share_info,
+						 struct vdec_lat_buf *lat_buf)
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
+		mtk_vdec_err(ctx, "Unable to get a CAPTURE buffer for CAPTURE queue is empty.");
+		return -EBUSY;
 	}
 
-	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi), VCODEC_DEC_ALIGNED_64);
-	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
-	inst->resolution_changed = true;
-	inst->realloc_mv_buf = true;
+	y_fb_dma = (u64)fb->base_y.dma_addr;
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+		c_fb_dma = y_fb_dma + ctx->picinfo.fb_sz[0];
+	else
+		c_fb_dma = (u64)fb->base_c.dma_addr;
 
-	mtk_vdec_debug(ctx, "lat struct size = %d,%d,%d,%d vsi: %d\n",
-		       (int)sizeof(struct mtk_h264_sps_param),
-		       (int)sizeof(struct mtk_h264_pps_param),
-		       (int)sizeof(struct vdec_h264_slice_lat_dec_param),
-		       (int)sizeof(struct mtk_h264_dpb_info),
-		       vsi_size);
-	mtk_vdec_debug(ctx, "lat H264 instance >> %p, codec_type = 0x%x",
-		       inst, inst->vpu.codec_type);
+	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
 
-	ctx->drv_handle = inst;
-	return 0;
+	inst->vsi_core_ext->fb.y.dma_addr = y_fb_dma;
+	inst->vsi_core_ext->fb.y.size = ctx->picinfo.fb_sz[0];
+	inst->vsi_core_ext->fb.c.dma_addr = c_fb_dma;
+	inst->vsi_core_ext->fb.c.size = ctx->picinfo.fb_sz[1];
 
-error_free_inst:
-	kfree(inst);
-	return err;
+	inst->vsi_core_ext->dec.vdec_fb_va = (unsigned long)fb;
+	inst->vsi_core_ext->dec.nal_info = share_info->nal_info;
+
+	inst->vsi_core_ext->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core_ext->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
+
+	inst->vsi_core_ext->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core_ext->err_map.size = lat_buf->wdma_err_addr.size;
+
+	inst->vsi_core_ext->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core_ext->slice_bc.size = lat_buf->slice_bc_addr.size;
+
+	inst->vsi_core_ext->row_info.dma_addr = 0;
+	inst->vsi_core_ext->row_info.size = 0;
+
+	inst->vsi_core_ext->trans.dma_addr = share_info->trans_start;
+	inst->vsi_core_ext->trans.dma_addr_end = share_info->trans_end;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_core_ext->mv_buf_dma[i].dma_addr = mem->dma_addr;
+		inst->vsi_core_ext->mv_buf_dma[i].size = mem->size;
+	}
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
+
+	return 0;
 }
 
-static void vdec_h264_slice_deinit(void *h_vdec)
+static int vdec_h264_slice_core_decode_ext(struct vdec_lat_buf *lat_buf)
 {
-	struct vdec_h264_slice_inst *inst = h_vdec;
+	int err, timeout;
+	struct mtk_vcodec_dec_ctx *ctx = lat_buf->ctx;
+	struct vdec_h264_slice_inst *inst = ctx->drv_handle;
+	struct vdec_h264_slice_share_info *share_info = lat_buf->private_data;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
 
-	vpu_dec_deinit(&inst->vpu);
-	vdec_h264_slice_free_mv_buf(inst);
-	vdec_msg_queue_deinit(&inst->ctx->msg_queue, inst->ctx);
+	memcpy(&inst->vsi_core_ext->h264_slice_params, &share_info->h264_slice_params,
+	       sizeof(share_info->h264_slice_params));
 
-	kfree(inst);
+	err = vdec_h264_slice_setup_core_buffer_ext(inst, share_info, lat_buf);
+	if (err)
+		goto vdec_dec_end;
+
+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core_ext->h264_slice_params,
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
+	inst->vsi_core_ext->dec.timeout = !!timeout;
+
+	vpu_dec_core_end(vpu);
+
+	/* crc is hardware checksum, can be used to check whether the decoder result is right.*/
+	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       ctx->decoded_frame_cnt,
+		       inst->vsi_core_ext->dec.crc[0], inst->vsi_core_ext->dec.crc[1],
+		       inst->vsi_core_ext->dec.crc[2], inst->vsi_core_ext->dec.crc[3],
+		       inst->vsi_core_ext->dec.crc[4], inst->vsi_core_ext->dec.crc[5],
+		       inst->vsi_core_ext->dec.crc[6], inst->vsi_core_ext->dec.crc[7]);
+
+vdec_dec_end:
+	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
+	mtk_vdec_debug(ctx, "core decode done err=%d", err);
+	ctx->decoded_frame_cnt++;
+	return 0;
 }
 
 static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 {
 	struct vdec_fb *fb;
-	u64 vdec_fb_va;
 	u64 y_fb_dma, c_fb_dma;
 	int err, timeout, i;
 	struct mtk_vcodec_dec_ctx *ctx = lat_buf->ctx;
@@ -460,22 +634,19 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	struct mtk_vcodec_mem *mem;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 
-	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
 	memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
 	       sizeof(share_info->h264_slice_params));
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
 	if (!fb) {
 		err = -EBUSY;
-		mtk_vdec_err(ctx, "fb buffer is NULL");
+		mtk_vdec_err(ctx, "Unable to get a CAPTURE buffer for CAPTURE queue is empty.");
 		goto vdec_dec_end;
 	}
 
-	vdec_fb_va = (unsigned long)fb;
 	y_fb_dma = (u64)fb->base_y.dma_addr;
 	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
-		c_fb_dma =
-			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+		c_fb_dma = y_fb_dma + ctx->picinfo.fb_sz[0];
 	else
 		c_fb_dma = (u64)fb->base_c.dma_addr;
 
@@ -483,7 +654,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 	inst->vsi_core->dec.y_fb_dma = y_fb_dma;
 	inst->vsi_core->dec.c_fb_dma = c_fb_dma;
-	inst->vsi_core->dec.vdec_fb_va = vdec_fb_va;
+	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
 	inst->vsi_core->dec.nal_info = share_info->nal_info;
 	inst->vsi_core->wdma_start_addr =
 		lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
@@ -521,6 +692,8 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	inst->vsi_core->dec.timeout = !!timeout;
 
 	vpu_dec_core_end(vpu);
+
+	/* crc is hardware checksum, can be used to check whether the decoder result is right.*/
 	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
 		       ctx->decoded_frame_cnt,
 		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
@@ -533,6 +706,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
 	mtk_vdec_debug(ctx, "core decode done err=%d", err);
 	ctx->decoded_frame_cnt++;
+
 	return 0;
 }
 
@@ -559,6 +733,128 @@ static void vdec_h264_insert_startcode(struct mtk_vcodec_dec_dev *vcodec_dev, un
 	(*bs_size) += 4;
 }
 
+static int vdec_h264_slice_lat_decode_ext(void *h_vdec, struct mtk_vcodec_mem *bs,
+					  struct vdec_fb *fb, bool *res_chg)
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
+				vdec_h264_slice_core_decode_ext,
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
+	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
+
+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
+						     &inst->vsi_ext->h264_slice_params);
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
+	vdec_h264_slice_setup_lat_buffer_ext(inst, bs, lat_buf);
+	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
+		       inst->vsi_ext->ube.dma_addr, (unsigned long)inst->vsi_ext->ube.size,
+		       inst->vsi_ext->err_map.dma_addr);
+
+	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%llx))",
+		       inst->vsi_ext->slice_bc.dma_addr,
+		       (unsigned long)inst->vsi_ext->slice_bc.size,
+		       inst->vsi_ext->trans.dma_addr, inst->vsi_ext->trans.dma_addr_end);
+
+	err = vpu_dec_start(vpu, data, 2);
+	if (err) {
+		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
+		goto err_free_fb_out;
+	}
+
+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+		inst->vsi_ext->dec.wdma_end_addr_offset;
+
+	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
+	share_info->nal_info = inst->vsi_ext->dec.nal_info;
+
+	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ext->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
+	}
+
+	/* wait decoder done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+	if (timeout)
+		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
+	inst->vsi_ext->dec.timeout = !!timeout;
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
+		inst->vsi_ext->dec.wdma_end_addr_offset;
+
+	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
+
+	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
+		memcpy(&share_info->h264_slice_params, &inst->vsi_ext->h264_slice_params,
+		       sizeof(share_info->h264_slice_params));
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
+	}
+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
+		       inst->vsi_ext->dec.crc[0], inst->vsi_ext->dec.crc[1],
+		       inst->vsi_ext->dec.crc[2]);
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
@@ -704,6 +1000,101 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	return err;
 }
 
+static int vdec_h264_slice_single_decode_ext(void *h_vdec, struct mtk_vcodec_mem *bs,
+					     struct vdec_fb *unused, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
+	struct vdec_fb *fb;
+	unsigned int data[2], i;
+	u64 y_fb_dma, c_fb_dma;
+	struct mtk_vcodec_mem *mem;
+	int err;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vpu_dec_reset(vpu);
+
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	if (!fb) {
+		mtk_vdec_err(inst->ctx,
+			     "Unable to get a CAPTURE buffer for CAPTURE queue is empty.");
+		return -ENOMEM;
+	}
+
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
+	y_fb_dma = fb->base_y.dma_addr;
+	c_fb_dma = fb->base_c.dma_addr;
+	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
+		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
+
+	inst->vsi_ctx_ext.bs.dma_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx_ext.bs.size = bs->size;
+	inst->vsi_ctx_ext.fb.y.dma_addr = y_fb_dma;
+	inst->vsi_ctx_ext.fb.c.dma_addr = c_fb_dma;
+	inst->vsi_ctx_ext.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &dst_buf_info->m2m_buf.vb, true);
+	err = get_vdec_sig_decode_parameters(inst);
+	if (err)
+		goto err_free_fb_out;
+
+	memcpy(&inst->vsi_ctx_ext.h264_slice_params, &inst->h264_slice_param,
+	       sizeof(inst->vsi_ctx_ext.h264_slice_params));
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
+			inst->vsi_ctx_ext.mv_buf_dma[i].dma_addr = mem->dma_addr;
+		}
+	}
+
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx_ext, sizeof(inst->vsi_ctx_ext));
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
+	inst->vsi_ext->dec.timeout = !!err;
+	err = vpu_dec_end(vpu);
+	if (err)
+		goto err_free_fb_out;
+
+	memcpy(&inst->vsi_ctx_ext, inst->vpu.vsi, sizeof(inst->vsi_ctx_ext));
+	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       inst->ctx->decoded_frame_cnt,
+		       inst->vsi_ctx_ext.dec.crc[0], inst->vsi_ctx_ext.dec.crc[1],
+		       inst->vsi_ctx_ext.dec.crc[2], inst->vsi_ctx_ext.dec.crc[3],
+		       inst->vsi_ctx_ext.dec.crc[4], inst->vsi_ctx_ext.dec.crc[5],
+		       inst->vsi_ctx_ext.dec.crc[6], inst->vsi_ctx_ext.dec.crc[7]);
+
+	inst->ctx->decoded_frame_cnt++;
+	return 0;
+
+err_free_fb_out:
+	mtk_vdec_err(inst->ctx, "dec frame number: %d err: %d", inst->ctx->decoded_frame_cnt, err);
+	return err;
+}
+
 static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 					 struct vdec_fb *unused, bool *res_chg)
 {
@@ -723,7 +1114,8 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
 	if (!fb) {
-		mtk_vdec_err(inst->ctx, "fb buffer is NULL");
+		mtk_vdec_err(inst->ctx,
+			     "Unable to get a CAPTURE buffer for CAPTURE queue is empty.");
 		return -ENOMEM;
 	}
 
@@ -807,21 +1199,95 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	return err;
 }
 
+static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
+{
+	struct vdec_h264_slice_inst *inst;
+	int err, vsi_size;
+	unsigned char *temp;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->ctx = ctx;
+
+	inst->vpu.id = SCP_IPI_VDEC_LAT;
+	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.ctx = ctx;
+	inst->vpu.codec_type = ctx->current_codec;
+	inst->vpu.capture_type = ctx->capture_fourcc;
+
+	err = vpu_dec_init(&inst->vpu);
+	if (err) {
+		mtk_vdec_err(ctx, "vdec_h264 init err=%d", err);
+		goto error_free_inst;
+	}
+
+	if (IS_VDEC_SUPPORT_EXT(ctx->dev->dec_capability)) {
+		vsi_size = sizeof(struct vdec_h264_slice_vsi_ext);
+
+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
+		inst->vsi_ext = inst->vpu.vsi;
+		temp = (unsigned char *)inst->vsi_ext;
+		inst->vsi_core_ext = (struct vdec_h264_slice_vsi_ext *)(temp + vsi_size);
+
+		if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
+			inst->decode = vdec_h264_slice_single_decode_ext;
+		else
+			inst->decode = vdec_h264_slice_lat_decode_ext;
+	} else {
+		vsi_size = sizeof(struct vdec_h264_slice_vsi);
+
+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
+		inst->vsi = inst->vpu.vsi;
+		temp = (unsigned char *)inst->vsi;
+		inst->vsi_core = (struct vdec_h264_slice_vsi *)(temp + vsi_size);
+
+		if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
+			inst->decode = vdec_h264_slice_single_decode;
+		else
+			inst->decode = vdec_h264_slice_lat_decode;
+	}
+	inst->resolution_changed = true;
+	inst->realloc_mv_buf = true;
+
+	mtk_vdec_debug(ctx, "lat struct size = %d,%d,%d,%d vsi: %d\n",
+		       (int)sizeof(struct mtk_h264_sps_param),
+		       (int)sizeof(struct mtk_h264_pps_param),
+		       (int)sizeof(struct vdec_h264_slice_lat_dec_param),
+		       (int)sizeof(struct mtk_h264_dpb_info),
+		       vsi_size);
+	mtk_vdec_debug(ctx, "lat H264 instance >> %p, codec_type = 0x%x",
+		       inst, inst->vpu.codec_type);
+
+	ctx->drv_handle = inst;
+	return 0;
+
+error_free_inst:
+	kfree(inst);
+	return err;
+}
+
+static void vdec_h264_slice_deinit(void *h_vdec)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+
+	vpu_dec_deinit(&inst->vpu);
+	vdec_h264_slice_free_mv_buf(inst);
+	vdec_msg_queue_deinit(&inst->ctx->msg_queue, inst->ctx);
+
+	kfree(inst);
+}
+
 static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 				  struct vdec_fb *unused, bool *res_chg)
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
-	int ret;
 
 	if (!h_vdec)
 		return -EINVAL;
 
-	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
-		ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
-	else
-		ret = vdec_h264_slice_lat_decode(h_vdec, bs, unused, res_chg);
-
-	return ret;
+	return inst->decode(h_vdec, bs, unused, res_chg);
 }
 
 static int vdec_h264_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
-- 
2.46.0


