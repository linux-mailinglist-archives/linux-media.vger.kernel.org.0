Return-Path: <linux-media+bounces-62584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FPaNhwvEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:25:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E585B2046
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 701A7304E669
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99DD3CBE73;
	Fri, 22 May 2026 10:18:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E663CB8EF;
	Fri, 22 May 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445090; cv=none; b=VdbIWmIS967pUanbWACde868dTYj2C8LvDzI6NSIn7Gy1wGt1h8bMacAoao+93DDQwYsjPgww8Ed/PBNI0ZpGpoC79IsphCzoxiLXo47Rf9gX5WNnnPpNGeZkv2iD/bMqYdW8/L504KcGmow8vJQ9EBqpXS1tw2xvpf46iHz2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445090; c=relaxed/simple;
	bh=1lEBQsNNMs456kxHbxeux6maUCGB8apZWQclWCO6sUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfYUW43ldBwQt14Ql3BRGwzEms2Rz4MjmmE+W19vg8fWfX+9pDuTmXR8A+dxKM3rUV0pC99cMGIRaruVUy3l0UY0HmH2Kn2Mud/pNQRK8F1RuPpmlefrMn3f9eTebL96c/ihn8xg9PuDCP1Ayx4mpEvtWo9SQ5bki22niVWRrTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D9F3C370029B;
	Fri, 22 May 2026 10:17:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 5F361B408D8; Fri, 22 May 2026 10:17:52 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id BA4A3B408D1;
	Fri, 22 May 2026 10:17:07 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 07/14] media: h264: Add stateless encode rate control
Date: Fri, 22 May 2026 12:16:46 +0200
Message-ID: <20260522101653.2565125-8-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62584-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.582];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sys-base.io:mid,sys-base.io:email]
X-Rspamd-Queue-Id: 48E585B2046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The H.264 stateless encode rate control implementation currently supports:
- A direct QP mode;
- A constant quality (CQ) mode, with a linear quality to QP mapping;
- A constant bitrate (CBR) mode.

Related controls from the v4l2 stateful uAPI are reused directly.

The CBR mode is implemented using a size budget approach which allocates
a given size to the current frame in order to match the bitrate.

The size is then used to derive a QP estimation, through a static table for
the initial case and using collected statistics from the past few frames of
the same type in the general case. A size difference ratio from previous
frames is calculated (using up to 3 frames) and a QP diff is estimated from
a static table depending on that ratio. The newly obtained QPs from the
statistics of the previous frames are then averaged with a different weight
(penalty) based on their temporal difference and size difference with the
target.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/Makefile           |   3 +-
 drivers/media/v4l2-core/v4l2-h264-enc-rc.c | 558 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-h264-enc.c    | 196 ++++++++
 include/media/v4l2-h264-enc-rc.h           | 108 ++++
 include/media/v4l2-h264-enc.h              |  18 +
 include/media/v4l2-h264.h                  |  24 +
 6 files changed, 906 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
 create mode 100644 include/media/v4l2-h264-enc-rc.h

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index aba9e310f2e5..1f83e1ee554f 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -29,7 +29,8 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
-obj-$(CONFIG_V4L2_H264_ENC) += v4l2-h264-enc.o v4l2-h264-enc-rbsp.o
+obj-$(CONFIG_V4L2_H264_ENC) += v4l2-h264-enc.o v4l2-h264-enc-rbsp.o \
+			       v4l2-h264-enc-rc.o
 obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
diff --git a/drivers/media/v4l2-core/v4l2-h264-enc-rc.c b/drivers/media/v4l2-core/v4l2-h264-enc-rc.c
new file mode 100644
index 000000000000..8f9622395eb6
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-h264-enc-rc.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * V4L2 H.264 Encode Rate Control
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#include <linux/module.h>
+#include <media/v4l2-h264-enc.h>
+
+int v4l2_h264_enc_rc_init(struct v4l2_h264_enc_rc *rc)
+{
+	rc->qp = 0;
+	rc->mode = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rc_init);
+
+void v4l2_h264_enc_rc_exit(struct v4l2_h264_enc_rc *rc)
+{
+	if (rc->mode) {
+		v4l2_h264_enc_rc_op(rc, exit);
+		v4l2_h264_enc_rc_mode_op(rc, exit);
+		rc->mode = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rc_exit);
+
+int v4l2_h264_enc_rc_stats_collect(struct v4l2_h264_enc_rc *rc,
+				   unsigned long bytesused)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_fract *timeperframe = &state->timeperframe;
+	struct v4l2_h264_enc_rc_stats *stats = &rc->stats;
+	struct v4l2_h264_enc_rc_stats_type *type;
+	unsigned long bitrate;
+	long size_error;
+	long size_drift;
+	long bitrate_error;
+	long bitrate_drift;
+	unsigned int index;
+
+	/* Collect individual and total frame sizes. */
+
+	index = stats->index;
+
+	if (stats->count == V4L2_H264_ENC_RC_STATS_SIZE_COUNT)
+		stats->size_total -= stats->size[index];
+
+	stats->slice_type[index] = encode->slice_type;
+	stats->size[index] = bytesused;
+	stats->size_total += bytesused;
+
+	if (stats->count < V4L2_H264_ENC_RC_STATS_SIZE_COUNT)
+		stats->count++;
+
+	stats->index = (index + 1) % V4L2_H264_ENC_RC_STATS_SIZE_COUNT;
+
+	bitrate = 8 * stats->size_total * timeperframe->denominator /
+		  stats->count / timeperframe->numerator;
+
+	size_error = (long)bytesused - (long)rc->size;
+	size_drift = 100 * size_error / (long)rc->size;
+
+	bitrate_error = (long)bitrate - (long)state->bitrate;
+	bitrate_drift = 100 * bitrate_error / (long)state->bitrate;
+
+	pr_debug("+ v4l2-h264-rc: stats");
+	pr_debug("  size: %lu B, target: %lu B, error: %ld B, drift: %ld pc",
+		 bytesused, rc->size, size_error, size_drift);
+	pr_debug("  bitrate: %lu b/s, target: %u b/s, error: %ld b/s, drift: %ld pc",
+		 bitrate, state->bitrate, bitrate_error, bitrate_drift);
+
+	/* Collect per-type size and qp information. */
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I)
+		type = &stats->intra;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_P)
+		type = &stats->pred;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_B)
+		type = &stats->bipred;
+	else
+		return -EINVAL;
+
+	index = type->index;
+
+	type->target[index] = rc->size;
+	type->size[index] = bytesused;
+	type->qp[index] = rc->qp;
+
+	if (type->count < V4L2_H264_ENC_RC_STATS_TYPE_COUNT)
+		type->count++;
+
+	type->index = (index + 1) % V4L2_H264_ENC_RC_STATS_TYPE_COUNT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rc_stats_collect);
+
+static int direct_estimate(struct v4l2_h264_enc_rc *rc, unsigned int *qp)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I)
+		*qp = state->qp_i;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_P)
+		*qp = state->qp_p;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_B)
+		*qp = state->qp_b;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct v4l2_h264_enc_rc_mode direct_mode = {
+	.name		= "direct qp",
+	.type		= V4L2_H264_ENC_RC_TYPE_DIRECT,
+	.estimate	= direct_estimate,
+};
+
+static int cq_estimate(struct v4l2_h264_enc_rc *rc, unsigned int *qp)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	/* TODO: Use some reasonable PSNR to QP mapping. */
+	unsigned int qp_range_intra[2] = { 12, 44 };
+	unsigned int qp_range_inter[2] = { 16, 48 };
+	unsigned int qp_min, qp_max;
+	unsigned int qp_diff_range;
+	unsigned int quality_diff;
+	unsigned int quality_diff_range;
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I) {
+		qp_min = qp_range_intra[0];
+		qp_max = qp_range_intra[1];
+	} else {
+		qp_min = qp_range_inter[0];
+		qp_max = qp_range_inter[1];
+	}
+
+	qp_diff_range = qp_max - qp_min;
+
+	quality_diff = state->quality - state->quality_min;
+	quality_diff_range = state->quality_max - state->quality_min;
+
+	*qp = qp_min + qp_diff_range * quality_diff / quality_diff_range;
+
+	return 0;
+}
+
+static const struct v4l2_h264_enc_rc_mode cq_mode = {
+	.name		= "constant quality",
+	.type		= V4L2_H264_ENC_RC_TYPE_CQ,
+	.estimate	= cq_estimate,
+};
+
+static int cbr_measure(struct v4l2_h264_enc_rc *rc, unsigned long *size)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_fract *timeperframe = &state->timeperframe;
+	struct v4l2_h264_enc_rc_stats *stats = &rc->stats;
+	unsigned long long budget;
+	unsigned long target;
+	unsigned long target_nominal;
+
+	pr_debug("+ v4l2-h264-enc-rc: cbr measure");
+
+	/* Nominal average size target for exact bitrate. */
+	target_nominal = state->bitrate * timeperframe->numerator /
+			 timeperframe->denominator / 8;
+
+	/* Total size budget for twice the size window. */
+	budget = 2 * V4L2_H264_ENC_RC_STATS_SIZE_COUNT * state->bitrate *
+		 timeperframe->numerator / timeperframe->denominator / 8;
+
+	if (budget < stats->size_total) {
+		target = target_nominal;
+		goto complete;
+	}
+
+	/* Remaining size budget after deducing total size in window. */
+	budget -= stats->size_total;
+	/* Average size target from remaining size budget. */
+	target = budget / (2 * V4L2_H264_ENC_RC_STATS_SIZE_COUNT - stats->count);
+
+complete:
+	pr_debug("  nominal target: %lu bytes", target_nominal);
+	pr_debug("  uniform target: %lu bytes", target);
+
+	/* Bump size for intra frames and reduce for pred frames.
+	 * We are better off with good quality initial references.
+	 * Maintain average assuming 1 intra frame for 24 inter frames.
+	 */
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I)
+		target = target * 6;
+	else
+		target = target * 80 / 100;
+
+	/* Reduce target size on bitrate overshoot to calm things down. */
+	if (9 * stats->size_total > 10 * stats->count * target_nominal) {
+		pr_debug("  overshoot, reducing target size");
+		target = 80 * target / 100;
+	}
+
+	pr_debug("  final target: %lu bytes", target);
+
+	*size = target;
+
+	return 0;
+}
+
+/* Intra bit size per macroblock estimation for QP starting at 10. */
+static unsigned int cbr_qp_initial_bits_mb[] = {
+	437, 411, 376, 355, 318, 303, 291, 271, 252, 238, 218, 204, 188, 171,
+	158, 149, 133, 124, 115, 105, 98, 92, 83, 77, 70, 63, 57, 52, 45, 39,
+	34, 31, 30, 29, 26, 23, 22, 20, 18, 17, 16, 15
+};
+
+static int cbr_qp_initial(struct v4l2_h264_enc_rc *rc, unsigned int *qp)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	unsigned long size_mb;
+	unsigned int qp_initial;
+	unsigned int threshold;
+	unsigned int i;
+
+	size_mb = 8 * rc->size / (state->width_mbs * state->height_mbs);
+
+	pr_debug("  initial estimate from %lu bits/mb", size_mb);
+
+	for (i = 0; i < ARRAY_SIZE(cbr_qp_initial_bits_mb); i++) {
+		threshold = cbr_qp_initial_bits_mb[i];
+
+		/* Expect inter frames to be 6 times smaller. */
+		if (encode->slice_type != V4L2_H264_SLICE_TYPE_I)
+			threshold = cbr_qp_initial_bits_mb[i] / 6;
+
+		if (size_mb >= threshold) {
+			qp_initial = 10 + i;
+			break;
+		}
+	}
+
+	/* Fallback to the lowest QP (last in the list). */
+	if (i == ARRAY_SIZE(cbr_qp_initial_bits_mb))
+		qp_initial = 10 + i - 1;
+
+	*qp = qp_initial;
+
+	return 0;
+}
+
+/*
+ * This table gives the QP decrease/increase (coded as index, with QP = 0 in
+ * the middle) for each size ratio (in base 1000).
+ *
+ * Intra is a bit agressive since we generally have few intra slices to adapt
+ * to a scene change. The QP diff range goes from -4 to +4.
+ */
+static unsigned long cbr_ratio_qp_diff_steps_intra[] = {
+	3000, 2000, 1500, 1250, 800, 666, 500, 333
+};
+
+/*
+ * Inter is less agressive since we generally have more inter slices to adapt
+ * to a scene change and want to give more stability to QP. The QP diff range
+ * goes from -3 to +3.
+ */
+static unsigned long cbr_ratio_qp_diff_steps_inter[] = {
+	2000, 1500, 1250, 800, 666, 500
+};
+
+static int cbr_ratio_qp_diff(unsigned long ratio, unsigned char slice_type)
+{
+	unsigned long *steps;
+	unsigned int count;
+	unsigned int i;
+
+	if (slice_type == V4L2_H264_SLICE_TYPE_I) {
+		steps = cbr_ratio_qp_diff_steps_intra;
+		count = ARRAY_SIZE(cbr_ratio_qp_diff_steps_intra);
+	} else {
+		steps = cbr_ratio_qp_diff_steps_inter;
+		count = ARRAY_SIZE(cbr_ratio_qp_diff_steps_inter);
+	}
+
+	WARN_ON(count % 2);
+
+	for (i = 0; i < count; i++)
+		if (ratio > steps[i])
+			return -1 * (int)count / 2 + i;
+
+	return count / 2;
+}
+
+static int cbr_estimate(struct v4l2_h264_enc_rc *rc, unsigned int *qp)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_rc_stats *stats = &rc->stats;
+	struct v4l2_h264_enc_rc_stats_type *type;
+	unsigned int type_index[3];
+	unsigned int ratio_qp[3];
+	unsigned int penalty[3];
+	unsigned int penalty_total;
+	unsigned int weight[3];
+	unsigned int weight_total;
+	int ratio_qp_diff;
+	unsigned long diff;
+	unsigned long diff_closest;
+	unsigned int slot_closest;
+	unsigned int index;
+	unsigned int count;
+	unsigned int total;
+	unsigned long ratio;
+	unsigned int i;
+
+	if (!stats->count)
+		return cbr_qp_initial(rc, qp);
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I)
+		type = &stats->intra;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_P)
+		type = &stats->pred;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_B)
+		type = &stats->bipred;
+	else
+		return -EINVAL;
+
+	pr_debug("+ v4l2-h264-enc-rc: cbr estimate");
+
+	if (!type->count)
+		return cbr_qp_initial(rc, qp);
+
+	for (i = 0; i < 3; i++) {
+		if (i == type->count)
+			break;
+
+		index = type->index;
+		if (index <= i)
+			index = type->count + index - (i + 1);
+		else
+			index -= i + 1;
+
+		/* Set initial penalty based on frame age. */
+		penalty[i] = 4 * i;
+		type_index[i] = index;
+
+		/* Track frame with size closest to target. */
+		diff = abs((long)rc->size - type->size[index]);
+
+		if (!i || diff < diff_closest) {
+			diff_closest = diff;
+			slot_closest = i;
+		}
+	}
+
+	count = i;
+	penalty_total = 0;
+
+	for (i = 0; i < count; i++) {
+		/* Add penalty for frames with larger size difference. */
+		if (i != slot_closest)
+			penalty[i] += 10;
+
+		penalty_total += penalty[i];
+
+		index = type_index[i];
+
+		/* Calculate QP from target to observed size ratio. */
+		ratio = 1000UL * rc->size / type->size[index];
+
+		ratio_qp_diff = cbr_ratio_qp_diff(ratio, encode->slice_type);
+
+		if ((int)type->qp[index] + ratio_qp_diff < 0)
+			ratio_qp[i] = 0;
+		else if ((int)type->qp[index] + ratio_qp_diff > 51)
+			ratio_qp[i] = 51;
+		else
+			ratio_qp[i] = type->qp[index] + ratio_qp_diff;
+
+		diff = abs((long)rc->size - type->size[index]);
+
+		pr_debug("  - backlog %d size: %lu (diff: %lu), qp: %u, penalty %u, ratio qp: %u",
+			 -(i + 1), type->size[index], diff, type->qp[index],
+			 penalty[i], ratio_qp[i]);
+	}
+
+	total = 0;
+	weight_total = 0;
+
+	for (i = 0; i < count; i++) {
+		/* Weight each calculated QP using the penalty ratio. */
+		if (penalty_total)
+			weight[i] = 1000 * (penalty_total - penalty[i]) /
+				    penalty_total;
+		else
+			weight[i] = 1000;
+
+		/* Give non-zero low weight to full penalty cases. */
+		if (weight[i] < 200)
+			weight[i] = 200;
+
+		total += ratio_qp[i] * weight[i];
+		weight_total += weight[i];
+
+		pr_debug("  - backlog %d weight: %u", -(i + 1),
+			 weight[i]);
+	}
+
+	*qp = total / weight_total;
+
+	return 0;
+}
+
+static int cbr_complete(struct v4l2_h264_enc_rc *rc, unsigned long bytesused)
+{
+	return v4l2_h264_enc_rc_stats_collect(rc, bytesused);
+}
+
+static const struct v4l2_h264_enc_rc_mode cbr_mode = {
+	.name		= "constant bitrate",
+	.type		= V4L2_H264_ENC_RC_TYPE_CBR,
+	.measure	= cbr_measure,
+	.estimate	= cbr_estimate,
+	.complete	= cbr_complete,
+};
+
+static const struct v4l2_h264_enc_rc_mode *modes[] = {
+	&direct_mode,
+	&cq_mode,
+	&cbr_mode,
+};
+
+static int mode_prepare(struct v4l2_h264_enc_rc *rc)
+{
+	struct v4l2_h264_enc_state *state = rc->state;
+	const struct v4l2_h264_enc_rc_mode *mode = NULL;
+	unsigned int i;
+	int type;
+	int ret;
+
+	if (!state->frame_rc_enable)
+		type = V4L2_H264_ENC_RC_TYPE_DIRECT;
+	else if (state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+		type = V4L2_H264_ENC_RC_TYPE_CQ;
+	else if (state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		type = V4L2_H264_ENC_RC_TYPE_CBR;
+	else if (state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
+		type = V4L2_H264_ENC_RC_TYPE_VBR;
+	else
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		if (modes[i] && modes[i]->type == type) {
+			mode = modes[i];
+			break;
+		}
+	}
+
+	if (!mode)
+		return -EINVAL;
+
+	memset(&rc->stats, 0, sizeof(rc->stats));
+
+	rc->mode = mode;
+
+	ret = v4l2_h264_enc_rc_op(rc, init);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	ret = v4l2_h264_enc_rc_mode_op(rc, init);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	return 0;
+}
+
+int v4l2_h264_enc_rc_mode_update(struct v4l2_h264_enc_rc *rc)
+{
+	if (!rc->mode)
+		return 0;
+
+	v4l2_h264_enc_rc_op(rc, exit);
+	v4l2_h264_enc_rc_mode_op(rc, exit);
+
+	rc->mode = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rc_mode_update);
+
+int v4l2_h264_enc_rc_step(struct v4l2_h264_enc_rc *rc,
+			  struct v4l2_h264_enc_state *state)
+{
+	unsigned int qp;
+	int ret;
+
+	rc->state = state;
+
+	if (!rc->mode) {
+		ret = mode_prepare(rc);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_h264_enc_rc_mode_op(rc, measure, &rc->size);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	/* Estimate using driver implementation first. */
+	ret = v4l2_h264_enc_rc_op(rc, estimate, &qp);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	/* Fallback to common implementation otherwise. */
+	if (ret == -EOPNOTSUPP) {
+		ret = v4l2_h264_enc_rc_mode_op(rc, estimate, &qp);
+		if (ret)
+			return ret;
+	}
+
+	rc->qp = clamp(qp, state->qp_min, state->qp_max);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rc_step);
+
+int v4l2_h264_enc_rc_complete(struct v4l2_h264_enc_rc *rc,
+			      unsigned long bytesused)
+{
+	int ret;
+
+	if (!rc->mode)
+		return -EINVAL;
+
+	ret = v4l2_h264_enc_rc_op(rc, complete, bytesused);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	ret = v4l2_h264_enc_rc_mode_op(rc, complete, bytesused);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_rc_complete);
+
+MODULE_DESCRIPTION("V4L2 H.264 Encode Rate Control");
+MODULE_AUTHOR("Paul Kocialkowski <paulk@sys-base.io>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-h264-enc.c b/drivers/media/v4l2-core/v4l2-h264-enc.c
index 3b7bca117818..67ea82cebe7f 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc.c
@@ -10,6 +10,7 @@
 #include <media/v4l2-h264.h>
 #include <media/v4l2-h264-enc.h>
 #include <media/v4l2-h264-enc-rbsp.h>
+#include <media/v4l2-h264-enc-rc.h>
 #include <media/videobuf2-v4l2.h>
 
 static int rec_buffer_alloc(struct v4l2_h264_enc *enc,
@@ -94,6 +95,7 @@ static void rec_buffers_free(struct v4l2_h264_enc *enc)
 
 int v4l2_h264_enc_init(struct v4l2_h264_enc *enc)
 {
+	struct v4l2_h264_enc_rc *rc = &enc->rc;
 	struct v4l2_h264_enc_rbsp *rbsp = &enc->rbsp;
 	unsigned int slots_count = 0;
 	int ret;
@@ -123,15 +125,30 @@ int v4l2_h264_enc_init(struct v4l2_h264_enc *enc)
 	if (ret)
 		return ret;
 
+	rc->ops = enc->rc_ops;
+	rc->private_data = enc->private_data;
+
+	ret = v4l2_h264_enc_rc_init(rc);
+	if (ret)
+		goto error_buffers;
+
 	rbsp->ops = enc->rbsp_ops;
 	rbsp->private_data = enc->private_data;
 
 	return 0;
+
+error_buffers:
+	rec_buffers_free(enc);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_enc_init);
 
 void v4l2_h264_enc_exit(struct v4l2_h264_enc *enc)
 {
+	struct v4l2_h264_enc_rc *rc = &enc->rc;
+
+	v4l2_h264_enc_rc_exit(rc);
 	rec_buffers_free(enc);
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_enc_exit);
@@ -496,6 +513,100 @@ static int state_prepare_params(struct v4l2_h264_enc *enc)
 	return 0;
 }
 
+static int state_prepare_rc(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_next;
+	struct v4l2_ctrl_handler *handler = enc->ctrl_handler;
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE);
+	if (ctrl && ctrl->cur.val)
+		state->frame_rc_enable = true;
+	else
+		state->frame_rc_enable = false;
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_MPEG_VIDEO_H264_MIN_QP);
+	if (ctrl)
+		state->qp_min = ctrl->cur.val;
+	else
+		state->qp_min = 0;
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_MPEG_VIDEO_H264_MAX_QP);
+	if (ctrl)
+		state->qp_max = ctrl->cur.val;
+	else
+		state->qp_max = 51;
+
+	if (!state->frame_rc_enable) {
+		ctrl = v4l2_ctrl_find(handler,
+				      V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP);
+		if (!ctrl)
+			return -EINVAL;
+
+		state->qp_i = ctrl->cur.val;
+	}
+
+	if (!state->frame_rc_enable &&
+	    (enc->flags & V4L2_H264_ENC_FLAG_INTER_PRED)) {
+		ctrl = v4l2_ctrl_find(handler,
+				      V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP);
+		if (!ctrl)
+			return -EINVAL;
+
+		state->qp_p = ctrl->cur.val;
+	}
+
+	if (!state->frame_rc_enable &&
+	    (enc->flags & V4L2_H264_ENC_FLAG_INTER_BIPRED)) {
+		ctrl = v4l2_ctrl_find(handler,
+				      V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP);
+		if (!ctrl)
+			return -EINVAL;
+
+		state->qp_b = ctrl->cur.val;
+	}
+
+	if (!state->frame_rc_enable)
+		return 0;
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_MPEG_VIDEO_BITRATE_MODE);
+	if (!ctrl)
+		return -EINVAL;
+
+	state->bitrate_mode = ctrl->cur.val;
+
+	if (state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ) {
+		ctrl = v4l2_ctrl_find(handler,
+				      V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY);
+		if (!ctrl)
+			return -EINVAL;
+
+		state->quality = ctrl->cur.val;
+		state->quality_min = ctrl->minimum;
+		state->quality_max = ctrl->maximum;
+	}
+
+	if (state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR ||
+	    state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) {
+		ctrl = v4l2_ctrl_find(handler, V4L2_CID_MPEG_VIDEO_BITRATE);
+		if (!ctrl)
+			return -EINVAL;
+
+		state->bitrate = ctrl->cur.val;
+	}
+
+	if (state->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) {
+		ctrl = v4l2_ctrl_find(handler,
+				      V4L2_CID_MPEG_VIDEO_BITRATE_PEAK);
+		if (!ctrl)
+			return -EINVAL;
+
+		state->bitrate_peak = ctrl->cur.val;
+	}
+
+	return 0;
+}
+
 static int state_prepare(struct v4l2_h264_enc *enc)
 {
 	struct v4l2_h264_enc_state *state = &enc->state_next;
@@ -507,6 +618,10 @@ static int state_prepare(struct v4l2_h264_enc *enc)
 	if (ret)
 		return ret;
 
+	ret = state_prepare_rc(enc);
+	if (ret)
+		return ret;
+
 	ret = v4l2_h264_enc_op(enc, state_constrain, state);
 	if (ret && ret != -EOPNOTSUPP)
 		return ret;
@@ -1075,6 +1190,75 @@ static int ref_complete(struct v4l2_h264_enc *enc,
 	return 0;
 }
 
+static int rc_update(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_next;
+	struct v4l2_h264_enc_state *state_active = &enc->state_active;
+	int ret;
+
+	if (!enc->state_serial ||
+	    state_active->frame_rc_enable != state->frame_rc_enable ||
+	    (state_active->frame_rc_enable &&
+	     state_active->bitrate_mode != state->bitrate_mode)) {
+		ret = v4l2_h264_enc_rc_mode_update(&enc->rc);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rc_step(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_pps *pps = &state->pps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_rc *rc = &enc->rc;
+	int ret;
+
+	ret = v4l2_h264_enc_rc_step(rc, state);
+	if (ret)
+		return ret;
+
+	encode->slice_qp_delta = rc->qp - (pps->pic_init_qp_minus26 + 26);
+
+	pr_debug("+ v4l2-h264-enc: rc");
+
+	if (rc->mode) {
+		pr_debug("  rc mode: %s", rc->mode->name);
+
+		if (rc->mode->type == V4L2_H264_ENC_RC_TYPE_CBR) {
+			pr_debug("  rc bitrate: %u bits/s", state->bitrate);
+			pr_debug("  rc target: %lu bytes", rc->size);
+		}
+	}
+
+	pr_debug("  rc qp: %u", rc->qp);
+
+	return 0;
+}
+
+static int rc_complete(struct v4l2_h264_enc *enc,
+		       struct vb2_v4l2_buffer *buffer)
+{
+	struct v4l2_h264_enc_rc *rc = &enc->rc;
+	unsigned long bytesused;
+	int ret;
+
+	bytesused = vb2_get_plane_payload(&buffer->vb2_buf, 0);
+	if (WARN_ON(!bytesused))
+		return -EINVAL;
+
+	ret = v4l2_h264_enc_rc_complete(rc, bytesused);
+	if (ret)
+		return ret;
+
+	pr_debug("+ v4l2-h264-enc: complete");
+	pr_debug("  size: %lu bytes", bytesused);
+
+	return 0;
+}
+
 int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
 		       struct vb2_v4l2_buffer *buffer)
 {
@@ -1088,6 +1272,10 @@ int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
 	if (ret)
 		return ret;
 
+	ret = rc_update(enc);
+	if (ret)
+		return ret;
+
 	ret = state_commit(enc);
 	if (ret)
 		return ret;
@@ -1096,6 +1284,10 @@ int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
 	if (ret)
 		return ret;
 
+	ret = rc_step(enc);
+	if (ret)
+		return ret;
+
 	ret = rbsp_step(enc, buffer);
 	if (ret)
 		return ret;
@@ -1117,6 +1309,10 @@ int v4l2_h264_enc_complete(struct v4l2_h264_enc *enc,
 	if (ret)
 		return ret;
 
+	ret = rc_complete(enc, buffer);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_enc_complete);
diff --git a/include/media/v4l2-h264-enc-rc.h b/include/media/v4l2-h264-enc-rc.h
new file mode 100644
index 000000000000..8b453c3a212e
--- /dev/null
+++ b/include/media/v4l2-h264-enc-rc.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * V4L2 H.264 Encode Rate Control
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#ifndef _MEDIA_V4L2_H264_ENC_RC_H
+#define _MEDIA_V4L2_H264_ENC_RC_H
+
+#include <linux/v4l2-controls.h>
+#include <media/v4l2-h264.h>
+
+#define V4L2_H264_ENC_RC_STATS_TYPE_COUNT	10
+#define V4L2_H264_ENC_RC_STATS_SIZE_COUNT	25
+
+#define v4l2_h264_enc_rc_op(r, o, a...) \
+	({ \
+		int ret; \
+		if ((r)->ops && (r)->ops->o) \
+			ret = (r)->ops->o(r, ##a); \
+		else \
+			ret = -EOPNOTSUPP; \
+		ret; \
+	})
+
+#define v4l2_h264_enc_rc_mode_op(r, o, a...) \
+	({ \
+		int ret; \
+		if ((r)->mode && (r)->mode->o) \
+			ret = (r)->mode->o(r, ##a); \
+		else \
+			ret = -EOPNOTSUPP; \
+		ret; \
+	})
+
+struct v4l2_h264_enc_rc;
+struct v4l2_h264_enc_state;
+struct vb2_v4l2_buffer;
+
+enum v4l2_h264_enc_rc_type {
+	V4L2_H264_ENC_RC_TYPE_DIRECT,
+	V4L2_H264_ENC_RC_TYPE_CQ,
+	V4L2_H264_ENC_RC_TYPE_CBR,
+	V4L2_H264_ENC_RC_TYPE_VBR,
+};
+
+struct v4l2_h264_enc_rc_mode {
+	char name[32];
+	int type;
+	int (*init)(struct v4l2_h264_enc_rc *rc);
+	int (*exit)(struct v4l2_h264_enc_rc *rc);
+	int (*measure)(struct v4l2_h264_enc_rc *rc, unsigned long *size);
+	int (*estimate)(struct v4l2_h264_enc_rc *rc, unsigned int *qp);
+	int (*complete)(struct v4l2_h264_enc_rc *rc, unsigned long bytesused);
+};
+
+struct v4l2_h264_enc_rc_ops {
+	int (*init)(struct v4l2_h264_enc_rc *rc);
+	int (*exit)(struct v4l2_h264_enc_rc *rc);
+	int (*estimate)(struct v4l2_h264_enc_rc *rc, unsigned int *qp);
+	int (*complete)(struct v4l2_h264_enc_rc *rc, unsigned long bytesused);
+};
+
+struct v4l2_h264_enc_rc_stats_type {
+	unsigned long target[V4L2_H264_ENC_RC_STATS_TYPE_COUNT];
+	unsigned long size[V4L2_H264_ENC_RC_STATS_TYPE_COUNT];
+	unsigned int qp[V4L2_H264_ENC_RC_STATS_TYPE_COUNT];
+	unsigned int count;
+	unsigned int index;
+};
+
+struct v4l2_h264_enc_rc_stats {
+	struct v4l2_h264_enc_rc_stats_type intra;
+	struct v4l2_h264_enc_rc_stats_type pred;
+	struct v4l2_h264_enc_rc_stats_type bipred;
+
+	unsigned char slice_type[V4L2_H264_ENC_RC_STATS_SIZE_COUNT];
+	unsigned long size[V4L2_H264_ENC_RC_STATS_SIZE_COUNT];
+	unsigned long long size_total;
+	unsigned int count;
+	unsigned int index;
+};
+
+struct v4l2_h264_enc_rc {
+	const struct v4l2_h264_enc_rc_ops *ops;
+	void *private_data;
+
+	struct v4l2_h264_enc_state *state;
+	const struct v4l2_h264_enc_rc_mode *mode;
+	void *mode_data;
+
+	struct v4l2_h264_enc_rc_stats stats;
+	unsigned long size;
+	unsigned int qp;
+};
+
+int v4l2_h264_enc_rc_init(struct v4l2_h264_enc_rc *rc);
+void v4l2_h264_enc_rc_exit(struct v4l2_h264_enc_rc *rc);
+int v4l2_h264_enc_rc_stats_collect(struct v4l2_h264_enc_rc *rc,
+				   unsigned long bytesused);
+int v4l2_h264_enc_rc_mode_update(struct v4l2_h264_enc_rc *rc);
+int v4l2_h264_enc_rc_step(struct v4l2_h264_enc_rc *rc,
+			  struct v4l2_h264_enc_state *state);
+int v4l2_h264_enc_rc_complete(struct v4l2_h264_enc_rc *rc,
+			      unsigned long bytesused);
+
+#endif
diff --git a/include/media/v4l2-h264-enc.h b/include/media/v4l2-h264-enc.h
index 817a9ca2f169..6debdc95232c 100644
--- a/include/media/v4l2-h264-enc.h
+++ b/include/media/v4l2-h264-enc.h
@@ -11,6 +11,7 @@
 #include <linux/v4l2-controls.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-h264-enc-rbsp.h>
+#include <media/v4l2-h264-enc-rc.h>
 #include <media/videobuf2-v4l2.h>
 
 #define V4L2_H264_ENC_MB_UNIT	16
@@ -74,6 +75,21 @@ struct v4l2_h264_enc_state {
 	unsigned int width_aligned;
 	unsigned int height_mbs;
 	unsigned int height_aligned;
+
+	bool frame_rc_enable;
+
+	unsigned int qp_min;
+	unsigned int qp_max;
+	unsigned int qp_i;
+	unsigned int qp_p;
+	unsigned int qp_b;
+
+	int bitrate_mode;
+	unsigned int quality;
+	unsigned int quality_min;
+	unsigned int quality_max;
+	unsigned int bitrate;
+	unsigned int bitrate_peak;
 };
 
 struct v4l2_h264_enc_ops {
@@ -87,6 +103,7 @@ struct v4l2_h264_enc_ops {
 
 struct v4l2_h264_enc {
 	const struct v4l2_h264_enc_ops *ops;
+	const struct v4l2_h264_enc_rc_ops *rc_ops;
 	const struct v4l2_h264_enc_rbsp_ops *rbsp_ops;
 	void *private_data;
 
@@ -100,6 +117,7 @@ struct v4l2_h264_enc {
 	struct v4l2_h264_enc_state state_next;
 	unsigned int state_serial;
 
+	struct v4l2_h264_enc_rc rc;
 	struct v4l2_h264_enc_ref ref;
 	struct v4l2_h264_enc_rbsp rbsp;
 	unsigned int rbsp_update;
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index 3b00a1b67fe5..5e77f690902b 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -161,6 +161,30 @@ struct v4l2_h264_reflist_builder {
 	u8 num_valid;
 };
 
+static inline char v4l2_h264_slice_type_char(unsigned char slice_type)
+{
+	if (slice_type == V4L2_H264_SLICE_TYPE_I)
+		return 'I';
+	else if (slice_type == V4L2_H264_SLICE_TYPE_P)
+		return 'P';
+	else if (slice_type == V4L2_H264_SLICE_TYPE_B)
+		return 'B';
+	else
+		return 'X';
+}
+
+static inline const char *v4l2_h264_slice_type_name(unsigned char slice_type)
+{
+	if (slice_type == V4L2_H264_SLICE_TYPE_I)
+		return "intra";
+	else if (slice_type == V4L2_H264_SLICE_TYPE_P)
+		return "inter-pred";
+	else if (slice_type == V4L2_H264_SLICE_TYPE_B)
+		return "inter-bipred";
+	else
+		return "invalid";
+}
+
 void
 v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 		const struct v4l2_ctrl_h264_decode_params *dec_params,
-- 
2.53.0


