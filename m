Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADDD3ED2C8
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236222AbhHPLBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:01:20 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53432 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236188AbhHPLBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:01:13 -0400
X-UUID: eac94a34b5254d8185808eeca63fb589-20210816
X-UUID: eac94a34b5254d8185808eeca63fb589-20210816
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 391395510; Mon, 16 Aug 2021 19:00:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:36 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:35 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 6/9] media: mtk-vcodec: Add new venc drv interface for frame_racing mode
Date:   Mon, 16 Aug 2021 18:59:31 +0800
Message-ID: <20210816105934.28265-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Frame-racing mode encoding need more venc working buffers, it
will break the compatibility if we just add venc_vsi in AP-Kernel
but not in firmware, so add a new venc driver interface to
distinguish the sigle_core_mode and frame_racing mode.

The new driver interface can be used for different codecs in
the future.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  19 +
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   4 +
 .../platform/mtk-vcodec/venc/venc_common_if.c | 629 ++++++++++++++++++
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   5 +-
 .../media/platform/mtk-vcodec/venc_drv_if.h   |   1 +
 7 files changed, 659 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/venc/venc_common_if.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 661d4afeb628..a42ce704bf04 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -15,6 +15,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc/venc_h264_if.o \
+		venc/venc_common_if.o \
 		mtk_vcodec_enc.o \
 		mtk_vcodec_enc_drv.o \
 		mtk_vcodec_enc_pm.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index c160b9e505eb..1c6c1eca649f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -352,6 +352,7 @@ struct mtk_vcodec_enc_pdata {
 };
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
+#define MTK_ENC_HW_MODE(ctx) ((ctx)->dev->venc_pdata->hw_mode)
 
 /**
  * struct mtk_vcodec_dev - driver data
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
index ac5973b6735f..5057e2cba627 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
@@ -9,6 +9,7 @@
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
+#include "mtk_vcodec_enc_hw.h"
 
 /* For encoder, this will enable logs in venc/*/
 bool mtk_vcodec_dbg;
@@ -33,6 +34,24 @@ void __iomem *mtk_vcodec_get_reg_addr(struct mtk_vcodec_ctx *data,
 }
 EXPORT_SYMBOL(mtk_vcodec_get_reg_addr);
 
+void __iomem *mtk_get_venc_comp_reg_addr(struct mtk_vcodec_ctx *data,
+					 unsigned int hw_id)
+{
+	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)data;
+	struct mtk_venc_comp_dev *venc;
+
+	if (!data || hw_id >= MTK_VENC_HW_MAX) {
+		mtk_v4l2_err("Invalid arguments, hw_id=%d", hw_id);
+		return NULL;
+	}
+	venc = (struct mtk_venc_comp_dev *)ctx->dev->enc_comp_dev[hw_id];
+	if (!venc)
+		return NULL;
+
+	return venc->reg_base;
+}
+EXPORT_SYMBOL(mtk_get_venc_comp_reg_addr);
+
 int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
 			struct mtk_vcodec_mem *mem)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
index b999d7b84ed1..0027747c0a27 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
@@ -75,6 +75,10 @@ extern bool mtk_vcodec_dbg;
 
 void __iomem *mtk_vcodec_get_reg_addr(struct mtk_vcodec_ctx *data,
 				unsigned int reg_idx);
+
+void __iomem *mtk_get_venc_comp_reg_addr(struct mtk_vcodec_ctx *data,
+					 unsigned int hw_id);
+
 int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
 				struct mtk_vcodec_mem *mem);
 void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
new file mode 100644
index 000000000000..01b7d93241af
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
@@ -0,0 +1,629 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include "../venc_vpu_if.h"
+#include "../venc_drv_base.h"
+#include "../mtk_vcodec_intr.h"
+#include "../mtk_vcodec_enc.h"
+#include "../mtk_vcodec_drv.h"
+#include "../mtk_vcodec_util.h"
+#include "../mtk_vcodec_enc_hw.h"
+
+static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
+
+#define H264_FILLER_MARKER_SIZE ARRAY_SIZE(h264_filler_marker)
+#define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
+
+enum venc_vpu_work_buf {
+	VENC_VPU_WORK_BUF_RC_INFO_CORE0,
+	VENC_VPU_WORK_BUF_RC_INFO_CORE1,
+	VENC_VPU_WORK_BUF_FR_RC_INFO,
+	VENC_VPU_WORK_BUF_RC_CODE,
+	VENC_VPU_WORK_BUF_REC_LUMA,
+	VENC_VPU_WORK_BUF_REC_CHROMA,
+	VENC_VPU_WORK_BUF_REF_LUMA,
+	VENC_VPU_WORK_BUF_REF_CHROMA,
+	VENC_VPU_WORK_BUF_MV_INFO_1,
+	VENC_VPU_WORK_BUF_MV_INFO_2,
+	VENC_VPU_WORK_BUF_SKIP_FRAME,
+	VENC_VPU_WORK_BUF_MAX,
+};
+
+enum venc_frame_type {
+	VENC_IDR_FRM,
+	VENC_I_FRM,
+	VENC_P_FRM,
+	VENC_B_FRM,
+};
+
+enum venc_bs_mode {
+	VENC_BS_MODE_SPS,
+	VENC_BS_MODE_PPS,
+	VENC_BS_MODE_FRAME,
+};
+
+struct venc_vpu_buf {
+	u32 iova;
+	u32 vpua;
+	u32 size;
+};
+
+struct venc_vpu_config {
+	u32 input_fourcc;
+	u32 bitrate;
+	u32 pic_w;
+	u32 pic_h;
+	u32 buf_w;
+	u32 buf_h;
+	u32 gop_size;
+	u32 intra_period;
+	u32 framerate;
+	u32 profile;
+	u32 level;
+	u32 wfd;
+	u32 max_qp;
+	u32 min_qp;
+	u32 reserved[8];
+};
+
+struct venc_vsi {
+	struct venc_vpu_config config;
+	struct venc_vpu_buf work_bufs[VENC_VPU_WORK_BUF_MAX];
+};
+
+struct venc_common_inst {
+	void __iomem *hw_base[MTK_VENC_HW_MAX];
+	struct mtk_vcodec_mem work_bufs[VENC_VPU_WORK_BUF_MAX];
+	struct mtk_vcodec_mem pps_buf;
+	bool work_buf_allocated;
+	unsigned int frm_cnt;
+	unsigned int skip_frm_cnt;
+	unsigned int prepend_hdr;
+	struct venc_vpu_inst vpu_inst;
+	struct venc_vsi *vsi;
+	struct mtk_vcodec_ctx *ctx;
+};
+
+static inline u32 venc_read_reg(struct venc_common_inst *inst,
+				u32 addr, int hw_id)
+{
+	return readl(inst->hw_base[hw_id] + addr);
+}
+
+static unsigned int h264_get_profile(struct venc_common_inst *inst,
+				     unsigned int profile)
+{
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		return 66;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		return 77;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		return 100;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		mtk_vcodec_err(inst, "unsupported CONSTRAINED_BASELINE");
+		return 0;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+		mtk_vcodec_err(inst, "unsupported EXTENDED");
+		return 0;
+	default:
+		mtk_vcodec_debug(inst, "unsupported profile %d", profile);
+		return 100;
+	}
+}
+
+static unsigned int h264_get_level(struct venc_common_inst *inst,
+				   unsigned int level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		mtk_vcodec_err(inst, "unsupported 1B");
+		return 0;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		return 10;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		return 11;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		return 12;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		return 13;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		return 20;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		return 21;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		return 22;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		return 30;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		return 31;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		return 32;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		return 40;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		return 41;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		return 42;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 50;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		return 51;
+	default:
+		mtk_vcodec_debug(inst, "unsupported level %d", level);
+		return 31;
+	}
+}
+
+static void venc_free_work_buf(struct venc_common_inst *inst)
+{
+	int i;
+
+	mtk_vcodec_debug_enter(inst);
+
+	for (i = 0; i < VENC_VPU_WORK_BUF_MAX; i++) {
+		if (i != VENC_VPU_WORK_BUF_SKIP_FRAME)
+			mtk_vcodec_mem_free(inst->ctx, &inst->work_bufs[i]);
+	}
+
+	mtk_vcodec_mem_free(inst->ctx, &inst->pps_buf);
+
+	mtk_vcodec_debug_leave(inst);
+}
+
+static int venc_alloc_work_buf(struct venc_common_inst *inst)
+{
+	int i;
+	int ret = 0;
+	struct venc_vpu_buf *wb = inst->vsi->work_bufs;
+
+	mtk_vcodec_debug_enter(inst);
+
+	for (i = 0; i < VENC_VPU_WORK_BUF_MAX; i++) {
+		/*
+		 * This 'wb' structure is set by VPU side and shared to AP for
+		 * buffer allocation and IO virtual addr mapping. For most of
+		 * the buffers, AP will allocate the buffer according to 'size'
+		 * field and store the IO virtual addr in 'iova' field. There
+		 * are two exceptions:
+		 * (1) RC_CODE buffer, it's pre-allocated in the VPU side, and
+		 * save the VPU addr in the 'vpua' field. The AP will translate
+		 * the VPU addr to the corresponding IO virtual addr and store
+		 * in 'iova' field for reg setting in VPU side.
+		 * (2) SKIP_FRAME buffer, it's pre-allocated in the VPU side,
+		 * and save the VPU addr in the 'vpua' field. The AP will
+		 * translate the VPU addr to the corresponding AP side virtual
+		 * address and do some memcpy access to move to bitstream buffer
+		 * assigned by v4l2 layer.
+		 */
+		inst->work_bufs[i].size = wb[i].size;
+		if (i == VENC_VPU_WORK_BUF_SKIP_FRAME) {
+			struct mtk_vcodec_fw *handler;
+
+			handler = inst->vpu_inst.ctx->dev->fw_handler;
+			inst->work_bufs[i].va =
+				mtk_vcodec_fw_map_dm_addr(handler, wb[i].vpua);
+			inst->work_bufs[i].dma_addr = 0;
+		} else {
+			ret = mtk_vcodec_mem_alloc(inst->ctx,
+						   &inst->work_bufs[i]);
+			if (ret) {
+				mtk_vcodec_err(inst,
+					       "cannot allocate buf %d", i);
+				goto err_alloc;
+			}
+			/*
+			 * This RC_CODE is pre-allocated by VPU and saved in VPU
+			 * addr. So we need use memcpy to copy RC_CODE from VPU
+			 * addr into IO virtual addr in 'iova' field for reg
+			 * setting in VPU side.
+			 */
+			if (i == VENC_VPU_WORK_BUF_RC_CODE) {
+				struct mtk_vcodec_fw *handler;
+				void *tmp_va;
+
+				handler = inst->vpu_inst.ctx->dev->fw_handler;
+				tmp_va = mtk_vcodec_fw_map_dm_addr(handler,
+								   wb[i].vpua);
+				memcpy(inst->work_bufs[i].va, tmp_va,
+				       wb[i].size);
+			}
+		}
+		wb[i].iova = inst->work_bufs[i].dma_addr;
+
+		mtk_vcodec_debug(inst,
+				 "work_buf[%d] va=0x%p iova=%pad size=%zu",
+				 i, inst->work_bufs[i].va,
+				 &inst->work_bufs[i].dma_addr,
+				 inst->work_bufs[i].size);
+	}
+
+	/* the pps_buf is used by AP side only */
+	inst->pps_buf.size = 128;
+	ret = mtk_vcodec_mem_alloc(inst->ctx, &inst->pps_buf);
+	if (ret) {
+		mtk_vcodec_err(inst, "cannot allocate pps_buf");
+		goto err_alloc;
+	}
+
+	mtk_vcodec_debug_leave(inst);
+
+	return ret;
+
+err_alloc:
+	venc_free_work_buf(inst);
+
+	return ret;
+}
+
+static unsigned int venc_wait_comp_done(struct venc_common_inst *inst,
+					unsigned int hw_id)
+{
+	unsigned int irq_status = 0;
+	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
+
+	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
+					  WAIT_INTR_TIMEOUT_MS)) {
+		irq_status = ctx->irq_status;
+		mtk_vcodec_debug(inst, "irq_status %x <-", irq_status);
+	}
+	return irq_status;
+}
+
+static int venc_frame_type(struct venc_common_inst *inst)
+{
+	if ((inst->vsi->config.gop_size != 0 &&
+	     (inst->frm_cnt % inst->vsi->config.gop_size) == 0) ||
+	    (inst->frm_cnt == 0 && inst->vsi->config.gop_size == 0)) {
+		/* IDR frame */
+		return VENC_IDR_FRM;
+	} else if ((inst->vsi->config.intra_period != 0 &&
+		    (inst->frm_cnt % inst->vsi->config.intra_period) == 0) ||
+		   (inst->frm_cnt == 0 &&
+		    inst->vsi->config.intra_period == 0)) {
+		/* I frame */
+		return VENC_I_FRM;
+	} else {
+		return VENC_P_FRM;  /* Note: B frames are not supported */
+	}
+}
+
+static int venc_encode_sps(struct venc_common_inst *inst,
+			   struct mtk_vcodec_mem *bs_buf,
+			   unsigned int *bs_size)
+{
+	int ret = 0;
+	unsigned int irq_status;
+
+	mtk_vcodec_debug_enter(inst);
+
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_SPS, NULL,
+			     bs_buf, bs_size, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_comp_done(inst, MTK_VENC_CORE0);
+	if (irq_status != MTK_VENC_IRQ_STATUS_SPS) {
+		mtk_vcodec_err(inst, "expect irq status %d",
+			       MTK_VENC_IRQ_STATUS_SPS);
+		return -EINVAL;
+	}
+
+	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT,
+				 MTK_VENC_CORE0);
+	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
+
+	return ret;
+}
+
+static int venc_encode_pps(struct venc_common_inst *inst,
+			   struct mtk_vcodec_mem *bs_buf,
+			   unsigned int *bs_size)
+{
+	int ret = 0;
+	unsigned int irq_status;
+
+	mtk_vcodec_debug_enter(inst);
+
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_PPS, NULL,
+			     bs_buf, bs_size, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_comp_done(inst, MTK_VENC_CORE0);
+	if (irq_status != MTK_VENC_IRQ_STATUS_PPS) {
+		mtk_vcodec_err(inst, "expect irq status %d",
+			       MTK_VENC_IRQ_STATUS_PPS);
+		return -EINVAL;
+	}
+
+	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT,
+				 MTK_VENC_CORE0);
+	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
+
+	return ret;
+}
+
+static int venc_encode_header(struct venc_common_inst *inst,
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
+static int venc_encode_frame(struct venc_common_inst *inst,
+			     struct venc_frm_buf *frm_buf,
+			     struct mtk_vcodec_mem *bs_buf,
+			     unsigned int *bs_size,
+			     int hw_id)
+{
+	int ret = 0;
+	struct venc_frame_info frame_info;
+
+	mtk_vcodec_debug_enter(inst);
+	mtk_vcodec_debug(inst, "frm_cnt = %d\n ", inst->frm_cnt);
+	frame_info.frm_count = inst->frm_cnt;
+	frame_info.skip_frm_count = inst->skip_frm_cnt;
+	frame_info.frm_type = venc_frame_type(inst);
+	mtk_vcodec_debug(inst, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
+			 frame_info.frm_count, frame_info.skip_frm_count,
+			 frame_info.frm_type);
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_FRAME, frm_buf,
+			     bs_buf, bs_size, &frame_info);
+	if (ret)
+		return ret;
+
+	++inst->frm_cnt;
+	mtk_vcodec_debug(inst, "frm %d bs_size %d key_frm %d <-",
+			 inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
+
+	return ret;
+}
+
+static void h264_encode_filler(struct venc_common_inst *inst, void *buf,
+			       int size)
+{
+	unsigned char *p = buf;
+
+	if (size < H264_FILLER_MARKER_SIZE) {
+		mtk_vcodec_err(inst, "filler size too small %d", size);
+		return;
+	}
+
+	memcpy(p, h264_filler_marker, ARRAY_SIZE(h264_filler_marker));
+	size -= H264_FILLER_MARKER_SIZE;
+	p += H264_FILLER_MARKER_SIZE;
+	memset(p, 0xff, size);
+}
+
+static int venc_init(struct mtk_vcodec_ctx *ctx)
+{
+	int i;
+	int ret = 0;
+	struct venc_common_inst *inst;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->ctx = ctx;
+	inst->vpu_inst.ctx = ctx;
+	inst->vpu_inst.id = SCP_IPI_VENC_H264;
+
+	mtk_vcodec_debug_enter(inst);
+
+	ret = vpu_enc_init(&inst->vpu_inst);
+
+	inst->vsi = (struct venc_vsi *)inst->vpu_inst.vsi;
+
+	for (i = 0; i < MTK_VENC_HW_MAX; i++)
+		inst->hw_base[i] = mtk_get_venc_comp_reg_addr(ctx, i);
+
+	mtk_vcodec_debug_leave(inst);
+
+	if (ret)
+		kfree(inst);
+	else
+		ctx->drv_handle = inst;
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
+	int ret;
+	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
+	struct mtk_vcodec_ctx *ctx = inst->ctx;
+
+	switch (opt) {
+	case VENC_START_OPT_ENCODE_SEQUENCE_HEADER: {
+		unsigned int bs_size_hdr;
+
+		ret = venc_encode_header(inst, bs_buf, &bs_size_hdr);
+		if (ret) {
+			mtk_vcodec_err(inst, "encode header failed: %d", ret);
+			return ret;
+		}
+
+		result->bs_size = bs_size_hdr;
+		result->is_key_frm = false;
+
+		break;
+	}
+
+	case VENC_START_OPT_ENCODE_FRAME: {
+		int hdr_sz;
+		int hdr_sz_ext;
+		int filler_sz = 0;
+		const int bs_align = 128;
+		struct mtk_vcodec_mem tmp_bs_buf;
+		unsigned int bs_size_hdr;
+		unsigned int bs_size_frm;
+
+		if (!inst->prepend_hdr) {
+			ret = venc_encode_frame(inst, frm_buf, bs_buf,
+						&result->bs_size, ctx->hw_id);
+			if (ret) {
+				mtk_vcodec_err(inst, "encode frame failed: %d",
+					       ret);
+				return ret;
+			}
+
+			result->is_key_frm = inst->vpu_inst.is_key_frm;
+			break;
+		}
+
+		mtk_vcodec_debug(inst, "venc_encode_frame prepend SPS/PPS");
+
+		ret = venc_encode_header(inst, bs_buf, &bs_size_hdr);
+		if (ret) {
+			mtk_vcodec_err(inst, "encode prepend hdr failed: %d",
+				       ret);
+			return ret;
+		}
+
+		hdr_sz = bs_size_hdr;
+		hdr_sz_ext = (hdr_sz & (bs_align - 1));
+		if (hdr_sz_ext) {
+			filler_sz = bs_align - hdr_sz_ext;
+			if (hdr_sz_ext + H264_FILLER_MARKER_SIZE > bs_align)
+				filler_sz += bs_align;
+			h264_encode_filler(inst, bs_buf->va + hdr_sz,
+					   filler_sz);
+		}
+
+		tmp_bs_buf.va = bs_buf->va + hdr_sz + filler_sz;
+		tmp_bs_buf.dma_addr = bs_buf->dma_addr + hdr_sz + filler_sz;
+		tmp_bs_buf.size = bs_buf->size - (hdr_sz + filler_sz);
+
+		ret = venc_encode_frame(inst, frm_buf, &tmp_bs_buf,
+					&bs_size_frm, ctx->hw_id);
+
+		if (ret) {
+			mtk_vcodec_err(inst, "encode hdr frame failed: %d",
+				       ret);
+			return ret;
+		}
+
+		result->bs_size = hdr_sz + filler_sz + bs_size_frm;
+
+		mtk_vcodec_debug(inst, "hdr %d filler %d frame %d bs %d",
+				 hdr_sz, filler_sz, bs_size_frm,
+				 result->bs_size);
+
+		inst->prepend_hdr = 0;
+		result->is_key_frm = inst->vpu_inst.is_key_frm;
+		break;
+	}
+
+	default:
+		mtk_vcodec_err(inst, "venc_start_opt %d not supported", opt);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int venc_set_param(void *handle,
+			  enum venc_set_param_type type,
+			  struct venc_enc_param *enc_prm)
+{
+	int ret = 0;
+	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
+
+	mtk_vcodec_debug(inst, "->type=%d", type);
+
+	switch (type) {
+	case VENC_SET_PARAM_ENC:
+		inst->vsi->config.input_fourcc = enc_prm->input_yuv_fmt;
+		inst->vsi->config.bitrate = enc_prm->bitrate;
+		inst->vsi->config.pic_w = enc_prm->width;
+		inst->vsi->config.pic_h = enc_prm->height;
+		inst->vsi->config.buf_w = enc_prm->buf_width;
+		inst->vsi->config.buf_h = enc_prm->buf_height;
+		inst->vsi->config.gop_size = enc_prm->gop_size;
+		inst->vsi->config.framerate = enc_prm->frm_rate;
+		inst->vsi->config.intra_period = enc_prm->intra_period;
+		inst->vsi->config.profile =
+			h264_get_profile(inst, enc_prm->h264_profile);
+		inst->vsi->config.level =
+			h264_get_level(inst, enc_prm->h264_level);
+		inst->vsi->config.wfd = 0;
+
+		ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
+		if (ret)
+			break;
+		if (inst->work_buf_allocated) {
+			venc_free_work_buf(inst);
+			inst->work_buf_allocated = false;
+		}
+		ret = venc_alloc_work_buf(inst);
+		if (ret)
+			break;
+		inst->work_buf_allocated = true;
+		break;
+
+	case VENC_SET_PARAM_PREPEND_HEADER:
+		inst->prepend_hdr = 1;
+		mtk_vcodec_debug(inst, "set prepend header mode");
+		break;
+	case VENC_SET_PARAM_FORCE_INTRA:
+	case VENC_SET_PARAM_GOP_SIZE:
+	case VENC_SET_PARAM_INTRA_PERIOD:
+		inst->frm_cnt = 0;
+		inst->skip_frm_cnt = 0;
+		fallthrough;
+	default:
+		ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
+		break;
+	}
+
+	mtk_vcodec_debug_leave(inst);
+	return ret;
+}
+
+static int venc_deinit(void *handle)
+{
+	int ret = 0;
+	struct venc_common_inst *inst = (struct venc_common_inst *)handle;
+
+	mtk_vcodec_debug_enter(inst);
+
+	ret = vpu_enc_deinit(&inst->vpu_inst);
+
+	if (inst->work_buf_allocated)
+		venc_free_work_buf(inst);
+
+	mtk_vcodec_debug_leave(inst);
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
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index 6cbdb7e30bb3..93936d002bed 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -25,7 +25,10 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		ctx->enc_if = &venc_vp8_if;
 		break;
 	case V4L2_PIX_FMT_H264:
-		ctx->enc_if = &venc_h264_if;
+		if (MTK_ENC_HW_MODE(ctx) == VENC_FRAME_RACING_MODE)
+			ctx->enc_if = &venc_if;
+		else
+			ctx->enc_if = &venc_h264_if;
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
index 0b04a1020873..8f384ba24ddf 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
@@ -125,6 +125,7 @@ struct venc_done_result {
 
 extern const struct venc_common_if venc_h264_if;
 extern const struct venc_common_if venc_vp8_if;
+extern const struct venc_common_if venc_if;
 
 /*
  * venc_if_init - Create the driver handle
-- 
2.25.1

