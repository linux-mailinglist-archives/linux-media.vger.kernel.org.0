Return-Path: <linux-media+bounces-52668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIOHOLH/jWm0+AAAu9opvQ
	(envelope-from <linux-media+bounces-52668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:28:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D412F688
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB0973159D38
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB635DD00;
	Thu, 12 Feb 2026 16:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TiKf1fF3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06163286A8;
	Thu, 12 Feb 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913439; cv=none; b=XsP17LL2t1Umu5ChL9OrskH9ssnC7oBNoiPSlV8IWNBHNlniXLUqDKW718ppVdk0F3y3Yg60K0VSnGWCo4/HcHfJlpyMQMu4ElDmwTCkMAXGHTBvw+XkvJmAeh/LhZ9id0O8E6Wm/k1gm6FIZiI93EmrJHNbkbS9+E2mhw5hq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913439; c=relaxed/simple;
	bh=CNPGkgh1aCeZicbL4rsaMSb6kfUJwjblUeoZ09BjmZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Izjj8pqn55patemVAnL8AqZqhmHOFvBnFaj09AMEFAj8wwGx0vSodw8nQSYEhLX+fiKc3EzUXmNLFK8vutBWsfTsOApAxoXDCvMdDwolgUun1VJM19mP+9O7buS2Knl2zKOKEezPb3L8nxMXu+H4bfRC6+plYYUopkSgF5gISDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TiKf1fF3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913436;
	bh=CNPGkgh1aCeZicbL4rsaMSb6kfUJwjblUeoZ09BjmZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiKf1fF3dLt0EX0gPlR/ePU7JPDnOvco6iYuLn0enaPYN1HdYqaZ9v9ntWTt1afBF
	 uc4IbjFkX43yE/146xSYo2ZIUgzkgSsQsgkAm8cEMdJLsRA1aktmHuoolFLbeD2xro
	 M5XwIcJtcQxiakGqJdAuV+/n1pIgbY93XMpx80i2O8pnF0NdJaN5gb2J0dZSugQm5e
	 x+akfJnhpLDwNmwM5q+V38ikt6mcD4sjvrdNXf4LzCZgn5E+UOZ8C0PMg7zrbDkxgm
	 No4Ii9WYdpq596ZYoQCq/lgB3ncu3QD5KlfWYZQjAc6iysA/Pf/ycvwyWtneya2OK0
	 lKfvOudsGq/WQ==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4443D17E1144;
	Thu, 12 Feb 2026 17:23:53 +0100 (CET)
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
Subject: [PATCH 06/11] media: Trace the stateless controls when set in v4l2-ctrls-core.c
Date: Thu, 12 Feb 2026 11:23:23 -0500
Message-ID: <20260212162328.192217-7-detlev.casanova@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52668-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A7D412F688
X-Rspamd-Action: no action

Also remove the trace from visl as the generic v4l2-requests traces can
now be used instead.

It allows all stateless drivers to inherit traceability, with just a small
overhead when disabled in userspace.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c |  74 -------------
 drivers/media/v4l2-core/v4l2-ctrls-api.c   |  10 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c  | 114 +++++++++++++++++++++
 include/media/v4l2-ctrls.h                 |  15 +++
 4 files changed, 139 insertions(+), 74 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index fc216da17048..9517830fb3e8 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -12,7 +12,6 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/tpg/v4l2-tpg.h>
-#include <trace/events/v4l2_requests.h>
 
 #define LAST_BUF_IDX (V4L2_AV1_REF_LAST_FRAME - V4L2_AV1_REF_LAST_FRAME)
 #define LAST2_BUF_IDX (V4L2_AV1_REF_LAST2_FRAME - V4L2_AV1_REF_LAST_FRAME)
@@ -486,78 +485,6 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 	}
 }
 
-static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run *run)
-{
-	int i;
-	struct v4l2_fh *fh = &ctx->fh;
-
-	switch (ctx->current_codec) {
-	default:
-	case VISL_CODEC_NONE:
-		break;
-	case VISL_CODEC_FWHT:
-		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, run->fwht.params);
-		break;
-	case VISL_CODEC_MPEG2:
-		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, run->mpeg2.seq);
-		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, run->mpeg2.pic);
-		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, run->mpeg2.quant);
-		break;
-	case VISL_CODEC_VP8:
-		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, run->vp8.frame);
-		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, run->vp8.frame);
-		break;
-	case VISL_CODEC_VP9:
-		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, run->vp9.frame);
-		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd, run->vp9.probs);
-		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd, run->vp9.probs);
-		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &run->vp9.probs->mv);
-		break;
-	case VISL_CODEC_H264:
-		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, run->h264.sps);
-		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, run->h264.pps);
-		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, run->h264.sm);
-		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, run->h264.spram);
-
-		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
-			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd,
-						      &run->h264.spram->ref_pic_list0[i], i);
-		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
-			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd,
-						      &run->h264.spram->ref_pic_list1[i], i);
-
-		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, run->h264.dpram);
-
-		for (i = 0; i < ARRAY_SIZE(run->h264.dpram->dpb); i++)
-			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &run->h264.dpram->dpb[i], i);
-
-		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, run->h264.pwht);
-		break;
-	case VISL_CODEC_HEVC:
-		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, run->hevc.sps);
-		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, run->hevc.pps);
-		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, run->hevc.spram);
-		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, run->hevc.sm);
-		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, run->hevc.dpram);
-
-		for (i = 0; i < ARRAY_SIZE(run->hevc.dpram->dpb); i++)
-			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &run->hevc.dpram->dpb[i]);
-
-
-		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
-						  &run->hevc.spram->pred_weight_table);
-		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(fh->tgid, fh->fd, run->hevc.rps_lt);
-		trace_v4l2_ctrl_hevc_ext_sps_st_rps(fh->tgid, fh->fd, run->hevc.rps_st);
-		break;
-	case VISL_CODEC_AV1:
-		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, run->av1.seq);
-		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, run->av1.frame);
-		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, run->av1.grain);
-		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, run->av1.tge);
-		break;
-	}
-}
-
 void visl_device_run(void *priv)
 {
 	struct visl_ctx *ctx = priv;
@@ -634,7 +561,6 @@ void visl_device_run(void *priv)
 		      run.dst->sequence, run.dst->vb2_buf.timestamp);
 
 	visl_tpg_fill(ctx, &run);
-	visl_trace_ctrls(ctx, &run);
 
 	if (bitstream_trace_frame_start > -1 &&
 	    run.dst->sequence >= bitstream_trace_frame_start &&
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 0078a04c5445..8a814eec7a30 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -524,6 +524,12 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
 }
 EXPORT_SYMBOL(v4l2_g_ext_ctrls);
 
+static void trace_ext_ctrl(struct v4l2_fh *fh, const struct v4l2_ctrl *ctrl)
+{
+	if (ctrl->type_ops->trace)
+		ctrl->type_ops->trace(fh, ctrl, ctrl->p_cur);
+}
+
 /* Validate a new control */
 static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
 {
@@ -713,6 +719,10 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 				idx = helpers[idx].next;
 			} while (!ret && idx);
 		}
+
+		if (set)
+			trace_ext_ctrl(fh, master);
+
 		v4l2_ctrl_unlock(master);
 	}
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 79a157975f70..6165e36d8879 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -10,8 +10,11 @@
 #include <linux/slab.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
 #include <media/v4l2-fwnode.h>
 
+#include <trace/events/v4l2_requests.h>
+
 #include "v4l2-ctrls-priv.h"
 
 static const union v4l2_ctrl_ptr ptr_null;
@@ -1462,12 +1465,123 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 }
 EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 
+void v4l2_ctrl_type_op_trace(const struct v4l2_fh *fh,
+				    const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr)
+{
+	int i = 0;
+
+	switch ((u32)ctrl->type) {
+	case V4L2_CTRL_TYPE_FWHT_PARAMS:
+		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, ptr.p_fwht_params);
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
+		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, ptr.p_mpeg2_sequence);
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
+		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, ptr.p_mpeg2_picture);
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
+		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, ptr.p_mpeg2_quantisation);
+		break;
+	case V4L2_CTRL_TYPE_VP8_FRAME:
+		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, ptr.p_vp8_frame);
+		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, ptr.p_vp8_frame);
+		break;
+	case V4L2_CTRL_TYPE_VP9_FRAME:
+		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, ptr.p_vp9_frame);
+		break;
+	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
+		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd,
+						   ptr.p_vp9_compressed_hdr_probs);
+		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd,
+						     ptr.p_vp9_compressed_hdr_probs);
+		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &ptr.p_vp9_compressed_hdr_probs->mv);
+		break;
+	case V4L2_CTRL_TYPE_H264_SPS:
+		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, ptr.p_h264_sps);
+		break;
+	case V4L2_CTRL_TYPE_H264_PPS:
+		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, ptr.p_h264_pps);
+		break;
+	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
+		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, ptr.p_h264_scaling_matrix);
+		break;
+	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
+	{
+		struct v4l2_ctrl_h264_slice_params *sp = ptr.p_h264_slice_params;
+
+		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, sp);
+
+		for (i = 0; i < ARRAY_SIZE(sp->ref_pic_list0); i++)
+			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd, &sp->ref_pic_list0[i], i);
+		for (i = 0; i < ARRAY_SIZE(sp->ref_pic_list1); i++)
+			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd, &sp->ref_pic_list1[i], i);
+
+		break;
+	}
+	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
+	{
+		struct v4l2_ctrl_h264_decode_params *dp = ptr.p_h264_decode_params;
+
+		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, dp);
+
+		for (i = 0; i < ARRAY_SIZE(dp->dpb); i++)
+			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &dp->dpb[i], i);
+
+		break;
+	}
+	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
+		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, ptr.p_h264_pred_weights);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SPS:
+		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, ptr.p_hevc_sps);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_PPS:
+		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, ptr.p_hevc_pps);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, ptr.p_hevc_slice_params);
+		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
+						  &ptr.p_hevc_slice_params->pred_weight_table);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
+		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, ptr.p_hevc_scaling_matrix);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
+	{
+		struct v4l2_ctrl_hevc_decode_params *dp = ptr.p_hevc_decode_params;
+
+		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, dp);
+
+		for (i = 0; i < ARRAY_SIZE(dp->dpb); i++)
+			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &dp->dpb[i]);
+
+		break;
+	}
+	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
+		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, ptr.p_av1_sequence);
+		break;
+	case V4L2_CTRL_TYPE_AV1_FRAME:
+		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, ptr.p_av1_frame);
+		break;
+	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
+		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, ptr.p_av1_film_grain);
+		break;
+	case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
+		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, ptr.p_av1_tile_group_entry);
+		break;
+	}
+
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_trace);
+
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = v4l2_ctrl_type_op_equal,
 	.init = v4l2_ctrl_type_op_init,
 	.minimum = v4l2_ctrl_type_op_minimum,
 	.maximum = v4l2_ctrl_type_op_maximum,
 	.log = v4l2_ctrl_type_op_log,
+	.trace = v4l2_ctrl_type_op_trace,
 	.validate = v4l2_ctrl_type_op_validate,
 };
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index a2b4c96a9a6f..57c4bb999b7b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -140,6 +140,7 @@ struct v4l2_ctrl_ops {
  * @minimum: set the value to the minimum value of the control.
  * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
+ * @trace: trace the value of the control with Ftrace.
  * @validate: validate the value for ctrl->new_elems array elements.
  *	Return 0 on success and a negative value otherwise.
  */
@@ -153,6 +154,8 @@ struct v4l2_ctrl_type_ops {
 	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
 			union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
+	void (*trace)(const struct v4l2_fh *fh,
+		      const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 };
 
@@ -1627,6 +1630,18 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
  */
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
 
+/**
+ * v4l2_ctrl_type_op_trace - Default v4l2_ctrl_type_ops trace callback.
+ *
+ * @fh: The v4l2_fh of the current context.
+ * @ctrl: The v4l2_ctrl pointer.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_trace(const struct v4l2_fh *fh,
+			     const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
+
 /**
  * v4l2_ctrl_type_op_validate - Default v4l2_ctrl_type_ops validate callback.
  *
-- 
2.53.0


