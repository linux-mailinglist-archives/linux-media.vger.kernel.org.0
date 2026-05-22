Return-Path: <linux-media+bounces-62590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFJZJp8uEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:23:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE3C5B1FEC
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25E57302E90E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4F63D6CD6;
	Fri, 22 May 2026 10:18:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DC3D525A;
	Fri, 22 May 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445125; cv=none; b=cuBXw8/urqPRkm2uWAXsLfrmC1yw34kMhvMn4AQTLka0TkKvpYnmvY+zhEUDPvNerkj0q13otNS2L0m9Mfy0217lDDaM8q+fBsz6WWzS0w0I26WdBOoxXpLoIKkyP+UR0abEjYiEuHf+6md3ByYZADSGItomYt+tDTg6o6AWUJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445125; c=relaxed/simple;
	bh=OlzqJU5To5PwDP+GqBDgrPlPqor1Q5uzuNtmx77Sbl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=So4M46AsyLSHx+1tev1M+QSDXv/ocLSDMnN7GUH7oManbWQJYusaSmtTvBs6uE4PdqSrVVMW1e6FS32OadDm32CDinTb/NbOnqkPAOCnNQrXEQ8uBqjs9IevZ1JDrRcgHQOZUGgKPv7SR1ZKqJJHPBkj066jrdmRdJZtaVV1FsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id AC83A37002A1;
	Fri, 22 May 2026 10:18:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1E0AFB408D9; Fri, 22 May 2026 10:18:19 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 21D3FB408D2;
	Fri, 22 May 2026 10:17:18 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 12/14] media: verisilicon: Add support for the VC8000E H.264 encoder
Date: Fri, 22 May 2026 12:16:51 +0200
Message-ID: <20260522101653.2565125-13-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62590-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.607];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sys-base.io:mid,sys-base.io:email]
X-Rspamd-Queue-Id: 1AE3C5B1FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This introduces support for the Hantro VC8000E H.264 encoder,
a stateless hardware encoder from Verisilicon.

This driver is the first user of the V4L2 H.264 stateless encoding
core and uAPI.

The hardware needs to be programmed in a sequential way (registers
written in ascending offset order) so the registers are programmed
in a memory buffer first and copied in order at the end.
They are described as packed structured for convenience and should
also contain all required definitions for HEVC and JPEG support.

Only a single reference frame is currently supported, even though
the registers seems to indicate that two could be supported.
More research and investigation is needed to operate two.

The lambda tables are currently hardcoded to generally reasonable
values but could be recalculated for each target QP to give more
accurate results.

Most other features of the encoder are supported, except ROI and
intra areas support which are currently disabled.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/platform/verisilicon/Kconfig    |    1 +
 drivers/media/platform/verisilicon/Makefile   |    2 +
 drivers/media/platform/verisilicon/hantro.h   |   14 +
 .../media/platform/verisilicon/hantro_drv.c   |  152 +-
 .../media/platform/verisilicon/hantro_h264.c  |    6 +-
 .../media/platform/verisilicon/hantro_hw.h    |   27 +
 .../media/platform/verisilicon/hantro_v4l2.c  |    6 +
 .../platform/verisilicon/hantro_vc8000e.c     |   68 +
 .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
 .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
 10 files changed, 3279 insertions(+), 9 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_regs.h

diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/platform/verisilicon/Kconfig
index 3272a24db71d..ae186a848e24 100644
--- a/drivers/media/platform/verisilicon/Kconfig
+++ b/drivers/media/platform/verisilicon/Kconfig
@@ -12,6 +12,7 @@ config VIDEO_HANTRO
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	select V4L2_H264
+	select V4L2_H264_ENC
 	select V4L2_JPEG_HELPER
 	select V4L2_VP9
 	help
diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index f6f019d04ff0..caa32de29ab7 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -7,6 +7,8 @@ hantro-vpu-y += \
 		hantro_v4l2.o \
 		hantro_postproc.o \
 		hantro_h1_jpeg_enc.o \
+		hantro_vc8000e.o \
+		hantro_vc8000e_h264_enc.o \
 		hantro_g1.o \
 		hantro_g1_h264_dec.o \
 		hantro_g1_mpeg2_dec.o \
diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index badd0b13988c..b21c16dd6c1b 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -32,6 +32,7 @@ struct hantro_codec_ops;
 struct hantro_postproc_ops;
 
 #define HANTRO_JPEG_ENCODER	BIT(0)
+#define HANTRO_H264_ENCODER	BIT(1)
 #define HANTRO_ENCODERS		0x0000ffff
 #define HANTRO_MPEG2_DECODER	BIT(16)
 #define HANTRO_VP8_DECODER	BIT(17)
@@ -107,6 +108,7 @@ struct hantro_variant {
  * enum hantro_codec_mode - codec operating mode.
  * @HANTRO_MODE_NONE:  No operating mode. Used for RAW video formats.
  * @HANTRO_MODE_JPEG_ENC: JPEG encoder.
+ * @HANTRO_MODE_H264_ENC: H264 encoder.
  * @HANTRO_MODE_H264_DEC: H264 decoder.
  * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
  * @HANTRO_MODE_VP8_DEC: VP8 decoder.
@@ -117,6 +119,7 @@ struct hantro_variant {
 enum hantro_codec_mode {
 	HANTRO_MODE_NONE = -1,
 	HANTRO_MODE_JPEG_ENC,
+	HANTRO_MODE_H264_ENC,
 	HANTRO_MODE_H264_DEC,
 	HANTRO_MODE_MPEG2_DEC,
 	HANTRO_MODE_VP8_DEC,
@@ -272,6 +275,7 @@ struct hantro_ctx {
 	/* Specific for particular codec modes. */
 	union {
 		struct hantro_h264_dec_hw_ctx h264_dec;
+		struct hantro_h264_enc_hw_ctx h264_enc;
 		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
 		struct hantro_vp8_dec_hw_ctx vp8_dec;
 		struct hantro_hevc_dec_hw_ctx hevc_dec;
@@ -466,6 +470,16 @@ static __always_inline void hantro_reg_write_relaxed(struct hantro_dev *vpu,
 	vdpu_write_relaxed(vpu, vdpu_read_mask(vpu, reg, val), reg->base);
 }
 
+static __always_inline void hantro_io_copy(void __iomem *dst, void *src,
+					   size_t size)
+{
+#ifdef CONFIG_ARM64
+	__iowrite32_copy(dst, src, size / 4);
+#else
+	memcpy_toio(dst, src, size);
+#endif
+}
+
 void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id);
 dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts);
 
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index d798ba361b25..2de27f0a2be0 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -420,6 +420,8 @@ static const struct v4l2_ctrl_ops hantro_av1_ctrl_ops = {
 					 V4L2_JPEG_ACTIVE_MARKER_DHT)
 
 static const struct hantro_ctrl controls[] = {
+	/* JPEG Encoder */
+
 	{
 		.codec = HANTRO_JPEG_ENCODER,
 		.cfg = {
@@ -446,7 +448,127 @@ static const struct hantro_ctrl controls[] = {
 			 */
 			.flags = V4L2_CTRL_FLAG_READ_ONLY,
 		},
+	},
+
+	/* H.264 Encoder */
+
+	{
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_ENCODE_PARAMS,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_SPS,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_PPS,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_START_CODE,
+			.min = V4L2_STATELESS_H264_START_CODE_NONE,
+			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+			.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
+			.step = 1,
+			.min = 0,
+			.max = 1,
+			.def = 0,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			.step = 1,
+			.min = 0,
+			.max = 1,
+			.def = 0,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+			.step = 1,
+			.min = 0,
+			.max = 1,
+			.def = 0,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+			.step = 1,
+			.min = 0,
+			.max = 51,
+			.def = 0,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+			.step = 1,
+			.min = 0,
+			.max = 51,
+			.def = 51,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
+			.step = 1,
+			.min = 0,
+			.max = 51,
+			.def = 24,
+		},
 	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
+			.step = 1,
+			.min = 0,
+			.max = 51,
+			.def = 28,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+			.min = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+			.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CQ,
+			.def = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY,
+			.step = 1,
+			.min = 0,
+			.max = 100,
+			.def = 80,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_BITRATE,
+			.step = 1,
+			.min = 1000,
+			.max = 96000000,
+			.def = 2000000,
+		},
+	},
+
+	/* MPEG-2 Decoder */
+
+	{
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE,
@@ -461,7 +583,11 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION,
 		},
-	}, {
+	},
+
+	/* VP8 Decoder */
+
+	{
 		.codec = HANTRO_VP8_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_VP8_FRAME,
@@ -471,7 +597,11 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
 		},
-	}, {
+	},
+
+	/* H.264 Decoder */
+
+	{
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_H264_SPS,
@@ -513,7 +643,11 @@ static const struct hantro_ctrl controls[] = {
 			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
 			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 		}
-	}, {
+	},
+
+	/* HEVC Decoder */
+
+	{
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
@@ -565,7 +699,11 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
 		},
-	}, {
+	},
+
+	/* VP9 Decoder */
+
+	{
 		.codec = HANTRO_VP9_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_VP9_FRAME,
@@ -576,7 +714,11 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
 		},
-	}, {
+	},
+
+	/* AV1 Decoder */
+
+	{
 		.codec = HANTRO_AV1_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_AV1_FRAME,
diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 2414782f1eb6..d71e041010ad 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -453,13 +453,11 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 	if (WARN_ON(!ctrls->decode))
 		return -EINVAL;
 
-	ctrls->sps =
-		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_SPS);
+	ctrls->sps = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_SPS);
 	if (WARN_ON(!ctrls->sps))
 		return -EINVAL;
 
-	ctrls->pps =
-		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_PPS);
+	ctrls->pps = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_PPS);
 	if (WARN_ON(!ctrls->pps))
 		return -EINVAL;
 
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index c9b6556f8b2b..a0c752ef44dd 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -12,11 +12,13 @@
 #include <linux/interrupt.h>
 #include <linux/v4l2-controls.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-h264-enc.h>
 #include <media/v4l2-vp9.h>
 #include <media/videobuf2-core.h>
 
 #include "rockchip_av1_entropymode.h"
 #include "rockchip_av1_filmgrain.h"
+#include "hantro_vc8000e_regs.h"
 
 #define DEC_8190_ALIGN_MASK	0x07U
 
@@ -69,6 +71,22 @@ struct hantro_aux_buf {
 	unsigned long attrs;
 };
 
+struct hantro_vc8000e_rec_buf {
+	struct hantro_aux_buf luma;
+	struct hantro_aux_buf chroma;
+	struct hantro_aux_buf luma_4n;
+	struct hantro_aux_buf colctbs;
+};
+
+struct hantro_h264_enc_hw_ctx {
+	struct v4l2_h264_enc enc;
+	struct hantro_aux_buf nal_tbl;
+
+	union {
+		struct hantro_vc8000e_regs vc8000e_regs;
+	};
+};
+
 /* Max. number of entries in the DPB (HW limitation). */
 #define HANTRO_H264_DPB_SIZE		16
 
@@ -451,6 +469,15 @@ int hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
 void hantro_h264_dec_exit(struct hantro_ctx *ctx);
 
+irqreturn_t hantro_vc8000e_irq(int irq, void *dev_id);
+int hantro_vc8000e_h264_enc_init(struct hantro_ctx *ctx);
+void hantro_vc8000e_h264_enc_exit(struct hantro_ctx *ctx);
+void hantro_vc8000e_h264_enc_done(struct hantro_ctx *ctx);
+int hantro_vc8000e_h264_enc_run(struct hantro_ctx *ctx);
+int hantro_h264_enc_prepare_run(struct hantro_ctx *ctx);
+int hantro_h264_enc_init(struct hantro_ctx *ctx);
+void hantro_h264_enc_exit(struct hantro_ctx *ctx);
+
 int hantro_hevc_dec_init(struct hantro_ctx *ctx);
 void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
 int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2125f2913d9a..96b72c1f37db 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -629,6 +629,12 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 				     hantro_get_format_depth(pix_mp->pixelformat),
 				     need_postproc);
 
+	/* Propagate dimensions for encoders. */
+	if (ctx->is_encoder) {
+		ctx->dst_fmt.width = pix_mp->width;
+		ctx->dst_fmt.height = pix_mp->height;
+	}
+
 	/* Colorimetry information are always propagated. */
 	ctx->dst_fmt.colorspace = pix_mp->colorspace;
 	ctx->dst_fmt.ycbcr_enc = pix_mp->ycbcr_enc;
diff --git a/drivers/media/platform/verisilicon/hantro_vc8000e.c b/drivers/media/platform/verisilicon/hantro_vc8000e.c
new file mode 100644
index 000000000000..ebd726e13460
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_vc8000e.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#include "hantro.h"
+#include "hantro_vc8000e_regs.h"
+
+irqreturn_t hantro_vc8000e_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	u32 regs_buffer[HANTRO_VC8000E_SWREG_OFFSET(swreg6) / 4];
+	struct hantro_vc8000e_regs *regs =
+		(struct hantro_vc8000e_regs *)regs_buffer;
+	enum vb2_buffer_state state;
+
+	hantro_vc8000e_swreg_read(vpu, regs, swreg1);
+
+	pr_debug("+ hantro-vc8000e-irq: %#x\n",
+		 regs_buffer[HANTRO_VC8000E_SWREG_OFFSET(swreg1) / 4]);
+
+	if (regs->swreg1.irq)
+		pr_debug("  - irq\n");
+	if (regs->swreg1.frame_rdy_status)
+		pr_debug("  - frame ready\n");
+	if (regs->swreg1.bus_error_status)
+		pr_debug("  - bus error\n");
+	if (regs->swreg1.sw_reset)
+		pr_debug("  - sw reset\n");
+	if (regs->swreg1.buffer_full)
+		pr_debug("  - buffer full\n");
+	if (regs->swreg1.timeout)
+		pr_debug("  - timeout\n");
+	if (regs->swreg1.slice_rdy_status)
+		pr_debug("  - slice ready\n");
+	if (regs->swreg1.irq_fuse_error)
+		pr_debug("  - fuse error\n");
+	if (regs->swreg1.strm_segment_rdy_int)
+		pr_debug("  - segment ready\n");
+
+	hantro_vc8000e_swreg_read(vpu, regs, swreg4);
+	hantro_vc8000e_swreg_read(vpu, regs, swreg5);
+
+	/* Make sure to disble the encoder on error for safety. */
+	if ((regs->swreg1.bus_error_status ||
+	     regs->swreg1.buffer_full ||
+	     regs->swreg1.timeout ||
+	     regs->swreg1.irq_fuse_error) &&
+	    (regs->swreg4.mode == HANTRO_VC8000E_SWREG4_MODE_H264 ||
+	     regs->swreg4.mode == HANTRO_VC8000E_SWREG4_MODE_HEVC)) {
+		regs->swreg5.enable = 0;
+		hantro_vc8000e_swreg_write(vpu, regs, swreg5);
+	}
+
+	state = regs->swreg1.frame_rdy_status ? VB2_BUF_STATE_DONE :
+						VB2_BUF_STATE_ERROR;
+
+	regs->swreg1.irq_dis = 1;
+	regs->swreg1.timeout_int = 0;
+
+	hantro_vc8000e_swreg_write(vpu, regs, swreg1);
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c b/drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
new file mode 100644
index 000000000000..d3522d61443d
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
@@ -0,0 +1,883 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2024 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#include <linux/unaligned.h>
+#include <linux/delay.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-h264-enc-rbsp.h>
+
+#include "hantro.h"
+#include "hantro_hw.h"
+#include "hantro_vc8000e_regs.h"
+
+static int
+hantro_vc8000e_h264_enc_state_constrain(struct v4l2_h264_enc *enc,
+					struct v4l2_h264_enc_state *state)
+{
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_ctrl_h264_pps *pps = &state->pps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+
+	/* SPS */
+
+	if (V4L2_H264_SPS_HAS_CHROMA_FORMAT(sps)) {
+		sps->chroma_format_idc = 1;
+		sps->flags &= ~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
+		sps->bit_depth_luma_minus8 = 0;
+		sps->bit_depth_chroma_minus8 = 0;
+		sps->flags &= ~V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS;
+	}
+
+	/* Only one reference frame is currently supported. */
+	if (sps->max_num_ref_frames > 1)
+		sps->max_num_ref_frames = 1;
+
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)) {
+		sps->flags |= V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY;
+		sps->flags &= ~V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD;
+	}
+
+	sps->flags |= V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE;
+
+	/* PPS */
+
+	/* Only one reference frame is currently supported. */
+	pps->num_ref_idx_l0_default_active_minus1 = 0;
+	pps->num_ref_idx_l1_default_active_minus1 = 0;
+
+	/* Encode */
+
+	/* Only a single bit is available for idr_pic_id. */
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC)
+		encode->idr_pic_id &= 1;
+
+	/* The hardware doesn't allow overriding the active list numbers. */
+	if (encode->flags & V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE) {
+		encode->flags &= ~V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE;
+
+		encode->num_ref_idx_l0_active_minus1 = 0;
+		encode->num_ref_idx_l1_active_minus1 = 0;
+	}
+
+	/* Only a single bit is available for cabac_init_idc. */
+	if (encode->cabac_init_idc > 1)
+		encode->cabac_init_idc = 1;
+
+	/* Only a single bit is available for disable_deblocking_filter_idc. */
+	if (encode->disable_deblocking_filter_idc > 1)
+		encode->disable_deblocking_filter_idc = 1;
+
+	return 0;
+}
+
+static int
+hantro_vc8000e_h264_enc_rec_buffer_alloc(struct v4l2_h264_enc *enc,
+					 struct v4l2_h264_enc_rec_buffer *buffer)
+{
+	struct hantro_ctx *ctx = enc->private_data;
+	struct device *dev = ctx->dev->dev;
+	struct hantro_vc8000e_rec_buf *rec_buf;
+	unsigned int width_mbs, height_mbs;
+
+	width_mbs = MB_WIDTH(ctx->src_fmt.width);
+	height_mbs = MB_HEIGHT(ctx->src_fmt.height);
+
+	rec_buf = kzalloc(sizeof(*rec_buf), GFP_KERNEL);
+	if (!rec_buf)
+		goto error;
+
+	rec_buf->luma.size = ctx->src_fmt.width * ctx->src_fmt.height;
+	rec_buf->luma.cpu = dma_alloc_coherent(dev, rec_buf->luma.size,
+					       &rec_buf->luma.dma, GFP_KERNEL);
+	if (!rec_buf->luma.cpu)
+		goto error;
+
+	rec_buf->chroma.size = rec_buf->luma.size / 2;
+	rec_buf->chroma.cpu = dma_alloc_coherent(dev, rec_buf->chroma.size,
+						 &rec_buf->chroma.dma,
+						 GFP_KERNEL);
+	if (!rec_buf->chroma.cpu)
+		goto error;
+
+	rec_buf->luma_4n.size = width_mbs * 4 * height_mbs * 4;
+	rec_buf->luma_4n.cpu = dma_alloc_coherent(dev, rec_buf->luma_4n.size,
+						  &rec_buf->luma_4n.dma,
+						  GFP_KERNEL);
+	if (!rec_buf->luma_4n.cpu)
+		goto error;
+
+	rec_buf->colctbs.size = DIV_ROUND_UP(width_mbs * height_mbs, 2);
+	rec_buf->colctbs.cpu = dma_alloc_coherent(dev, rec_buf->colctbs.size,
+						  &rec_buf->colctbs.dma,
+						  GFP_KERNEL);
+	if (!rec_buf->colctbs.cpu)
+		goto error;
+
+	buffer->private_data = rec_buf;
+
+	return 0;
+
+error:
+	if (rec_buf)
+		kfree(rec_buf);
+
+	return -ENOMEM;
+}
+
+static int
+hantro_vc8000e_h264_enc_rec_buffer_free(struct v4l2_h264_enc *enc,
+					struct v4l2_h264_enc_rec_buffer *buffer)
+{
+	struct hantro_ctx *ctx = enc->private_data;
+	struct device *dev = ctx->dev->dev;
+	struct hantro_vc8000e_rec_buf *rec_buf = buffer->private_data;
+
+	if (!rec_buf)
+		return -EINVAL;
+
+	dma_free_coherent(dev, rec_buf->luma.size, rec_buf->luma.cpu,
+			  rec_buf->luma.dma);
+
+	dma_free_coherent(dev, rec_buf->luma_4n.size, rec_buf->luma_4n.cpu,
+			  rec_buf->luma_4n.dma);
+
+	dma_free_coherent(dev, rec_buf->chroma.size, rec_buf->chroma.cpu,
+			  rec_buf->chroma.dma);
+
+	dma_free_coherent(dev, rec_buf->colctbs.size, rec_buf->colctbs.cpu,
+			  rec_buf->colctbs.dma);
+
+	kfree(rec_buf);
+	buffer->private_data = NULL;
+
+	return 0;
+}
+
+static const struct v4l2_h264_enc_ops hantro_vc8000e_h264_enc_ops = {
+	.state_constrain	= hantro_vc8000e_h264_enc_state_constrain,
+	.rec_buffer_alloc	= hantro_vc8000e_h264_enc_rec_buffer_alloc,
+	.rec_buffer_free	= hantro_vc8000e_h264_enc_rec_buffer_free,
+};
+
+int hantro_vc8000e_h264_enc_init(struct hantro_ctx *ctx)
+{
+	struct hantro_h264_enc_hw_ctx *h264_ctx = &ctx->h264_enc;
+	struct hantro_aux_buf *nal_tbl = &h264_ctx->nal_tbl;
+	struct v4l2_h264_enc *enc = &h264_ctx->enc;
+	struct device *dev = ctx->dev->dev;
+
+	nal_tbl->size = ALIGN(MB_HEIGHT(ctx->src_fmt.height), 8);
+	nal_tbl->cpu = dma_alloc_coherent(dev, nal_tbl->size,
+					  &nal_tbl->dma, GFP_KERNEL);
+	if (!nal_tbl->cpu)
+		return -ENOMEM;
+
+	enc->ops = &hantro_vc8000e_h264_enc_ops;
+	enc->private_data = ctx;
+	enc->format_mplane = &ctx->dst_fmt;
+	enc->timeperframe = &ctx->dst_timeperframe;
+	enc->ctrl_handler = &ctx->ctrl_handler;
+	enc->ref_slots_count_init = 2;
+	enc->flags = V4L2_H264_ENC_FLAG_INTER_PRED |
+		     V4L2_H264_ENC_FLAG_HW_SLICE_HEADER;
+
+	return v4l2_h264_enc_init(enc);
+}
+
+void hantro_vc8000e_h264_enc_exit(struct hantro_ctx *ctx)
+{
+	struct hantro_h264_enc_hw_ctx *h264_ctx = &ctx->h264_enc;
+	struct hantro_aux_buf *nal_tbl = &h264_ctx->nal_tbl;
+	struct device *dev = ctx->dev->dev;
+
+	if (nal_tbl->cpu)
+		dma_free_coherent(dev, nal_tbl->size, nal_tbl->cpu,
+				  nal_tbl->dma);
+
+	v4l2_h264_enc_exit(&h264_ctx->enc);
+}
+
+static int ref_setup(struct hantro_ctx *ctx)
+{
+	struct hantro_h264_enc_hw_ctx *h264_ctx = &ctx->h264_enc;
+	struct hantro_vc8000e_regs *regs = &h264_ctx->vc8000e_regs;
+	struct v4l2_h264_enc *enc = &h264_ctx->enc;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_dpb_entry *dpb_entry;
+	struct v4l2_h264_enc_rec_buffer *buffer;
+	struct hantro_vc8000e_rec_buf *rec_buf;
+	bool ltr_present = false;
+	unsigned int index;
+
+	regs->swreg193.nal_ref_idc = encode->nal_ref_idc != 0;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE) {
+		regs->swreg198.mark_current_longterm = 1;
+		/* We only get a single long-term reference without MMCO. */
+		regs->swreg194.cur_longtermidx = 0;
+	}
+
+	regs->swreg193.l0_used_by_next_pic0 = 1;
+	regs->swreg193.l0_used_by_next_pic1 = 1;
+	regs->swreg194.l1_used_by_next_pic0 = 1;
+	regs->swreg194.l1_used_by_next_pic1 = 1;
+
+	regs->swreg17.active_l0_cnt = ref->l0_active_count;
+	regs->swreg91.active_l1_cnt = ref->l1_active_count;
+	regs->swreg4.active_override_flag = 1;
+
+	if (ref->l0_active_count > 0) {
+		index = ref->l0[0].index;
+		dpb_entry = &ref->dpb[index];
+		buffer = &ref->buffers[index];
+		rec_buf = buffer->private_data;
+
+		regs->swreg18.refpic_recon_l0_y0 = rec_buf->luma.dma;
+		regs->swreg19.refpic_recon_l0_chroma0 = rec_buf->chroma.dma;
+		regs->swreg74.refpic_recon_l0_4n0_base = rec_buf->luma_4n.dma;
+
+		regs->swreg17.l0_used_by_curr_pic0 = 1;
+		/* TODO: diff with wrap. */
+		regs->swreg17.l0_delta_poc0 = 1;
+		regs->swreg193.l0_delta_framenum0 = 1;
+
+		if (dpb_entry->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) {
+			regs->swreg17.l0_long_term_flag0 = 1;
+			regs->swreg198.l0_longtermidx0 = 0;
+			ltr_present = true;
+		}
+	}
+
+	if (ref->l0_active_count > 1) {
+		index = ref->l0[1].index;
+		dpb_entry = &ref->dpb[index];
+		buffer = &ref->buffers[index];
+		rec_buf = buffer->private_data;
+
+		regs->swreg20.refpic_recon_l0_y1 = rec_buf->luma.dma;
+		regs->swreg21.refpic_recon_l0_chroma1 = rec_buf->chroma.dma;
+		regs->swreg76.refpic_recon_l0_4n1_base = rec_buf->luma_4n.dma;
+
+		regs->swreg17.l0_used_by_curr_pic1 = 1;
+		/* TODO: diff with wrap. */
+		regs->swreg17.l0_delta_poc1 = 1;
+		regs->swreg193.l0_delta_framenum1 = 1;
+
+		if (dpb_entry->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) {
+			regs->swreg17.l0_long_term_flag1 = 1;
+			regs->swreg198.l0_longtermidx1 = 0;
+			ltr_present = true;
+		}
+	}
+
+	if (ltr_present)
+		regs->swreg91.long_term_ref_pics_present_flag = 1;
+
+	return 0;
+}
+
+static int lambda_setup(struct hantro_ctx *ctx)
+{
+	struct hantro_h264_enc_hw_ctx *h264_ctx = &ctx->h264_enc;
+	struct hantro_vc8000e_regs *regs = &h264_ctx->vc8000e_regs;
+
+	/* Intra SATD */
+
+	regs->swreg125.intra_satd_lambda_0 = 0x47;
+	regs->swreg125.intra_satd_lambda_1 = 0x3f;
+	regs->swreg126.intra_satd_lambda_2 = 0x38;
+	regs->swreg126.intra_satd_lambda_3 = 0x32;
+	regs->swreg127.intra_satd_lambda_4 = 0;
+	regs->swreg127.intra_satd_lambda_5 = 0;
+	regs->swreg128.intra_satd_lambda_6 = 0;
+	regs->swreg128.intra_satd_lambda_7 = 0;
+	regs->swreg129.intra_satd_lambda_8 = 0;
+	regs->swreg129.intra_satd_lambda_9 = 0;
+	regs->swreg130.intra_satd_lambda_10 = 0;
+	regs->swreg130.intra_satd_lambda_11 = 0;
+	regs->swreg131.intra_satd_lambda_12 = 0;
+	regs->swreg131.intra_satd_lambda_13 = 0;
+	regs->swreg132.intra_satd_lambda_14 = 0;
+	regs->swreg132.intra_satd_lambda_15 = 0;
+	regs->swreg174.intra_satd_lambda_16 = 0x1c4;
+	regs->swreg174.intra_satd_lambda_17 = 0x192;
+	regs->swreg175.intra_satd_lambda_18 = 0x166;
+	regs->swreg175.intra_satd_lambda_19 = 0x13f;
+	regs->swreg176.intra_satd_lambda_20 = 0x11c;
+	regs->swreg176.intra_satd_lambda_21 = 0xfd;
+	regs->swreg177.intra_satd_lambda_22 = 0xe2;
+	regs->swreg177.intra_satd_lambda_23 = 0xc9;
+	regs->swreg178.intra_satd_lambda_24 = 0xb3;
+	regs->swreg178.intra_satd_lambda_25 = 0xa0;
+	regs->swreg179.intra_satd_lambda_26 = 0x8e;
+	regs->swreg179.intra_satd_lambda_27 = 0x7f;
+	regs->swreg180.intra_satd_lambda_28 = 0x71;
+	regs->swreg180.intra_satd_lambda_29 = 0x65;
+	regs->swreg181.intra_satd_lambda_30 = 0x5a;
+	regs->swreg181.intra_satd_lambda_31 = 0x50;
+
+	/* Inter SATD */
+
+	regs->swreg28.lambda_satd_me_0 = 0x24;
+	regs->swreg28.lambda_satd_me_1 = 0x20;
+	regs->swreg29.lambda_satd_me_2 = 0x1c;
+	regs->swreg29.lambda_satd_me_3 = 0x19;
+	regs->swreg30.lambda_satd_me_4 = 0x16;
+	regs->swreg30.lambda_satd_me_5 = 0x14;
+	regs->swreg31.lambda_satd_me_6 = 0x12;
+	regs->swreg31.lambda_satd_me_7 = 0x10;
+	regs->swreg32.lambda_satd_me_8 = 0xe;
+	regs->swreg32.lambda_satd_me_9 = 0xd;
+	regs->swreg33.lambda_satd_me_10 = 0xb;
+	regs->swreg33.lambda_satd_me_11 = 0xa;
+	regs->swreg34.lambda_satd_me_12 = 0x9;
+	regs->swreg34.lambda_satd_me_13 = 0x8;
+	regs->swreg78.lambda_satd_me_14 = 0x7;
+	regs->swreg78.lambda_satd_me_15 = 0x6;
+	regs->swreg150.lambda_satd_me_16 = 0;
+	regs->swreg150.lambda_satd_me_17 = 0;
+	regs->swreg151.lambda_satd_me_18 = 0;
+	regs->swreg151.lambda_satd_me_19 = 0;
+	regs->swreg152.lambda_satd_me_20 = 0x88;
+	regs->swreg152.lambda_satd_me_21 = 0;
+	regs->swreg153.lambda_satd_me_22 = 0;
+	regs->swreg153.lambda_satd_me_23 = 0;
+	regs->swreg154.lambda_satd_me_24 = 0;
+	regs->swreg154.lambda_satd_me_25 = 0;
+	regs->swreg155.lambda_satd_me_26 = 0;
+	regs->swreg155.lambda_satd_me_27 = 0;
+	regs->swreg156.lambda_satd_me_28 = 0;
+	regs->swreg156.lambda_satd_me_29 = 0;
+	regs->swreg157.lambda_satd_me_30 = 0;
+	regs->swreg157.lambda_satd_me_31 = 0;
+
+	/* Inter SSE */
+
+	regs->swreg79.lambda_sse_me_0 = 0x4f;
+	regs->swreg122.lambda_sse_me_1 = 0x3f;
+	regs->swreg123.lambda_sse_me_2 = 0x32;
+	regs->swreg124.lambda_sse_me_3 = 0x28;
+	regs->swreg138.lambda_sse_me_4 = 0;
+	regs->swreg139.lambda_sse_me_5 = 0;
+	regs->swreg140.lambda_sse_me_6 = 0;
+	regs->swreg141.lambda_sse_me_7 = 0;
+	regs->swreg142.lambda_sse_me_8 = 0;
+	regs->swreg143.lambda_sse_me_9 = 0;
+	regs->swreg144.lambda_sse_me_10 = 0;
+	regs->swreg145.lambda_sse_me_11 = 0;
+	regs->swreg146.lambda_sse_me_12 = 0;
+	regs->swreg147.lambda_sse_me_13 = 0;
+	regs->swreg148.lambda_sse_me_14 = 0;
+	regs->swreg149.lambda_sse_me_15 = 0;
+	regs->swreg158.lambda_sse_me_16 = 0;
+	regs->swreg159.lambda_sse_me_17 = 0x800;
+	regs->swreg160.lambda_sse_me_18 = 0;
+	regs->swreg161.lambda_sse_me_19 = 0;
+	regs->swreg162.lambda_sse_me_20 = 0;
+	regs->swreg163.lambda_sse_me_21 = 0;
+	regs->swreg164.lambda_sse_me_22 = 0;
+	regs->swreg165.lambda_sse_me_23 = 0;
+	regs->swreg166.lambda_sse_me_24 = 0;
+	regs->swreg167.lambda_sse_me_25 = 0;
+	regs->swreg168.lambda_sse_me_26 = 0x13c;
+	regs->swreg169.lambda_sse_me_27 = 0xfb;
+	regs->swreg172.lambda_sse_me_30 = 0x7d;
+	regs->swreg173.lambda_sse_me_31 = 0x64;
+
+	regs->swreg35.lambda_motion_sse = 0;
+
+	if (regs->swreg214.hwabsqpsupport) {
+		/* Used for lambda calculation, different intra/inter value. */
+		regs->swreg170_qp_absolute.sse_qp_factor = 0x1f5c;
+		regs->swreg171_qp_absolute.sad_qp_factor = 0x2ccd;
+	}
+
+	return 0;
+}
+
+static int areas_setup(struct hantro_ctx *ctx)
+{
+	struct hantro_h264_enc_hw_ctx *h264_ctx = &ctx->h264_enc;
+	struct hantro_vc8000e_regs *regs = &h264_ctx->vc8000e_regs;
+
+	/* Intra */
+
+	regs->swreg23.intra_area_left = 0xff;
+	regs->swreg195.intra_area_left_msb = 1;
+	regs->swreg249.intra_area_left_msb2 = 1;
+
+	regs->swreg23.intra_area_right = 0xff;
+	regs->swreg195.intra_area_right_msb = 1;
+	regs->swreg249.intra_area_right_msb2 = 1;
+
+	regs->swreg23.intra_area_top = 0xff;
+	regs->swreg195.intra_area_top_msb = 1;
+	regs->swreg249.intra_area_top_msb2 = 1;
+
+	regs->swreg23.intra_area_bottom = 0xff;
+	regs->swreg195.intra_area_bottom_msb = 1;
+	regs->swreg249.intra_area_bottom_msb2 = 1;
+
+	/* IPCM1 */
+
+	regs->swreg208_h264.ipcm1_left = 0x1ff;
+	regs->swreg249.ipcm1_left_msb = 1;
+
+	regs->swreg209.ipcm1_right = 0x1ff;
+	regs->swreg249.ipcm1_right_msb = 1;
+
+	regs->swreg209.ipcm1_top = 0x1ff;
+	regs->swreg209.ipcm1_bottom = 0x1ff;
+
+	regs->swreg249.ipcm1_top_msb = 1;
+	regs->swreg249.ipcm1_bottom_msb = 1;
+
+	/* IPCM2 */
+
+	regs->swreg210.ipcm2_left = 0x1ff;
+	regs->swreg249.ipcm2_left_msb = 1;
+
+	regs->swreg211.ipcm2_right = 0x1ff;
+	regs->swreg249.ipcm2_right_msb = 1;
+
+	regs->swreg212.ipcm2_top = 0x1ff;
+	regs->swreg249.ipcm2_top_msb = 1;
+
+	regs->swreg213.ipcm2_bottom = 0x1ff;
+	regs->swreg249.ipcm2_bottom_msb = 1;
+
+	/* ROI1 */
+
+	regs->swreg24.roi1_left = 0xff;
+	regs->swreg195.roi1_left_msb = 1;
+	regs->swreg249.roi1_left_msb2 = 1;
+
+	regs->swreg24.roi1_right = 0xff;
+	regs->swreg195.roi1_right_msb = 1;
+	regs->swreg249.roi1_right_msb2 = 1;
+
+	regs->swreg24.roi1_top = 0xff;
+	regs->swreg195.roi1_top_msb = 1;
+	regs->swreg249.roi1_top_msb2 = 1;
+
+	regs->swreg24.roi1_bottom = 0xff;
+	regs->swreg195.roi1_bottom_msb = 1;
+	regs->swreg249.roi1_bottom_msb2 = 1;
+
+	/* ROI2 */
+
+	regs->swreg25.roi2_left = 0xff;
+	regs->swreg195.roi2_left_msb = 1;
+	regs->swreg249.roi2_left_msb2 = 1;
+
+	regs->swreg25.roi2_right = 0xff;
+	regs->swreg195.roi2_right_msb = 1;
+	regs->swreg249.roi2_right_msb2 = 1;
+
+	regs->swreg25.roi2_top = 0xff;
+	regs->swreg195.roi2_top_msb = 1;
+	regs->swreg249.roi2_top_msb2 = 1;
+
+	regs->swreg25.roi2_bottom = 0xff;
+	regs->swreg195.roi2_bottom_msb = 1;
+	regs->swreg249.roi2_bottom_msb2 = 1;
+
+	if (regs->swreg226.hwroi8support) {
+		/* ROI3 */
+
+		regs->swreg252.roi3_left = 0x3ff;
+		regs->swreg252.roi3_right = 0x3ff;
+		regs->swreg252.roi3_top = 0x3ff;
+		regs->swreg253.roi3_bottom = 0x3ff;
+
+		/* ROI4 */
+
+		regs->swreg253.roi4_left = 0x3ff;
+		regs->swreg254.roi4_right = 0x3ff;
+		regs->swreg253.roi4_top = 0x3ff;
+		regs->swreg254.roi4_bottom = 0x3ff;
+
+		/* ROI5 */
+
+		regs->swreg254.roi5_left = 0x3ff;
+		regs->swreg255.roi5_right = 0x3ff;
+		regs->swreg255.roi5_top = 0x3ff;
+		regs->swreg255.roi5_bottom = 0x3ff;
+
+		/* ROI6 */
+
+		regs->swreg256.roi6_left = 0x3ff;
+		regs->swreg256.roi6_right = 0x3ff;
+		regs->swreg256.roi6_top = 0x3ff;
+		regs->swreg257.roi6_bottom = 0x3ff;
+
+		/* ROI7 */
+
+		regs->swreg257.roi7_left = 0x3ff;
+		regs->swreg258.roi7_right = 0x3ff;
+		regs->swreg257.roi7_top = 0x3ff;
+		regs->swreg258.roi7_bottom = 0x3ff;
+
+		/* ROI8 */
+
+		regs->swreg258.roi8_left = 0x3ff;
+		regs->swreg259.roi8_right = 0x3ff;
+		regs->swreg259.roi8_top = 0x3ff;
+		regs->swreg259.roi8_bottom = 0x3ff;
+	}
+
+	return 0;
+}
+
+int hantro_vc8000e_h264_enc_run(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct v4l2_pix_format_mplane *src_fmt = &ctx->src_fmt;
+	struct hantro_h264_enc_hw_ctx *h264_ctx = &ctx->h264_enc;
+	struct hantro_vc8000e_regs *regs = &h264_ctx->vc8000e_regs;
+	struct v4l2_h264_enc *enc = &h264_ctx->enc;
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const struct v4l2_ctrl_h264_encode_params *encode;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct hantro_vc8000e_rec_buf *rec_buf;
+	const struct v4l2_format_info *info;
+	unsigned int luma_stride;
+	unsigned int chroma_stride;
+	int ret;
+
+	hantro_start_prepare_run(ctx);
+
+	info = v4l2_format_info(src_fmt->pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
+
+	ret = v4l2_h264_enc_step(enc, dst_buf);
+	if (ret)
+		return ret;
+
+	sps = &state->sps;
+	pps = &state->pps;
+	encode = &state->encode;
+
+	memset(regs, 0, sizeof(*regs));
+
+	/* Read relevant read-only registers. */
+	hantro_vc8000e_swreg_read(vpu, regs, swreg0);
+	hantro_vc8000e_swreg_read(vpu, regs, swreg80);
+	hantro_vc8000e_swreg_read(vpu, regs, swreg214);
+	hantro_vc8000e_swreg_read(vpu, regs, swreg226);
+	hantro_vc8000e_swreg_read(vpu, regs, swreg287);
+
+	/* Mode */
+
+	if (!regs->swreg80.hwh264support)
+		return -ENODEV;
+
+	regs->swreg4.mode = HANTRO_VC8000E_SWREG4_MODE_H264;
+
+	/* Input */
+
+	regs->swreg38.input_format = ctx->vpu_src_fmt->enc_fmt;
+	regs->swreg38.input_rotation = HANTRO_VC8000E_SWREG38_INPUT_ROTATION_0;
+
+	luma_stride = src_fmt->plane_fmt[0].bytesperline;
+
+	/*
+	 * The hardware seems to expect the luma stride to represent pixels per
+	 * line for packed cases, instead of the usual bytes per line.
+	 */
+	if (info->comp_planes == 1)
+		luma_stride /= info->bpp[0];
+
+	regs->swreg210.input_lu_stride = luma_stride;
+
+	if (info->comp_planes > 1) {
+		if (src_fmt->num_planes > 1)
+			chroma_stride = src_fmt->plane_fmt[1].bytesperline;
+		else if (info->comp_planes > 2)
+			chroma_stride = luma_stride / 2;
+		else
+			chroma_stride = luma_stride;
+
+		regs->swreg211.input_ch_stride = chroma_stride;
+	}
+
+	regs->swreg12.input_y_base =
+		vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+
+	if (info->comp_planes > 1) {
+		if (src_fmt->num_planes > 1)
+			regs->swreg13.input_cb_base =
+				vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
+							      1);
+		else
+			regs->swreg13.input_cb_base =
+				vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
+							      0) +
+				luma_stride * src_fmt->height;
+	}
+
+	if (info->comp_planes > 2) {
+		if (src_fmt->num_planes > 1)
+			regs->swreg14.input_cr_base =
+				vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
+							      2);
+		else
+			regs->swreg14.input_cr_base =
+				vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,
+							      0) +
+				luma_stride * src_fmt->height +
+				chroma_stride * src_fmt->height;
+	}
+
+	/* Output */
+
+	if (enc->rbsp_update & V4L2_H264_ENC_RBSP_UPDATE_START_CODE)
+		regs->swreg4.output_strm_mode =
+			HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_BYTE_STREAM;
+	else
+		regs->swreg4.output_strm_mode =
+			HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_NAL_STREAM;
+
+	regs->swreg8.output_strm_base =
+		vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0) +
+		v4l2_h264_enc_rbsp_bytes_count(&enc->rbsp);
+	regs->swreg9.output_strm_buffer_limit =
+		vb2_plane_size(&dst_buf->vb2_buf, 0) -
+		v4l2_h264_enc_rbsp_bytes_count(&enc->rbsp);
+
+	if (!regs->swreg9.output_strm_buffer_limit)
+		return -ENOMEM;
+
+	regs->swreg10.size_tbl_base = h264_ctx->nal_tbl.dma;
+	regs->swreg6.nal_size_write = 1;
+
+	regs->swreg196.num_ctb_rows_per_sync = 1;
+
+	regs->swreg199.hash_type = HANTRO_VC8000E_SWREG199_HASH_TYPE_NONE;
+
+	/* Picture */
+
+	regs->swreg5.pic_width = src_fmt->width / 8;
+	regs->swreg5.pic_height = src_fmt->height / 8;
+	regs->swreg38.rowlength = src_fmt->width;
+
+	regs->swreg281.chroma_format_idc = sps->chroma_format_idc;
+	regs->swreg38.output_bitwidth_lum =
+		HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_8_BIT;
+
+	regs->swreg11.poc = enc->ref.pic_order_cnt;
+	regs->swreg277.pic_order_cnt_type = sps->pic_order_cnt_type;
+	if (!sps->pic_order_cnt_type)
+		regs->swreg277.log2_max_pic_order_cnt_lsb =
+			sps->log2_max_pic_order_cnt_lsb_minus4 + 4;
+
+	regs->swreg192.framenum = encode->frame_num;
+	regs->swreg277.log2_max_frame_num = sps->log2_max_frame_num_minus4 + 4;
+
+	/* Reconstruction */
+
+	regs->swreg212.ref_lu_stride = src_fmt->width * 4;
+	regs->swreg237.ref_ch_stride = src_fmt->width * 4;
+	regs->swreg213.ref_ds_lu_stride = src_fmt->width;
+
+	rec_buf = enc->ref.buffer_current.private_data;
+
+	regs->swreg15.recon_y_base = rec_buf->luma.dma;
+	regs->swreg16.recon_chroma_base = rec_buf->chroma.dma;
+	regs->swreg72.recon_luma_4n_base = rec_buf->luma_4n.dma;
+	regs->swreg114.colctbs_store_base = rec_buf->colctbs.dma;
+
+	/* Reference */
+
+	ret = ref_setup(ctx);
+	if (ret)
+		return ret;
+
+	/* Slice */
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I)
+		regs->swreg5.frame_coding_type =
+			HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_I;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_P)
+		regs->swreg5.frame_coding_type =
+			HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_P;
+	else
+		return -EINVAL;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) {
+		regs->swreg191.nal_unit_type = V4L2_H264_NALU_TYPE_SLICE_IDR;
+		regs->swreg193.idr_pic_id = encode->idr_pic_id;
+	} else {
+		regs->swreg191.nal_unit_type =
+			V4L2_H264_NALU_TYPE_SLICE_NON_IDR;
+	}
+
+	regs->swreg191.pps_id = encode->pic_parameter_set_id;
+
+	/* Quantization */
+
+	regs->swreg172.qp_min = state->qp_min;
+	regs->swreg173.qp_max = state->qp_max;
+	regs->swreg7.pic_init_qp = pps->pic_init_qp_minus26 + 26;
+	regs->swreg7.pic_qp = enc->rc.qp;
+	regs->swreg4.chroma_qp_offset = pps->chroma_qp_index_offset;
+
+	/* Coding */
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) {
+		regs->swreg193.entropy_coding_mode = 1;
+		regs->swreg7.cabac_init_flag = encode->cabac_init_idc;
+	}
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE)
+		regs->swreg193.transform8x8_enable = 1;
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT) {
+		regs->swreg5.pps_deblocking_filter_override_enabled_flag = 1;
+		regs->swreg5.slice_deblocking_filter_override_flag = 1;
+
+		regs->swreg6.deblocking_filter_dis =
+			encode->disable_deblocking_filter_idc;
+		regs->swreg6.deblocking_tc_offset =
+			encode->slice_alpha_c0_offset_div2;
+		regs->swreg6.deblocking_beta_offset =
+			encode->slice_beta_offset_div2;
+	}
+
+	regs->swreg4.min_trb_size = HANTRO_VC8000E_SWREG4_TRB_SIZE_4X4;
+	regs->swreg4.max_trb_size = HANTRO_VC8000E_SWREG4_TRB_SIZE_16X16;
+	regs->swreg4.min_cb_size = HANTRO_VC8000E_SWREG4_CB_SIZE_8X8;
+	regs->swreg4.max_cb_size = HANTRO_VC8000E_SWREG4_CB_SIZE_16X16;
+	regs->swreg4.max_trans_hierarchy_depth_inter = 2;
+	regs->swreg4.max_trans_hierarchy_depth_intra = 1;
+
+	regs->swreg36.bits_est_1n_cu_penalty = 15;
+	regs->swreg35.bits_est_tu_split_penalty = 3;
+
+	regs->swreg35.bits_est_bias_intra_cu_8 = 22;
+	regs->swreg35.bits_est_bias_intra_cu_16 = 40;
+	regs->swreg36.bits_est_bias_intra_cu_32 = 86;
+	regs->swreg36.bits_est_bias_intra_cu_64 = 304;
+	regs->swreg36.inter_skip_bias = 124;
+
+	regs->swreg201.mean_thr0 = 5;
+	regs->swreg201.mean_thr1 = 5;
+	regs->swreg201.mean_thr2 = 5;
+	regs->swreg201.mean_thr3 = 5;
+
+	regs->swreg203_h264.lum_dc_sum_thr = 5;
+	regs->swreg203_h264.cb_dc_sum_thr = 1;
+	regs->swreg203_h264.cr_dc_sum_thr = 1;
+
+	regs->swreg26.intra_size_factor_0 = 506;
+	regs->swreg26.intra_size_factor_1 = 506;
+	regs->swreg26.intra_size_factor_2 = 709;
+	regs->swreg27.intra_size_factor_3 = 709;
+
+	regs->swreg27.intra_mode_factor_0 = 24;
+	regs->swreg27.intra_mode_factor_1 = 12;
+	regs->swreg27.intra_mode_factor_2 = 48;
+
+	regs->swreg182.qp_delta_gain = 313;
+
+	/* Lambda */
+
+	ret = lambda_setup(ctx);
+	if (ret)
+		return ret;
+
+	/* Areas */
+
+	ret = areas_setup(ctx);
+	if (ret)
+		return ret;
+
+	/* Urgent thresholds */
+
+	regs->swreg272.wr_urgent_disable_threshold =
+		HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
+	regs->swreg272.wr_urgent_enable_threshold =
+		HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
+	regs->swreg272.rd_urgent_disable_threshold =
+		HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
+	regs->swreg272.rd_urgent_enable_threshold =
+		HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE;
+
+	/* AXI bus */
+
+	regs->swreg81.max_burst = 16;
+	regs->swreg261.axi_read_outstanding_num = 64;
+	regs->swreg246.axi_write_outstanding_num = 64;
+	regs->swreg320.axi_burst_align_rd_lu_ref_prefetch = 1;
+
+	/* Automatic clock gating */
+
+	regs->swreg3.clock_gate_inter_h264_e = 1;
+	regs->swreg3.clock_gate_inter_h265_e = 1;
+	regs->swreg3.clock_gate_inter_e = 1;
+	regs->swreg3.clock_gate_encoder_h264_e = 1;
+	regs->swreg3.clock_gate_encoder_h265_e = 1;
+	regs->swreg3.clock_gate_encoder_e = 1;
+
+	/* IRQ status */
+
+	regs->swreg1.irq = 1;
+	regs->swreg1.frame_rdy_status = 1;
+	regs->swreg1.bus_error_status = 1;
+	regs->swreg1.sw_reset = 1;
+	regs->swreg1.buffer_full = 1;
+	regs->swreg1.timeout = 1;
+	regs->swreg1.irq_line_buffer = 1;
+	regs->swreg1.slice_rdy_status = 1;
+
+	/* IRQ */
+
+	regs->swreg1.irq_dis = 0;
+	regs->swreg1.timeout_int = 1;
+
+	/* Register write */
+
+	hantro_io_copy(vpu->enc_base, regs, sizeof(*regs));
+
+	hantro_end_prepare_run(ctx);
+
+	/* Enable */
+
+	regs->swreg5.enable = 1;
+
+	hantro_vc8000e_swreg_write(vpu, regs, swreg5);
+
+	return 0;
+}
+
+void hantro_vc8000e_h264_enc_done(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_h264_enc_hw_ctx *h264_ctx = &ctx->h264_enc;
+	struct hantro_vc8000e_regs *regs = &h264_ctx->vc8000e_regs;
+	struct v4l2_h264_enc *enc = &h264_ctx->enc;
+	struct vb2_v4l2_buffer *dst_buf = hantro_get_dst_buf(ctx);
+	u32 bytesused;
+
+	hantro_vc8000e_swreg_read(vpu, regs, swreg9);
+
+	bytesused = regs->swreg9.output_strm_buffer_limit +
+		    v4l2_h264_enc_rbsp_bytes_count(&enc->rbsp);
+
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, bytesused);
+
+	v4l2_h264_enc_complete(enc, dst_buf);
+}
diff --git a/drivers/media/platform/verisilicon/hantro_vc8000e_regs.h b/drivers/media/platform/verisilicon/hantro_vc8000e_regs.h
new file mode 100644
index 000000000000..fad100572708
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_vc8000e_regs.h
@@ -0,0 +1,2129 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#ifndef HANTRO_VC8000E_REGS_H_
+#define HANTRO_VC8000E_REGS_H_
+
+#include <linux/types.h>
+
+#define HANTRO_VC8000E_SWREG_OFFSET(s) \
+	offsetof(struct hantro_vc8000e_regs, s)
+
+#define hantro_vc8000e_swreg_read(v, r, s) \
+	({ \
+		u32 *pointer = (u32 *)&(r)->s; \
+		*pointer = vepu_read(v, HANTRO_VC8000E_SWREG_OFFSET(s)); \
+	})
+
+#define hantro_vc8000e_swreg_write(v, r, s) \
+	({ \
+		u32 *pointer = (u32 *)&(r)->s; \
+		vepu_write(v, *pointer, HANTRO_VC8000E_SWREG_OFFSET(s)); \
+	})
+
+#define HANTRO_VC8000E_SWREG0_MAJOR_NUMBER_V6_0		0x60
+#define HANTRO_VC8000E_SWREG0_MAJOR_NUMBER_V6_1		0x61
+#define HANTRO_VC8000E_SWREG0_MAJOR_NUMBER_V6_2		0x62
+#define HANTRO_VC8000E_SWREG0_PRODUCT_ID_VC8000E	0x8000
+
+#define HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_BYTE_STREAM	0x0
+#define HANTRO_VC8000E_SWREG4_OUTPUT_STRM_MODE_NAL_STREAM	0x1
+#define HANTRO_VC8000E_SWREG4_TRB_SIZE_4X4			0x0
+#define HANTRO_VC8000E_SWREG4_TRB_SIZE_8X8			0x1
+#define HANTRO_VC8000E_SWREG4_TRB_SIZE_16X16			0x2
+#define HANTRO_VC8000E_SWREG4_TRB_SIZE_32X32			0x3
+#define HANTRO_VC8000E_SWREG4_CB_SIZE_8X8			0x0
+#define HANTRO_VC8000E_SWREG4_CB_SIZE_16X16			0x1
+#define HANTRO_VC8000E_SWREG4_CB_SIZE_32X32			0x2
+#define HANTRO_VC8000E_SWREG4_CB_SIZE_64X64			0x3
+#define HANTRO_VC8000E_SWREG4_MODE_HEVC				0x1
+#define HANTRO_VC8000E_SWREG4_MODE_H264				0x2
+#define HANTRO_VC8000E_SWREG4_MODE_JPEG				0x4
+
+#define HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_P	0x0
+#define HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_I	0x1
+#define HANTRO_VC8000E_SWREG5_FRAME_CODING_TYPE_B	0x2
+
+#define HANTRO_VC8000E_SWREG36_OUTPUT_BITWIDTH_CHROMA_8_BIT	0x0
+#define HANTRO_VC8000E_SWREG36_OUTPUT_BITWIDTH_CHROMA_9_BIT	0x1
+#define HANTRO_VC8000E_SWREG36_OUTPUT_BITWIDTH_CHROMA_10_BIT	0x2
+
+#define HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_8_BIT	0x0
+#define HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_9_BIT	0x1
+#define HANTRO_VC8000E_SWREG38_OUTPUT_BITWIDTH_LUM_10_BIT	0x2
+#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_0			0x0
+#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_90		0x1
+#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_270		0x2
+#define HANTRO_VC8000E_SWREG38_INPUT_ROTATION_180		0x3
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_YUV420P		0x0
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_YUV420SP		0x1
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_YUYV422		0x2
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_UYVY422		0x3
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB565		0x4
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB555		0x5
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB444		0x6
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB888		0x7
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_RGB101010		0x8
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_I010		0x9
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_P010		0xa
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_PACKED10BITPLANAR	0xb
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_Y0L2		0xc
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_DAHUAHEVC		0xd
+#define HANTRO_VC8000E_SWREG38_INPUT_FORMAT_DAHUAH264		0xe
+
+#define HANTRO_VC8000E_SWREG80_HWBUSWIDTH_32_BIT	0x0
+#define HANTRO_VC8000E_SWREG80_HWBUSWIDTH_64_BIT	0x1
+#define HANTRO_VC8000E_SWREG80_HWBUSWIDTH_128_BIT	0x2
+#define HANTRO_VC8000E_SWREG80_HWBUS_AHB		0x1
+#define HANTRO_VC8000E_SWREG80_HWBUS_OCP		0x2
+#define HANTRO_VC8000E_SWREG80_HWBUS_AXI		0x3
+#define HANTRO_VC8000E_SWREG80_HWBUS_PCI		0x4
+#define HANTRO_VC8000E_SWREG80_HWBUS_AXIAHB		0x5
+#define HANTRO_VC8000E_SWREG80_HWBUS_AXIAPB		0x6
+
+#define HANTRO_VC8000E_SWREG_ROI_QP_TYPE_DELTA		0x0
+#define HANTRO_VC8000E_SWREG_ROI_QP_TYPE_ABSOLUTE	0x1
+
+#define HANTRO_VC8000E_SWREG181_RC_BLOCK_SIZE_64X64	0x0
+#define HANTRO_VC8000E_SWREG181_RC_BLOCK_SIZE_32X32	0x1
+#define HANTRO_VC8000E_SWREG181_RC_BLOCK_SIZE_16X16	0x2
+
+#define HANTRO_VC8000E_SWREG199_HASH_TYPE_NONE		0x0
+#define HANTRO_VC8000E_SWREG199_HASH_TYPE_CRC32		0x1
+#define HANTRO_VC8000E_SWREG199_HASH_TYPE_CHECKSUM32	0x2
+
+#define HANTRO_VC8000E_SWREG214_HWROIMAPVERSION_4_BPP	0x0
+#define HANTRO_VC8000E_SWREG214_HWROIMAPVERSION_8_BPP	0x1
+
+#define HANTRO_VC8000E_SWREG226_HWINLOOPDSRATIO_1_1			0x0
+#define HANTRO_VC8000E_SWREG226_HWINLOOPDSRATIO_1_2			0x1
+#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_64		0x0
+#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_128		0x1
+#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_192		0x2
+#define HANTRO_VC8000E_SWREG226_BFRAME_ME4N_HOR_SEARCHRANGE_256		0x3
+#define HANTRO_VC8000E_SWREG226_HWP010REFSUPPORT_NORMAL			0x0
+#define HANTRO_VC8000E_SWREG226_HWP010REFSUPPORT_TILED_P010		0x1
+
+#define HANTRO_VC8000E_SWREG272_URGENT_THRESHOLD_DISABLE	0xff
+
+#define HANTRO_VC8000E_SWREG281_CHROMA_FORMAT_IDC_400	0x0
+#define HANTRO_VC8000E_SWREG281_CHROMA_FORMAT_IDC_420	0x1
+
+struct hantro_vc8000e_regs {
+	struct {
+		u32 minor_number	: 8;
+		u32 major_number	: 8;
+		u32 product_id		: 16;
+	} swreg0;
+
+	struct {
+		u32 irq				: 1;
+		u32 irq_dis			: 1;
+		u32 frame_rdy_status		: 1;
+		u32 bus_error_status		: 1;
+		u32 sw_reset			: 1;
+		u32 buffer_full			: 1;
+		u32 timeout			: 1;
+		u32 irq_line_buffer		: 1;
+		u32 slice_rdy_status		: 1;
+		u32 irq_fuse_error		: 1;
+		u32 reserved0			: 1;
+		u32 timeout_int			: 1;
+		u32 strm_segment_rdy_int	: 1;
+		u32 reserved1			: 19;
+	} swreg1;
+
+	struct {
+		u32 ctb_rc_mem_out_swap		: 4;
+		u32 roi_map_qp_delta_map_swap	: 4;
+		u32 pic_swap			: 4;
+		u32 strm_swap			: 4;
+		u32 axi_read_id			: 8;
+		u32 axi_write_id		: 8;
+	} swreg2;
+
+	struct {
+		u32 reserved0			: 1;
+		u32 strm_segment_int		: 1;
+		u32 line_buffer_int		: 1;
+		u32 slice_int			: 1;
+		u32 reserved1			: 16;
+		u32 cu_info_mem_out_swap	: 4;
+		u32 axi_rd_id_e			: 1;
+		u32 axi_wr_id_e			: 1;
+		u32 clock_gate_inter_h264_e	: 1;
+		u32 clock_gate_inter_h265_e	: 1;
+		u32 clock_gate_inter_e		: 1;
+		u32 clock_gate_encoder_h264_e	: 1;
+		u32 clock_gate_encoder_h265_e	: 1;
+		u32 clock_gate_encoder_e	: 1;
+	} swreg3;
+
+	struct {
+		u32 max_trans_hierarchy_depth_inter	: 3;
+		u32 max_trans_hierarchy_depth_intra	: 3;
+		u32 sao_enable				: 1;
+		u32 active_override_flag		: 1;
+		u32 scaling_list_enabled_flag		: 1;
+		u32 reserved0				: 2;
+		u32 bw_linebuf_disable			: 1;
+		u32 strong_intra_smoothing_enabled_flag	: 1;
+		u32 chroma_qp_offset			: 5;
+		u32 output_strm_mode			: 1;
+		u32 max_trb_size			: 2;
+		u32 min_trb_size			: 2;
+		u32 max_cb_size				: 2;
+		u32 min_cb_size				: 2;
+		u32 reserved1				: 2;
+		u32 mode				: 3;
+	} swreg4;
+
+	union {
+		struct {
+			u32 enable					: 1;
+			u32 frame_coding_type				: 2;
+			u32 ref_frames					: 2;
+			u32 buffer_full_continue			: 1;
+			u32 output_cu_info_enabled			: 1;
+			u32 reserved0					: 1;
+			u32 slice_deblocking_filter_override_flag	: 1;
+			u32 pps_deblocking_filter_override_enabled_flag	: 1;
+			u32 reserved1					: 1;
+			u32 pic_height					: 11;
+			u32 pic_width					: 10;
+		} swreg5;
+
+		struct {
+			u32 reserved		: 8;
+			u32 jpeg_pic_height	: 12;
+			u32 jpeg_pic_width	: 12;
+		} swreg5_jpeg;
+	};
+
+	struct {
+		u32 cu_qp_delta_enabled		: 1;
+		u32 nal_size_write		: 1;
+		u32 rps_id			: 5;
+		u32 deblocking_beta_offset	: 4;
+		u32 deblocking_tc_offset	: 4;
+		u32 deblocking_filter_dis	: 1;
+		u32 num_positive_pics		: 2;
+		u32 num_negative_pics		: 2;
+		u32 num_short_term_ref_pic_sets	: 5;
+		u32 slice_size			: 7;
+	} swreg6;
+
+	struct {
+		u32 roi2_delta_qp		: 4;
+		u32 roi1_delta_qp		: 4;
+		u32 pic_qp			: 6;
+		u32 diff_cu_qp_delta_depth	: 2;
+		u32 reserved			: 1;
+		u32 num_slices_ready		: 8;
+		u32 cabac_init_flag		: 1;
+		u32 pic_init_qp			: 6;
+	} swreg7;
+
+	struct {
+		u32 output_strm_base	: 32;
+	} swreg8;
+
+	struct {
+		u32 output_strm_buffer_limit	: 32;
+	} swreg9;
+
+	struct {
+		u32 size_tbl_base	: 32;
+	} swreg10;
+
+	struct {
+		u32 poc	: 32;
+	} swreg11;
+
+	struct {
+		u32 input_y_base	: 32;
+	} swreg12;
+
+	struct {
+		u32 input_cb_base	: 32;
+	} swreg13;
+
+	struct {
+		u32 input_cr_base	: 32;
+	} swreg14;
+
+	struct {
+		u32 recon_y_base	: 32;
+	} swreg15;
+
+	struct {
+		u32 recon_chroma_base	: 32;
+	} swreg16;
+
+	struct {
+		u32 l0_ref1_chroma_compressor_enable	: 1;
+		u32 l0_ref1_luma_compressor_enable	: 1;
+		u32 l0_ref0_chroma_compressor_enable	: 1;
+		u32 l0_ref0_luma_compressor_enable	: 1;
+		u32 recon_chroma_compressor_enable	: 1;
+		u32 recon_luma_compressor_enable	: 1;
+		u32 active_l0_cnt			: 2;
+		u32 l0_used_by_curr_pic1		: 1;
+		u32 l0_long_term_flag1			: 1;
+		u32 l0_delta_poc1			: 10;
+		u32 l0_used_by_curr_pic0		: 1;
+		u32 l0_long_term_flag0			: 1;
+		u32 l0_delta_poc0			: 10;
+	} swreg17;
+
+	union {
+		struct {
+			u32 refpic_recon_l0_y0	: 32;
+		} swreg18;
+
+		struct {
+			u32 jpeg_rst		: 16;
+			u32 jpeg_rstint		: 8;
+			u32 jpeg_mode		: 1;
+			u32 jpeg_slice		: 1;
+			u32 strm_startoffset	: 6;
+		} swreg18_jpeg;
+	};
+
+	union {
+		struct {
+			u32 refpic_recon_l0_chroma0	: 32;
+		} swreg19;
+
+		struct {
+			u32 strm_hdrrem1	: 32;
+		} swreg19_jpeg;
+	};
+
+	union {
+		struct {
+			u32 refpic_recon_l0_y1	: 32;
+		} swreg20;
+
+		struct {
+			u32 reserved		: 8;
+			u32 ljpeg_pt		: 3;
+			u32 ljpeg_psv		: 3;
+			u32 ljpeg_format	: 2;
+			u32 ljpeg_en		: 1;
+			u32 jpeg_rowlength	: 15;
+		} swreg20_jpeg;
+	};
+
+	union {
+		struct {
+			u32 refpic_recon_l0_chroma1	: 32;
+		} swreg21;
+
+		struct {
+			u32 strm_hdrrem2	: 32;
+		} swreg21_jpeg;
+	};
+
+	struct {
+		u32 roi_area_enable	: 1;
+		u32 roi_map_enable	: 1;
+		u32 qadj_enable		: 1;
+		u32 rc_enable		: 1;
+		u32 cir_interval	: 14;
+		u32 cir_start		: 14;
+	} swreg22;
+
+	struct {
+		u32 intra_area_bottom	: 8;
+		u32 intra_area_top	: 8;
+		u32 intra_area_right	: 8;
+		u32 intra_area_left	: 8;
+	} swreg23;
+
+	struct {
+		u32 roi1_bottom	: 8;
+		u32 roi1_top	: 8;
+		u32 roi1_right	: 8;
+		u32 roi1_left	: 8;
+	} swreg24;
+
+	struct {
+		u32 roi2_bottom	: 8;
+		u32 roi2_top	: 8;
+		u32 roi2_right	: 8;
+		u32 roi2_left	: 8;
+	} swreg25;
+
+	struct {
+		u32 reserved		: 2;
+		u32 intra_size_factor_2	: 10;
+		u32 intra_size_factor_1	: 10;
+		u32 intra_size_factor_0	: 10;
+	} swreg26;
+
+	struct {
+		u32 reserved		: 4;
+		u32 intra_mode_factor_2	: 7;
+		u32 intra_mode_factor_1	: 6;
+		u32 intra_mode_factor_0	: 5;
+		u32 intra_size_factor_3	: 10;
+	} swreg27;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_1	: 13;
+		u32 lambda_satd_me_0	: 13;
+	} swreg28;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_3	: 13;
+		u32 lambda_satd_me_2	: 13;
+	} swreg29;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_5	: 13;
+		u32 lambda_satd_me_4	: 13;
+	} swreg30;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_7	: 13;
+		u32 lambda_satd_me_6	: 13;
+	} swreg31;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_9	: 13;
+		u32 lambda_satd_me_8	: 13;
+	} swreg32;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_11	: 13;
+		u32 lambda_satd_me_10	: 13;
+	} swreg33;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_13	: 13;
+		u32 lambda_satd_me_12	: 13;
+	} swreg34;
+
+	struct {
+		u32 bits_est_bias_intra_cu_16	: 8;
+		u32 bits_est_bias_intra_cu_8	: 7;
+		u32 bits_est_tu_split_penalty	: 3;
+		u32 lambda_motion_sse		: 14;
+	} swreg35;
+
+	struct {
+		u32 output_bitwidth_chroma	: 2;
+		u32 bits_est_1n_cu_penalty	: 4;
+		u32 inter_skip_bias		: 7;
+		u32 bits_est_bias_intra_cu_64	: 10;
+		u32 bits_est_bias_intra_cu_32	: 9;
+	} swreg36;
+
+	struct {
+		u32 chroffset		: 4;
+		u32 lambda_sao_luma	: 14;
+		u32 lambda_sao_chroma	: 14;
+	} swreg37;
+
+	struct {
+		u32 mirror		: 1;
+		u32 yfill		: 3;
+		u32 xfill		: 2;
+		u32 rowlength		: 14;
+		u32 lumoffset		: 4;
+		u32 output_bitwidth_lum	: 2;
+		u32 input_rotation	: 2;
+		u32 input_format	: 4;
+	} swreg38;
+
+	struct {
+		u32 rgbcoeffb	: 16;
+		u32 rgbcoeffa	: 16;
+	} swreg39;
+
+	struct {
+		u32 rgbcoeffe	: 16;
+		u32 rgbcoeffc	: 16;
+	} swreg40;
+
+	struct {
+		u32 reserved	: 1;
+		u32 bmaskmsb	: 5;
+		u32 gmaskmsb	: 5;
+		u32 rmaskmsb	: 5;
+		u32 rgbcoefff	: 16;
+	} swreg41;
+
+	struct {
+		u32 basescaledoutlum	: 32;
+	} swreg42;
+
+	struct {
+		u32 scale_mode		: 2;
+		u32 scaledoutwidthmsb	: 1;
+		u32 scaledoutwidthratio	: 16;
+		u32 scaledoutwidth	: 13;
+	} swreg43;
+
+	struct {
+		u32 input_format_msb		: 2;
+		u32 scaledoutheightratio	: 16;
+		u32 scaledoutheight		: 14;
+	} swreg44;
+
+	struct {
+		u32 reserved			: 2;
+		u32 scaledout_format		: 1;
+		u32 nalunitsize_swap		: 4;
+		u32 scaledverticalcopy		: 1;
+		u32 scaledhorizontalcopy	: 1;
+		u32 vscale_weight_en		: 1;
+		u32 scaledskiptoppixelrow	: 2;
+		u32 scaledskipleftpixelcolumn	: 2;
+		u32 encoded_ctb_number		: 13;
+		u32 chroma_swap			: 1;
+		u32 scaledout_swap		: 4;
+	} swreg45;
+
+	struct {
+		u32 compressedcoeff_base	: 32;
+	} swreg46;
+
+	struct {
+		u32 compressedcoeff_base_msb	: 32;
+	} swreg47;
+
+	struct {
+		u32 basescaledoutlum_msb	: 32;
+	} swreg48;
+
+	struct {
+		u32 refpic_recon_l0_y0_msb	: 32;
+	} swreg49;
+
+	struct {
+		u32 refpic_recon_l0_chroma0_msb	: 32;
+	} swreg50;
+
+	struct {
+		u32 refpic_recon_l0_y1_msb	: 32;
+	} swreg51;
+
+	struct {
+		u32 refpic_recon_l0_chroma1_msb	: 32;
+	} swreg52;
+
+	struct {
+		u32 input_y_base_msb	: 32;
+	} swreg53;
+
+	struct {
+		u32 input_cb_base_msb	: 32;
+	} swreg54;
+
+	struct {
+		u32 input_cr_base_msb	: 32;
+	} swreg55;
+
+	struct {
+		u32 recon_y_base_msb	: 32;
+	} swreg56;
+
+	struct {
+		u32 recon_chroma_base_msb	: 32;
+	} swreg57;
+
+	struct {
+		u32 size_tbl_base_msb	: 32;
+	} swreg58;
+
+	struct {
+		u32 output_strm_base_msb	: 32;
+	} swreg59;
+
+	struct {
+		u32 recon_luma_compress_table_base	: 32;
+	} swreg60;
+
+	struct {
+		u32 recon_luma_compress_table_base_msb	: 32;
+	} swreg61;
+
+	struct {
+		u32 recon_chroma_compress_table_base	: 32;
+	} swreg62;
+
+	struct {
+		u32 recon_chroma_compress_table_base_msb	: 32;
+	} swreg63;
+
+	struct {
+		u32 l0_ref0_luma_compress_table_base	: 32;
+	} swreg64;
+
+	struct {
+		u32 l0_ref0_luma_compress_table_base_msb	: 32;
+	} swreg65;
+
+	struct {
+		u32 l0_ref0_chroma_compress_table_base	: 32;
+	} swreg66;
+
+	struct {
+		u32 l0_ref0_chroma_compress_table_base_msb	: 32;
+	} swreg67;
+
+	struct {
+		u32 l0_ref1_luma_compress_table_base	: 32;
+	} swreg68;
+
+	struct {
+		u32 l0_ref1_luma_compress_table_base_msb	: 32;
+	} swreg69;
+
+	struct {
+		u32 l0_ref1_chroma_compress_table_base	: 32;
+	} swreg70;
+
+	struct {
+		u32 l0_ref1_chroma_compress_table_base_msb	: 32;
+	} swreg71;
+
+	struct {
+		u32 recon_luma_4n_base	: 32;
+	} swreg72;
+
+	struct {
+		u32 recon_luma_4n_base_msb	: 32;
+	} swreg73;
+
+	struct {
+		u32 refpic_recon_l0_4n0_base	: 32;
+	} swreg74;
+
+	struct {
+		u32 refpic_recon_l0_4n0_base_msb	: 32;
+	} swreg75;
+
+	struct {
+		u32 refpic_recon_l0_4n1_base	: 32;
+	} swreg76;
+
+	struct {
+		u32 refpic_recon_l0_4n1_base_msb	: 32;
+	} swreg77;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_15	: 13;
+		u32 lambda_satd_me_14	: 13;
+	} swreg78;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_0	: 21;
+	} swreg79;
+
+	struct {
+		u32 hwmaxvideowidth	: 13;
+		u32 hwbuswidth		: 2;
+		u32 hwjpegsupport	: 1;
+		u32 hwtu32support	: 1;
+		u32 hwrfcsupport	: 1;
+		u32 hwprogrdosupport	: 1;
+		u32 hwlinebufsupport	: 1;
+		u32 hwcavlcsupport	: 1;
+		u32 hwbus		: 3;
+		u32 hwmain10support	: 1;
+		u32 hwdenoisesupport	: 1;
+		u32 hwvp9support	: 1;
+		u32 hwhevcsupport	: 1;
+		u32 hwrgbsupport	: 1;
+		u32 hwbframesupport	: 1;
+		u32 hwscalingsupport	: 1;
+		u32 hwh264support	: 1;
+	} swreg80;
+
+	struct {
+		u32 timeout_cycles	: 23;
+		u32 timeout_override_e	: 1;
+		u32 max_burst		: 8;
+	} swreg81;
+
+	struct {
+		u32 hw_performance	: 32;
+	} swreg82;
+
+	struct {
+		u32 refpic_recon_l1_y0	: 32;
+	} swreg83;
+
+	struct {
+		u32 refpic_recon_l1_chroma0	: 32;
+	} swreg84;
+
+	struct {
+		u32 refpic_recon_l1_y1	: 32;
+	} swreg85;
+
+	struct {
+		u32 refpic_recon_l1_chroma1	: 32;
+	} swreg86;
+
+	struct {
+		u32 refpic_recon_l1_y0_msb	: 32;
+	} swreg87;
+
+	struct {
+		u32 refpic_recon_l1_chroma0_msb	: 32;
+	} swreg88;
+
+	struct {
+		u32 refpic_recon_l1_y1_msb	: 32;
+	} swreg89;
+
+	struct {
+		u32 refpic_recon_l1_chroma1_msb	: 32;
+	} swreg90;
+
+	struct {
+		u32 l1_ref1_chroma_compressor_enable	: 1;
+		u32 l1_ref1_luma_compressor_enable	: 1;
+		u32 l1_ref0_chroma_compressor_enable	: 1;
+		u32 l1_ref0_luma_compressor_enable	: 1;
+		u32 long_term_ref_pics_present_flag	: 1;
+		u32 reserved				: 1;
+		u32 active_l1_cnt			: 2;
+		u32 l1_used_by_curr_pic1		: 1;
+		u32 l1_long_term_flag1			: 1;
+		u32 l1_delta_poc1			: 10;
+		u32 l1_used_by_curr_pic0		: 1;
+		u32 l1_long_term_flag0			: 1;
+		u32 l1_delta_poc0			: 10;
+	} swreg91;
+
+	struct {
+		u32 refpic_recon_l1_4n0_base	: 32;
+	} swreg92;
+
+	struct {
+		u32 refpic_recon_l1_4n0_base_msb	: 32;
+	} swreg93;
+
+	struct {
+		u32 refpic_recon_l1_4n1_base	: 32;
+	} swreg94;
+
+	struct {
+		u32 refpic_recon_l1_4n1_base_msb	: 32;
+	} swreg95;
+
+	struct {
+		u32 l1_ref0_luma_compress_table_base	: 32;
+	} swreg96;
+
+	struct {
+		u32 l1_ref0_luma_compress_table_base_msb	: 32;
+	} swreg97;
+
+	struct {
+		u32 l1_ref0_chroma_compress_table_base	: 32;
+	} swreg98;
+
+	struct {
+		u32 l1_ref0_chroma_compress_table_base_msb	: 32;
+	} swreg99;
+
+	struct {
+		u32 l1_ref1_luma_compress_table_base	: 32;
+	} swreg100;
+
+	struct {
+		u32 l1_ref1_luma_compress_table_base_msb	: 32;
+	} swreg101;
+
+	struct {
+		u32 l1_ref1_chroma_compress_table_base	: 32;
+	} swreg102;
+
+	struct {
+		u32 l1_ref1_chroma_compress_table_base_msb	: 32;
+	} swreg103;
+
+	struct {
+		u32 ref_pic_list_modi_flag_l0	: 1;
+		u32 list_entry_l0_pic0		: 4;
+		u32 list_entry_l0_pic1		: 4;
+		u32 reserved0			: 7;
+		u32 ref_pic_list_modi_flag_l1	: 1;
+		u32 list_entry_l1_pic0		: 4;
+		u32 list_entry_l1_pic1		: 4;
+		u32 reserved1			: 4;
+		u32 rdo_level			: 2;
+		u32 lists_modi_present_flag	: 1;
+	} swreg104;
+
+	struct {
+		u32 targetpicsize	: 32;
+	} swreg105;
+
+	struct {
+		u32 minpicsize	: 32;
+	} swreg106;
+
+	struct {
+		u32 maxpicsize	: 32;
+	} swreg107;
+
+	struct {
+		u32 nonzerocount	: 24;
+		u32 averageqp		: 8;
+	} swreg108;
+
+	struct {
+		u32 roimapdeltaqpaddr	: 32;
+	} swreg109;
+
+	struct {
+		u32 roimapdeltaqpaddr_msb	: 32;
+	} swreg110;
+
+	struct {
+		u32 reserved	: 12;
+		u32 intracu8num	: 20;
+	} swreg111;
+
+	struct {
+		u32 reserved	: 12;
+		u32 skipcu8num	: 20;
+	} swreg112;
+
+	struct {
+		u32 pbframe4nrdcost	: 32;
+	} swreg113;
+
+	struct {
+		u32 colctbs_store_base	: 32;
+	} swreg114;
+
+	struct {
+		u32 colctbs_store_base_msb	: 32;
+	} swreg115;
+
+	struct {
+		u32 colctbs_load_base	: 32;
+	} swreg116;
+
+	struct {
+		u32 colctbs_load_base_msb	: 32;
+	} swreg117;
+
+	struct {
+		u32 ctbrcthrdmax	: 16;
+		u32 ctbrcthrdmin	: 16;
+	} swreg118;
+
+	struct {
+		u32 ctbbitsmax	: 16;
+		u32 ctbbitsmin	: 16;
+	} swreg119;
+
+	struct {
+		u32 totallcubits	: 32;
+	} swreg120;
+
+	struct {
+		u32 bitsratio	: 32;
+	} swreg121;
+
+	union {
+		struct {
+			u32 reserved		: 11;
+			u32 lambda_sse_me_1	: 21;
+		} swreg122;
+
+		struct {
+			u32 av1_enable_order_hint		: 1;
+			u32 av1_allow_update_cdf		: 1;
+			u32 av1_interp_filter			: 3;
+			u32 av1_switchable_motion_mode		: 1;
+			u32 av1_cur_frame_force_integer_mv	: 1;
+			u32 av1_enable_dual_filter		: 1;
+			u32 av1_enable_interintra_compound	: 1;
+			u32 av1_list1_ref_frame			: 4;
+			u32 av1_list0_ref_frame			: 4;
+			u32 av1_reference_mode			: 2;
+			u32 av1_skip_mode_flag			: 1;
+			u32 av1_allow_high_precision_mv		: 1;
+			u32 av1_seg_enable			: 1;
+			u32 av1_reduced_tx_set_used		: 1;
+			u32 av1_tx_mode				: 2;
+			u32 av1_enable_filter_intra		: 1;
+			u32 av1_delta_q_res			: 4;
+			u32 av1_coded_lossless			: 1;
+			u32 av1_allow_intrabc			: 1;
+		} swreg122_av1;
+	};
+
+	union {
+		struct {
+			u32 ctbrc_qpdelta_flag_reverse	: 1;
+			u32 reserved			: 10;
+			u32 lambda_sse_me_2		: 21;
+		} swreg123;
+
+		struct {
+			u32 reserved			: 1;
+			u32 av1_btxtypesearch		: 1;
+			u32 av1_primary_ref_frame	: 3;
+			u32 av1_sharpness_lvl		: 3;
+			u32 av1_db_filter_lvl_v		: 6;
+			u32 av1_db_filter_lvl_u		: 6;
+			u32 av1_db_filter_lvl1		: 6;
+			u32 av1_db_filter_lvl0		: 6;
+		} swreg123_av1;
+	};
+
+	union {
+		struct {
+			u32 reserved		: 11;
+			u32 lambda_sse_me_3	: 21;
+		} swreg124;
+
+		struct {
+			u32 reserved			: 15;
+			u32 av1_cdef_bits		: 2;
+			u32 av1_cdef_uv_strengths	: 6;
+			u32 av1_cdef_strengths		: 6;
+			u32 av1_cdef_damping		: 3;
+		} swreg124_av1;
+	};
+
+	union {
+		struct {
+			u32 reserved		: 4;
+			u32 intra_satd_lambda_1	: 14;
+			u32 intra_satd_lambda_0	: 14;
+		} swreg125;
+
+		struct {
+			u32 av1_framectx_base	: 32;
+		} swreg125_av1;
+	};
+
+	union {
+		struct {
+			u32 reserved		: 4;
+			u32 intra_satd_lambda_3	: 14;
+			u32 intra_satd_lambda_2	: 14;
+		} swreg126;
+
+		struct {
+			u32 av1_framectx_base_msb	: 32;
+		} swreg126_av1;
+	};
+
+	struct {
+		u32 reserved		: 4;
+		u32 intra_satd_lambda_5	: 14;
+		u32 intra_satd_lambda_4	: 14;
+	} swreg127;
+
+	struct {
+		u32 reserved		: 4;
+		u32 intra_satd_lambda_7	: 14;
+		u32 intra_satd_lambda_6	: 14;
+	} swreg128;
+
+	struct {
+		u32 reserved		: 4;
+		u32 intra_satd_lambda_9	: 14;
+		u32 intra_satd_lambda_8	: 14;
+	} swreg129;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_11	: 14;
+		u32 intra_satd_lambda_10	: 14;
+	} swreg130;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_13	: 14;
+		u32 intra_satd_lambda_12	: 14;
+	} swreg131;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_15	: 14;
+		u32 intra_satd_lambda_14	: 14;
+	} swreg132;
+
+	struct {
+		u32 sse_div_256	: 32;
+	} swreg133;
+
+	struct {
+		u32 nr_mbnum_invert_reg		: 16;
+		u32 reserved			: 8;
+		u32 noise_low			: 6;
+		u32 noise_reduction_enable	: 2;
+	} swreg134;
+
+	struct {
+		u32 reserved		: 5;
+		u32 thresh_sigma_cur	: 21;
+		u32 sliceqp_prev	: 6;
+	} swreg135;
+
+	struct {
+		u32 frame_sigma_calced	: 16;
+		u32 sigma_cur		: 16;
+	} swreg136;
+
+	struct {
+		u32 reserved		: 11;
+		u32 thresh_sigma_calced	: 21;
+	} swreg137;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_4	: 21;
+	} swreg138;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_5	: 21;
+	} swreg139;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_6	: 21;
+	} swreg140;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_7	: 21;
+	} swreg141;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_8	: 21;
+	} swreg142;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_9	: 21;
+	} swreg143;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_10	: 21;
+	} swreg144;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_11	: 21;
+	} swreg145;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_12	: 21;
+	} swreg146;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_13	: 21;
+	} swreg147;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_14	: 21;
+	} swreg148;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_15	: 21;
+	} swreg149;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_17	: 13;
+		u32 lambda_satd_me_16	: 13;
+	} swreg150;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_19	: 13;
+		u32 lambda_satd_me_18	: 13;
+	} swreg151;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_21	: 13;
+		u32 lambda_satd_me_20	: 13;
+	} swreg152;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_23	: 13;
+		u32 lambda_satd_me_22	: 13;
+	} swreg153;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_25	: 13;
+		u32 lambda_satd_me_24	: 13;
+	} swreg154;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_27	: 13;
+		u32 lambda_satd_me_26	: 13;
+	} swreg155;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_29	: 13;
+		u32 lambda_satd_me_28	: 13;
+	} swreg156;
+
+	struct {
+		u32 reserved		: 6;
+		u32 lambda_satd_me_31	: 13;
+		u32 lambda_satd_me_30	: 13;
+	} swreg157;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_16	: 21;
+	} swreg158;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_17	: 21;
+	} swreg159;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_18	: 21;
+	} swreg160;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_19	: 21;
+	} swreg161;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_20	: 21;
+	} swreg162;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_21	: 21;
+	} swreg163;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_22	: 21;
+	} swreg164;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_23	: 21;
+	} swreg165;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_24	: 21;
+	} swreg166;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_25	: 21;
+	} swreg167;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_26	: 21;
+	} swreg168;
+
+	struct {
+		u32 reserved		: 11;
+		u32 lambda_sse_me_27	: 21;
+	} swreg169;
+
+	union {
+		struct {
+			u32 roi1_delta_qp_rc		: 5;
+			u32 rc_ctbrc_sliceqpoffset	: 6;
+			u32 lambda_sse_me_28		: 21;
+		} swreg170_qp_delta;
+
+		struct {
+			u32 roi1_qp_type	: 1;
+			u32 roi1_qp_value	: 7;
+			u32 sse_qp_factor	: 15;
+			u32 reserved		: 8;
+			u32 lambda_depth	: 1;
+		} swreg170_qp_absolute;
+	};
+
+	union {
+		struct {
+			u32 roi2_delta_qp_rc	: 5;
+			u32 reserved		: 6;
+			u32 lambda_sse_me_29	: 21;
+		} swreg171_qp_delta;
+
+		struct {
+			u32 roi2_qp_type	: 1;
+			u32 roi2_qp_value	: 7;
+			u32 sad_qp_factor	: 15;
+			u32 reserved		: 9;
+		} swreg171_qp_absolute;
+	};
+
+	struct {
+		u32 complexity_offset	: 5;
+		u32 qp_min		: 6;
+		u32 lambda_sse_me_30	: 21;
+	} swreg172;
+
+	struct {
+		u32 rc_qpdelta_range	: 4;
+		u32 reserved		: 1;
+		u32 qp_max		: 6;
+		u32 lambda_sse_me_31	: 21;
+	} swreg173;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_17	: 14;
+		u32 intra_satd_lambda_16	: 14;
+	} swreg174;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_19	: 14;
+		u32 intra_satd_lambda_18	: 14;
+	} swreg175;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_21	: 14;
+		u32 intra_satd_lambda_20	: 14;
+	} swreg176;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_23	: 14;
+		u32 intra_satd_lambda_22	: 14;
+	} swreg177;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_25	: 14;
+		u32 intra_satd_lambda_24	: 14;
+	} swreg178;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_27	: 14;
+		u32 intra_satd_lambda_26	: 14;
+	} swreg179;
+
+	struct {
+		u32 reserved			: 4;
+		u32 intra_satd_lambda_29	: 14;
+		u32 intra_satd_lambda_28	: 14;
+	} swreg180;
+
+	struct {
+		u32 reserved			: 2;
+		u32 rc_block_size		: 2;
+		u32 intra_satd_lambda_31	: 14;
+		u32 intra_satd_lambda_30	: 14;
+	} swreg181;
+
+	struct {
+		u32 qp_delta_gain	: 16;
+		u32 qp_fractional	: 16;
+	} swreg182;
+
+	struct {
+		u32 reserved	: 6;
+		u32 qp_sum	: 26;
+	} swreg183;
+
+	struct {
+		u32 reserved	: 12;
+		u32 qp_num	: 20;
+	} swreg184;
+
+	struct {
+		u32 timeout_cycles_msb	: 9;
+		u32 pic_complexity	: 23;
+	} swreg185;
+
+	struct {
+		u32 cu_information_table_base	: 32;
+	} swreg186;
+
+	struct {
+		u32 cu_information_table_base_msb	: 32;
+	} swreg187;
+
+	struct {
+		u32 cu_information_base	: 32;
+	} swreg188;
+
+	struct {
+		u32 cu_information_base_msb	: 32;
+	} swreg189;
+
+	struct {
+		u32 reserved		: 30;
+		u32 num_long_term_pics	: 2;
+	} swreg190;
+
+	struct {
+		u32 slice_header_size	: 16;
+		u32 prefixnal_svc_ext	: 1;
+		u32 pps_id		: 6;
+		u32 nuh_temporal_id	: 3;
+		u32 nal_unit_type	: 6;
+	} swreg191;
+
+	struct {
+		u32 framenum	: 32;
+	} swreg192;
+
+	struct {
+		u32 entropy_coding_mode		: 1;
+		u32 transform8x8_enable		: 1;
+		u32 idr_pic_id			: 1;
+		u32 nal_ref_idc			: 1;
+		u32 yfill_msb			: 2;
+		u32 xfill_msb			: 2;
+		u32 l0_used_by_next_pic1	: 1;
+		u32 l0_delta_framenum1		: 11;
+		u32 l0_used_by_next_pic0	: 1;
+		u32 l0_delta_framenum0		: 11;
+	} swreg193;
+
+	struct {
+		u32 reserved			: 2;
+		u32 cur_longtermidx		: 3;
+		u32 max_longtermidx_plus1	: 3;
+		u32 l1_used_by_next_pic1	: 1;
+		u32 l1_delta_framenum1		: 11;
+		u32 l1_used_by_next_pic0	: 1;
+		u32 l1_delta_framenum0		: 11;
+	} swreg194;
+
+	struct {
+		u32 reserved			: 2;
+		u32 pic_width_msb		: 2;
+		u32 roi2_bottom_msb		: 1;
+		u32 roi2_top_msb		: 1;
+		u32 roi2_right_msb		: 1;
+		u32 roi2_left_msb		: 1;
+		u32 roi1_bottom_msb		: 1;
+		u32 roi1_top_msb		: 1;
+		u32 roi1_right_msb		: 1;
+		u32 roi1_left_msb		: 1;
+		u32 intra_area_bottom_msb	: 1;
+		u32 intra_area_top_msb		: 1;
+		u32 intra_area_right_msb	: 1;
+		u32 intra_area_left_msb		: 1;
+		u32 cir_interval_msb		: 4;
+		u32 cir_start_msb		: 4;
+		u32 slice_size_msb		: 2;
+		u32 num_slices_ready_msb	: 2;
+		u32 encoded_ctb_number_msb	: 4;
+	} swreg195;
+
+	struct {
+		u32 ctb_row_wr_ptr		: 10;
+		u32 ctb_row_rd_ptr		: 10;
+		u32 num_ctb_rows_per_sync	: 9;
+		u32 input_buf_loopback_en	: 1;
+		u32 low_latency_en		: 1;
+		u32 low_latency_hw_sync_en	: 1;
+	} swreg196;
+
+	union {
+		struct {
+			u32 reserved		: 2;
+			u32 l1_delta_poc0_msb	: 10;
+			u32 l0_delta_poc1_msb	: 10;
+			u32 l0_delta_poc0_msb	: 10;
+		} swreg197;
+
+		struct {
+			u32 ctb_row_rd_ptr_jpeg_msb	: 5;
+			u32 ctb_row_wr_ptr_jpeg_msb	: 5;
+			u32 reserved			: 22;
+		} swreg197_jpeg;
+	};
+
+	struct {
+		u32 l1_longtermidx1		: 3;
+		u32 l1_longtermidx0		: 3;
+		u32 l0_longtermidx1		: 3;
+		u32 l0_longtermidx0		: 3;
+		u32 mark_current_longterm	: 1;
+		u32 l0_delta_framenum0_msb	: 9;
+		u32 l1_delta_poc1_msb		: 10;
+	} swreg198;
+
+	struct {
+		u32 osd_alphablend_enable	: 1;
+		u32 hash_offset			: 2;
+		u32 hash_type			: 2;
+		u32 l1_delta_framenum1_msb	: 9;
+		u32 l1_delta_framenum0_msb	: 9;
+		u32 l0_delta_framenum1_msb	: 9;
+	} swreg199;
+
+	struct {
+		u32 hash_val	: 32;
+	} swreg200;
+
+	struct {
+		u32 mean_thr3	: 8;
+		u32 mean_thr2	: 8;
+		u32 mean_thr1	: 8;
+		u32 mean_thr0	: 8;
+	} swreg201;
+
+	struct {
+		u32 thr_dc_chroma_8x8	: 16;
+		u32 thr_dc_lum_8x8	: 16;
+	} swreg202;
+
+	union {
+		struct {
+			u32 cr_dc_sum_thr	: 8;
+			u32 cb_dc_sum_thr	: 8;
+			u32 reserved		: 8;
+			u32 lum_dc_sum_thr	: 8;
+		} swreg203_h264;
+
+		struct {
+			u32 thr_dc_chroma_16x16	: 16;
+			u32 thr_dc_lum_16x16	: 16;
+		} swreg203_hevc;
+	};
+
+	struct {
+		u32 thr_dc_chroma_32x32	: 16;
+		u32 thr_dc_lum_32x32	: 16;
+	} swreg204;
+
+	struct {
+		u32 thr_ac_num_chroma_8x8	: 16;
+		u32 thr_ac_num_lum_8x8		: 16;
+	} swreg205;
+
+	struct {
+		u32 thr_ac_num_chroma_16x16	: 16;
+		u32 thr_ac_num_lum_16x16	: 16;
+	} swreg206;
+
+	struct {
+		u32 thr_ac_num_chroma_32x32	: 16;
+		u32 thr_ac_num_lum_32x32	: 16;
+	} swreg207;
+
+	union {
+		struct {
+			u32 reserved0			: 3;
+			u32 skip_map_enable		: 1;
+			u32 ipcm1_left			: 9;
+			u32 enable_smart		: 1;
+			u32 foreground_pixel_thx	: 6;
+			u32 reserved1			: 6;
+			u32 smart_qp			: 6;
+		} swreg208_h264;
+
+		struct {
+			u32 reserved			: 3;
+			u32 skip_map_enable		: 1;
+			u32 ipcm1_left			: 9;
+			u32 enable_smart		: 1;
+			u32 foreground_pixel_thx	: 6;
+			u32 mdqpc			: 6;
+			u32 mdqpy			: 6;
+		} swreg208_hevc;
+	};
+
+	struct {
+		u32 reserved		: 3;
+		u32 ipcm_map_enable	: 1;
+		u32 pcm_filter_disable	: 1;
+		u32 ipcm1_bottom	: 9;
+		u32 ipcm1_top		: 9;
+		u32 ipcm1_right		: 9;
+	} swreg209;
+
+	struct {
+		u32 reserved		: 3;
+		u32 ipcm2_left		: 9;
+		u32 input_lu_stride	: 20;
+	} swreg210;
+
+	struct {
+		u32 reserved		: 3;
+		u32 ipcm2_right		: 9;
+		u32 input_ch_stride	: 20;
+	} swreg211;
+
+	struct {
+		u32 reserved		: 3;
+		u32 ipcm2_top		: 9;
+		u32 ref_lu_stride	: 20;
+	} swreg212;
+
+	struct {
+		u32 reserved		: 5;
+		u32 ipcm2_bottom	: 9;
+		u32 ref_ds_lu_stride	: 18;
+	} swreg213;
+
+	struct {
+		u32 hwmaxvideowidthjpeg	: 13;
+		u32 hwmaxvideowidthh264	: 13;
+		u32 hwroimapversion	: 3;
+		u32 hwintratu32support	: 1;
+		u32 hwabsqpsupport	: 1;
+		u32 hwljpegsupport	: 1;
+	} swreg214;
+
+	struct {
+		u32 totalarlen	: 32;
+	} swreg215;
+
+	struct {
+		u32 totalr	: 32;
+	} swreg216;
+
+	struct {
+		u32 totalar	: 32;
+	} swreg217;
+
+	struct {
+		u32 totalrlast	: 32;
+	} swreg218;
+
+	struct {
+		u32 totalawlen	: 32;
+	} swreg219;
+
+	struct {
+		u32 totalw	: 32;
+	} swreg220;
+
+	struct {
+		u32 totalaw	: 32;
+	} swreg221;
+
+	struct {
+		u32 totalwlast	: 32;
+	} swreg222;
+
+	struct {
+		u32 totalb	: 32;
+	} swreg223;
+
+	struct {
+		u32 cb_const_pixel	: 10;
+		u32 cr_const_pixel	: 10;
+		u32 skipframe_en	: 1;
+		u32 ssim_en		: 1;
+		u32 reserved		: 9;
+		u32 chroma_const_en	: 1;
+	} swreg224;
+
+	struct {
+		u32 reserved					: 6;
+		u32 roimap_qpdelta_ver				: 3;
+		u32 roimap_cuctrl_ver				: 3;
+		u32 roimap_cuctrl_enable			: 1;
+		u32 roimap_cuctrl_index_enable			: 1;
+		u32 loop_filter_across_tiles_enabled_flag	: 1;
+		u32 tiles_enabled_flag				: 1;
+		u32 num_tile_rows				: 8;
+		u32 num_tile_columns				: 8;
+	} swreg225;
+
+	struct {
+		u32 hwdynamicmaxtusize		: 1;
+		u32 hwiframeonly		: 1;
+		u32 hwstreamsegmentsupport	: 1;
+		u32 hwstreambufchain		: 1;
+		u32 hwinloopdsratio		: 1;
+		u32 hwmultipasssupport		: 1;
+		u32 hwrdoqsupport		: 1;
+		u32 bframe_me4n_hor_searchrange	: 2;
+		u32 hwroi8support		: 1;
+		u32 hwgmvsupport		: 1;
+		u32 hwjpeg422support		: 1;
+		u32 hwctbrcversion		: 3;
+		u32 me_vert_searchrange_h264	: 6;
+		u32 me_vert_searchrange_hevc	: 6;
+		u32 hwcuinforversion		: 3;
+		u32 hwp010refsupport		: 1;
+		u32 hwssimsupport		: 1;
+	} swreg226;
+
+	struct {
+		u32 ssim_y_numerator_lsb	: 32;
+	} swreg227;
+
+	struct {
+		u32 ssim_y_numerator_msb	: 32;
+	} swreg228;
+
+	struct {
+		u32 ssim_u_numerator_lsb	: 32;
+	} swreg229;
+
+	struct {
+		u32 ssim_u_numerator_msb	: 32;
+	} swreg230;
+
+	struct {
+		u32 ssim_v_numerator_lsb	: 32;
+	} swreg231;
+
+	struct {
+		u32 ssim_v_numerator_msb	: 32;
+	} swreg232;
+
+	struct {
+		u32 ssim_y_denominator	: 32;
+	} swreg233;
+
+	struct {
+		u32 ssim_uv_denominator	: 32;
+	} swreg234;
+
+	struct {
+		u32 rps_used_by_cur_1	: 1;
+		u32 rps_used_by_cur_0	: 1;
+		u32 rps_delta_poc_2	: 10;
+		u32 rps_delta_poc_1	: 10;
+		u32 rps_delta_poc_0	: 10;
+	} swreg235;
+
+	struct {
+		u32 reserved				: 12;
+		u32 p010_ref_enable			: 1;
+		u32 short_term_ref_pic_set_sps_flag	: 1;
+		u32 rps_pos_pic_num			: 3;
+		u32 rps_neg_pic_num			: 3;
+		u32 rps_used_by_cur_3			: 1;
+		u32 rps_used_by_cur_2			: 1;
+		u32 rps_delta_poc_3			: 10;
+	} swreg236;
+
+	struct {
+		u32 reserved		: 11;
+		u32 dummyreaden		: 1;
+		u32 ref_ch_stride	: 20;
+	} swreg237;
+
+	struct {
+		u32 dummyreadaddr	: 32;
+	} swreg238;
+
+	struct {
+		u32 current_ctb_mad_base	: 32;
+	} swreg239;
+
+	struct {
+		u32 current_ctb_mad_base_msb	: 32;
+	} swreg240;
+
+	struct {
+		u32 previous_ctb_mad_base	: 32;
+	} swreg241;
+
+	struct {
+		u32 previous_ctb_mad_base_msb	: 32;
+	} swreg242;
+
+	struct {
+		u32 reserved		: 11;
+		u32 ctb_rc_model_param0	: 21;
+	} swreg243;
+
+	struct {
+		u32 reserved		: 2;
+		u32 roi3_qp_type	: 1;
+		u32 roi3_qp_value	: 7;
+		u32 ctb_rc_model_param1	: 22;
+	} swreg244;
+
+	struct {
+		u32 rc_qpdelta_range_msb	: 2;
+		u32 ctb_rc_row_factor		: 16;
+		u32 ctb_rc_model_param_min	: 14;
+	} swreg245;
+
+	struct {
+		u32 reserved			: 3;
+		u32 ctb_rc_delay		: 3;
+		u32 axi_write_outstanding_num	: 8;
+		u32 ctb_rc_qp_step		: 18;
+	} swreg246;
+
+	struct {
+		u32 reserved0			: 1;
+		u32 ctb_rc_prev_mad_valid	: 1;
+		u32 reserved1			: 4;
+		u32 prev_pic_lum_mad		: 26;
+	} swreg247;
+
+	struct {
+		u32 roi4_qp_type	: 1;
+		u32 roi4_qp_value	: 7;
+		u32 ctb_qp_sum_for_rc	: 24;
+	} swreg248;
+
+	union {
+		struct {
+			u32 reserved			: 3;
+			u32 ipcm2_bottom_msb		: 1;
+			u32 ipcm2_top_msb		: 1;
+			u32 ipcm2_right_msb		: 1;
+			u32 ipcm2_left_msb		: 1;
+			u32 ipcm1_bottom_msb		: 1;
+			u32 ipcm1_top_msb		: 1;
+			u32 ipcm1_right_msb		: 1;
+			u32 ipcm1_left_msb		: 1;
+			u32 pic_width_msb2		: 1;
+			u32 roi2_bottom_msb2		: 1;
+			u32 roi2_top_msb2		: 1;
+			u32 roi2_right_msb2		: 1;
+			u32 roi2_left_msb2		: 1;
+			u32 roi1_bottom_msb2		: 1;
+			u32 roi1_top_msb2		: 1;
+			u32 roi1_right_msb2		: 1;
+			u32 roi1_left_msb2		: 1;
+			u32 intra_area_bottom_msb2	: 1;
+			u32 intra_area_top_msb2		: 1;
+			u32 intra_area_right_msb2	: 1;
+			u32 intra_area_left_msb2	: 1;
+			u32 cir_interval_msb2		: 2;
+			u32 cir_start_msb2		: 2;
+			u32 slice_size_msb2		: 1;
+			u32 num_slices_ready_msb2	: 1;
+			u32 encoded_ctb_number_msb2	: 2;
+		} swreg249;
+
+		struct {
+			u32 reserved0		: 5;
+			u32 jpeg_rowlength_msb	: 2;
+			u32 jpeg_pic_height_msb	: 2;
+			u32 jpeg_pic_width_msb	: 2;
+			u32 reserved1		: 21;
+		} swreg249_jpeg;
+	};
+
+	struct {
+		u32 reserved			: 4;
+		u32 global_vertical_mv_l0	: 14;
+		u32 global_horizontal_mv_l0	: 14;
+	} swreg250;
+
+	struct {
+		u32 reserved			: 4;
+		u32 global_vertical_mv_l1	: 14;
+		u32 global_horizontal_mv_l1	: 14;
+	} swreg251;
+
+	struct {
+		u32 reserved	: 2;
+		u32 roi3_right	: 10;
+		u32 roi3_top	: 10;
+		u32 roi3_left	: 10;
+	} swreg252;
+
+	struct {
+		u32 reserved	: 2;
+		u32 roi4_top	: 10;
+		u32 roi4_left	: 10;
+		u32 roi3_bottom	: 10;
+	} swreg253;
+
+	struct {
+		u32 reserved	: 2;
+		u32 roi5_left	: 10;
+		u32 roi4_bottom	: 10;
+		u32 roi4_right	: 10;
+	} swreg254;
+
+	struct {
+		u32 reserved	: 2;
+		u32 roi5_bottom	: 10;
+		u32 roi5_right	: 10;
+		u32 roi5_top	: 10;
+	} swreg255;
+
+	struct {
+		u32 reserved	: 2;
+		u32 roi6_right	: 10;
+		u32 roi6_top	: 10;
+		u32 roi6_left	: 10;
+	} swreg256;
+
+	struct {
+		u32 reserved	: 2;
+		u32 roi7_top	: 10;
+		u32 roi7_left	: 10;
+		u32 roi6_bottom	: 10;
+	} swreg257;
+
+	struct {
+		u32 reserved	: 2;
+		u32 roi8_left	: 10;
+		u32 roi7_bottom	: 10;
+		u32 roi7_right	: 10;
+	} swreg258;
+
+	struct {
+		u32 reserved				: 1;
+		u32 current_max_tu_size_decrease	: 1;
+		u32 roi8_bottom				: 10;
+		u32 roi8_right				: 10;
+		u32 roi8_top				: 10;
+	} swreg259;
+
+	struct {
+		u32 roi5_qp_type	: 1;
+		u32 roi5_qp_value	: 7;
+		u32 roi6_qp_type	: 1;
+		u32 roi6_qp_value	: 7;
+		u32 roi7_qp_type	: 1;
+		u32 roi7_qp_value	: 7;
+		u32 roi8_qp_type	: 1;
+		u32 roi8_qp_value	: 7;
+	} swreg260;
+
+	struct {
+		u32 motion_score_enable		: 1;
+		u32 pass1_skip_cabac		: 1;
+		u32 rdoq_enable			: 1;
+		u32 multi_core_en		: 1;
+		u32 axi_read_outstanding_num	: 8;
+		u32 prp_in_loop_ds_ratio	: 1;
+		u32 rgblumaoffset		: 5;
+		u32 reserved			: 14;
+	} swreg261;
+
+	struct {
+		u32 lum_sse_div_256	: 32;
+	} swreg262;
+
+	struct {
+		u32 cb_sse_div_64	: 32;
+	} swreg263;
+
+	struct {
+		u32 cr_sse_div_64	: 32;
+	} swreg264;
+
+	struct {
+		u32 ddr_polling_interval	: 16;
+		u32 ref_ready_threshold		: 16;
+	} swreg265;
+
+	struct {
+		u32 multicore_sync_l0_addr	: 32;
+	} swreg266;
+
+	struct {
+		u32 multicore_sync_l0_addr_msb	: 32;
+	} swreg267;
+
+	struct {
+		u32 multicore_sync_l1_addr	: 32;
+	} swreg268;
+
+	struct {
+		u32 multicore_sync_l1_addr_msb	: 32;
+	} swreg269;
+
+	struct {
+		u32 multicore_sync_rec_addr	: 32;
+	} swreg270;
+
+	struct {
+		u32 multicore_sync_rec_addr_msb	: 32;
+	} swreg271;
+
+	struct {
+		u32 wr_urgent_disable_threshold	: 8;
+		u32 wr_urgent_enable_threshold	: 8;
+		u32 rd_urgent_disable_threshold	: 8;
+		u32 rd_urgent_enable_threshold	: 8;
+	} swreg272;
+
+	struct {
+		u32 roimap_cuctrl_index_addr	: 32;
+	} swreg273;
+
+	struct {
+		u32 roimap_cuctrl_index_addr_msb	: 32;
+	} swreg274;
+
+	struct {
+		u32 roimap_cuctrl_addr	: 32;
+	} swreg275;
+
+	struct {
+		u32 roimap_cuctrl_addr_msb	: 32;
+	} swreg276;
+
+	struct {
+		u32 reserved			: 5;
+		u32 syn_amount_per_loopback	: 15;
+		u32 pic_order_cnt_type		: 2;
+		u32 log2_max_frame_num		: 5;
+		u32 log2_max_pic_order_cnt_lsb	: 5;
+	} swreg277;
+
+	struct {
+		u32 output_strm_buf1_base	: 32;
+	} swreg278;
+
+	struct {
+		u32 output_strm_buf1_base_msb	: 32;
+	} swreg279;
+
+	struct {
+		u32 output_strm_buffer1_limit	: 32;
+	} swreg280;
+
+	struct {
+		u32 reserved			: 2;
+		u32 chroma_format_idc		: 2;
+		u32 num_ctb_rows_per_sync_msb	: 6;
+		u32 strm_segment_wr_ptr		: 10;
+		u32 strm_segment_rd_ptr		: 10;
+		u32 strm_segment_en		: 1;
+		u32 strm_segment_sw_sync_en	: 1;
+	} swreg281;
+
+	struct {
+		u32 strm_segment_size	: 32;
+	} swreg282;
+
+	struct {
+		u32 motion_score_l0_0	: 32;
+	} swreg283;
+
+	struct {
+		u32 motion_score_l0_1	: 32;
+	} swreg284;
+
+	struct {
+		u32 motion_score_l1_0	: 32;
+	} swreg285;
+
+	struct {
+		u32 motion_score_l1_1	: 32;
+	} swreg286;
+
+	struct {
+		u32 reserved0			: 21;
+		u32 hwmonochromesupport		: 1;
+		u32 hwmevertrangeprogramable	: 1;
+		u32 hwctbrcmoremode		: 1;
+		u32 reserved1			: 4;
+		u32 hwcutreesupport		: 1;
+		u32 hwscaler420support		: 1;
+		u32 hwcscextensionsupport	: 1;
+		u32 hwvideoheightext		: 1;
+	} swreg287;
+
+	struct {
+		u32 reserved			: 12;
+		u32 cuinfoversion		: 3;
+		u32 ctb_qp_sum_for_rc_msb	: 2;
+		u32 pic_complexity_msb		: 4;
+		u32 qp_num_msb			: 3;
+		u32 qp_sum_msb			: 2;
+		u32 skipcu8num_msb		: 3;
+		u32 intracu8num_msb		: 3;
+	} swreg288;
+
+	struct {
+		u32 rgbcoeffh	: 16;
+		u32 rgbcoeffg	: 16;
+	} swreg289;
+
+	struct {
+		u32 totalarlen2	: 32;
+	} swreg290;
+
+	struct {
+		u32 totalr2	: 32;
+	} swreg291;
+
+	struct {
+		u32 totalar2	: 32;
+	} swreg292;
+
+	struct {
+		u32 totalrlast2	: 32;
+	} swreg293;
+
+	struct {
+		u32 totalawlen2	: 32;
+	} swreg294;
+
+	struct {
+		u32 totalw2	: 32;
+	} swreg295;
+
+	struct {
+		u32 totalaw2	: 32;
+	} swreg296;
+
+	struct {
+		u32 totalwlast2	: 32;
+	} swreg297;
+
+	struct {
+		u32 totalb2	: 32;
+	} swreg298;
+
+	struct {
+		u32 ext_sram_lum_fwd_base	: 32;
+	} swreg299;
+
+	struct {
+		u32 ext_sram_lum_fwd_base_msb	: 32;
+	} swreg300;
+
+	struct {
+		u32 ext_sram_lum_bwd_base	: 32;
+	} swreg301;
+
+	struct {
+		u32 ext_sram_lum_bwd_base_msb	: 32;
+	} swreg302;
+
+	struct {
+		u32 ext_sram_chr_fwd_base	: 32;
+	} swreg303;
+
+	struct {
+		u32 ext_sram_chr_fwd_base_msb	: 32;
+	} swreg304;
+
+	struct {
+		u32 ext_sram_chr_bwd_base	: 32;
+	} swreg305;
+
+	struct {
+		u32 ext_sram_chr_bwd_base_msb	: 32;
+	} swreg306;
+
+	struct {
+		u32 extlinebuffer_linecnt_chr_bwd	: 8;
+		u32 extlinebuffer_linecnt_chr_fwd	: 8;
+		u32 extlinebuffer_linecnt_lum_bwd	: 8;
+		u32 extlinebuffer_linecnt_lum_fwd	: 8;
+	} swreg307;
+
+	struct {
+		u32 axi_strm_write_pending	: 32;
+	} swreg308;
+
+	struct {
+		u32 axi_recon_write_pending	: 32;
+	} swreg309;
+
+	struct {
+		u32 axi_rec4n_write_pending	: 32;
+	} swreg310;
+
+	struct {
+		u32 axi_prp_read_pending	: 32;
+	} swreg311;
+
+	struct {
+		u32 axi_ref_read_pending	: 32;
+	} swreg312;
+
+	struct {
+		u32 axi_ref4n_read_pending	: 32;
+	} swreg313;
+
+	struct {
+		u32 axi_rcroi_read_pending	: 32;
+	} swreg314;
+
+	struct {
+		u32 axi_read_channel_pending	: 32;
+	} swreg315;
+
+	struct {
+		u32 axi_write_channel_pending	: 32;
+	} swreg316;
+
+	struct {
+		u32 axi_total_pending	: 32;
+	} swreg317;
+
+	struct {
+		u32 hw_debug	: 32;
+	} swreg318;
+
+	struct {
+		u32 axi_burst_align_fuse_rd_lu_ref_prefetch	: 4;
+		u32 axi_burst_align_fuse_rd_ch_ref_prefetch	: 4;
+		u32 axi_burst_align_fuse_rd_prp			: 4;
+		u32 axi_burst_align_fuse_rd_common		: 4;
+		u32 axi_burst_align_fuse_wr_luma_ref		: 4;
+		u32 axi_burst_align_fuse_wr_chroma_ref		: 4;
+		u32 axi_burst_align_fuse_wr_stream		: 4;
+		u32 axi_burst_align_fuse_wr_common		: 4;
+	} swreg319;
+
+	struct {
+		u32 axi_burst_align_rd_lu_ref_prefetch	: 4;
+		u32 axi_burst_align_rd_ch_ref_prefetch	: 4;
+		u32 axi_burst_align_rd_prp		: 4;
+		u32 axi_burst_align_rd_common		: 4;
+		u32 axi_burst_align_wr_luma_ref		: 4;
+		u32 axi_burst_align_wr_chroma_ref	: 4;
+		u32 axi_burst_align_wr_stream		: 4;
+		u32 axi_burst_align_wr_common		: 4;
+	} swreg320;
+
+	struct {
+		u32 reserved				: 26;
+		u32 me_assigned_vert_search_range	: 6;
+	} swreg321;
+} __packed;
+
+#endif /* HANTRO_VC8000E_REGS_H_ */
-- 
2.53.0


