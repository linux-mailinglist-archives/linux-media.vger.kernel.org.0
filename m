Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EADCE7DF6
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbfJ2B0H convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:26:07 -0400
Received: from mail-oln040092065061.outbound.protection.outlook.com ([40.92.65.61]:55188
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728978AbfJ2B0G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:26:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWiZ4L67ZWZEqOGrr4CyFuvGMpOhzgpIBWHhiqiEtLBRotqH/TZ13mMwteUc05diR5e+P1B0/P0M7q5Ss3Xs9nxOlMNkqPeJFD0/Ne1z3ydiYBcWOHuMsZ2La4/JjdeK2m4JF7OvsKz+GJ3XhwbX6/yGKOftCEnby0NkcM2bf/Rj+34+W6hd+DHQpkmjG6qrEXfH2gxtRQMU2GuPiHJg5y2BZGjdP7rKjNFYrn+itJ+XyGcXFDJQ0nZRx+rNmhxrpfe+WdUmCwCjapaN16JopSYYbXgYz8sgR5ApV9dSt41JDaFrxzpgk4rKlpMV8TM7riNaJ4vTtlFpJr5QSz2nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxbZ3ALB6XSQRDMVTMLhwOnOL8gY0mN4M/4AmMlNX3o=;
 b=Can4yOtJ7VHHZ9BtNmcjuSSmlHhbIbxY7yplZzkdJmB1U+e6FptuMDrkHpotwd8+dvzTgnlhSQsnYATPvUIUf1a6GbwdkLaurZfYVpqpr/7UNS5qT27iwMJFx9P3sVJV8P19Z8c3YBei8tvPtr1i4+dYe+HrlvsXjHr+bA5wS03CpPFA+yDeylb4b2kLWn1XDox74QqV5ZfoaJ8j+gDvp+ljslC+P/g3bloOOacfxSqMogyVcyCsyPEmxy/7X73jNMgI+5Uh/T5peShFfLEMipdG7443TE1figmGQrqc4V8GWawDSSKLC43xTuwMNF81ZOGQg9upncWIncnJp9l0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.52) by VE1EUR01HT223.eop-EUR01.prod.protection.outlook.com
 (10.152.3.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:26:02 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:26:02 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:26:02 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC v2 10/10] media: hantro: Fix H264 decoding of field encoded
 content
Thread-Topic: [RFC v2 10/10] media: hantro: Fix H264 decoding of field encoded
 content
Thread-Index: AQHVjffTgp3yNElHpkStsNrm+cNs7Q==
Date:   Tue, 29 Oct 2019 01:26:02 +0000
Message-ID: <HE1PR06MB4011BCB58590F2ECCF010C9FAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012550.24628-1-jonas@kwiboo.se>
In-Reply-To: <20191029012550.24628-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0354.eurprd05.prod.outlook.com
 (2603:10a6:7:92::49) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:02C86AD3AF424C2433DF39F015C46E1717665A7ADACEA896458EA2671C0A6EDA;UpperCasedChecksum:A7F8A7684B0B1AE1F4A59E16CFE0731849643AE45FE16773CEB3CF4868F8EE93;SizeAsReceived:7627;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [NonxHB7goTnKZ42HtPA33t72KEnb2tp+]
x-microsoft-original-message-id: <20191029012550.24628-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT223:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +7xOJsr29HMiP8jZE9b/boFOKG2L3R9G9ZtCTRL1rinreY4ZpyGPIVIk2d4uhHD9HhLXsGfam9Rw9NrBzf7p44tVzxIhIliaERREeiJOOL0O9JxMNftoBywBKojqjfIlS4j0dMENze4Z0aBvKB7sj0iwgJ8y6DDZg2e7tKQMO9ZIGHYinyNlmvsz+P8768Do
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f49aa186-9339-4fa6-752e-08d75c0ef5a9
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:26:02.1123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT223
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This still need code cleanup and formatting

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../staging/media/hantro/hantro_g1_h264_dec.c |  17 +--
 drivers/staging/media/hantro/hantro_h264.c    | 121 ++++++++++++------
 drivers/staging/media/hantro/hantro_hw.h      |   2 +
 3 files changed, 85 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index c07da0ee4973..473d7a0d7338 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -132,25 +132,12 @@ static void set_ref(struct hantro_ctx *ctx)
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
-
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			dpb_longterm |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
-	}
-	vdpu_write_relaxed(vpu, dpb_valid << 16, G1_REG_VALID_REF);
-	vdpu_write_relaxed(vpu, dpb_longterm << 16, G1_REG_LT_REF);
+	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_valid, G1_REG_VALID_REF);
+	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_longterm, G1_REG_LT_REF);
 
 	/*
 	 * Set up reference frame picture numbers.
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 568640eab3a6..a405d0f5a0a1 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -225,17 +225,65 @@ static void prepare_table(struct hantro_ctx *ctx)
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
@@ -249,21 +297,6 @@ struct hantro_h264_reflist_builder {
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
@@ -273,7 +306,6 @@ init_reflist_builder(struct hantro_ctx *ctx,
 	const struct v4l2_ctrl_h264_sps *sps;
 	struct vb2_v4l2_buffer *buf = hantro_get_dst_buf(ctx);
 	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
-	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
 	int cur_frame_num, max_frame_num;
 	unsigned int i;
 
@@ -285,21 +317,15 @@ init_reflist_builder(struct hantro_ctx *ctx,
 
 	memset(b, 0, sizeof(*b));
 	b->dpb = dpb;
-	b->curpoc = get_poc(buf->field, dec_param->top_field_order_cnt,
-			    dec_param->bottom_field_order_cnt);
+	b->curpoc = (slice_params->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD) ?
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
-
-		buf = to_vb2_v4l2_buffer(vb2_get_buffer(cap_q, buf_idx));
-
 		/*
 		 * Handle frame_num wraparound as described in section
 		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
@@ -311,8 +337,13 @@ init_reflist_builder(struct hantro_ctx *ctx,
 		else
 			b->frame_nums[i] = dpb[i].frame_num;
 
-		b->pocs[i] = get_poc(buf->field, dpb[i].top_field_order_cnt,
-				     dpb[i].bottom_field_order_cnt);
+		if (ref_flag == V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME)
+			b->pocs[i] = min(dpb[i].bottom_field_order_cnt, dpb[i].top_field_order_cnt);
+		else if (ref_flag == V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM)
+			b->pocs[i] = dpb[i].bottom_field_order_cnt;
+		else if (ref_flag == V4L2_H264_DPB_ENTRY_FLAG_REF_TOP)
+			b->pocs[i] = dpb[i].top_field_order_cnt;
+
 		b->unordered_reflist[b->num_valid] = i;
 		b->num_valid++;
 	}
@@ -466,8 +497,7 @@ build_b_ref_lists(const struct hantro_h264_reflist_builder *builder,
 static bool dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
 			    const struct v4l2_h264_dpb_entry *b)
 {
-	return a->top_field_order_cnt == b->top_field_order_cnt &&
-	       a->bottom_field_order_cnt == b->bottom_field_order_cnt;
+	return a->reference_ts == b->reference_ts;
 }
 
 static void update_dpb(struct hantro_ctx *ctx)
@@ -481,13 +511,13 @@ static void update_dpb(struct hantro_ctx *ctx)
 
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
@@ -498,8 +528,7 @@ static void update_dpb(struct hantro_ctx *ctx)
 			struct v4l2_h264_dpb_entry *cdpb;
 
 			cdpb = &ctx->h264_dec.dpb[j];
-			if (cdpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE ||
-			    !dpb_entry_match(cdpb, ndpb))
+			if (!dpb_entry_match(cdpb, ndpb))
 				continue;
 
 			*cdpb = *ndpb;
@@ -535,7 +564,11 @@ dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 				   unsigned int dpb_idx)
 {
 	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	const struct v4l2_ctrl_h264_decode_params *dec_param = ctx->h264_dec.ctrls.decode;
+	const struct v4l2_ctrl_h264_slice_params *slices = ctx->h264_dec.ctrls.slices;
 	dma_addr_t dma_addr = 0;
+	s32 cur_poc;
+	u32 flags;
 
 	if (dpb[dpb_idx].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
 		dma_addr = hantro_get_ref(ctx, dpb[dpb_idx].reference_ts);
@@ -553,7 +586,15 @@ dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 		dma_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
 	}
 
-	return dma_addr;
+	cur_poc = slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD ?
+		  dec_param->bottom_field_order_cnt :
+		  dec_param->top_field_order_cnt;
+	flags = dpb[dpb_idx].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE ? 0x2 : 0;
+	flags |= abs(dpb[dpb_idx].top_field_order_cnt - cur_poc) <
+		 abs(dpb[dpb_idx].bottom_field_order_cnt - cur_poc) ?
+		 0x1 : 0;
+
+	return dma_addr | flags;
 }
 
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index fa91dd1848b7..fb1451e8a80b 100644
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
-- 
2.17.1

