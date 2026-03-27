Return-Path: <linux-media+bounces-57347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LICITbZxmkoPQUAu9opvQ
	(envelope-from <linux-media+bounces-57347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:23:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655E34A0D3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B794730916A4
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B7237C939;
	Fri, 27 Mar 2026 19:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I2EOMFid"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE1331A57;
	Fri, 27 Mar 2026 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639115; cv=none; b=LIYGgt8jAahhRy7nlNsayw40P+tuw/WozCkNjZrwhZ49rMh/F90LNvkNgA2lElTWSxhY4irmckfOeA/W8EXGSHnyGIuPESkHTKZH2i23NxARoxJN15aX6Ss7w5P6+dhqH8cUInlCdb1LM4stfl0Ki6BnIDwzOg7bvVDXSzROHkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639115; c=relaxed/simple;
	bh=1bCmci5H5uMJuWgbAcy3VTpK0uUU+5f2o4OPEXKPHzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNPs5w2oWjkPO6eDCrIFrJC009L7yC+MbSGTysWNP0eWRw1FHllgLmt9K6fNV47gHAQyhVlx3ps2/a12tLJNlpBeqgRFvfSTajxdqjU9Jq2VvpghsJ32hkZyua+BkOhPYKA21arDyJJAd+0FhcVjJYYx/Ax//YQs/f28zQo16CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I2EOMFid; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774639111;
	bh=1bCmci5H5uMJuWgbAcy3VTpK0uUU+5f2o4OPEXKPHzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I2EOMFidDPgARhC+3UXzly8eFPM5+BEyL4gpcRJyOSibEVOuARwyeYW1ZGpaprx5a
	 eN03y6yGxSWcaxWkswZSgIPoEcGFBLT5kYmcOYYSzjpkd0C82UjvjLBZDCMf49m4Xe
	 A3ImMn4EhzHCaOA5z3sBh+imeyaPI1uCQZhquF72QoM7LavJAsSLSeeWrvzLn3eF0p
	 yY6LJdi1L86DxniZ7zfVpNdADoWEaJSyBHNrkMSnzeeeeerKGmbErZdcKBKvbvxnAI
	 6zPqDefxfKuB1BLB2Tw0FurG25bdayFLYFn24b7/exGOccQyEGrNsh57xdJnW7LY72
	 xaGq2PfBGmRWA==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0FAB17E5D30;
	Fri, 27 Mar 2026 20:18:28 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Mar 2026 15:18:21 -0400
Subject: [PATCH v2 3/4] media: rkvdec: common: Drop bitfields for the
 bitwriter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rkvdec-use-bitwriter-v2-3-a5a4754b0518@collabora.com>
References: <20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com>
In-Reply-To: <20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57347-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 0655E34A0D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the common code files for hevc and h264 use structs with
bitfields to represent the HW RPS buffer.

Because the bitfields are mostly unaligned and numerous, it brings compiler
issues, especially with clang.

To prevent that, switch to using the global bitwriter previously
introduced instead.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  | 51 +-----------
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  | 40 +++-------
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  | 93 ++++------------------
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  | 57 ++++---------
 4 files changed, 44 insertions(+), 197 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
index e28f06394470..54639512e456 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
@@ -21,51 +21,6 @@
 
 #define RKVDEC_NUM_REFLIST		3
 
-static void set_dpb_info(struct rkvdec_rps_entry *entries,
-			 u8 reflist,
-			 u8 refnum,
-			 u8 info,
-			 bool bottom)
-{
-	struct rkvdec_rps_entry *entry = &entries[(reflist * 4) + refnum / 8];
-	u8 idx = refnum % 8;
-
-	switch (idx) {
-	case 0:
-		entry->dpb_info0 = info;
-		entry->bottom_flag0 = bottom;
-		break;
-	case 1:
-		entry->dpb_info1 = info;
-		entry->bottom_flag1 = bottom;
-		break;
-	case 2:
-		entry->dpb_info2 = info;
-		entry->bottom_flag2 = bottom;
-		break;
-	case 3:
-		entry->dpb_info3 = info;
-		entry->bottom_flag3 = bottom;
-		break;
-	case 4:
-		entry->dpb_info4 = info;
-		entry->bottom_flag4 = bottom;
-		break;
-	case 5:
-		entry->dpb_info5 = info;
-		entry->bottom_flag5 = bottom;
-		break;
-	case 6:
-		entry->dpb_info6 = info;
-		entry->bottom_flag6 = bottom;
-		break;
-	case 7:
-		entry->dpb_info7 = info;
-		entry->bottom_flag7 = bottom;
-		break;
-	}
-}
-
 void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
 			struct rkvdec_h264_run *run)
 {
@@ -111,7 +66,7 @@ void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
 		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
 			continue;
 
-		hw_rps->frame_num[i] = builder->refs[i].frame_num;
+		rkvdec_set_bw_field(hw_rps->info, RPS_FRAME_NUM(i), builder->refs[i].frame_num);
 	}
 
 	for (j = 0; j < RKVDEC_NUM_REFLIST; j++) {
@@ -138,7 +93,9 @@ void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
 			dpb_valid = !!(run->ref_buf[ref->index]);
 			bottom = ref->fields == V4L2_H264_BOTTOM_FIELD_REF;
 
-			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bottom);
+			rkvdec_set_bw_field(hw_rps->info, RPS_ENTRY_DPB_INFO(j, i),
+					    ref->index | (dpb_valid << 4));
+			rkvdec_set_bw_field(hw_rps->info, RPS_ENTRY_BOTTOM_FLAG(j, i), bottom);
 		}
 	}
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
index 5336370507d6..f04b700b863c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
@@ -16,6 +16,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "rkvdec.h"
+#include "rkvdec-bitwriter.h"
 
 struct rkvdec_h264_scaling_list {
 	u8 scaling_list_4x4[6][16];
@@ -38,39 +39,16 @@ struct rkvdec_h264_run {
 	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
 };
 
-struct rkvdec_rps_entry {
-	u32 dpb_info0:          5;
-	u32 bottom_flag0:       1;
-	u32 view_index_off0:    1;
-	u32 dpb_info1:          5;
-	u32 bottom_flag1:       1;
-	u32 view_index_off1:    1;
-	u32 dpb_info2:          5;
-	u32 bottom_flag2:       1;
-	u32 view_index_off2:    1;
-	u32 dpb_info3:          5;
-	u32 bottom_flag3:       1;
-	u32 view_index_off3:    1;
-	u32 dpb_info4:          5;
-	u32 bottom_flag4:       1;
-	u32 view_index_off4:    1;
-	u32 dpb_info5:          5;
-	u32 bottom_flag5:       1;
-	u32 view_index_off5:    1;
-	u32 dpb_info6:          5;
-	u32 bottom_flag6:       1;
-	u32 view_index_off6:    1;
-	u32 dpb_info7:          5;
-	u32 bottom_flag7:       1;
-	u32 view_index_off7:    1;
-} __packed;
+#define RPS_FRAME_NUM(i)		BW_FIELD((i) * 16, 16)
+#define RPS_ENTRY_DPB_INFO(l, e)	BW_FIELD(288 + (l) * 7 * 32 + (e) * 7, 5) //l: 0-2, e: 0-31
+#define RPS_ENTRY_BOTTOM_FLAG(l, e)	BW_FIELD(293 + (l) * 7 * 32 + (e) * 7, 1) //l: 0-2, e: 0-31
+#define RPS_ENTRY_VIEW_INDEX_OFF(l, e)	BW_FIELD(294 + (l) * 7 * 32 + (e) * 7, 1) //l: 0-2, e: 0-31
+
+#define RKVDEC_H264_RPS_SIZE		ALIGN(288 + 3 * 7 * 32, 128)
 
 struct rkvdec_rps {
-	u16 frame_num[16];
-	u32 reserved0;
-	struct rkvdec_rps_entry entries[12];
-	u32 reserved1[66];
-} __packed;
+	u32 info[RKVDEC_H264_RPS_SIZE / 8 / 4];
+};
 
 void lookup_ref_buf_idx(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *run);
 void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98..f89602075121 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -74,72 +74,6 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size
 	row_height[i] = pic_in_cts_height - sum;
 }
 
-static void set_ref_poc(struct rkvdec_rps_short_term_ref_set *set, int poc, int value, int flag)
-{
-	switch (poc) {
-	case 0:
-		set->delta_poc0 = value;
-		set->used_flag0 = flag;
-		break;
-	case 1:
-		set->delta_poc1 = value;
-		set->used_flag1 = flag;
-		break;
-	case 2:
-		set->delta_poc2 = value;
-		set->used_flag2 = flag;
-		break;
-	case 3:
-		set->delta_poc3 = value;
-		set->used_flag3 = flag;
-		break;
-	case 4:
-		set->delta_poc4 = value;
-		set->used_flag4 = flag;
-		break;
-	case 5:
-		set->delta_poc5 = value;
-		set->used_flag5 = flag;
-		break;
-	case 6:
-		set->delta_poc6 = value;
-		set->used_flag6 = flag;
-		break;
-	case 7:
-		set->delta_poc7 = value;
-		set->used_flag7 = flag;
-		break;
-	case 8:
-		set->delta_poc8 = value;
-		set->used_flag8 = flag;
-		break;
-	case 9:
-		set->delta_poc9 = value;
-		set->used_flag9 = flag;
-		break;
-	case 10:
-		set->delta_poc10 = value;
-		set->used_flag10 = flag;
-		break;
-	case 11:
-		set->delta_poc11 = value;
-		set->used_flag11 = flag;
-		break;
-	case 12:
-		set->delta_poc12 = value;
-		set->used_flag12 = flag;
-		break;
-	case 13:
-		set->delta_poc13 = value;
-		set->used_flag13 = flag;
-		break;
-	case 14:
-		set->delta_poc14 = value;
-		set->used_flag14 = flag;
-		break;
-	}
-}
-
 static void assemble_scalingfactor0(struct rkvdec_ctx *ctx, u8 *output,
 				    const struct v4l2_ctrl_hevc_scaling_matrix *input)
 {
@@ -218,10 +152,11 @@ static void rkvdec_hevc_assemble_hw_lt_rps(struct rkvdec_hevc_run *run, struct r
 		return;
 
 	for (int i = 0; i < sps->num_long_term_ref_pics_sps; i++) {
-		rps->refs[i].lt_ref_pic_poc_lsb =
-			run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps;
-		rps->refs[i].used_by_curr_pic_lt_flag =
-			!!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT);
+		rkvdec_set_bw_field(rps->info, RPS_LT_REF_PIC_POC_LSB(i),
+				    run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps);
+		rkvdec_set_bw_field(rps->info, RPS_LT_REF_USED_BY_CURR_PIC(i),
+				    !!(run->ext_sps_lt_rps[i].flags &
+				       V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT));
 	}
 }
 
@@ -235,18 +170,24 @@ static void rkvdec_hevc_assemble_hw_st_rps(struct rkvdec_hevc_run *run, struct r
 		int j = 0;
 		const struct calculated_rps_st_set *set = &calculated_rps_st_sets[i];
 
-		rps->short_term_ref_sets[i].num_negative = set->num_negative_pics;
-		rps->short_term_ref_sets[i].num_positive = set->num_positive_pics;
+		rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_NUM_NEGATIVE(i),
+				    set->num_negative_pics);
+		rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_NUM_POSITIVE(i),
+				    set->num_positive_pics);
 
 		for (; j < set->num_negative_pics; j++) {
-			set_ref_poc(&rps->short_term_ref_sets[i], j,
-				    set->delta_poc_s0[j], set->used_by_curr_pic_s0[j]);
+			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_DELTA_POC(i, j),
+					    set->delta_poc_s0[j]);
+			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_USED(i, j),
+					    set->used_by_curr_pic_s0[j]);
 		}
 		poc = j;
 
 		for (j = 0; j < set->num_positive_pics; j++) {
-			set_ref_poc(&rps->short_term_ref_sets[i], poc + j,
-				    set->delta_poc_s1[j], set->used_by_curr_pic_s1[j]);
+			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_DELTA_POC(i, poc + j),
+					    set->delta_poc_s1[j]);
+			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_USED(i, poc + j),
+					    set->used_by_curr_pic_s1[j]);
 		}
 	}
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
index 6f4faca4c091..2a9b7719ab2d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -19,53 +19,24 @@
 #include <linux/types.h>
 
 #include "rkvdec.h"
+#include "rkvdec-bitwriter.h"
 
-struct rkvdec_rps_refs {
-	u16 lt_ref_pic_poc_lsb;
-	u16 used_by_curr_pic_lt_flag	: 1;
-	u16 reserved			: 15;
-} __packed;
+#define RPS_LT_REF_PIC_POC_LSB(i)	BW_FIELD(0 + (i) * 32, 16) // i: 0-31
+#define RPS_LT_REF_USED_BY_CURR_PIC(i)	BW_FIELD(16 + (i) * 32, 1) // i: 0-31
 
-struct rkvdec_rps_short_term_ref_set {
-	u32 num_negative	: 4;
-	u32 num_positive	: 4;
-	u32 delta_poc0		: 16;
-	u32 used_flag0		: 1;
-	u32 delta_poc1		: 16;
-	u32 used_flag1		: 1;
-	u32 delta_poc2		: 16;
-	u32 used_flag2		: 1;
-	u32 delta_poc3		: 16;
-	u32 used_flag3		: 1;
-	u32 delta_poc4		: 16;
-	u32 used_flag4		: 1;
-	u32 delta_poc5		: 16;
-	u32 used_flag5		: 1;
-	u32 delta_poc6		: 16;
-	u32 used_flag6		: 1;
-	u32 delta_poc7		: 16;
-	u32 used_flag7		: 1;
-	u32 delta_poc8		: 16;
-	u32 used_flag8		: 1;
-	u32 delta_poc9		: 16;
-	u32 used_flag9		: 1;
-	u32 delta_poc10		: 16;
-	u32 used_flag10		: 1;
-	u32 delta_poc11		: 16;
-	u32 used_flag11		: 1;
-	u32 delta_poc12		: 16;
-	u32 used_flag12		: 1;
-	u32 delta_poc13		: 16;
-	u32 used_flag13		: 1;
-	u32 delta_poc14		: 16;
-	u32 used_flag14		: 1;
-	u32 reserved_bits	: 25;
-	u32 reserved[3];
-} __packed;
+#define RPS_ST_REF_SET_NUM_NEGATIVE(i)	BW_FIELD(1024 + ((i) * 384), 4) // i: 0-63
+#define RPS_ST_REF_SET_NUM_POSITIVE(i)	BW_FIELD(1028 + ((i) * 384), 4) // i: 0-63
+
+// i: 0-63, j: 0-14
+#define RPS_ST_REF_SET_DELTA_POC(i, j)	BW_FIELD(1032 + ((i) * 384) + ((j) * 17), 16)
+
+// i: 0-63, j: 0-14
+#define RPS_ST_REF_SET_USED(i, j)	BW_FIELD(1048 + ((i) * 384) + ((j) * 17), 1)
+
+#define RKVDEC_RPS_HEVC_SIZE		ALIGN(1032 + 64 * 384, 128)
 
 struct rkvdec_rps {
-	struct rkvdec_rps_refs refs[32];
-	struct rkvdec_rps_short_term_ref_set short_term_ref_sets[64];
+	u32 info[RKVDEC_RPS_HEVC_SIZE / 8 / 4];
 } __packed;
 
 struct rkvdec_hevc_run {

-- 
2.53.0


