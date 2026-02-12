Return-Path: <linux-media+bounces-52664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNh9H6L+jWm0+AAAu9opvQ
	(envelope-from <linux-media+bounces-52664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:24:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D712F595
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 845B23058564
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F46356A20;
	Thu, 12 Feb 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IoFwvMSU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37B286A8;
	Thu, 12 Feb 2026 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913426; cv=none; b=lQ4S2YpLjxk9SHRHPJzfDFZgEcoMurKFG2J3c6Fk8VPl0Y8MGLI33lsfW20YjSHbAQfkmKK7MrK0MjyDx+VwU+Wao5JxCTb4iRHJDmEu3f31l8wceLH1UtlsGGuuaE97R+JajtOtqooimXjATFvfJWGrZro51eC34dGbTKPpHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913426; c=relaxed/simple;
	bh=qy81Pqqa2Myt8BjEAyFmqPf7oaeAiia+QOMCQLW4gh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYSvapEz2plIoojm2WDjxKeKZnqYLhs9Cbeql1SHqX16t8uuZ6PaNDldFMKqEj/t9Nl3axmTkS4vTUEaa9jgY5UJoytr+pgEjHEifGgWfLOO7HaKkzy7bcFcNcNLGB0IxfE6aDdZiw0PjYsbF/og0eyZrfKABvVLWo7doGpVG9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IoFwvMSU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913422;
	bh=qy81Pqqa2Myt8BjEAyFmqPf7oaeAiia+QOMCQLW4gh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IoFwvMSUjuYqy8K7RRb9ZMHCII4gwqdL4uvmtN83EG6EnJYxryZvZ4GBaf6LID8Rr
	 G7y+Q456M/7A39A8Ef8jABF57oJquylFofXIRh50wfDPvN1WlbfohjecY/0hGOBY/X
	 yydB36pOjo11M5r6JT3QGlXrBYaIJ4BFf4BkPR9kR6omQctckyVAcHoNtXwYw2ihNX
	 n/KOzyu6kW328y+JeoRgWc4bJ1ReDZB1eJghH7apYFl/QdWG7mszMPLokmpGX4IlyK
	 GwSpjpTVebtihcAeNsNmF0xpx0CKQ1c5EylB0RX4AADeiWx/jWkrf3Jm+4SnBLp0ui
	 FpAK+SVpZO+2A==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 58E6817E0A49;
	Thu, 12 Feb 2026 17:23:39 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 02/11] media: Reformat v4l2-requests trace event printk
Date: Thu, 12 Feb 2026 11:23:19 -0500
Message-ID: <20260212162328.192217-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212162328.192217-1-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52664-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 374D712F595
X-Rspamd-Action: no action

When printing the v4l2-request traces the format was not stable.
Sometimes using a ':' separator, sometimes with an extra space and using
new lines.

Reformat the printk calls to match the format used in v4l2.h so that
parsers can use the same format for all events.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 include/trace/events/v4l2_requests.h | 649 ++++++++++++++-------------
 1 file changed, 328 insertions(+), 321 deletions(-)

diff --git a/include/trace/events/v4l2_requests.h b/include/trace/events/v4l2_requests.h
index 1e137d39d5fe..34f4a74df5ea 100644
--- a/include/trace/events/v4l2_requests.h
+++ b/include/trace/events/v4l2_requests.h
@@ -14,8 +14,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_sequence, s)),
 	TP_fast_assign(__entry->s = *s;),
-	TP_printk("\nflags %s\nseq_profile: %u\norder_hint_bits: %u\nbit_depth: %u\n"
-		  "max_frame_width_minus_1: %u\nmax_frame_height_minus_1: %u\n",
+	TP_printk("flags = %s, seq_profile = %u, order_hint_bits = %u, bit_depth = %u, "
+		  "max_frame_width_minus_1 = %u, max_frame_height_minus_1 = %u",
 		  __print_flags(__entry->s.flags, "|",
 		  {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
 		  {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK, "USE_128X128_SUPERBLOCK"},
@@ -50,7 +50,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
 	TP_ARGS(t),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_tile_group_entry, t)),
 	TP_fast_assign(__entry->t = *t;),
-	TP_printk("\ntile_offset: %u\n tile_size: %u\n tile_row: %u\ntile_col: %u\n",
+	TP_printk("tile_offset = %u, tile_size = %u, tile_row = %u, tile_col = %u",
 		  __entry->t.tile_offset,
 		  __entry->t.tile_size,
 		  __entry->t.tile_row,
@@ -63,30 +63,30 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 	TP_ARGS(f),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_frame, f)),
 	TP_fast_assign(__entry->f = *f;),
-	TP_printk("\ntile_info.flags: %s\ntile_info.context_update_tile_id: %u\n"
-		  "tile_info.tile_cols: %u\ntile_info.tile_rows: %u\n"
-		  "tile_info.mi_col_starts: %s\ntile_info.mi_row_starts: %s\n"
-		  "tile_info.width_in_sbs_minus_1: %s\ntile_info.height_in_sbs_minus_1: %s\n"
-		  "tile_info.tile_size_bytes: %u\nquantization.flags: %s\n"
-		  "quantization.base_q_idx: %u\nquantization.delta_q_y_dc: %d\n"
-		  "quantization.delta_q_u_dc: %d\nquantization.delta_q_u_ac: %d\n"
-		  "quantization.delta_q_v_dc: %d\nquantization.delta_q_v_ac: %d\n"
-		  "quantization.qm_y: %u\nquantization.qm_u: %u\nquantization.qm_v: %u\n"
-		  "quantization.delta_q_res: %u\nsuperres_denom: %u\nsegmentation.flags: %s\n"
-		  "segmentation.last_active_seg_id: %u\nsegmentation.feature_enabled:%s\n"
-		  "loop_filter.flags: %s\nloop_filter.level: %s\nloop_filter.sharpness: %u\n"
-		  "loop_filter.ref_deltas: %s\nloop_filter.mode_deltas: %s\n"
-		  "loop_filter.delta_lf_res: %u\ncdef.damping_minus_3: %u\ncdef.bits: %u\n"
-		  "cdef.y_pri_strength: %s\ncdef.y_sec_strength: %s\n"
-		  "cdef.uv_pri_strength: %s\ncdef.uv_sec_strength:%s\nskip_mode_frame: %s\n"
-		  "primary_ref_frame: %u\nloop_restoration.flags: %s\n"
-		  "loop_restoration.lr_unit_shift: %u\nloop_restoration.lr_uv_shift: %u\n"
-		  "loop_restoration.frame_restoration_type: %s\n"
-		  "loop_restoration.loop_restoration_size: %s\nflags: %s\norder_hint: %u\n"
-		  "upscaled_width: %u\nframe_width_minus_1: %u\nframe_height_minus_1: %u\n"
-		  "render_width_minus_1: %u\nrender_height_minus_1: %u\ncurrent_frame_id: %u\n"
-		  "buffer_removal_time: %s\norder_hints: %s\nreference_frame_ts: %s\n"
-		  "ref_frame_idx: %s\nrefresh_frame_flags: %u\n",
+	TP_printk("tile_info.flags = %s, tile_info.context_update_tile_id = %u, "
+		  "tile_info.tile_cols = %u, tile_info.tile_rows = %u, "
+		  "tile_info.mi_col_starts = %s, tile_info.mi_row_starts = %s, "
+		  "tile_info.width_in_sbs_minus_1 = %s, tile_info.height_in_sbs_minus_1 = %s, "
+		  "tile_info.tile_size_bytes = %u, quantization.flags = %s, "
+		  "quantization.base_q_idx = %u, quantization.delta_q_y_dc = %d, "
+		  "quantization.delta_q_u_dc = %d, quantization.delta_q_u_ac = %d, "
+		  "quantization.delta_q_v_dc = %d, quantization.delta_q_v_ac = %d, "
+		  "quantization.qm_y = %u, quantization.qm_u = %u, quantization.qm_v = %u, "
+		  "quantization.delta_q_res = %u, superres_denom = %u, segmentation.flags = %s, "
+		  "segmentation.last_active_seg_id = %u, segmentation.feature_enabled = %s, "
+		  "loop_filter.flags = %s, loop_filter.level = %s, loop_filter.sharpness = %u, "
+		  "loop_filter.ref_deltas = %s, loop_filter.mode_deltas = %s, "
+		  "loop_filter.delta_lf_res = %u, cdef.damping_minus_3 = %u, cdef.bits = %u, "
+		  "cdef.y_pri_strength = %s, cdef.y_sec_strength = %s, "
+		  "cdef.uv_pri_strength = %s, cdef.uv_sec_strength = %s, skip_mode_frame = %s, "
+		  "primary_ref_frame = %u, loop_restoration.flags = %s, "
+		  "loop_restoration.lr_unit_shift = %u, loop_restoration.lr_uv_shift = %u, "
+		  "loop_restoration.frame_restoration_type = %s, "
+		  "loop_restoration.loop_restoration_size = %s, flags = %s, order_hint = %u, "
+		  "upscaled_width = %u, frame_width_minus_1 = %u, frame_height_minus_1 = %u, "
+		  "render_width_minus_1 = %u, render_height_minus_1 = %u, current_frame_id = %u, "
+		  "buffer_removal_time = %s, order_hints = %s, reference_frame_ts = %s, "
+		  "ref_frame_idx = %s, refresh_frame_flags = %u",
 		  __print_flags(__entry->f.tile_info.flags, "|",
 		  {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING, "UNIFORM_TILE_SPACING"}),
 		  __entry->f.tile_info.context_update_tile_id,
@@ -226,15 +226,15 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 	TP_ARGS(f),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_film_grain, f)),
 	TP_fast_assign(__entry->f = *f;),
-	TP_printk("\nflags %s\ncr_mult: %u\ngrain_seed: %u\n"
-		  "film_grain_params_ref_idx: %u\nnum_y_points: %u\npoint_y_value: %s\n"
-		  "point_y_scaling: %s\nnum_cb_points: %u\npoint_cb_value: %s\n"
-		  "point_cb_scaling: %s\nnum_cr_points: %u\npoint_cr_value: %s\n"
-		  "point_cr_scaling: %s\ngrain_scaling_minus_8: %u\nar_coeff_lag: %u\n"
-		  "ar_coeffs_y_plus_128: %s\nar_coeffs_cb_plus_128: %s\n"
-		  "ar_coeffs_cr_plus_128: %s\nar_coeff_shift_minus_6: %u\n"
-		  "grain_scale_shift: %u\ncb_mult: %u\ncb_luma_mult: %u\ncr_luma_mult: %u\n"
-		  "cb_offset: %u\ncr_offset: %u\n",
+	TP_printk("flags = %s, cr_mult = %u, grain_seed = %u, "
+		  "film_grain_params_ref_idx = %u, num_y_points = %u, point_y_value = %s, "
+		  "point_y_scaling = %s, num_cb_points = %u, point_cb_value = %s, "
+		  "point_cb_scaling = %s, num_cr_points = %u, point_cr_value = %s, "
+		  "point_cr_scaling = %s, grain_scaling_minus_8 = %u, ar_coeff_lag = %u, "
+		  "ar_coeffs_y_plus_128 = %s, ar_coeffs_cb_plus_128 = %s, "
+		  "ar_coeffs_cr_plus_128 = %s, ar_coeff_shift_minus_6 = %u, "
+		  "grain_scale_shift = %u, cb_mult = %u, cb_luma_mult = %u, cr_luma_mult = %u, "
+		  "cb_offset = %u, cr_offset = %u",
 		  __print_flags(__entry->f.flags, "|",
 		  {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
 		  {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
@@ -333,7 +333,15 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 		       __entry->ycbcr_enc = p->ycbcr_enc;
 		       __entry->quantization = p->quantization;
 		       ),
-	TP_printk("backward_ref_ts %llu version %u width %u height %u flags %s colorspace %u xfer_func %u ycbcr_enc %u quantization %u",
+	TP_printk("backward_ref_ts = %llu, "
+		  "version = %u, "
+		  "width = %u, "
+		  "height = %u, "
+		  "flags = %s, "
+		  "colorspace = %u, "
+		  "xfer_func = %u, "
+		  "ycbcr_enc = %u, "
+		  "quantization = %u",
 		  __entry->backward_ref_ts, __entry->version, __entry->width, __entry->height,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
@@ -364,24 +372,24 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
 	TP_fast_assign(__entry->s = *s),
-	TP_printk("\nprofile_idc %u\n"
-		  "constraint_set_flags %s\n"
-		  "level_idc %u\n"
-		  "seq_parameter_set_id %u\n"
-		  "chroma_format_idc %u\n"
-		  "bit_depth_luma_minus8 %u\n"
-		  "bit_depth_chroma_minus8 %u\n"
-		  "log2_max_frame_num_minus4 %u\n"
-		  "pic_order_cnt_type %u\n"
-		  "log2_max_pic_order_cnt_lsb_minus4 %u\n"
-		  "max_num_ref_frames %u\n"
-		  "num_ref_frames_in_pic_order_cnt_cycle %u\n"
-		  "offset_for_ref_frame %s\n"
-		  "offset_for_non_ref_pic %d\n"
-		  "offset_for_top_to_bottom_field %d\n"
-		  "pic_width_in_mbs_minus1 %u\n"
-		  "pic_height_in_map_units_minus1 %u\n"
-		  "flags %s",
+	TP_printk("profile_idc = %u, "
+		  "constraint_set_flags = %s, "
+		  "level_idc = %u, "
+		  "seq_parameter_set_id = %u, "
+		  "chroma_format_idc = %u, "
+		  "bit_depth_luma_minus8 = %u, "
+		  "bit_depth_chroma_minus8 = %u, "
+		  "log2_max_frame_num_minus4 = %u, "
+		  "pic_order_cnt_type = %u, "
+		  "log2_max_pic_order_cnt_lsb_minus4 = %u, "
+		  "max_num_ref_frames = %u, "
+		  "num_ref_frames_in_pic_order_cnt_cycle = %u, "
+		  "offset_for_ref_frame = %s, "
+		  "offset_for_non_ref_pic = %d, "
+		  "offset_for_top_to_bottom_field = %d, "
+		  "pic_width_in_mbs_minus1 = %u, "
+		  "pic_height_in_map_units_minus1 = %u, "
+		  "flags = %s",
 		  __entry->s.profile_idc,
 		  __print_flags(__entry->s.constraint_set_flags, "|",
 		  {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG"},
@@ -423,17 +431,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 	TP_ARGS(p),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
 	TP_fast_assign(__entry->p = *p),
-	TP_printk("\npic_parameter_set_id %u\n"
-		  "seq_parameter_set_id %u\n"
-		  "num_slice_groups_minus1 %u\n"
-		  "num_ref_idx_l0_default_active_minus1 %u\n"
-		  "num_ref_idx_l1_default_active_minus1 %u\n"
-		  "weighted_bipred_idc %u\n"
-		  "pic_init_qp_minus26 %d\n"
-		  "pic_init_qs_minus26 %d\n"
-		  "chroma_qp_index_offset %d\n"
-		  "second_chroma_qp_index_offset %d\n"
-		  "flags %s",
+	TP_printk("pic_parameter_set_id = %u, "
+		  "seq_parameter_set_id = %u, "
+		  "num_slice_groups_minus1 = %u, "
+		  "num_ref_idx_l0_default_active_minus1 = %u, "
+		  "num_ref_idx_l1_default_active_minus1 = %u, "
+		  "weighted_bipred_idc = %u, "
+		  "pic_init_qp_minus26 = %d, "
+		  "pic_init_qs_minus26 = %d, "
+		  "chroma_qp_index_offset = %d, "
+		  "second_chroma_qp_index_offset = %d, "
+		  "flags = %s",
 		  __entry->p.pic_parameter_set_id,
 		  __entry->p.seq_parameter_set_id,
 		  __entry->p.num_slice_groups_minus1,
@@ -461,7 +469,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matrix, s)),
 	TP_fast_assign(__entry->s = *s),
-	TP_printk("\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
+	TP_printk("scaling_list_4x4 = {%s}, scaling_list_8x8 = {%s}",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->s.scaling_list_4x4,
 				   sizeof(__entry->s.scaling_list_4x4),
@@ -478,16 +486,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 	TP_ARGS(p),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights, p)),
 	TP_fast_assign(__entry->p = *p),
-	TP_printk("\nluma_log2_weight_denom %u\n"
-		  "chroma_log2_weight_denom %u\n"
-		  "weight_factor[0].luma_weight %s\n"
-		  "weight_factor[0].luma_offset %s\n"
-		  "weight_factor[0].chroma_weight {%s}\n"
-		  "weight_factor[0].chroma_offset {%s}\n"
-		  "weight_factor[1].luma_weight %s\n"
-		  "weight_factor[1].luma_offset %s\n"
-		  "weight_factor[1].chroma_weight {%s}\n"
-		  "weight_factor[1].chroma_offset {%s}\n",
+	TP_printk("luma_log2_weight_denom = %u, "
+		  "chroma_log2_weight_denom = %u, "
+		  "weight_factor[0].luma_weight = %s, "
+		  "weight_factor[0].luma_offset = %s, "
+		  "weight_factor[0].chroma_weight = {%s}, "
+		  "weight_factor[0].chroma_offset = {%s}, "
+		  "weight_factor[1].luma_weight = %s, "
+		  "weight_factor[1].luma_offset = %s, "
+		  "weight_factor[1].chroma_weight = {%s}, "
+		  "weight_factor[1].chroma_offset = {%s}",
 		  __entry->p.luma_log2_weight_denom,
 		  __entry->p.chroma_log2_weight_denom,
 		  __print_array(__entry->p.weight_factors[0].luma_weight,
@@ -526,20 +534,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params, s)),
 	TP_fast_assign(__entry->s = *s),
-	TP_printk("\nheader_bit_size %u\n"
-		  "first_mb_in_slice %u\n"
-		  "slice_type %s\n"
-		  "colour_plane_id %u\n"
-		  "redundant_pic_cnt %u\n"
-		  "cabac_init_idc %u\n"
-		  "slice_qp_delta %d\n"
-		  "slice_qs_delta %d\n"
-		  "disable_deblocking_filter_idc %u\n"
-		  "slice_alpha_c0_offset_div2 %u\n"
-		  "slice_beta_offset_div2 %u\n"
-		  "num_ref_idx_l0_active_minus1 %u\n"
-		  "num_ref_idx_l1_active_minus1 %u\n"
-		  "flags %s",
+	TP_printk("header_bit_size = %u, "
+		  "first_mb_in_slice = %u, "
+		  "slice_type = %s, "
+		  "colour_plane_id = %u, "
+		  "redundant_pic_cnt = %u, "
+		  "cabac_init_idc = %u, "
+		  "slice_qp_delta = %d, "
+		  "slice_qs_delta = %d, "
+		  "disable_deblocking_filter_idc = %u, "
+		  "slice_alpha_c0_offset_div2 = %u, "
+		  "slice_beta_offset_div2 = %u, "
+		  "num_ref_idx_l0_active_minus1 = %u, "
+		  "num_ref_idx_l1_active_minus1 = %u, "
+		  "flags = %s",
 		  __entry->s.header_bit_size,
 		  __entry->s.first_mb_in_slice,
 		  __print_symbolic(__entry->s.slice_type,
@@ -570,7 +578,7 @@ DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
 	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
 			 __field(int, i)),
 	TP_fast_assign(__entry->r = *r; __entry->i = i;),
-	TP_printk("[%d]: fields %s index %u",
+	TP_printk("[%d]: fields = %s, index = %u",
 		  __entry->i,
 		  __print_flags(__entry->r.fields, "|",
 		  {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
@@ -585,19 +593,19 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 	TP_ARGS(d),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_params, d)),
 	TP_fast_assign(__entry->d = *d),
-	TP_printk("\nnal_ref_idc %u\n"
-		  "frame_num %u\n"
-		  "top_field_order_cnt %d\n"
-		  "bottom_field_order_cnt %d\n"
-		  "idr_pic_id %u\n"
-		  "pic_order_cnt_lsb %u\n"
-		  "delta_pic_order_cnt_bottom %d\n"
-		  "delta_pic_order_cnt0 %d\n"
-		  "delta_pic_order_cnt1 %d\n"
-		  "dec_ref_pic_marking_bit_size %u\n"
-		  "pic_order_cnt_bit_size %u\n"
-		  "slice_group_change_cycle %u\n"
-		  "flags %s\n",
+	TP_printk("nal_ref_idc = %u, "
+		  "frame_num = %u, "
+		  "top_field_order_cnt = %d, "
+		  "bottom_field_order_cnt = %d, "
+		  "idr_pic_id = %u, "
+		  "pic_order_cnt_lsb = %u, "
+		  "delta_pic_order_cnt_bottom = %d, "
+		  "delta_pic_order_cnt0 = %d, "
+		  "delta_pic_order_cnt1 = %d, "
+		  "dec_ref_pic_marking_bit_size = %u, "
+		  "pic_order_cnt_bit_size = %u, "
+		  "slice_group_change_cycle = %u, "
+		  "flags = %s",
 		  __entry->d.nal_ref_idc,
 		  __entry->d.frame_num,
 		  __entry->d.top_field_order_cnt,
@@ -625,8 +633,8 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
 	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
 			 __field(int, i)),
 	TP_fast_assign(__entry->e = *e; __entry->i = i;),
-	TP_printk("[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s "
-		  "top_field_order_cnt %d bottom_field_order_cnt %d flags %s",
+	TP_printk("[%d]: reference_ts = %llu, pic_num = %u, frame_num = %u, fields = %s "
+		  "top_field_order_cnt = %d, bottom_field_order_cnt = %d, flags = %s",
 		  __entry->i,
 		  __entry->e.reference_ts,
 		  __entry->e.pic_num,
@@ -642,7 +650,6 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
 		  {V4L2_H264_DPB_ENTRY_FLAG_ACTIVE, "ACTIVE"},
 		  {V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM, "LONG_TERM"},
 		  {V4L2_H264_DPB_ENTRY_FLAG_FIELD, "FIELD"})
-
 	)
 );
 
@@ -698,31 +705,31 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_sps, s)),
 	TP_fast_assign(__entry->s = *s),
-	TP_printk("\nvideo_parameter_set_id %u\n"
-		  "seq_parameter_set_id %u\n"
-		  "pic_width_in_luma_samples %u\n"
-		  "pic_height_in_luma_samples %u\n"
-		  "bit_depth_luma_minus8 %u\n"
-		  "bit_depth_chroma_minus8 %u\n"
-		  "log2_max_pic_order_cnt_lsb_minus4 %u\n"
-		  "sps_max_dec_pic_buffering_minus1 %u\n"
-		  "sps_max_num_reorder_pics %u\n"
-		  "sps_max_latency_increase_plus1 %u\n"
-		  "log2_min_luma_coding_block_size_minus3 %u\n"
-		  "log2_diff_max_min_luma_coding_block_size %u\n"
-		  "log2_min_luma_transform_block_size_minus2 %u\n"
-		  "log2_diff_max_min_luma_transform_block_size %u\n"
-		  "max_transform_hierarchy_depth_inter %u\n"
-		  "max_transform_hierarchy_depth_intra %u\n"
-		  "pcm_sample_bit_depth_luma_minus1 %u\n"
-		  "pcm_sample_bit_depth_chroma_minus1 %u\n"
-		  "log2_min_pcm_luma_coding_block_size_minus3 %u\n"
-		  "log2_diff_max_min_pcm_luma_coding_block_size %u\n"
-		  "num_short_term_ref_pic_sets %u\n"
-		  "num_long_term_ref_pics_sps %u\n"
-		  "chroma_format_idc %u\n"
-		  "sps_max_sub_layers_minus1 %u\n"
-		  "flags %s",
+	TP_printk("video_parameter_set_id = %u, "
+		  "seq_parameter_set_id = %u, "
+		  "pic_width_in_luma_samples = %u, "
+		  "pic_height_in_luma_samples = %u, "
+		  "bit_depth_luma_minus8 = %u, "
+		  "bit_depth_chroma_minus8 = %u, "
+		  "log2_max_pic_order_cnt_lsb_minus4 = %u, "
+		  "sps_max_dec_pic_buffering_minus1 = %u, "
+		  "sps_max_num_reorder_pics = %u, "
+		  "sps_max_latency_increase_plus1 = %u, "
+		  "log2_min_luma_coding_block_size_minus3 = %u, "
+		  "log2_diff_max_min_luma_coding_block_size = %u, "
+		  "log2_min_luma_transform_block_size_minus2 = %u, "
+		  "log2_diff_max_min_luma_transform_block_size = %u, "
+		  "max_transform_hierarchy_depth_inter = %u, "
+		  "max_transform_hierarchy_depth_intra = %u, "
+		  "pcm_sample_bit_depth_luma_minus1 = %u, "
+		  "pcm_sample_bit_depth_chroma_minus1 = %u, "
+		  "log2_min_pcm_luma_coding_block_size_minus3 = %u, "
+		  "log2_diff_max_min_pcm_luma_coding_block_size = %u, "
+		  "num_short_term_ref_pic_sets = %u, "
+		  "num_long_term_ref_pics_sps = %u, "
+		  "chroma_format_idc = %u, "
+		  "sps_max_sub_layers_minus1 = %u, "
+		  "flags = %s",
 		  __entry->s.video_parameter_set_id,
 		  __entry->s.seq_parameter_set_id,
 		  __entry->s.pic_width_in_luma_samples,
@@ -767,22 +774,22 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 	TP_ARGS(p),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_pps, p)),
 	TP_fast_assign(__entry->p = *p),
-	TP_printk("\npic_parameter_set_id %u\n"
-		  "num_extra_slice_header_bits %u\n"
-		  "num_ref_idx_l0_default_active_minus1 %u\n"
-		  "num_ref_idx_l1_default_active_minus1 %u\n"
-		  "init_qp_minus26 %d\n"
-		  "diff_cu_qp_delta_depth %u\n"
-		  "pps_cb_qp_offset %d\n"
-		  "pps_cr_qp_offset %d\n"
-		  "num_tile_columns_minus1 %d\n"
-		  "num_tile_rows_minus1 %d\n"
-		  "column_width_minus1 %s\n"
-		  "row_height_minus1 %s\n"
-		  "pps_beta_offset_div2 %d\n"
-		  "pps_tc_offset_div2 %d\n"
-		  "log2_parallel_merge_level_minus2 %u\n"
-		  "flags %s",
+	TP_printk("pic_parameter_set_id = %u, "
+		  "num_extra_slice_header_bits = %u, "
+		  "num_ref_idx_l0_default_active_minus1 = %u, "
+		  "num_ref_idx_l1_default_active_minus1 = %u, "
+		  "init_qp_minus26 = %d, "
+		  "diff_cu_qp_delta_depth = %u, "
+		  "pps_cb_qp_offset = %d, "
+		  "pps_cr_qp_offset = %d, "
+		  "num_tile_columns_minus1 = %d, "
+		  "num_tile_rows_minus1 = %d, "
+		  "column_width_minus1 = %s, "
+		  "row_height_minus1 = %s, "
+		  "pps_beta_offset_div2 = %d, "
+		  "pps_tc_offset_div2 = %d, "
+		  "log2_parallel_merge_level_minus2 = %u, "
+		  "flags = %s",
 		  __entry->p.pic_parameter_set_id,
 		  __entry->p.num_extra_slice_header_bits,
 		  __entry->p.num_ref_idx_l0_default_active_minus1,
@@ -834,33 +841,33 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_slice_params, s)),
 	TP_fast_assign(__entry->s = *s),
-	TP_printk("\nbit_size %u\n"
-		  "data_byte_offset %u\n"
-		  "num_entry_point_offsets %u\n"
-		  "nal_unit_type %u\n"
-		  "nuh_temporal_id_plus1 %u\n"
-		  "slice_type %u\n"
-		  "colour_plane_id %u\n"
-		  "slice_pic_order_cnt %d\n"
-		  "num_ref_idx_l0_active_minus1 %u\n"
-		  "num_ref_idx_l1_active_minus1 %u\n"
-		  "collocated_ref_idx %u\n"
-		  "five_minus_max_num_merge_cand %u\n"
-		  "slice_qp_delta %d\n"
-		  "slice_cb_qp_offset %d\n"
-		  "slice_cr_qp_offset %d\n"
-		  "slice_act_y_qp_offset %d\n"
-		  "slice_act_cb_qp_offset %d\n"
-		  "slice_act_cr_qp_offset %d\n"
-		  "slice_beta_offset_div2 %d\n"
-		  "slice_tc_offset_div2 %d\n"
-		  "pic_struct %u\n"
-		  "slice_segment_addr %u\n"
-		  "ref_idx_l0 %s\n"
-		  "ref_idx_l1 %s\n"
-		  "short_term_ref_pic_set_size %u\n"
-		  "long_term_ref_pic_set_size %u\n"
-		  "flags %s",
+	TP_printk("bit_size = %u, "
+		  "data_byte_offset = %u, "
+		  "num_entry_point_offsets = %u, "
+		  "nal_unit_type = %u, "
+		  "nuh_temporal_id_plus1 = %u, "
+		  "slice_type = %u, "
+		  "colour_plane_id = %u, "
+		  "slice_pic_order_cnt = %d, "
+		  "num_ref_idx_l0_active_minus1 = %u, "
+		  "num_ref_idx_l1_active_minus1 = %u, "
+		  "collocated_ref_idx = %u, "
+		  "five_minus_max_num_merge_cand = %u, "
+		  "slice_qp_delta = %d, "
+		  "slice_cb_qp_offset = %d, "
+		  "slice_cr_qp_offset = %d, "
+		  "slice_act_y_qp_offset = %d, "
+		  "slice_act_cb_qp_offset = %d, "
+		  "slice_act_cr_qp_offset = %d, "
+		  "slice_beta_offset_div2 = %d, "
+		  "slice_tc_offset_div2 = %d, "
+		  "pic_struct = %u, "
+		  "slice_segment_addr = %u, "
+		  "ref_idx_l0 = %s, "
+		  "ref_idx_l1 = %s, "
+		  "short_term_ref_pic_set_size = %u, "
+		  "long_term_ref_pic_set_size = %u, "
+		  "flags = %s",
 		  __entry->s.bit_size,
 		  __entry->s.data_byte_offset,
 		  __entry->s.num_entry_point_offsets,
@@ -911,16 +918,16 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 	TP_ARGS(p),
 	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_pred_weight_table, p)),
 	TP_fast_assign(__entry->p = *p),
-	TP_printk("\ndelta_luma_weight_l0 %s\n"
-		  "luma_offset_l0 %s\n"
-		  "delta_chroma_weight_l0 {%s}\n"
-		  "chroma_offset_l0 {%s}\n"
-		  "delta_luma_weight_l1 %s\n"
-		  "luma_offset_l1 %s\n"
-		  "delta_chroma_weight_l1 {%s}\n"
-		  "chroma_offset_l1 {%s}\n"
-		  "luma_log2_weight_denom %d\n"
-		  "delta_chroma_log2_weight_denom %d\n",
+	TP_printk("delta_luma_weight_l0 = %s, "
+		  "luma_offset_l0 = %s, "
+		  "delta_chroma_weight_l0 = {%s}, "
+		  "chroma_offset_l0 = {%s}, "
+		  "delta_luma_weight_l1 = %s, "
+		  "luma_offset_l1 = %s, "
+		  "delta_chroma_weight_l1 = {%s}, "
+		  "chroma_offset_l1 = {%s}, "
+		  "luma_log2_weight_denom = %d, "
+		  "delta_chroma_log2_weight_denom = %d",
 		  __print_array(__entry->p.delta_luma_weight_l0,
 				ARRAY_SIZE(__entry->p.delta_luma_weight_l0),
 				sizeof(__entry->p.delta_luma_weight_l0[0])),
@@ -959,12 +966,12 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s)),
 	TP_fast_assign(__entry->s = *s),
-	TP_printk("\nscaling_list_4x4 {%s}\n"
-		  "scaling_list_8x8 {%s}\n"
-		  "scaling_list_16x16 {%s}\n"
-		  "scaling_list_32x32 {%s}\n"
-		  "scaling_list_dc_coef_16x16 %s\n"
-		  "scaling_list_dc_coef_32x32 %s\n",
+	TP_printk("scaling_list_4x4 = {%s}, "
+		  "scaling_list_8x8 = {%s}, "
+		  "scaling_list_16x16 = {%s}, "
+		  "scaling_list_32x32 = {%s}, "
+		  "scaling_list_dc_coef_16x16 = %s, "
+		  "scaling_list_dc_coef_32x32 = %s",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->s.scaling_list_4x4,
 				   sizeof(__entry->s.scaling_list_4x4),
@@ -994,17 +1001,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 	TP_ARGS(d),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_decode_params, d)),
 	TP_fast_assign(__entry->d = *d),
-	TP_printk("\npic_order_cnt_val %d\n"
-		  "short_term_ref_pic_set_size %u\n"
-		  "long_term_ref_pic_set_size %u\n"
-		  "num_active_dpb_entries %u\n"
-		  "num_poc_st_curr_before %u\n"
-		  "num_poc_st_curr_after %u\n"
-		  "num_poc_lt_curr %u\n"
-		  "poc_st_curr_before %s\n"
-		  "poc_st_curr_after %s\n"
-		  "poc_lt_curr %s\n"
-		  "flags %s",
+	TP_printk("pic_order_cnt_val = %d, "
+		  "short_term_ref_pic_set_size = %u, "
+		  "long_term_ref_pic_set_size = %u, "
+		  "num_active_dpb_entries = %u, "
+		  "num_poc_st_curr_before = %u, "
+		  "num_poc_st_curr_after = %u, "
+		  "num_poc_lt_curr = %u, "
+		  "poc_st_curr_before = %s, "
+		  "poc_st_curr_after = %s, "
+		  "poc_lt_curr = %s, "
+		  "flags = %s",
 		  __entry->d.pic_order_cnt_val,
 		  __entry->d.short_term_ref_pic_set_size,
 		  __entry->d.long_term_ref_pic_set_size,
@@ -1033,8 +1040,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
 	TP_ARGS(lt),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, lt)),
 	TP_fast_assign(__entry->lt = *lt),
-	TP_printk("\nflags %s\n"
-		  "lt_ref_pic_poc_lsb_sps %x\n",
+	TP_printk("flags = %s, "
+		  "lt_ref_pic_poc_lsb_sps = %x",
 		  __print_flags(__entry->lt.flags, "|",
 		  {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
 		  ),
@@ -1047,16 +1054,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 	TP_ARGS(st),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, st)),
 	TP_fast_assign(__entry->st = *st),
-	TP_printk("\nflags %s\n"
-		  "delta_idx_minus1: %u\n"
-		  "delta_rps_sign: %u\n"
-		  "abs_delta_rps_minus1: %u\n"
-		  "num_negative_pics: %u\n"
-		  "num_positive_pics: %u\n"
-		  "used_by_curr_pic: %08x\n"
-		  "use_delta_flag: %08x\n"
-		  "delta_poc_s0_minus1: %s\n"
-		  "delta_poc_s1_minus1: %s\n",
+	TP_printk("flags = %s, "
+		  "delta_idx_minus1 = %u, "
+		  "delta_rps_sign = %u, "
+		  "abs_delta_rps_minus1 = %u, "
+		  "num_negative_pics = %u, "
+		  "num_positive_pics = %u, "
+		  "used_by_curr_pic = %08x, "
+		  "use_delta_flag = %08x, "
+		  "delta_poc_s0_minus1 = %s, "
+		  "delta_poc_s1_minus1 = %s",
 		  __print_flags(__entry->st.flags, "|",
 		  {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_REF_PIC_SET_PRED"}
 		  ),
@@ -1081,10 +1088,10 @@ DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
 	TP_ARGS(e),
 	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_dpb_entry, e)),
 	TP_fast_assign(__entry->e = *e),
-	TP_printk("\ntimestamp %llu\n"
-		  "flags %s\n"
-		  "field_pic %u\n"
-		  "pic_order_cnt_val %d\n",
+	TP_printk("timestamp = %llu, "
+		  "flags = %s, "
+		  "field_pic = %u, "
+		  "pic_order_cnt_val = %d",
 		__entry->e.timestamp,
 		__print_flags(__entry->e.flags, "|",
 		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE, "LONG_TERM_REFERENCE"}
@@ -1145,8 +1152,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
 	TP_ARGS(s),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
 	TP_fast_assign(__entry->s = *s;),
-	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n"
-		  "profile_and_level_indication %u\nchroma_format %u\nflags %s\n",
+	TP_printk("horizontal_size = %u, vertical_size = %u, vbv_buffer_size = %u, "
+		  "profile_and_level_indication = %u, chroma_format = %u, flags = %s",
 		  __entry->s.horizontal_size,
 		  __entry->s.vertical_size,
 		  __entry->s.vbv_buffer_size,
@@ -1162,8 +1169,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
 	TP_ARGS(p),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
 	TP_fast_assign(__entry->p = *p;),
-	TP_printk("\nbackward_ref_ts %llu\nforward_ref_ts %llu\nflags %s\nf_code {%s}\n"
-		  "picture_coding_type: %u\npicture_structure %u\nintra_dc_precision %u\n",
+	TP_printk("backward_ref_ts = %llu, forward_ref_ts = %llu, flags = %s, f_code = {%s}, "
+		  "picture_coding_type = %u, picture_structure = %u, intra_dc_precision = %u",
 		  __entry->p.backward_ref_ts,
 		  __entry->p.forward_ref_ts,
 		  __print_flags(__entry->p.flags, "|",
@@ -1190,8 +1197,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
 	TP_ARGS(q),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)),
 	TP_fast_assign(__entry->q = *q;),
-	TP_printk("\nintra_quantiser_matrix %s\nnon_intra_quantiser_matrix %s\n"
-		  "chroma_intra_quantiser_matrix %s\nchroma_non_intra_quantiser_matrix %s\n",
+	TP_printk("intra_quantiser_matrix = %s, non_intra_quantiser_matrix = %s, "
+		  "chroma_intra_quantiser_matrix = %s, chroma_non_intra_quantiser_matrix = %s",
 		  __print_array(__entry->q.intra_quantiser_matrix,
 				ARRAY_SIZE(__entry->q.intra_quantiser_matrix),
 				sizeof(__entry->q.intra_quantiser_matrix[0])),
@@ -1229,10 +1236,10 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
 	TP_ARGS(f),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
 	TP_fast_assign(__entry->f = *f;),
-	TP_printk("\nentropy.coeff_probs {%s}\n"
-		  "entropy.y_mode_probs %s\n"
-		  "entropy.uv_mode_probs %s\n"
-		  "entropy.mv_probs {%s}",
+	TP_printk("entropy.coeff_probs = {%s}, "
+		  "entropy.y_mode_probs = %s, "
+		  "entropy.uv_mode_probs = %s, "
+		  "entropy.mv_probs = {%s}",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->f.entropy.coeff_probs,
 				   sizeof(__entry->f.entropy.coeff_probs),
@@ -1255,41 +1262,41 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 	TP_ARGS(f),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
 	TP_fast_assign(__entry->f = *f;),
-	TP_printk("\nsegment.quant_update %s\n"
-		  "segment.lf_update %s\n"
-		  "segment.segment_probs %s\n"
-		  "segment.flags %s\n"
-		  "lf.ref_frm_delta %s\n"
-		  "lf.mb_mode_delta %s\n"
-		  "lf.sharpness_level %u\n"
-		  "lf.level %u\n"
-		  "lf.flags %s\n"
-		  "quant.y_ac_qi %u\n"
-		  "quant.y_dc_delta %d\n"
-		  "quant.y2_dc_delta %d\n"
-		  "quant.y2_ac_delta %d\n"
-		  "quant.uv_dc_delta %d\n"
-		  "quant.uv_ac_delta %d\n"
-		  "coder_state.range %u\n"
-		  "coder_state.value %u\n"
-		  "coder_state.bit_count %u\n"
-		  "width %u\n"
-		  "height %u\n"
-		  "horizontal_scale %u\n"
-		  "vertical_scale %u\n"
-		  "version %u\n"
-		  "prob_skip_false %u\n"
-		  "prob_intra %u\n"
-		  "prob_last %u\n"
-		  "prob_gf %u\n"
-		  "num_dct_parts %u\n"
-		  "first_part_size %u\n"
-		  "first_part_header_bits %u\n"
-		  "dct_part_sizes %s\n"
-		  "last_frame_ts %llu\n"
-		  "golden_frame_ts %llu\n"
-		  "alt_frame_ts %llu\n"
-		  "flags %s",
+	TP_printk("segment.quant_update = %s, "
+		  "segment.lf_update = %s, "
+		  "segment.segment_probs = %s, "
+		  "segment.flags = %s, "
+		  "lf.ref_frm_delta = %s, "
+		  "lf.mb_mode_delta = %s, "
+		  "lf.sharpness_level = %u, "
+		  "lf.level = %u, "
+		  "lf.flags = %s, "
+		  "quant.y_ac_qi = %u, "
+		  "quant.y_dc_delta = %d, "
+		  "quant.y2_dc_delta = %d, "
+		  "quant.y2_ac_delta = %d, "
+		  "quant.uv_dc_delta = %d, "
+		  "quant.uv_ac_delta = %d, "
+		  "coder_state.range = %u, "
+		  "coder_state.value = %u, "
+		  "coder_state.bit_count = %u, "
+		  "width = %u, "
+		  "height = %u, "
+		  "horizontal_scale = %u, "
+		  "vertical_scale = %u, "
+		  "version = %u, "
+		  "prob_skip_false = %u, "
+		  "prob_intra = %u, "
+		  "prob_last = %u, "
+		  "prob_gf = %u, "
+		  "num_dct_parts = %u, "
+		  "first_part_size = %u, "
+		  "first_part_header_bits = %u, "
+		  "dct_part_sizes = %s, "
+		  "last_frame_ts = %llu, "
+		  "golden_frame_ts = %llu, "
+		  "alt_frame_ts = %llu, "
+		  "flags = %s",
 		  __print_array(__entry->f.segment.quant_update,
 				ARRAY_SIZE(__entry->f.segment.quant_update),
 				sizeof(__entry->f.segment.quant_update[0])),
@@ -1370,39 +1377,39 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 	TP_ARGS(f),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
 	TP_fast_assign(__entry->f = *f;),
-	TP_printk("\nlf.ref_deltas %s\n"
-		  "lf.mode_deltas %s\n"
-		  "lf.level %u\n"
-		  "lf.sharpness %u\n"
-		  "lf.flags %s\n"
-		  "quant.base_q_idx %u\n"
-		  "quant.delta_q_y_dc %d\n"
-		  "quant.delta_q_uv_dc %d\n"
-		  "quant.delta_q_uv_ac %d\n"
-		  "seg.feature_data {%s}\n"
-		  "seg.feature_enabled %s\n"
-		  "seg.tree_probs %s\n"
-		  "seg.pred_probs %s\n"
-		  "seg.flags %s\n"
-		  "flags %s\n"
-		  "compressed_header_size %u\n"
-		  "uncompressed_header_size %u\n"
-		  "frame_width_minus_1 %u\n"
-		  "frame_height_minus_1 %u\n"
-		  "render_width_minus_1 %u\n"
-		  "render_height_minus_1 %u\n"
-		  "last_frame_ts %llu\n"
-		  "golden_frame_ts %llu\n"
-		  "alt_frame_ts %llu\n"
-		  "ref_frame_sign_bias %s\n"
-		  "reset_frame_context %s\n"
-		  "frame_context_idx %u\n"
-		  "profile %u\n"
-		  "bit_depth %u\n"
-		  "interpolation_filter %s\n"
-		  "tile_cols_log2 %u\n"
-		  "tile_rows_log_2 %u\n"
-		  "reference_mode %s\n",
+	TP_printk("lf.ref_deltas = %s, "
+		  "lf.mode_deltas = %s, "
+		  "lf.level = %u, "
+		  "lf.sharpness = %u, "
+		  "lf.flags = %s, "
+		  "quant.base_q_idx = %u, "
+		  "quant.delta_q_y_dc = %d, "
+		  "quant.delta_q_uv_dc = %d, "
+		  "quant.delta_q_uv_ac = %d, "
+		  "seg.feature_data = {%s}, "
+		  "seg.feature_enabled = %s, "
+		  "seg.tree_probs = %s, "
+		  "seg.pred_probs = %s, "
+		  "seg.flags = %s, "
+		  "flags = %s, "
+		  "compressed_header_size = %u, "
+		  "uncompressed_header_size = %u, "
+		  "frame_width_minus_1 = %u, "
+		  "frame_height_minus_1 = %u, "
+		  "render_width_minus_1 = %u, "
+		  "render_height_minus_1 = %u, "
+		  "last_frame_ts = %llu, "
+		  "golden_frame_ts = %llu, "
+		  "alt_frame_ts = %llu, "
+		  "ref_frame_sign_bias = %s, "
+		  "reset_frame_context = %s, "
+		  "frame_context_idx = %u, "
+		  "profile = %u, "
+		  "bit_depth = %u, "
+		  "interpolation_filter = %s, "
+		  "tile_cols_log2 = %u, "
+		  "tile_rows_log_2 = %u, "
+		  "reference_mode = %s",
 		  __print_array(__entry->f.lf.ref_deltas,
 				ARRAY_SIZE(__entry->f.lf.ref_deltas),
 				sizeof(__entry->f.lf.ref_deltas[0])),
@@ -1487,20 +1494,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 	TP_ARGS(h),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
 	TP_fast_assign(__entry->h = *h;),
-	TP_printk("\ntx_mode %s\n"
-		  "tx8 {%s}\n"
-		  "tx16 {%s}\n"
-		  "tx32 {%s}\n"
-		  "skip %s\n"
-		  "inter_mode {%s}\n"
-		  "interp_filter {%s}\n"
-		  "is_inter %s\n"
-		  "comp_mode %s\n"
-		  "single_ref {%s}\n"
-		  "comp_ref %s\n"
-		  "y_mode {%s}\n"
-		  "uv_mode {%s}\n"
-		  "partition {%s}\n",
+	TP_printk("tx_mode = %s, "
+		  "tx8 = {%s}, "
+		  "tx16 = {%s}, "
+		  "tx32 = {%s}, "
+		  "skip = %s, "
+		  "inter_mode = {%s}, "
+		  "interp_filter = {%s}, "
+		  "is_inter = %s, "
+		  "comp_mode = %s, "
+		  "single_ref = {%s}, "
+		  "comp_ref = %s, "
+		  "y_mode = {%s}, "
+		  "uv_mode = {%s}, "
+		  "partition = {%s}",
 		  __print_symbolic(__entry->h.tx_mode,
 		  {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
 		  {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
@@ -1563,7 +1570,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
 	TP_ARGS(h),
 	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
 	TP_fast_assign(__entry->h = *h;),
-	TP_printk("\n coef {%s}",
+	TP_printk("coef = {%s}",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->h.coef,
 				   sizeof(__entry->h.coef),
@@ -1576,15 +1583,15 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 	TP_ARGS(p),
 	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
 	TP_fast_assign(__entry->p = *p;),
-	TP_printk("\n joint %s\n"
-		  "sign %s\n"
-		  "classes {%s}\n"
-		  "class0_bit %s\n"
-		  "bits {%s}\n"
-		  "class0_fr {%s}\n"
-		  "fr {%s}\n"
-		  "class0_hp %s\n"
-		  "hp %s\n",
+	TP_printk("joint = %s, "
+		  "sign = %s, "
+		  "classes = {%s}, "
+		  "class0_bit = %s, "
+		  "bits = {%s}, "
+		  "class0_fr = {%s}, "
+		  "fr = {%s}, "
+		  "class0_hp = %s, "
+		  "hp = %s",
 		  __print_array(__entry->p.joint,
 				ARRAY_SIZE(__entry->p.joint),
 				sizeof(__entry->p.joint[0])),
-- 
2.53.0


