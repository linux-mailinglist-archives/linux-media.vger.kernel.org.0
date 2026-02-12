Return-Path: <linux-media+bounces-52666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EXOEd/+jWm0+AAAu9opvQ
	(envelope-from <linux-media+bounces-52666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:25:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7412F5E0
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F80C309E7A2
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D728E35D5FC;
	Thu, 12 Feb 2026 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TH92q0R7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C423559F1;
	Thu, 12 Feb 2026 16:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913434; cv=none; b=e9jpZxpHeGkzuEaCGGrqHob3ziy8OlgPoBcHnaeTRjzLg+/Te6hL9tXsPWFSyCOcT37N9ja9zDYZpsLpUgo6xdDGL+5YMgFsvhlud7euj/y2NyzT7STpj52hrNOEi9FbHFh7uTt3X5wJWIIfWveG4EC3AiMBAfHDI/Hszj6yJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913434; c=relaxed/simple;
	bh=GPRnpO6ypKwBjVC/4+7i47pgavRgC7x0EB0ZX75Yx/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vg7EnfVT0DL9Z8qr+sVU42yBsBnINiy5iUx3uuxPJ80aIbVvbLpdoQmHxrMx5Az8HPBedcUgs/CCP6lNyb8ULXwIopAMqIn43XqC3O8ZuCRqb+eRxsw/H2Q/R1WlGrVLuMdYhZBsqflakol2PeHuKsYirAbmbc/BN7Jz3YK4TWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TH92q0R7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913429;
	bh=GPRnpO6ypKwBjVC/4+7i47pgavRgC7x0EB0ZX75Yx/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TH92q0R7arPb5lPCI6xl495DygaAbp7yi7f8ei8mpIjh9La5ILbqeVjmrCBmAwjQC
	 X6plCBGn8KV5KhRLqxZ67SiClZJFhyiwJOR42vAWfOOnApT7PLmEg0cASLNG2gP1tG
	 +Nax2PBoUBZ18L6SLeg/qz2NFeibXTgEjNijUf0p8jG9WIozf1r+b0iyn8fTPrMNXm
	 wpY+iundXBj0sQwSAOZlY72LW+BHeCGX1T99wG1aEqpiB6jMI4LGAzDy2TB71iH2Jn
	 fCz75EK0+HlB4chqVD1TL4R7waUHWb/d/J9Eob+fOhGeZGr2sXebaVDpNgQuZQZ9Gi
	 SoGp4mAaSF/VQ==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5417C17E0E6A;
	Thu, 12 Feb 2026 17:23:46 +0100 (CET)
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
Subject: [PATCH 04/11] media: Add tgid and fd to the v4l2-requests trace fields
Date: Thu, 12 Feb 2026 11:23:21 -0500
Message-ID: <20260212162328.192217-5-detlev.casanova@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52666-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: D6F7412F5E0
X-Rspamd-Action: no action

With these fields, userspace can better track which trace event matches
with a given stream.

Even though the trace shows the PID (based on current->tgid), trace
functions could be called from other contexts, therefore showing the wrong
PID, or none at all.

These will ensure that the trace event can be matched with the PID/FD that
opened and configured the video device file.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c |  68 +--
 include/trace/events/v4l2_requests.h       | 622 +++++++++++++--------
 2 files changed, 439 insertions(+), 251 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index d49208e83726..fc216da17048 100644
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
diff --git a/include/trace/events/v4l2_requests.h b/include/trace/events/v4l2_requests.h
index 34f4a74df5ea..ab6718f40e28 100644
--- a/include/trace/events/v4l2_requests.h
+++ b/include/trace/events/v4l2_requests.h
@@ -10,12 +10,18 @@
 
 /* AV1 controls */
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_sequence, s)),
-	TP_fast_assign(__entry->s = *s;),
-	TP_printk("flags = %s, seq_profile = %u, order_hint_bits = %u, bit_depth = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_sequence *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_av1_sequence, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "flags = %s, seq_profile = %u, order_hint_bits = %u, bit_depth = %u, "
 		  "max_frame_width_minus_1 = %u, max_frame_height_minus_1 = %u",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->s.flags, "|",
 		  {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
 		  {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK, "USE_128X128_SUPERBLOCK"},
@@ -46,11 +52,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
-	TP_ARGS(t),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_tile_group_entry, t)),
-	TP_fast_assign(__entry->t = *t;),
-	TP_printk("tile_offset = %u, tile_size = %u, tile_row = %u, tile_col = %u",
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_tile_group_entry *t),
+	TP_ARGS(tgid, fd, t),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_av1_tile_group_entry, t)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->t = *t;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "tile_offset = %u, tile_size = %u, tile_row = %u, tile_col = %u",
+		  __entry->tgid, __entry->fd,
 		  __entry->t.tile_offset,
 		  __entry->t.tile_size,
 		  __entry->t.tile_row,
@@ -59,11 +71,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
-	TP_printk("tile_info.flags = %s, tile_info.context_update_tile_id = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_av1_frame, f)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->f = *f;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "tile_info.flags = %s, tile_info.context_update_tile_id = %u, "
 		  "tile_info.tile_cols = %u, tile_info.tile_rows = %u, "
 		  "tile_info.mi_col_starts = %s, tile_info.mi_row_starts = %s, "
 		  "tile_info.width_in_sbs_minus_1 = %s, tile_info.height_in_sbs_minus_1 = %s, "
@@ -87,6 +104,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 		  "render_width_minus_1 = %u, render_height_minus_1 = %u, current_frame_id = %u, "
 		  "buffer_removal_time = %s, order_hints = %s, reference_frame_ts = %s, "
 		  "ref_frame_idx = %s, refresh_frame_flags = %u",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->f.tile_info.flags, "|",
 		  {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING, "UNIFORM_TILE_SPACING"}),
 		  __entry->f.tile_info.context_update_tile_id,
@@ -222,11 +240,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
 
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_film_grain, f)),
-	TP_fast_assign(__entry->f = *f;),
-	TP_printk("flags = %s, cr_mult = %u, grain_seed = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_film_grain *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_av1_film_grain, f)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->f = *f;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "flags = %s, cr_mult = %u, grain_seed = %u, "
 		  "film_grain_params_ref_idx = %u, num_y_points = %u, point_y_value = %s, "
 		  "point_y_scaling = %s, num_cb_points = %u, point_cb_value = %s, "
 		  "point_cb_scaling = %s, num_cr_points = %u, point_cr_value = %s, "
@@ -235,6 +258,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
 		  "ar_coeffs_cr_plus_128 = %s, ar_coeff_shift_minus_6 = %u, "
 		  "grain_scale_shift = %u, cb_mult = %u, cb_luma_mult = %u, cr_luma_mult = %u, "
 		  "cb_offset = %u, cr_offset = %u",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->f.flags, "|",
 		  {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
 		  {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
@@ -287,31 +311,32 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
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
@@ -322,7 +347,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 			 __field(u32, ycbcr_enc)
 			 __field(u32, quantization)
 			 ),
-	TP_fast_assign(
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
 		       __entry->backward_ref_ts = p->backward_ref_ts;
 		       __entry->version = p->version;
 		       __entry->width = p->width;
@@ -333,7 +359,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 		       __entry->ycbcr_enc = p->ycbcr_enc;
 		       __entry->quantization = p->quantization;
 		       ),
-	TP_printk("backward_ref_ts = %llu, "
+	TP_printk("tgid = %u, fd = %u, "
+		  "backward_ref_ts = %llu, "
 		  "version = %u, "
 		  "width = %u, "
 		  "height = %u, "
@@ -342,6 +369,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
 		  "xfer_func = %u, "
 		  "ycbcr_enc = %u, "
 		  "quantization = %u",
+		  __entry->tgid, __entry->fd,
 		  __entry->backward_ref_ts, __entry->version, __entry->width, __entry->height,
 		  __print_flags(__entry->flags, "|",
 		  {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
@@ -361,18 +389,23 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
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
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
-	TP_fast_assign(__entry->s = *s),
-	TP_printk("profile_idc = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_sps *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_h264_sps, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s),
+	TP_printk("tgid = %u, fd = %u, "
+		  "profile_idc = %u, "
 		  "constraint_set_flags = %s, "
 		  "level_idc = %u, "
 		  "seq_parameter_set_id = %u, "
@@ -390,6 +423,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 		  "pic_width_in_mbs_minus1 = %u, "
 		  "pic_height_in_map_units_minus1 = %u, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->s.profile_idc,
 		  __print_flags(__entry->s.constraint_set_flags, "|",
 		  {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG"},
@@ -427,11 +461,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
-	TP_fast_assign(__entry->p = *p),
-	TP_printk("pic_parameter_set_id = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pps *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_h264_pps, p)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->p = *p),
+	TP_printk("tgid = %u, fd = %u, "
+		  "pic_parameter_set_id = %u, "
 		  "seq_parameter_set_id = %u, "
 		  "num_slice_groups_minus1 = %u, "
 		  "num_ref_idx_l0_default_active_minus1 = %u, "
@@ -442,6 +481,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 		  "chroma_qp_index_offset = %d, "
 		  "second_chroma_qp_index_offset = %d, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->p.pic_parameter_set_id,
 		  __entry->p.seq_parameter_set_id,
 		  __entry->p.num_slice_groups_minus1,
@@ -465,11 +505,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matrix, s)),
-	TP_fast_assign(__entry->s = *s),
-	TP_printk("scaling_list_4x4 = {%s}, scaling_list_8x8 = {%s}",
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_scaling_matrix *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_h264_scaling_matrix, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s),
+	TP_printk("tgid = %u, fd = %u, "
+		  "scaling_list_4x4 = {%s}, scaling_list_8x8 = {%s}",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->s.scaling_list_4x4,
 				   sizeof(__entry->s.scaling_list_4x4),
@@ -482,11 +528,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights, p)),
-	TP_fast_assign(__entry->p = *p),
-	TP_printk("luma_log2_weight_denom = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pred_weights *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_h264_pred_weights, p)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->p = *p),
+	TP_printk("tgid = %u, fd = %u, "
+		  "luma_log2_weight_denom = %u, "
 		  "chroma_log2_weight_denom = %u, "
 		  "weight_factor[0].luma_weight = %s, "
 		  "weight_factor[0].luma_offset = %s, "
@@ -496,6 +547,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 		  "weight_factor[1].luma_offset = %s, "
 		  "weight_factor[1].chroma_weight = {%s}, "
 		  "weight_factor[1].chroma_offset = {%s}",
+		  __entry->tgid, __entry->fd,
 		  __entry->p.luma_log2_weight_denom,
 		  __entry->p.chroma_log2_weight_denom,
 		  __print_array(__entry->p.weight_factors[0].luma_weight,
@@ -530,11 +582,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params, s)),
-	TP_fast_assign(__entry->s = *s),
-	TP_printk("header_bit_size = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_slice_params *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_h264_slice_params, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s),
+	TP_printk("tgid = %u, fd = %u, "
+		  "header_bit_size = %u, "
 		  "first_mb_in_slice = %u, "
 		  "slice_type = %s, "
 		  "colour_plane_id = %u, "
@@ -548,6 +605,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 		  "num_ref_idx_l0_active_minus1 = %u, "
 		  "num_ref_idx_l1_active_minus1 = %u, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->s.header_bit_size,
 		  __entry->s.first_mb_in_slice,
 		  __print_symbolic(__entry->s.slice_type,
@@ -573,12 +631,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
-	TP_PROTO(const struct v4l2_h264_reference *r, int i),
-	TP_ARGS(r, i),
-	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_reference *r, int i),
+	TP_ARGS(tgid, fd, r, i),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_h264_reference, r)
 			 __field(int, i)),
-	TP_fast_assign(__entry->r = *r; __entry->i = i;),
-	TP_printk("[%d]: fields = %s, index = %u",
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->r = *r; __entry->i = i;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "[%d]: fields = %s, index = %u",
+		  __entry->tgid, __entry->fd,
 		  __entry->i,
 		  __print_flags(__entry->r.fields, "|",
 		  {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
@@ -589,11 +653,16 @@ DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
-	TP_ARGS(d),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_params, d)),
-	TP_fast_assign(__entry->d = *d),
-	TP_printk("nal_ref_idc = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_decode_params *d),
+	TP_ARGS(tgid, fd, d),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_h264_decode_params, d)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->d = *d),
+	TP_printk("tgid = %u, fd = %u, "
+		  "nal_ref_idc = %u, "
 		  "frame_num = %u, "
 		  "top_field_order_cnt = %d, "
 		  "bottom_field_order_cnt = %d, "
@@ -606,6 +675,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 		  "pic_order_cnt_bit_size = %u, "
 		  "slice_group_change_cycle = %u, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->d.nal_ref_idc,
 		  __entry->d.frame_num,
 		  __entry->d.top_field_order_cnt,
@@ -628,13 +698,19 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
-	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
-	TP_ARGS(e, i),
-	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_dpb_entry *e, int i),
+	TP_ARGS(tgid, fd, e, i),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_h264_dpb_entry, e)
 			 __field(int, i)),
-	TP_fast_assign(__entry->e = *e; __entry->i = i;),
-	TP_printk("[%d]: reference_ts = %llu, pic_num = %u, frame_num = %u, fields = %s "
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->e = *e; __entry->i = i;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "[%d]: reference_ts = %llu, pic_num = %u, frame_num = %u, fields = %s, "
 		  "top_field_order_cnt = %d, bottom_field_order_cnt = %d, flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->i,
 		  __entry->e.reference_ts,
 		  __entry->e.pic_num,
@@ -654,58 +730,63 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
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
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_sps, s)),
-	TP_fast_assign(__entry->s = *s),
-	TP_printk("video_parameter_set_id = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_sps *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_hevc_sps, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s),
+	TP_printk("tgid = %u, fd = %u, "
+		  "video_parameter_set_id = %u, "
 		  "seq_parameter_set_id = %u, "
 		  "pic_width_in_luma_samples = %u, "
 		  "pic_height_in_luma_samples = %u, "
@@ -730,6 +811,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 		  "chroma_format_idc = %u, "
 		  "sps_max_sub_layers_minus1 = %u, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->s.video_parameter_set_id,
 		  __entry->s.seq_parameter_set_id,
 		  __entry->s.pic_width_in_luma_samples,
@@ -770,11 +852,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
 
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_pps, p)),
-	TP_fast_assign(__entry->p = *p),
-	TP_printk("pic_parameter_set_id = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_pps *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_hevc_pps, p)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->p = *p),
+	TP_printk("tgid = %u, fd = %u, "
+		  "pic_parameter_set_id = %u, "
 		  "num_extra_slice_header_bits = %u, "
 		  "num_ref_idx_l0_default_active_minus1 = %u, "
 		  "num_ref_idx_l1_default_active_minus1 = %u, "
@@ -790,6 +877,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 		  "pps_tc_offset_div2 = %d, "
 		  "log2_parallel_merge_level_minus2 = %u, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->p.pic_parameter_set_id,
 		  __entry->p.num_extra_slice_header_bits,
 		  __entry->p.num_ref_idx_l0_default_active_minus1,
@@ -837,11 +925,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
 
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_slice_params, s)),
-	TP_fast_assign(__entry->s = *s),
-	TP_printk("bit_size = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_slice_params *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_hevc_slice_params, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s),
+	TP_printk("tgid = %u, fd = %u, "
+		  "bit_size = %u, "
 		  "data_byte_offset = %u, "
 		  "num_entry_point_offsets = %u, "
 		  "nal_unit_type = %u, "
@@ -868,6 +961,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 		  "short_term_ref_pic_set_size = %u, "
 		  "long_term_ref_pic_set_size = %u, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->s.bit_size,
 		  __entry->s.data_byte_offset,
 		  __entry->s.num_entry_point_offsets,
@@ -914,11 +1008,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
-	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_pred_weight_table, p)),
-	TP_fast_assign(__entry->p = *p),
-	TP_printk("delta_luma_weight_l0 = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_pred_weight_table *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_hevc_pred_weight_table, p)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->p = *p),
+	TP_printk("tgid = %u, fd = %u, "
+		  "delta_luma_weight_l0 = %s, "
 		  "luma_offset_l0 = %s, "
 		  "delta_chroma_weight_l0 = {%s}, "
 		  "chroma_offset_l0 = {%s}, "
@@ -928,6 +1027,7 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 		  "chroma_offset_l1 = {%s}, "
 		  "luma_log2_weight_denom = %d, "
 		  "delta_chroma_log2_weight_denom = %d",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->p.delta_luma_weight_l0,
 				ARRAY_SIZE(__entry->p.delta_luma_weight_l0),
 				sizeof(__entry->p.delta_luma_weight_l0[0])),
@@ -962,16 +1062,22 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
 	))
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
-	TP_ARGS(s),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s)),
-	TP_fast_assign(__entry->s = *s),
-	TP_printk("scaling_list_4x4 = {%s}, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_scaling_matrix *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s),
+	TP_printk("tgid = %u, fd = %u, "
+		  "scaling_list_4x4 = {%s}, "
 		  "scaling_list_8x8 = {%s}, "
 		  "scaling_list_16x16 = {%s}, "
 		  "scaling_list_32x32 = {%s}, "
 		  "scaling_list_dc_coef_16x16 = %s, "
 		  "scaling_list_dc_coef_32x32 = %s",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->s.scaling_list_4x4,
 				   sizeof(__entry->s.scaling_list_4x4),
@@ -997,11 +1103,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
 	))
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
-	TP_ARGS(d),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_decode_params, d)),
-	TP_fast_assign(__entry->d = *d),
-	TP_printk("pic_order_cnt_val = %d, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_decode_params *d),
+	TP_ARGS(tgid, fd, d),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_hevc_decode_params, d)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->d = *d),
+	TP_printk("tgid = %u, fd = %u, "
+		  "pic_order_cnt_val = %d, "
 		  "short_term_ref_pic_set_size = %u, "
 		  "long_term_ref_pic_set_size = %u, "
 		  "num_active_dpb_entries = %u, "
@@ -1012,6 +1123,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 		  "poc_st_curr_after = %s, "
 		  "poc_lt_curr = %s, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->d.pic_order_cnt_val,
 		  __entry->d.short_term_ref_pic_set_size,
 		  __entry->d.long_term_ref_pic_set_size,
@@ -1036,12 +1148,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
-	TP_ARGS(lt),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, lt)),
-	TP_fast_assign(__entry->lt = *lt),
-	TP_printk("flags = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
+	TP_ARGS(tgid, fd, lt),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, lt)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->lt = *lt),
+	TP_printk("tgid = %u, fd = %u, "
+		  "flags = %s, "
 		  "lt_ref_pic_poc_lsb_sps = %x",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->lt.flags, "|",
 		  {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
 		  ),
@@ -1050,11 +1168,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
-	TP_ARGS(st),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, st)),
-	TP_fast_assign(__entry->st = *st),
-	TP_printk("flags = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
+	TP_ARGS(tgid, fd, st),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, st)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->st = *st),
+	TP_printk("tgid = %u, fd = %u, "
+		  "flags = %s, "
 		  "delta_idx_minus1 = %u, "
 		  "delta_rps_sign = %u, "
 		  "abs_delta_rps_minus1 = %u, "
@@ -1064,6 +1187,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 		  "use_delta_flag = %08x, "
 		  "delta_poc_s0_minus1 = %s, "
 		  "delta_poc_s1_minus1 = %s",
+		  __entry->tgid, __entry->fd,
 		  __print_flags(__entry->st.flags, "|",
 		  {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_REF_PIC_SET_PRED"}
 		  ),
@@ -1084,14 +1208,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
-	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
-	TP_ARGS(e),
-	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_dpb_entry, e)),
-	TP_fast_assign(__entry->e = *e),
-	TP_printk("timestamp = %llu, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_dpb_entry *e),
+	TP_ARGS(tgid, fd, e),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_hevc_dpb_entry, e)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->e = *e),
+	TP_printk("tgid = %u, fd = %u, "
+		  "timestamp = %llu, "
 		  "flags = %s, "
 		  "field_pic = %u, "
 		  "pic_order_cnt_val = %d",
+		  __entry->tgid, __entry->fd,
 		__entry->e.timestamp,
 		__print_flags(__entry->e.flags, "|",
 		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE, "LONG_TERM_REFERENCE"}
@@ -1101,59 +1231,65 @@ DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
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
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
-	TP_fast_assign(__entry->s = *s;),
-	TP_printk("horizontal_size = %u, vertical_size = %u, vbv_buffer_size = %u, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_sequence *s),
+	TP_ARGS(tgid, fd, s),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->s = *s;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "horizontal_size = %u, vertical_size = %u, vbv_buffer_size = %u, "
 		  "profile_and_level_indication = %u, chroma_format = %u, flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __entry->s.horizontal_size,
 		  __entry->s.vertical_size,
 		  __entry->s.vbv_buffer_size,
@@ -1165,12 +1301,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
-	TP_fast_assign(__entry->p = *p;),
-	TP_printk("backward_ref_ts = %llu, forward_ref_ts = %llu, flags = %s, f_code = {%s}, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_picture *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->p = *p;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "backward_ref_ts = %llu, forward_ref_ts = %llu, flags = %s, f_code = {%s}, "
 		  "picture_coding_type = %u, picture_structure = %u, intra_dc_precision = %u",
+		  __entry->tgid, __entry->fd,
 		  __entry->p.backward_ref_ts,
 		  __entry->p.forward_ref_ts,
 		  __print_flags(__entry->p.flags, "|",
@@ -1193,12 +1335,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
-	TP_ARGS(q),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)),
-	TP_fast_assign(__entry->q = *q;),
-	TP_printk("intra_quantiser_matrix = %s, non_intra_quantiser_matrix = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_quantisation *q),
+	TP_ARGS(tgid, fd, q),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->q = *q;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "intra_quantiser_matrix = %s, non_intra_quantiser_matrix = %s, "
 		  "chroma_intra_quantiser_matrix = %s, chroma_non_intra_quantiser_matrix = %s",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->q.intra_quantiser_matrix,
 				ARRAY_SIZE(__entry->q.intra_quantiser_matrix),
 				sizeof(__entry->q.intra_quantiser_matrix[0])),
@@ -1215,31 +1363,37 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
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
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
-	TP_printk("entropy.coeff_probs = {%s}, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_vp8_frame, f)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->f = *f;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "entropy.coeff_probs = {%s}, "
 		  "entropy.y_mode_probs = %s, "
 		  "entropy.uv_mode_probs = %s, "
 		  "entropy.mv_probs = {%s}",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->f.entropy.coeff_probs,
 				   sizeof(__entry->f.entropy.coeff_probs),
@@ -1258,11 +1412,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
 )
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
-	TP_ARGS(f),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
-	TP_printk("segment.quant_update = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_vp8_frame, f)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->f = *f;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "segment.quant_update = %s, "
 		  "segment.lf_update = %s, "
 		  "segment.segment_probs = %s, "
 		  "segment.flags = %s, "
@@ -1297,6 +1456,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
 		  "golden_frame_ts = %llu, "
 		  "alt_frame_ts = %llu, "
 		  "flags = %s",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->f.segment.quant_update,
 				ARRAY_SIZE(__entry->f.segment.quant_update),
 				sizeof(__entry->f.segment.quant_update[0])),
@@ -1361,23 +1521,28 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
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
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
-	TP_fast_assign(__entry->f = *f;),
-	TP_printk("lf.ref_deltas = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_frame *f),
+	TP_ARGS(tgid, fd, f),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_vp9_frame, f)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->f = *f;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "lf.ref_deltas = %s, "
 		  "lf.mode_deltas = %s, "
 		  "lf.level = %u, "
 		  "lf.sharpness = %u, "
@@ -1410,6 +1575,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 		  "tile_cols_log2 = %u, "
 		  "tile_rows_log_2 = %u, "
 		  "reference_mode = %s",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->f.lf.ref_deltas,
 				ARRAY_SIZE(__entry->f.lf.ref_deltas),
 				sizeof(__entry->f.lf.ref_deltas[0])),
@@ -1490,11 +1656,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
-	TP_ARGS(h),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
-	TP_fast_assign(__entry->h = *h;),
-	TP_printk("tx_mode = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h),
+	TP_ARGS(tgid, fd, h),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->h = *h;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "tx_mode = %s, "
 		  "tx8 = {%s}, "
 		  "tx16 = {%s}, "
 		  "tx32 = {%s}, "
@@ -1508,6 +1679,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 		  "y_mode = {%s}, "
 		  "uv_mode = {%s}, "
 		  "partition = {%s}",
+		  __entry->tgid, __entry->fd,
 		  __print_symbolic(__entry->h.tx_mode,
 		  {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
 		  {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
@@ -1566,11 +1738,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
-	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
-	TP_ARGS(h),
-	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
-	TP_fast_assign(__entry->h = *h;),
-	TP_printk("coef = {%s}",
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h),
+	TP_ARGS(tgid, fd, h),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->h = *h;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "coef = {%s}",
+		  __entry->tgid, __entry->fd,
 		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
 				   __entry->h.coef,
 				   sizeof(__entry->h.coef),
@@ -1579,11 +1757,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
 );
 
 DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
-	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
-	TP_ARGS(p),
-	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
-	TP_fast_assign(__entry->p = *p;),
-	TP_printk("joint = %s, "
+	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_vp9_mv_probs *p),
+	TP_ARGS(tgid, fd, p),
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field_struct(struct v4l2_vp9_mv_probs, p)),
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->p = *p;),
+	TP_printk("tgid = %u, fd = %u, "
+		  "joint = %s, "
 		  "sign = %s, "
 		  "classes = {%s}, "
 		  "class0_bit = %s, "
@@ -1592,6 +1775,7 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
 		  "fr = {%s}, "
 		  "class0_hp = %s, "
 		  "hp = %s",
+		  __entry->tgid, __entry->fd,
 		  __print_array(__entry->p.joint,
 				ARRAY_SIZE(__entry->p.joint),
 				sizeof(__entry->p.joint[0])),
@@ -1627,24 +1811,24 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
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
 
 #endif /* if !defined(_TRACE_V4L2_REQUESTS_H_) || defined(TRACE_HEADER_MULTI_READ) */
-- 
2.53.0


