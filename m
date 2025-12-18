Return-Path: <linux-media+bounces-49106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D80CCDF1C
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 00:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85E143027E20
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 23:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26622FE598;
	Thu, 18 Dec 2025 23:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qrzbh8PV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEA82BE029;
	Thu, 18 Dec 2025 23:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766100534; cv=none; b=Clv9Hv0zKZHbMkCHYZLwGs4xt5JiJuXiD2eYfZpb1ieyXMh9hp0WyK64lzBcgc8KHbjnwmvtCkM8eqFGrwy6SdRLC9D1MV3PDgFqkde9Oc9Z2w2wnTLq82MtpXU8q4Q9dsHQQVWIUUhrfEjpYzDLXJyTv4aSX0BoxY1DbFByMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766100534; c=relaxed/simple;
	bh=ysnLg7XcbLUG+pEfPcs8iI3XF5Q2cZW8GRIDia1EWfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTAeqRmtrrj99CrxoO2Q9J4MmH9rkfwpdCKEStW8yOrmS8nTzOdXaCkB4ZESzsrGu5yuEUxdhPR0sK5m0B1zERvS8oFitUqaoBch+XQgSCSg+MFodvonVzVfX65Gx+kzTQ43ZrcFuNgm5El+SDE7yG20mDiSUEym4m5Xwc4DQKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qrzbh8PV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100530;
	bh=ysnLg7XcbLUG+pEfPcs8iI3XF5Q2cZW8GRIDia1EWfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrzbh8PVhX4zpYLpsb5xk4vBmxInjDJdAUvH0GrYxKdHWhTayiT3dySKRz7L9G19J
	 VoU9ILnjj1gkpnuRCotorfVmtA1/fQJtjnMiIXRa7ZRYorVX3zitMUqgZxlWMtOU2W
	 ke7c04C1y42mQi3NqzQZk8jCwgqWGgvWr3OMIWHq3P1epSDB5DdMSK48qy91RW1mQU
	 1YBD6BIk9GgUANmuPwDYxbOVluearmVPaw9kAhZf5bIVQUQIZQ2UgVfYSZmt1H6HVG
	 AwbYsi01kFfMTz37HhQLOTeg4608xsrK5BAS/q7hVIw5i58iLg84+o3FLW6O5IC65Q
	 +CPGd0h+aZDtw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C52217E110D;
	Fri, 19 Dec 2025 00:28:47 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v7 06/17] media: rkvdec: Use structs to represent the HW RPS
Date: Thu, 18 Dec 2025 18:28:16 -0500
Message-ID: <20251218232829.337811-7-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218232829.337811-1-detlev.casanova@collabora.com>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
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

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 93 +++++++++++++++++--
 1 file changed, 84 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index 088840248a76b..fd941e9262796 100644
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
@@ -260,6 +293,51 @@ static void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
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
 			    struct v4l2_h264_reflist_builder *builder,
 			    struct rkvdec_h264_run *run)
@@ -269,11 +347,10 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
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
2.52.0


