Return-Path: <linux-media+bounces-64459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RwgPJoR2KWriXAMAu9opvQ
	(envelope-from <linux-media+bounces-64459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:36:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 416AB66A468
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:36:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=jdtX0vLK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64459-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64459-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73E98300DED2
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB936404BCF;
	Wed, 10 Jun 2026 14:34:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C513DDDBD;
	Wed, 10 Jun 2026 14:34:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102072; cv=none; b=MHUoSy9hR3Q1O4Ry6MrpqNb8s5+a6k1ZsXF9cirl3UChuWE9tvLLSPA5fm9Qy17iHJsJAj3sJ5zTDwbgPD5q8zGWXnDnol/RkACw4EqfLddlocQ1RhFT6rQn5dPSnm8E9M+UXFNVUqSJiU05jYYjUNoUERbXUPMjrSqU7Xq0f78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102072; c=relaxed/simple;
	bh=N+FTfcpsb9ZU2gVtguUIhq8zRaI/j9t/0RWpkw1PrAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mF/97TXpUho5WX8uVeRvi4AwCCu2y2zRa09o5jZ0NkHF0S/JWdWBy6vzWHOl5ovRqCKeyuxV3sDs5gLLlpk1tkDYjsdTdd8/2dj/SmEpzaX7T0T0Br3oponJx+U9K+6f4lrpWIG9G9GX5gbepDGbGQ9+6RL5ujro04nyseawveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jdtX0vLK; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102058;
	bh=N+FTfcpsb9ZU2gVtguUIhq8zRaI/j9t/0RWpkw1PrAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jdtX0vLKiu6nB41VHQSHqqhL0IdnjFmZ90H7f+SdFKqp2gDodyrjkdbECdNAxWlqV
	 2a9H5lKVzSI+RQcpgGptwO4d2eyn/oj2JSMxmB4dCgDz6rT/hKpzSkQBOial+dMc+E
	 ktRx8lsqChQAQdswdEte7tN3f/Z+yrw/9mCH0YbRlVUamryn56yROCP9coQiLT9jS7
	 mmdJTmoa1xgsD14VnwcPPm5iPgnEP8YM5q6s1ttX/jkRf1aDK21090ODjYPV1NH/Uz
	 8eK8K+uD4nAIv113BrQZE6avzDXggP6v+CLDUp7x17KugiBwqkQtUqecwVIrc+5rd+
	 rattxZz0bkD6Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82AAA17E0FC9;
	Wed, 10 Jun 2026 16:34:16 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 10 Jun 2026 10:33:34 -0400
Subject: [PATCH v2 4/9] media: Add tgid and fd to the v4l2-requests trace
 fields
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-v4l2-add-ftrace-v2-4-9756edf72ac1@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-64459-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 416AB66A468

With these fields, userspace can better track which trace event matches
with a given stream.

Even though the trace shows the PID (based on current->tgid), trace
functions could be called from other contexts, therefore showing the wrong
PID, or none at all.

These will ensure that the trace event can be matched with the PID/FD that
opened and configured the video device file.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c |  68 ++--
 include/trace/events/v4l2_controls.h       | 628 +++++++++++++++++++----------
 2 files changed, 445 insertions(+), 251 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index 1c66a1b8d78f..2a065a6249ad 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -489,67 +489,71 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run *run)
 {
 	int i;
+	struct v4l2_fh *fh = &ctx->fh;
 
 	switch (ctx->current_codec) {
 	default:
 	case VISL_CODEC_NONE:
 		break;
 	case VISL_CODEC_FWHT:
-		trace_v4l2_ctrl_fwht_params(run->fwht.params);
+		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, run->fwht.params);
 		break;
 	case VISL_CODEC_MPEG2:
-		trace_v4l2_ctrl_mpeg2_sequence(run->mpeg2.seq);
-		trace_v4l2_ctrl_mpeg2_picture(run->mpeg2.pic);
-		trace_v4l2_ctrl_mpeg2_quantisation(run->mpeg2.quant);
+		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, run->mpeg2.seq);
+		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, run->mpeg2.pic);
+		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, run->mpeg2.quant);
 		break;
 	case VISL_CODEC_VP8:
-		trace_v4l2_ctrl_vp8_frame(run->vp8.frame);
-		trace_v4l2_ctrl_vp8_entropy(run->vp8.frame);
+		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, run->vp8.frame);
+		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, run->vp8.frame);
 		break;
 	case VISL_CODEC_VP9:
-		trace_v4l2_ctrl_vp9_frame(run->vp9.frame);
-		trace_v4l2_ctrl_vp9_compressed_hdr(run->vp9.probs);
-		trace_v4l2_ctrl_vp9_compressed_coeff(run->vp9.probs);
-		trace_v4l2_vp9_mv_probs(&run->vp9.probs->mv);
+		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, run->vp9.frame);
+		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd, run->vp9.probs);
+		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd, run->vp9.probs);
+		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &run->vp9.probs->mv);
 		break;
 	case VISL_CODEC_H264:
-		trace_v4l2_ctrl_h264_sps(run->h264.sps);
-		trace_v4l2_ctrl_h264_pps(run->h264.pps);
-		trace_v4l2_ctrl_h264_scaling_matrix(run->h264.sm);
-		trace_v4l2_ctrl_h264_slice_params(run->h264.spram);
+		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, run->h264.sps);
+		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, run->h264.pps);
+		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, run->h264.sm);
+		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, run->h264.spram);
 
 		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
-			trace_v4l2_h264_ref_pic_list0(&run->h264.spram->ref_pic_list0[i], i);
+			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd,
+						      &run->h264.spram->ref_pic_list0[i], i);
 		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
-			trace_v4l2_h264_ref_pic_list1(&run->h264.spram->ref_pic_list1[i], i);
+			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd,
+						      &run->h264.spram->ref_pic_list1[i], i);
 
-		trace_v4l2_ctrl_h264_decode_params(run->h264.dpram);
+		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, run->h264.dpram);
 
 		for (i = 0; i < ARRAY_SIZE(run->h264.dpram->dpb); i++)
-			trace_v4l2_h264_dpb_entry(&run->h264.dpram->dpb[i], i);
+			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &run->h264.dpram->dpb[i], i);
 
-		trace_v4l2_ctrl_h264_pred_weights(run->h264.pwht);
+		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, run->h264.pwht);
 		break;
 	case VISL_CODEC_HEVC:
-		trace_v4l2_ctrl_hevc_sps(run->hevc.sps);
-		trace_v4l2_ctrl_hevc_pps(run->hevc.pps);
-		trace_v4l2_ctrl_hevc_slice_params(run->hevc.spram);
-		trace_v4l2_ctrl_hevc_scaling_matrix(run->hevc.sm);
-		trace_v4l2_ctrl_hevc_decode_params(run->hevc.dpram);
+		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, run->hevc.sps);
+		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, run->hevc.pps);
+		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, run->hevc.spram);
+		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, run->hevc.sm);
+		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, run->hevc.dpram);
 
 		for (i = 0; i < ARRAY_SIZE(run->hevc.dpram->dpb); i++)
-			trace_v4l2_hevc_dpb_entry(&run->hevc.dpram->dpb[i]);
+			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &run->hevc.dpram->dpb[i]);
 
-		trace_v4l2_hevc_pred_weight_table(&run->hevc.spram->pred_weight_table);
-		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(run->hevc.rps_lt);
-		trace_v4l2_ctrl_hevc_ext_sps_st_rps(run->hevc.rps_st);
 
+		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
+						  &run->hevc.spram->pred_weight_table);
+		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(fh->tgid, fh->fd, run->hevc.rps_lt);
+		trace_v4l2_ctrl_hevc_ext_sps_st_rps(fh->tgid, fh->fd, run->hevc.rps_st);
 		break;
 	case VISL_CODEC_AV1:
-		trace_v4l2_ctrl_av1_sequence(run->av1.seq);
-		trace_v4l2_ctrl_av1_frame(run->av1.frame);
-		trace_v4l2_ctrl_av1_film_grain(run->av1.grain);
-		trace_v4l2_ctrl_av1_tile_group_entry(run->av1.tge);
+		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, run->av1.seq);
+		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, run->av1.frame);
+		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, run->av1.grain);
+		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, run->av1.tge);
 		break;
 	}
 }
diff --git a/include/trace/events/v4l2_controls.h b/include/trace/events/v4l2_controls.h
index 3a9bc75752bf..a7c61c36a025 100644
--- a/include/trace/events/v4l2_controls.h
+++ b/include/trace/events/v4l2_controls.h
@@ -14,27 +14,39 @@
  * They can be identified by the name of the event. All control fields are copied in a TP_STRUCT
  * field so that they can be filtered separately in userspace.
  *
+ * In addition to the controls fields, tgid and fd are also added in each trace events.
+ * This allows to identify controls set by a specific process and to match them with other events
+ * from the same process.
+ * tgid contains the process id that opened the video device.
+ * fd is the file descriptor in the tgid, used in case a process opens multiple video devices.
+ *
  * Currently only the codec controls are supported.
  */
 
 /* AV1 controls */
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field(__u32, flags)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_sequence *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u32, flags)
 			 __field(__u8, seq_profile)
 			 __field(__u8, order_hint_bits)
 			 __field(__u8, bit_depth)
 			 __field(__u16, max_frame_width_minus_1)
 			 __field(__u16, max_frame_height_minus_1)),
-	TP_fast_assign(__entry->flags = s->flags;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->flags = s->flags;
 		       __entry->seq_profile = s->seq_profile;
 		       __entry->order_hint_bits = s->order_hint_bits;
 		       __entry->bit_depth = s->bit_depth;
 		       __entry->max_frame_width_minus_1 = s->max_frame_width_minus_1;
 		       __entry->max_frame_height_minus_1 = s->max_frame_height_minus_1;),
-	TP_printk("\nflags %s\nseq_profile: %u\norder_hint_bits: %u\nbit_depth: %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nflags %s\nseq_profile: %u\norder_hint_bits: %u\nbit_depth: %u\n"
 		  "max_frame_width_minus_1: %u\nmax_frame_height_minus_1: %u\n",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
 		  {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK, "USE_128X128_SUPERBLOCK"},
@@ -65,17 +77,23 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
-	TP_ARGS(t),
-	TP_STRUCT__entry(__field(__u32, tile_offset)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_tile_group_entry *t),
+	TP_ARGS(tgid, fd, t),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u32, tile_offset)
 			 __field(__u32, tile_size)
 			 __field(__u32, tile_row)
 			 __field(__u32, tile_col)),
-	TP_fast_assign(__entry->tile_offset = t->tile_offset;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->tile_offset = t->tile_offset;
 		       __entry->tile_size = t->tile_size;
 		       __entry->tile_row = t->tile_row;
 		       __entry->tile_col = t->tile_col;),
-	TP_printk("\ntile_offset: %u\n tile_size: %u\n tile_row: %u\ntile_col: %u\n",
+	TP_printk("tgid = %u, fd = %u, "
+		  "\ntile_offset: %u\n tile_size: %u\n tile_row: %u\ntile_col: %u\n",
+		  __entry->tgid, __entry->fd,
 		  __entry->tile_offset,
 		  __entry->tile_size,
 		  __entry->tile_row,
@@ -84,9 +102,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__field(u8, tile_info_flags)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u8, tile_info_flags)
 			 __field(u8, tile_info_context_update_tile_id)
 			 __field(u8, tile_info_tile_cols)
 			 __field(u8, tile_info_tile_rows)
@@ -144,7 +164,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 			 __array(u64, reference_frame_ts, V4L2_AV1_TOTAL_REFS_PER_FRAME)
 			 __array(s8, ref_frame_idx, V4L2_AV1_REFS_PER_FRAME)
 			 __field(u8, refresh_frame_flags)),
-	TP_fast_assign(__entry->tile_info_flags = f->tile_info.flags;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->tile_info_flags = f->tile_info.flags;
 		       __entry->tile_info_context_update_tile_id =
 				f->tile_info.context_update_tile_id;
 		       __entry->tile_info_tile_cols = f->tile_info.tile_cols;
@@ -226,7 +248,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 		       memcpy(__entry->ref_frame_idx, f->ref_frame_idx,
 			      sizeof(__entry->ref_frame_idx));
 		       __entry->refresh_frame_flags = f->refresh_frame_flags;),
-	TP_printk("\ntile_info.flags: %s\ntile_info.context_update_tile_id: %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\ntile_info.flags: %s\ntile_info.context_update_tile_id: %u\n"
 		  "tile_info.tile_cols: %u\ntile_info.tile_rows: %u\n"
 		  "tile_info.mi_col_starts: %s\ntile_info.mi_row_starts: %s\n"
 		  "tile_info.width_in_sbs_minus_1: %s\ntile_info.height_in_sbs_minus_1: %s\n"
@@ -250,6 +273,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 		  "render_width_minus_1: %u\nrender_height_minus_1: %u\ncurrent_frame_id: %u\n"
 		  "buffer_removal_time: %s\norder_hints: %s\nreference_frame_ts: %s\n"
 		  "ref_frame_idx: %s\nrefresh_frame_flags: %u\n",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->tile_info_flags, "|",
 		  {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING, "UNIFORM_TILE_SPACING"}),
 		  __entry->tile_info_context_update_tile_id,
@@ -385,9 +409,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__field(__u8, flags)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_film_grain *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u8, flags)
 			 __field(__u8, cr_mult)
 			 __field(__u16, grain_seed)
 			 __field(__u8, film_grain_params_ref_idx)
@@ -412,7 +438,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 			 __field(__u8, cr_luma_mult)
 			 __field(__u16, cb_offset)
 			 __field(__u16, cr_offset)),
-	TP_fast_assign(__entry->flags = f->flags;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->flags = f->flags;
 		       __entry->cr_mult = f->cr_mult;
 		       __entry->grain_seed = f->grain_seed;
 		       __entry->film_grain_params_ref_idx = f->film_grain_params_ref_idx;
@@ -446,7 +474,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 		       __entry->cr_luma_mult = f->cr_luma_mult;
 		       __entry->cb_offset = f->cb_offset;
 		       __entry->cr_offset = f->cr_offset;),
-	TP_printk("\nflags %s\ncr_mult: %u\ngrain_seed: %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nflags %s\ncr_mult: %u\ngrain_seed: %u\n"
 		  "film_grain_params_ref_idx: %u\nnum_y_points: %u\npoint_y_value: %s\n"
 		  "point_y_scaling: %s\nnum_cb_points: %u\npoint_cb_value: %s\n"
 		  "point_cb_scaling: %s\nnum_cr_points: %u\npoint_cr_value: %s\n"
@@ -455,6 +484,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 		  "ar_coeffs_cr_plus_128: %s\nar_coeff_shift_minus_6: %u\n"
 		  "grain_scale_shift: %u\ncb_mult: %u\ncb_luma_mult: %u\ncr_luma_mult: %u\n"
 		  "cb_offset: %u\ncr_offset: %u\n",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
 		  {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
@@ -507,31 +537,32 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 )
 
 DEFINE_EVENT(v4l2_ctrl_av1_seq_tmpl, v4l2_ctrl_av1_sequence,
-	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_sequence *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_ctrl_av1_frame_tmpl, v4l2_ctrl_av1_frame,
-	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
-	TP_ARGS(f)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_frame *f),
+	TP_ARGS(tgid, fd, f)
 );
 
 DEFINE_EVENT(v4l2_ctrl_av1_tge_tmpl, v4l2_ctrl_av1_tile_group_entry,
-	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
-	TP_ARGS(t)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_tile_group_entry *t),
+	TP_ARGS(tgid, fd, t)
 );
 
 DEFINE_EVENT(v4l2_ctrl_av1_film_grain_tmpl, v4l2_ctrl_av1_film_grain,
-	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
-	TP_ARGS(f)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_film_grain *f),
+	TP_ARGS(tgid, fd, f)
 );
 
 /* FWHT controls */
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_fwht_params *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
 			 __field(u64, backward_ref_ts)
 			 __field(u32, version)
 			 __field(u32, width)
@@ -542,7 +573,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 			 __field(u32, ycbcr_enc)
 			 __field(u32, quantization)
 			 ),
-	TP_fast_assign(
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
 		       __entry->backward_ref_ts = p->backward_ref_ts;
 		       __entry->version = p->version;
 		       __entry->width = p->width;
@@ -553,8 +585,10 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 		       __entry->ycbcr_enc = p->ycbcr_enc;
 		       __entry->quantization = p->quantization;
 		       ),
-	TP_printk("backward_ref_ts %llu version %u width %u height %u flags %s colorspace %u "
+	TP_printk("tgid = %u, fd = %u, "
+		  "backward_ref_ts %llu version %u width %u height %u flags %s colorspace %u "
 		  "xfer_func %u ycbcr_enc %u quantization %u",
+		  __entry->tgid, __entry->fd,
 		  __entry->backward_ref_ts, __entry->version, __entry->width, __entry->height,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
@@ -574,16 +608,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 );
 
 DEFINE_EVENT(v4l2_ctrl_fwht_params_tmpl, v4l2_ctrl_fwht_params,
-	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
-	TP_ARGS(p)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_fwht_params *p),
+	TP_ARGS(tgid, fd, p)
 );
 
 /* H264 controls */
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field(u8, profile_idc)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_sps *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u8, profile_idc)
 			 __field(u8, constraint_set_flags)
 			 __field(u8, level_idc)
 			 __field(u8, seq_parameter_set_id)
@@ -601,7 +637,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 			 __field(u16, pic_width_in_mbs_minus1)
 			 __field(u16, pic_height_in_map_units_minus1)
 			 __field(u32, flags)),
-	TP_fast_assign(__entry->profile_idc = s->profile_idc;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->profile_idc = s->profile_idc;
 		       __entry->constraint_set_flags = s->constraint_set_flags;
 		       __entry->level_idc = s->level_idc;
 		       __entry->seq_parameter_set_id = s->seq_parameter_set_id;
@@ -622,7 +660,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 		       __entry->pic_width_in_mbs_minus1 = s->pic_width_in_mbs_minus1;
 		       __entry->pic_height_in_map_units_minus1 = s->pic_height_in_map_units_minus1;
 		       __entry->flags = s->flags),
-	TP_printk("\nprofile_idc %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nprofile_idc %u\n"
 		  "constraint_set_flags %s\n"
 		  "level_idc %u\n"
 		  "seq_parameter_set_id %u\n"
@@ -640,6 +679,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 		  "pic_width_in_mbs_minus1 %u\n"
 		  "pic_height_in_map_units_minus1 %u\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->profile_idc,
 		  __print_flags(__entry->constraint_set_flags, "|",
 		  {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG"},
@@ -679,9 +719,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field(u8, pic_parameter_set_id)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pps *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u8, pic_parameter_set_id)
 			 __field(u8, seq_parameter_set_id)
 			 __field(u8, num_slice_groups_minus1)
 			 __field(u8, num_ref_idx_l0_default_active_minus1)
@@ -692,7 +734,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 			 __field(__s8, chroma_qp_index_offset)
 			 __field(__s8, second_chroma_qp_index_offset)
 			 __field(u16, flags)),
-	TP_fast_assign(__entry->pic_parameter_set_id = p->pic_parameter_set_id;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->pic_parameter_set_id = p->pic_parameter_set_id;
 		       __entry->seq_parameter_set_id = p->seq_parameter_set_id;
 		       __entry->num_slice_groups_minus1 = p->num_slice_groups_minus1;
 		       __entry->num_ref_idx_l0_default_active_minus1 =
@@ -705,7 +749,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 		       __entry->chroma_qp_index_offset = p->chroma_qp_index_offset;
 		       __entry->second_chroma_qp_index_offset = p->second_chroma_qp_index_offset;
 		       __entry->flags = p->flags),
-	TP_printk("\npic_parameter_set_id %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\npic_parameter_set_id %u\n"
 		  "seq_parameter_set_id %u\n"
 		  "num_slice_groups_minus1 %u\n"
 		  "num_ref_idx_l0_default_active_minus1 %u\n"
@@ -716,6 +761,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 		  "chroma_qp_index_offset %d\n"
 		  "second_chroma_qp_index_offset %d\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->pic_parameter_set_id,
 		  __entry->seq_parameter_set_id,
 		  __entry->num_slice_groups_minus1,
@@ -741,15 +787,21 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__array(u8, scaling_list_4x4, 6 * 16)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_scaling_matrix *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(u8, scaling_list_4x4, 6 * 16)
 			 __array(u8, scaling_list_8x8, 6 * 64)),
-	TP_fast_assign(memcpy(__entry->scaling_list_4x4, s->scaling_list_4x4,
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->scaling_list_4x4, s->scaling_list_4x4,
 			      sizeof(__entry->scaling_list_4x4));
 		       memcpy(__entry->scaling_list_8x8, s->scaling_list_8x8,
 			      sizeof(__entry->scaling_list_8x8))),
-	TP_printk("\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->scaling_list_4x4,
 				   sizeof(__entry->scaling_list_4x4),
@@ -762,9 +814,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field(u16, luma_log2_weight_denom)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pred_weights *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u16, luma_log2_weight_denom)
 			 __field(u16, chroma_log2_weight_denom)
 			 __array(__s16, weight_factors_0_luma_weight, 32)
 			 __array(__s16, weight_factors_0_luma_offset, 32)
@@ -774,7 +828,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 			 __array(__s16, weight_factors_1_luma_offset, 32)
 			 __array(__s16, weight_factors_1_chroma_weight, 32 * 2)
 			 __array(__s16, weight_factors_1_chroma_offset, 32 * 2)),
-	TP_fast_assign(__entry->luma_log2_weight_denom = p->luma_log2_weight_denom;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->luma_log2_weight_denom = p->luma_log2_weight_denom;
 		       __entry->chroma_log2_weight_denom = p->chroma_log2_weight_denom;
 		       memcpy(__entry->weight_factors_0_luma_weight,
 			      p->weight_factors[0].luma_weight,
@@ -800,7 +856,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 		       memcpy(__entry->weight_factors_1_chroma_offset,
 			      p->weight_factors[1].chroma_offset,
 			      sizeof(__entry->weight_factors_1_chroma_offset))),
-	TP_printk("\nluma_log2_weight_denom %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nluma_log2_weight_denom %u\n"
 		  "chroma_log2_weight_denom %u\n"
 		  "weight_factor[0].luma_weight %s\n"
 		  "weight_factor[0].luma_offset %s\n"
@@ -810,6 +867,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 		  "weight_factor[1].luma_offset %s\n"
 		  "weight_factor[1].chroma_weight {%s}\n"
 		  "weight_factor[1].chroma_offset {%s}\n",
+		  __entry->tgid, __entry->fd,
 		  __entry->luma_log2_weight_denom,
 		  __entry->chroma_log2_weight_denom,
 		  __print_array(__entry->weight_factors_0_luma_weight,
@@ -844,9 +902,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field(u32, header_bit_size)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_slice_params *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u32, header_bit_size)
 			 __field(u32, first_mb_in_slice)
 			 __field(u8, slice_type)
 			 __field(u8, colour_plane_id)
@@ -860,7 +920,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 			 __field(u8, num_ref_idx_l0_active_minus1)
 			 __field(u8, num_ref_idx_l1_active_minus1)
 			 __field(u32, flags)),
-	TP_fast_assign(__entry->header_bit_size = s->header_bit_size;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->header_bit_size = s->header_bit_size;
 		       __entry->first_mb_in_slice = s->first_mb_in_slice;
 		       __entry->slice_type = s->slice_type;
 		       __entry->colour_plane_id = s->colour_plane_id;
@@ -874,7 +936,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 		       __entry->num_ref_idx_l0_active_minus1 = s->num_ref_idx_l0_active_minus1;
 		       __entry->num_ref_idx_l1_active_minus1 = s->num_ref_idx_l1_active_minus1;
 		       __entry->flags = s->flags),
-	TP_printk("\nheader_bit_size %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nheader_bit_size %u\n"
 		  "first_mb_in_slice %u\n"
 		  "slice_type %s\n"
 		  "colour_plane_id %u\n"
@@ -888,6 +951,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 		  "num_ref_idx_l0_active_minus1 %u\n"
 		  "num_ref_idx_l1_active_minus1 %u\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->header_bit_size,
 		  __entry->first_mb_in_slice,
 		  __print_symbolic(__entry->slice_type,
@@ -913,15 +977,21 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
-	TP_PROTO(const struct v4l2_h264_reference *r, int i),
-	TP_ARGS(r, i),
-	TP_STRUCT__entry(__field(u8, fields)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_reference *r, int i),
+	TP_ARGS(tgid, fd, r, i),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u8, fields)
 			 __field(u8, index)
 			 __field(int, i)),
-	TP_fast_assign(__entry->fields = r->fields;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->fields = r->fields;
 		       __entry->index = r->index;
 		       __entry->i = i;),
-	TP_printk("[%d]: fields %s index %u",
+	TP_printk("tgid = %u, fd = %u, "
+		  "[%d]: fields %s index %u",
+		  __entry->tgid, __entry->fd,
 		  __entry->i,
 		  __print_flags(__entry->fields, "|",
 		  {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
@@ -932,9 +1002,11 @@ DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
-	TP_ARGS(d),
-	TP_STRUCT__entry(__field(u16, nal_ref_idc)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_decode_params *d),
+	TP_ARGS(tgid, fd, d),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u16, nal_ref_idc)
 			 __field(u16, frame_num)
 			 __field(__s32, top_field_order_cnt)
 			 __field(__s32, bottom_field_order_cnt)
@@ -947,7 +1019,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 			 __field(u32, pic_order_cnt_bit_size)
 			 __field(u32, slice_group_change_cycle)
 			 __field(u32, flags)),
-	TP_fast_assign(__entry->nal_ref_idc = d->nal_ref_idc;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->nal_ref_idc = d->nal_ref_idc;
 		       __entry->frame_num = d->frame_num;
 		       __entry->top_field_order_cnt = d->top_field_order_cnt;
 		       __entry->bottom_field_order_cnt = d->bottom_field_order_cnt;
@@ -960,7 +1034,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 		       __entry->pic_order_cnt_bit_size = d->pic_order_cnt_bit_size;
 		       __entry->slice_group_change_cycle = d->slice_group_change_cycle;
 		       __entry->flags = d->flags),
-	TP_printk("\nnal_ref_idc %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nnal_ref_idc %u\n"
 		  "frame_num %u\n"
 		  "top_field_order_cnt %d\n"
 		  "bottom_field_order_cnt %d\n"
@@ -973,6 +1048,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 		  "pic_order_cnt_bit_size %u\n"
 		  "slice_group_change_cycle %u\n"
 		  "flags %s\n",
+		  __entry->tgid, __entry->fd,
 		  __entry->nal_ref_idc,
 		  __entry->frame_num,
 		  __entry->top_field_order_cnt,
@@ -995,9 +1071,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
-	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
-	TP_ARGS(e, i),
-	TP_STRUCT__entry(__field(u64, reference_ts)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_dpb_entry *e, int i),
+	TP_ARGS(tgid, fd, e, i),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u64, reference_ts)
 			 __field(u32, pic_num)
 			 __field(u16, frame_num)
 			 __field(u8, fields)
@@ -1005,7 +1083,9 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
 			 __field(__s32, bottom_field_order_cnt)
 			 __field(u32, flags)
 			 __field(int, i)),
-	TP_fast_assign(__entry->reference_ts = e->reference_ts;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->reference_ts = e->reference_ts;
 		       __entry->pic_num = e->pic_num;
 		       __entry->frame_num = e->frame_num;
 		       __entry->fields = e->fields;
@@ -1013,8 +1093,10 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
 		       __entry->bottom_field_order_cnt = e->bottom_field_order_cnt;
 		       __entry->flags = e->flags;
 		       __entry->i = i;),
-	TP_printk("[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s "
+	TP_printk("tgid = %u, fd = %u, "
+		  "[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s "
 		  "top_field_order_cnt %d bottom_field_order_cnt %d flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->i,
 		  __entry->reference_ts,
 		  __entry->pic_num,
@@ -1035,56 +1117,58 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
 );
 
 DEFINE_EVENT(v4l2_ctrl_h264_sps_tmpl, v4l2_ctrl_h264_sps,
-	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_sps *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_ctrl_h264_pps_tmpl, v4l2_ctrl_h264_pps,
-	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
-	TP_ARGS(p)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pps *p),
+	TP_ARGS(tgid, fd, p)
 );
 
 DEFINE_EVENT(v4l2_ctrl_h264_scaling_matrix_tmpl, v4l2_ctrl_h264_scaling_matrix,
-	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_scaling_matrix *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_ctrl_h264_pred_weights_tmpl, v4l2_ctrl_h264_pred_weights,
-	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
-	TP_ARGS(p)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pred_weights *p),
+	TP_ARGS(tgid, fd, p)
 );
 
 DEFINE_EVENT(v4l2_ctrl_h264_slice_params_tmpl, v4l2_ctrl_h264_slice_params,
-	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_slice_params *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list0,
-	TP_PROTO(const struct v4l2_h264_reference *r, int i),
-	TP_ARGS(r, i)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_reference *r, int i),
+	TP_ARGS(tgid, fd, r, i)
 );
 
 DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list1,
-	TP_PROTO(const struct v4l2_h264_reference *r, int i),
-	TP_ARGS(r, i)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_reference *r, int i),
+	TP_ARGS(tgid, fd, r, i)
 );
 
 DEFINE_EVENT(v4l2_ctrl_h264_decode_params_tmpl, v4l2_ctrl_h264_decode_params,
-	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
-	TP_ARGS(d)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_decode_params *d),
+	TP_ARGS(tgid, fd, d)
 );
 
 DEFINE_EVENT(v4l2_h264_dpb_entry_tmpl, v4l2_h264_dpb_entry,
-	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
-	TP_ARGS(e, i)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_dpb_entry *e, int i),
+	TP_ARGS(tgid, fd, e, i)
 );
 
 /* HEVC controls */
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field(__u8, video_parameter_set_id)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_sps *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u8, video_parameter_set_id)
 			 __field(__u8, seq_parameter_set_id)
 			 __field(__u16, pic_width_in_luma_samples)
 			 __field(__u16, pic_height_in_luma_samples)
@@ -1109,7 +1193,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 			 __field(__u8, chroma_format_idc)
 			 __field(__u8, sps_max_sub_layers_minus1)
 			 __field(__u64, flags)),
-	TP_fast_assign(__entry->video_parameter_set_id = s->video_parameter_set_id;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->video_parameter_set_id = s->video_parameter_set_id;
 		       __entry->seq_parameter_set_id = s->seq_parameter_set_id;
 		       __entry->pic_width_in_luma_samples = s->pic_width_in_luma_samples;
 		       __entry->pic_height_in_luma_samples = s->pic_height_in_luma_samples;
@@ -1146,7 +1232,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 		       __entry->chroma_format_idc = s->chroma_format_idc;
 		       __entry->sps_max_sub_layers_minus1 = s->sps_max_sub_layers_minus1;
 		       __entry->flags = s->flags;),
-	TP_printk("\nvideo_parameter_set_id %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nvideo_parameter_set_id %u\n"
 		  "seq_parameter_set_id %u\n"
 		  "pic_width_in_luma_samples %u\n"
 		  "pic_height_in_luma_samples %u\n"
@@ -1171,6 +1258,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 		  "chroma_format_idc %u\n"
 		  "sps_max_sub_layers_minus1 %u\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->video_parameter_set_id,
 		  __entry->seq_parameter_set_id,
 		  __entry->pic_width_in_luma_samples,
@@ -1213,9 +1301,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field(__u8, pic_parameter_set_id)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_pps *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u8, pic_parameter_set_id)
 			 __field(__u8, num_extra_slice_header_bits)
 			 __field(__u8, num_ref_idx_l0_default_active_minus1)
 			 __field(__u8, num_ref_idx_l1_default_active_minus1)
@@ -1231,7 +1321,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 			 __field(__s8, pps_tc_offset_div2)
 			 __field(__u8, log2_parallel_merge_level_minus2)
 			 __field(__u64, flags)),
-	TP_fast_assign(__entry->pic_parameter_set_id = p->pic_parameter_set_id;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->pic_parameter_set_id = p->pic_parameter_set_id;
 		       __entry->num_extra_slice_header_bits = p->num_extra_slice_header_bits;
 		       __entry->num_ref_idx_l0_default_active_minus1 =
 				p->num_ref_idx_l0_default_active_minus1;
@@ -1252,7 +1344,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 		       __entry->log2_parallel_merge_level_minus2 =
 				p->log2_parallel_merge_level_minus2;
 		       __entry->flags = p->flags;),
-	TP_printk("\npic_parameter_set_id %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\npic_parameter_set_id %u\n"
 		  "num_extra_slice_header_bits %u\n"
 		  "num_ref_idx_l0_default_active_minus1 %u\n"
 		  "num_ref_idx_l1_default_active_minus1 %u\n"
@@ -1268,6 +1361,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 		  "pps_tc_offset_div2 %d\n"
 		  "log2_parallel_merge_level_minus2 %u\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->pic_parameter_set_id,
 		  __entry->num_extra_slice_header_bits,
 		  __entry->num_ref_idx_l0_default_active_minus1,
@@ -1322,9 +1416,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field(__u32, bit_size)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_slice_params *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u32, bit_size)
 			 __field(__u32, data_byte_offset)
 			 __field(__u32, num_entry_point_offsets)
 			 __field(__u8, nal_unit_type)
@@ -1351,7 +1447,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 			 __field(__u16, short_term_ref_pic_set_size)
 			 __field(__u16, long_term_ref_pic_set_size)
 			 __field(__u64, flags)),
-	TP_fast_assign(__entry->bit_size = s->bit_size;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->bit_size = s->bit_size;
 		       __entry->data_byte_offset = s->data_byte_offset;
 		       __entry->num_entry_point_offsets = s->num_entry_point_offsets;
 		       __entry->nal_unit_type = s->nal_unit_type;
@@ -1378,7 +1476,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 		       __entry->short_term_ref_pic_set_size = s->short_term_ref_pic_set_size;
 		       __entry->long_term_ref_pic_set_size = s->long_term_ref_pic_set_size;
 		       __entry->flags = s->flags;),
-	TP_printk("\nbit_size %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nbit_size %u\n"
 		  "data_byte_offset %u\n"
 		  "num_entry_point_offsets %u\n"
 		  "nal_unit_type %u\n"
@@ -1405,6 +1504,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 		  "short_term_ref_pic_set_size %u\n"
 		  "long_term_ref_pic_set_size %u\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->bit_size,
 		  __entry->data_byte_offset,
 		  __entry->num_entry_point_offsets,
@@ -1454,9 +1554,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
-	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__array(__s8, delta_luma_weight_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_pred_weight_table *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__s8, delta_luma_weight_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
 			 __array(__s8, luma_offset_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
 			 __array(__s8, delta_chroma_weight_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX * 2)
 			 __array(__s8, chroma_offset_l0, V4L2_HEVC_DPB_ENTRIES_NUM_MAX * 2)
@@ -1466,7 +1568,9 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 			 __array(__s8, chroma_offset_l1, V4L2_HEVC_DPB_ENTRIES_NUM_MAX * 2)
 			 __field(__u8, luma_log2_weight_denom)
 			 __field(__s8, delta_chroma_log2_weight_denom)),
-	TP_fast_assign(memcpy(__entry->delta_luma_weight_l0, p->delta_luma_weight_l0,
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->delta_luma_weight_l0, p->delta_luma_weight_l0,
 			      sizeof(__entry->delta_luma_weight_l0));
 		       memcpy(__entry->luma_offset_l0, p->luma_offset_l0,
 			      sizeof(__entry->luma_offset_l0));
@@ -1485,7 +1589,8 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 		       __entry->luma_log2_weight_denom = p->luma_log2_weight_denom;
 		       __entry->delta_chroma_log2_weight_denom =
 				p->delta_chroma_log2_weight_denom;),
-	TP_printk("\ndelta_luma_weight_l0 %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\ndelta_luma_weight_l0 %s\n"
 		  "luma_offset_l0 %s\n"
 		  "delta_chroma_weight_l0 {%s}\n"
 		  "chroma_offset_l0 {%s}\n"
@@ -1495,6 +1600,7 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 		  "chroma_offset_l1 {%s}\n"
 		  "luma_log2_weight_denom %d\n"
 		  "delta_chroma_log2_weight_denom %d\n",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->delta_luma_weight_l0,
 				ARRAY_SIZE(__entry->delta_luma_weight_l0),
 				sizeof(__entry->delta_luma_weight_l0[0])),
@@ -1529,15 +1635,19 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 	))
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__array(__u8, scaling_list_4x4, 6 * 16)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_scaling_matrix *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__u8, scaling_list_4x4, 6 * 16)
 			 __array(__u8, scaling_list_8x8, 6 * 64)
 			 __array(__u8, scaling_list_16x16, 6 * 64)
 			 __array(__u8, scaling_list_32x32, 2 * 64)
 			 __array(__u8, scaling_list_dc_coef_16x16, 6)
 			 __array(__u8, scaling_list_dc_coef_32x32, 2)),
-	TP_fast_assign(memcpy(__entry->scaling_list_4x4,
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->scaling_list_4x4,
 			      s->scaling_list_4x4, sizeof(__entry->scaling_list_4x4));
 		       memcpy(__entry->scaling_list_8x8,
 			      s->scaling_list_8x8, sizeof(__entry->scaling_list_8x8));
@@ -1551,12 +1661,14 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
 		       memcpy(__entry->scaling_list_dc_coef_32x32,
 			      s->scaling_list_dc_coef_32x32,
 			      sizeof(__entry->scaling_list_dc_coef_32x32));),
-	TP_printk("\nscaling_list_4x4 {%s}\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nscaling_list_4x4 {%s}\n"
 		  "scaling_list_8x8 {%s}\n"
 		  "scaling_list_16x16 {%s}\n"
 		  "scaling_list_32x32 {%s}\n"
 		  "scaling_list_dc_coef_16x16 %s\n"
 		  "scaling_list_dc_coef_32x32 %s\n",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->scaling_list_4x4,
 				   sizeof(__entry->scaling_list_4x4),
@@ -1582,9 +1694,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
 	))
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
-	TP_ARGS(d),
-	TP_STRUCT__entry(__field(__s32, pic_order_cnt_val)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_decode_params *d),
+	TP_ARGS(tgid, fd, d),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__s32, pic_order_cnt_val)
 			 __field(__u16, short_term_ref_pic_set_size)
 			 __field(__u16, long_term_ref_pic_set_size)
 			 __field(__u8, num_active_dpb_entries)
@@ -1595,7 +1709,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 			 __array(__u8, poc_st_curr_after, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
 			 __array(__u8, poc_lt_curr, V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
 			 __field(__u64, flags)),
-	TP_fast_assign(__entry->pic_order_cnt_val = d->pic_order_cnt_val;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->pic_order_cnt_val = d->pic_order_cnt_val;
 		       __entry->short_term_ref_pic_set_size = d->short_term_ref_pic_set_size;
 		       __entry->long_term_ref_pic_set_size = d->long_term_ref_pic_set_size;
 		       __entry->num_active_dpb_entries = d->num_active_dpb_entries;
@@ -1608,7 +1724,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 			      sizeof(__entry->poc_st_curr_after));
 		       memcpy(__entry->poc_lt_curr, d->poc_lt_curr, sizeof(__entry->poc_lt_curr));
 		       __entry->flags = d->flags;),
-	TP_printk("\npic_order_cnt_val %d\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\npic_order_cnt_val %d\n"
 		  "short_term_ref_pic_set_size %u\n"
 		  "long_term_ref_pic_set_size %u\n"
 		  "num_active_dpb_entries %u\n"
@@ -1619,6 +1736,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 		  "poc_st_curr_after %s\n"
 		  "poc_lt_curr %s\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->pic_order_cnt_val,
 		  __entry->short_term_ref_pic_set_size,
 		  __entry->long_term_ref_pic_set_size,
@@ -1643,14 +1761,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
-	TP_ARGS(lt),
-	TP_STRUCT__entry(__field(__u8, flags)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
+	TP_ARGS(tgid, fd, lt),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u8, flags)
 			 __field(__u32, lt_ref_pic_poc_lsb_sps)),
-	TP_fast_assign(__entry->flags = lt->flags;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->flags = lt->flags;
 		       __entry->lt_ref_pic_poc_lsb_sps = lt->lt_ref_pic_poc_lsb_sps;),
-	TP_printk("\nflags %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nflags %s\n"
 		  "lt_ref_pic_poc_lsb_sps %x\n",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
 		  ),
@@ -1659,9 +1783,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
-	TP_ARGS(st),
-	TP_STRUCT__entry(__field(__u8, flags)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
+	TP_ARGS(tgid, fd, st),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u8, flags)
 			 __field(__u8, delta_idx_minus1)
 			 __field(__u8, delta_rps_sign)
 			 __field(__u16, abs_delta_rps_minus1)
@@ -1671,7 +1797,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 			 __field(__u32, use_delta_flag)
 			 __array(__u32, delta_poc_s0_minus1, 16)
 			 __array(__u32, delta_poc_s1_minus1, 16)),
-	TP_fast_assign(__entry->flags = st->flags;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->flags = st->flags;
 		       __entry->delta_idx_minus1 = st->delta_idx_minus1;
 		       __entry->delta_rps_sign = st->delta_rps_sign;
 		       __entry->abs_delta_rps_minus1 = st->abs_delta_rps_minus1;
@@ -1683,7 +1811,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 			      sizeof(__entry->delta_poc_s0_minus1));
 		       memcpy(__entry->delta_poc_s1_minus1, st->delta_poc_s1_minus1,
 			      sizeof(__entry->delta_poc_s1_minus1));),
-	TP_printk("\nflags %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nflags %s\n"
 		  "delta_idx_minus1: %u\n"
 		  "delta_rps_sign: %u\n"
 		  "abs_delta_rps_minus1: %u\n"
@@ -1693,6 +1822,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 		  "use_delta_flag: %08x\n"
 		  "delta_poc_s0_minus1: %s\n"
 		  "delta_poc_s1_minus1: %s\n",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_REF_PIC_SET_PRED"}
 		  ),
@@ -1713,20 +1843,26 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
-	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
-	TP_ARGS(e),
-	TP_STRUCT__entry(__field(__u64, timestamp)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_dpb_entry *e),
+	TP_ARGS(tgid, fd, e),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u64, timestamp)
 			 __field(__u8, flags)
 			 __field(__u8, field_pic)
 			 __field(__s32, pic_order_cnt_val)),
-	TP_fast_assign(__entry->timestamp = e->timestamp;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->timestamp = e->timestamp;
 		       __entry->flags = e->flags;
 		       __entry->field_pic = e->field_pic;
 		       __entry->pic_order_cnt_val = e->pic_order_cnt_val;),
-	TP_printk("\ntimestamp %llu\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\ntimestamp %llu\n"
 		  "flags %s\n"
 		  "field_pic %u\n"
 		  "pic_order_cnt_val %d\n",
+		  __entry->tgid, __entry->fd,
 		__entry->timestamp,
 		__print_flags(__entry->flags, "|",
 		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE, "LONG_TERM_REFERENCE"}
@@ -1736,69 +1872,75 @@ DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
 	))
 
 DEFINE_EVENT(v4l2_ctrl_hevc_sps_tmpl, v4l2_ctrl_hevc_sps,
-	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_sps *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_ctrl_hevc_pps_tmpl, v4l2_ctrl_hevc_pps,
-	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
-	TP_ARGS(p)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_pps *p),
+	TP_ARGS(tgid, fd, p)
 );
 
 DEFINE_EVENT(v4l2_ctrl_hevc_slice_params_tmpl, v4l2_ctrl_hevc_slice_params,
-	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_slice_params *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_hevc_pred_weight_table_tmpl, v4l2_hevc_pred_weight_table,
-	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
-	TP_ARGS(p)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_pred_weight_table *p),
+	TP_ARGS(tgid, fd, p)
 );
 
 DEFINE_EVENT(v4l2_ctrl_hevc_scaling_matrix_tmpl, v4l2_ctrl_hevc_scaling_matrix,
-	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_scaling_matrix *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_ctrl_hevc_decode_params_tmpl, v4l2_ctrl_hevc_decode_params,
-	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
-	TP_ARGS(d)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_decode_params *d),
+	TP_ARGS(tgid, fd, d)
 );
 
 DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl, v4l2_ctrl_hevc_ext_sps_lt_rps,
-	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
-	TP_ARGS(lt)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
+	TP_ARGS(tgid, fd, lt)
 );
 
 DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl, v4l2_ctrl_hevc_ext_sps_st_rps,
-	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
-	TP_ARGS(st)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
+	TP_ARGS(tgid, fd, st)
 );
 
 DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
-	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
-	TP_ARGS(e)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_dpb_entry *e),
+	TP_ARGS(tgid, fd, e)
 );
 
 /* MPEG2 controls */
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field(__u16, horizontal_size)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_sequence *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u16, horizontal_size)
 			 __field(__u16, vertical_size)
 			 __field(__u32, vbv_buffer_size)
 			 __field(__u16, profile_and_level_indication)
 			 __field(__u8, chroma_format)
 			 __field(__u8, flags)),
-	TP_fast_assign(__entry->horizontal_size = s->horizontal_size;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->horizontal_size = s->horizontal_size;
 		       __entry->vertical_size = s->vertical_size;
 		       __entry->vbv_buffer_size = s->vbv_buffer_size;
 		       __entry->profile_and_level_indication = s->profile_and_level_indication;
 		       __entry->chroma_format = s->chroma_format;
 		       __entry->flags = s->flags;),
-	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n"
 		  "profile_and_level_indication %u\nchroma_format %u\nflags %s\n",
+		  __entry->tgid, __entry->fd,
 		  __entry->horizontal_size,
 		  __entry->vertical_size,
 		  __entry->vbv_buffer_size,
@@ -1810,24 +1952,30 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field(__u64, backward_ref_ts)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_picture *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u64, backward_ref_ts)
 			 __field(__u64, forward_ref_ts)
 			 __field(__u32, flags)
 			 __array(__u8, f_code, 4)
 			 __field(__u8, picture_coding_type)
 			 __field(__u8, picture_structure)
 			 __field(__u8, intra_dc_precision)),
-	TP_fast_assign(__entry->backward_ref_ts = p->backward_ref_ts;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->backward_ref_ts = p->backward_ref_ts;
 		       __entry->forward_ref_ts = p->forward_ref_ts;
 		       __entry->flags = p->flags;
 		       memcpy(__entry->f_code, p->f_code, sizeof(__entry->f_code));
 		       __entry->picture_coding_type = p->picture_coding_type;
 		       __entry->picture_structure = p->picture_structure;
 		       __entry->intra_dc_precision = p->intra_dc_precision;),
-	TP_printk("\nbackward_ref_ts %llu\nforward_ref_ts %llu\nflags %s\nf_code {%s}\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nbackward_ref_ts %llu\nforward_ref_ts %llu\nflags %s\nf_code {%s}\n"
 		  "picture_coding_type: %u\npicture_structure %u\nintra_dc_precision %u\n",
+		  __entry->tgid, __entry->fd,
 		  __entry->backward_ref_ts,
 		  __entry->forward_ref_ts,
 		  __print_flags(__entry->flags, "|",
@@ -1850,13 +1998,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
-	TP_ARGS(q),
-	TP_STRUCT__entry(__array(__u8, intra_quantiser_matrix, 64)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_quantisation *q),
+	TP_ARGS(tgid, fd, q),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__u8, intra_quantiser_matrix, 64)
 			 __array(__u8, non_intra_quantiser_matrix, 64)
 			 __array(__u8, chroma_intra_quantiser_matrix, 64)
 			 __array(__u8, chroma_non_intra_quantiser_matrix, 64)),
-	TP_fast_assign(memcpy(__entry->intra_quantiser_matrix, q->intra_quantiser_matrix,
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->intra_quantiser_matrix, q->intra_quantiser_matrix,
 			      sizeof(__entry->intra_quantiser_matrix));
 		       memcpy(__entry->non_intra_quantiser_matrix, q->non_intra_quantiser_matrix,
 			      sizeof(__entry->non_intra_quantiser_matrix));
@@ -1866,8 +2018,10 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
 		       memcpy(__entry->chroma_non_intra_quantiser_matrix,
 			      q->chroma_non_intra_quantiser_matrix,
 			      sizeof(__entry->chroma_non_intra_quantiser_matrix));),
-	TP_printk("\nintra_quantiser_matrix %s\nnon_intra_quantiser_matrix %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nintra_quantiser_matrix %s\nnon_intra_quantiser_matrix %s\n"
 		  "chroma_intra_quantiser_matrix %s\nchroma_non_intra_quantiser_matrix %s\n",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->intra_quantiser_matrix,
 				ARRAY_SIZE(__entry->intra_quantiser_matrix),
 				sizeof(__entry->intra_quantiser_matrix[0])),
@@ -1884,30 +2038,34 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
 )
 
 DEFINE_EVENT(v4l2_ctrl_mpeg2_seq_tmpl, v4l2_ctrl_mpeg2_sequence,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
-	TP_ARGS(s)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_sequence *s),
+	TP_ARGS(tgid, fd, s)
 );
 
 DEFINE_EVENT(v4l2_ctrl_mpeg2_pic_tmpl, v4l2_ctrl_mpeg2_picture,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
-	TP_ARGS(p)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_picture *p),
+	TP_ARGS(tgid, fd, p)
 );
 
 DEFINE_EVENT(v4l2_ctrl_mpeg2_quant_tmpl, v4l2_ctrl_mpeg2_quantisation,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
-	TP_ARGS(q)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_quantisation *q),
+	TP_ARGS(tgid, fd, q)
 );
 
 /* VP8 controls */
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__array(__u8, entropy_coeff_probs, 4 * 8 * 3 * V4L2_VP8_COEFF_PROB_CNT)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__u8, entropy_coeff_probs, 4 * 8 * 3 * V4L2_VP8_COEFF_PROB_CNT)
 			 __array(__u8, entropy_y_mode_probs, 4)
 			 __array(__u8, entropy_uv_mode_probs, 3)
 			 __array(__u8, entropy_mv_probs, 2 * 19)),
-	TP_fast_assign(memcpy(__entry->entropy_coeff_probs, f->entropy.coeff_probs,
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->entropy_coeff_probs, f->entropy.coeff_probs,
 			      sizeof(__entry->entropy_coeff_probs));
 		       memcpy(__entry->entropy_y_mode_probs, f->entropy.y_mode_probs,
 			      sizeof(__entry->entropy_y_mode_probs));
@@ -1915,10 +2073,12 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
 			      sizeof(__entry->entropy_uv_mode_probs));
 		       memcpy(__entry->entropy_mv_probs, f->entropy.mv_probs,
 			      sizeof(__entry->entropy_mv_probs));),
-	TP_printk("\nentropy.coeff_probs {%s}\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nentropy.coeff_probs {%s}\n"
 		  "entropy.y_mode_probs %s\n"
 		  "entropy.uv_mode_probs %s\n"
 		  "entropy.mv_probs {%s}",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->entropy_coeff_probs,
 				   sizeof(__entry->entropy_coeff_probs),
@@ -1937,9 +2097,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
 )
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__array(__s8, segment_quant_update, 4)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__s8, segment_quant_update, 4)
 			 __array(__s8, segment_lf_update, 4)
 			 __array(__u8, segment_segment_probs, 3)
 			 __field(__u32, segment_flags)
@@ -1974,7 +2136,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 			 __field(__u64, golden_frame_ts)
 			 __field(__u64, alt_frame_ts)
 			 __field(__u64, flags)),
-	TP_fast_assign(memcpy(__entry->segment_quant_update, f->segment.quant_update,
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->segment_quant_update, f->segment.quant_update,
 			      sizeof(__entry->segment_quant_update));
 		       memcpy(__entry->segment_lf_update, f->segment.lf_update,
 			      sizeof(__entry->segment_lf_update));
@@ -2015,7 +2179,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 		       __entry->golden_frame_ts = f->golden_frame_ts;
 		       __entry->alt_frame_ts = f->alt_frame_ts;
 		       __entry->flags = f->flags;),
-	TP_printk("\nsegment.quant_update %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nsegment.quant_update %s\n"
 		  "segment.lf_update %s\n"
 		  "segment.segment_probs %s\n"
 		  "segment.flags %s\n"
@@ -2050,6 +2215,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 		  "golden_frame_ts %llu\n"
 		  "alt_frame_ts %llu\n"
 		  "flags %s",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->segment_quant_update,
 				ARRAY_SIZE(__entry->segment_quant_update),
 				sizeof(__entry->segment_quant_update[0])),
@@ -2114,21 +2280,23 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 );
 
 DEFINE_EVENT(v4l2_ctrl_vp8_frame_tmpl, v4l2_ctrl_vp8_frame,
-	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
-	TP_ARGS(f)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
+	TP_ARGS(tgid, fd, f)
 );
 
 DEFINE_EVENT(v4l2_ctrl_vp8_entropy_tmpl, v4l2_ctrl_vp8_entropy,
-	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
-	TP_ARGS(f)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
+	TP_ARGS(tgid, fd, f)
 );
 
 /* VP9 controls */
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__array(__s8, lf_ref_deltas, 4)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__s8, lf_ref_deltas, 4)
 			 __array(__s8, lf_mode_deltas, 2)
 			 __field(__u8, lf_level)
 			 __field(__u8, lf_sharpness)
@@ -2161,7 +2329,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 			 __field(__u8, tile_cols_log2)
 			 __field(__u8, tile_rows_log2)
 			 __field(__u8, reference_mode)),
-	TP_fast_assign(memcpy(__entry->lf_ref_deltas, f->lf.ref_deltas,
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->lf_ref_deltas, f->lf.ref_deltas,
 			      sizeof(__entry->lf_ref_deltas));
 		       memcpy(__entry->lf_mode_deltas, f->lf.mode_deltas,
 			      sizeof(__entry->lf_mode_deltas));
@@ -2200,7 +2370,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 		       __entry->tile_cols_log2 = f->tile_cols_log2;
 		       __entry->tile_rows_log2 = f->tile_rows_log2;
 		       __entry->reference_mode = f->reference_mode;),
-	TP_printk("\nlf.ref_deltas %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\nlf.ref_deltas %s\n"
 		  "lf.mode_deltas %s\n"
 		  "lf.level %u\n"
 		  "lf.sharpness %u\n"
@@ -2233,6 +2404,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 		  "tile_cols_log2 %u\n"
 		  "tile_rows_log_2 %u\n"
 		  "reference_mode %s\n",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->lf_ref_deltas,
 				ARRAY_SIZE(__entry->lf_ref_deltas),
 				sizeof(__entry->lf_ref_deltas[0])),
@@ -2313,9 +2485,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
-	TP_ARGS(h),
-	TP_STRUCT__entry(__field(__u8, tx_mode)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h),
+	TP_ARGS(tgid, fd, h),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(__u8, tx_mode)
 			 __array(__u8, tx8, 2 * 1)
 			 __array(__u8, tx16, 2 * 2)
 			 __array(__u8, tx32, 2 * 3)
@@ -2329,7 +2503,9 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 			 __array(__u8, y_mode, 4 * 9)
 			 __array(__u8, uv_mode, 10 * 9)
 			 __array(__u8, partition, 16 * 3)),
-	TP_fast_assign(__entry->tx_mode = h->tx_mode;
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->tx_mode = h->tx_mode;
 		       memcpy(__entry->tx8, h->tx8, sizeof(__entry->tx8));
 		       memcpy(__entry->tx16, h->tx16, sizeof(__entry->tx16));
 		       memcpy(__entry->tx32, h->tx32, sizeof(__entry->tx32));
@@ -2344,7 +2520,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 		       memcpy(__entry->y_mode, h->y_mode, sizeof(__entry->y_mode));
 		       memcpy(__entry->uv_mode, h->uv_mode, sizeof(__entry->uv_mode));
 		       memcpy(__entry->partition, h->partition, sizeof(__entry->partition));),
-	TP_printk("\ntx_mode %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\ntx_mode %s\n"
 		  "tx8 {%s}\n"
 		  "tx16 {%s}\n"
 		  "tx32 {%s}\n"
@@ -2358,6 +2535,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 		  "y_mode {%s}\n"
 		  "uv_mode {%s}\n"
 		  "partition {%s}\n",
+		  __entry->tgid, __entry->fd,
 		  __print_symbolic(__entry->tx_mode,
 		  {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
 		  {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
@@ -2416,11 +2594,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
-	TP_ARGS(h),
-	TP_STRUCT__entry(__array(__u8, coef, 4 * 2 * 2 * 6 * 6 * 3)),
-	TP_fast_assign(memcpy(__entry->coef, h->coef, sizeof(__entry->coef));),
-	TP_printk("\n coef {%s}",
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h),
+	TP_ARGS(tgid, fd, h),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__u8, coef, 4 * 2 * 2 * 6 * 6 * 3)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->coef, h->coef, sizeof(__entry->coef));),
+	TP_printk("tgid = %u, fd = %u, "
+		  "\n coef {%s}",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->coef,
 				   sizeof(__entry->coef),
@@ -2429,9 +2613,11 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
-	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__array(__u8, joint, 3)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_vp9_mv_probs *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __array(__u8, joint, 3)
 			 __array(__u8, sign, 2)
 			 __array(__u8, classes, 2 * 10)
 			 __array(__u8, class0_bit, 2)
@@ -2440,7 +2626,9 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 			 __array(__u8, fr, 2 * 3)
 			 __array(__u8, class0_hp, 2)
 			 __array(__u8, hp, 2)),
-	TP_fast_assign(memcpy(__entry->joint, p->joint, sizeof(__entry->joint));
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       memcpy(__entry->joint, p->joint, sizeof(__entry->joint));
 		       memcpy(__entry->sign, p->sign, sizeof(__entry->sign));
 		       memcpy(__entry->classes, p->classes, sizeof(__entry->classes));
 		       memcpy(__entry->class0_bit, p->class0_bit, sizeof(__entry->class0_bit));
@@ -2449,7 +2637,8 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 		       memcpy(__entry->fr, p->fr, sizeof(__entry->fr));
 		       memcpy(__entry->class0_hp, p->class0_hp, sizeof(__entry->class0_hp));
 		       memcpy(__entry->hp, p->hp, sizeof(__entry->hp));),
-	TP_printk("\n joint %s\n"
+	TP_printk("tgid = %u, fd = %u, "
+		  "\n joint %s\n"
 		  "sign %s\n"
 		  "classes {%s}\n"
 		  "class0_bit %s\n"
@@ -2458,6 +2647,7 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 		  "fr {%s}\n"
 		  "class0_hp %s\n"
 		  "hp %s\n",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->joint,
 				ARRAY_SIZE(__entry->joint),
 				sizeof(__entry->joint[0])),
@@ -2493,24 +2683,24 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 );
 
 DEFINE_EVENT(v4l2_ctrl_vp9_frame_tmpl, v4l2_ctrl_vp9_frame,
-	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
-	TP_ARGS(f)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_frame *f),
+	TP_ARGS(tgid, fd, f)
 );
 
 DEFINE_EVENT(v4l2_ctrl_vp9_compressed_hdr_tmpl, v4l2_ctrl_vp9_compressed_hdr,
-	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
-	TP_ARGS(h)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h),
+	TP_ARGS(tgid, fd, h)
 );
 
 DEFINE_EVENT(v4l2_ctrl_vp9_compressed_coef_tmpl, v4l2_ctrl_vp9_compressed_coeff,
-	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
-	TP_ARGS(h)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h),
+	TP_ARGS(tgid, fd, h)
 );
 
 
 DEFINE_EVENT(v4l2_vp9_mv_probs_tmpl, v4l2_vp9_mv_probs,
-	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
-	TP_ARGS(p)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_vp9_mv_probs *p),
+	TP_ARGS(tgid, fd, p)
 );
 
 #endif /* if !defined(_TRACE_V4L2_CONTROLS_H_) || defined(TRACE_HEADER_MULTI_READ) */

-- 
2.54.0


