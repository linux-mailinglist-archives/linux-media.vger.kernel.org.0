Return-Path: <linux-media+bounces-37124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C254AFCEF8
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFE9A1BC3B83
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D7F2E336D;
	Tue,  8 Jul 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="njgFWMNb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E522E1749;
	Tue,  8 Jul 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988009; cv=none; b=H+8a6Ru++pmV6mkBWkaeo6mw4howfGyTDTfbL632m7oSZugb/3tOVuXSne47XS8QnUkmMsPFoaBULd1qhFBW5Dod1wo49VijgkyPmfcLa3xTPdRAEAw3W1BIHtug9T0hP3PCvTb+0n3Q8MBPYs5LOFHJUYhefVPZQV8gNZQ5RQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988009; c=relaxed/simple;
	bh=IYkfgzyTm1r3u/AVPZFB0sE58bGEguRbyPcffVUmwi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtpetZUVe9vbfXIGh8467/zJfyh9bhHapGBiKbCm340k118hHnnB5yCGKOLJ2dnJajwd2gpGnlLZ9RJx/NHJjByw8LNZ5tva2enOC4sD7gZ0RFEKjPQNoIa++35sVK4ZQYmQUpNGJ8Voa+sxMgksO8drLGTabrxhrZRjStxG1ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=njgFWMNb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751988000;
	bh=IYkfgzyTm1r3u/AVPZFB0sE58bGEguRbyPcffVUmwi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=njgFWMNbXIyfqcettUYApYXbBkRRw91GNoGXSFInPopzwZjwqy5YVQZRWxBt7fsBR
	 PAA1d6BXwttumnnRDOYoA62RBgUQHatIwY5Z5VCc/eu7ceiYXioecZg2kK/fQUDfQ6
	 cxo1ScXpURaIND+5Y7CjVGhCw6v1twi/+1/xEB00g7JkFJ1Jm8Q7U8OUq3My0VLzGJ
	 Yw6ISvrhp1sIjMR3vQcuoNiO2sVwN7eb4dhef6fdIeYxuLn3wpeoQ3nqjN6YqY47Gl
	 f6aMTs5aFY0mTzFwj83YuNauBEpQBhoWMH/j8tgfpX1jKnACIvVWBq1aSxsyfdD/hK
	 0mYMgXH0X+75w==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC5DF17E1045;
	Tue,  8 Jul 2025 17:19:58 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 03/12] media: rkvdec: Use structs to represent the HW RPS
Date: Tue,  8 Jul 2025 11:19:36 -0400
Message-ID: <20250708151946.374349-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708151946.374349-1-detlev.casanova@collabora.com>
References: <20250708151946.374349-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is in preparation to add support for other variants of the decoder.

Moving to struct representation is mainly to prepare for multicore
support that is present in e.g. rk3588.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 97 ++++++++++++++++---
 1 file changed, 86 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index cfe849cc93cb3..355d63aef7ea4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -19,7 +19,6 @@ extern const s8 rkvdec_h264_cabac_table[4][464][2];
 
 /* Size with u32 units. */
 #define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
-#define RKV_RPS_SIZE			((128 + 128) / 4)
 #define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
 
 #define RKVDEC_NUM_REFLIST		3
@@ -34,6 +33,40 @@ struct rkvdec_sps_pps_packet {
 	u32 info[8];
 };
 
+struct rkvdec_rps_entry {
+	u32 dpb_info0:          5;
+	u32 bottom_flag0:       1;
+	u32 view_index_off0:    1;
+	u32 dpb_info1:          5;
+	u32 bottom_flag1:       1;
+	u32 view_index_off1:    1;
+	u32 dpb_info2:          5;
+	u32 bottom_flag2:       1;
+	u32 view_index_off2:    1;
+	u32 dpb_info3:          5;
+	u32 bottom_flag3:       1;
+	u32 view_index_off3:    1;
+	u32 dpb_info4:          5;
+	u32 bottom_flag4:       1;
+	u32 view_index_off4:    1;
+	u32 dpb_info5:          5;
+	u32 bottom_flag5:       1;
+	u32 view_index_off5:    1;
+	u32 dpb_info6:          5;
+	u32 bottom_flag6:       1;
+	u32 view_index_off6:    1;
+	u32 dpb_info7:          5;
+	u32 bottom_flag7:       1;
+	u32 view_index_off7:    1;
+} __packed;
+
+struct rkvdec_rps {
+	u16 frame_num[16];
+	u32 reserved0;
+	struct rkvdec_rps_entry entries[12];
+	u32 reserved1[66];
+} __packed;
+
 struct rkvdec_ps_field {
 	u16 offset;
 	u8 len;
@@ -94,7 +127,7 @@ struct rkvdec_ps_field {
 struct rkvdec_h264_priv_tbl {
 	s8 cabac_table[4][464][2];
 	struct rkvdec_h264_scaling_list scaling_list;
-	u32 rps[RKV_RPS_SIZE];
+	struct rkvdec_rps rps;
 	struct rkvdec_sps_pps_packet param_set[256];
 	u8 err_info[RKV_ERROR_INFO_SIZE];
 };
@@ -260,20 +293,64 @@ static void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
 	}
 }
 
+static void set_dpb_info(struct rkvdec_rps_entry *entries,
+			 u8 reflist,
+			 u8 refnum,
+			 u8 info,
+			 bool bottom)
+{
+	struct rkvdec_rps_entry *entry = &entries[(reflist * 4) + refnum / 8];
+	u8 idx = refnum % 8;
+
+	switch (idx) {
+	case 0:
+		entry->dpb_info0 = info;
+		entry->bottom_flag0 = bottom;
+		break;
+	case 1:
+		entry->dpb_info1 = info;
+		entry->bottom_flag1 = bottom;
+		break;
+	case 2:
+		entry->dpb_info2 = info;
+		entry->bottom_flag2 = bottom;
+		break;
+	case 3:
+		entry->dpb_info3 = info;
+		entry->bottom_flag3 = bottom;
+		break;
+	case 4:
+		entry->dpb_info4 = info;
+		entry->bottom_flag4 = bottom;
+		break;
+	case 5:
+		entry->dpb_info5 = info;
+		entry->bottom_flag5 = bottom;
+		break;
+	case 6:
+		entry->dpb_info6 = info;
+		entry->bottom_flag6 = bottom;
+		break;
+	case 7:
+		entry->dpb_info7 = info;
+		entry->bottom_flag7 = bottom;
+		break;
+	}
+}
+
 static void assemble_hw_rps(struct rkvdec_ctx *ctx,
-			    struct v4l2_h264_reflist_builder *builder,
-			    struct rkvdec_h264_run *run)
+		     struct v4l2_h264_reflist_builder *builder,
+		     struct rkvdec_h264_run *run)
 {
 	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
 	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
 
-	u32 *hw_rps = priv_tbl->rps;
+	struct rkvdec_rps *hw_rps = &priv_tbl->rps;
 	u32 i, j;
-	u16 *p = (u16 *)hw_rps;
 
-	memset(hw_rps, 0, sizeof(priv_tbl->rps));
+	memset(hw_rps, 0, sizeof(*hw_rps));
 
 	/*
 	 * Assign an invalid pic_num if DPB entry at that position is inactive.
@@ -285,7 +362,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
 			continue;
 
-		p[i] = builder->refs[i].frame_num;
+		hw_rps->frame_num[i] = builder->refs[i].frame_num;
 	}
 
 	for (j = 0; j < RKVDEC_NUM_REFLIST; j++) {
@@ -312,9 +389,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			dpb_valid = run->ref_buf[ref->index] != NULL;
 			bottom = ref->fields == V4L2_H264_BOTTOM_FIELD_REF;
 
-			set_ps_field(hw_rps, DPB_INFO(i, j),
-				     ref->index | dpb_valid << 4);
-			set_ps_field(hw_rps, BOTTOM_FLAG(i, j), bottom);
+			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bottom);
 		}
 	}
 }
-- 
2.50.0


