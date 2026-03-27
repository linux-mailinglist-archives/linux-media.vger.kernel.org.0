Return-Path: <linux-media+bounces-57346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIL5DxHYxmkoPQUAu9opvQ
	(envelope-from <linux-media+bounces-57346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:18:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6B34A033
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0265B301E5C9
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9662D879E;
	Fri, 27 Mar 2026 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BuZZyCxv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D651E5B7B;
	Fri, 27 Mar 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639112; cv=none; b=PgsrQKCihoOnFW0I+a0VCvGhHQpk5Nb926WdM79gL569ZHoVXrcdKaN5+IMetb2VnTuUwAZgjZnECEUxy8nqOQwVa5IdsNP9HTbYaHSe9+Q6UbEoVwI2vPHZoE3o08/btCI+QCyfESl76zNEyeVz5q4Hb2BU6OIiKzNLN+N5bsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639112; c=relaxed/simple;
	bh=ztdOpe1+N7AYJi9ZYllZm3LlSnBDs1ybZtX80GDvQQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z25vPrFearyN1s2qkMVE5VSPdhVgzyK6pDCjEegjHM7Sfd6hCyUlLp8joBTo1aGcRNeaQ1GVRTUIyXhoRE1+kjtA2vF6/BwP/vgVHH3O4pBsYjRp2wYlrWYlfLMos+LwPyTXk4gbn2yCjaF3A5N/NXBGAaoN6joz9bQhb8RZkec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BuZZyCxv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774639108;
	bh=ztdOpe1+N7AYJi9ZYllZm3LlSnBDs1ybZtX80GDvQQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BuZZyCxveSRcGt8lKPrzVLdy6jemtDzTHLeG/oURIkavG2bMUMY0wqj76WQ1XZKUj
	 Owg4G8VKeXKidLc4n2S9ci/i6YTjoi4es0dDC4SwKYkjUK55F/nhhjmfpwlvvKDTl9
	 xKnx5jBrqmlWXQEMFNcfVzNGEH6cHGFRKIC5pGVWBwMpvn3Rke5U0wuOKJvh7gwvNr
	 c2w48UdWMVb2dkAb/K7zk9gqyomtxeXnFdRiYab5NB968UvbzmaRI8d28hvGBsLljo
	 7AQssPasMYpEQQS3ehdxFQmYg/8xgwt0XHTIfwCCphn7XBLPot4fL4RJ92Olghtoiv
	 ZSTS7f0irxN1A==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E15D17E5D22;
	Fri, 27 Mar 2026 20:18:26 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Mar 2026 15:18:20 -0400
Subject: [PATCH v2 2/4] media: rkvdec: Use the global bitwriter instead of
 local one
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rkvdec-use-bitwriter-v2-2-a5a4754b0518@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57346-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: D5E6B34A033
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both rkvdec-h264.c and rkvdec-hevc.c use their own bitwriter
function and macros.

Move to using the global one introduced before.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 109 ++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 171 +++++++++------------
 2 files changed, 119 insertions(+), 161 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index d3202cecb988..ffa606038192 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -16,6 +16,7 @@
 #include "rkvdec-regs.h"
 #include "rkvdec-cabac.h"
 #include "rkvdec-h264-common.h"
+#include "rkvdec-bitwriter.h"
 
 /* Size with u32 units. */
 #define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
@@ -25,56 +26,48 @@ struct rkvdec_sps_pps_packet {
 	u32 info[8];
 };
 
-struct rkvdec_ps_field {
-	u16 offset;
-	u8 len;
-};
-
-#define PS_FIELD(_offset, _len) \
-	((struct rkvdec_ps_field){ _offset, _len })
-
-#define SEQ_PARAMETER_SET_ID				PS_FIELD(0, 4)
-#define PROFILE_IDC					PS_FIELD(4, 8)
-#define CONSTRAINT_SET3_FLAG				PS_FIELD(12, 1)
-#define CHROMA_FORMAT_IDC				PS_FIELD(13, 2)
-#define BIT_DEPTH_LUMA					PS_FIELD(15, 3)
-#define BIT_DEPTH_CHROMA				PS_FIELD(18, 3)
-#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG		PS_FIELD(21, 1)
-#define LOG2_MAX_FRAME_NUM_MINUS4			PS_FIELD(22, 4)
-#define MAX_NUM_REF_FRAMES				PS_FIELD(26, 5)
-#define PIC_ORDER_CNT_TYPE				PS_FIELD(31, 2)
-#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4		PS_FIELD(33, 4)
-#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG		PS_FIELD(37, 1)
-#define PIC_WIDTH_IN_MBS				PS_FIELD(38, 9)
-#define PIC_HEIGHT_IN_MBS				PS_FIELD(47, 9)
-#define FRAME_MBS_ONLY_FLAG				PS_FIELD(56, 1)
-#define MB_ADAPTIVE_FRAME_FIELD_FLAG			PS_FIELD(57, 1)
-#define DIRECT_8X8_INFERENCE_FLAG			PS_FIELD(58, 1)
-#define MVC_EXTENSION_ENABLE				PS_FIELD(59, 1)
-#define NUM_VIEWS					PS_FIELD(60, 2)
-#define VIEW_ID(i)					PS_FIELD(62 + ((i) * 10), 10)
-#define NUM_ANCHOR_REFS_L(i)				PS_FIELD(82 + ((i) * 11), 1)
-#define ANCHOR_REF_L(i)				PS_FIELD(83 + ((i) * 11), 10)
-#define NUM_NON_ANCHOR_REFS_L(i)			PS_FIELD(104 + ((i) * 11), 1)
-#define NON_ANCHOR_REFS_L(i)				PS_FIELD(105 + ((i) * 11), 10)
-#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 8)
-#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(136, 5)
-#define ENTROPY_CODING_MODE_FLAG			PS_FIELD(141, 1)
-#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	PS_FIELD(142, 1)
-#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		PS_FIELD(143 + ((i) * 5), 5)
-#define WEIGHTED_PRED_FLAG				PS_FIELD(153, 1)
-#define WEIGHTED_BIPRED_IDC				PS_FIELD(154, 2)
-#define PIC_INIT_QP_MINUS26				PS_FIELD(156, 7)
-#define PIC_INIT_QS_MINUS26				PS_FIELD(163, 6)
-#define CHROMA_QP_INDEX_OFFSET				PS_FIELD(169, 5)
-#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		PS_FIELD(174, 1)
-#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(175, 1)
-#define REDUNDANT_PIC_CNT_PRESENT			PS_FIELD(176, 1)
-#define TRANSFORM_8X8_MODE_FLAG			PS_FIELD(177, 1)
-#define SECOND_CHROMA_QP_INDEX_OFFSET			PS_FIELD(178, 5)
-#define SCALING_LIST_ENABLE_FLAG			PS_FIELD(183, 1)
-#define SCALING_LIST_ADDRESS				PS_FIELD(184, 32)
-#define IS_LONG_TERM(i)				PS_FIELD(216 + (i), 1)
+#define SEQ_PARAMETER_SET_ID				BW_FIELD(0, 4)
+#define PROFILE_IDC					BW_FIELD(4, 8)
+#define CONSTRAINT_SET3_FLAG				BW_FIELD(12, 1)
+#define CHROMA_FORMAT_IDC				BW_FIELD(13, 2)
+#define BIT_DEPTH_LUMA					BW_FIELD(15, 3)
+#define BIT_DEPTH_CHROMA				BW_FIELD(18, 3)
+#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG		BW_FIELD(21, 1)
+#define LOG2_MAX_FRAME_NUM_MINUS4			BW_FIELD(22, 4)
+#define MAX_NUM_REF_FRAMES				BW_FIELD(26, 5)
+#define PIC_ORDER_CNT_TYPE				BW_FIELD(31, 2)
+#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4		BW_FIELD(33, 4)
+#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG		BW_FIELD(37, 1)
+#define PIC_WIDTH_IN_MBS				BW_FIELD(38, 9)
+#define PIC_HEIGHT_IN_MBS				BW_FIELD(47, 9)
+#define FRAME_MBS_ONLY_FLAG				BW_FIELD(56, 1)
+#define MB_ADAPTIVE_FRAME_FIELD_FLAG			BW_FIELD(57, 1)
+#define DIRECT_8X8_INFERENCE_FLAG			BW_FIELD(58, 1)
+#define MVC_EXTENSION_ENABLE				BW_FIELD(59, 1)
+#define NUM_VIEWS					BW_FIELD(60, 2)
+#define VIEW_ID(i)					BW_FIELD(62 + ((i) * 10), 10)
+#define NUM_ANCHOR_REFS_L(i)				BW_FIELD(82 + ((i) * 11), 1)
+#define ANCHOR_REF_L(i)				BW_FIELD(83 + ((i) * 11), 10)
+#define NUM_NON_ANCHOR_REFS_L(i)			BW_FIELD(104 + ((i) * 11), 1)
+#define NON_ANCHOR_REFS_L(i)				BW_FIELD(105 + ((i) * 11), 10)
+#define PIC_PARAMETER_SET_ID				BW_FIELD(128, 8)
+#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(136, 5)
+#define ENTROPY_CODING_MODE_FLAG			BW_FIELD(141, 1)
+#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	BW_FIELD(142, 1)
+#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		BW_FIELD(143 + ((i) * 5), 5)
+#define WEIGHTED_PRED_FLAG				BW_FIELD(153, 1)
+#define WEIGHTED_BIPRED_IDC				BW_FIELD(154, 2)
+#define PIC_INIT_QP_MINUS26				BW_FIELD(156, 7)
+#define PIC_INIT_QS_MINUS26				BW_FIELD(163, 6)
+#define CHROMA_QP_INDEX_OFFSET				BW_FIELD(169, 5)
+#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		BW_FIELD(174, 1)
+#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(175, 1)
+#define REDUNDANT_PIC_CNT_PRESENT			BW_FIELD(176, 1)
+#define TRANSFORM_8X8_MODE_FLAG			BW_FIELD(177, 1)
+#define SECOND_CHROMA_QP_INDEX_OFFSET			BW_FIELD(178, 5)
+#define SCALING_LIST_ENABLE_FLAG			BW_FIELD(183, 1)
+#define SCALING_LIST_ADDRESS				BW_FIELD(184, 32)
+#define IS_LONG_TERM(i)				BW_FIELD(216 + (i), 1)
 
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_h264_priv_tbl {
@@ -91,20 +84,6 @@ struct rkvdec_h264_ctx {
 	struct rkvdec_regs regs;
 };
 
-static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
-{
-	u8 bit = field.offset % 32, word = field.offset / 32;
-	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
-	u64 val = ((u64)value << bit) & mask;
-
-	buf[word] &= ~mask;
-	buf[word] |= val;
-	if (bit + field.len > 32) {
-		buf[word + 1] &= ~(mask >> 32);
-		buf[word + 1] |= val >> 32;
-	}
-}
-
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_h264_run *run)
 {
@@ -128,7 +107,7 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
-#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
+#define WRITE_PPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, value)
 	/* write sps */
 	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
 	WRITE_PPS(sps->profile_idc, PROFILE_IDC);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a..87abf93dfd5e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -18,6 +18,7 @@
 #include "rkvdec-regs.h"
 #include "rkvdec-cabac.h"
 #include "rkvdec-hevc-common.h"
+#include "rkvdec-bitwriter.h"
 
 /* Size in u8/u32 units. */
 #define RKV_SCALING_LIST_SIZE		1360
@@ -34,80 +35,72 @@ struct rkvdec_rps_packet {
 	u32 info[RKV_RPS_SIZE];
 };
 
-struct rkvdec_ps_field {
-	u16 offset;
-	u8 len;
-};
-
-#define PS_FIELD(_offset, _len) \
-	((struct rkvdec_ps_field){ _offset, _len })
-
 /* SPS */
-#define VIDEO_PARAMETER_SET_ID				PS_FIELD(0, 4)
-#define SEQ_PARAMETER_SET_ID				PS_FIELD(4, 4)
-#define CHROMA_FORMAT_IDC				PS_FIELD(8, 2)
-#define PIC_WIDTH_IN_LUMA_SAMPLES			PS_FIELD(10, 13)
-#define PIC_HEIGHT_IN_LUMA_SAMPLES			PS_FIELD(23, 13)
-#define BIT_DEPTH_LUMA					PS_FIELD(36, 4)
-#define BIT_DEPTH_CHROMA				PS_FIELD(40, 4)
-#define LOG2_MAX_PIC_ORDER_CNT_LSB			PS_FIELD(44, 5)
-#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	PS_FIELD(49, 2)
-#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			PS_FIELD(51, 3)
-#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			PS_FIELD(54, 3)
-#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	PS_FIELD(57, 2)
-#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		PS_FIELD(59, 3)
-#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		PS_FIELD(62, 3)
-#define SCALING_LIST_ENABLED_FLAG			PS_FIELD(65, 1)
-#define AMP_ENABLED_FLAG				PS_FIELD(66, 1)
-#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		PS_FIELD(67, 1)
-#define PCM_ENABLED_FLAG				PS_FIELD(68, 1)
-#define PCM_SAMPLE_BIT_DEPTH_LUMA			PS_FIELD(69, 4)
-#define PCM_SAMPLE_BIT_DEPTH_CHROMA			PS_FIELD(73, 4)
-#define PCM_LOOP_FILTER_DISABLED_FLAG			PS_FIELD(77, 1)
-#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	PS_FIELD(78, 3)
-#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		PS_FIELD(81, 3)
-#define NUM_SHORT_TERM_REF_PIC_SETS			PS_FIELD(84, 7)
-#define LONG_TERM_REF_PICS_PRESENT_FLAG			PS_FIELD(91, 1)
-#define NUM_LONG_TERM_REF_PICS_SPS			PS_FIELD(92, 6)
-#define SPS_TEMPORAL_MVP_ENABLED_FLAG			PS_FIELD(98, 1)
-#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		PS_FIELD(99, 1)
+#define VIDEO_PARAMETER_SET_ID				BW_FIELD(0, 4)
+#define SEQ_PARAMETER_SET_ID				BW_FIELD(4, 4)
+#define CHROMA_FORMAT_IDC				BW_FIELD(8, 2)
+#define PIC_WIDTH_IN_LUMA_SAMPLES			BW_FIELD(10, 13)
+#define PIC_HEIGHT_IN_LUMA_SAMPLES			BW_FIELD(23, 13)
+#define BIT_DEPTH_LUMA					BW_FIELD(36, 4)
+#define BIT_DEPTH_CHROMA				BW_FIELD(40, 4)
+#define LOG2_MAX_PIC_ORDER_CNT_LSB			BW_FIELD(44, 5)
+#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	BW_FIELD(49, 2)
+#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			BW_FIELD(51, 3)
+#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			BW_FIELD(54, 3)
+#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	BW_FIELD(57, 2)
+#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		BW_FIELD(59, 3)
+#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		BW_FIELD(62, 3)
+#define SCALING_LIST_ENABLED_FLAG			BW_FIELD(65, 1)
+#define AMP_ENABLED_FLAG				BW_FIELD(66, 1)
+#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		BW_FIELD(67, 1)
+#define PCM_ENABLED_FLAG				BW_FIELD(68, 1)
+#define PCM_SAMPLE_BIT_DEPTH_LUMA			BW_FIELD(69, 4)
+#define PCM_SAMPLE_BIT_DEPTH_CHROMA			BW_FIELD(73, 4)
+#define PCM_LOOP_FILTER_DISABLED_FLAG			BW_FIELD(77, 1)
+#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	BW_FIELD(78, 3)
+#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		BW_FIELD(81, 3)
+#define NUM_SHORT_TERM_REF_PIC_SETS			BW_FIELD(84, 7)
+#define LONG_TERM_REF_PICS_PRESENT_FLAG			BW_FIELD(91, 1)
+#define NUM_LONG_TERM_REF_PICS_SPS			BW_FIELD(92, 6)
+#define SPS_TEMPORAL_MVP_ENABLED_FLAG			BW_FIELD(98, 1)
+#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		BW_FIELD(99, 1)
 /* PPS */
-#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 6)
-#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(134, 4)
-#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		PS_FIELD(138, 1)
-#define OUTPUT_FLAG_PRESENT_FLAG			PS_FIELD(139, 1)
-#define NUM_EXTRA_SLICE_HEADER_BITS			PS_FIELD(140, 13)
-#define SIGN_DATA_HIDING_ENABLED_FLAG			PS_FIELD(153, 1)
-#define CABAC_INIT_PRESENT_FLAG				PS_FIELD(154, 1)
-#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			PS_FIELD(155, 4)
-#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			PS_FIELD(159, 4)
-#define INIT_QP_MINUS26					PS_FIELD(163, 7)
-#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(170, 1)
-#define TRANSFORM_SKIP_ENABLED_FLAG			PS_FIELD(171, 1)
-#define CU_QP_DELTA_ENABLED_FLAG			PS_FIELD(172, 1)
-#define LOG2_MIN_CU_QP_DELTA_SIZE			PS_FIELD(173, 3)
-#define PPS_CB_QP_OFFSET				PS_FIELD(176, 5)
-#define PPS_CR_QP_OFFSET				PS_FIELD(181, 5)
-#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	PS_FIELD(186, 1)
-#define WEIGHTED_PRED_FLAG				PS_FIELD(187, 1)
-#define WEIGHTED_BIPRED_FLAG				PS_FIELD(188, 1)
-#define TRANSQUANT_BYPASS_ENABLED_FLAG			PS_FIELD(189, 1)
-#define TILES_ENABLED_FLAG				PS_FIELD(190, 1)
-#define ENTROPY_CODING_SYNC_ENABLED_FLAG		PS_FIELD(191, 1)
-#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	PS_FIELD(192, 1)
-#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		PS_FIELD(193, 1)
-#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		PS_FIELD(194, 1)
-#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		PS_FIELD(195, 1)
-#define PPS_BETA_OFFSET_DIV2				PS_FIELD(196, 4)
-#define PPS_TC_OFFSET_DIV2				PS_FIELD(200, 4)
-#define LISTS_MODIFICATION_PRESENT_FLAG			PS_FIELD(204, 1)
-#define LOG2_PARALLEL_MERGE_LEVEL			PS_FIELD(205, 3)
-#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	PS_FIELD(208, 1)
-#define NUM_TILE_COLUMNS				PS_FIELD(212, 5)
-#define NUM_TILE_ROWS					PS_FIELD(217, 5)
-#define COLUMN_WIDTH(i)					PS_FIELD(256 + ((i) * 8), 8)
-#define ROW_HEIGHT(i)					PS_FIELD(416 + ((i) * 8), 8)
-#define SCALING_LIST_ADDRESS				PS_FIELD(592, 32)
+#define PIC_PARAMETER_SET_ID				BW_FIELD(128, 6)
+#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(134, 4)
+#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		BW_FIELD(138, 1)
+#define OUTPUT_FLAG_PRESENT_FLAG			BW_FIELD(139, 1)
+#define NUM_EXTRA_SLICE_HEADER_BITS			BW_FIELD(140, 13)
+#define SIGN_DATA_HIDING_ENABLED_FLAG			BW_FIELD(153, 1)
+#define CABAC_INIT_PRESENT_FLAG				BW_FIELD(154, 1)
+#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			BW_FIELD(155, 4)
+#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			BW_FIELD(159, 4)
+#define INIT_QP_MINUS26					BW_FIELD(163, 7)
+#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(170, 1)
+#define TRANSFORM_SKIP_ENABLED_FLAG			BW_FIELD(171, 1)
+#define CU_QP_DELTA_ENABLED_FLAG			BW_FIELD(172, 1)
+#define LOG2_MIN_CU_QP_DELTA_SIZE			BW_FIELD(173, 3)
+#define PPS_CB_QP_OFFSET				BW_FIELD(176, 5)
+#define PPS_CR_QP_OFFSET				BW_FIELD(181, 5)
+#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	BW_FIELD(186, 1)
+#define WEIGHTED_PRED_FLAG				BW_FIELD(187, 1)
+#define WEIGHTED_BIPRED_FLAG				BW_FIELD(188, 1)
+#define TRANSQUANT_BYPASS_ENABLED_FLAG			BW_FIELD(189, 1)
+#define TILES_ENABLED_FLAG				BW_FIELD(190, 1)
+#define ENTROPY_CODING_SYNC_ENABLED_FLAG		BW_FIELD(191, 1)
+#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	BW_FIELD(192, 1)
+#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		BW_FIELD(193, 1)
+#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		BW_FIELD(194, 1)
+#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		BW_FIELD(195, 1)
+#define PPS_BETA_OFFSET_DIV2				BW_FIELD(196, 4)
+#define PPS_TC_OFFSET_DIV2				BW_FIELD(200, 4)
+#define LISTS_MODIFICATION_PRESENT_FLAG			BW_FIELD(204, 1)
+#define LOG2_PARALLEL_MERGE_LEVEL			BW_FIELD(205, 3)
+#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	BW_FIELD(208, 1)
+#define NUM_TILE_COLUMNS				BW_FIELD(212, 5)
+#define NUM_TILE_ROWS					BW_FIELD(217, 5)
+#define COLUMN_WIDTH(i)					BW_FIELD(256 + ((i) * 8), 8)
+#define ROW_HEIGHT(i)					BW_FIELD(416 + ((i) * 8), 8)
+#define SCALING_LIST_ADDRESS				BW_FIELD(592, 32)
 
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_hevc_priv_tbl {
@@ -123,20 +116,6 @@ struct rkvdec_hevc_ctx {
 	struct rkvdec_regs regs;
 };
 
-static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
-{
-	u8 bit = field.offset % 32, word = field.offset / 32;
-	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
-	u64 val = ((u64)value << bit) & mask;
-
-	buf[word] &= ~mask;
-	buf[word] |= val;
-	if (bit + field.len > 32) {
-		buf[word + 1] &= ~(mask >> 32);
-		buf[word + 1] |= val >> 32;
-	}
-}
-
 static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_hevc_run *run)
 {
@@ -159,7 +138,7 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
-#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
+#define WRITE_PPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, value)
 	/* write sps */
 	WRITE_PPS(sps->video_parameter_set_id, VIDEO_PARAMETER_SET_ID);
 	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
@@ -321,17 +300,17 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
 	int i, j;
 	unsigned int lowdelay;
 
-#define WRITE_RPS(value, field) set_ps_field(hw_ps->info, field, value)
+#define WRITE_RPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, value)
 
-#define REF_PIC_LONG_TERM_L0(i)			PS_FIELD((i) * 5, 1)
-#define REF_PIC_IDX_L0(i)			PS_FIELD(1 + ((i) * 5), 4)
-#define REF_PIC_LONG_TERM_L1(i)			PS_FIELD(((i) < 5 ? 75 : 132) + ((i) * 5), 1)
-#define REF_PIC_IDX_L1(i)			PS_FIELD(((i) < 4 ? 76 : 128) + ((i) * 5), 4)
+#define REF_PIC_LONG_TERM_L0(n)			BW_FIELD((n) * 5, 1)
+#define REF_PIC_IDX_L0(n)			BW_FIELD(1 + ((n) * 5), 4)
+#define REF_PIC_LONG_TERM_L1(n)			BW_FIELD(((n) < 5 ? 75 : 132) + ((n) * 5), 1)
+#define REF_PIC_IDX_L1(n)			BW_FIELD(((n) < 4 ? 76 : 128) + ((n) * 5), 4)
 
-#define LOWDELAY				PS_FIELD(182, 1)
-#define LONG_TERM_RPS_BIT_OFFSET		PS_FIELD(183, 10)
-#define SHORT_TERM_RPS_BIT_OFFSET		PS_FIELD(193, 9)
-#define NUM_RPS_POC				PS_FIELD(202, 4)
+#define LOWDELAY				BW_FIELD(182, 1)
+#define LONG_TERM_RPS_BIT_OFFSET		BW_FIELD(183, 10)
+#define SHORT_TERM_RPS_BIT_OFFSET		BW_FIELD(193, 9)
+#define NUM_RPS_POC				BW_FIELD(202, 4)
 
 	for (j = 0; j < run->num_slices; j++) {
 		uint st_bit_offset = 0;

-- 
2.53.0


