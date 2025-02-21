Return-Path: <linux-media+bounces-26534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0BFA3EB1A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 04:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B87162D17
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 03:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670411DE4C4;
	Fri, 21 Feb 2025 03:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M9il5Axd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D11D63C4;
	Fri, 21 Feb 2025 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107432; cv=none; b=K8diNGG+W/5/XEtTVxNonWBjZJCMfDxtdsWCUe/2GMAN7vCvHuySFQTsRXdVzFZ6MMaWwe+X3BcGzjCFSjsga3zdhuCuL4KyIHLtl9osU3gmE3QE1MxulHQZD4uWN+axRKdRZtRhzOtZmJ2CynJ0nAySbYymnNJpu5Gxt5WaUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107432; c=relaxed/simple;
	bh=SAmvckILy6t6c+Gh0QTpmhj7K5w5hWJ6V7t8VHJtPCo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7grkzXP27DpUfgnMfjadrKXBl8sbKh+RLX14fXk5oIxOjuFIDhkANCPDIRcfojH0bjXN2Nt6YRmV8bYYjH95PkuUwYgxjC9TKvjRvMg4PY6PROi9nGXPB8xgnqjrUJaTR6oByYuiBz05EL4hfzIzAsGs/KYZn9nHnt07tx1nHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=M9il5Axd; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 638ae080f00111efaae1fd9735fae912-20250221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=aEd+7teB6ZflXtkbb4vLiJakN104mnVtsVQRr9QG2fM=;
	b=M9il5Axdj+eI8dUJmhX59gDajNuKgCZ7FdsUpLopkP0pAhV+AOmGIV+56NGAHzhCqJTS3KG7SSCjVTP2yT11QEMugUL2rq+A0VQFoQWwdjcadjdzVs69np7puSZDkZMOvmnXRAJkuKNkmVWqv/U1aueZlRJa67ffVJMaTVnZTfM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f5b68e1d-9943-4c26-994c-2e9945b5cb3c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:60aa074,CLOUDID:31d35fa4-5c06-4e72-8298-91cabc9efadf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 638ae080f00111efaae1fd9735fae912-20250221
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 661149441; Fri, 21 Feb 2025 11:10:22 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 21 Feb 2025 11:10:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 21 Feb 2025 11:10:20 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH 1/2] media: mediatek: encoder: Add a new encoder driver interface
Date: Fri, 21 Feb 2025 11:10:03 +0800
Message-ID: <20250221031004.9050-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250221031004.9050-1-irui.wang@mediatek.com>
References: <20250221031004.9050-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Introduce a new encoder kernel driver interface to ensure compatibility
with the updated encoder software driver running in firmware.
The new driver interface is expected to support more encoder formats,
share more encode parameters between kernel and firmware.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +
 .../vcodec/encoder/venc/venc_common_if.c      | 704 ++++++++++++++++++
 .../mediatek/vcodec/encoder/venc_drv_if.h     |   3 +
 4 files changed, 710 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/Makefile b/drivers/media/platform/mediatek/vcodec/encoder/Makefile
index e621b5b7e5e6..9d3229d56e39 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/encoder/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-enc.o
 
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc/venc_h264_if.o \
+		venc/venc_common_if.o \
 		mtk_vcodec_enc.o \
 		mtk_vcodec_enc_drv.o \
 		mtk_vcodec_enc_pm.o \
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..f5b888174dae 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -1175,6 +1175,8 @@ static void mtk_venc_worker(struct work_struct *work)
 		frm_buf.fb_addr[i].size =
 				(size_t)src_buf->vb2_buf.planes[i].length;
 	}
+	frm_buf.num_planes = src_buf->vb2_buf.num_planes;
+
 	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
 	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
new file mode 100644
index 000000000000..a696e986903b
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
@@ -0,0 +1,704 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#include "../mtk_vcodec_enc.h"
+#include "../mtk_vcodec_enc_drv.h"
+#include "../venc_drv_base.h"
+#include "../venc_drv_if.h"
+#include "../venc_vpu_if.h"
+#include "../../common/mtk_vcodec_intr.h"
+#include "../../common/mtk_vcodec_util.h"
+
+#define SEQ_HEADER_SIZE 1024
+#define PPS_SIZE 128
+#define MAX_DPB_SIZE 16
+#define MAX_VENC_CORE 3
+#define VENC_CONFIG_LENGTH 115
+#define VENC_CONFIG_DATA 128
+#define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
+
+/**
+ * enum venc_codec_type - video encoder type
+ * @VENC_H264: H264 encoder
+ * @VENC_H265: H265 encoder
+ * @VENC_MAX: max value
+ */
+enum venc_codec_type {
+	VENC_H264,
+	VENC_H265,
+	VENC_MAX,
+};
+
+/**
+ * enum venc_ipi_id - video encoder ipi id
+ * @IPI_VENC: encoder ipi
+ * @IPI_VENC_MAX: max value
+ */
+enum venc_ipi_id {
+	IPI_VENC,
+	IPI_VENC_MAX,
+};
+
+/**
+ * enum venc_bs_mode - encode bitstream mode
+ * @VENC_BS_MODE_SPS: encode sps
+ * @VENC_BS_MODE_PPS: encode pps
+ * @VENC_BS_MODE_VPS: encode vps
+ * @VENC_BS_MODE_SEQ_HDR: encode sequence header
+ * @VENC_BS_MODE_FRAME: encode frame
+ * @VENC_BS_MODE_FRAME_FINAL: encode final frame
+ * @VENC_BS_MODE_MAX: max value
+ */
+enum venc_bs_mode {
+	VENC_BS_MODE_SPS = 0,
+	VENC_BS_MODE_PPS,
+	VENC_BS_MODE_VPS,
+	VENC_BS_MODE_SEQ_HDR,
+	VENC_BS_MODE_FRAME,
+	VENC_BS_MODE_FRAME_FINAL,
+	VENC_BS_MODE_MAX
+};
+
+/**
+ * struct venc_config - Structure for encoder configuration
+ *                      AP-W/R : AP is writer/reader on this item
+ *                      MCU-W/R: MCU is write/reader on this item
+ * @input_fourcc: input format fourcc
+ * @bitrate: target bitrate (in bps)
+ * @pic_w: picture width. Picture size is visible stream resolution, in pixels,
+ *         to be used for display purposes; must be smaller or equal to buffer
+ *         size.
+ * @pic_h: picture height
+ * @buf_w: buffer width. Buffer size is stream resolution in pixels aligned to
+ *         hardware requirements.
+ * @buf_h: buffer height
+ * @gop_size: group of picture size (idr frame)
+ * @intra_period: intra frame period
+ * @framerate: frame rate in fps
+ * @profile: as specified in standard
+ * @level: as specified in standard
+ * @core_num: encoder core num
+ * @dpb_size: encode dpb size
+ * @reserved: reserved field config
+ */
+struct venc_config {
+	__u32 input_fourcc;
+	__u32 bitrate;
+	__u32 pic_w;
+	__u32 pic_h;
+	__u32 buf_w;
+	__u32 buf_h;
+	__u32 gop_size;
+	__u32 intra_period;
+	__u32 framerate;
+	__u32 profile;
+	__u32 level;
+	__u32 core_num;
+	__u32 dpb_size;
+	__u32 reserved[VENC_CONFIG_LENGTH];
+};
+
+/**
+ * struct venc_config_data - Structure for configuration data
+ * @config_data: configuration data
+ */
+struct venc_config_data {
+	unsigned int config_data[VENC_CONFIG_DATA];
+};
+
+/**
+ * struct venc_work_buf - Structure for working buffer information
+ *                               AP-W/R : AP is writer/reader on this item
+ *                               MCU-W/R: MCU is write/reader on this item
+ * @iova: IO virtual address
+ * @pa: physical address
+ * @pa_64: for 64bit pa padding
+ * @va: virtual address
+ * @va_padding: for 64bit va padding
+ * @size: buffer size
+ * @size_padding: for 64bit size padding
+ */
+struct venc_work_buf {
+	unsigned long long iova;
+	union {
+		unsigned int pa;
+		unsigned long long pa_64;
+	};
+	union {
+		void *va;
+		unsigned long long va_padding;
+	};
+	union {
+		unsigned int size;
+		unsigned long long size_padding;
+	};
+};
+
+/**
+ * struct venc_work_buf_list - Structure for encode working buffer list
+ * @rc_code: RC code buffer
+ * @rc_info: RC info buffer
+ * @luma: luma buffer
+ * @chroma: chroma buffer
+ * @sub_luma: sub luma buffer
+ * @sub_write: sub write buffer
+ * @col_mv: col_mv buffer
+ * @wpp: wpp buffer
+ * @wpp_nbm: wpp nbm buffer
+ * @skip_frame: skip frame buffer
+ */
+struct venc_work_buf_list {
+	struct venc_work_buf rc_code;
+	struct venc_work_buf rc_info[MAX_VENC_CORE];
+	struct venc_work_buf luma[MAX_DPB_SIZE];
+	struct venc_work_buf chroma[MAX_DPB_SIZE];
+	struct venc_work_buf sub_luma[MAX_DPB_SIZE];
+	struct venc_work_buf sub_write[MAX_DPB_SIZE];
+	struct venc_work_buf col_mv[MAX_DPB_SIZE];
+	struct venc_work_buf wpp[MAX_VENC_CORE];
+	struct venc_work_buf wpp_nbm[MAX_VENC_CORE];
+	struct venc_work_buf skip_frame;
+};
+
+/**
+ * struct venc_info -  Structure for encode frame and bs information
+ * @fb_addr: frame buffer address array
+ * @fb_size: frame buffer size array
+ * @bs_addr: bitstream buffer address
+ * @bs_size: bitstream buffer size
+ */
+struct venc_info {
+	unsigned long long fb_addr[VIDEO_MAX_PLANES];
+	unsigned int fb_size[VIDEO_MAX_PLANES];
+	unsigned long long bs_addr;
+	unsigned long long bs_size;
+};
+
+/**
+ * struct venc_vsi - Structure for VCP driver control and info share
+ *                   AP-W/R : AP is writer/reader on this item
+ *                   VCP-W/R: VCP is write/reader on this item
+ * @config: encoder configuration
+ * @data: encoder configuration data
+ * @bufs: encoder working buffers
+ * @venc: encoder information
+ */
+struct venc_vsi {
+	struct venc_config config;
+	struct venc_config_data data;
+	struct venc_work_buf_list bufs;
+	struct venc_info venc;
+};
+
+/**
+ * struct venc_inst - Structure for encoder instance
+ * @hw_base: hardware io address
+ * @pps_buf: PPS buffer
+ * @seq_buf: sequence header buffer
+ * @work_buf_allocated: work buffer allocated or not
+ * @frm_cnt: encoded frame count
+ * @skip_frm_cnt: encoded skip frame count
+ * @prepend_hdr: prepend header flag
+ * @vpu_inst: vpu instance
+ * @vsi: encode vsi
+ * @ctx: encoder context
+ */
+struct venc_inst {
+	void __iomem *hw_base;
+	struct mtk_vcodec_mem pps_buf;
+	struct mtk_vcodec_mem seq_buf;
+	bool work_buf_allocated;
+	unsigned int frm_cnt;
+	unsigned int skip_frm_cnt;
+	unsigned int prepend_hdr;
+	struct venc_vpu_inst vpu_inst;
+	struct venc_vsi *vsi;
+	struct mtk_vcodec_enc_ctx *ctx;
+};
+
+static int venc_init(struct mtk_vcodec_enc_ctx *ctx)
+{
+	int ret = 0;
+	struct venc_inst *inst;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->ctx = ctx;
+	inst->vpu_inst.ctx = ctx;
+	inst->vpu_inst.id = IPI_VENC;
+	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base,
+						VENC_SYS);
+
+	ret = vpu_enc_init(&inst->vpu_inst);
+	inst->vsi = (struct venc_vsi *)inst->vpu_inst.vsi;
+
+	if (ret)
+		kfree(inst);
+	else
+		ctx->drv_handle = inst;
+
+	return ret;
+}
+
+static inline u32 venc_read_reg(struct venc_inst *inst, u32 addr)
+{
+	return readl(inst->hw_base + addr);
+}
+
+static unsigned int venc_wait_encode_done(struct venc_inst *inst)
+{
+	unsigned int irq_status = 0;
+	struct mtk_vcodec_enc_ctx *ctx = (struct mtk_vcodec_enc_ctx *)inst->ctx;
+
+	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
+					  WAIT_INTR_TIMEOUT_MS, 0)) {
+		irq_status = ctx->irq_status;
+		mtk_venc_debug(ctx, "irq_status %x <-", irq_status);
+	}
+	return irq_status;
+}
+
+static void venc_set_bufs(struct venc_inst *inst,
+			  struct venc_frm_buf *frm_buf,
+			  struct mtk_vcodec_mem *bs_buf)
+{
+	unsigned int i;
+
+	if (frm_buf) {
+		for (i = 0; i < frm_buf->num_planes; i++) {
+			inst->vsi->venc.fb_addr[i] =
+				frm_buf->fb_addr[i].dma_addr;
+			inst->vsi->venc.fb_size[i] =
+				frm_buf->fb_addr[i].size;
+			mtk_venc_debug(inst->ctx, "%s: fb_buf[%d]: %llx(%d)\n",
+				       __func__, i,
+				       inst->vsi->venc.fb_addr[i],
+				       inst->vsi->venc.fb_size[i]);
+		}
+	}
+
+	if (bs_buf) {
+		inst->vsi->venc.bs_addr = bs_buf->dma_addr;
+		inst->vsi->venc.bs_size = bs_buf->size;
+		mtk_venc_debug(inst->ctx, "%s: bs_buf: %llx(%d)\n",
+			       __func__,
+			       inst->vsi->venc.bs_addr,
+			       (unsigned int)inst->vsi->venc.bs_size);
+	}
+}
+
+static int venc_encode_sps(struct venc_inst *inst,
+			   struct mtk_vcodec_mem *bs_buf,
+			   unsigned int *bs_size)
+{
+	int ret = 0;
+	unsigned int irq_status;
+
+	venc_set_bufs(inst, NULL, bs_buf);
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_SPS,
+			     NULL, bs_buf, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_encode_done(inst);
+	if (irq_status != MTK_VENC_IRQ_STATUS_SPS) {
+		mtk_venc_err(inst->ctx, "expect irq status %d",
+			     MTK_VENC_IRQ_STATUS_SPS);
+		return -EINVAL;
+	}
+
+	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
+	mtk_venc_debug(inst->ctx, "sps bs size %d <-", *bs_size);
+
+	return ret;
+}
+
+static int venc_encode_pps(struct venc_inst *inst,
+			   struct mtk_vcodec_mem *bs_buf,
+			   unsigned int *bs_size)
+{
+	int ret = 0;
+	unsigned int irq_status;
+
+	venc_set_bufs(inst, NULL, bs_buf);
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_PPS,
+			     NULL, bs_buf, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_encode_done(inst);
+	if (irq_status != MTK_VENC_IRQ_STATUS_PPS) {
+		mtk_venc_err(inst->ctx, "expect irq status %d",
+			     MTK_VENC_IRQ_STATUS_PPS);
+		return -EINVAL;
+	}
+
+	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
+	mtk_venc_debug(inst->ctx, "pps bs size %d <-", *bs_size);
+
+	return ret;
+}
+
+static int venc_encode_header(struct venc_inst *inst,
+			      struct mtk_vcodec_mem *bs_buf,
+			      unsigned int *bs_size)
+{
+	int ret = 0;
+	unsigned int bs_size_sps;
+	unsigned int bs_size_pps;
+
+	ret = venc_encode_sps(inst, bs_buf, &bs_size_sps);
+	if (ret)
+		return ret;
+
+	ret = venc_encode_pps(inst, &inst->pps_buf, &bs_size_pps);
+	if (ret)
+		return ret;
+
+	memcpy(bs_buf->va + bs_size_sps, inst->pps_buf.va, bs_size_pps);
+	*bs_size = bs_size_sps + bs_size_pps;
+
+	return ret;
+}
+
+static int venc_encode_frame(struct venc_inst *inst,
+			     struct venc_frm_buf *frm_buf,
+			     struct mtk_vcodec_mem *bs_buf,
+			     unsigned int *bs_size)
+{
+	int ret = 0;
+	unsigned int irq_status;
+
+	venc_set_bufs(inst, frm_buf, bs_buf);
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_FRAME,
+			     frm_buf, bs_buf, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_encode_done(inst);
+	if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
+		mtk_venc_err(inst->ctx, "expect irq status %d",
+			     MTK_VENC_IRQ_STATUS_FRM);
+		return -EINVAL;
+	}
+
+	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
+
+	++inst->frm_cnt;
+
+	return ret;
+}
+
+static int venc_encode(void *handle,
+		       enum venc_start_opt opt,
+		       struct venc_frm_buf *frm_buf,
+		       struct mtk_vcodec_mem *bs_buf,
+		       struct venc_done_result *result)
+{
+	int ret = 0;
+	struct venc_inst *inst = (struct venc_inst *)handle;
+	struct mtk_vcodec_enc_ctx *ctx;
+	unsigned int bs_size_hdr;
+
+	if (!inst || !inst->vsi)
+		return -EINVAL;
+
+	ctx = inst->ctx;
+
+	mtk_venc_debug(ctx, "%s: opt: %d\n", __func__, opt);
+
+	enable_irq(ctx->dev->enc_irq);
+	switch (opt) {
+	case VENC_START_OPT_ENCODE_SEQUENCE_HEADER: {
+		ret = venc_encode_header(inst, bs_buf, &bs_size_hdr);
+		if (ret)
+			goto encode_err;
+
+		result->bs_size = bs_size_hdr;
+		result->is_key_frm = false;
+		break;
+	}
+
+	case VENC_START_OPT_ENCODE_FRAME: {
+		if (!inst->prepend_hdr) {
+			ret = venc_encode_frame(inst, frm_buf, bs_buf,
+						&result->bs_size);
+			if (ret)
+				goto encode_err;
+
+			result->is_key_frm = inst->vpu_inst.is_key_frm;
+			break;
+		}
+
+		ret = venc_encode_header(inst, &inst->seq_buf, &bs_size_hdr);
+		if (ret)
+			goto encode_err;
+
+		ret = venc_encode_frame(inst, frm_buf, bs_buf,
+					&result->bs_size);
+		if (ret)
+			goto encode_err;
+
+		memmove(bs_buf->va + bs_size_hdr, bs_buf->va, result->bs_size);
+		memcpy(bs_buf->va, inst->seq_buf.va, bs_size_hdr);
+		result->bs_size += bs_size_hdr;
+
+		inst->prepend_hdr = 0;
+		result->is_key_frm = inst->vpu_inst.is_key_frm;
+		break;
+	}
+
+	default:
+		mtk_venc_err(inst->ctx, "venc_opt %d not supported", opt);
+		ret = -EINVAL;
+		break;
+	}
+
+encode_err:
+	disable_irq(ctx->dev->enc_irq);
+	mtk_venc_debug(ctx, "opt %d, return %d", opt, ret);
+
+	return ret;
+}
+
+static int mtk_venc_mem_alloc(struct venc_inst *inst,
+			      struct device *dev,
+			      struct venc_work_buf *buf)
+{
+	dma_addr_t dma_addr;
+
+	if (!buf || buf->size == 0)
+		return 0;
+
+	buf->va = dma_alloc_coherent(dev, buf->size, &dma_addr, GFP_KERNEL);
+	if (!buf->va)
+		return -ENOMEM;
+
+	buf->iova = (unsigned long long)dma_addr;
+
+	mtk_venc_debug(inst->ctx,
+		       "allocate buffer, size: %d, va: %p, iova: 0x%llx",
+		       buf->size, buf->va, buf->iova);
+
+	return 0;
+}
+
+static void mtk_venc_mem_free(struct venc_inst *inst,
+			      struct device *dev,
+			      struct venc_work_buf *buf)
+{
+	if (!buf || !buf->va || !dev)
+		return;
+
+	mtk_venc_debug(inst->ctx,
+		       "free buffer, size: %d, va: %p, iova: 0x%llx",
+		       buf->size, buf->va, buf->iova);
+
+	dma_free_coherent(dev, buf->size, buf->va, buf->iova);
+	buf->va = NULL;
+	buf->iova = 0;
+	buf->size = 0;
+}
+
+static void venc_free_rc_buf(struct venc_inst *inst,
+			     struct venc_work_buf_list *bufs,
+			     unsigned int core_num)
+{
+	int i;
+	struct mtk_vcodec_fw *fw = inst->ctx->dev->fw_handler;
+	struct device *dev;
+
+	if (mtk_vcodec_fw_get_type(fw) == SCP) {
+		dev = &inst->ctx->dev->plat_dev->dev;
+		mtk_venc_mem_free(inst, dev, &bufs->rc_code);
+
+		for (i = 0; i < core_num; i++)
+			mtk_venc_mem_free(inst, dev, &bufs->rc_info[i]);
+	}
+}
+
+static void venc_free_work_buf(struct venc_inst *inst)
+{
+	int i;
+	struct venc_work_buf_list *bufs = &inst->vsi->bufs;
+	unsigned int core_num = inst->vsi->config.core_num;
+	unsigned int dpb_size = inst->vsi->config.dpb_size;
+	struct device *dev;
+
+	if (bufs->rc_code.va)
+		venc_free_rc_buf(inst, bufs, core_num);
+
+	dev = &inst->ctx->dev->plat_dev->dev;
+
+	for (i = 0; i < core_num; i++) {
+		mtk_venc_mem_free(inst, dev, &bufs->wpp[i]);
+		mtk_venc_mem_free(inst, dev, &bufs->wpp_nbm[i]);
+	}
+
+	for (i = 0; i < dpb_size; i++) {
+		mtk_venc_mem_free(inst, dev, &bufs->luma[i]);
+		mtk_venc_mem_free(inst, dev, &bufs->chroma[i]);
+		mtk_venc_mem_free(inst, dev, &bufs->sub_luma[i]);
+		mtk_venc_mem_free(inst, dev, &bufs->sub_write[i]);
+		mtk_venc_mem_free(inst, dev, &bufs->col_mv[i]);
+	}
+
+	if (inst->pps_buf.va)
+		mtk_vcodec_mem_free(inst->ctx, &inst->pps_buf);
+
+	if (inst->seq_buf.va)
+		mtk_vcodec_mem_free(inst->ctx, &inst->seq_buf);
+}
+
+static int venc_alloc_rc_buf(struct venc_inst *inst,
+			     struct venc_work_buf_list *bufs,
+			     unsigned int core_num)
+{
+	int i;
+	struct mtk_vcodec_fw *fw = inst->ctx->dev->fw_handler;
+	struct device *dev;
+	void *tmp_va;
+
+	if (mtk_vcodec_fw_get_type(fw) == SCP) {
+		dev = &inst->ctx->dev->plat_dev->dev;
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+			return -ENOMEM;
+
+		tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
+		memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+
+		for (i = 0; i < core_num; i++) {
+			if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
+				return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static int venc_alloc_work_buf(struct venc_inst *inst)
+{
+	int i, ret;
+	struct venc_work_buf_list *bufs = &inst->vsi->bufs;
+	unsigned int core_num = inst->vsi->config.core_num;
+	unsigned int dpb_size = inst->vsi->config.dpb_size;
+	struct device *dev;
+
+	if (bufs->rc_code.size != 0) {
+		ret = venc_alloc_rc_buf(inst, bufs, core_num);
+		if (ret) {
+			mtk_venc_err(inst->ctx, "cannot allocate rc buf");
+			goto err_alloc;
+		}
+	}
+
+	dev = &inst->ctx->dev->plat_dev->dev;
+
+	for (i = 0; i < core_num; i++) {
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->wpp[i]) ||
+		    mtk_venc_mem_alloc(inst, dev, &bufs->wpp_nbm[i]))
+			goto err_alloc;
+	}
+
+	for (i = 0; i < dpb_size; i++) {
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->luma[i]) ||
+		    mtk_venc_mem_alloc(inst, dev, &bufs->chroma[i]) ||
+		    mtk_venc_mem_alloc(inst, dev, &bufs->sub_luma[i]) ||
+		    mtk_venc_mem_alloc(inst, dev, &bufs->sub_write[i]) ||
+		    mtk_venc_mem_alloc(inst, dev, &bufs->col_mv[i]))
+			goto err_alloc;
+	}
+
+	/* the pps_buf and seq_buf are used by AP side only */
+	inst->pps_buf.size = PPS_SIZE;
+	ret = mtk_vcodec_mem_alloc(inst->ctx, &inst->pps_buf);
+	if (ret) {
+		mtk_venc_err(inst->ctx, "cannot allocate pps_buf");
+		goto err_alloc;
+	}
+
+	inst->seq_buf.size = SEQ_HEADER_SIZE;
+	ret = mtk_vcodec_mem_alloc(inst->ctx, &inst->seq_buf);
+	if (ret) {
+		mtk_venc_err(inst->ctx, "cannot allocate seq_buf");
+		goto err_alloc;
+	}
+	return 0;
+
+err_alloc:
+	venc_free_work_buf(inst);
+	return -ENOMEM;
+}
+
+static int venc_set_param(void *handle,
+			  enum venc_set_param_type type,
+			  struct venc_enc_param *enc_prm)
+{
+	int ret = 0;
+	struct venc_inst *inst = (struct venc_inst *)handle;
+
+	switch (type) {
+	case VENC_SET_PARAM_ENC:
+		if (!inst->vsi)
+			return -EINVAL;
+		inst->vsi->config.input_fourcc = enc_prm->input_yuv_fmt;
+		inst->vsi->config.bitrate = enc_prm->bitrate;
+		inst->vsi->config.pic_w = enc_prm->width;
+		inst->vsi->config.pic_h = enc_prm->height;
+		inst->vsi->config.buf_w = enc_prm->buf_width;
+		inst->vsi->config.buf_h = enc_prm->buf_height;
+		inst->vsi->config.gop_size = enc_prm->gop_size;
+		inst->vsi->config.framerate = enc_prm->frm_rate;
+		inst->vsi->config.intra_period = enc_prm->intra_period;
+		inst->vsi->config.profile = enc_prm->h264_profile;
+		inst->vsi->config.level = enc_prm->h264_level;
+
+		ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
+		if (ret)
+			break;
+
+		if (inst->work_buf_allocated) {
+			venc_free_work_buf(inst);
+			inst->work_buf_allocated = false;
+		}
+		ret = venc_alloc_work_buf(inst);
+		if (ret)
+			break;
+		inst->work_buf_allocated = true;
+		break;
+	case VENC_SET_PARAM_PREPEND_HEADER:
+		inst->prepend_hdr = 1;
+		break;
+	default:
+		ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
+		break;
+	}
+
+	return ret;
+}
+
+static int venc_deinit(void *handle)
+{
+	int ret = 0;
+	struct venc_inst *inst = (struct venc_inst *)handle;
+
+	ret = vpu_enc_deinit(&inst->vpu_inst);
+
+	if (inst->work_buf_allocated)
+		venc_free_work_buf(inst);
+
+	kfree(inst);
+
+	return ret;
+}
+
+const struct venc_common_if venc_if = {
+	.init = venc_init,
+	.encode = venc_encode,
+	.set_param = venc_set_param,
+	.deinit = venc_deinit,
+};
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
index 889440a436b6..1908a6ae42fa 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
@@ -107,9 +107,11 @@ struct venc_frame_info {
 /*
  * struct venc_frm_buf - frame buffer information used in venc_if_encode()
  * @fb_addr: plane frame buffer addresses
+ * @num_planes: number of planes
  */
 struct venc_frm_buf {
 	struct mtk_vcodec_fb fb_addr[MTK_VCODEC_MAX_PLANES];
+	unsigned int num_planes;
 };
 
 /*
@@ -124,6 +126,7 @@ struct venc_done_result {
 
 extern const struct venc_common_if venc_h264_if;
 extern const struct venc_common_if venc_vp8_if;
+extern const struct venc_common_if venc_if;
 
 /*
  * venc_if_init - Create the driver handle
-- 
2.46.0


