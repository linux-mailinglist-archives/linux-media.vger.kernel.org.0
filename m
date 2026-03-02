Return-Path: <linux-media+bounces-54033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBIxLsAJpWky0AUAu9opvQ
	(envelope-from <linux-media+bounces-54033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 04:53:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 177971D2C2D
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 04:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BEDA301ECD4
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 03:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4251A2DEA86;
	Mon,  2 Mar 2026 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SMceiC3W"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6532874F5;
	Mon,  2 Mar 2026 03:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772423583; cv=none; b=ZI3kglHbcXJ2KHPcIqXvHGDpnI1YNl1AQapvdLHsuZE8HEwkW8SZJCkh5Aw3cA9pn72iSwD4b3Zvu5t8KEWN+t7VHwzn1NPM5I+XMlTI4hxu3IhIRvWGO8bGT6oybhGiEbLIOJxOkGd4XqUy4gnt4PJSF2YP7P4ptD8DSgoo8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772423583; c=relaxed/simple;
	bh=WVIazM8oPDMpuIEkI4Rg8T/CNIc2tQ2UzkcrQO2qM9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpIXKK8xGO4hH++9U082mkH45JTl7okQQzi6xN8IP5f3xsScvpq23u9aXbO0ycAsOpPCHQmSV5saO5OKYbfJft8N4nYuF9bchAuMJTakHSSqYFoSAhyH0uZmXE9qNwyoXXP79Chmj9wpb/GUVBjGwi+oF74UZoQDnGhlHgLBvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SMceiC3W; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4819e15015eb11f1bcd7499a721e883d-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nUJLhQynGlJNcg74kMLt+Yf8Uo6EiR4fixoC8dLpRnc=;
	b=SMceiC3WbDhw71zHbhWn9wHp/4y0rkOW579daDtP3ipk8K1YxqJheDwQtd5rDMrBjn3c8DS9tpjTtZ+loFO2dUVWmNudd91Bx/AHOC0ei75RYBPrb4E+YSf+MtatJJhoZKOAiMZ1/NImJ2CZshmI3rTvLorQsjZ9lqsDpy49f7Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:3a7b4081-a30a-445e-80c3-d101a6166110,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:eba5677b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4819e15015eb11f1bcd7499a721e883d-20260302
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1880030546; Mon, 02 Mar 2026 11:52:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Mar 2026 11:52:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Mar 2026 11:52:47 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 1/6] media: mediatek: encoder: Add a new encoder driver interface
Date: Mon, 2 Mar 2026 11:52:38 +0800
Message-ID: <20260302035244.8994-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260302035244.8994-1-irui.wang@mediatek.com>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,chromium.org,collabora.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54033-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,mediatek.com:email,collabora.com:email]
X-Rspamd-Queue-Id: 177971D2C2D
X-Rspamd-Action: no action

Introduce a new encoder kernel driver interface to ensure compatibility
with the updated encoder software driver running in firmware.
The new driver interface is expected to support more encoder formats,
share more encode parameters between kernel and firmware.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  13 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   1 +
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  14 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   8 +-
 .../vcodec/encoder/venc/venc_common_if.c      | 672 ++++++++++++++++++
 .../vcodec/encoder/venc/venc_h264_if.c        |   8 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |  11 +-
 8 files changed, 710 insertions(+), 18 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
index 4ed7639dfa30..0381acceda25 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
@@ -18,6 +18,19 @@ int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);
 
+int mtk_vcodec_fw_get_venc_ipi(enum mtk_vcodec_fw_type type)
+{
+	switch (type) {
+	case SCP:
+		return SCP_IPI_VENC_H264;
+	case VCP:
+		return VCP_IPI_ENCODER;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_venc_ipi);
+
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
 					   enum mtk_vcodec_fw_use fw_use)
 {
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 142e2e87905c..e7304a7dd3e0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -42,5 +42,6 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
 			   void *buf, unsigned int len, unsigned int wait);
 int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
 int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
+int mtk_vcodec_fw_get_venc_ipi(enum mtk_vcodec_fw_type type);
 
 #endif /* _MTK_VCODEC_FW_H_ */
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
index 48cb5dded70a..f0344888f2cf 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -81,11 +81,11 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 		mtk_v4l2_venc_dbg(2, ctx, "V4L2_CID_MPEG_VIDEO_H264_PROFILE val = %d", ctrl->val);
-		p->h264_profile = ctrl->val;
+		p->profile = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 		mtk_v4l2_venc_dbg(2, ctx, "V4L2_CID_MPEG_VIDEO_H264_LEVEL val = %d", ctrl->val);
-		p->h264_level = ctrl->val;
+		p->level = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
 		mtk_v4l2_venc_dbg(2, ctx, "V4L2_CID_MPEG_VIDEO_H264_I_PERIOD val = %d", ctrl->val);
@@ -385,8 +385,8 @@ static void mtk_venc_set_param(struct mtk_vcodec_enc_ctx *ctx,
 		mtk_v4l2_venc_err(ctx, "Unsupported fourcc =%d", q_data_src->fmt->fourcc);
 		break;
 	}
-	param->h264_profile = enc_params->h264_profile;
-	param->h264_level = enc_params->h264_level;
+	param->profile = enc_params->profile;
+	param->level = enc_params->level;
 
 	/* Config visible resolution */
 	param->width = q_data_src->visible_width;
@@ -402,8 +402,8 @@ static void mtk_venc_set_param(struct mtk_vcodec_enc_ctx *ctx,
 
 	mtk_v4l2_venc_dbg(0, ctx,
 			  "fmt 0x%x, P/L %d/%d w/h %d/%d buf %d/%d fps/bps %d/%d gop %d i_per %d",
-			  param->input_yuv_fmt, param->h264_profile,
-			  param->h264_level, param->width, param->height,
+			  param->input_yuv_fmt, param->profile,
+			  param->level, param->width, param->height,
 			  param->buf_width, param->buf_height,
 			  param->frm_rate, param->bitrate,
 			  param->gop_size, param->intra_period);
@@ -1157,6 +1157,8 @@ static void mtk_venc_worker(struct work_struct *work)
 		frm_buf.fb_addr[i].size =
 				(size_t)src_buf->vb2_buf.planes[i].length;
 	}
+	frm_buf.num_planes = src_buf->vb2_buf.num_planes;
+
 	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
 	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 0cddfa13594f..53369adc083b 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -69,8 +69,8 @@ enum mtk_encode_param {
  * @framerate_denom: frame rate denominator. ex: framerate_num=30 and
  *		     framerate_denom=1 means FPS is 30
  * @h264_max_qp: Max value for H.264 quantization parameter
- * @h264_profile: V4L2 defined H.264 profile
- * @h264_level: V4L2 defined H.264 level
+ * @profile: V4L2 defined profile
+ * @level: V4L2 defined level
  * @force_intra: force/insert intra frame
  */
 struct mtk_enc_params {
@@ -84,8 +84,8 @@ struct mtk_enc_params {
 	unsigned int	framerate_num;
 	unsigned int	framerate_denom;
 	unsigned int	h264_max_qp;
-	unsigned int	h264_profile;
-	unsigned int	h264_level;
+	unsigned int	profile;
+	unsigned int	level;
 	unsigned int	force_intra;
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
new file mode 100644
index 000000000000..da7cf90bd54b
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
@@ -0,0 +1,672 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
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
+ * @pic_w: visible width of resolution
+ * @pic_h: visible height of resolution
+ * @buf_w: buffer alignment width of resolution
+ * @buf_h: buffer alignment height of resolution
+ * @gop_size: group of picture size (IDR frame period)
+ * @intra_period: I frame period
+ * @framerate: frame rate in fps
+ * @profile: profile_idc in SPS
+ * @level: level_idc in SPS
+ * @core_num: encoder core num
+ * @dpb_size: encode dpb size
+ * @reserved: reserved fields config
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
+ * @config_data: extended configuration data besides the basic configuration
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
+	inst->vpu_inst.id = mtk_vcodec_fw_get_venc_ipi(ctx->dev->fw_handler->type);
+	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
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
+			inst->vsi->venc.fb_addr[i] = frm_buf->fb_addr[i].dma_addr;
+			inst->vsi->venc.fb_size[i] = frm_buf->fb_addr[i].size;
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
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_SPS, NULL, bs_buf, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_encode_done(inst);
+	if (irq_status != MTK_VENC_IRQ_STATUS_SPS) {
+		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_SPS);
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
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_PPS, NULL, bs_buf, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_encode_done(inst);
+	if (irq_status != MTK_VENC_IRQ_STATUS_PPS) {
+		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_PPS);
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
+	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_FRAME, frm_buf, bs_buf, NULL);
+	if (ret)
+		return ret;
+
+	irq_status = venc_wait_encode_done(inst);
+	if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
+		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_FRM);
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
+	if (WARN_ON(!inst || !inst->vsi))
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
+			ret = venc_encode_frame(inst, frm_buf, bs_buf, &result->bs_size);
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
+		ret = venc_encode_frame(inst, frm_buf, bs_buf, &result->bs_size);
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
+	if (WARN_ON(!dev || !buf))
+		return -EINVAL;
+
+	if (buf->size == 0)
+		return 0;
+
+	buf->va = dma_alloc_coherent(dev, buf->size, &dma_addr, GFP_KERNEL);
+	if (!buf->va)
+		return -ENOMEM;
+
+	buf->iova = (unsigned long long)dma_addr;
+
+	mtk_venc_debug(inst->ctx, "allocate buffer, size: %d, va: %p, iova: 0x%llx",
+		       buf->size, buf->va, buf->iova);
+
+	return 0;
+}
+
+static void mtk_venc_mem_free(struct venc_inst *inst,
+			      struct device *dev,
+			      struct venc_work_buf *buf)
+{
+	if (WARN_ON(!dev || !buf))
+		return;
+
+	if (!buf->va)
+		return;
+
+	mtk_venc_debug(inst->ctx, "free buffer, size: %d, va: %p, iova: 0x%llx",
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
+	struct device *dev;
+
+	dev = &inst->ctx->dev->plat_dev->dev;
+	mtk_venc_mem_free(inst, dev, &bufs->rc_code);
+
+	for (i = 0; i < core_num; i++)
+		mtk_venc_mem_free(inst, dev, &bufs->rc_info[i]);
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
+	dev = &inst->ctx->dev->plat_dev->dev;
+	if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
+		return -ENOMEM;
+
+	tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
+	memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
+
+	for (i = 0; i < core_num; i++) {
+		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
+			goto err_rc_buf;
+	}
+
+	return 0;
+
+err_rc_buf:
+	venc_free_rc_buf(inst, bufs, core_num);
+
+	return -ENOMEM;
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
+			return -ENOMEM;
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
+		if (WARN_ON(!inst->vsi))
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
+		inst->vsi->config.profile = enc_prm->profile;
+		inst->vsi->config.level = enc_prm->level;
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
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index 0f63657d8bad..4160dc995806 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -723,9 +723,9 @@ static void h264_enc_set_vsi_configs(struct venc_h264_inst *inst,
 	inst->vsi->config.framerate = enc_prm->frm_rate;
 	inst->vsi->config.intra_period = enc_prm->intra_period;
 	inst->vsi->config.profile =
-		h264_get_profile(inst, enc_prm->h264_profile);
+		h264_get_profile(inst, enc_prm->profile);
 	inst->vsi->config.level =
-		h264_get_level(inst, enc_prm->h264_level);
+		h264_get_level(inst, enc_prm->level);
 	inst->vsi->config.wfd = 0;
 }
 
@@ -742,9 +742,9 @@ static void h264_enc_set_vsi_34_configs(struct venc_h264_inst *inst,
 	inst->vsi_34->config.framerate = enc_prm->frm_rate;
 	inst->vsi_34->config.intra_period = enc_prm->intra_period;
 	inst->vsi_34->config.profile =
-		h264_get_profile(inst, enc_prm->h264_profile);
+		h264_get_profile(inst, enc_prm->profile);
 	inst->vsi_34->config.level =
-		h264_get_level(inst, enc_prm->h264_level);
+		h264_get_level(inst, enc_prm->level);
 	inst->vsi_34->config.wfd = 0;
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
index 889440a436b6..3c2a1b5e9312 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
@@ -66,8 +66,8 @@ enum venc_set_param_type {
  * struct venc_enc_prm - encoder settings for VENC_SET_PARAM_ENC used in
  *					  venc_if_set_param()
  * @input_fourcc: input yuv format
- * @h264_profile: V4L2 defined H.264 profile
- * @h264_level: V4L2 defined H.264 level
+ * @profile: V4L2 defined profile
+ * @level: V4L2 defined level
  * @width: image width
  * @height: image height
  * @buf_width: buffer width
@@ -79,8 +79,8 @@ enum venc_set_param_type {
  */
 struct venc_enc_param {
 	enum venc_yuv_fmt input_yuv_fmt;
-	unsigned int h264_profile;
-	unsigned int h264_level;
+	unsigned int profile;
+	unsigned int level;
 	unsigned int width;
 	unsigned int height;
 	unsigned int buf_width;
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
2.45.2


