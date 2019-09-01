Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2DB7A4962
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbfIAMpz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:45:55 -0400
Received: from mail-oln040092064108.outbound.protection.outlook.com ([40.92.64.108]:53826
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728765AbfIAMpv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4ZTlMVOJBW9qPr4Hjma5ykhW2kkXi1V9FUp+9c1GCI/n8F2mak4/Dtdy3fyjgDy1FFFFgp/CmRDCvlCwwG3N26a+XMn1CJm/vViihyKyIhWLWZZwYllJ2ZjjKAtBqCjDkzC24/BqQTbTycI30AR+o8T9dWPYObQCCzvHmasTivLdifRRBoaHVvJQQUWS5aN37hMbVHMXcl0XlB7Az528NhgdCnmc4WgfNSECwCCsI94CTm9GZha6acDZPCRdXZQe3lIMCXTH0IByV9ppf+CzculuG19O3cgHL+Ityr824lFXA8eGwQalSHxlraueKEBjryPlkkfxaDZ1PoNnVHeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ0g/QOOzwuKdCAo7lG98SR8F/NmZmlrmXWmUZfAsgI=;
 b=YGin41DLpkW1XBtFWoBhqrSXTmM5sZiEfqnvyOROx1aXDc89nge0tmi67aeIEgUk0hHY5SbLaSSJBMciWKUN3EzdkxTvTOx1Zcl1rzMBa3zjnI9GAQBr8vS0A+gjYbna3VVTVAlDuW/8CafkVaQ6w/HoiUpoIlIzfCPx5T6lJ1zwpoosxUxApo/5mSv3lGuIeY4pjSrp4njF/Llwh3UsEuHcMMlw+PZjhDefGVKkKO3p+HkxwC69mdY9udGKGnn2gO5+pj6suKRU/Vx+ffQw3A3yETdro/gW0mJO2VPNYwCyAtpTMyt1BivCak3bgkTz1QyLfVrGtlz3dvVPm1g+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.51) by HE1EUR01HT073.eop-EUR01.prod.protection.outlook.com
 (10.152.1.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:46 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:46 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:46 +0000
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
Subject: [RFC 08/12] media: hantro: Fix H264 decoding of field encoded content
Thread-Topic: [RFC 08/12] media: hantro: Fix H264 decoding of field encoded
 content
Thread-Index: AQHVYMMtmxM+aDjHykiwJVJ++y1ATQ==
Date:   Sun, 1 Sep 2019 12:45:46 +0000
Message-ID: <HE1PR06MB4011EA39133818A85768B91FACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:4812CE2D88DC80F58B5D07C6DB10716EC976C5630B466CF409E068C0A52F9A17;UpperCasedChecksum:E54B58EF86C1C567EF64D379E734E257E17A47F1DDDB2F5BD29798A26F4BD757;SizeAsReceived:7884;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [vjGcZh8p0Rgoy0yBO4CTMFzy0gRpd/k4]
x-microsoft-original-message-id: <20190901124531.23645-8-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT073;
x-ms-traffictypediagnostic: HE1EUR01HT073:
x-microsoft-antispam-message-info: q/3k+3yZerRG/Q7/nfh2SsGW4Rsvx2NBcuSadpUsP2P9f0toAAgBfxZrHlP32AGcU9ZfOewPn+x7vAzyt5I0+gY93ACHJ3BNpXCeaiD+4wMxPgef3W9/Yf9Du5rQyW4qdQOIVBhBJ/kbGtqX/nUA4QQkZcy8nAc7dtkrkZdskx3x7B20J9YnuVEHki81LqCX
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5330e71a-6db6-4e89-376d-08d72eda4f55
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:46.8276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT073
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This need code cleanup and formatting

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../staging/media/hantro/hantro_g1_h264_dec.c |  26 ++--
 drivers/staging/media/hantro/hantro_h264.c    | 126 ++++++++++++------
 drivers/staging/media/hantro/hantro_hw.h      |   4 +
 3 files changed, 100 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 16f21d258f6a..bc628ef73b29 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -130,28 +130,20 @@ static void set_params(struct hantro_ctx *ctx)
 
 static void set_ref(struct hantro_ctx *ctx)
 {
+	const struct v4l2_ctrl_h264_decode_params *dec_param;
+	const struct v4l2_ctrl_h264_slice_params *slice;
 	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
 	const u8 *b0_reflist, *b1_reflist, *p_reflist;
 	struct hantro_dev *vpu = ctx->dev;
-	u32 dpb_longterm = 0;
-	u32 dpb_valid = 0;
 	int reg_num;
 	u32 reg;
 	int i;
 
-	/*
-	 * Set up bit maps of valid and long term DPBs.
-	 * NOTE: The bits are reversed, i.e. MSb is DPB 0.
-	 */
-	for (i = 0; i < HANTRO_H264_DPB_SIZE; ++i) {
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
-			dpb_valid |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
+	dec_param = ctx->h264_dec.ctrls.decode;
+	slice = ctx->h264_dec.ctrls.slices;
 
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			dpb_longterm |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
-	}
-	vdpu_write_relaxed(vpu, dpb_valid << 16, G1_REG_VALID_REF);
-	vdpu_write_relaxed(vpu, dpb_longterm << 16, G1_REG_LT_REF);
+	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_valid, G1_REG_VALID_REF);
+	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_longterm, G1_REG_LT_REF);
 
 	/*
 	 * Set up reference frame picture numbers.
@@ -223,10 +215,8 @@ static void set_ref(struct hantro_ctx *ctx)
 
 	/* Set up addresses of DPB buffers. */
 	for (i = 0; i < HANTRO_H264_DPB_SIZE; i++) {
-		struct vb2_buffer *buf =  hantro_h264_get_ref_buf(ctx, i);
-
-		vdpu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(buf, 0),
-				   G1_REG_ADDR_REF(i));
+		dma_addr_t addr = hantro_h264_get_ref_dma_addr(ctx, i);
+		vdpu_write_relaxed(vpu, addr, G1_REG_ADDR_REF(i));
 	}
 }
 
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index a77cc28e180a..85c86d728b1a 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -228,17 +228,65 @@ static void prepare_table(struct hantro_ctx *ctx)
 {
 	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
 	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
+	const struct v4l2_ctrl_h264_slice_params *slices = ctrls->slices;
 	struct hantro_h264_dec_priv_tbl *tbl = ctx->h264_dec.priv.cpu;
 	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	u32 dpb_longterm = 0;
+	u32 dpb_valid = 0;
 	int i;
 
+	/*
+	 * Set up bit maps of valid and long term DPBs.
+	 * NOTE: The bits are reversed, i.e. MSb is DPB 0.
+	 */
+	if ((slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) || (slices[0].flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)) {
+		for (i = 0; i < HANTRO_H264_DPB_SIZE * 2; ++i) {
+			// check for correct reference use
+			u32 flag = (i & 0x1) ? V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM : V4L2_H264_DPB_ENTRY_FLAG_REF_TOP;
+			if (dpb[i / 2].flags & flag)
+				dpb_valid |= BIT(HANTRO_H264_DPB_SIZE * 2 - 1 - i);
+
+			if (dpb[i / 2].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+				dpb_longterm |= BIT(HANTRO_H264_DPB_SIZE * 2 - 1 - i);
+		}
+
+		ctx->h264_dec.dpb_valid = dpb_valid;
+		ctx->h264_dec.dpb_longterm = dpb_longterm;
+	} else {
+		for (i = 0; i < HANTRO_H264_DPB_SIZE; ++i) {
+			if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+				dpb_valid |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
+
+			if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+				dpb_longterm |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
+		}
+
+		ctx->h264_dec.dpb_valid = dpb_valid << 16;
+		ctx->h264_dec.dpb_longterm = dpb_longterm << 16;
+	}
+
 	for (i = 0; i < HANTRO_H264_DPB_SIZE; ++i) {
-		tbl->poc[i * 2] = dpb[i].top_field_order_cnt;
-		tbl->poc[i * 2 + 1] = dpb[i].bottom_field_order_cnt;
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
+			tbl->poc[i * 2] = dpb[i].top_field_order_cnt;
+			tbl->poc[i * 2 + 1] = dpb[i].bottom_field_order_cnt;
+		} else {
+			tbl->poc[i * 2] = 0;
+			tbl->poc[i * 2 + 1] = 0;
+		}
 	}
 
-	tbl->poc[32] = dec_param->top_field_order_cnt;
-	tbl->poc[33] = dec_param->bottom_field_order_cnt;
+	if ((slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) || !(slices[0].flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)) {
+		if ((slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
+			tbl->poc[32] = (slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD) ?
+					dec_param->bottom_field_order_cnt :
+					dec_param->top_field_order_cnt;
+		else
+			tbl->poc[32] = min(dec_param->top_field_order_cnt, dec_param->bottom_field_order_cnt);
+		tbl->poc[33] = 0;
+	} else {
+		tbl->poc[32] = dec_param->top_field_order_cnt;
+		tbl->poc[33] = dec_param->bottom_field_order_cnt;
+	}
 
 	reorder_scaling_list(ctx);
 }
@@ -251,51 +299,36 @@ struct hantro_h264_reflist_builder {
 	u8 num_valid;
 };
 
-static s32 get_poc(enum v4l2_field field, s32 top_field_order_cnt,
-		   s32 bottom_field_order_cnt)
-{
-	switch (field) {
-	case V4L2_FIELD_TOP:
-		return top_field_order_cnt;
-	case V4L2_FIELD_BOTTOM:
-		return bottom_field_order_cnt;
-	default:
-		break;
-	}
-
-	return min(top_field_order_cnt, bottom_field_order_cnt);
-}
-
 static void
 init_reflist_builder(struct hantro_ctx *ctx,
 		     struct hantro_h264_reflist_builder *b)
 {
 	const struct v4l2_ctrl_h264_decode_params *dec_param;
-	struct vb2_v4l2_buffer *buf = hantro_get_dst_buf(ctx);
+	const struct v4l2_ctrl_h264_slice_params *slices;
 	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
-	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
 	unsigned int i;
 
 	dec_param = ctx->h264_dec.ctrls.decode;
+	slices = ctx->h264_dec.ctrls.slices;
 
 	memset(b, 0, sizeof(*b));
 	b->dpb = dpb;
-	b->curpoc = get_poc(buf->field, dec_param->top_field_order_cnt,
-			    dec_param->bottom_field_order_cnt);
+	b->curpoc = (slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD) ?
+		    dec_param->bottom_field_order_cnt :
+		    dec_param->top_field_order_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++) {
-		int buf_idx;
-
-		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+		u32 ref_flag = dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME;
+		if (!ref_flag)
 			continue;
 
-		buf_idx = vb2_find_timestamp(cap_q, dpb[i].reference_ts, 0);
-		if (buf_idx < 0)
-			continue;
+		if (ref_flag == V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME)
+			b->pocs[i] = min(dpb[i].bottom_field_order_cnt, dpb[i].top_field_order_cnt);
+		else if (ref_flag == V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM)
+			b->pocs[i] = dpb[i].bottom_field_order_cnt;
+		else if (ref_flag == V4L2_H264_DPB_ENTRY_FLAG_REF_TOP)
+			b->pocs[i] = dpb[i].top_field_order_cnt;
 
-		buf = to_vb2_v4l2_buffer(vb2_get_buffer(cap_q, buf_idx));
-		b->pocs[i] = get_poc(buf->field, dpb[i].top_field_order_cnt,
-				     dpb[i].bottom_field_order_cnt);
 		b->unordered_reflist[b->num_valid] = i;
 		b->num_valid++;
 	}
@@ -448,8 +481,7 @@ build_b_ref_lists(const struct hantro_h264_reflist_builder *builder,
 static bool dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
 			    const struct v4l2_h264_dpb_entry *b)
 {
-	return a->top_field_order_cnt == b->top_field_order_cnt &&
-	       a->bottom_field_order_cnt == b->bottom_field_order_cnt;
+	return a->reference_ts == b->reference_ts;
 }
 
 static void update_dpb(struct hantro_ctx *ctx)
@@ -463,13 +495,13 @@ static void update_dpb(struct hantro_ctx *ctx)
 
 	/* Disable all entries by default. */
 	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++)
-		ctx->h264_dec.dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
+		ctx->h264_dec.dpb[i].flags = 0;
 
 	/* Try to match new DPB entries with existing ones by their POCs. */
 	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
 		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
 
-		if (!(ndpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+		if (!(ndpb->flags & V4L2_H264_DPB_ENTRY_FLAG_VALID))
 			continue;
 
 		/*
@@ -480,8 +512,7 @@ static void update_dpb(struct hantro_ctx *ctx)
 			struct v4l2_h264_dpb_entry *cdpb;
 
 			cdpb = &ctx->h264_dec.dpb[j];
-			if (cdpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE ||
-			    !dpb_entry_match(cdpb, ndpb))
+			if (!dpb_entry_match(cdpb, ndpb))
 				continue;
 
 			*cdpb = *ndpb;
@@ -541,6 +572,25 @@ struct vb2_buffer *hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 	return buf;
 }
 
+dma_addr_t hantro_h264_get_ref_dma_addr(struct hantro_ctx *ctx,
+					unsigned int dpb_idx)
+{
+	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	const struct v4l2_ctrl_h264_decode_params *dec_param = ctx->h264_dec.ctrls.decode;
+	const struct v4l2_ctrl_h264_slice_params *slices = ctx->h264_dec.ctrls.slices;
+
+	struct vb2_buffer *buf = hantro_h264_get_ref_buf(ctx, dpb_idx);
+	s32 cur_poc = slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD ?
+		      dec_param->bottom_field_order_cnt :
+		      dec_param->top_field_order_cnt;
+	u32 flags = dpb[dpb_idx].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE ? 0x2 : 0;
+	flags |= abs(dpb[dpb_idx].top_field_order_cnt - cur_poc) <
+		 abs(dpb[dpb_idx].bottom_field_order_cnt - cur_poc) ?
+		 0x1 : 0;
+
+	return vb2_dma_contig_plane_dma_addr(buf, 0) | flags;
+}
+
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 {
 	struct hantro_h264_dec_hw_ctx *h264_ctx = &ctx->h264_dec;
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 8adad8ac9b1d..d58f2a36ca40 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -86,6 +86,8 @@ struct hantro_h264_dec_hw_ctx {
 	struct v4l2_h264_dpb_entry dpb[HANTRO_H264_DPB_SIZE];
 	struct hantro_h264_dec_reflists reflists;
 	struct hantro_h264_dec_ctrls ctrls;
+	u32 dpb_longterm;
+	u32 dpb_valid;
 };
 
 /**
@@ -157,6 +159,8 @@ void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
 
 struct vb2_buffer *hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 					   unsigned int dpb_idx);
+dma_addr_t hantro_h264_get_ref_dma_addr(struct hantro_ctx *ctx,
+					unsigned int dpb_idx);
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
 void hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
-- 
2.17.1

