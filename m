Return-Path: <linux-media+bounces-49103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B3CCDEF4
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 00:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 062583031255
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 23:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4422FF148;
	Thu, 18 Dec 2025 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Diva4TaP"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A12E9733;
	Thu, 18 Dec 2025 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766100526; cv=none; b=NNy+D0iya2Kij8hK4B8U/x23BQLlhuMM8mdWiRJhj4N+Xme18FZ1HB8QMYSAr+vyqW3qX2ts+6I7UpuKhCnMLtEjVtrBWyjlDF6Eg4tZAi/NkTRBPcxrre+JuYibbIQIIK7OoBdRayYVtLt2flsXBiWnXee6uK5QjEQsPvyNFkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766100526; c=relaxed/simple;
	bh=UrByMHK8ShbXkuBF6BQYPAnZlDu/LbP3faYfzE1pIaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1wfyOgodCqqiUSo48yxrSQWScKdjDBnwxijj+J+4PAzoHB5jP1a0Q2BE9YRH3df6Fty9W3lL2u0KrpM0tp7hJPa9VXdxcxxTjHr1OLnBNY0pqpvCDYHvdH5qfy9NXq9EafHEyNw5XSdVYfVnbD0n7bPHjaq2awFOwlS2YjD4Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Diva4TaP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100521;
	bh=UrByMHK8ShbXkuBF6BQYPAnZlDu/LbP3faYfzE1pIaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Diva4TaPMtTZrpkKEOeTd5ksH8dWic4wpchbONUPRmL1Aak4vv+L1vCXlnRe6WsRe
	 WkPGVZ87zJ9fChNXSuF65yEr6+nEnpZ89bTw2PJlFKbZj/9ZmSi8PNYMo2JhiYE0BB
	 XneZoj4ycrzN+ymrZKm/s6kFJgjzMHUXNuOqi4BN6NtC9dRYzlUEcTBJTiTEsvox5y
	 4I2gSe1mYevU2oPu5iN8cJHY4VnJEppkWYkd7m5aDMzN2zpvHyWOXpewtB4IrzMfWU
	 jTj8S2aGKjaOnbvyaKTtHqkA7ps7mQ4qmKP8HZm58HyXzWaWtrXrr9m2Xue0Insl0Y
	 1PEK9w+8FvWRQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CCFD17E110D;
	Fri, 19 Dec 2025 00:28:39 +0100 (CET)
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
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v7 03/17] media: visl: Add HEVC short and long term RPS sets
Date: Thu, 18 Dec 2025 18:28:13 -0500
Message-ID: <20251218232829.337811-4-detlev.casanova@collabora.com>
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

Log the recently added v4l2 controls to set HEVC short and long term RPS
sets with 2 new ftrace entries.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c    |  7 +++
 drivers/media/test-drivers/visl/visl-dec.h    |  3 +
 .../media/test-drivers/visl/visl-trace-hevc.h | 59 +++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index d90b79de8384a..6bbf937570478 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -547,6 +547,9 @@ static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run *run)
 			trace_v4l2_hevc_dpb_entry(&run->hevc.dpram->dpb[i]);
 
 		trace_v4l2_hevc_pred_weight_table(&run->hevc.spram->pred_weight_table);
+		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(run->hevc.rps_lt);
+		trace_v4l2_ctrl_hevc_ext_sps_st_rps(run->hevc.rps_st);
+
 		break;
 	case VISL_CODEC_AV1:
 		trace_v4l2_ctrl_av1_sequence(run->av1.seq);
@@ -611,6 +614,10 @@ void visl_device_run(void *priv)
 		run.hevc.spram = visl_find_control_data(ctx, V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
 		run.hevc.sm = visl_find_control_data(ctx, V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 		run.hevc.dpram = visl_find_control_data(ctx, V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
+		run.hevc.rps_lt = visl_find_control_data(ctx,
+							 V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
+		run.hevc.rps_st = visl_find_control_data(ctx,
+							 V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
 		break;
 	case VISL_CODEC_AV1:
 		run.av1.seq = visl_find_control_data(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
diff --git a/drivers/media/test-drivers/visl/visl-dec.h b/drivers/media/test-drivers/visl/visl-dec.h
index c2c2ef3a8798c..6e7562e555bb9 100644
--- a/drivers/media/test-drivers/visl/visl-dec.h
+++ b/drivers/media/test-drivers/visl/visl-dec.h
@@ -7,6 +7,7 @@
 #ifndef _VISL_DEC_H_
 #define _VISL_DEC_H_
 
+#include "linux/v4l2-controls.h"
 #include "visl.h"
 
 struct visl_fwht_run {
@@ -43,6 +44,8 @@ struct visl_hevc_run {
 	const struct v4l2_ctrl_hevc_slice_params *spram;
 	const struct v4l2_ctrl_hevc_scaling_matrix *sm;
 	const struct v4l2_ctrl_hevc_decode_params *dpram;
+	const struct v4l2_ctrl_hevc_ext_sps_lt_rps *rps_lt;
+	const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_st;
 };
 
 struct visl_av1_run {
diff --git a/drivers/media/test-drivers/visl/visl-trace-hevc.h b/drivers/media/test-drivers/visl/visl-trace-hevc.h
index 837b8ec12e975..963914c463dbc 100644
--- a/drivers/media/test-drivers/visl/visl-trace-hevc.h
+++ b/drivers/media/test-drivers/visl/visl-trace-hevc.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
+#include "linux/v4l2-controls.h"
 #if !defined(_VISL_TRACE_HEVC_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _VISL_TRACE_HEVC_H_
 
@@ -343,6 +344,54 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 	))
 );
 
+DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
+	TP_ARGS(lt),
+	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, lt)),
+	TP_fast_assign(__entry->lt = *lt),
+	TP_printk("\nflags %s\n"
+		  "lt_ref_pic_poc_lsb_sps %x\n",
+		  __print_flags(__entry->lt.flags, "|",
+		  {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
+		  ),
+		  __entry->lt.lt_ref_pic_poc_lsb_sps
+	)
+)
+
+DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
+	TP_ARGS(st),
+	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, st)),
+	TP_fast_assign(__entry->st = *st),
+	TP_printk("\nflags %s\n"
+		  "delta_idx_minus1: %u\n"
+		  "delta_rps_sign: %u\n"
+		  "abs_delta_rps_minus1: %u\n"
+		  "num_negative_pics: %u\n"
+		  "num_positive_pics: %u\n"
+		  "used_by_curr_pic: %08x\n"
+		  "use_delta_flag: %08x\n"
+		  "delta_poc_s0_minus1: %s\n"
+		  "delta_poc_s1_minus1: %s\n",
+		  __print_flags(__entry->st.flags, "|",
+		  {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_REF_PIC_SET_PRED"}
+		  ),
+		  __entry->st.delta_idx_minus1,
+		  __entry->st.delta_rps_sign,
+		  __entry->st.abs_delta_rps_minus1,
+		  __entry->st.num_negative_pics,
+		  __entry->st.num_positive_pics,
+		  __entry->st.used_by_curr_pic,
+		  __entry->st.use_delta_flag,
+		  __print_array(__entry->st.delta_poc_s0_minus1,
+				ARRAY_SIZE(__entry->st.delta_poc_s0_minus1),
+				sizeof(__entry->st.delta_poc_s0_minus1[0])),
+		  __print_array(__entry->st.delta_poc_s1_minus1,
+				ARRAY_SIZE(__entry->st.delta_poc_s1_minus1),
+				sizeof(__entry->st.delta_poc_s1_minus1[0]))
+	)
+)
+
 
 DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
 	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
@@ -391,6 +440,16 @@ DEFINE_EVENT(v4l2_ctrl_hevc_decode_params_tmpl, v4l2_ctrl_hevc_decode_params,
 	TP_ARGS(d)
 );
 
+DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl, v4l2_ctrl_hevc_ext_sps_lt_rps,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
+	TP_ARGS(lt)
+);
+
+DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl, v4l2_ctrl_hevc_ext_sps_st_rps,
+	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
+	TP_ARGS(st)
+);
+
 DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
 	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
 	TP_ARGS(e)
-- 
2.52.0


