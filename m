Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1A1A496B
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbfIAMqM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:46:12 -0400
Received: from mail-oln040092064108.outbound.protection.outlook.com ([40.92.64.108]:53826
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728970AbfIAMqB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:46:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrpXxN4zNOAv8zERvdhNKAOySd9HdpctU7WZ4aS1yjGWwCTM+W83/Xbwd0UG76rQZ+tlSjXZWs5Di0bNIFJ8oBLhPAsl1yUv6mtkDsRIvGOrJFZwT3A/Wn77Q68s1sq3j5Y3l5D6gojxA4NRjCArKGkaBFAVfy0ExjtxoWSr/jVqgM0NPoqsD9ilhk1uHCccJ+xpsz2JBnTJym8BYg+T9IoE9l3ie1Luz+IWEfH6wI8gN6L1TYKsExxul9qiKn7r5CQbn2hPUehM+7MMG1L7W06JDoNfFeTbO3wShMNWDoYysYO/g4TjZGLuKcL6WssW84zvvKADG4cAuhrPngMQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9OG31Muctaf9fgdR/q4mG3Q8ZclLq6FKBFFUjh1ZRo=;
 b=J04QAcwUmKN3tq+3spbzf5Qccst+709Yw8FKShcQ20VeAhywGuPyn76lItb0VA7NvydqQQu9W5hYp0cUXjYiL3PjNlvWVphzCDH15KogtyyK6FHmnops4ysWg9iD+wqJaq6Nn0UfIx1kYBzPAeXXVTS1LRj/NSfLzDS6OCY7zcUxF7y9hlS0DguL3ZPENQAtE+dNwHaSkhjLIfEOl7o8CUIBxvDdwYBtaAKJ+LNOw0tdDajM7L0gAyBqSe1CZhau9duYPK5lRVA08Qcpl68IvJXf+rx052sWRrzICKAcMofP+et7q96fu6gyAxcg5FdgZBHlAb3O5trb4RHJFDN0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.51) by HE1EUR01HT073.eop-EUR01.prod.protection.outlook.com
 (10.152.1.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:47 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [RFC 09/12] media: hantro: Refactor G1 H264 code
Thread-Topic: [RFC 09/12] media: hantro: Refactor G1 H264 code
Thread-Index: AQHVYMMt6S6DYZer7kW/prgSt9wEcg==
Date:   Sun, 1 Sep 2019 12:45:47 +0000
Message-ID: <HE1PR06MB401165F2BA0AD8A634FDFAF2ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
In-Reply-To: <20190901124531.23645-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0343.eurprd05.prod.outlook.com
 (2603:10a6:7:92::38) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:B4C7CA06B254E5D062300427D4773F24B6670FC6B03A4439CA03D3C536D94F63;UpperCasedChecksum:9C3770E98E46D674140D89E7EF4CA3155D7DC4BB8F3F0586E06E0722FDC4A6FB;SizeAsReceived:7865;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [3dRDy0Sj/eI9b+QVLpb0m+Zm/L03olPl]
x-microsoft-original-message-id: <20190901124531.23645-9-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT073;
x-ms-traffictypediagnostic: HE1EUR01HT073:
x-microsoft-antispam-message-info: SV5lu3PcfjwDXEawHYHCfSbanizRxYAQdTgg5oMgDTP2ygWa8SBjGJjAy0OTlj1yzFaQ9F9Ie1c/GbO+Vp3xooi/vcHcw4+zk45mO/FLRI+WfZTAHblQ+7Y1asBo5HOB3mSABAOHJ0+4eSbe//p9EqQ7gbK6UDxrryx4wRnzpWqAr0Of3ycdKw7idz2tidiA
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d71a2169-49a4-47a4-4057-08d72eda4fbc
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:47.5428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT073
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use generated code from my rockchip-vpu-regtool

This need code cleanup and formatting

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../staging/media/hantro/hantro_g1_h264_dec.c | 661 +++++++++++-------
 drivers/staging/media/hantro/hantro_h264.c    |  14 +
 drivers/staging/media/hantro/hantro_hw.h      |   2 +
 3 files changed, 439 insertions(+), 238 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index bc628ef73b29..4b82b9fd5252 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Rockchip RK3288 VPU codec driver
+ * Hantro VPU codec driver
  *
  * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
  *	Hertz Wong <hertz.wong@rock-chips.com>
@@ -15,273 +15,458 @@
 
 #include <media/v4l2-mem2mem.h>
 
-#include "hantro_g1_regs.h"
 #include "hantro_hw.h"
 #include "hantro_v4l2.h"
 
 #define MV_OFFSET_420	384
 #define MV_OFFSET_400	256
 
-static void set_params(struct hantro_ctx *ctx)
-{
-	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
-	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
-	const struct v4l2_ctrl_h264_slice_params *slices = ctrls->slices;
-	const struct v4l2_ctrl_h264_sps *sps = ctrls->sps;
-	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
-	struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
-	struct hantro_dev *vpu = ctx->dev;
-	u32 reg;
-
-	/* Decoder control register 0. */
-	reg = G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0x0);
-	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
-		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
-	reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
-	if (dec_param->nal_ref_idc)
-		reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
-
-	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
-	    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD ||
-	     slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
-		reg |= G1_REG_DEC_CTRL0_PIC_INTERLACE_E;
-	if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
-		reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
-	if (!(slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD))
-		reg |= G1_REG_DEC_CTRL0_PIC_TOPFIELD_E;
-	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
-
-	/* Decoder control register 1. */
-	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(H264_MB_WIDTH(ctx->dst_fmt.width)) |
-	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(H264_MB_HEIGHT(ctx->dst_fmt.height)) |
-	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
-	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
-
-	/* Decoder control register 2. */
-	reg = G1_REG_DEC_CTRL2_CH_QP_OFFSET(pps->chroma_qp_index_offset) |
-	      G1_REG_DEC_CTRL2_CH_QP_OFFSET2(pps->second_chroma_qp_index_offset);
-
-	/* always use the matrix sent from userspace */
-	reg |= G1_REG_DEC_CTRL2_TYPE1_QUANT_E;
-
-	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
-		reg |= G1_REG_DEC_CTRL2_FIELDPIC_FLAG_E;
-	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL2);
-
-	/* Decoder control register 3. */
-	reg = G1_REG_DEC_CTRL3_START_CODE_E |
-	      G1_REG_DEC_CTRL3_INIT_QP(pps->pic_init_qp_minus26 + 26) |
-	      G1_REG_DEC_CTRL3_STREAM_LEN(vb2_get_plane_payload(&src_buf->vb2_buf, 0));
-	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL3);
-
-	/* Decoder control register 4. */
-	reg = G1_REG_DEC_CTRL4_FRAMENUM_LEN(sps->log2_max_frame_num_minus4 + 4) |
-	      G1_REG_DEC_CTRL4_FRAMENUM(slices[0].frame_num) |
-	      G1_REG_DEC_CTRL4_WEIGHT_BIPR_IDC(pps->weighted_bipred_idc);
-	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)
-		reg |= G1_REG_DEC_CTRL4_CABAC_E;
-	if (sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)
-		reg |= G1_REG_DEC_CTRL4_DIR_8X8_INFER_E;
-	if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)
-		reg |= G1_REG_DEC_CTRL4_BLACKWHITE_E;
-	if (pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED)
-		reg |= G1_REG_DEC_CTRL4_WEIGHT_PRED_E;
-	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL4);
-
-	/* Decoder control register 5. */
-	reg = G1_REG_DEC_CTRL5_REFPIC_MK_LEN(slices[0].dec_ref_pic_marking_bit_size) |
-	      G1_REG_DEC_CTRL5_IDR_PIC_ID(slices[0].idr_pic_id);
-	if (pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED)
-		reg |= G1_REG_DEC_CTRL5_CONST_INTRA_E;
-	if (pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT)
-		reg |= G1_REG_DEC_CTRL5_FILT_CTRL_PRES;
-	if (pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT)
-		reg |= G1_REG_DEC_CTRL5_RDPIC_CNT_PRES;
-	if (pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE)
-		reg |= G1_REG_DEC_CTRL5_8X8TRANS_FLAG_E;
-	if (dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC)
-		reg |= G1_REG_DEC_CTRL5_IDR_PIC_E;
-	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL5);
-
-	/* Decoder control register 6. */
-	reg = G1_REG_DEC_CTRL6_PPS_ID(slices[0].pic_parameter_set_id) |
-	      G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
-	      G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
-	      G1_REG_DEC_CTRL6_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
-	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL6);
-
-	/* Error concealment register. */
-	vdpu_write_relaxed(vpu, 0, G1_REG_ERR_CONC);
-
-	/* Prediction filter tap register. */
-	vdpu_write_relaxed(vpu,
-			   G1_REG_PRED_FLT_PRED_BC_TAP_0_0(1) |
-			   G1_REG_PRED_FLT_PRED_BC_TAP_0_1(-5 & 0x3ff) |
-			   G1_REG_PRED_FLT_PRED_BC_TAP_0_2(20),
-			   G1_REG_PRED_FLT);
-
-	/* Reference picture buffer control register. */
-	vdpu_write_relaxed(vpu, 0, G1_REG_REF_BUF_CTRL);
-
-	/* Reference picture buffer control register 2. */
-	vdpu_write_relaxed(vpu, G1_REG_REF_BUF_CTRL2_APF_THRESHOLD(8),
-			   G1_REG_REF_BUF_CTRL2);
-}
+#define G1_SWREG(nr)			((nr) * 4)
+
+#define G1_REG_RLC_VLC_BASE		G1_SWREG(12)
+#define G1_REG_DEC_OUT_BASE		G1_SWREG(13)
+#define G1_REG_REFER0_BASE		G1_SWREG(14)
+#define G1_REG_REFER1_BASE		G1_SWREG(15)
+#define G1_REG_REFER2_BASE		G1_SWREG(16)
+#define G1_REG_REFER3_BASE		G1_SWREG(17)
+#define G1_REG_REFER4_BASE		G1_SWREG(18)
+#define G1_REG_REFER5_BASE		G1_SWREG(19)
+#define G1_REG_REFER6_BASE		G1_SWREG(20)
+#define G1_REG_REFER7_BASE		G1_SWREG(21)
+#define G1_REG_REFER8_BASE		G1_SWREG(22)
+#define G1_REG_REFER9_BASE		G1_SWREG(23)
+#define G1_REG_REFER10_BASE		G1_SWREG(24)
+#define G1_REG_REFER11_BASE		G1_SWREG(25)
+#define G1_REG_REFER12_BASE		G1_SWREG(26)
+#define G1_REG_REFER13_BASE		G1_SWREG(27)
+#define G1_REG_REFER14_BASE		G1_SWREG(28)
+#define G1_REG_REFER15_BASE		G1_SWREG(29)
+#define G1_REG_QTABLE_BASE		G1_SWREG(40)
+#define G1_REG_DIR_MV_BASE		G1_SWREG(41)
+#define G1_REG_DEC_E(v)			((v) ? BIT(0) : 0)
+
+#define G1_REG_DEC_AXI_RD_ID(v)		(((v) << 24) & GENMASK(31, 24))
+#define G1_REG_DEC_TIMEOUT_E(v)		((v) ? BIT(23) : 0)
+#define G1_REG_DEC_STRSWAP32_E(v)	((v) ? BIT(22) : 0)
+#define G1_REG_DEC_STRENDIAN_E(v)	((v) ? BIT(21) : 0)
+#define G1_REG_DEC_INSWAP32_E(v)	((v) ? BIT(20) : 0)
+#define G1_REG_DEC_OUTSWAP32_E(v)	((v) ? BIT(19) : 0)
+#define G1_REG_DEC_DATA_DISC_E(v)	((v) ? BIT(18) : 0)
+#define G1_REG_DEC_LATENCY(v)		(((v) << 11) & GENMASK(16, 11))
+#define G1_REG_DEC_CLK_GATE_E(v)	((v) ? BIT(10) : 0)
+#define G1_REG_DEC_IN_ENDIAN(v)		((v) ? BIT(9) : 0)
+#define G1_REG_DEC_OUT_ENDIAN(v)	((v) ? BIT(8) : 0)
+#define G1_REG_DEC_ADV_PRE_DIS(v)	((v) ? BIT(6) : 0)
+#define G1_REG_DEC_SCMD_DIS(v)		((v) ? BIT(5) : 0)
+#define G1_REG_DEC_MAX_BURST(v)		(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_DEC_MODE(v)		(((v) << 28) & GENMASK(31, 28))
+#define G1_REG_RLC_MODE_E(v)		((v) ? BIT(27) : 0)
+#define G1_REG_PIC_INTERLACE_E(v)	((v) ? BIT(23) : 0)
+#define G1_REG_PIC_FIELDMODE_E(v)	((v) ? BIT(22) : 0)
+#define G1_REG_PIC_TOPFIELD_E(v)	((v) ? BIT(19) : 0)
+#define G1_REG_FILTERING_DIS(v)		((v) ? BIT(14) : 0)
+#define G1_REG_PIC_FIXED_QUANT(v)	((v) ? BIT(13) : 0)
+#define G1_REG_WRITE_MVS_E(v)		((v) ? BIT(12) : 0)
+#define G1_REG_SEQ_MBAFF_E(v)		((v) ? BIT(10) : 0)
+#define G1_REG_PICORD_COUNT_E(v)	((v) ? BIT(9) : 0)
+#define G1_REG_DEC_AXI_WR_ID(v)		(((v) << 0) & GENMASK(7, 0))
+
+#define G1_REG_PIC_MB_WIDTH(v)		(((v) << 23) & GENMASK(31, 23))
+#define G1_REG_PIC_MB_HEIGHT_P(v)	(((v) << 11) & GENMASK(18, 11))
+#define G1_REG_REF_FRAMES(v)		(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_STRM_START_BIT(v)	(((v) << 26) & GENMASK(31, 26))
+#define G1_REG_TYPE1_QUANT_E(v)		((v) ? BIT(24) : 0)
+#define G1_REG_CH_QP_OFFSET(v)		(((v) << 19) & GENMASK(23, 19))
+#define G1_REG_CH_QP_OFFSET2(v)		(((v) << 14) & GENMASK(18, 14))
+#define G1_REG_FIELDPIC_FLAG_E(v)	((v) ? BIT(0) : 0)
+
+#define G1_REG_START_CODE_E(v)		((v) ? BIT(31) : 0)
+#define G1_REG_INIT_QP(v)		(((v) << 25) & GENMASK(30, 25))
+#define G1_REG_CH_8PIX_ILEAV_E(v)	((v) ? BIT(24) : 0)
+#define G1_REG_STREAM_LEN(v)		(((v) << 0) & GENMASK(23, 0))
+
+#define G1_REG_CABAC_E(v)		((v) ? BIT(31) : 0)
+#define G1_REG_BLACKWHITE_E(v)		((v) ? BIT(30) : 0)
+#define G1_REG_DIR_8X8_INFER_E(v)	((v) ? BIT(29) : 0)
+#define G1_REG_WEIGHT_PRED_E(v)		((v) ? BIT(28) : 0)
+#define G1_REG_WEIGHT_BIPR_IDC(v)	(((v) << 26) & GENMASK(27, 26))
+#define G1_REG_FRAMENUM_LEN(v)		(((v) << 16) & GENMASK(20, 16))
+#define G1_REG_FRAMENUM(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_CONST_INTRA_E(v)		((v) ? BIT(31) : 0)
+#define G1_REG_FILT_CTRL_PRES(v)	((v) ? BIT(30) : 0)
+#define G1_REG_RDPIC_CNT_PRES(v)	((v) ? BIT(29) : 0)
+#define G1_REG_8X8TRANS_FLAG_E(v)	((v) ? BIT(28) : 0)
+#define G1_REG_REFPIC_MK_LEN(v)		(((v) << 17) & GENMASK(27, 17))
+#define G1_REG_IDR_PIC_E(v)		((v) ? BIT(16) : 0)
+#define G1_REG_IDR_PIC_ID(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_PPS_ID(v)		(((v) << 24) & GENMASK(31, 24))
+#define G1_REG_REFIDX1_ACTIVE(v)	(((v) << 19) & GENMASK(23, 19))
+#define G1_REG_REFIDX0_ACTIVE(v)	(((v) << 14) & GENMASK(18, 14))
+#define G1_REG_POC_LENGTH(v)		(((v) << 0) & GENMASK(7, 0))
+
+#define G1_REG_PINIT_RLIST_F9(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_PINIT_RLIST_F8(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_PINIT_RLIST_F7(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_PINIT_RLIST_F6(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_PINIT_RLIST_F5(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_PINIT_RLIST_F4(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_PINIT_RLIST_F15(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_PINIT_RLIST_F14(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_PINIT_RLIST_F13(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_PINIT_RLIST_F12(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_PINIT_RLIST_F11(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_PINIT_RLIST_F10(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_REFER1_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER0_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER3_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER2_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER5_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER4_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER7_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER6_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER9_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER8_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER11_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER10_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER13_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER12_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER15_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define G1_REG_REFER14_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define G1_REG_REFER_LTERM_E(v)		(((v) << 0) & GENMASK(31, 0))
+
+#define G1_REG_REFER_VALID_E(v)		(((v) << 0) & GENMASK(31, 0))
+
+#define G1_REG_BINIT_RLIST_B2(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_BINIT_RLIST_F2(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_BINIT_RLIST_B1(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_BINIT_RLIST_F1(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_BINIT_RLIST_B0(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_BINIT_RLIST_F0(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_BINIT_RLIST_B5(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_BINIT_RLIST_F5(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_BINIT_RLIST_B4(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_BINIT_RLIST_F4(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_BINIT_RLIST_B3(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_BINIT_RLIST_F3(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_BINIT_RLIST_B8(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_BINIT_RLIST_F8(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_BINIT_RLIST_B7(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_BINIT_RLIST_F7(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_BINIT_RLIST_B6(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_BINIT_RLIST_F6(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_BINIT_RLIST_B11(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_BINIT_RLIST_F11(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_BINIT_RLIST_B10(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_BINIT_RLIST_F10(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_BINIT_RLIST_B9(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_BINIT_RLIST_F9(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_BINIT_RLIST_B14(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_BINIT_RLIST_F14(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_BINIT_RLIST_B13(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_BINIT_RLIST_F13(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_BINIT_RLIST_B12(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_BINIT_RLIST_F12(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_PINIT_RLIST_F3(v)	(((v) << 25) & GENMASK(29, 25))
+#define G1_REG_PINIT_RLIST_F2(v)	(((v) << 20) & GENMASK(24, 20))
+#define G1_REG_PINIT_RLIST_F1(v)	(((v) << 15) & GENMASK(19, 15))
+#define G1_REG_PINIT_RLIST_F0(v)	(((v) << 10) & GENMASK(14, 10))
+#define G1_REG_BINIT_RLIST_B15(v)	(((v) << 5) & GENMASK(9, 5))
+#define G1_REG_BINIT_RLIST_F15(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define G1_REG_STARTMB_X(v)		(((v) << 23) & GENMASK(31, 23))
+#define G1_REG_STARTMB_Y(v)		(((v) << 15) & GENMASK(22, 15))
+
+#define G1_REG_PRED_BC_TAP_0_0(v)	(((v) << 22) & GENMASK(31, 22))
+#define G1_REG_PRED_BC_TAP_0_1(v)	(((v) << 12) & GENMASK(21, 12))
+#define G1_REG_PRED_BC_TAP_0_2(v)	(((v) << 2) & GENMASK(11, 2))
+
+#define G1_REG_REFBU_E(v)		((v) ? BIT(31) : 0)
+
+#define G1_REG_APF_THRESHOLD(v)		(((v) << 0) & GENMASK(13, 0))
+>>>>>>> b22734fb5e2c... Ymedia: hantro: Refactor G1 H264 code
 
-static void set_ref(struct hantro_ctx *ctx)
+void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 {
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	const struct hantro_h264_dec_ctrls *ctrls;
 	const struct v4l2_ctrl_h264_decode_params *dec_param;
-	const struct v4l2_ctrl_h264_slice_params *slice;
-	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	const struct v4l2_ctrl_h264_slice_params *slices;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
 	const u8 *b0_reflist, *b1_reflist, *p_reflist;
-	struct hantro_dev *vpu = ctx->dev;
-	int reg_num;
+	dma_addr_t addr;
 	u32 reg;
-	int i;
-
-	dec_param = ctx->h264_dec.ctrls.decode;
-	slice = ctx->h264_dec.ctrls.slices;
-
-	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_valid, G1_REG_VALID_REF);
-	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_longterm, G1_REG_LT_REF);
-
-	/*
-	 * Set up reference frame picture numbers.
-	 *
-	 * Each G1_REG_REF_PIC(x) register contains numbers of two
-	 * subsequential reference pictures.
-	 */
-	for (i = 0; i < HANTRO_H264_DPB_SIZE; i += 2) {
-		reg = 0;
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			reg |= G1_REG_REF_PIC_REFER0_NBR(dpb[i].pic_num);
-		else
-			reg |= G1_REG_REF_PIC_REFER0_NBR(dpb[i].frame_num);
-
-		if (dpb[i + 1].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			reg |= G1_REG_REF_PIC_REFER1_NBR(dpb[i + 1].pic_num);
-		else
-			reg |= G1_REG_REF_PIC_REFER1_NBR(dpb[i + 1].frame_num);
-
-		vdpu_write_relaxed(vpu, reg, G1_REG_REF_PIC(i / 2));
-	}
+	unsigned int offset = MV_OFFSET_420;
+
+	/* Prepare the H264 decoder context. */
+	if (hantro_h264_dec_prepare_run(ctx))
+		return;
+
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
+
+	ctrls = &ctx->h264_dec.ctrls;
+	dec_param = ctrls->decode;
+	slices = ctrls->slices;
+	sps = ctrls->sps;
+	pps = ctrls->pps;
 
 	b0_reflist = ctx->h264_dec.reflists.b0;
 	b1_reflist = ctx->h264_dec.reflists.b1;
 	p_reflist = ctx->h264_dec.reflists.p;
 
-	/*
-	 * Each G1_REG_BD_REF_PIC(x) register contains three entries
-	 * of each forward and backward picture list.
-	 */
-	reg_num = 0;
-	for (i = 0; i < 15; i += 3) {
-		reg = G1_REG_BD_REF_PIC_BINIT_RLIST_F0(b0_reflist[i]) |
-		      G1_REG_BD_REF_PIC_BINIT_RLIST_F1(b0_reflist[i + 1]) |
-		      G1_REG_BD_REF_PIC_BINIT_RLIST_F2(b0_reflist[i + 2]) |
-		      G1_REG_BD_REF_PIC_BINIT_RLIST_B0(b1_reflist[i]) |
-		      G1_REG_BD_REF_PIC_BINIT_RLIST_B1(b1_reflist[i + 1]) |
-		      G1_REG_BD_REF_PIC_BINIT_RLIST_B2(b1_reflist[i + 2]);
-		vdpu_write_relaxed(vpu, reg, G1_REG_BD_REF_PIC(reg_num++));
-	}
-
-	/*
-	 * G1_REG_BD_P_REF_PIC register contains last entries (index 15)
-	 * of forward and backward reference picture lists and first 4 entries
-	 * of P forward picture list.
-	 */
-	reg = G1_REG_BD_P_REF_PIC_BINIT_RLIST_F15(b0_reflist[15]) |
-	      G1_REG_BD_P_REF_PIC_BINIT_RLIST_B15(b1_reflist[15]) |
-	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(p_reflist[0]) |
-	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F1(p_reflist[1]) |
-	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F2(p_reflist[2]) |
-	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F3(p_reflist[3]);
-	vdpu_write_relaxed(vpu, reg, G1_REG_BD_P_REF_PIC);
-
-	/*
-	 * Each G1_REG_FWD_PIC(x) register contains six consecutive
-	 * entries of P forward picture list, starting from index 4.
-	 */
-	reg_num = 0;
-	for (i = 4; i < HANTRO_H264_DPB_SIZE; i += 6) {
-		reg = G1_REG_FWD_PIC_PINIT_RLIST_F0(p_reflist[i]) |
-		      G1_REG_FWD_PIC_PINIT_RLIST_F1(p_reflist[i + 1]) |
-		      G1_REG_FWD_PIC_PINIT_RLIST_F2(p_reflist[i + 2]) |
-		      G1_REG_FWD_PIC_PINIT_RLIST_F3(p_reflist[i + 3]) |
-		      G1_REG_FWD_PIC_PINIT_RLIST_F4(p_reflist[i + 4]) |
-		      G1_REG_FWD_PIC_PINIT_RLIST_F5(p_reflist[i + 5]);
-		vdpu_write_relaxed(vpu, reg, G1_REG_FWD_PIC(reg_num++));
-	}
-
-	/* Set up addresses of DPB buffers. */
-	for (i = 0; i < HANTRO_H264_DPB_SIZE; i++) {
-		dma_addr_t addr = hantro_h264_get_ref_dma_addr(ctx, i);
-		vdpu_write_relaxed(vpu, addr, G1_REG_ADDR_REF(i));
-	}
-}
+	reg = G1_REG_DEC_AXI_RD_ID(0xff) |
+	      G1_REG_DEC_TIMEOUT_E(1) |
+	      G1_REG_DEC_STRSWAP32_E(1) |
+	      G1_REG_DEC_STRENDIAN_E(1) |
+	      G1_REG_DEC_INSWAP32_E(1) |
+	      G1_REG_DEC_OUTSWAP32_E(1) |
+	      G1_REG_DEC_DATA_DISC_E(0) |
+	      G1_REG_DEC_LATENCY(0) |
+	      G1_REG_DEC_CLK_GATE_E(1) |
+	      G1_REG_DEC_IN_ENDIAN(0) |
+	      G1_REG_DEC_OUT_ENDIAN(1) |
+	      G1_REG_DEC_ADV_PRE_DIS(0) |
+	      G1_REG_DEC_SCMD_DIS(0) |
+	      G1_REG_DEC_MAX_BURST(16);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(2));
+
+	reg = G1_REG_DEC_MODE(0) |
+	      G1_REG_RLC_MODE_E(0) |
+	      G1_REG_PIC_INTERLACE_E(!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) && (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD || slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)) |
+	      G1_REG_PIC_FIELDMODE_E(slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) |
+	      G1_REG_PIC_TOPFIELD_E(!(slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)) |
+	      G1_REG_FILTERING_DIS(0) |
+	      G1_REG_PIC_FIXED_QUANT(0) |
+	      G1_REG_WRITE_MVS_E(dec_param->nal_ref_idc) |
+	      G1_REG_SEQ_MBAFF_E(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD) |
+	      G1_REG_PICORD_COUNT_E(1) |
+	      G1_REG_DEC_AXI_WR_ID(0);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(3));
+
+	reg = G1_REG_PIC_MB_WIDTH(H264_MB_WIDTH(ctx->dst_fmt.width)) |
+	      G1_REG_PIC_MB_HEIGHT_P(H264_MB_HEIGHT(ctx->dst_fmt.height)) |
+	      G1_REG_REF_FRAMES(sps->max_num_ref_frames);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
+
+	reg = G1_REG_STRM_START_BIT(0) |
+	      G1_REG_TYPE1_QUANT_E(1) |
+	      G1_REG_CH_QP_OFFSET(pps->chroma_qp_index_offset) |
+	      G1_REG_CH_QP_OFFSET2(pps->second_chroma_qp_index_offset) |
+	      G1_REG_FIELDPIC_FLAG_E(!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(5));
+
+	reg = G1_REG_START_CODE_E(1) |
+	      G1_REG_INIT_QP(pps->pic_init_qp_minus26 + 26) |
+	      G1_REG_CH_8PIX_ILEAV_E(0) |
+	      G1_REG_STREAM_LEN(vb2_get_plane_payload(&src_buf->vb2_buf, 0));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(6));
+
+	reg = G1_REG_CABAC_E(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) |
+	      G1_REG_BLACKWHITE_E(sps->profile_idc >= 100 && sps->chroma_format_idc == 0) |
+	      G1_REG_DIR_8X8_INFER_E(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE) |
+	      G1_REG_WEIGHT_PRED_E(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) |
+	      G1_REG_WEIGHT_BIPR_IDC(pps->weighted_bipred_idc) |
+	      G1_REG_FRAMENUM_LEN(sps->log2_max_frame_num_minus4 + 4) |
+	      G1_REG_FRAMENUM(slices[0].frame_num);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(7));
+
+	reg = G1_REG_CONST_INTRA_E(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED) |
+	      G1_REG_FILT_CTRL_PRES(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT) |
+	      G1_REG_RDPIC_CNT_PRES(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT) |
+	      G1_REG_8X8TRANS_FLAG_E(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE) |
+	      G1_REG_REFPIC_MK_LEN(slices[0].dec_ref_pic_marking_bit_size) |
+	      G1_REG_IDR_PIC_E(dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) |
+	      G1_REG_IDR_PIC_ID(slices[0].idr_pic_id);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(8));
+
+	reg = G1_REG_PPS_ID(slices[0].pic_parameter_set_id) |
+	      G1_REG_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
+	      G1_REG_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
+	      G1_REG_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(9));
+
+	reg = G1_REG_PINIT_RLIST_F9(p_reflist[9]) |
+	      G1_REG_PINIT_RLIST_F8(p_reflist[8]) |
+	      G1_REG_PINIT_RLIST_F7(p_reflist[7]) |
+	      G1_REG_PINIT_RLIST_F6(p_reflist[6]) |
+	      G1_REG_PINIT_RLIST_F5(p_reflist[5]) |
+	      G1_REG_PINIT_RLIST_F4(p_reflist[4]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(10));
+
+	reg = G1_REG_PINIT_RLIST_F15(p_reflist[15]) |
+	      G1_REG_PINIT_RLIST_F14(p_reflist[14]) |
+	      G1_REG_PINIT_RLIST_F13(p_reflist[13]) |
+	      G1_REG_PINIT_RLIST_F12(p_reflist[12]) |
+	      G1_REG_PINIT_RLIST_F11(p_reflist[11]) |
+	      G1_REG_PINIT_RLIST_F10(p_reflist[10]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(11));
+
+	reg = G1_REG_REFER1_NBR(hantro_h264_get_ref_nbr(ctx, 1)) |
+	      G1_REG_REFER0_NBR(hantro_h264_get_ref_nbr(ctx, 0));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(30));
+
+	reg = G1_REG_REFER3_NBR(hantro_h264_get_ref_nbr(ctx, 3)) |
+	      G1_REG_REFER2_NBR(hantro_h264_get_ref_nbr(ctx, 2));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(31));
+
+	reg = G1_REG_REFER5_NBR(hantro_h264_get_ref_nbr(ctx, 5)) |
+	      G1_REG_REFER4_NBR(hantro_h264_get_ref_nbr(ctx, 4));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(32));
+
+	reg = G1_REG_REFER7_NBR(hantro_h264_get_ref_nbr(ctx, 7)) |
+	      G1_REG_REFER6_NBR(hantro_h264_get_ref_nbr(ctx, 6));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(33));
+
+	reg = G1_REG_REFER9_NBR(hantro_h264_get_ref_nbr(ctx, 9)) |
+	      G1_REG_REFER8_NBR(hantro_h264_get_ref_nbr(ctx, 8));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(34));
+
+	reg = G1_REG_REFER11_NBR(hantro_h264_get_ref_nbr(ctx, 11)) |
+	      G1_REG_REFER10_NBR(hantro_h264_get_ref_nbr(ctx, 10));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(35));
+
+	reg = G1_REG_REFER13_NBR(hantro_h264_get_ref_nbr(ctx, 13)) |
+	      G1_REG_REFER12_NBR(hantro_h264_get_ref_nbr(ctx, 12));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(36));
+
+	reg = G1_REG_REFER15_NBR(hantro_h264_get_ref_nbr(ctx, 15)) |
+	      G1_REG_REFER14_NBR(hantro_h264_get_ref_nbr(ctx, 14));
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(37));
+
+	reg = G1_REG_REFER_LTERM_E(ctx->h264_dec.dpb_longterm);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(38));
+
+	reg = G1_REG_REFER_VALID_E(ctx->h264_dec.dpb_valid);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(39));
+
+	reg = G1_REG_BINIT_RLIST_B2(b1_reflist[2]) |
+	      G1_REG_BINIT_RLIST_F2(b0_reflist[2]) |
+	      G1_REG_BINIT_RLIST_B1(b1_reflist[1]) |
+	      G1_REG_BINIT_RLIST_F1(b0_reflist[1]) |
+	      G1_REG_BINIT_RLIST_B0(b1_reflist[0]) |
+	      G1_REG_BINIT_RLIST_F0(b0_reflist[0]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(42));
+
+	reg = G1_REG_BINIT_RLIST_B5(b1_reflist[5]) |
+	      G1_REG_BINIT_RLIST_F5(b0_reflist[5]) |
+	      G1_REG_BINIT_RLIST_B4(b1_reflist[4]) |
+	      G1_REG_BINIT_RLIST_F4(b0_reflist[4]) |
+	      G1_REG_BINIT_RLIST_B3(b1_reflist[3]) |
+	      G1_REG_BINIT_RLIST_F3(b0_reflist[3]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(43));
+
+	reg = G1_REG_BINIT_RLIST_B8(b1_reflist[8]) |
+	      G1_REG_BINIT_RLIST_F8(b0_reflist[8]) |
+	      G1_REG_BINIT_RLIST_B7(b1_reflist[7]) |
+	      G1_REG_BINIT_RLIST_F7(b0_reflist[7]) |
+	      G1_REG_BINIT_RLIST_B6(b1_reflist[6]) |
+	      G1_REG_BINIT_RLIST_F6(b0_reflist[6]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(44));
+
+	reg = G1_REG_BINIT_RLIST_B11(b1_reflist[11]) |
+	      G1_REG_BINIT_RLIST_F11(b0_reflist[11]) |
+	      G1_REG_BINIT_RLIST_B10(b1_reflist[10]) |
+	      G1_REG_BINIT_RLIST_F10(b0_reflist[10]) |
+	      G1_REG_BINIT_RLIST_B9(b1_reflist[9]) |
+	      G1_REG_BINIT_RLIST_F9(b0_reflist[9]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(45));
+
+	reg = G1_REG_BINIT_RLIST_B14(b1_reflist[14]) |
+	      G1_REG_BINIT_RLIST_F14(b0_reflist[14]) |
+	      G1_REG_BINIT_RLIST_B13(b1_reflist[13]) |
+	      G1_REG_BINIT_RLIST_F13(b0_reflist[13]) |
+	      G1_REG_BINIT_RLIST_B12(b1_reflist[12]) |
+	      G1_REG_BINIT_RLIST_F12(b0_reflist[12]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(46));
+
+	reg = G1_REG_PINIT_RLIST_F3(p_reflist[3]) |
+	      G1_REG_PINIT_RLIST_F2(p_reflist[2]) |
+	      G1_REG_PINIT_RLIST_F1(p_reflist[1]) |
+	      G1_REG_PINIT_RLIST_F0(p_reflist[0]) |
+	      G1_REG_BINIT_RLIST_B15(b1_reflist[15]) |
+	      G1_REG_BINIT_RLIST_F15(b0_reflist[15]);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(47));
+
+	reg = G1_REG_STARTMB_X(0) |
+	      G1_REG_STARTMB_Y(0);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(48));
+
+	reg = G1_REG_PRED_BC_TAP_0_0(1) |
+	      G1_REG_PRED_BC_TAP_0_1((u32)-5) |
+	      G1_REG_PRED_BC_TAP_0_2(20);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(49));
+
+	reg = G1_REG_REFBU_E(0);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(51));
+
+	reg = G1_REG_APF_THRESHOLD(8);
+	vdpu_write_relaxed(vpu, reg, G1_SWREG(55));
 
-static void set_buffers(struct hantro_ctx *ctx)
-{
-	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct hantro_dev *vpu = ctx->dev;
-	dma_addr_t src_dma, dst_dma;
-	unsigned int offset = MV_OFFSET_420;
-
-	src_buf = hantro_get_src_buf(ctx);
-	dst_buf = hantro_get_dst_buf(ctx);
+	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
+	vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, G1_REG_QTABLE_BASE);
 
 	/* Source (stream) buffer. */
-	src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
-	vdpu_write_relaxed(vpu, src_dma, G1_REG_ADDR_STR);
+	addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	vdpu_write_relaxed(vpu, addr, G1_REG_RLC_VLC_BASE);
 
 	/* Destination (decoded frame) buffer. */
-	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
-		dst_dma += ALIGN(ctx->dst_fmt.width, H264_MB_DIM);
-	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
+		addr += ALIGN(ctx->dst_fmt.width, H264_MB_DIM);
+	vdpu_write_relaxed(vpu, addr, G1_REG_DEC_OUT_BASE);
 
 	/* Motion vector buffer is located after the decoded frame. */
-	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
-	if (ctrls->sps->profile_idc >= 100 && ctrls->sps->chroma_format_idc == 0)
+	addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)
 		offset = MV_OFFSET_400;
-	dst_dma += offset * H264_MB_WIDTH(ctx->dst_fmt.width) *
+	addr += offset * H264_MB_WIDTH(ctx->dst_fmt.width) *
 		   H264_MB_HEIGHT(ctx->dst_fmt.height);
 	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
-		dst_dma += 32 * H264_MB_WIDTH(ctx->dst_fmt.width) *
+		addr += 32 * H264_MB_WIDTH(ctx->dst_fmt.width) *
 			   H264_MB_HEIGHT(ctx->dst_fmt.height);
-	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DIR_MV);
-
-	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
-	vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, G1_REG_ADDR_QTABLE);
-}
-
-void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	/* Prepare the H264 decoder context. */
-	if (hantro_h264_dec_prepare_run(ctx))
-		return;
-
-	/* Configure hardware registers. */
-	set_params(ctx);
-	set_ref(ctx);
-	set_buffers(ctx);
+	vdpu_write_relaxed(vpu, addr, G1_REG_DIR_MV_BASE);
+
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 0), G1_REG_REFER0_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 1), G1_REG_REFER1_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 2), G1_REG_REFER2_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 3), G1_REG_REFER3_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 4), G1_REG_REFER4_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 5), G1_REG_REFER5_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 6), G1_REG_REFER6_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 7), G1_REG_REFER7_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 8), G1_REG_REFER8_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 9), G1_REG_REFER9_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 10), G1_REG_REFER10_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 11), G1_REG_REFER11_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 12), G1_REG_REFER12_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 13), G1_REG_REFER13_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 14), G1_REG_REFER14_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 15), G1_REG_REFER15_BASE);
 
 	hantro_finish_run(ctx);
 
 	/* Start decoding! */
-	vdpu_write_relaxed(vpu,
-			   G1_REG_CONFIG_DEC_AXI_RD_ID(0xffu) |
-			   G1_REG_CONFIG_DEC_TIMEOUT_E |
-			   G1_REG_CONFIG_DEC_OUT_ENDIAN |
-			   G1_REG_CONFIG_DEC_STRENDIAN_E |
-			   G1_REG_CONFIG_DEC_MAX_BURST(16) |
-			   G1_REG_CONFIG_DEC_OUTSWAP32_E |
-			   G1_REG_CONFIG_DEC_INSWAP32_E |
-			   G1_REG_CONFIG_DEC_STRSWAP32_E |
-			   G1_REG_CONFIG_DEC_CLK_GATE_E,
-			   G1_REG_CONFIG);
-	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
+	reg = G1_REG_DEC_E(1);
+	vdpu_write(vpu, reg, G1_SWREG(1));
 }
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 85c86d728b1a..03b37e00b6fd 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -591,6 +591,20 @@ dma_addr_t hantro_h264_get_ref_dma_addr(struct hantro_ctx *ctx,
 	return vb2_dma_contig_plane_dma_addr(buf, 0) | flags;
 }
 
+u16 hantro_h264_get_ref_nbr(struct hantro_ctx *ctx,
+			    unsigned int dpb_idx)
+{
+	const struct v4l2_h264_dpb_entry *dpb = &ctx->h264_dec.dpb[dpb_idx];
+
+	if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+		return 0;
+
+	if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return dpb->pic_num;
+
+	return dpb->frame_num;
+}
+
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 {
 	struct hantro_h264_dec_hw_ctx *h264_ctx = &ctx->h264_dec;
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index d58f2a36ca40..51de2fee2233 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -161,6 +161,8 @@ struct vb2_buffer *hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 					   unsigned int dpb_idx);
 dma_addr_t hantro_h264_get_ref_dma_addr(struct hantro_ctx *ctx,
 					unsigned int dpb_idx);
+u16 hantro_h264_get_ref_nbr(struct hantro_ctx *ctx,
+			    unsigned int dpb_idx);
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
 void hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
-- 
2.17.1

