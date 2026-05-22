Return-Path: <linux-media+bounces-62583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPZ1D08vEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:26:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C36525B207F
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F7CA3047779
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6A13CC7E4;
	Fri, 22 May 2026 10:17:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413EB3CAA49;
	Fri, 22 May 2026 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445078; cv=none; b=AJkU1l27LYCzj8pjEZDVM7+pK2AapVcJGaNnCjlrieCnubL43+FRJIz9yo4eoe+l9lLGhGGC4BNfosmK7OaoYFzXz1Z/U9dcxXiECwT92qc3EBBeuHRPPD4cM9mJlnWl2G2xeijy75qLSdWXWnzuNaZsqEIqtACTCATlqE1k6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445078; c=relaxed/simple;
	bh=bfAoPr874ItxQ5PRzV/G9Eb34yJwWYBRQDJWM6GxSkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgFzUY7XZBCHWdsTG8LJPA2M2SveXwt7wx8N9H14Fp1cp7YFxIAvhTHLYYu1RdIpZ9cyJZW3VvxATjnfflL87D7dPHR3/o7aYeUffvZBsLwzdDZTaa5+8trUpOdu8qMi/4ci8cnI9pDPkFl7dYaWP/J52eGtOS0/NELferfAcm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BD4983700291;
	Fri, 22 May 2026 10:17:41 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4A3B9B408CD; Fri, 22 May 2026 10:17:41 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 50E2BB408C8;
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
Subject: [PATCH 06/14] media: h264: Add stateless encode reference management
Date: Fri, 22 May 2026 12:16:45 +0200
Message-ID: <20260522101653.2565125-7-paulk@sys-base.io>
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
	TAGGED_FROM(0.00)[bounces-62583-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.533];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sys-base.io:mid,sys-base.io:email]
X-Rspamd-Queue-Id: C36525B207F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The H.264 stateless encode reference management implementation is
responsible for allocating and tracking reconstruction buffers that
need to be used by hardware as well as track references in the DPB
following the sliding window decoded reference picture marking process.

It is also responsible for building the L0 and L1 reference lists
from the DPB, using the common v4l2 h264 reflist builder.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/v4l2-h264-enc.c | 418 ++++++++++++++++++++++++
 include/media/v4l2-h264-enc.h           |  33 ++
 2 files changed, 451 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-h264-enc.c b/drivers/media/v4l2-core/v4l2-h264-enc.c
index 0b46922d1d7a..3b7bca117818 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc.c
@@ -12,9 +12,90 @@
 #include <media/v4l2-h264-enc-rbsp.h>
 #include <media/videobuf2-v4l2.h>
 
+static int rec_buffer_alloc(struct v4l2_h264_enc *enc,
+			    struct v4l2_h264_enc_rec_buffer *buffer)
+{
+	int ret;
+
+	ret = v4l2_h264_enc_op(enc, rec_buffer_alloc, buffer);
+	if (ret)
+		return ret;
+
+	buffer->allocated = true;
+	enc->ref.slots_count++;
+
+	return 0;
+}
+
+static void rec_buffer_free(struct v4l2_h264_enc *enc,
+			    struct v4l2_h264_enc_rec_buffer *buffer)
+{
+	if (WARN_ON(!enc->ref.slots_count))
+		return;
+
+	v4l2_h264_enc_op(enc, rec_buffer_free, buffer);
+
+	buffer->allocated = false;
+	enc->ref.slots_count--;
+}
+
+static int rec_buffers_alloc(struct v4l2_h264_enc *enc,
+			     unsigned int slots_count)
+{
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	unsigned int i;
+	int ret;
+
+	ret = rec_buffer_alloc(enc, &ref->buffer_current);
+	if (ret)
+		return ret;
+
+	if (!(enc->flags & (V4L2_H264_ENC_FLAG_INTER_PRED |
+			    V4L2_H264_ENC_FLAG_INTER_BIPRED)))
+		return 0;
+
+	for (i = 0; i < slots_count; i++) {
+		ret = rec_buffer_alloc(enc, &ref->buffers[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (i > 0) {
+		i--;
+		rec_buffer_free(enc, &ref->buffers[i]);
+	}
+
+	rec_buffer_free(enc, &ref->buffer_current);
+
+	return ret;
+}
+
+static void rec_buffers_free(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	unsigned int i;
+
+	rec_buffer_free(enc, &ref->buffer_current);
+
+	if (!(enc->flags & (V4L2_H264_ENC_FLAG_INTER_PRED |
+			    V4L2_H264_ENC_FLAG_INTER_BIPRED)))
+		return;
+
+	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
+		if (!ref->buffers[i].allocated)
+			continue;
+
+		rec_buffer_free(enc, &ref->buffers[i]);
+	}
+}
+
 int v4l2_h264_enc_init(struct v4l2_h264_enc *enc)
 {
 	struct v4l2_h264_enc_rbsp *rbsp = &enc->rbsp;
+	unsigned int slots_count = 0;
 	int ret;
 
 	if ((!enc->format && !enc->format_mplane) || !enc->timeperframe ||
@@ -25,6 +106,23 @@ int v4l2_h264_enc_init(struct v4l2_h264_enc *enc)
 	memset(&enc->state_next, 0, sizeof(enc->state_next));
 	enc->state_serial = 0;
 
+	memset(&enc->ref, 0, sizeof(enc->ref));
+
+	if (enc->flags & (V4L2_H264_ENC_FLAG_INTER_PRED |
+			  V4L2_H264_ENC_FLAG_INTER_BIPRED)) {
+		if (!enc->ref_slots_count_init)
+			slots_count = V4L2_H264_NUM_DPB_ENTRIES / 2;
+		else if (WARN_ON(enc->ref_slots_count_init >
+				 V4L2_H264_NUM_DPB_ENTRIES))
+			slots_count = V4L2_H264_NUM_DPB_ENTRIES;
+		else
+			slots_count = enc->ref_slots_count_init;
+	}
+
+	ret = rec_buffers_alloc(enc, slots_count);
+	if (ret)
+		return ret;
+
 	rbsp->ops = enc->rbsp_ops;
 	rbsp->private_data = enc->private_data;
 
@@ -34,6 +132,7 @@ EXPORT_SYMBOL_GPL(v4l2_h264_enc_init);
 
 void v4l2_h264_enc_exit(struct v4l2_h264_enc *enc)
 {
+	rec_buffers_free(enc);
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_enc_exit);
 
@@ -665,6 +764,317 @@ static int rbsp_step(struct v4l2_h264_enc *enc,
 	return 0;
 }
 
+static struct v4l2_h264_enc_rec_buffer *
+ref_step_buffers_slot_find(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_rec_buffer *buffer;
+	unsigned int i;
+
+	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
+		buffer = &enc->ref.buffers[i];
+
+		if (buffer->allocated)
+			continue;
+
+		return buffer;
+	}
+
+	return NULL;
+}
+
+static int ref_step_buffers(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	struct v4l2_h264_enc_rec_buffer *buffer;
+	unsigned int count;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Only increase the number of slots. It avoids the cost of free
+	 * (including on the first frame) and the cost of possible future
+	 * allocations, at the expense of memory.
+	 */
+	if (sps->max_num_ref_frames <= ref->slots_count)
+		return 0;
+
+	count = sps->max_num_ref_frames - ref->slots_count;
+
+	for (i = 0; i < count; i++) {
+		buffer = ref_step_buffers_slot_find(enc);
+		if (WARN_ON(!buffer))
+			return -ENOMEM;
+
+		ret = rec_buffer_alloc(enc, buffer);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ref_step_poc(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_ctrl_h264_pps *pps = &state->pps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	unsigned int pic_order_cnt_lsb;
+	unsigned int pic_order_cnt_msb;
+	unsigned int prev_pic_order_cnt_msb;
+	unsigned int prev_pic_order_cnt_lsb;
+	unsigned int max_pic_order_cnt_lsb;
+	unsigned int delta_pic_order_cnt_bottom;
+	unsigned int top_field_order_cnt;
+	unsigned int bottom_field_order_cnt;
+
+	/* Only pic_order_cnt_type = 0 is currently supported. */
+	if (sps->pic_order_cnt_type)
+		return -EINVAL;
+
+	max_pic_order_cnt_lsb = BIT(sps->log2_max_pic_order_cnt_lsb_minus4 + 4);
+	pic_order_cnt_lsb = encode->pic_order_cnt_lsb;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) {
+		prev_pic_order_cnt_msb = 0;
+		prev_pic_order_cnt_lsb = 0;
+	} else {
+		prev_pic_order_cnt_msb = ref->prev_pic_order_cnt_msb;
+		prev_pic_order_cnt_lsb = ref->prev_pic_order_cnt_lsb;
+	}
+
+	if ((pic_order_cnt_lsb < prev_pic_order_cnt_lsb) &&
+	    ((prev_pic_order_cnt_lsb - pic_order_cnt_lsb) >=
+	     (max_pic_order_cnt_lsb / 2)))
+		pic_order_cnt_msb = prev_pic_order_cnt_msb +
+				    max_pic_order_cnt_lsb;
+	else if ((pic_order_cnt_lsb > prev_pic_order_cnt_lsb) &&
+		 ((pic_order_cnt_lsb - prev_pic_order_cnt_lsb) >
+		  (max_pic_order_cnt_lsb / 2)))
+		pic_order_cnt_msb = prev_pic_order_cnt_msb -
+				    max_pic_order_cnt_lsb;
+	else
+		pic_order_cnt_msb = prev_pic_order_cnt_msb;
+
+	top_field_order_cnt = pic_order_cnt_msb + pic_order_cnt_lsb;
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT)
+		delta_pic_order_cnt_bottom = encode->delta_pic_order_cnt_bottom;
+	else
+		delta_pic_order_cnt_bottom = 0;
+
+	if (!(encode->flags & V4L2_H264_ENCODE_FLAG_FIELD_PIC))
+		bottom_field_order_cnt = top_field_order_cnt +
+					 delta_pic_order_cnt_bottom;
+	else
+		bottom_field_order_cnt = top_field_order_cnt;
+
+	ref->pic_order_cnt_msb = pic_order_cnt_msb;
+	ref->pic_order_cnt_lsb = pic_order_cnt_lsb;
+	ref->top_field_order_cnt = top_field_order_cnt;
+	ref->bottom_field_order_cnt = bottom_field_order_cnt;
+	ref->pic_order_cnt = min(top_field_order_cnt, bottom_field_order_cnt);
+
+	return 0;
+}
+
+static int ref_step(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_ctrl_h264_pps *pps = &state->pps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	unsigned int l0_active_count_max;
+	unsigned int l1_active_count_max;
+	int ret;
+
+	ret = ref_step_buffers(enc);
+	if (ret)
+		return ret;
+
+	ret = ref_step_poc(enc);
+	if (ret)
+		return ret;
+
+	ref->l0_active_count = 0;
+	ref->l1_active_count = 0;
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I) {
+		/* Flush the DPB on IDR pictures. */
+		if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC)
+			memset(ref->dpb, 0, sizeof(ref->dpb));
+
+		return 0;
+	}
+
+	/* Generate reference lists. */
+
+	v4l2_h264_init_reflist_builder_gen(&ref->builder, sps, ref->dpb,
+					   ref->pic_order_cnt,
+					   encode->frame_num,
+					   V4L2_H264_FRAME_REF);
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE) {
+		l0_active_count_max = encode->num_ref_idx_l0_active_minus1 + 1;
+		l1_active_count_max = encode->num_ref_idx_l1_active_minus1 + 1;
+	} else {
+		l0_active_count_max =
+			pps->num_ref_idx_l0_default_active_minus1 + 1;
+		l1_active_count_max =
+			pps->num_ref_idx_l1_default_active_minus1 + 1;
+	}
+
+	switch (encode->slice_type) {
+	case V4L2_H264_SLICE_TYPE_P:
+		v4l2_h264_build_p_ref_list(&ref->builder, ref->l0);
+
+		if (ref->builder.num_valid > l0_active_count_max)
+			ref->l0_active_count = l0_active_count_max;
+		else
+			ref->l0_active_count = ref->builder.num_valid;
+
+		WARN_ON(!ref->l0_active_count);
+
+		break;
+	case V4L2_H264_SLICE_TYPE_B:
+		v4l2_h264_build_b_ref_lists(&ref->builder, ref->l0, ref->l1);
+
+		if (ref->builder.num_valid > l0_active_count_max)
+			ref->l0_active_count = l0_active_count_max;
+		else
+			ref->l0_active_count = ref->builder.num_valid;
+
+		WARN_ON(!ref->l0_active_count);
+
+		if (ref->builder.num_valid > l1_active_count_max)
+			ref->l1_active_count = l1_active_count_max;
+		else
+			ref->l1_active_count = ref->builder.num_valid;
+
+		WARN_ON(!ref->l1_active_count);
+
+		break;
+	}
+
+	pr_debug("+ v4l2-h264-enc: ref");
+	pr_debug("  ref active l0: %u, l1: %u", ref->l0_active_count,
+		 ref->l1_active_count);
+
+	return 0;
+}
+
+static int ref_complete_slot_find(struct v4l2_h264_enc *enc,
+				  unsigned int *index)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	unsigned int max_frame_num = BIT(sps->log2_max_frame_num_minus4 + 4);
+	unsigned int frame_num_wrap_smallest = encode->frame_num;
+	unsigned int frame_num_wrap_smallest_index;
+	unsigned int frame_num_wrap;
+	struct v4l2_h264_enc_rec_buffer *buffer;
+	struct v4l2_h264_dpb_entry *dpb_entry;
+	unsigned int i;
+
+	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
+		buffer = &ref->buffers[i];
+		dpb_entry = &ref->dpb[i];
+
+		if (!buffer->allocated)
+			continue;
+
+		/* Return an unused slot. */
+		if (!(dpb_entry->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) {
+			*index = i;
+			return 0;
+		}
+
+		/* Track the smallest FrameNumWrap value. */
+		if (dpb_entry->frame_num > encode->frame_num)
+			frame_num_wrap = dpb_entry->frame_num - max_frame_num;
+		else
+			frame_num_wrap = dpb_entry->frame_num;
+
+		if (frame_num_wrap < frame_num_wrap_smallest) {
+			frame_num_wrap_smallest = frame_num_wrap;
+			frame_num_wrap_smallest_index = i;
+		}
+	}
+
+	/* Clear the evicted DPB entry. */
+	dpb_entry = &ref->dpb[frame_num_wrap_smallest_index];
+	memset(dpb_entry, 0, sizeof(*dpb_entry));
+
+	*index = frame_num_wrap_smallest_index;
+
+	return 0;
+}
+
+static int ref_complete_swap(struct v4l2_h264_enc *enc, unsigned int index,
+			     u64 ts)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	struct v4l2_h264_dpb_entry *dpb_entry = &ref->dpb[index];
+	struct v4l2_h264_enc_rec_buffer *buffer = &ref->buffers[index];
+	struct v4l2_h264_enc_rec_buffer *buffer_current =
+		&ref->buffer_current;
+
+	/* Set the DPB entry of the available slot. */
+	memset(dpb_entry, 0, sizeof(*dpb_entry));
+	dpb_entry->reference_ts = ts;
+	dpb_entry->pic_num = encode->frame_num;
+	dpb_entry->frame_num = encode->frame_num;
+	dpb_entry->fields = V4L2_H264_FRAME_REF;
+	dpb_entry->top_field_order_cnt = ref->top_field_order_cnt;
+	dpb_entry->bottom_field_order_cnt = ref->bottom_field_order_cnt;
+	dpb_entry->flags = V4L2_H264_DPB_ENTRY_FLAG_VALID |
+			   V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE)
+		dpb_entry->flags |= V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM;
+
+	/* Swap the current buffer with the available slot. */
+	swap(*buffer_current, *buffer);
+
+	return 0;
+}
+
+static int ref_complete(struct v4l2_h264_enc *enc,
+			struct vb2_v4l2_buffer *buffer)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	unsigned int index;
+	int ret;
+
+	if (!encode->nal_ref_idc)
+		return 0;
+
+	/* Keep the POC as last reference. */
+	ref->prev_pic_order_cnt_msb = ref->pic_order_cnt_msb;
+	ref->prev_pic_order_cnt_lsb = ref->pic_order_cnt_lsb;
+
+	ret = ref_complete_slot_find(enc, &index);
+	if (ret)
+		return ret;
+
+	/* Move our current picture to the DPB. */
+	ret = ref_complete_swap(enc, index, buffer->vb2_buf.timestamp);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
 		       struct vb2_v4l2_buffer *buffer)
 {
@@ -682,6 +1092,10 @@ int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
 	if (ret)
 		return ret;
 
+	ret = ref_step(enc);
+	if (ret)
+		return ret;
+
 	ret = rbsp_step(enc, buffer);
 	if (ret)
 		return ret;
@@ -699,6 +1113,10 @@ int v4l2_h264_enc_complete(struct v4l2_h264_enc *enc,
 	if (ret)
 		return ret;
 
+	ret = ref_complete(enc, buffer);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_enc_complete);
diff --git a/include/media/v4l2-h264-enc.h b/include/media/v4l2-h264-enc.h
index 3d6b97408707..817a9ca2f169 100644
--- a/include/media/v4l2-h264-enc.h
+++ b/include/media/v4l2-h264-enc.h
@@ -35,6 +35,33 @@
 
 struct v4l2_h264_enc;
 
+struct v4l2_h264_enc_rec_buffer {
+	void *private_data;
+	bool allocated;
+};
+
+struct v4l2_h264_enc_ref {
+	struct v4l2_h264_enc_rec_buffer buffer_current;
+	struct v4l2_h264_enc_rec_buffer buffers[V4L2_H264_NUM_DPB_ENTRIES];
+	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
+	unsigned int slots_count;
+
+	struct v4l2_h264_reference l0[V4L2_H264_REF_LIST_LEN];
+	unsigned int l0_active_count;
+	struct v4l2_h264_reference l1[V4L2_H264_REF_LIST_LEN];
+	unsigned int l1_active_count;
+
+	struct v4l2_h264_reflist_builder builder;
+
+	unsigned int prev_pic_order_cnt_msb;
+	unsigned int prev_pic_order_cnt_lsb;
+	unsigned int pic_order_cnt_msb;
+	unsigned int pic_order_cnt_lsb;
+	unsigned int top_field_order_cnt;
+	unsigned int bottom_field_order_cnt;
+	unsigned int pic_order_cnt;
+};
+
 struct v4l2_h264_enc_state {
 	struct v4l2_ctrl_h264_sps sps;
 	struct v4l2_h264_sps_video sps_video;
@@ -52,6 +79,10 @@ struct v4l2_h264_enc_state {
 struct v4l2_h264_enc_ops {
 	int (*state_constrain)(struct v4l2_h264_enc *enc,
 			       struct v4l2_h264_enc_state *state);
+	int (*rec_buffer_alloc)(struct v4l2_h264_enc *enc,
+				struct v4l2_h264_enc_rec_buffer *rec_buffer);
+	int (*rec_buffer_free)(struct v4l2_h264_enc *enc,
+			       struct v4l2_h264_enc_rec_buffer *rec_buffer);
 };
 
 struct v4l2_h264_enc {
@@ -63,11 +94,13 @@ struct v4l2_h264_enc {
 	struct v4l2_pix_format_mplane *format_mplane;
 	struct v4l2_fract *timeperframe;
 	struct v4l2_ctrl_handler *ctrl_handler;
+	unsigned int ref_slots_count_init;
 
 	struct v4l2_h264_enc_state state_active;
 	struct v4l2_h264_enc_state state_next;
 	unsigned int state_serial;
 
+	struct v4l2_h264_enc_ref ref;
 	struct v4l2_h264_enc_rbsp rbsp;
 	unsigned int rbsp_update;
 
-- 
2.53.0


