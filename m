Return-Path: <linux-media+bounces-50293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF344D0B2D4
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 17:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C64453062A17
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7383D364049;
	Fri,  9 Jan 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pl7R+Ie3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E91364038;
	Fri,  9 Jan 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975356; cv=none; b=AbltOe/M9YKDTyUVM6bVksnxW72nOhrEbfGpAYvYlsN2j42WG0sUAtw527nyljaGiSW8Dz7jYGAUPIAv4NjZpVwCwsx7tVTPpzTxgkEMxnlN+ELZVlJpYhuuyczgQd5sIT7sTcyBeZ3Tuj2gMbj0GsxsIGJxG8eEu2sw4PGF+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975356; c=relaxed/simple;
	bh=zMs773gNTyCmVsfKZpLbcuvnRPqQol+69Xi60PFt49c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXSXSgvNJ2zNdE7IiyHVbBQ9dWBjjUwQg50DjPzFhR1SomGah5NVOxKMeHrNX2QiGHSwfGVeWDH7naSp5qV6GmfD0xr3BfrLkwS9V6L2amlysddY+Iq9Zeh0so+wdQuCUEAHKozmYgS8EvEn3cZUe8OL7T65K4cnxIz7NUi1Xv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pl7R+Ie3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767975353;
	bh=zMs773gNTyCmVsfKZpLbcuvnRPqQol+69Xi60PFt49c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pl7R+Ie3KhApOr6fbThardVdh/JZEDJrkS9oA7rRMavTTCpJfu+TDXSrbtU+wnGwy
	 k5zlSKTAWWu96EwDSd3p1Ne732AvaLA5bU7FSpCW3ymnUNM0D56Zu2zPLHsXTi3qIa
	 qJMJxm8fddx7S4jfcoqJxsGMaM2pgYJ8Pvre8ozW4DGeK5r6B1KseE6Ct3Jr5TD/RQ
	 plndtx4a3/GBp7CM/ltVK4SQHyZ0CwxsmUTGE8kC0lc2vMQmVRt+bNBlc28PO0A+25
	 xuzT3d8AnV6BqrYmJXWdD0dnfiDMU9TGMQkW1rw6xbrnu2z11mpM5ogTFopf94s4vH
	 pBSr0SnM5WU7Q==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6ADE017E1580;
	Fri,  9 Jan 2026 17:15:51 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v8 03/17] media: visl: Add HEVC short and long term RPS sets
Date: Fri,  9 Jan 2026 11:15:19 -0500
Message-ID: <20260109161538.1294449-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109161538.1294449-1-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
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
index d90b79de8384..6bbf93757047 100644
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
index c2c2ef3a8798..6e7562e555bb 100644
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
index 837b8ec12e97..963914c463db 100644
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


