Return-Path: <linux-media+bounces-64464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IRHMAnJ4KWpyXQMAu9opvQ
	(envelope-from <linux-media+bounces-64464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:45:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A266A5B0
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:45:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=MQOBgzQn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64464-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64464-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD41134D7F9B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C935425CF0;
	Wed, 10 Jun 2026 14:34:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1495406299;
	Wed, 10 Jun 2026 14:34:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102085; cv=none; b=DCiT6hN+ObzhFQ1M9KM6XotruElZZnSkoYTeO6H0ZVGjMh0ZlxHHmE6iGmXi1EK9Tc+bPTeCOj/aiP1TeC3lcGxYS8ODO4eL1nvzwCGo3+VGvTJYtgIFfoFrc07bFS6AGIcsmM++9wi7xfh77FyWsWK/7UfQ3w/F9n49qc7BIAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102085; c=relaxed/simple;
	bh=L4FL37HVp4D63uAf0bzkJCpituucH5ARXHKt0YRjJXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1GHC3FCx1wIiNdJ+9IrPwdcoDXXyNbhC6RBmzJZTY+2/n6gWXlhRHGKzjOabK1YfZ8s+rlXjdBAai4rdG6mPsXT3QPtKb2MVK4jM9BlA6va1yrpNVdGFfqg/YVWB/5nTnN2z+sUAhsDvy9ujzMB86uFxiqeq6NFGgTYRUIWD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MQOBgzQn; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102053;
	bh=L4FL37HVp4D63uAf0bzkJCpituucH5ARXHKt0YRjJXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MQOBgzQnnCndeETwkLRRTJYrWygE+Ukmj4j/qJ+MUsLIFiORg3p8LX8H3l2EFb5j7
	 GPlw0aq1xmzFu3N9lzncU95RVK7A4jH/fbVHPhX1cHV/5194g83FnBVQIKMIXNXM19
	 G3SqJHrN9niHu/dH14QxqP2PgkpY/4ssUA95Upp6pGeU8Dq70NO6cquBgy5xhn4qCe
	 v6bhe3I5p8GDBRKWuwQ466R1FdLX5Z14p5iPIgHPe0nD4NMrDgNtiJkNly1GqirfYG
	 e+nlsC2DoW5mxtCeW+ZB8uuRVqgVWcc0gRPlpfdDJSr15TB41EPykyUl5j0YRsHOlI
	 3PDyq9zlMvk6w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C474A17E0D7E;
	Wed, 10 Jun 2026 16:34:11 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 10 Jun 2026 10:33:32 -0400
Subject: [PATCH v2 2/9] media: Map each struct field to its own trace field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-v4l2-add-ftrace-v2-2-9756edf72ac1@collabora.com>
References: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
In-Reply-To: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:mchehab@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64464-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E7A266A5B0

The trace events, moved from the visl driver, are simply using the
passed struct pointer to print the event in the trace.

This approach doesn't allow userspace to filter on fields, but also only
exposes the value of the pointer when using libtraceevent, which can't
be used to retrieve the control fields, forcing userspace to parse the
trace output.

To avoid that, list all fields from each passed struct in the trace.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 include/trace/events/v4l2_controls.h | 2171 ++++++++++++++++++++++++----------
 1 file changed, 1522 insertions(+), 649 deletions(-)

diff --git a/include/trace/events/v4l2_controls.h b/include/trace/events/v4l2_controls.h
index 9c74309b31ef..3a9bc75752bf 100644
--- a/include/trace/events/v4l2_controls.h
+++ b/include/trace/events/v4l2_controls.h
@@ -8,15 +8,34 @@
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM v4l2_controls
 
+/* V4L2 controls tracing events.
+ *
+ * These events are used to trace each V4L2 control when they are set by userspace.
+ * They can be identified by the name of the event. All control fields are copied in a TP_STRUCT
+ * field so that they can be filtered separately in userspace.
+ *
+ * Currently only the codec controls are supported.
+ */
+
 /* AV1 controls */
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_sequence, s)),
-	TP_fast_assign(__entry->s = *s;),
+	TP_STRUCT__entry(__field(__u32, flags)
+			 __field(__u8, seq_profile)
+			 __field(__u8, order_hint_bits)
+			 __field(__u8, bit_depth)
+			 __field(__u16, max_frame_width_minus_1)
+			 __field(__u16, max_frame_height_minus_1)),
+	TP_fast_assign(__entry->flags = s->flags;
+		       __entry->seq_profile = s->seq_profile;
+		       __entry->order_hint_bits = s->order_hint_bits;
+		       __entry->bit_depth = s->bit_depth;
+		       __entry->max_frame_width_minus_1 = s->max_frame_width_minus_1;
+		       __entry->max_frame_height_minus_1 = s->max_frame_height_minus_1;),
 	TP_printk("\nflags %s\nseq_profile: %u\norder_hint_bits: %u\nbit_depth: %u\n"
 		  "max_frame_width_minus_1: %u\nmax_frame_height_minus_1: %u\n",
-		  __print_flags(__entry->s.flags, "|",
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
 		  {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK, "USE_128X128_SUPERBLOCK"},
 		  {V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA, "ENABLE_FILTER_INTRA"},
@@ -37,32 +56,176 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
 		  {V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y, "SUBSAMPLING_Y"},
 		  {V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT, "FILM_GRAIN_PARAMS_PRESENT"},
 		  {V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q, "SEPARATE_UV_DELTA_Q"}),
-		  __entry->s.seq_profile,
-		  __entry->s.order_hint_bits,
-		  __entry->s.bit_depth,
-		  __entry->s.max_frame_width_minus_1,
-		  __entry->s.max_frame_height_minus_1
+		  __entry->seq_profile,
+		  __entry->order_hint_bits,
+		  __entry->bit_depth,
+		  __entry->max_frame_width_minus_1,
+		  __entry->max_frame_height_minus_1
 	)
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
 	TP_ARGS(t),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_tile_group_entry, t)),
-	TP_fast_assign(__entry->t = *t;),
+	TP_STRUCT__entry(__field(__u32, tile_offset)
+			 __field(__u32, tile_size)
+			 __field(__u32, tile_row)
+			 __field(__u32, tile_col)),
+	TP_fast_assign(__entry->tile_offset = t->tile_offset;
+		       __entry->tile_size = t->tile_size;
+		       __entry->tile_row = t->tile_row;
+		       __entry->tile_col = t->tile_col;),
 	TP_printk("\ntile_offset: %u\n tile_size: %u\n tile_row: %u\ntile_col: %u\n",
-		  __entry->t.tile_offset,
-		  __entry->t.tile_size,
-		  __entry->t.tile_row,
-		  __entry->t.tile_col
+		  __entry->tile_offset,
+		  __entry->tile_size,
+		  __entry->tile_row,
+		  __entry->tile_col
 	)
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
 	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
+	TP_STRUCT__entry(__field(u8, tile_info_flags)
+			 __field(u8, tile_info_context_update_tile_id)
+			 __field(u8, tile_info_tile_cols)
+			 __field(u8, tile_info_tile_rows)
+			 __array(u32, tile_info_mi_col_starts, V4L2_AV1_MAX_TILE_COLS + 1)
+			 __array(u32, tile_info_mi_row_starts, V4L2_AV1_MAX_TILE_ROWS + 1)
+			 __array(u32, tile_info_width_in_sbs_minus_1, V4L2_AV1_MAX_TILE_COLS)
+			 __array(u32, tile_info_height_in_sbs_minus_1, V4L2_AV1_MAX_TILE_ROWS)
+			 __field(u8, tile_info_tile_size_bytes)
+			 __field(u8, quantization_flags)
+			 __field(u8, quantization_base_q_idx)
+			 __field(s8, quantization_delta_q_y_dc)
+			 __field(s8, quantization_delta_q_u_dc)
+			 __field(s8, quantization_delta_q_u_ac)
+			 __field(s8, quantization_delta_q_v_dc)
+			 __field(s8, quantization_delta_q_v_ac)
+			 __field(u8, quantization_qm_y)
+			 __field(u8, quantization_qm_u)
+			 __field(u8, quantization_qm_v)
+			 __field(u8, quantization_delta_q_res)
+			 __field(u8, superres_denom)
+			 __field(u8, segmentation_flags)
+			 __field(u8, segmentation_last_active_seg_id)
+			 __array(u8, segmentation_feature_enabled, V4L2_AV1_MAX_SEGMENTS)
+			 __field(u8, loop_filter_flags)
+			 __array(u8, loop_filter_level, 4)
+			 __field(u8, loop_filter_sharpness)
+			 __array(s8, loop_filter_ref_deltas, V4L2_AV1_TOTAL_REFS_PER_FRAME)
+			 __array(s8, loop_filter_mode_deltas, 2)
+			 __field(u8, loop_filter_delta_lf_res)
+			 __field(u8, cdef_damping_minus_3)
+			 __field(u8, cdef_bits)
+			 __array(u8, cdef_y_pri_strength, V4L2_AV1_CDEF_MAX)
+			 __array(u8, cdef_y_sec_strength, V4L2_AV1_CDEF_MAX)
+			 __array(u8, cdef_uv_pri_strength, V4L2_AV1_CDEF_MAX)
+			 __array(u8, cdef_uv_sec_strength, V4L2_AV1_CDEF_MAX)
+			 __array(u8, skip_mode_frame, 2)
+			 __field(u8, primary_ref_frame)
+			 __field(u8, loop_restoration_flags)
+			 __field(u8, loop_restoration_lr_unit_shift)
+			 __field(u8, loop_restoration_lr_uv_shift)
+			 __array(int,
+				 loop_restoration_frame_restoration_type, V4L2_AV1_NUM_PLANES_MAX)
+			 __array(u32,
+				 loop_restoration_loop_restoration_size, V4L2_AV1_MAX_NUM_PLANES)
+			 __field(u32, flags)
+			 __field(u32, order_hint)
+			 __field(u32, upscaled_width)
+			 __field(u32, frame_width_minus_1)
+			 __field(u32, frame_height_minus_1)
+			 __field(u16, render_width_minus_1)
+			 __field(u16, render_height_minus_1)
+			 __field(u32, current_frame_id)
+			 __array(u32, buffer_removal_time, V4L2_AV1_MAX_OPERATING_POINTS)
+			 __array(u32, order_hints, V4L2_AV1_TOTAL_REFS_PER_FRAME)
+			 __array(u64, reference_frame_ts, V4L2_AV1_TOTAL_REFS_PER_FRAME)
+			 __array(s8, ref_frame_idx, V4L2_AV1_REFS_PER_FRAME)
+			 __field(u8, refresh_frame_flags)),
+	TP_fast_assign(__entry->tile_info_flags = f->tile_info.flags;
+		       __entry->tile_info_context_update_tile_id =
+				f->tile_info.context_update_tile_id;
+		       __entry->tile_info_tile_cols = f->tile_info.tile_cols;
+		       __entry->tile_info_tile_rows = f->tile_info.tile_rows;
+		       memcpy(__entry->tile_info_mi_col_starts, f->tile_info.mi_col_starts,
+			      sizeof(__entry->tile_info_mi_col_starts));
+		       memcpy(__entry->tile_info_mi_row_starts, f->tile_info.mi_row_starts,
+			      sizeof(__entry->tile_info_mi_row_starts));
+		       memcpy(__entry->tile_info_width_in_sbs_minus_1,
+			      f->tile_info.width_in_sbs_minus_1,
+			      sizeof(__entry->tile_info_width_in_sbs_minus_1));
+		       memcpy(__entry->tile_info_height_in_sbs_minus_1,
+			      f->tile_info.height_in_sbs_minus_1,
+			      sizeof(__entry->tile_info_height_in_sbs_minus_1));
+		       __entry->tile_info_tile_size_bytes = f->tile_info.tile_size_bytes;
+		       __entry->quantization_flags = f->quantization.flags;
+		       __entry->quantization_base_q_idx = f->quantization.base_q_idx;
+		       __entry->quantization_delta_q_y_dc = f->quantization.delta_q_y_dc;
+		       __entry->quantization_delta_q_u_dc = f->quantization.delta_q_u_dc;
+		       __entry->quantization_delta_q_u_ac = f->quantization.delta_q_u_ac;
+		       __entry->quantization_delta_q_v_dc = f->quantization.delta_q_v_dc;
+		       __entry->quantization_delta_q_v_ac = f->quantization.delta_q_v_ac;
+		       __entry->quantization_qm_y = f->quantization.qm_y;
+		       __entry->quantization_qm_u = f->quantization.qm_u;
+		       __entry->quantization_qm_v = f->quantization.qm_v;
+		       __entry->quantization_delta_q_res = f->quantization.delta_q_res;
+		       __entry->superres_denom = f->superres_denom;
+		       __entry->segmentation_flags = f->segmentation.flags;
+		       __entry->segmentation_last_active_seg_id =
+				f->segmentation.last_active_seg_id;
+		       memcpy(__entry->segmentation_feature_enabled,
+			      f->segmentation.feature_enabled,
+			      sizeof(__entry->segmentation_feature_enabled));
+		       __entry->loop_filter_flags = f->loop_filter.flags;
+		       memcpy(__entry->loop_filter_level, f->loop_filter.level,
+			      sizeof(__entry->loop_filter_level));
+		       __entry->loop_filter_sharpness = f->loop_filter.sharpness;
+		       memcpy(__entry->loop_filter_ref_deltas, f->loop_filter.ref_deltas,
+			      sizeof(__entry->loop_filter_ref_deltas));
+		       memcpy(__entry->loop_filter_mode_deltas, f->loop_filter.mode_deltas,
+			      sizeof(__entry->loop_filter_mode_deltas));
+		       __entry->loop_filter_delta_lf_res = f->loop_filter.delta_lf_res;
+		       __entry->cdef_damping_minus_3 = f->cdef.damping_minus_3;
+		       __entry->cdef_bits = f->cdef.bits;
+		       memcpy(__entry->cdef_y_pri_strength, f->cdef.y_pri_strength,
+			      sizeof(__entry->cdef_y_pri_strength));
+		       memcpy(__entry->cdef_y_sec_strength, f->cdef.y_sec_strength,
+			      sizeof(__entry->cdef_y_sec_strength));
+		       memcpy(__entry->cdef_uv_pri_strength, f->cdef.uv_pri_strength,
+			      sizeof(__entry->cdef_uv_pri_strength));
+		       memcpy(__entry->cdef_uv_sec_strength, f->cdef.uv_sec_strength,
+			      sizeof(__entry->cdef_uv_sec_strength));
+		       memcpy(__entry->skip_mode_frame, f->skip_mode_frame,
+			      sizeof(__entry->skip_mode_frame));
+		       __entry->primary_ref_frame = f->primary_ref_frame;
+		       __entry->loop_restoration_flags = f->loop_restoration.flags;
+		       __entry->loop_restoration_lr_unit_shift = f->loop_restoration.lr_unit_shift;
+		       __entry->loop_restoration_lr_uv_shift = f->loop_restoration.lr_uv_shift;
+		       memcpy(__entry->loop_restoration_frame_restoration_type,
+			      f->loop_restoration.frame_restoration_type,
+			      sizeof(__entry->loop_restoration_frame_restoration_type));
+		       memcpy(__entry->loop_restoration_loop_restoration_size,
+			      f->loop_restoration.loop_restoration_size,
+			      sizeof(__entry->loop_restoration_loop_restoration_size));
+		       __entry->flags = f->flags;
+		       __entry->order_hint = f->order_hint;
+		       __entry->upscaled_width = f->upscaled_width;
+		       __entry->frame_width_minus_1 = f->frame_width_minus_1;
+		       __entry->frame_height_minus_1 = f->frame_height_minus_1;
+		       __entry->render_width_minus_1 = f->render_width_minus_1;
+		       __entry->render_height_minus_1 = f->render_height_minus_1;
+		       __entry->current_frame_id = f->current_frame_id;
+		       memcpy(__entry->buffer_removal_time, f->buffer_removal_time,
+			      sizeof(__entry->buffer_removal_time));
+		       memcpy(__entry->order_hints, f->order_hints,
+			      sizeof(__entry->order_hints));
+		       memcpy(__entry->reference_frame_ts, f->reference_frame_ts,
+			      sizeof(__entry->reference_frame_ts));
+		       memcpy(__entry->ref_frame_idx, f->ref_frame_idx,
+			      sizeof(__entry->ref_frame_idx));
+		       __entry->refresh_frame_flags = f->refresh_frame_flags;),
 	TP_printk("\ntile_info.flags: %s\ntile_info.context_update_tile_id: %u\n"
 		  "tile_info.tile_cols: %u\ntile_info.tile_rows: %u\n"
 		  "tile_info.mi_col_starts: %s\ntile_info.mi_row_starts: %s\n"
@@ -87,95 +250,95 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 		  "render_width_minus_1: %u\nrender_height_minus_1: %u\ncurrent_frame_id: %u\n"
 		  "buffer_removal_time: %s\norder_hints: %s\nreference_frame_ts: %s\n"
 		  "ref_frame_idx: %s\nrefresh_frame_flags: %u\n",
-		  __print_flags(__entry->f.tile_info.flags, "|",
+		  __print_flags(__entry->tile_info_flags, "|",
 		  {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING, "UNIFORM_TILE_SPACING"}),
-		  __entry->f.tile_info.context_update_tile_id,
-		  __entry->f.tile_info.tile_cols,
-		  __entry->f.tile_info.tile_rows,
-		  __print_array(__entry->f.tile_info.mi_col_starts,
-				ARRAY_SIZE(__entry->f.tile_info.mi_col_starts),
-				sizeof(__entry->f.tile_info.mi_col_starts[0])),
-		  __print_array(__entry->f.tile_info.mi_row_starts,
-				ARRAY_SIZE(__entry->f.tile_info.mi_row_starts),
-				sizeof(__entry->f.tile_info.mi_row_starts[0])),
-		  __print_array(__entry->f.tile_info.width_in_sbs_minus_1,
-				ARRAY_SIZE(__entry->f.tile_info.width_in_sbs_minus_1),
-				sizeof(__entry->f.tile_info.width_in_sbs_minus_1[0])),
-		  __print_array(__entry->f.tile_info.height_in_sbs_minus_1,
-				ARRAY_SIZE(__entry->f.tile_info.height_in_sbs_minus_1),
-				sizeof(__entry->f.tile_info.height_in_sbs_minus_1[0])),
-		  __entry->f.tile_info.tile_size_bytes,
-		  __print_flags(__entry->f.quantization.flags, "|",
+		  __entry->tile_info_context_update_tile_id,
+		  __entry->tile_info_tile_cols,
+		  __entry->tile_info_tile_rows,
+		  __print_array(__entry->tile_info_mi_col_starts,
+				ARRAY_SIZE(__entry->tile_info_mi_col_starts),
+				sizeof(__entry->tile_info_mi_col_starts[0])),
+		  __print_array(__entry->tile_info_mi_row_starts,
+				ARRAY_SIZE(__entry->tile_info_mi_row_starts),
+				sizeof(__entry->tile_info_mi_row_starts[0])),
+		  __print_array(__entry->tile_info_width_in_sbs_minus_1,
+				ARRAY_SIZE(__entry->tile_info_width_in_sbs_minus_1),
+				sizeof(__entry->tile_info_width_in_sbs_minus_1[0])),
+		  __print_array(__entry->tile_info_height_in_sbs_minus_1,
+				ARRAY_SIZE(__entry->tile_info_height_in_sbs_minus_1),
+				sizeof(__entry->tile_info_height_in_sbs_minus_1[0])),
+		  __entry->tile_info_tile_size_bytes,
+		  __print_flags(__entry->quantization_flags, "|",
 		  {V4L2_AV1_QUANTIZATION_FLAG_DIFF_UV_DELTA, "DIFF_UV_DELTA"},
 		  {V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX, "USING_QMATRIX"},
 		  {V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT, "DELTA_Q_PRESENT"}),
-		  __entry->f.quantization.base_q_idx,
-		  __entry->f.quantization.delta_q_y_dc,
-		  __entry->f.quantization.delta_q_u_dc,
-		  __entry->f.quantization.delta_q_u_ac,
-		  __entry->f.quantization.delta_q_v_dc,
-		  __entry->f.quantization.delta_q_v_ac,
-		  __entry->f.quantization.qm_y,
-		  __entry->f.quantization.qm_u,
-		  __entry->f.quantization.qm_v,
-		  __entry->f.quantization.delta_q_res,
-		  __entry->f.superres_denom,
-		  __print_flags(__entry->f.segmentation.flags, "|",
+		  __entry->quantization_base_q_idx,
+		  __entry->quantization_delta_q_y_dc,
+		  __entry->quantization_delta_q_u_dc,
+		  __entry->quantization_delta_q_u_ac,
+		  __entry->quantization_delta_q_v_dc,
+		  __entry->quantization_delta_q_v_ac,
+		  __entry->quantization_qm_y,
+		  __entry->quantization_qm_u,
+		  __entry->quantization_qm_v,
+		  __entry->quantization_delta_q_res,
+		  __entry->superres_denom,
+		  __print_flags(__entry->segmentation_flags, "|",
 		  {V4L2_AV1_SEGMENTATION_FLAG_ENABLED, "ENABLED"},
 		  {V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP, "UPDATE_MAP"},
 		  {V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE, "TEMPORAL_UPDATE"},
 		  {V4L2_AV1_SEGMENTATION_FLAG_UPDATE_DATA, "UPDATE_DATA"},
 		  {V4L2_AV1_SEGMENTATION_FLAG_SEG_ID_PRE_SKIP, "SEG_ID_PRE_SKIP"}),
-		  __entry->f.segmentation.last_active_seg_id,
-		  __print_array(__entry->f.segmentation.feature_enabled,
-				ARRAY_SIZE(__entry->f.segmentation.feature_enabled),
-				sizeof(__entry->f.segmentation.feature_enabled[0])),
-		  __print_flags(__entry->f.loop_filter.flags, "|",
+		  __entry->segmentation_last_active_seg_id,
+		  __print_array(__entry->segmentation_feature_enabled,
+				ARRAY_SIZE(__entry->segmentation_feature_enabled),
+				sizeof(__entry->segmentation_feature_enabled[0])),
+		  __print_flags(__entry->loop_filter_flags, "|",
 		  {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED, "DELTA_ENABLED"},
 		  {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_UPDATE, "DELTA_UPDATE"},
 		  {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT, "DELTA_LF_PRESENT"},
 		  {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI, "DELTA_LF_MULTI"}),
-		  __print_array(__entry->f.loop_filter.level,
-				ARRAY_SIZE(__entry->f.loop_filter.level),
-				sizeof(__entry->f.loop_filter.level[0])),
-		  __entry->f.loop_filter.sharpness,
-		  __print_array(__entry->f.loop_filter.ref_deltas,
-				ARRAY_SIZE(__entry->f.loop_filter.ref_deltas),
-				sizeof(__entry->f.loop_filter.ref_deltas[0])),
-		  __print_array(__entry->f.loop_filter.mode_deltas,
-				ARRAY_SIZE(__entry->f.loop_filter.mode_deltas),
-				sizeof(__entry->f.loop_filter.mode_deltas[0])),
-		  __entry->f.loop_filter.delta_lf_res,
-		  __entry->f.cdef.damping_minus_3,
-		  __entry->f.cdef.bits,
-		  __print_array(__entry->f.cdef.y_pri_strength,
-				ARRAY_SIZE(__entry->f.cdef.y_pri_strength),
-				sizeof(__entry->f.cdef.y_pri_strength[0])),
-		  __print_array(__entry->f.cdef.y_sec_strength,
-				ARRAY_SIZE(__entry->f.cdef.y_sec_strength),
-				sizeof(__entry->f.cdef.y_sec_strength[0])),
-		  __print_array(__entry->f.cdef.uv_pri_strength,
-				ARRAY_SIZE(__entry->f.cdef.uv_pri_strength),
-				sizeof(__entry->f.cdef.uv_pri_strength[0])),
-		  __print_array(__entry->f.cdef.uv_sec_strength,
-				ARRAY_SIZE(__entry->f.cdef.uv_sec_strength),
-				sizeof(__entry->f.cdef.uv_sec_strength[0])),
-		  __print_array(__entry->f.skip_mode_frame,
-				ARRAY_SIZE(__entry->f.skip_mode_frame),
-				sizeof(__entry->f.skip_mode_frame[0])),
-		  __entry->f.primary_ref_frame,
-		  __print_flags(__entry->f.loop_restoration.flags, "|",
+		  __print_array(__entry->loop_filter_level,
+				ARRAY_SIZE(__entry->loop_filter_level),
+				sizeof(__entry->loop_filter_level[0])),
+		  __entry->loop_filter_sharpness,
+		  __print_array(__entry->loop_filter_ref_deltas,
+				ARRAY_SIZE(__entry->loop_filter_ref_deltas),
+				sizeof(__entry->loop_filter_ref_deltas[0])),
+		  __print_array(__entry->loop_filter_mode_deltas,
+				ARRAY_SIZE(__entry->loop_filter_mode_deltas),
+				sizeof(__entry->loop_filter_mode_deltas[0])),
+		  __entry->loop_filter_delta_lf_res,
+		  __entry->cdef_damping_minus_3,
+		  __entry->cdef_bits,
+		  __print_array(__entry->cdef_y_pri_strength,
+				ARRAY_SIZE(__entry->cdef_y_pri_strength),
+				sizeof(__entry->cdef_y_pri_strength[0])),
+		  __print_array(__entry->cdef_y_sec_strength,
+				ARRAY_SIZE(__entry->cdef_y_sec_strength),
+				sizeof(__entry->cdef_y_sec_strength[0])),
+		  __print_array(__entry->cdef_uv_pri_strength,
+				ARRAY_SIZE(__entry->cdef_uv_pri_strength),
+				sizeof(__entry->cdef_uv_pri_strength[0])),
+		  __print_array(__entry->cdef_uv_sec_strength,
+				ARRAY_SIZE(__entry->cdef_uv_sec_strength),
+				sizeof(__entry->cdef_uv_sec_strength[0])),
+		  __print_array(__entry->skip_mode_frame,
+				ARRAY_SIZE(__entry->skip_mode_frame),
+				sizeof(__entry->skip_mode_frame[0])),
+		  __entry->primary_ref_frame,
+		  __print_flags(__entry->loop_restoration_flags, "|",
 		  {V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR, "USES_LR"},
 		  {V4L2_AV1_LOOP_RESTORATION_FLAG_USES_CHROMA_LR, "USES_CHROMA_LR"}),
-		  __entry->f.loop_restoration.lr_unit_shift,
-		  __entry->f.loop_restoration.lr_uv_shift,
-		  __print_array(__entry->f.loop_restoration.frame_restoration_type,
-				ARRAY_SIZE(__entry->f.loop_restoration.frame_restoration_type),
-				sizeof(__entry->f.loop_restoration.frame_restoration_type[0])),
-		  __print_array(__entry->f.loop_restoration.loop_restoration_size,
-				ARRAY_SIZE(__entry->f.loop_restoration.loop_restoration_size),
-				sizeof(__entry->f.loop_restoration.loop_restoration_size[0])),
-		  __print_flags(__entry->f.flags, "|",
+		  __entry->loop_restoration_lr_unit_shift,
+		  __entry->loop_restoration_lr_uv_shift,
+		  __print_array(__entry->loop_restoration_frame_restoration_type,
+				ARRAY_SIZE(__entry->loop_restoration_frame_restoration_type),
+				sizeof(__entry->loop_restoration_frame_restoration_type[0])),
+		  __print_array(__entry->loop_restoration_loop_restoration_size,
+				ARRAY_SIZE(__entry->loop_restoration_loop_restoration_size),
+				sizeof(__entry->loop_restoration_loop_restoration_size[0])),
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_AV1_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
 		  {V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME, "SHOWABLE_FRAME"},
 		  {V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE, "ERROR_RESILIENT_MODE"},
@@ -197,26 +360,26 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 		  {V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE, "FRAME_SIZE_OVERRIDE"},
 		  {V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT, "BUFFER_REMOVAL_TIME_PRESENT"},
 		  {V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING, "FRAME_REFS_SHORT_SIGNALING"}),
-		  __entry->f.order_hint,
-		  __entry->f.upscaled_width,
-		  __entry->f.frame_width_minus_1,
-		  __entry->f.frame_height_minus_1,
-		  __entry->f.render_width_minus_1,
-		  __entry->f.render_height_minus_1,
-		  __entry->f.current_frame_id,
-		  __print_array(__entry->f.buffer_removal_time,
-				ARRAY_SIZE(__entry->f.buffer_removal_time),
-				sizeof(__entry->f.buffer_removal_time[0])),
-		  __print_array(__entry->f.order_hints,
-				ARRAY_SIZE(__entry->f.order_hints),
-				sizeof(__entry->f.order_hints[0])),
-		  __print_array(__entry->f.reference_frame_ts,
-				ARRAY_SIZE(__entry->f.reference_frame_ts),
-				sizeof(__entry->f.reference_frame_ts[0])),
-		  __print_array(__entry->f.ref_frame_idx,
-				ARRAY_SIZE(__entry->f.ref_frame_idx),
-				sizeof(__entry->f.ref_frame_idx[0])),
-		  __entry->f.refresh_frame_flags
+		  __entry->order_hint,
+		  __entry->upscaled_width,
+		  __entry->frame_width_minus_1,
+		  __entry->frame_height_minus_1,
+		  __entry->render_width_minus_1,
+		  __entry->render_height_minus_1,
+		  __entry->current_frame_id,
+		  __print_array(__entry->buffer_removal_time,
+				ARRAY_SIZE(__entry->buffer_removal_time),
+				sizeof(__entry->buffer_removal_time[0])),
+		  __print_array(__entry->order_hints,
+				ARRAY_SIZE(__entry->order_hints),
+				sizeof(__entry->order_hints[0])),
+		  __print_array(__entry->reference_frame_ts,
+				ARRAY_SIZE(__entry->reference_frame_ts),
+				sizeof(__entry->reference_frame_ts[0])),
+		  __print_array(__entry->ref_frame_idx,
+				ARRAY_SIZE(__entry->ref_frame_idx),
+				sizeof(__entry->ref_frame_idx[0])),
+		  __entry->refresh_frame_flags
 	)
 );
 
@@ -224,8 +387,65 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
 	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_film_grain, f)),
-	TP_fast_assign(__entry->f = *f;),
+	TP_STRUCT__entry(__field(__u8, flags)
+			 __field(__u8, cr_mult)
+			 __field(__u16, grain_seed)
+			 __field(__u8, film_grain_params_ref_idx)
+			 __field(__u8, num_y_points)
+			 __array(__u8, point_y_value, V4L2_AV1_MAX_NUM_Y_POINTS)
+			 __array(__u8, point_y_scaling, V4L2_AV1_MAX_NUM_Y_POINTS)
+			 __field(__u8, num_cb_points)
+			 __array(__u8, point_cb_value, V4L2_AV1_MAX_NUM_CB_POINTS)
+			 __array(__u8, point_cb_scaling, V4L2_AV1_MAX_NUM_CB_POINTS)
+			 __field(__u8, num_cr_points)
+			 __array(__u8, point_cr_value, V4L2_AV1_MAX_NUM_CR_POINTS)
+			 __array(__u8, point_cr_scaling, V4L2_AV1_MAX_NUM_CR_POINTS)
+			 __field(__u8, grain_scaling_minus_8)
+			 __field(__u8, ar_coeff_lag)
+			 __array(__u8, ar_coeffs_y_plus_128, V4L2_AV1_AR_COEFFS_SIZE)
+			 __array(__u8, ar_coeffs_cb_plus_128, V4L2_AV1_AR_COEFFS_SIZE)
+			 __array(__u8, ar_coeffs_cr_plus_128, V4L2_AV1_AR_COEFFS_SIZE)
+			 __field(__u8, ar_coeff_shift_minus_6)
+			 __field(__u8, grain_scale_shift)
+			 __field(__u8, cb_mult)
+			 __field(__u8, cb_luma_mult)
+			 __field(__u8, cr_luma_mult)
+			 __field(__u16, cb_offset)
+			 __field(__u16, cr_offset)),
+	TP_fast_assign(__entry->flags = f->flags;
+		       __entry->cr_mult = f->cr_mult;
+		       __entry->grain_seed = f->grain_seed;
+		       __entry->film_grain_params_ref_idx = f->film_grain_params_ref_idx;
+		       __entry->num_y_points = f->num_y_points;
+		       memcpy(__entry->point_y_value, f->point_y_value,
+			      sizeof(__entry->point_y_value));
+		       memcpy(__entry->point_y_scaling, f->point_y_scaling,
+			      sizeof(__entry->point_y_scaling));
+		       __entry->num_cb_points = f->num_cb_points;
+		       memcpy(__entry->point_cb_value, f->point_cb_value,
+			      sizeof(__entry->point_cb_value));
+		       memcpy(__entry->point_cb_scaling, f->point_cb_scaling,
+			      sizeof(__entry->point_cb_scaling));
+		       __entry->num_cr_points = f->num_cr_points;
+		       memcpy(__entry->point_cr_value, f->point_cr_value,
+			      sizeof(__entry->point_cr_value));
+		       memcpy(__entry->point_cr_scaling, f->point_cr_scaling,
+			      sizeof(__entry->point_cr_scaling));
+		       __entry->grain_scaling_minus_8 = f->grain_scaling_minus_8;
+		       __entry->ar_coeff_lag = f->ar_coeff_lag;
+		       memcpy(__entry->ar_coeffs_y_plus_128, f->ar_coeffs_y_plus_128,
+			      sizeof(__entry->ar_coeffs_y_plus_128));
+		       memcpy(__entry->ar_coeffs_cb_plus_128, f->ar_coeffs_cb_plus_128,
+			      sizeof(__entry->ar_coeffs_cb_plus_128));
+		       memcpy(__entry->ar_coeffs_cr_plus_128, f->ar_coeffs_cr_plus_128,
+			      sizeof(__entry->ar_coeffs_cr_plus_128));
+		       __entry->ar_coeff_shift_minus_6 = f->ar_coeff_shift_minus_6;
+		       __entry->grain_scale_shift = f->grain_scale_shift;
+		       __entry->cb_mult = f->cb_mult;
+		       __entry->cb_luma_mult = f->cb_luma_mult;
+		       __entry->cr_luma_mult = f->cr_luma_mult;
+		       __entry->cb_offset = f->cb_offset;
+		       __entry->cr_offset = f->cr_offset;),
 	TP_printk("\nflags %s\ncr_mult: %u\ngrain_seed: %u\n"
 		  "film_grain_params_ref_idx: %u\nnum_y_points: %u\npoint_y_value: %s\n"
 		  "point_y_scaling: %s\nnum_cb_points: %u\npoint_cb_value: %s\n"
@@ -235,54 +455,54 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 		  "ar_coeffs_cr_plus_128: %s\nar_coeff_shift_minus_6: %u\n"
 		  "grain_scale_shift: %u\ncb_mult: %u\ncb_luma_mult: %u\ncr_luma_mult: %u\n"
 		  "cb_offset: %u\ncr_offset: %u\n",
-		  __print_flags(__entry->f.flags, "|",
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
 		  {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
 		  {V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA, "CHROMA_SCALING_FROM_LUMA"},
 		  {V4L2_AV1_FILM_GRAIN_FLAG_OVERLAP, "OVERLAP"},
 		  {V4L2_AV1_FILM_GRAIN_FLAG_CLIP_TO_RESTRICTED_RANGE, "CLIP_TO_RESTRICTED_RANGE"}),
-		  __entry->f.cr_mult,
-		  __entry->f.grain_seed,
-		  __entry->f.film_grain_params_ref_idx,
-		  __entry->f.num_y_points,
-		  __print_array(__entry->f.point_y_value,
-				ARRAY_SIZE(__entry->f.point_y_value),
-				sizeof(__entry->f.point_y_value[0])),
-		  __print_array(__entry->f.point_y_scaling,
-				ARRAY_SIZE(__entry->f.point_y_scaling),
-				sizeof(__entry->f.point_y_scaling[0])),
-		  __entry->f.num_cb_points,
-		  __print_array(__entry->f.point_cb_value,
-				ARRAY_SIZE(__entry->f.point_cb_value),
-				sizeof(__entry->f.point_cb_value[0])),
-		  __print_array(__entry->f.point_cb_scaling,
-				ARRAY_SIZE(__entry->f.point_cb_scaling),
-				sizeof(__entry->f.point_cb_scaling[0])),
-		  __entry->f.num_cr_points,
-		  __print_array(__entry->f.point_cr_value,
-				ARRAY_SIZE(__entry->f.point_cr_value),
-				sizeof(__entry->f.point_cr_value[0])),
-		  __print_array(__entry->f.point_cr_scaling,
-				ARRAY_SIZE(__entry->f.point_cr_scaling),
-				sizeof(__entry->f.point_cr_scaling[0])),
-		  __entry->f.grain_scaling_minus_8,
-		  __entry->f.ar_coeff_lag,
-		  __print_array(__entry->f.ar_coeffs_y_plus_128,
-				ARRAY_SIZE(__entry->f.ar_coeffs_y_plus_128),
-				sizeof(__entry->f.ar_coeffs_y_plus_128[0])),
-		  __print_array(__entry->f.ar_coeffs_cb_plus_128,
-				ARRAY_SIZE(__entry->f.ar_coeffs_cb_plus_128),
-				sizeof(__entry->f.ar_coeffs_cb_plus_128[0])),
-		  __print_array(__entry->f.ar_coeffs_cr_plus_128,
-				ARRAY_SIZE(__entry->f.ar_coeffs_cr_plus_128),
-				sizeof(__entry->f.ar_coeffs_cr_plus_128[0])),
-		  __entry->f.ar_coeff_shift_minus_6,
-		  __entry->f.grain_scale_shift,
-		  __entry->f.cb_mult,
-		  __entry->f.cb_luma_mult,
-		  __entry->f.cr_luma_mult,
-		  __entry->f.cb_offset,
-		  __entry->f.cr_offset
+		  __entry->cr_mult,
+		  __entry->grain_seed,
+		  __entry->film_grain_params_ref_idx,
+		  __entry->num_y_points,
+		  __print_array(__entry->point_y_value,
+				ARRAY_SIZE(__entry->point_y_value),
+				sizeof(__entry->point_y_value[0])),
+		  __print_array(__entry->point_y_scaling,
+				ARRAY_SIZE(__entry->point_y_scaling),
+				sizeof(__entry->point_y_scaling[0])),
+		  __entry->num_cb_points,
+		  __print_array(__entry->point_cb_value,
+				ARRAY_SIZE(__entry->point_cb_value),
+				sizeof(__entry->point_cb_value[0])),
+		  __print_array(__entry->point_cb_scaling,
+				ARRAY_SIZE(__entry->point_cb_scaling),
+				sizeof(__entry->point_cb_scaling[0])),
+		  __entry->num_cr_points,
+		  __print_array(__entry->point_cr_value,
+				ARRAY_SIZE(__entry->point_cr_value),
+				sizeof(__entry->point_cr_value[0])),
+		  __print_array(__entry->point_cr_scaling,
+				ARRAY_SIZE(__entry->point_cr_scaling),
+				sizeof(__entry->point_cr_scaling[0])),
+		  __entry->grain_scaling_minus_8,
+		  __entry->ar_coeff_lag,
+		  __print_array(__entry->ar_coeffs_y_plus_128,
+				ARRAY_SIZE(__entry->ar_coeffs_y_plus_128),
+				sizeof(__entry->ar_coeffs_y_plus_128[0])),
+		  __print_array(__entry->ar_coeffs_cb_plus_128,
+				ARRAY_SIZE(__entry->ar_coeffs_cb_plus_128),
+				sizeof(__entry->ar_coeffs_cb_plus_128[0])),
+		  __print_array(__entry->ar_coeffs_cr_plus_128,
+				ARRAY_SIZE(__entry->ar_coeffs_cr_plus_128),
+				sizeof(__entry->ar_coeffs_cr_plus_128[0])),
+		  __entry->ar_coeff_shift_minus_6,
+		  __entry->grain_scale_shift,
+		  __entry->cb_mult,
+		  __entry->cb_luma_mult,
+		  __entry->cr_luma_mult,
+		  __entry->cb_offset,
+		  __entry->cr_offset
 	)
 )
 
@@ -333,7 +553,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 		       __entry->ycbcr_enc = p->ycbcr_enc;
 		       __entry->quantization = p->quantization;
 		       ),
-	TP_printk("backward_ref_ts %llu version %u width %u height %u flags %s colorspace %u xfer_func %u ycbcr_enc %u quantization %u",
+	TP_printk("backward_ref_ts %llu version %u width %u height %u flags %s colorspace %u "
+		  "xfer_func %u ycbcr_enc %u quantization %u",
 		  __entry->backward_ref_ts, __entry->version, __entry->width, __entry->height,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
@@ -362,8 +583,45 @@ DEFINE_EVENT(v4l2_ctrl_fwht_params_tmpl, v4l2_ctrl_fwht_params,
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
-	TP_fast_assign(__entry->s = *s),
+	TP_STRUCT__entry(__field(u8, profile_idc)
+			 __field(u8, constraint_set_flags)
+			 __field(u8, level_idc)
+			 __field(u8, seq_parameter_set_id)
+			 __field(u8, chroma_format_idc)
+			 __field(u8, bit_depth_luma_minus8)
+			 __field(u8, bit_depth_chroma_minus8)
+			 __field(u8, log2_max_frame_num_minus4)
+			 __field(u8, pic_order_cnt_type)
+			 __field(u8, log2_max_pic_order_cnt_lsb_minus4)
+			 __field(u8, max_num_ref_frames)
+			 __field(u8, num_ref_frames_in_pic_order_cnt_cycle)
+			 __array(__s32, offset_for_ref_frame, 255)
+			 __field(__s32, offset_for_non_ref_pic)
+			 __field(__s32, offset_for_top_to_bottom_field)
+			 __field(u16, pic_width_in_mbs_minus1)
+			 __field(u16, pic_height_in_map_units_minus1)
+			 __field(u32, flags)),
+	TP_fast_assign(__entry->profile_idc = s->profile_idc;
+		       __entry->constraint_set_flags = s->constraint_set_flags;
+		       __entry->level_idc = s->level_idc;
+		       __entry->seq_parameter_set_id = s->seq_parameter_set_id;
+		       __entry->chroma_format_idc = s->chroma_format_idc;
+		       __entry->bit_depth_luma_minus8 = s->bit_depth_luma_minus8;
+		       __entry->bit_depth_chroma_minus8 = s->bit_depth_chroma_minus8;
+		       __entry->log2_max_frame_num_minus4 = s->log2_max_frame_num_minus4;
+		       __entry->pic_order_cnt_type = s->pic_order_cnt_type;
+		       __entry->log2_max_pic_order_cnt_lsb_minus4 =
+				s->log2_max_pic_order_cnt_lsb_minus4;
+		       __entry->max_num_ref_frames = s->max_num_ref_frames;
+		       __entry->num_ref_frames_in_pic_order_cnt_cycle =
+				s->num_ref_frames_in_pic_order_cnt_cycle;
+		       memcpy(__entry->offset_for_ref_frame, s->offset_for_ref_frame,
+			      sizeof(__entry->offset_for_ref_frame));
+		       __entry->offset_for_non_ref_pic = s->offset_for_non_ref_pic;
+		       __entry->offset_for_top_to_bottom_field = s->offset_for_top_to_bottom_field;
+		       __entry->pic_width_in_mbs_minus1 = s->pic_width_in_mbs_minus1;
+		       __entry->pic_height_in_map_units_minus1 = s->pic_height_in_map_units_minus1;
+		       __entry->flags = s->flags),
 	TP_printk("\nprofile_idc %u\n"
 		  "constraint_set_flags %s\n"
 		  "level_idc %u\n"
@@ -382,36 +640,38 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 		  "pic_width_in_mbs_minus1 %u\n"
 		  "pic_height_in_map_units_minus1 %u\n"
 		  "flags %s",
-		  __entry->s.profile_idc,
-		  __print_flags(__entry->s.constraint_set_flags, "|",
+		  __entry->profile_idc,
+		  __print_flags(__entry->constraint_set_flags, "|",
 		  {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG"},
 		  {V4L2_H264_SPS_CONSTRAINT_SET1_FLAG, "CONSTRAINT_SET1_FLAG"},
 		  {V4L2_H264_SPS_CONSTRAINT_SET2_FLAG, "CONSTRAINT_SET2_FLAG"},
 		  {V4L2_H264_SPS_CONSTRAINT_SET3_FLAG, "CONSTRAINT_SET3_FLAG"},
 		  {V4L2_H264_SPS_CONSTRAINT_SET4_FLAG, "CONSTRAINT_SET4_FLAG"},
 		  {V4L2_H264_SPS_CONSTRAINT_SET5_FLAG, "CONSTRAINT_SET5_FLAG"}),
-		  __entry->s.level_idc,
-		  __entry->s.seq_parameter_set_id,
-		  __entry->s.chroma_format_idc,
-		  __entry->s.bit_depth_luma_minus8,
-		  __entry->s.bit_depth_chroma_minus8,
-		  __entry->s.log2_max_frame_num_minus4,
-		  __entry->s.pic_order_cnt_type,
-		  __entry->s.log2_max_pic_order_cnt_lsb_minus4,
-		  __entry->s.max_num_ref_frames,
-		  __entry->s.num_ref_frames_in_pic_order_cnt_cycle,
-		  __print_array(__entry->s.offset_for_ref_frame,
-				ARRAY_SIZE(__entry->s.offset_for_ref_frame),
-				sizeof(__entry->s.offset_for_ref_frame[0])),
-		  __entry->s.offset_for_non_ref_pic,
-		  __entry->s.offset_for_top_to_bottom_field,
-		  __entry->s.pic_width_in_mbs_minus1,
-		  __entry->s.pic_height_in_map_units_minus1,
-		  __print_flags(__entry->s.flags, "|",
+		  __entry->level_idc,
+		  __entry->seq_parameter_set_id,
+		  __entry->chroma_format_idc,
+		  __entry->bit_depth_luma_minus8,
+		  __entry->bit_depth_chroma_minus8,
+		  __entry->log2_max_frame_num_minus4,
+		  __entry->pic_order_cnt_type,
+		  __entry->log2_max_pic_order_cnt_lsb_minus4,
+		  __entry->max_num_ref_frames,
+		  __entry->num_ref_frames_in_pic_order_cnt_cycle,
+		  __print_array(__entry->offset_for_ref_frame,
+				ARRAY_SIZE(__entry->offset_for_ref_frame),
+				sizeof(__entry->offset_for_ref_frame[0])),
+		  __entry->offset_for_non_ref_pic,
+		  __entry->offset_for_top_to_bottom_field,
+		  __entry->pic_width_in_mbs_minus1,
+		  __entry->pic_height_in_map_units_minus1,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE, "SEPARATE_COLOUR_PLANE"},
-		  {V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS, "QPPRIME_Y_ZERO_TRANSFORM_BYPASS"},
+		  {V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS,
+		   "QPPRIME_Y_ZERO_TRANSFORM_BYPASS"},
 		  {V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO, "DELTA_PIC_ORDER_ALWAYS_ZERO"},
-		  {V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED, "GAPS_IN_FRAME_NUM_VALUE_ALLOWED"},
+		  {V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED,
+		   "GAPS_IN_FRAME_NUM_VALUE_ALLOWED"},
 		  {V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY, "FRAME_MBS_ONLY"},
 		  {V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD, "MB_ADAPTIVE_FRAME_FIELD"},
 		  {V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE, "DIRECT_8X8_INFERENCE"}
@@ -421,8 +681,30 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
 	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
-	TP_fast_assign(__entry->p = *p),
+	TP_STRUCT__entry(__field(u8, pic_parameter_set_id)
+			 __field(u8, seq_parameter_set_id)
+			 __field(u8, num_slice_groups_minus1)
+			 __field(u8, num_ref_idx_l0_default_active_minus1)
+			 __field(u8, num_ref_idx_l1_default_active_minus1)
+			 __field(u8, weighted_bipred_idc)
+			 __field(__s8, pic_init_qp_minus26)
+			 __field(__s8, pic_init_qs_minus26)
+			 __field(__s8, chroma_qp_index_offset)
+			 __field(__s8, second_chroma_qp_index_offset)
+			 __field(u16, flags)),
+	TP_fast_assign(__entry->pic_parameter_set_id = p->pic_parameter_set_id;
+		       __entry->seq_parameter_set_id = p->seq_parameter_set_id;
+		       __entry->num_slice_groups_minus1 = p->num_slice_groups_minus1;
+		       __entry->num_ref_idx_l0_default_active_minus1 =
+				p->num_ref_idx_l0_default_active_minus1;
+		       __entry->num_ref_idx_l1_default_active_minus1 =
+				p->num_ref_idx_l1_default_active_minus1;
+		       __entry->weighted_bipred_idc = p->weighted_bipred_idc;
+		       __entry->pic_init_qp_minus26 = p->pic_init_qp_minus26;
+		       __entry->pic_init_qs_minus26 = p->pic_init_qs_minus26;
+		       __entry->chroma_qp_index_offset = p->chroma_qp_index_offset;
+		       __entry->second_chroma_qp_index_offset = p->second_chroma_qp_index_offset;
+		       __entry->flags = p->flags),
 	TP_printk("\npic_parameter_set_id %u\n"
 		  "seq_parameter_set_id %u\n"
 		  "num_slice_groups_minus1 %u\n"
@@ -434,21 +716,23 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 		  "chroma_qp_index_offset %d\n"
 		  "second_chroma_qp_index_offset %d\n"
 		  "flags %s",
-		  __entry->p.pic_parameter_set_id,
-		  __entry->p.seq_parameter_set_id,
-		  __entry->p.num_slice_groups_minus1,
-		  __entry->p.num_ref_idx_l0_default_active_minus1,
-		  __entry->p.num_ref_idx_l1_default_active_minus1,
-		  __entry->p.weighted_bipred_idc,
-		  __entry->p.pic_init_qp_minus26,
-		  __entry->p.pic_init_qs_minus26,
-		  __entry->p.chroma_qp_index_offset,
-		  __entry->p.second_chroma_qp_index_offset,
-		  __print_flags(__entry->p.flags, "|",
+		  __entry->pic_parameter_set_id,
+		  __entry->seq_parameter_set_id,
+		  __entry->num_slice_groups_minus1,
+		  __entry->num_ref_idx_l0_default_active_minus1,
+		  __entry->num_ref_idx_l1_default_active_minus1,
+		  __entry->weighted_bipred_idc,
+		  __entry->pic_init_qp_minus26,
+		  __entry->pic_init_qs_minus26,
+		  __entry->chroma_qp_index_offset,
+		  __entry->second_chroma_qp_index_offset,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE, "ENTROPY_CODING_MODE"},
-		  {V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT, "BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT"},
+		  {V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT,
+		   "BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT"},
 		  {V4L2_H264_PPS_FLAG_WEIGHTED_PRED, "WEIGHTED_PRED"},
-		  {V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "DEBLOCKING_FILTER_CONTROL_PRESENT"},
+		  {V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT,
+		   "DEBLOCKING_FILTER_CONTROL_PRESENT"},
 		  {V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED, "CONSTRAINED_INTRA_PRED"},
 		  {V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT, "REDUNDANT_PIC_CNT_PRESENT"},
 		  {V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE, "TRANSFORM_8X8_MODE"},
@@ -459,16 +743,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matrix, s)),
-	TP_fast_assign(__entry->s = *s),
+	TP_STRUCT__entry(__array(u8, scaling_list_4x4, 6 * 16)
+			 __array(u8, scaling_list_8x8, 6 * 64)),
+	TP_fast_assign(memcpy(__entry->scaling_list_4x4, s->scaling_list_4x4,
+			      sizeof(__entry->scaling_list_4x4));
+		       memcpy(__entry->scaling_list_8x8, s->scaling_list_8x8,
+			      sizeof(__entry->scaling_list_8x8))),
 	TP_printk("\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->s.scaling_list_4x4,
-				   sizeof(__entry->s.scaling_list_4x4),
+				   __entry->scaling_list_4x4,
+				   sizeof(__entry->scaling_list_4x4),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->s.scaling_list_8x8,
-				   sizeof(__entry->s.scaling_list_8x8),
+				   __entry->scaling_list_8x8,
+				   sizeof(__entry->scaling_list_8x8),
 				   false)
 	)
 );
@@ -476,8 +764,42 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
 	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights, p)),
-	TP_fast_assign(__entry->p = *p),
+	TP_STRUCT__entry(__field(u16, luma_log2_weight_denom)
+			 __field(u16, chroma_log2_weight_denom)
+			 __array(__s16, weight_factors_0_luma_weight, 32)
+			 __array(__s16, weight_factors_0_luma_offset, 32)
+			 __array(__s16, weight_factors_0_chroma_weight, 32 * 2)
+			 __array(__s16, weight_factors_0_chroma_offset, 32 * 2)
+			 __array(__s16, weight_factors_1_luma_weight, 32)
+			 __array(__s16, weight_factors_1_luma_offset, 32)
+			 __array(__s16, weight_factors_1_chroma_weight, 32 * 2)
+			 __array(__s16, weight_factors_1_chroma_offset, 32 * 2)),
+	TP_fast_assign(__entry->luma_log2_weight_denom = p->luma_log2_weight_denom;
+		       __entry->chroma_log2_weight_denom = p->chroma_log2_weight_denom;
+		       memcpy(__entry->weight_factors_0_luma_weight,
+			      p->weight_factors[0].luma_weight,
+			      sizeof(__entry->weight_factors_0_luma_weight));
+		       memcpy(__entry->weight_factors_0_luma_offset,
+			      p->weight_factors[0].luma_offset,
+			      sizeof(__entry->weight_factors_0_luma_offset));
+		       memcpy(__entry->weight_factors_0_chroma_weight,
+			      p->weight_factors[0].chroma_weight,
+			      sizeof(__entry->weight_factors_0_chroma_weight));
+		       memcpy(__entry->weight_factors_0_chroma_offset,
+			      p->weight_factors[0].chroma_offset,
+			      sizeof(__entry->weight_factors_0_chroma_offset));
+		       memcpy(__entry->weight_factors_1_luma_weight,
+			      p->weight_factors[1].luma_weight,
+			      sizeof(__entry->weight_factors_1_luma_weight));
+		       memcpy(__entry->weight_factors_1_luma_offset,
+			      p->weight_factors[1].luma_offset,
+			      sizeof(__entry->weight_factors_1_luma_offset));
+		       memcpy(__entry->weight_factors_1_chroma_weight,
+			      p->weight_factors[1].chroma_weight,
+			      sizeof(__entry->weight_factors_1_chroma_weight));
+		       memcpy(__entry->weight_factors_1_chroma_offset,
+			      p->weight_factors[1].chroma_offset,
+			      sizeof(__entry->weight_factors_1_chroma_offset))),
 	TP_printk("\nluma_log2_weight_denom %u\n"
 		  "chroma_log2_weight_denom %u\n"
 		  "weight_factor[0].luma_weight %s\n"
@@ -488,35 +810,35 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 		  "weight_factor[1].luma_offset %s\n"
 		  "weight_factor[1].chroma_weight {%s}\n"
 		  "weight_factor[1].chroma_offset {%s}\n",
-		  __entry->p.luma_log2_weight_denom,
-		  __entry->p.chroma_log2_weight_denom,
-		  __print_array(__entry->p.weight_factors[0].luma_weight,
-				ARRAY_SIZE(__entry->p.weight_factors[0].luma_weight),
-				sizeof(__entry->p.weight_factors[0].luma_weight[0])),
-		  __print_array(__entry->p.weight_factors[0].luma_offset,
-				ARRAY_SIZE(__entry->p.weight_factors[0].luma_offset),
-				sizeof(__entry->p.weight_factors[0].luma_offset[0])),
+		  __entry->luma_log2_weight_denom,
+		  __entry->chroma_log2_weight_denom,
+		  __print_array(__entry->weight_factors_0_luma_weight,
+				ARRAY_SIZE(__entry->weight_factors_0_luma_weight),
+				sizeof(__entry->weight_factors_0_luma_weight[0])),
+		  __print_array(__entry->weight_factors_0_luma_offset,
+				ARRAY_SIZE(__entry->weight_factors_0_luma_offset),
+				sizeof(__entry->weight_factors_0_luma_offset[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.weight_factors[0].chroma_weight,
-				   sizeof(__entry->p.weight_factors[0].chroma_weight),
+				   __entry->weight_factors_0_chroma_weight,
+				   sizeof(__entry->weight_factors_0_chroma_weight),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.weight_factors[0].chroma_offset,
-				   sizeof(__entry->p.weight_factors[0].chroma_offset),
+				   __entry->weight_factors_0_chroma_offset,
+				   sizeof(__entry->weight_factors_0_chroma_offset),
 				   false),
-		  __print_array(__entry->p.weight_factors[1].luma_weight,
-				ARRAY_SIZE(__entry->p.weight_factors[1].luma_weight),
-				sizeof(__entry->p.weight_factors[1].luma_weight[0])),
-		  __print_array(__entry->p.weight_factors[1].luma_offset,
-				ARRAY_SIZE(__entry->p.weight_factors[1].luma_offset),
-				sizeof(__entry->p.weight_factors[1].luma_offset[0])),
+		  __print_array(__entry->weight_factors_1_luma_weight,
+				ARRAY_SIZE(__entry->weight_factors_1_luma_weight),
+				sizeof(__entry->weight_factors_1_luma_weight[0])),
+		  __print_array(__entry->weight_factors_1_luma_offset,
+				ARRAY_SIZE(__entry->weight_factors_1_luma_offset),
+				sizeof(__entry->weight_factors_1_luma_offset[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.weight_factors[1].chroma_weight,
-				   sizeof(__entry->p.weight_factors[1].chroma_weight),
+				   __entry->weight_factors_1_chroma_weight,
+				   sizeof(__entry->weight_factors_1_chroma_weight),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.weight_factors[1].chroma_offset,
-				   sizeof(__entry->p.weight_factors[1].chroma_offset),
+				   __entry->weight_factors_1_chroma_offset,
+				   sizeof(__entry->weight_factors_1_chroma_offset),
 				   false)
 	)
 );
@@ -524,8 +846,34 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params, s)),
-	TP_fast_assign(__entry->s = *s),
+	TP_STRUCT__entry(__field(u32, header_bit_size)
+			 __field(u32, first_mb_in_slice)
+			 __field(u8, slice_type)
+			 __field(u8, colour_plane_id)
+			 __field(u8, redundant_pic_cnt)
+			 __field(u8, cabac_init_idc)
+			 __field(__s8, slice_qp_delta)
+			 __field(__s8, slice_qs_delta)
+			 __field(u8, disable_deblocking_filter_idc)
+			 __field(__s8, slice_alpha_c0_offset_div2)
+			 __field(__s8, slice_beta_offset_div2)
+			 __field(u8, num_ref_idx_l0_active_minus1)
+			 __field(u8, num_ref_idx_l1_active_minus1)
+			 __field(u32, flags)),
+	TP_fast_assign(__entry->header_bit_size = s->header_bit_size;
+		       __entry->first_mb_in_slice = s->first_mb_in_slice;
+		       __entry->slice_type = s->slice_type;
+		       __entry->colour_plane_id = s->colour_plane_id;
+		       __entry->redundant_pic_cnt = s->redundant_pic_cnt;
+		       __entry->cabac_init_idc = s->cabac_init_idc;
+		       __entry->slice_qp_delta = s->slice_qp_delta;
+		       __entry->slice_qs_delta = s->slice_qs_delta;
+		       __entry->disable_deblocking_filter_idc = s->disable_deblocking_filter_idc;
+		       __entry->slice_alpha_c0_offset_div2 = s->slice_alpha_c0_offset_div2;
+		       __entry->slice_beta_offset_div2 = s->slice_beta_offset_div2;
+		       __entry->num_ref_idx_l0_active_minus1 = s->num_ref_idx_l0_active_minus1;
+		       __entry->num_ref_idx_l1_active_minus1 = s->num_ref_idx_l1_active_minus1;
+		       __entry->flags = s->flags),
 	TP_printk("\nheader_bit_size %u\n"
 		  "first_mb_in_slice %u\n"
 		  "slice_type %s\n"
@@ -540,25 +888,25 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 		  "num_ref_idx_l0_active_minus1 %u\n"
 		  "num_ref_idx_l1_active_minus1 %u\n"
 		  "flags %s",
-		  __entry->s.header_bit_size,
-		  __entry->s.first_mb_in_slice,
-		  __print_symbolic(__entry->s.slice_type,
+		  __entry->header_bit_size,
+		  __entry->first_mb_in_slice,
+		  __print_symbolic(__entry->slice_type,
 		  {V4L2_H264_SLICE_TYPE_P, "P"},
 		  {V4L2_H264_SLICE_TYPE_B, "B"},
 		  {V4L2_H264_SLICE_TYPE_I, "I"},
 		  {V4L2_H264_SLICE_TYPE_SP, "SP"},
 		  {V4L2_H264_SLICE_TYPE_SI, "SI"}),
-		  __entry->s.colour_plane_id,
-		  __entry->s.redundant_pic_cnt,
-		  __entry->s.cabac_init_idc,
-		  __entry->s.slice_qp_delta,
-		  __entry->s.slice_qs_delta,
-		  __entry->s.disable_deblocking_filter_idc,
-		  __entry->s.slice_alpha_c0_offset_div2,
-		  __entry->s.slice_beta_offset_div2,
-		  __entry->s.num_ref_idx_l0_active_minus1,
-		  __entry->s.num_ref_idx_l1_active_minus1,
-		  __print_flags(__entry->s.flags, "|",
+		  __entry->colour_plane_id,
+		  __entry->redundant_pic_cnt,
+		  __entry->cabac_init_idc,
+		  __entry->slice_qp_delta,
+		  __entry->slice_qs_delta,
+		  __entry->disable_deblocking_filter_idc,
+		  __entry->slice_alpha_c0_offset_div2,
+		  __entry->slice_beta_offset_div2,
+		  __entry->num_ref_idx_l0_active_minus1,
+		  __entry->num_ref_idx_l1_active_minus1,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED, "DIRECT_SPATIAL_MV_PRED"},
 		  {V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH, "SP_FOR_SWITCH"})
 	)
@@ -567,24 +915,51 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
 	TP_PROTO(const struct v4l2_h264_reference *r, int i),
 	TP_ARGS(r, i),
-	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
+	TP_STRUCT__entry(__field(u8, fields)
+			 __field(u8, index)
 			 __field(int, i)),
-	TP_fast_assign(__entry->r = *r; __entry->i = i;),
+	TP_fast_assign(__entry->fields = r->fields;
+		       __entry->index = r->index;
+		       __entry->i = i;),
 	TP_printk("[%d]: fields %s index %u",
 		  __entry->i,
-		  __print_flags(__entry->r.fields, "|",
+		  __print_flags(__entry->fields, "|",
 		  {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
 		  {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
 		  {V4L2_H264_FRAME_REF, "FRAME_REF"}),
-		  __entry->r.index
+		  __entry->index
 	)
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
 	TP_ARGS(d),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_params, d)),
-	TP_fast_assign(__entry->d = *d),
+	TP_STRUCT__entry(__field(u16, nal_ref_idc)
+			 __field(u16, frame_num)
+			 __field(__s32, top_field_order_cnt)
+			 __field(__s32, bottom_field_order_cnt)
+			 __field(u16, idr_pic_id)
+			 __field(u16, pic_order_cnt_lsb)
+			 __field(__s32, delta_pic_order_cnt_bottom)
+			 __field(__s32, delta_pic_order_cnt0)
+			 __field(__s32, delta_pic_order_cnt1)
+			 __field(u32, dec_ref_pic_marking_bit_size)
+			 __field(u32, pic_order_cnt_bit_size)
+			 __field(u32, slice_group_change_cycle)
+			 __field(u32, flags)),
+	TP_fast_assign(__entry->nal_ref_idc = d->nal_ref_idc;
+		       __entry->frame_num = d->frame_num;
+		       __entry->top_field_order_cnt = d->top_field_order_cnt;
+		       __entry->bottom_field_order_cnt = d->bottom_field_order_cnt;
+		       __entry->idr_pic_id = d->idr_pic_id;
+		       __entry->pic_order_cnt_lsb = d->pic_order_cnt_lsb;
+		       __entry->delta_pic_order_cnt_bottom = d->delta_pic_order_cnt_bottom;
+		       __entry->delta_pic_order_cnt0 = d->delta_pic_order_cnt0;
+		       __entry->delta_pic_order_cnt1 = d->delta_pic_order_cnt1;
+		       __entry->dec_ref_pic_marking_bit_size = d->dec_ref_pic_marking_bit_size;
+		       __entry->pic_order_cnt_bit_size = d->pic_order_cnt_bit_size;
+		       __entry->slice_group_change_cycle = d->slice_group_change_cycle;
+		       __entry->flags = d->flags),
 	TP_printk("\nnal_ref_idc %u\n"
 		  "frame_num %u\n"
 		  "top_field_order_cnt %d\n"
@@ -598,19 +973,19 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 		  "pic_order_cnt_bit_size %u\n"
 		  "slice_group_change_cycle %u\n"
 		  "flags %s\n",
-		  __entry->d.nal_ref_idc,
-		  __entry->d.frame_num,
-		  __entry->d.top_field_order_cnt,
-		  __entry->d.bottom_field_order_cnt,
-		  __entry->d.idr_pic_id,
-		  __entry->d.pic_order_cnt_lsb,
-		  __entry->d.delta_pic_order_cnt_bottom,
-		  __entry->d.delta_pic_order_cnt0,
-		  __entry->d.delta_pic_order_cnt1,
-		  __entry->d.dec_ref_pic_marking_bit_size,
-		  __entry->d.pic_order_cnt_bit_size,
-		  __entry->d.slice_group_change_cycle,
-		  __print_flags(__entry->d.flags, "|",
+		  __entry->nal_ref_idc,
+		  __entry->frame_num,
+		  __entry->top_field_order_cnt,
+		  __entry->bottom_field_order_cnt,
+		  __entry->idr_pic_id,
+		  __entry->pic_order_cnt_lsb,
+		  __entry->delta_pic_order_cnt_bottom,
+		  __entry->delta_pic_order_cnt0,
+		  __entry->delta_pic_order_cnt1,
+		  __entry->dec_ref_pic_marking_bit_size,
+		  __entry->pic_order_cnt_bit_size,
+		  __entry->slice_group_change_cycle,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC, "IDR_PIC"},
 		  {V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC, "FIELD_PIC"},
 		  {V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD, "BOTTOM_FIELD"},
@@ -622,22 +997,35 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
 	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
 	TP_ARGS(e, i),
-	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
+	TP_STRUCT__entry(__field(u64, reference_ts)
+			 __field(u32, pic_num)
+			 __field(u16, frame_num)
+			 __field(u8, fields)
+			 __field(__s32, top_field_order_cnt)
+			 __field(__s32, bottom_field_order_cnt)
+			 __field(u32, flags)
 			 __field(int, i)),
-	TP_fast_assign(__entry->e = *e; __entry->i = i;),
+	TP_fast_assign(__entry->reference_ts = e->reference_ts;
+		       __entry->pic_num = e->pic_num;
+		       __entry->frame_num = e->frame_num;
+		       __entry->fields = e->fields;
+		       __entry->top_field_order_cnt = e->top_field_order_cnt;
+		       __entry->bottom_field_order_cnt = e->bottom_field_order_cnt;
+		       __entry->flags = e->flags;
+		       __entry->i = i;),
 	TP_printk("[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s "
 		  "top_field_order_cnt %d bottom_field_order_cnt %d flags %s",
 		  __entry->i,
-		  __entry->e.reference_ts,
-		  __entry->e.pic_num,
-		  __entry->e.frame_num,
-		  __print_flags(__entry->e.fields, "|",
+		  __entry->reference_ts,
+		  __entry->pic_num,
+		  __entry->frame_num,
+		  __print_flags(__entry->fields, "|",
 		  {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
 		  {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
 		  {V4L2_H264_FRAME_REF, "FRAME_REF"}),
-		  __entry->e.top_field_order_cnt,
-		  __entry->e.bottom_field_order_cnt,
-		  __print_flags(__entry->e.flags, "|",
+		  __entry->top_field_order_cnt,
+		  __entry->bottom_field_order_cnt,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_H264_DPB_ENTRY_FLAG_VALID, "VALID"},
 		  {V4L2_H264_DPB_ENTRY_FLAG_ACTIVE, "ACTIVE"},
 		  {V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM, "LONG_TERM"},
@@ -696,8 +1084,68 @@ DEFINE_EVENT(v4l2_h264_dpb_entry_tmpl, v4l2_h264_dpb_entry,
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_sps, s)),
-	TP_fast_assign(__entry->s = *s),
+	TP_STRUCT__entry(__field(__u8, video_parameter_set_id)
+			 __field(__u8, seq_parameter_set_id)
+			 __field(__u16, pic_width_in_luma_samples)
+			 __field(__u16, pic_height_in_luma_samples)
+			 __field(__u8, bit_depth_luma_minus8)
+			 __field(__u8, bit_depth_chroma_minus8)
+			 __field(__u8, log2_max_pic_order_cnt_lsb_minus4)
+			 __field(__u8, sps_max_dec_pic_buffering_minus1)
+			 __field(__u8, sps_max_num_reorder_pics)
+			 __field(__u8, sps_max_latency_increase_plus1)
+			 __field(__u8, log2_min_luma_coding_block_size_minus3)
+			 __field(__u8, log2_diff_max_min_luma_coding_block_size)
+			 __field(__u8, log2_min_luma_transform_block_size_minus2)
+			 __field(__u8, log2_diff_max_min_luma_transform_block_size)
+			 __field(__u8, max_transform_hierarchy_depth_inter)
+			 __field(__u8, max_transform_hierarchy_depth_intra)
+			 __field(__u8, pcm_sample_bit_depth_luma_minus1)
+			 __field(__u8, pcm_sample_bit_depth_chroma_minus1)
+			 __field(__u8, log2_min_pcm_luma_coding_block_size_minus3)
+			 __field(__u8, log2_diff_max_min_pcm_luma_coding_block_size)
+			 __field(__u8, num_short_term_ref_pic_sets)
+			 __field(__u8, num_long_term_ref_pics_sps)
+			 __field(__u8, chroma_format_idc)
+			 __field(__u8, sps_max_sub_layers_minus1)
+			 __field(__u64, flags)),
+	TP_fast_assign(__entry->video_parameter_set_id = s->video_parameter_set_id;
+		       __entry->seq_parameter_set_id = s->seq_parameter_set_id;
+		       __entry->pic_width_in_luma_samples = s->pic_width_in_luma_samples;
+		       __entry->pic_height_in_luma_samples = s->pic_height_in_luma_samples;
+		       __entry->bit_depth_luma_minus8 = s->bit_depth_luma_minus8;
+		       __entry->bit_depth_chroma_minus8 = s->bit_depth_chroma_minus8;
+		       __entry->log2_max_pic_order_cnt_lsb_minus4 =
+				s->log2_max_pic_order_cnt_lsb_minus4;
+		       __entry->sps_max_dec_pic_buffering_minus1 =
+				s->sps_max_dec_pic_buffering_minus1;
+		       __entry->sps_max_num_reorder_pics = s->sps_max_num_reorder_pics;
+		       __entry->sps_max_latency_increase_plus1 = s->sps_max_latency_increase_plus1;
+		       __entry->log2_min_luma_coding_block_size_minus3 =
+				s->log2_min_luma_coding_block_size_minus3;
+		       __entry->log2_diff_max_min_luma_coding_block_size =
+				s->log2_diff_max_min_luma_coding_block_size;
+		       __entry->log2_min_luma_transform_block_size_minus2 =
+				s->log2_min_luma_transform_block_size_minus2;
+		       __entry->log2_diff_max_min_luma_transform_block_size =
+				s->log2_diff_max_min_luma_transform_block_size;
+		       __entry->max_transform_hierarchy_depth_inter =
+				s->max_transform_hierarchy_depth_inter;
+		       __entry->max_transform_hierarchy_depth_intra =
+				s->max_transform_hierarchy_depth_intra;
+		       __entry->pcm_sample_bit_depth_luma_minus1 =
+				s->pcm_sample_bit_depth_luma_minus1;
+		       __entry->pcm_sample_bit_depth_chroma_minus1 =
+				s->pcm_sample_bit_depth_chroma_minus1;
+		       __entry->log2_min_pcm_luma_coding_block_size_minus3 =
+				s->log2_min_pcm_luma_coding_block_size_minus3;
+		       __entry->log2_diff_max_min_pcm_luma_coding_block_size =
+				s->log2_diff_max_min_pcm_luma_coding_block_size;
+		       __entry->num_short_term_ref_pic_sets = s->num_short_term_ref_pic_sets;
+		       __entry->num_long_term_ref_pics_sps = s->num_long_term_ref_pics_sps;
+		       __entry->chroma_format_idc = s->chroma_format_idc;
+		       __entry->sps_max_sub_layers_minus1 = s->sps_max_sub_layers_minus1;
+		       __entry->flags = s->flags;),
 	TP_printk("\nvideo_parameter_set_id %u\n"
 		  "seq_parameter_set_id %u\n"
 		  "pic_width_in_luma_samples %u\n"
@@ -723,40 +1171,42 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 		  "chroma_format_idc %u\n"
 		  "sps_max_sub_layers_minus1 %u\n"
 		  "flags %s",
-		  __entry->s.video_parameter_set_id,
-		  __entry->s.seq_parameter_set_id,
-		  __entry->s.pic_width_in_luma_samples,
-		  __entry->s.pic_height_in_luma_samples,
-		  __entry->s.bit_depth_luma_minus8,
-		  __entry->s.bit_depth_chroma_minus8,
-		  __entry->s.log2_max_pic_order_cnt_lsb_minus4,
-		  __entry->s.sps_max_dec_pic_buffering_minus1,
-		  __entry->s.sps_max_num_reorder_pics,
-		  __entry->s.sps_max_latency_increase_plus1,
-		  __entry->s.log2_min_luma_coding_block_size_minus3,
-		  __entry->s.log2_diff_max_min_luma_coding_block_size,
-		  __entry->s.log2_min_luma_transform_block_size_minus2,
-		  __entry->s.log2_diff_max_min_luma_transform_block_size,
-		  __entry->s.max_transform_hierarchy_depth_inter,
-		  __entry->s.max_transform_hierarchy_depth_intra,
-		  __entry->s.pcm_sample_bit_depth_luma_minus1,
-		  __entry->s.pcm_sample_bit_depth_chroma_minus1,
-		  __entry->s.log2_min_pcm_luma_coding_block_size_minus3,
-		  __entry->s.log2_diff_max_min_pcm_luma_coding_block_size,
-		  __entry->s.num_short_term_ref_pic_sets,
-		  __entry->s.num_long_term_ref_pics_sps,
-		  __entry->s.chroma_format_idc,
-		  __entry->s.sps_max_sub_layers_minus1,
-		  __print_flags(__entry->s.flags, "|",
+		  __entry->video_parameter_set_id,
+		  __entry->seq_parameter_set_id,
+		  __entry->pic_width_in_luma_samples,
+		  __entry->pic_height_in_luma_samples,
+		  __entry->bit_depth_luma_minus8,
+		  __entry->bit_depth_chroma_minus8,
+		  __entry->log2_max_pic_order_cnt_lsb_minus4,
+		  __entry->sps_max_dec_pic_buffering_minus1,
+		  __entry->sps_max_num_reorder_pics,
+		  __entry->sps_max_latency_increase_plus1,
+		  __entry->log2_min_luma_coding_block_size_minus3,
+		  __entry->log2_diff_max_min_luma_coding_block_size,
+		  __entry->log2_min_luma_transform_block_size_minus2,
+		  __entry->log2_diff_max_min_luma_transform_block_size,
+		  __entry->max_transform_hierarchy_depth_inter,
+		  __entry->max_transform_hierarchy_depth_intra,
+		  __entry->pcm_sample_bit_depth_luma_minus1,
+		  __entry->pcm_sample_bit_depth_chroma_minus1,
+		  __entry->log2_min_pcm_luma_coding_block_size_minus3,
+		  __entry->log2_diff_max_min_pcm_luma_coding_block_size,
+		  __entry->num_short_term_ref_pic_sets,
+		  __entry->num_long_term_ref_pics_sps,
+		  __entry->chroma_format_idc,
+		  __entry->sps_max_sub_layers_minus1,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE, "SEPARATE_COLOUR_PLANE"},
 		  {V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED, "SCALING_LIST_ENABLED"},
 		  {V4L2_HEVC_SPS_FLAG_AMP_ENABLED, "AMP_ENABLED"},
 		  {V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET, "SAMPLE_ADAPTIVE_OFFSET"},
 		  {V4L2_HEVC_SPS_FLAG_PCM_ENABLED, "PCM_ENABLED"},
-		  {V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED, "V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED"},
+		  {V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED,
+		   "V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED"},
 		  {V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT, "LONG_TERM_REF_PICS_PRESENT"},
 		  {V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED, "TEMPORAL_MVP_ENABLED"},
-		  {V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED, "STRONG_INTRA_SMOOTHING_ENABLED"}
+		  {V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED,
+		   "STRONG_INTRA_SMOOTHING_ENABLED"}
 	))
 
 );
@@ -765,8 +1215,43 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
 	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_pps, p)),
-	TP_fast_assign(__entry->p = *p),
+	TP_STRUCT__entry(__field(__u8, pic_parameter_set_id)
+			 __field(__u8, num_extra_slice_header_bits)
+			 __field(__u8, num_ref_idx_l0_default_active_minus1)
+			 __field(__u8, num_ref_idx_l1_default_active_minus1)
+			 __field(__s8, init_qp_minus26)
+			 __field(__u8, diff_cu_qp_delta_depth)
+			 __field(__s8, pps_cb_qp_offset)
+			 __field(__s8, pps_cr_qp_offset)
+			 __field(__u8, num_tile_columns_minus1)
+			 __field(__u8, num_tile_rows_minus1)
+			 __array(__u8, column_width_minus1, 20)
+			 __array(__u8, row_height_minus1, 22)
+			 __field(__s8, pps_beta_offset_div2)
+			 __field(__s8, pps_tc_offset_div2)
+			 __field(__u8, log2_parallel_merge_level_minus2)
+			 __field(__u64, flags)),
+	TP_fast_assign(__entry->pic_parameter_set_id = p->pic_parameter_set_id;
+		       __entry->num_extra_slice_header_bits = p->num_extra_slice_header_bits;
+		       __entry->num_ref_idx_l0_default_active_minus1 =
+				p->num_ref_idx_l0_default_active_minus1;
+		       __entry->num_ref_idx_l1_default_active_minus1 =
+				p->num_ref_idx_l1_default_active_minus1;
+		       __entry->init_qp_minus26 = p->init_qp_minus26;
+		       __entry->diff_cu_qp_delta_depth = p->diff_cu_qp_delta_depth;
+		       __entry->pps_cb_qp_offset = p->pps_cb_qp_offset;
+		       __entry->pps_cr_qp_offset = p->pps_cr_qp_offset;
+		       __entry->num_tile_columns_minus1 = p->num_tile_columns_minus1;
+		       __entry->num_tile_rows_minus1 = p->num_tile_rows_minus1;
+		       memcpy(__entry->column_width_minus1, p->column_width_minus1,
+			      sizeof(__entry->column_width_minus1));
+		       memcpy(__entry->row_height_minus1, p->row_height_minus1,
+			      sizeof(__entry->row_height_minus1));
+		       __entry->pps_beta_offset_div2 = p->pps_beta_offset_div2;
+		       __entry->pps_tc_offset_div2 = p->pps_tc_offset_div2;
+		       __entry->log2_parallel_merge_level_minus2 =
+				p->log2_parallel_merge_level_minus2;
+		       __entry->flags = p->flags;),
 	TP_printk("\npic_parameter_set_id %u\n"
 		  "num_extra_slice_header_bits %u\n"
 		  "num_ref_idx_l0_default_active_minus1 %u\n"
@@ -783,45 +1268,52 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 		  "pps_tc_offset_div2 %d\n"
 		  "log2_parallel_merge_level_minus2 %u\n"
 		  "flags %s",
-		  __entry->p.pic_parameter_set_id,
-		  __entry->p.num_extra_slice_header_bits,
-		  __entry->p.num_ref_idx_l0_default_active_minus1,
-		  __entry->p.num_ref_idx_l1_default_active_minus1,
-		  __entry->p.init_qp_minus26,
-		  __entry->p.diff_cu_qp_delta_depth,
-		  __entry->p.pps_cb_qp_offset,
-		  __entry->p.pps_cr_qp_offset,
-		  __entry->p.num_tile_columns_minus1,
-		  __entry->p.num_tile_rows_minus1,
-		  __print_array(__entry->p.column_width_minus1,
-				ARRAY_SIZE(__entry->p.column_width_minus1),
-				sizeof(__entry->p.column_width_minus1[0])),
-		  __print_array(__entry->p.row_height_minus1,
-				ARRAY_SIZE(__entry->p.row_height_minus1),
-				sizeof(__entry->p.row_height_minus1[0])),
-		  __entry->p.pps_beta_offset_div2,
-		  __entry->p.pps_tc_offset_div2,
-		  __entry->p.log2_parallel_merge_level_minus2,
-		  __print_flags(__entry->p.flags, "|",
-		  {V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED, "DEPENDENT_SLICE_SEGMENT_ENABLED"},
+		  __entry->pic_parameter_set_id,
+		  __entry->num_extra_slice_header_bits,
+		  __entry->num_ref_idx_l0_default_active_minus1,
+		  __entry->num_ref_idx_l1_default_active_minus1,
+		  __entry->init_qp_minus26,
+		  __entry->diff_cu_qp_delta_depth,
+		  __entry->pps_cb_qp_offset,
+		  __entry->pps_cr_qp_offset,
+		  __entry->num_tile_columns_minus1,
+		  __entry->num_tile_rows_minus1,
+		  __print_array(__entry->column_width_minus1,
+				ARRAY_SIZE(__entry->column_width_minus1),
+				sizeof(__entry->column_width_minus1[0])),
+		  __print_array(__entry->row_height_minus1,
+				ARRAY_SIZE(__entry->row_height_minus1),
+				sizeof(__entry->row_height_minus1[0])),
+		  __entry->pps_beta_offset_div2,
+		  __entry->pps_tc_offset_div2,
+		  __entry->log2_parallel_merge_level_minus2,
+		  __print_flags(__entry->flags, "|",
+		  {V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED,
+		   "DEPENDENT_SLICE_SEGMENT_ENABLED"},
 		  {V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT, "OUTPUT_FLAG_PRESENT"},
 		  {V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED, "SIGN_DATA_HIDING_ENABLED"},
 		  {V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT, "CABAC_INIT_PRESENT"},
 		  {V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED, "CONSTRAINED_INTRA_PRED"},
 		  {V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED, "CU_QP_DELTA_ENABLED"},
-		  {V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT, "PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT"},
+		  {V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT,
+		   "PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT"},
 		  {V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED, "WEIGHTED_PRED"},
 		  {V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED, "WEIGHTED_BIPRED"},
 		  {V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED, "TRANSQUANT_BYPASS_ENABLED"},
 		  {V4L2_HEVC_PPS_FLAG_TILES_ENABLED, "TILES_ENABLED"},
 		  {V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED, "ENTROPY_CODING_SYNC_ENABLED"},
-		  {V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED, "LOOP_FILTER_ACROSS_TILES_ENABLED"},
-		  {V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED, "PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
-		  {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED, "DEBLOCKING_FILTER_OVERRIDE_ENABLED"},
+		  {V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED,
+		   "LOOP_FILTER_ACROSS_TILES_ENABLED"},
+		  {V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED,
+		   "PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
+		  {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED,
+		   "DEBLOCKING_FILTER_OVERRIDE_ENABLED"},
 		  {V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER, "DISABLE_DEBLOCKING_FILTER"},
 		  {V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT, "LISTS_MODIFICATION_PRESENT"},
-		  {V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT, "SLICE_SEGMENT_HEADER_EXTENSION_PRESENT"},
-		  {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "DEBLOCKING_FILTER_CONTROL_PRESENT"},
+		  {V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT,
+		   "SLICE_SEGMENT_HEADER_EXTENSION_PRESENT"},
+		  {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT,
+		   "DEBLOCKING_FILTER_CONTROL_PRESENT"},
 		  {V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING, "UNIFORM_SPACING"}
 	))
 
@@ -832,8 +1324,60 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_slice_params, s)),
-	TP_fast_assign(__entry->s = *s),
+	TP_STRUCT__entry(__field(__u32, bit_size)
+			 __field(__u32, data_byte_offset)
+			 __field(__u32, num_entry_point_offsets)
+			 __field(__u8, nal_unit_type)
+			 __field(__u8, nuh_temporal_id_plus1)
+			 __field(__u8, slice_type)
+			 __field(__u8, colour_plane_id)
+			 __field(__s32, slice_pic_order_cnt)
+			 __field(__u8, num_ref_idx_l0_active_minus1)
+			 __field(__u8, num_ref_idx_l1_active_minus1)
+			 __field(__u8, collocated_ref_idx)
+			 __field(__u8, five_minus_max_num_merge_cand)
+			 __field(__s8, slice_qp_delta)
+			 __field(__s8, slice_cb_qp_offset)
+			 __field(__s8, slice_cr_qp_offset)
+			 __field(__s8, slice_act_y_qp_offset)
+			 __field(__s8, slice_act_cb_qp_offset)
+			 __field(__s8, slice_act_cr_qp_offset)
+			 __field(__s8, slice_beta_offset_div2)
+			 __field(__s8, slice_tc_offset_div2)
+			 __field(__u8, pic_struct)
+			 __field(__u32, slice_segment_addr)
+			 __array(__u8, ref_idx_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __array(__u8, ref_idx_l1, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __field(__u16, short_term_ref_pic_set_size)
+			 __field(__u16, long_term_ref_pic_set_size)
+			 __field(__u64, flags)),
+	TP_fast_assign(__entry->bit_size = s->bit_size;
+		       __entry->data_byte_offset = s->data_byte_offset;
+		       __entry->num_entry_point_offsets = s->num_entry_point_offsets;
+		       __entry->nal_unit_type = s->nal_unit_type;
+		       __entry->nuh_temporal_id_plus1 = s->nuh_temporal_id_plus1;
+		       __entry->slice_type = s->slice_type;
+		       __entry->colour_plane_id = s->colour_plane_id;
+		       __entry->slice_pic_order_cnt = s->slice_pic_order_cnt;
+		       __entry->num_ref_idx_l0_active_minus1 = s->num_ref_idx_l0_active_minus1;
+		       __entry->num_ref_idx_l1_active_minus1 = s->num_ref_idx_l1_active_minus1;
+		       __entry->collocated_ref_idx = s->collocated_ref_idx;
+		       __entry->five_minus_max_num_merge_cand = s->five_minus_max_num_merge_cand;
+		       __entry->slice_qp_delta = s->slice_qp_delta;
+		       __entry->slice_cb_qp_offset = s->slice_cb_qp_offset;
+		       __entry->slice_cr_qp_offset = s->slice_cr_qp_offset;
+		       __entry->slice_act_y_qp_offset = s->slice_act_y_qp_offset;
+		       __entry->slice_act_cb_qp_offset = s->slice_act_cb_qp_offset;
+		       __entry->slice_act_cr_qp_offset = s->slice_act_cr_qp_offset;
+		       __entry->slice_beta_offset_div2 = s->slice_beta_offset_div2;
+		       __entry->slice_tc_offset_div2 = s->slice_tc_offset_div2;
+		       __entry->pic_struct = s->pic_struct;
+		       __entry->slice_segment_addr = s->slice_segment_addr;
+		       memcpy(__entry->ref_idx_l0, s->ref_idx_l0, sizeof(__entry->ref_idx_l0));
+		       memcpy(__entry->ref_idx_l1, s->ref_idx_l1, sizeof(__entry->ref_idx_l1));
+		       __entry->short_term_ref_pic_set_size = s->short_term_ref_pic_set_size;
+		       __entry->long_term_ref_pic_set_size = s->long_term_ref_pic_set_size;
+		       __entry->flags = s->flags;),
 	TP_printk("\nbit_size %u\n"
 		  "data_byte_offset %u\n"
 		  "num_entry_point_offsets %u\n"
@@ -861,46 +1405,49 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 		  "short_term_ref_pic_set_size %u\n"
 		  "long_term_ref_pic_set_size %u\n"
 		  "flags %s",
-		  __entry->s.bit_size,
-		  __entry->s.data_byte_offset,
-		  __entry->s.num_entry_point_offsets,
-		  __entry->s.nal_unit_type,
-		  __entry->s.nuh_temporal_id_plus1,
-		  __entry->s.slice_type,
-		  __entry->s.colour_plane_id,
-		  __entry->s.slice_pic_order_cnt,
-		  __entry->s.num_ref_idx_l0_active_minus1,
-		  __entry->s.num_ref_idx_l1_active_minus1,
-		  __entry->s.collocated_ref_idx,
-		  __entry->s.five_minus_max_num_merge_cand,
-		  __entry->s.slice_qp_delta,
-		  __entry->s.slice_cb_qp_offset,
-		  __entry->s.slice_cr_qp_offset,
-		  __entry->s.slice_act_y_qp_offset,
-		  __entry->s.slice_act_cb_qp_offset,
-		  __entry->s.slice_act_cr_qp_offset,
-		  __entry->s.slice_beta_offset_div2,
-		  __entry->s.slice_tc_offset_div2,
-		  __entry->s.pic_struct,
-		  __entry->s.slice_segment_addr,
-		  __print_array(__entry->s.ref_idx_l0,
-				ARRAY_SIZE(__entry->s.ref_idx_l0),
-				sizeof(__entry->s.ref_idx_l0[0])),
-		  __print_array(__entry->s.ref_idx_l1,
-				ARRAY_SIZE(__entry->s.ref_idx_l1),
-				sizeof(__entry->s.ref_idx_l1[0])),
-		  __entry->s.short_term_ref_pic_set_size,
-		  __entry->s.long_term_ref_pic_set_size,
-		  __print_flags(__entry->s.flags, "|",
+		  __entry->bit_size,
+		  __entry->data_byte_offset,
+		  __entry->num_entry_point_offsets,
+		  __entry->nal_unit_type,
+		  __entry->nuh_temporal_id_plus1,
+		  __entry->slice_type,
+		  __entry->colour_plane_id,
+		  __entry->slice_pic_order_cnt,
+		  __entry->num_ref_idx_l0_active_minus1,
+		  __entry->num_ref_idx_l1_active_minus1,
+		  __entry->collocated_ref_idx,
+		  __entry->five_minus_max_num_merge_cand,
+		  __entry->slice_qp_delta,
+		  __entry->slice_cb_qp_offset,
+		  __entry->slice_cr_qp_offset,
+		  __entry->slice_act_y_qp_offset,
+		  __entry->slice_act_cb_qp_offset,
+		  __entry->slice_act_cr_qp_offset,
+		  __entry->slice_beta_offset_div2,
+		  __entry->slice_tc_offset_div2,
+		  __entry->pic_struct,
+		  __entry->slice_segment_addr,
+		  __print_array(__entry->ref_idx_l0,
+				ARRAY_SIZE(__entry->ref_idx_l0),
+				sizeof(__entry->ref_idx_l0[0])),
+		  __print_array(__entry->ref_idx_l1,
+				ARRAY_SIZE(__entry->ref_idx_l1),
+				sizeof(__entry->ref_idx_l1[0])),
+		  __entry->short_term_ref_pic_set_size,
+		  __entry->long_term_ref_pic_set_size,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA, "SLICE_SAO_LUMA"},
 		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA, "SLICE_SAO_CHROMA"},
-		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED, "SLICE_TEMPORAL_MVP_ENABLED"},
+		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED,
+		   "SLICE_TEMPORAL_MVP_ENABLED"},
 		  {V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO, "MVD_L1_ZERO"},
 		  {V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT, "CABAC_INIT"},
 		  {V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0, "COLLOCATED_FROM_L0"},
 		  {V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV, "USE_INTEGER_MV"},
-		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED, "SLICE_DEBLOCKING_FILTER_DISABLED"},
-		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED, "SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
+		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED,
+		   "SLICE_DEBLOCKING_FILTER_DISABLED"},
+		  {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED,
+		   "SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
 		  {V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT, "DEPENDENT_SLICE_SEGMENT"}
 
 	))
@@ -909,8 +1456,35 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
 	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_pred_weight_table, p)),
-	TP_fast_assign(__entry->p = *p),
+	TP_STRUCT__entry(__array(__s8, delta_luma_weight_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __array(__s8, luma_offset_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __array(__s8, delta_chroma_weight_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX * 2)
+			 __array(__s8, chroma_offset_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX * 2)
+			 __array(__s8, delta_luma_weight_l1, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __array(__s8, luma_offset_l1, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __array(__s8, delta_chroma_weight_l1, V4L2_HEVC_DPB_ENTRIES_NUM_MAX * 2)
+			 __array(__s8, chroma_offset_l1, V4L2_HEVC_DPB_ENTRIES_NUM_MAX * 2)
+			 __field(__u8, luma_log2_weight_denom)
+			 __field(__s8, delta_chroma_log2_weight_denom)),
+	TP_fast_assign(memcpy(__entry->delta_luma_weight_l0, p->delta_luma_weight_l0,
+			      sizeof(__entry->delta_luma_weight_l0));
+		       memcpy(__entry->luma_offset_l0, p->luma_offset_l0,
+			      sizeof(__entry->luma_offset_l0));
+		       memcpy(__entry->delta_chroma_weight_l0, p->delta_chroma_weight_l0,
+			      sizeof(__entry->delta_chroma_weight_l0));
+		       memcpy(__entry->chroma_offset_l0, p->chroma_offset_l0,
+			      sizeof(__entry->chroma_offset_l0));
+		       memcpy(__entry->delta_luma_weight_l1, p->delta_luma_weight_l1,
+			      sizeof(__entry->delta_luma_weight_l1));
+		       memcpy(__entry->luma_offset_l1, p->luma_offset_l1,
+			      sizeof(__entry->luma_offset_l1));
+		       memcpy(__entry->delta_chroma_weight_l1, p->delta_chroma_weight_l1,
+			      sizeof(__entry->delta_chroma_weight_l1));
+		       memcpy(__entry->chroma_offset_l1, p->chroma_offset_l1,
+			      sizeof(__entry->chroma_offset_l1));
+		       __entry->luma_log2_weight_denom = p->luma_log2_weight_denom;
+		       __entry->delta_chroma_log2_weight_denom =
+				p->delta_chroma_log2_weight_denom;),
 	TP_printk("\ndelta_luma_weight_l0 %s\n"
 		  "luma_offset_l0 %s\n"
 		  "delta_chroma_weight_l0 {%s}\n"
@@ -921,44 +1495,62 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 		  "chroma_offset_l1 {%s}\n"
 		  "luma_log2_weight_denom %d\n"
 		  "delta_chroma_log2_weight_denom %d\n",
-		  __print_array(__entry->p.delta_luma_weight_l0,
-				ARRAY_SIZE(__entry->p.delta_luma_weight_l0),
-				sizeof(__entry->p.delta_luma_weight_l0[0])),
-		  __print_array(__entry->p.luma_offset_l0,
-				ARRAY_SIZE(__entry->p.luma_offset_l0),
-				sizeof(__entry->p.luma_offset_l0[0])),
+		  __print_array(__entry->delta_luma_weight_l0,
+				ARRAY_SIZE(__entry->delta_luma_weight_l0),
+				sizeof(__entry->delta_luma_weight_l0[0])),
+		  __print_array(__entry->luma_offset_l0,
+				ARRAY_SIZE(__entry->luma_offset_l0),
+				sizeof(__entry->luma_offset_l0[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.delta_chroma_weight_l0,
-				   sizeof(__entry->p.delta_chroma_weight_l0),
+				   __entry->delta_chroma_weight_l0,
+				   sizeof(__entry->delta_chroma_weight_l0),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.chroma_offset_l0,
-				   sizeof(__entry->p.chroma_offset_l0),
+				   __entry->chroma_offset_l0,
+				   sizeof(__entry->chroma_offset_l0),
 				   false),
-		  __print_array(__entry->p.delta_luma_weight_l1,
-				ARRAY_SIZE(__entry->p.delta_luma_weight_l1),
-				sizeof(__entry->p.delta_luma_weight_l1[0])),
-		  __print_array(__entry->p.luma_offset_l1,
-				ARRAY_SIZE(__entry->p.luma_offset_l1),
-				sizeof(__entry->p.luma_offset_l1[0])),
+		  __print_array(__entry->delta_luma_weight_l1,
+				ARRAY_SIZE(__entry->delta_luma_weight_l1),
+				sizeof(__entry->delta_luma_weight_l1[0])),
+		  __print_array(__entry->luma_offset_l1,
+				ARRAY_SIZE(__entry->luma_offset_l1),
+				sizeof(__entry->luma_offset_l1[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.delta_chroma_weight_l1,
-				   sizeof(__entry->p.delta_chroma_weight_l1),
+				   __entry->delta_chroma_weight_l1,
+				   sizeof(__entry->delta_chroma_weight_l1),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.chroma_offset_l1,
-				   sizeof(__entry->p.chroma_offset_l1),
+				   __entry->chroma_offset_l1,
+				   sizeof(__entry->chroma_offset_l1),
 				   false),
-		__entry->p.luma_log2_weight_denom,
-		__entry->p.delta_chroma_log2_weight_denom
+		__entry->luma_log2_weight_denom,
+		__entry->delta_chroma_log2_weight_denom
 
 	))
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s)),
-	TP_fast_assign(__entry->s = *s),
+	TP_STRUCT__entry(__array(__u8, scaling_list_4x4, 6 * 16)
+			 __array(__u8, scaling_list_8x8, 6 * 64)
+			 __array(__u8, scaling_list_16x16, 6 * 64)
+			 __array(__u8, scaling_list_32x32, 2 * 64)
+			 __array(__u8, scaling_list_dc_coef_16x16, 6)
+			 __array(__u8, scaling_list_dc_coef_32x32, 2)),
+	TP_fast_assign(memcpy(__entry->scaling_list_4x4,
+			      s->scaling_list_4x4, sizeof(__entry->scaling_list_4x4));
+		       memcpy(__entry->scaling_list_8x8,
+			      s->scaling_list_8x8, sizeof(__entry->scaling_list_8x8));
+		       memcpy(__entry->scaling_list_16x16,
+			      s->scaling_list_16x16, sizeof(__entry->scaling_list_16x16));
+		       memcpy(__entry->scaling_list_32x32,
+			      s->scaling_list_32x32, sizeof(__entry->scaling_list_32x32));
+		       memcpy(__entry->scaling_list_dc_coef_16x16,
+			      s->scaling_list_dc_coef_16x16,
+			      sizeof(__entry->scaling_list_dc_coef_16x16));
+		       memcpy(__entry->scaling_list_dc_coef_32x32,
+			      s->scaling_list_dc_coef_32x32,
+			      sizeof(__entry->scaling_list_dc_coef_32x32));),
 	TP_printk("\nscaling_list_4x4 {%s}\n"
 		  "scaling_list_8x8 {%s}\n"
 		  "scaling_list_16x16 {%s}\n"
@@ -966,34 +1558,56 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
 		  "scaling_list_dc_coef_16x16 %s\n"
 		  "scaling_list_dc_coef_32x32 %s\n",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->s.scaling_list_4x4,
-				   sizeof(__entry->s.scaling_list_4x4),
+				   __entry->scaling_list_4x4,
+				   sizeof(__entry->scaling_list_4x4),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->s.scaling_list_8x8,
-				   sizeof(__entry->s.scaling_list_8x8),
+				   __entry->scaling_list_8x8,
+				   sizeof(__entry->scaling_list_8x8),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->s.scaling_list_16x16,
-				   sizeof(__entry->s.scaling_list_16x16),
+				   __entry->scaling_list_16x16,
+				   sizeof(__entry->scaling_list_16x16),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->s.scaling_list_32x32,
-				   sizeof(__entry->s.scaling_list_32x32),
+				   __entry->scaling_list_32x32,
+				   sizeof(__entry->scaling_list_32x32),
 				   false),
-		  __print_array(__entry->s.scaling_list_dc_coef_16x16,
-				ARRAY_SIZE(__entry->s.scaling_list_dc_coef_16x16),
-				sizeof(__entry->s.scaling_list_dc_coef_16x16[0])),
-		  __print_array(__entry->s.scaling_list_dc_coef_32x32,
-				ARRAY_SIZE(__entry->s.scaling_list_dc_coef_32x32),
-				sizeof(__entry->s.scaling_list_dc_coef_32x32[0]))
+		  __print_array(__entry->scaling_list_dc_coef_16x16,
+				ARRAY_SIZE(__entry->scaling_list_dc_coef_16x16),
+				sizeof(__entry->scaling_list_dc_coef_16x16[0])),
+		  __print_array(__entry->scaling_list_dc_coef_32x32,
+				ARRAY_SIZE(__entry->scaling_list_dc_coef_32x32),
+				sizeof(__entry->scaling_list_dc_coef_32x32[0]))
 	))
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
 	TP_ARGS(d),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_decode_params, d)),
-	TP_fast_assign(__entry->d = *d),
+	TP_STRUCT__entry(__field(__s32, pic_order_cnt_val)
+			 __field(__u16, short_term_ref_pic_set_size)
+			 __field(__u16, long_term_ref_pic_set_size)
+			 __field(__u8, num_active_dpb_entries)
+			 __field(__u8, num_poc_st_curr_before)
+			 __field(__u8, num_poc_st_curr_after)
+			 __field(__u8, num_poc_lt_curr)
+			 __array(__u8, poc_st_curr_before, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __array(__u8, poc_st_curr_after, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __array(__u8, poc_lt_curr, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			 __field(__u64, flags)),
+	TP_fast_assign(__entry->pic_order_cnt_val = d->pic_order_cnt_val;
+		       __entry->short_term_ref_pic_set_size = d->short_term_ref_pic_set_size;
+		       __entry->long_term_ref_pic_set_size = d->long_term_ref_pic_set_size;
+		       __entry->num_active_dpb_entries = d->num_active_dpb_entries;
+		       __entry->num_poc_st_curr_before = d->num_poc_st_curr_before;
+		       __entry->num_poc_st_curr_after = d->num_poc_st_curr_after;
+		       __entry->num_poc_lt_curr = d->num_poc_lt_curr;
+		       memcpy(__entry->poc_st_curr_before, d->poc_st_curr_before,
+			      sizeof(__entry->poc_st_curr_before));
+		       memcpy(__entry->poc_st_curr_after, d->poc_st_curr_after,
+			      sizeof(__entry->poc_st_curr_after));
+		       memcpy(__entry->poc_lt_curr, d->poc_lt_curr, sizeof(__entry->poc_lt_curr));
+		       __entry->flags = d->flags;),
 	TP_printk("\npic_order_cnt_val %d\n"
 		  "short_term_ref_pic_set_size %u\n"
 		  "long_term_ref_pic_set_size %u\n"
@@ -1005,23 +1619,23 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 		  "poc_st_curr_after %s\n"
 		  "poc_lt_curr %s\n"
 		  "flags %s",
-		  __entry->d.pic_order_cnt_val,
-		  __entry->d.short_term_ref_pic_set_size,
-		  __entry->d.long_term_ref_pic_set_size,
-		  __entry->d.num_active_dpb_entries,
-		  __entry->d.num_poc_st_curr_before,
-		  __entry->d.num_poc_st_curr_after,
-		  __entry->d.num_poc_lt_curr,
-		  __print_array(__entry->d.poc_st_curr_before,
-				ARRAY_SIZE(__entry->d.poc_st_curr_before),
-				sizeof(__entry->d.poc_st_curr_before[0])),
-		  __print_array(__entry->d.poc_st_curr_after,
-				ARRAY_SIZE(__entry->d.poc_st_curr_after),
-				sizeof(__entry->d.poc_st_curr_after[0])),
-		  __print_array(__entry->d.poc_lt_curr,
-				ARRAY_SIZE(__entry->d.poc_lt_curr),
-				sizeof(__entry->d.poc_lt_curr[0])),
-		  __print_flags(__entry->d.flags, "|",
+		  __entry->pic_order_cnt_val,
+		  __entry->short_term_ref_pic_set_size,
+		  __entry->long_term_ref_pic_set_size,
+		  __entry->num_active_dpb_entries,
+		  __entry->num_poc_st_curr_before,
+		  __entry->num_poc_st_curr_after,
+		  __entry->num_poc_lt_curr,
+		  __print_array(__entry->poc_st_curr_before,
+				ARRAY_SIZE(__entry->poc_st_curr_before),
+				sizeof(__entry->poc_st_curr_before[0])),
+		  __print_array(__entry->poc_st_curr_after,
+				ARRAY_SIZE(__entry->poc_st_curr_after),
+				sizeof(__entry->poc_st_curr_after[0])),
+		  __print_array(__entry->poc_lt_curr,
+				ARRAY_SIZE(__entry->poc_lt_curr),
+				sizeof(__entry->poc_lt_curr[0])),
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC, "IRAP_PIC"},
 		  {V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC, "IDR_PIC"},
 		  {V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR, "NO_OUTPUT_OF_PRIOR"}
@@ -1031,22 +1645,44 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
 	TP_ARGS(lt),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, lt)),
-	TP_fast_assign(__entry->lt = *lt),
+	TP_STRUCT__entry(__field(__u8, flags)
+			 __field(__u32, lt_ref_pic_poc_lsb_sps)),
+	TP_fast_assign(__entry->flags = lt->flags;
+		       __entry->lt_ref_pic_poc_lsb_sps = lt->lt_ref_pic_poc_lsb_sps;),
 	TP_printk("\nflags %s\n"
 		  "lt_ref_pic_poc_lsb_sps %x\n",
-		  __print_flags(__entry->lt.flags, "|",
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
 		  ),
-		  __entry->lt.lt_ref_pic_poc_lsb_sps
+		  __entry->lt_ref_pic_poc_lsb_sps
 	)
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
 	TP_ARGS(st),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, st)),
-	TP_fast_assign(__entry->st = *st),
+	TP_STRUCT__entry(__field(__u8, flags)
+			 __field(__u8, delta_idx_minus1)
+			 __field(__u8, delta_rps_sign)
+			 __field(__u16, abs_delta_rps_minus1)
+			 __field(__u8, num_negative_pics)
+			 __field(__u8, num_positive_pics)
+			 __field(__u32, used_by_curr_pic)
+			 __field(__u32, use_delta_flag)
+			 __array(__u32, delta_poc_s0_minus1, 16)
+			 __array(__u32, delta_poc_s1_minus1, 16)),
+	TP_fast_assign(__entry->flags = st->flags;
+		       __entry->delta_idx_minus1 = st->delta_idx_minus1;
+		       __entry->delta_rps_sign = st->delta_rps_sign;
+		       __entry->abs_delta_rps_minus1 = st->abs_delta_rps_minus1;
+		       __entry->num_negative_pics = st->num_negative_pics;
+		       __entry->num_positive_pics = st->num_positive_pics;
+		       __entry->used_by_curr_pic = st->used_by_curr_pic;
+		       __entry->use_delta_flag = st->use_delta_flag;
+		       memcpy(__entry->delta_poc_s0_minus1, st->delta_poc_s0_minus1,
+			      sizeof(__entry->delta_poc_s0_minus1));
+		       memcpy(__entry->delta_poc_s1_minus1, st->delta_poc_s1_minus1,
+			      sizeof(__entry->delta_poc_s1_minus1));),
 	TP_printk("\nflags %s\n"
 		  "delta_idx_minus1: %u\n"
 		  "delta_rps_sign: %u\n"
@@ -1057,40 +1693,46 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 		  "use_delta_flag: %08x\n"
 		  "delta_poc_s0_minus1: %s\n"
 		  "delta_poc_s1_minus1: %s\n",
-		  __print_flags(__entry->st.flags, "|",
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_REF_PIC_SET_PRED"}
 		  ),
-		  __entry->st.delta_idx_minus1,
-		  __entry->st.delta_rps_sign,
-		  __entry->st.abs_delta_rps_minus1,
-		  __entry->st.num_negative_pics,
-		  __entry->st.num_positive_pics,
-		  __entry->st.used_by_curr_pic,
-		  __entry->st.use_delta_flag,
-		  __print_array(__entry->st.delta_poc_s0_minus1,
-				ARRAY_SIZE(__entry->st.delta_poc_s0_minus1),
-				sizeof(__entry->st.delta_poc_s0_minus1[0])),
-		  __print_array(__entry->st.delta_poc_s1_minus1,
-				ARRAY_SIZE(__entry->st.delta_poc_s1_minus1),
-				sizeof(__entry->st.delta_poc_s1_minus1[0]))
+		  __entry->delta_idx_minus1,
+		  __entry->delta_rps_sign,
+		  __entry->abs_delta_rps_minus1,
+		  __entry->num_negative_pics,
+		  __entry->num_positive_pics,
+		  __entry->used_by_curr_pic,
+		  __entry->use_delta_flag,
+		  __print_array(__entry->delta_poc_s0_minus1,
+				ARRAY_SIZE(__entry->delta_poc_s0_minus1),
+				sizeof(__entry->delta_poc_s0_minus1[0])),
+		  __print_array(__entry->delta_poc_s1_minus1,
+				ARRAY_SIZE(__entry->delta_poc_s1_minus1),
+				sizeof(__entry->delta_poc_s1_minus1[0]))
 	)
 );
 
 DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
 	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
 	TP_ARGS(e),
-	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_dpb_entry, e)),
-	TP_fast_assign(__entry->e = *e),
+	TP_STRUCT__entry(__field(__u64, timestamp)
+			 __field(__u8, flags)
+			 __field(__u8, field_pic)
+			 __field(__s32, pic_order_cnt_val)),
+	TP_fast_assign(__entry->timestamp = e->timestamp;
+		       __entry->flags = e->flags;
+		       __entry->field_pic = e->field_pic;
+		       __entry->pic_order_cnt_val = e->pic_order_cnt_val;),
 	TP_printk("\ntimestamp %llu\n"
 		  "flags %s\n"
 		  "field_pic %u\n"
 		  "pic_order_cnt_val %d\n",
-		__entry->e.timestamp,
-		__print_flags(__entry->e.flags, "|",
+		__entry->timestamp,
+		__print_flags(__entry->flags, "|",
 		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE, "LONG_TERM_REFERENCE"}
 		  ),
-		__entry->e.field_pic,
-		__entry->e.pic_order_cnt_val
+		__entry->field_pic,
+		__entry->pic_order_cnt_val
 	))
 
 DEFINE_EVENT(v4l2_ctrl_hevc_sps_tmpl, v4l2_ctrl_hevc_sps,
@@ -1143,16 +1785,26 @@ DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
 	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
-	TP_fast_assign(__entry->s = *s;),
+	TP_STRUCT__entry(__field(__u16, horizontal_size)
+			 __field(__u16, vertical_size)
+			 __field(__u32, vbv_buffer_size)
+			 __field(__u16, profile_and_level_indication)
+			 __field(__u8, chroma_format)
+			 __field(__u8, flags)),
+	TP_fast_assign(__entry->horizontal_size = s->horizontal_size;
+		       __entry->vertical_size = s->vertical_size;
+		       __entry->vbv_buffer_size = s->vbv_buffer_size;
+		       __entry->profile_and_level_indication = s->profile_and_level_indication;
+		       __entry->chroma_format = s->chroma_format;
+		       __entry->flags = s->flags;),
 	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n"
 		  "profile_and_level_indication %u\nchroma_format %u\nflags %s\n",
-		  __entry->s.horizontal_size,
-		  __entry->s.vertical_size,
-		  __entry->s.vbv_buffer_size,
-		  __entry->s.profile_and_level_indication,
-		  __entry->s.chroma_format,
-		  __print_flags(__entry->s.flags, "|",
+		  __entry->horizontal_size,
+		  __entry->vertical_size,
+		  __entry->vbv_buffer_size,
+		  __entry->profile_and_level_indication,
+		  __entry->chroma_format,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE, "PROGRESSIVE"})
 	)
 );
@@ -1160,13 +1812,25 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
 	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
-	TP_fast_assign(__entry->p = *p;),
+	TP_STRUCT__entry(__field(__u64, backward_ref_ts)
+			 __field(__u64, forward_ref_ts)
+			 __field(__u32, flags)
+			 __array(__u8, f_code, 4)
+			 __field(__u8, picture_coding_type)
+			 __field(__u8, picture_structure)
+			 __field(__u8, intra_dc_precision)),
+	TP_fast_assign(__entry->backward_ref_ts = p->backward_ref_ts;
+		       __entry->forward_ref_ts = p->forward_ref_ts;
+		       __entry->flags = p->flags;
+		       memcpy(__entry->f_code, p->f_code, sizeof(__entry->f_code));
+		       __entry->picture_coding_type = p->picture_coding_type;
+		       __entry->picture_structure = p->picture_structure;
+		       __entry->intra_dc_precision = p->intra_dc_precision;),
 	TP_printk("\nbackward_ref_ts %llu\nforward_ref_ts %llu\nflags %s\nf_code {%s}\n"
 		  "picture_coding_type: %u\npicture_structure %u\nintra_dc_precision %u\n",
-		  __entry->p.backward_ref_ts,
-		  __entry->p.forward_ref_ts,
-		  __print_flags(__entry->p.flags, "|",
+		  __entry->backward_ref_ts,
+		  __entry->forward_ref_ts,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST, "TOP_FIELD_FIRST"},
 		  {V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT, "FRAME_PRED_DCT"},
 		  {V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV, "CONCEALMENT_MV"},
@@ -1176,34 +1840,46 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
 		  {V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST, "REPEAT_FIRST"},
 		  {V4L2_MPEG2_PIC_FLAG_PROGRESSIVE, "PROGRESSIVE"}),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.f_code,
-				   sizeof(__entry->p.f_code),
+				   __entry->f_code,
+				   sizeof(__entry->f_code),
 				   false),
-		  __entry->p.picture_coding_type,
-		  __entry->p.picture_structure,
-		  __entry->p.intra_dc_precision
+		  __entry->picture_coding_type,
+		  __entry->picture_structure,
+		  __entry->intra_dc_precision
 	)
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
 	TP_ARGS(q),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)),
-	TP_fast_assign(__entry->q = *q;),
+	TP_STRUCT__entry(__array(__u8, intra_quantiser_matrix, 64)
+			 __array(__u8, non_intra_quantiser_matrix, 64)
+			 __array(__u8, chroma_intra_quantiser_matrix, 64)
+			 __array(__u8, chroma_non_intra_quantiser_matrix, 64)),
+	TP_fast_assign(memcpy(__entry->intra_quantiser_matrix, q->intra_quantiser_matrix,
+			      sizeof(__entry->intra_quantiser_matrix));
+		       memcpy(__entry->non_intra_quantiser_matrix, q->non_intra_quantiser_matrix,
+			      sizeof(__entry->non_intra_quantiser_matrix));
+		       memcpy(__entry->chroma_intra_quantiser_matrix,
+			      q->chroma_intra_quantiser_matrix,
+			      sizeof(__entry->chroma_intra_quantiser_matrix));
+		       memcpy(__entry->chroma_non_intra_quantiser_matrix,
+			      q->chroma_non_intra_quantiser_matrix,
+			      sizeof(__entry->chroma_non_intra_quantiser_matrix));),
 	TP_printk("\nintra_quantiser_matrix %s\nnon_intra_quantiser_matrix %s\n"
 		  "chroma_intra_quantiser_matrix %s\nchroma_non_intra_quantiser_matrix %s\n",
-		  __print_array(__entry->q.intra_quantiser_matrix,
-				ARRAY_SIZE(__entry->q.intra_quantiser_matrix),
-				sizeof(__entry->q.intra_quantiser_matrix[0])),
-		  __print_array(__entry->q.non_intra_quantiser_matrix,
-				ARRAY_SIZE(__entry->q.non_intra_quantiser_matrix),
-				sizeof(__entry->q.non_intra_quantiser_matrix[0])),
-		  __print_array(__entry->q.chroma_intra_quantiser_matrix,
-				ARRAY_SIZE(__entry->q.chroma_intra_quantiser_matrix),
-				sizeof(__entry->q.chroma_intra_quantiser_matrix[0])),
-		  __print_array(__entry->q.chroma_non_intra_quantiser_matrix,
-				ARRAY_SIZE(__entry->q.chroma_non_intra_quantiser_matrix),
-				sizeof(__entry->q.chroma_non_intra_quantiser_matrix[0]))
+		  __print_array(__entry->intra_quantiser_matrix,
+				ARRAY_SIZE(__entry->intra_quantiser_matrix),
+				sizeof(__entry->intra_quantiser_matrix[0])),
+		  __print_array(__entry->non_intra_quantiser_matrix,
+				ARRAY_SIZE(__entry->non_intra_quantiser_matrix),
+				sizeof(__entry->non_intra_quantiser_matrix[0])),
+		  __print_array(__entry->chroma_intra_quantiser_matrix,
+				ARRAY_SIZE(__entry->chroma_intra_quantiser_matrix),
+				sizeof(__entry->chroma_intra_quantiser_matrix[0])),
+		  __print_array(__entry->chroma_non_intra_quantiser_matrix,
+				ARRAY_SIZE(__entry->chroma_non_intra_quantiser_matrix),
+				sizeof(__entry->chroma_non_intra_quantiser_matrix[0]))
 		  )
 )
 
@@ -1227,25 +1903,35 @@ DEFINE_EVENT(v4l2_ctrl_mpeg2_quant_tmpl, v4l2_ctrl_mpeg2_quantisation,
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
 	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
+	TP_STRUCT__entry(__array(__u8, entropy_coeff_probs, 4 * 8 * 3 * V4L2_VP8_COEFF_PROB_CNT)
+			 __array(__u8, entropy_y_mode_probs, 4)
+			 __array(__u8, entropy_uv_mode_probs, 3)
+			 __array(__u8, entropy_mv_probs, 2 * 19)),
+	TP_fast_assign(memcpy(__entry->entropy_coeff_probs, f->entropy.coeff_probs,
+			      sizeof(__entry->entropy_coeff_probs));
+		       memcpy(__entry->entropy_y_mode_probs, f->entropy.y_mode_probs,
+			      sizeof(__entry->entropy_y_mode_probs));
+		       memcpy(__entry->entropy_uv_mode_probs, f->entropy.uv_mode_probs,
+			      sizeof(__entry->entropy_uv_mode_probs));
+		       memcpy(__entry->entropy_mv_probs, f->entropy.mv_probs,
+			      sizeof(__entry->entropy_mv_probs));),
 	TP_printk("\nentropy.coeff_probs {%s}\n"
 		  "entropy.y_mode_probs %s\n"
 		  "entropy.uv_mode_probs %s\n"
 		  "entropy.mv_probs {%s}",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->f.entropy.coeff_probs,
-				   sizeof(__entry->f.entropy.coeff_probs),
+				   __entry->entropy_coeff_probs,
+				   sizeof(__entry->entropy_coeff_probs),
 				   false),
-		  __print_array(__entry->f.entropy.y_mode_probs,
-				ARRAY_SIZE(__entry->f.entropy.y_mode_probs),
-				sizeof(__entry->f.entropy.y_mode_probs[0])),
-		  __print_array(__entry->f.entropy.uv_mode_probs,
-				ARRAY_SIZE(__entry->f.entropy.uv_mode_probs),
-				sizeof(__entry->f.entropy.uv_mode_probs[0])),
+		  __print_array(__entry->entropy_y_mode_probs,
+				ARRAY_SIZE(__entry->entropy_y_mode_probs),
+				sizeof(__entry->entropy_y_mode_probs[0])),
+		  __print_array(__entry->entropy_uv_mode_probs,
+				ARRAY_SIZE(__entry->entropy_uv_mode_probs),
+				sizeof(__entry->entropy_uv_mode_probs[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->f.entropy.mv_probs,
-				   sizeof(__entry->f.entropy.mv_probs),
+				   __entry->entropy_mv_probs,
+				   sizeof(__entry->entropy_mv_probs),
 				   false)
 		  )
 )
@@ -1253,8 +1939,82 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
 	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
+	TP_STRUCT__entry(__array(__s8, segment_quant_update, 4)
+			 __array(__s8, segment_lf_update, 4)
+			 __array(__u8, segment_segment_probs, 3)
+			 __field(__u32, segment_flags)
+			 __array(__s8, lf_ref_frm_delta, 4)
+			 __array(__s8, lf_mb_mode_delta, 4)
+			 __field(__u8, lf_sharpness_level)
+			 __field(__u8, lf_level)
+			 __field(__u32, lf_flags)
+			 __field(__u8, quant_y_ac_qi)
+			 __field(__s8, quant_y_dc_delta)
+			 __field(__s8, quant_y2_dc_delta)
+			 __field(__s8, quant_y2_ac_delta)
+			 __field(__s8, quant_uv_dc_delta)
+			 __field(__s8, quant_uv_ac_delta)
+			 __field(__u8, coder_state_range)
+			 __field(__u8, coder_state_value)
+			 __field(__u8, coder_state_bit_count)
+			 __field(__u16, width)
+			 __field(__u16, height)
+			 __field(__u8, horizontal_scale)
+			 __field(__u8, vertical_scale)
+			 __field(__u8, version)
+			 __field(__u8, prob_skip_false)
+			 __field(__u8, prob_intra)
+			 __field(__u8, prob_last)
+			 __field(__u8, prob_gf)
+			 __field(__u8, num_dct_parts)
+			 __field(__u32, first_part_size)
+			 __field(__u32, first_part_header_bits)
+			 __array(__u32, dct_part_sizes, 8)
+			 __field(__u64, last_frame_ts)
+			 __field(__u64, golden_frame_ts)
+			 __field(__u64, alt_frame_ts)
+			 __field(__u64, flags)),
+	TP_fast_assign(memcpy(__entry->segment_quant_update, f->segment.quant_update,
+			      sizeof(__entry->segment_quant_update));
+		       memcpy(__entry->segment_lf_update, f->segment.lf_update,
+			      sizeof(__entry->segment_lf_update));
+		       memcpy(__entry->segment_segment_probs, f->segment.segment_probs,
+			      sizeof(__entry->segment_segment_probs));
+		       __entry->segment_flags = f->segment.flags;
+		       memcpy(__entry->lf_ref_frm_delta, f->lf.ref_frm_delta,
+			      sizeof(__entry->lf_ref_frm_delta));
+		       memcpy(__entry->lf_mb_mode_delta, f->lf.mb_mode_delta,
+			      sizeof(__entry->lf_mb_mode_delta));
+		       __entry->lf_sharpness_level = f->lf.sharpness_level;
+		       __entry->lf_level = f->lf.level;
+		       __entry->lf_flags = f->lf.flags;
+		       __entry->quant_y_ac_qi = f->quant.y_ac_qi;
+		       __entry->quant_y_dc_delta = f->quant.y_dc_delta;
+		       __entry->quant_y2_dc_delta = f->quant.y2_dc_delta;
+		       __entry->quant_y2_ac_delta = f->quant.y2_ac_delta;
+		       __entry->quant_uv_dc_delta = f->quant.uv_dc_delta;
+		       __entry->quant_uv_ac_delta = f->quant.uv_ac_delta;
+		       __entry->coder_state_range = f->coder_state.range;
+		       __entry->coder_state_value = f->coder_state.value;
+		       __entry->coder_state_bit_count = f->coder_state.bit_count;
+		       __entry->width = f->width;
+		       __entry->height = f->height;
+		       __entry->horizontal_scale = f->horizontal_scale;
+		       __entry->vertical_scale = f->vertical_scale;
+		       __entry->version = f->version;
+		       __entry->prob_skip_false = f->prob_skip_false;
+		       __entry->prob_intra = f->prob_intra;
+		       __entry->prob_last = f->prob_last;
+		       __entry->prob_gf = f->prob_gf;
+		       __entry->num_dct_parts = f->num_dct_parts;
+		       __entry->first_part_size = f->first_part_size;
+		       __entry->first_part_header_bits = f->first_part_header_bits;
+		       memcpy(__entry->dct_part_sizes, f->dct_part_sizes,
+			      sizeof(__entry->dct_part_sizes));
+		       __entry->last_frame_ts = f->last_frame_ts;
+		       __entry->golden_frame_ts = f->golden_frame_ts;
+		       __entry->alt_frame_ts = f->alt_frame_ts;
+		       __entry->flags = f->flags;),
 	TP_printk("\nsegment.quant_update %s\n"
 		  "segment.lf_update %s\n"
 		  "segment.segment_probs %s\n"
@@ -1290,60 +2050,60 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 		  "golden_frame_ts %llu\n"
 		  "alt_frame_ts %llu\n"
 		  "flags %s",
-		  __print_array(__entry->f.segment.quant_update,
-				ARRAY_SIZE(__entry->f.segment.quant_update),
-				sizeof(__entry->f.segment.quant_update[0])),
-		  __print_array(__entry->f.segment.lf_update,
-				ARRAY_SIZE(__entry->f.segment.lf_update),
-				sizeof(__entry->f.segment.lf_update[0])),
-		  __print_array(__entry->f.segment.segment_probs,
-				ARRAY_SIZE(__entry->f.segment.segment_probs),
-				sizeof(__entry->f.segment.segment_probs[0])),
-		  __print_flags(__entry->f.segment.flags, "|",
+		  __print_array(__entry->segment_quant_update,
+				ARRAY_SIZE(__entry->segment_quant_update),
+				sizeof(__entry->segment_quant_update[0])),
+		  __print_array(__entry->segment_lf_update,
+				ARRAY_SIZE(__entry->segment_lf_update),
+				sizeof(__entry->segment_lf_update[0])),
+		  __print_array(__entry->segment_segment_probs,
+				ARRAY_SIZE(__entry->segment_segment_probs),
+				sizeof(__entry->segment_segment_probs[0])),
+		  __print_flags(__entry->segment_flags, "|",
 		  {V4L2_VP8_SEGMENT_FLAG_ENABLED, "SEGMENT_ENABLED"},
 		  {V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP, "SEGMENT_UPDATE_MAP"},
 		  {V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA, "SEGMENT_UPDATE_FEATURE_DATA"},
 		  {V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE, "SEGMENT_DELTA_VALUE_MODE"}),
-		  __print_array(__entry->f.lf.ref_frm_delta,
-				ARRAY_SIZE(__entry->f.lf.ref_frm_delta),
-				sizeof(__entry->f.lf.ref_frm_delta[0])),
-		  __print_array(__entry->f.lf.mb_mode_delta,
-				ARRAY_SIZE(__entry->f.lf.mb_mode_delta),
-				sizeof(__entry->f.lf.mb_mode_delta[0])),
-		  __entry->f.lf.sharpness_level,
-		  __entry->f.lf.level,
-		  __print_flags(__entry->f.lf.flags, "|",
+		  __print_array(__entry->lf_ref_frm_delta,
+				ARRAY_SIZE(__entry->lf_ref_frm_delta),
+				sizeof(__entry->lf_ref_frm_delta[0])),
+		  __print_array(__entry->lf_mb_mode_delta,
+				ARRAY_SIZE(__entry->lf_mb_mode_delta),
+				sizeof(__entry->lf_mb_mode_delta[0])),
+		  __entry->lf_sharpness_level,
+		  __entry->lf_level,
+		  __print_flags(__entry->lf_flags, "|",
 		  {V4L2_VP8_LF_ADJ_ENABLE, "LF_ADJ_ENABLED"},
 		  {V4L2_VP8_LF_DELTA_UPDATE, "LF_DELTA_UPDATE"},
 		  {V4L2_VP8_LF_FILTER_TYPE_SIMPLE, "LF_FILTER_TYPE_SIMPLE"}),
-		  __entry->f.quant.y_ac_qi,
-		  __entry->f.quant.y_dc_delta,
-		  __entry->f.quant.y2_dc_delta,
-		  __entry->f.quant.y2_ac_delta,
-		  __entry->f.quant.uv_dc_delta,
-		  __entry->f.quant.uv_ac_delta,
-		  __entry->f.coder_state.range,
-		  __entry->f.coder_state.value,
-		  __entry->f.coder_state.bit_count,
-		  __entry->f.width,
-		  __entry->f.height,
-		  __entry->f.horizontal_scale,
-		  __entry->f.vertical_scale,
-		  __entry->f.version,
-		  __entry->f.prob_skip_false,
-		  __entry->f.prob_intra,
-		  __entry->f.prob_last,
-		  __entry->f.prob_gf,
-		  __entry->f.num_dct_parts,
-		  __entry->f.first_part_size,
-		  __entry->f.first_part_header_bits,
-		  __print_array(__entry->f.dct_part_sizes,
-				ARRAY_SIZE(__entry->f.dct_part_sizes),
-				sizeof(__entry->f.dct_part_sizes[0])),
-		  __entry->f.last_frame_ts,
-		  __entry->f.golden_frame_ts,
-		  __entry->f.alt_frame_ts,
-		  __print_flags(__entry->f.flags, "|",
+		  __entry->quant_y_ac_qi,
+		  __entry->quant_y_dc_delta,
+		  __entry->quant_y2_dc_delta,
+		  __entry->quant_y2_ac_delta,
+		  __entry->quant_uv_dc_delta,
+		  __entry->quant_uv_ac_delta,
+		  __entry->coder_state_range,
+		  __entry->coder_state_value,
+		  __entry->coder_state_bit_count,
+		  __entry->width,
+		  __entry->height,
+		  __entry->horizontal_scale,
+		  __entry->vertical_scale,
+		  __entry->version,
+		  __entry->prob_skip_false,
+		  __entry->prob_intra,
+		  __entry->prob_last,
+		  __entry->prob_gf,
+		  __entry->num_dct_parts,
+		  __entry->first_part_size,
+		  __entry->first_part_header_bits,
+		  __print_array(__entry->dct_part_sizes,
+				ARRAY_SIZE(__entry->dct_part_sizes),
+				sizeof(__entry->dct_part_sizes[0])),
+		  __entry->last_frame_ts,
+		  __entry->golden_frame_ts,
+		  __entry->alt_frame_ts,
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_VP8_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
 		  {V4L2_VP8_FRAME_FLAG_EXPERIMENTAL, "EXPERIMENTAL"},
 		  {V4L2_VP8_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
@@ -1368,8 +2128,78 @@ DEFINE_EVENT(v4l2_ctrl_vp8_entropy_tmpl, v4l2_ctrl_vp8_entropy,
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
 	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
+	TP_STRUCT__entry(__array(__s8, lf_ref_deltas, 4)
+			 __array(__s8, lf_mode_deltas, 2)
+			 __field(__u8, lf_level)
+			 __field(__u8, lf_sharpness)
+			 __field(__u8, lf_flags)
+			 __field(__u8, quant_base_q_idx)
+			 __field(__s8, quant_delta_q_y_dc)
+			 __field(__s8, quant_delta_q_uv_dc)
+			 __field(__s8, quant_delta_q_uv_ac)
+			 __array(__u8, seg_feature_data, sizeof(__s16) * 8 * 4)
+			 __array(__u8, seg_feature_enabled, 8)
+			 __array(__u8, seg_tree_probs, 7)
+			 __array(__u8, seg_pred_probs, 3)
+			 __field(__u8, seg_flags)
+			 __field(__u32, flags)
+			 __field(__u16, compressed_header_size)
+			 __field(__u16, uncompressed_header_size)
+			 __field(__u16, frame_width_minus_1)
+			 __field(__u16, frame_height_minus_1)
+			 __field(__u16, render_width_minus_1)
+			 __field(__u16, render_height_minus_1)
+			 __field(__u64, last_frame_ts)
+			 __field(__u64, golden_frame_ts)
+			 __field(__u64, alt_frame_ts)
+			 __field(__u8, ref_frame_sign_bias)
+			 __field(__u8, reset_frame_context)
+			 __field(__u8, frame_context_idx)
+			 __field(__u8, profile)
+			 __field(__u8, bit_depth)
+			 __field(__u8, interpolation_filter)
+			 __field(__u8, tile_cols_log2)
+			 __field(__u8, tile_rows_log2)
+			 __field(__u8, reference_mode)),
+	TP_fast_assign(memcpy(__entry->lf_ref_deltas, f->lf.ref_deltas,
+			      sizeof(__entry->lf_ref_deltas));
+		       memcpy(__entry->lf_mode_deltas, f->lf.mode_deltas,
+			      sizeof(__entry->lf_mode_deltas));
+		       __entry->lf_level = f->lf.level;
+		       __entry->lf_sharpness = f->lf.sharpness;
+		       __entry->lf_flags = f->lf.flags;
+		       __entry->quant_base_q_idx = f->quant.base_q_idx;
+		       __entry->quant_delta_q_y_dc = f->quant.delta_q_y_dc;
+		       __entry->quant_delta_q_uv_dc = f->quant.delta_q_uv_dc;
+		       __entry->quant_delta_q_uv_ac = f->quant.delta_q_uv_ac;
+		       memcpy(__entry->seg_feature_data, f->seg.feature_data,
+			      sizeof(__entry->seg_feature_data));
+		       memcpy(__entry->seg_feature_enabled, f->seg.feature_enabled,
+			      sizeof(__entry->seg_feature_enabled));
+		       memcpy(__entry->seg_tree_probs, f->seg.tree_probs,
+			      sizeof(__entry->seg_tree_probs));
+		       memcpy(__entry->seg_pred_probs, f->seg.pred_probs,
+			      sizeof(__entry->seg_pred_probs));
+		       __entry->seg_flags = f->seg.flags;
+		       __entry->flags = f->flags;
+		       __entry->compressed_header_size = f->compressed_header_size;
+		       __entry->uncompressed_header_size = f->uncompressed_header_size;
+		       __entry->frame_width_minus_1 = f->frame_width_minus_1;
+		       __entry->frame_height_minus_1 = f->frame_height_minus_1;
+		       __entry->render_width_minus_1 = f->render_width_minus_1;
+		       __entry->render_height_minus_1 = f->render_height_minus_1;
+		       __entry->last_frame_ts = f->last_frame_ts;
+		       __entry->golden_frame_ts = f->golden_frame_ts;
+		       __entry->alt_frame_ts = f->alt_frame_ts;
+		       __entry->ref_frame_sign_bias = f->ref_frame_sign_bias;
+		       __entry->reset_frame_context = f->reset_frame_context;
+		       __entry->frame_context_idx = f->frame_context_idx;
+		       __entry->profile = f->profile;
+		       __entry->bit_depth = f->bit_depth;
+		       __entry->interpolation_filter = f->interpolation_filter;
+		       __entry->tile_cols_log2 = f->tile_cols_log2;
+		       __entry->tile_rows_log2 = f->tile_rows_log2;
+		       __entry->reference_mode = f->reference_mode;),
 	TP_printk("\nlf.ref_deltas %s\n"
 		  "lf.mode_deltas %s\n"
 		  "lf.level %u\n"
@@ -1403,41 +2233,41 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 		  "tile_cols_log2 %u\n"
 		  "tile_rows_log_2 %u\n"
 		  "reference_mode %s\n",
-		  __print_array(__entry->f.lf.ref_deltas,
-				ARRAY_SIZE(__entry->f.lf.ref_deltas),
-				sizeof(__entry->f.lf.ref_deltas[0])),
-		  __print_array(__entry->f.lf.mode_deltas,
-				ARRAY_SIZE(__entry->f.lf.mode_deltas),
-				sizeof(__entry->f.lf.mode_deltas[0])),
-		  __entry->f.lf.level,
-		  __entry->f.lf.sharpness,
-		  __print_flags(__entry->f.lf.flags, "|",
+		  __print_array(__entry->lf_ref_deltas,
+				ARRAY_SIZE(__entry->lf_ref_deltas),
+				sizeof(__entry->lf_ref_deltas[0])),
+		  __print_array(__entry->lf_mode_deltas,
+				ARRAY_SIZE(__entry->lf_mode_deltas),
+				sizeof(__entry->lf_mode_deltas[0])),
+		  __entry->lf_level,
+		  __entry->lf_sharpness,
+		  __print_flags(__entry->lf_flags, "|",
 		  {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED, "DELTA_ENABLED"},
 		  {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE, "DELTA_UPDATE"}),
-		  __entry->f.quant.base_q_idx,
-		  __entry->f.quant.delta_q_y_dc,
-		  __entry->f.quant.delta_q_uv_dc,
-		  __entry->f.quant.delta_q_uv_ac,
+		  __entry->quant_base_q_idx,
+		  __entry->quant_delta_q_y_dc,
+		  __entry->quant_delta_q_uv_dc,
+		  __entry->quant_delta_q_uv_ac,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->f.seg.feature_data,
-				   sizeof(__entry->f.seg.feature_data),
+				   __entry->seg_feature_data,
+				   sizeof(__entry->seg_feature_data),
 				   false),
-		  __print_array(__entry->f.seg.feature_enabled,
-				ARRAY_SIZE(__entry->f.seg.feature_enabled),
-				sizeof(__entry->f.seg.feature_enabled[0])),
-		  __print_array(__entry->f.seg.tree_probs,
-				ARRAY_SIZE(__entry->f.seg.tree_probs),
-				sizeof(__entry->f.seg.tree_probs[0])),
-		  __print_array(__entry->f.seg.pred_probs,
-				ARRAY_SIZE(__entry->f.seg.pred_probs),
-				sizeof(__entry->f.seg.pred_probs[0])),
-		  __print_flags(__entry->f.seg.flags, "|",
+		  __print_array(__entry->seg_feature_enabled,
+				ARRAY_SIZE(__entry->seg_feature_enabled),
+				sizeof(__entry->seg_feature_enabled[0])),
+		  __print_array(__entry->seg_tree_probs,
+				ARRAY_SIZE(__entry->seg_tree_probs),
+				sizeof(__entry->seg_tree_probs[0])),
+		  __print_array(__entry->seg_pred_probs,
+				ARRAY_SIZE(__entry->seg_pred_probs),
+				sizeof(__entry->seg_pred_probs[0])),
+		  __print_flags(__entry->seg_flags, "|",
 		  {V4L2_VP9_SEGMENTATION_FLAG_ENABLED, "ENABLED"},
 		  {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP, "UPDATE_MAP"},
 		  {V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE, "TEMPORAL_UPDATE"},
 		  {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA, "UPDATE_DATA"},
 		  {V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE, "ABS_OR_DELTA_UPDATE"}),
-		  __print_flags(__entry->f.flags, "|",
+		  __print_flags(__entry->flags, "|",
 		  {V4L2_VP9_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
 		  {V4L2_VP9_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
 		  {V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT, "ERROR_RESILIENT"},
@@ -1448,35 +2278,35 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 		  {V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING, "X_SUBSAMPLING"},
 		  {V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING, "Y_SUBSAMPLING"},
 		  {V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING, "COLOR_RANGE_FULL_SWING"}),
-		  __entry->f.compressed_header_size,
-		  __entry->f.uncompressed_header_size,
-		  __entry->f.frame_width_minus_1,
-		  __entry->f.frame_height_minus_1,
-		  __entry->f.render_width_minus_1,
-		  __entry->f.render_height_minus_1,
-		  __entry->f.last_frame_ts,
-		  __entry->f.golden_frame_ts,
-		  __entry->f.alt_frame_ts,
-		  __print_symbolic(__entry->f.ref_frame_sign_bias,
+		  __entry->compressed_header_size,
+		  __entry->uncompressed_header_size,
+		  __entry->frame_width_minus_1,
+		  __entry->frame_height_minus_1,
+		  __entry->render_width_minus_1,
+		  __entry->render_height_minus_1,
+		  __entry->last_frame_ts,
+		  __entry->golden_frame_ts,
+		  __entry->alt_frame_ts,
+		  __print_symbolic(__entry->ref_frame_sign_bias,
 		  {V4L2_VP9_SIGN_BIAS_LAST, "SIGN_BIAS_LAST"},
 		  {V4L2_VP9_SIGN_BIAS_GOLDEN, "SIGN_BIAS_GOLDEN"},
 		  {V4L2_VP9_SIGN_BIAS_ALT, "SIGN_BIAS_ALT"}),
-		  __print_symbolic(__entry->f.reset_frame_context,
+		  __print_symbolic(__entry->reset_frame_context,
 		  {V4L2_VP9_RESET_FRAME_CTX_NONE, "RESET_FRAME_CTX_NONE"},
 		  {V4L2_VP9_RESET_FRAME_CTX_SPEC, "RESET_FRAME_CTX_SPEC"},
 		  {V4L2_VP9_RESET_FRAME_CTX_ALL, "RESET_FRAME_CTX_ALL"}),
-		  __entry->f.frame_context_idx,
-		  __entry->f.profile,
-		  __entry->f.bit_depth,
-		  __print_symbolic(__entry->f.interpolation_filter,
+		  __entry->frame_context_idx,
+		  __entry->profile,
+		  __entry->bit_depth,
+		  __print_symbolic(__entry->interpolation_filter,
 		  {V4L2_VP9_INTERP_FILTER_EIGHTTAP, "INTERP_FILTER_EIGHTTAP"},
 		  {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH, "INTERP_FILTER_EIGHTTAP_SMOOTH"},
 		  {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP, "INTERP_FILTER_EIGHTTAP_SHARP"},
 		  {V4L2_VP9_INTERP_FILTER_BILINEAR, "INTERP_FILTER_BILINEAR"},
 		  {V4L2_VP9_INTERP_FILTER_SWITCHABLE, "INTERP_FILTER_SWITCHABLE"}),
-		  __entry->f.tile_cols_log2,
-		  __entry->f.tile_rows_log2,
-		  __print_symbolic(__entry->f.reference_mode,
+		  __entry->tile_cols_log2,
+		  __entry->tile_rows_log2,
+		  __print_symbolic(__entry->reference_mode,
 		  {V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE, "REFERENCE_MODE_SINGLE_REFERENCE"},
 		  {V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE, "REFERENCE_MODE_COMPOUND_REFERENCE"},
 		  {V4L2_VP9_REFERENCE_MODE_SELECT, "REFERENCE_MODE_SELECT"}))
@@ -1485,8 +2315,35 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
 	TP_ARGS(h),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
-	TP_fast_assign(__entry->h = *h;),
+	TP_STRUCT__entry(__field(__u8, tx_mode)
+			 __array(__u8, tx8, 2 * 1)
+			 __array(__u8, tx16, 2 * 2)
+			 __array(__u8, tx32, 2 * 3)
+			 __array(__u8, skip, 3)
+			 __array(__u8, inter_mode, 7 * 3)
+			 __array(__u8, interp_filter, 4 * 2)
+			 __array(__u8, is_inter, 4)
+			 __array(__u8, comp_mode, 5)
+			 __array(__u8, single_ref, 5 * 2)
+			 __array(__u8, comp_ref, 5)
+			 __array(__u8, y_mode, 4 * 9)
+			 __array(__u8, uv_mode, 10 * 9)
+			 __array(__u8, partition, 16 * 3)),
+	TP_fast_assign(__entry->tx_mode = h->tx_mode;
+		       memcpy(__entry->tx8, h->tx8, sizeof(__entry->tx8));
+		       memcpy(__entry->tx16, h->tx16, sizeof(__entry->tx16));
+		       memcpy(__entry->tx32, h->tx32, sizeof(__entry->tx32));
+		       memcpy(__entry->skip, h->skip, sizeof(__entry->skip));
+		       memcpy(__entry->inter_mode, h->inter_mode, sizeof(__entry->inter_mode));
+		       memcpy(__entry->interp_filter, h->interp_filter,
+			      sizeof(__entry->interp_filter));
+		       memcpy(__entry->is_inter, h->is_inter, sizeof(__entry->is_inter));
+		       memcpy(__entry->comp_mode, h->comp_mode, sizeof(__entry->comp_mode));
+		       memcpy(__entry->single_ref, h->single_ref, sizeof(__entry->single_ref));
+		       memcpy(__entry->comp_ref, h->comp_ref, sizeof(__entry->comp_ref));
+		       memcpy(__entry->y_mode, h->y_mode, sizeof(__entry->y_mode));
+		       memcpy(__entry->uv_mode, h->uv_mode, sizeof(__entry->uv_mode));
+		       memcpy(__entry->partition, h->partition, sizeof(__entry->partition));),
 	TP_printk("\ntx_mode %s\n"
 		  "tx8 {%s}\n"
 		  "tx16 {%s}\n"
@@ -1501,59 +2358,59 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 		  "y_mode {%s}\n"
 		  "uv_mode {%s}\n"
 		  "partition {%s}\n",
-		  __print_symbolic(__entry->h.tx_mode,
+		  __print_symbolic(__entry->tx_mode,
 		  {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
 		  {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
 		  {V4L2_VP9_TX_MODE_ALLOW_16X16, "TX_MODE_ALLOW_16X16"},
 		  {V4L2_VP9_TX_MODE_ALLOW_32X32, "TX_MODE_ALLOW_32X32"},
 		  {V4L2_VP9_TX_MODE_SELECT, "TX_MODE_SELECT"}),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.tx8,
-				   sizeof(__entry->h.tx8),
+				   __entry->tx8,
+				   sizeof(__entry->tx8),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.tx16,
-				   sizeof(__entry->h.tx16),
+				   __entry->tx16,
+				   sizeof(__entry->tx16),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.tx32,
-				   sizeof(__entry->h.tx32),
+				   __entry->tx32,
+				   sizeof(__entry->tx32),
 				   false),
-		  __print_array(__entry->h.skip,
-				ARRAY_SIZE(__entry->h.skip),
-				sizeof(__entry->h.skip[0])),
+		  __print_array(__entry->skip,
+				ARRAY_SIZE(__entry->skip),
+				sizeof(__entry->skip[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.inter_mode,
-				   sizeof(__entry->h.inter_mode),
+				   __entry->inter_mode,
+				   sizeof(__entry->inter_mode),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.interp_filter,
-				   sizeof(__entry->h.interp_filter),
+				   __entry->interp_filter,
+				   sizeof(__entry->interp_filter),
 				   false),
-		  __print_array(__entry->h.is_inter,
-				ARRAY_SIZE(__entry->h.is_inter),
-				sizeof(__entry->h.is_inter[0])),
-		  __print_array(__entry->h.comp_mode,
-				ARRAY_SIZE(__entry->h.comp_mode),
-				sizeof(__entry->h.comp_mode[0])),
+		  __print_array(__entry->is_inter,
+				ARRAY_SIZE(__entry->is_inter),
+				sizeof(__entry->is_inter[0])),
+		  __print_array(__entry->comp_mode,
+				ARRAY_SIZE(__entry->comp_mode),
+				sizeof(__entry->comp_mode[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.single_ref,
-				   sizeof(__entry->h.single_ref),
+				   __entry->single_ref,
+				   sizeof(__entry->single_ref),
 				   false),
-		  __print_array(__entry->h.comp_ref,
-				ARRAY_SIZE(__entry->h.comp_ref),
-				sizeof(__entry->h.comp_ref[0])),
+		  __print_array(__entry->comp_ref,
+				ARRAY_SIZE(__entry->comp_ref),
+				sizeof(__entry->comp_ref[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.y_mode,
-				   sizeof(__entry->h.y_mode),
+				   __entry->y_mode,
+				   sizeof(__entry->y_mode),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.uv_mode,
-				   sizeof(__entry->h.uv_mode),
+				   __entry->uv_mode,
+				   sizeof(__entry->uv_mode),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.partition,
-				   sizeof(__entry->h.partition),
+				   __entry->partition,
+				   sizeof(__entry->partition),
 				   false)
 	)
 );
@@ -1561,12 +2418,12 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
 	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
 	TP_ARGS(h),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
-	TP_fast_assign(__entry->h = *h;),
+	TP_STRUCT__entry(__array(__u8, coef, 4 * 2 * 2 * 6 * 6 * 3)),
+	TP_fast_assign(memcpy(__entry->coef, h->coef, sizeof(__entry->coef));),
 	TP_printk("\n coef {%s}",
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->h.coef,
-				   sizeof(__entry->h.coef),
+				   __entry->coef,
+				   sizeof(__entry->coef),
 				   false)
 	)
 );
@@ -1574,8 +2431,24 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
 DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
 	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
-	TP_fast_assign(__entry->p = *p;),
+	TP_STRUCT__entry(__array(__u8, joint, 3)
+			 __array(__u8, sign, 2)
+			 __array(__u8, classes, 2 * 10)
+			 __array(__u8, class0_bit, 2)
+			 __array(__u8, bits, 2 * 10)
+			 __array(__u8, class0_fr, 2 * 2 * 3)
+			 __array(__u8, fr, 2 * 3)
+			 __array(__u8, class0_hp, 2)
+			 __array(__u8, hp, 2)),
+	TP_fast_assign(memcpy(__entry->joint, p->joint, sizeof(__entry->joint));
+		       memcpy(__entry->sign, p->sign, sizeof(__entry->sign));
+		       memcpy(__entry->classes, p->classes, sizeof(__entry->classes));
+		       memcpy(__entry->class0_bit, p->class0_bit, sizeof(__entry->class0_bit));
+		       memcpy(__entry->bits, p->bits, sizeof(__entry->bits));
+		       memcpy(__entry->class0_fr, p->class0_fr, sizeof(__entry->class0_fr));
+		       memcpy(__entry->fr, p->fr, sizeof(__entry->fr));
+		       memcpy(__entry->class0_hp, p->class0_hp, sizeof(__entry->class0_hp));
+		       memcpy(__entry->hp, p->hp, sizeof(__entry->hp));),
 	TP_printk("\n joint %s\n"
 		  "sign %s\n"
 		  "classes {%s}\n"
@@ -1585,37 +2458,37 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 		  "fr {%s}\n"
 		  "class0_hp %s\n"
 		  "hp %s\n",
-		  __print_array(__entry->p.joint,
-				ARRAY_SIZE(__entry->p.joint),
-				sizeof(__entry->p.joint[0])),
-		  __print_array(__entry->p.sign,
-				ARRAY_SIZE(__entry->p.sign),
-				sizeof(__entry->p.sign[0])),
+		  __print_array(__entry->joint,
+				ARRAY_SIZE(__entry->joint),
+				sizeof(__entry->joint[0])),
+		  __print_array(__entry->sign,
+				ARRAY_SIZE(__entry->sign),
+				sizeof(__entry->sign[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.classes,
-				   sizeof(__entry->p.classes),
+				   __entry->classes,
+				   sizeof(__entry->classes),
 				   false),
-		  __print_array(__entry->p.class0_bit,
-				ARRAY_SIZE(__entry->p.class0_bit),
-				sizeof(__entry->p.class0_bit[0])),
+		  __print_array(__entry->class0_bit,
+				ARRAY_SIZE(__entry->class0_bit),
+				sizeof(__entry->class0_bit[0])),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.bits,
-				   sizeof(__entry->p.bits),
+				   __entry->bits,
+				   sizeof(__entry->bits),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.class0_fr,
-				   sizeof(__entry->p.class0_fr),
+				   __entry->class0_fr,
+				   sizeof(__entry->class0_fr),
 				   false),
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
-				   __entry->p.fr,
-				   sizeof(__entry->p.fr),
+				   __entry->fr,
+				   sizeof(__entry->fr),
 				   false),
-		  __print_array(__entry->p.class0_hp,
-				ARRAY_SIZE(__entry->p.class0_hp),
-				sizeof(__entry->p.class0_hp[0])),
-		  __print_array(__entry->p.hp,
-				ARRAY_SIZE(__entry->p.hp),
-				sizeof(__entry->p.hp[0]))
+		  __print_array(__entry->class0_hp,
+				ARRAY_SIZE(__entry->class0_hp),
+				sizeof(__entry->class0_hp[0])),
+		  __print_array(__entry->hp,
+				ARRAY_SIZE(__entry->hp),
+				sizeof(__entry->hp[0]))
 	)
 );
 

-- 
2.54.0


