Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0132659AA48
	for <lists+linux-media@lfdr.de>; Sat, 20 Aug 2022 02:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245638AbiHTAuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 20:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243566AbiHTAuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 20:50:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D092D6272
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 17:50:17 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CAE996601DC9;
        Sat, 20 Aug 2022 01:50:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660956616;
        bh=Zaxx1NMvM4P1rynMnkyZWxUsv//6XSdvMIZrJI39UTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N7SNvWwizvs53zmiG5BGqKt4U5XC1tl2bd/a4p09UCN/8l/Gv3xmpYIgs5DPQwUjN
         nhzqPrrWjzm7N9h+Kfy+gvNAHXrFN251rgo4KVNU0YLNWnvY9CnNC17j+SmgpycwwZ
         +WxhRZPleHqKJDs7vko4KbdGpjtbQS1FGoqQ1Y0RgF/PY0ARnzTM3dmICTST5e99QK
         h41p4kBk5H/oxLVc0HoH+jjA/bk/dXNK7JgWmVGvhsZ3kqAaXjqO9EspIkmFOB9ASV
         IQdQx9Rzi4CQmfW/A+SUeaY4VdkGEca4T3WxEMeCPO0GtbN6XOnnVkQJoejNzjE6qU
         LRLJD56KDGMPg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [RFC 2/2] utils: add stateless retracer utility
Date:   Fri, 19 Aug 2022 17:50:19 -0700
Message-Id: <94751365688c863124725b7d5276191b07838c56.1660955263.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1660955263.git.deborah.brouwer@collabora.com>
References: <cover.1660955263.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The retracer utility reads and replays a json-formatted file produced by
the stateless tracer utility. The retracer runs independently from other
userspace applications and so allows a driver to be tested in different
userspace environments. If the trace file is edited to send specific
errors to a driver, the retracer can be used to test a driver's error-
handling abilities.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/tracer/Makefile.am        |    6 +-
 utils/tracer/retrace-helper.cpp |  141 ++++
 utils/tracer/retrace-helper.h   |   18 +
 utils/tracer/retrace-vp8.cpp    |  288 ++++++++
 utils/tracer/retrace-vp8.h      |   11 +
 utils/tracer/retracer.cpp       | 1090 +++++++++++++++++++++++++++++++
 utils/tracer/retracer.h         |   24 +
 7 files changed, 1577 insertions(+), 1 deletion(-)
 create mode 100755 utils/tracer/retrace-helper.cpp
 create mode 100644 utils/tracer/retrace-helper.h
 create mode 100755 utils/tracer/retrace-vp8.cpp
 create mode 100644 utils/tracer/retrace-vp8.h
 create mode 100755 utils/tracer/retracer.cpp
 create mode 100644 utils/tracer/retracer.h

diff --git a/utils/tracer/Makefile.am b/utils/tracer/Makefile.am
index f5579198..6cf5f000 100644
--- a/utils/tracer/Makefile.am
+++ b/utils/tracer/Makefile.am
@@ -10,10 +10,14 @@ libtracer_la_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
 libtracer_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -ldl $(JSONC_LIBS)
 libtracer_la_LIBTOOLFLAGS = --tag=disable-static
 
-bin_PROGRAMS = tracer
+bin_PROGRAMS = tracer retracer
 
 tracer_SOURCES = tracer.cpp
 tracer_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
 tracer_LDFLAGS = -lrt -lpthread $(JSONC_LIBS)
 
+retracer_SOURCES = retracer.cpp retrace-helper.cpp retrace-vp8.cpp trace-info.cpp ../common/v4l2-info.cpp
+retracer_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
+retracer_LDFLAGS = -lrt -lpthread  $(JSONC_LIBS)
+
 endif
diff --git a/utils/tracer/retrace-helper.cpp b/utils/tracer/retrace-helper.cpp
new file mode 100755
index 00000000..491bf42d
--- /dev/null
+++ b/utils/tracer/retrace-helper.cpp
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "retracer.h"
+
+struct buffer_retrace {
+	int fd;
+	long int address_trace;
+	long int address_retrace;
+};
+
+struct retrace_context {
+	pthread_mutex_t lock;
+
+	/* Key is a file descriptor from the trace, value is the corresponding fd in the retrace context. */
+	std::unordered_map<int, int> retrace_fds;
+
+	/* List of output and capture buffers being retraced. */
+	std::list<struct buffer_retrace> buffers;
+};
+
+static struct retrace_context ctx_retrace = {
+	.lock = PTHREAD_MUTEX_INITIALIZER
+};
+
+/* Take a buffer's file descriptor and create a new buffer entry in retrace context. */
+void add_buffer_retrace(int fd)
+{
+	struct buffer_retrace buf;
+	memset(&buf, 0, sizeof(buffer_retrace));
+	buf.fd = fd;
+	pthread_mutex_lock(&ctx_retrace.lock);
+	ctx_retrace.buffers.push_front(buf);
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+/*
+ * Use the buffer file descriptor to get a buffer entry from the retrace context.
+ * Add the buffer's memory address from both the trace and retrace context to the buffer entry.
+ */
+void set_buffer_address_retrace(int fd, long address_trace, long address_retrace)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto it = ctx_retrace.buffers.begin(); it != ctx_retrace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			it->address_trace = address_trace;
+			it->address_retrace = address_retrace;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+/* Take an address from the trace and return the corresponding address in the retrace context. */
+long int get_buffer_address_retrace(long address_trace)
+{
+	long int address_retrace = 0;
+
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto it = ctx_retrace.buffers.cbegin(); it != ctx_retrace.buffers.cend(); ++it) {
+		if (it->address_trace == address_trace) {
+			address_retrace = it->address_retrace;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+
+	return address_retrace;
+}
+
+void print_buffers_retrace(void)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto it = ctx_retrace.buffers.cbegin(); it != ctx_retrace.buffers.cend(); ++it) {
+		fprintf(stderr, "fd: %d, address_trace:%ld, address_retrace:%ld\n",
+				it->fd, it->address_trace, it->address_retrace);
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+/*
+ * Create a new file descriptor entry in retrace context.
+ * Add both the fd from the trace context and the corresponding fd from the retrace context.
+ */
+void add_fd(int fd_trace, int fd_retrace)
+{
+	std::pair<int, int> new_pair;
+	new_pair = std::make_pair(fd_trace, fd_retrace);
+	pthread_mutex_lock(&ctx_retrace.lock);
+	ctx_retrace.retrace_fds.insert(new_pair);
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+/* Take a file descriptor from the trace and return the corresponding fd in the retrace context. */
+int get_fd(int fd_trace)
+{
+	int fd_retrace = 0;
+	std::unordered_map<int, int>::const_iterator it;
+
+	pthread_mutex_lock(&ctx_retrace.lock);
+	it = ctx_retrace.retrace_fds.find(fd_trace);
+	if (it != ctx_retrace.retrace_fds.end())
+		fd_retrace = it->second;
+	pthread_mutex_unlock(&ctx_retrace.lock);
+
+	return fd_retrace;
+}
+
+/* Using a file descriptor from the trace, find and remove an fd entry from the retrace context.*/
+void remove_fd(int fd_trace)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	ctx_retrace.retrace_fds.erase(fd_trace);
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+void print_fds(void)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	if (ctx_retrace.retrace_fds.empty())
+		fprintf(stderr, "all devices closed\n");
+	for ( auto it = ctx_retrace.retrace_fds.cbegin(); it != ctx_retrace.retrace_fds.cend(); ++it )
+		fprintf(stderr, "fd_trace: %d, fd_retrace: %d\n", it->first, it->second);
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+void print_context(void)
+{
+	print_fds();
+	print_buffers_retrace();
+	fprintf(stderr, "\n");
+}
+
+int retrace_v4l2_ext_control_value(json_object *ctrl_obj)
+{
+	json_object *value_obj;
+	json_object_object_get_ex(ctrl_obj, "value", &value_obj);
+	return json_object_get_int(value_obj);
+}
diff --git a/utils/tracer/retrace-helper.h b/utils/tracer/retrace-helper.h
new file mode 100644
index 00000000..3634d2a7
--- /dev/null
+++ b/utils/tracer/retrace-helper.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef RETRACE_HELPER_H
+#define RETRACE_HELPER_H
+
+void add_buffer_retrace(int fd);
+void set_buffer_address_retrace(int fd, long address_trace, long address_retrace);
+long int get_buffer_address_retrace(long address_trace);
+int get_fd(int fd_trace);
+void add_fd(int fd_trace, int fd_retrace);
+void remove_fd(int fd_trace);
+void print_context(void);
+int retrace_v4l2_ext_control_value(json_object *ctrl_obj);
+
+#endif
diff --git a/utils/tracer/retrace-vp8.cpp b/utils/tracer/retrace-vp8.cpp
new file mode 100755
index 00000000..5b893f19
--- /dev/null
+++ b/utils/tracer/retrace-vp8.cpp
@@ -0,0 +1,288 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "retracer.h"
+
+struct v4l2_vp8_loop_filter retrace_v4l2_vp8_loop_filter(json_object *lf_obj)
+{
+	struct v4l2_vp8_loop_filter lf;
+	memset(&lf, 0, sizeof(lf));
+
+	/* __s8 ref_frm_delta[4] */
+	json_object *ref_frm_delta_obj;
+	json_object_object_get_ex(lf_obj, "ref_frm_delta", &ref_frm_delta_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(lf.ref_frm_delta); i++)
+		lf.ref_frm_delta[i] = (__s8) json_object_get_int(json_object_array_get_idx(ref_frm_delta_obj, i));
+
+	/* __s8 mb_mode_delta[4] */
+	json_object *mb_mode_delta_obj;
+	json_object_object_get_ex(lf_obj, "mb_mode_delta", &mb_mode_delta_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(lf.mb_mode_delta); i++)
+		lf.mb_mode_delta[i] = (__s8) json_object_get_int(json_object_array_get_idx(mb_mode_delta_obj, i));
+
+	json_object *sharpness_level_obj;
+	json_object_object_get_ex(lf_obj, "sharpness_level", &sharpness_level_obj);
+	lf.sharpness_level = json_object_get_int(sharpness_level_obj);
+
+	json_object *level_obj;
+	json_object_object_get_ex(lf_obj, "level", &level_obj);
+	lf.level = json_object_get_int(level_obj);
+
+	json_object *padding_obj;
+	json_object_object_get_ex(lf_obj, "padding", &padding_obj);
+	lf.padding = json_object_get_int(padding_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(lf_obj, "flags", &flags_obj);
+	lf.flags = json_object_get_int(flags_obj);
+
+	return lf;
+}
+
+struct v4l2_vp8_segment retrace_v4l2_vp8_segment(json_object *segment_obj)
+{
+	struct v4l2_vp8_segment segment;
+	memset(&segment, 0, sizeof(v4l2_vp8_segment));
+
+	/*	__s8 quant_update[4] */
+	json_object *quant_update_obj;
+	json_object_object_get_ex(segment_obj, "quant_update", &quant_update_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(segment.quant_update); i++)
+		segment.quant_update[i] = (__s8) json_object_get_int(json_object_array_get_idx(quant_update_obj, i));
+
+	/* __s8 lf_update[4] */
+	json_object *lf_update_obj;
+	json_object_object_get_ex(segment_obj, "lf_update", &lf_update_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(segment.lf_update); i++)
+		segment.lf_update[i] = (__s8) json_object_get_int(json_object_array_get_idx(lf_update_obj, i));
+
+	/* __u8 segment_probs[3] */
+	json_object *segment_probs_obj;
+	json_object_object_get_ex(segment_obj, "segment_probs", &segment_probs_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(segment.segment_probs); i++)
+		segment.segment_probs[i] = json_object_get_int(json_object_array_get_idx(segment_probs_obj, i));
+
+	json_object *padding_obj;
+	json_object_object_get_ex(segment_obj, "padding", &padding_obj);
+	segment.padding = json_object_get_int(padding_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(segment_obj, "flags", &flags_obj);
+	segment.flags = json_object_get_int(flags_obj);
+
+	return segment;
+}
+
+struct v4l2_vp8_quantization retrace_v4l2_vp8_quantization(json_object *quant_obj)
+{
+	struct v4l2_vp8_quantization quant;
+	memset(&quant, 0, sizeof(quant));
+
+	json_object *y_ac_qi_obj;
+	json_object_object_get_ex(quant_obj, "y_ac_qi", &y_ac_qi_obj);
+	quant.y_ac_qi = json_object_get_int(y_ac_qi_obj);
+
+	json_object *y_dc_delta_obj;
+	json_object_object_get_ex(quant_obj, "y_dc_delta", &y_dc_delta_obj);
+	quant.y_dc_delta = (__s8) json_object_get_int(y_dc_delta_obj);
+
+	json_object *y2_dc_delta_obj;
+	json_object_object_get_ex(quant_obj, "y2_dc_delta", &y2_dc_delta_obj);
+	quant.y2_dc_delta = (__s8) json_object_get_int(y2_dc_delta_obj);
+
+	json_object *y2_ac_delta_obj;
+	json_object_object_get_ex(quant_obj, "y2_ac_delta", &y2_ac_delta_obj);
+	quant.y2_ac_delta = (__s8) json_object_get_int(y2_ac_delta_obj);
+
+	json_object *uv_dc_delta_obj;
+	json_object_object_get_ex(quant_obj, "uv_dc_delta", &uv_dc_delta_obj);
+	quant.uv_dc_delta = (__s8) json_object_get_int(uv_dc_delta_obj);
+
+	json_object *uv_ac_delta_obj;
+	json_object_object_get_ex(quant_obj, "uv_ac_delta", &uv_ac_delta_obj);
+	quant.uv_ac_delta = (__s8) json_object_get_int(uv_ac_delta_obj);
+
+	json_object *padding_obj;
+	json_object_object_get_ex(quant_obj, "padding", &padding_obj);
+	quant.padding = json_object_get_int(padding_obj);
+
+	return quant;
+}
+
+struct v4l2_vp8_entropy retrace_v4l2_vp8_entropy(json_object *entropy_obj)
+{
+	struct v4l2_vp8_entropy entropy;
+	memset(&entropy, 0, sizeof(entropy));
+
+	int count = 0;
+
+	/* __u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT] */
+	json_object *coeff_probs_obj;
+	json_object_object_get_ex(entropy_obj, "coeff_probs", &coeff_probs_obj);
+
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.coeff_probs); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(entropy.coeff_probs[0]); j++)
+			for (size_t k = 0; k < ARRAY_SIZE(entropy.coeff_probs[0][0]); k++)
+				for (size_t l = 0; l < V4L2_VP8_COEFF_PROB_CNT; l++)
+					entropy.coeff_probs[i][j][k][l] = json_object_get_int(json_object_array_get_idx(coeff_probs_obj, count++));
+
+	/* __u8 y_mode_probs[4] */
+	json_object *y_mode_probs_obj;
+	json_object_object_get_ex(entropy_obj, "y_mode_probs", &y_mode_probs_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.y_mode_probs); i++)
+		entropy.y_mode_probs[i] = json_object_get_int(json_object_array_get_idx(y_mode_probs_obj, i));
+
+	/* __u8 uv_mode_probs[3] */
+	json_object *uv_mode_probs_obj;
+	json_object_object_get_ex(entropy_obj, "uv_mode_probs", &uv_mode_probs_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.uv_mode_probs); i++)
+		entropy.uv_mode_probs[i] = json_object_get_int(json_object_array_get_idx(uv_mode_probs_obj, i));
+
+	/*  __u8 mv_probs[2][V4L2_VP8_MV_PROB_CNT] */
+	count = 0;
+	json_object *mv_probs_obj;
+	json_object_object_get_ex(entropy_obj, "mv_probs", &mv_probs_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.mv_probs); i++)
+		for (size_t j = 0; j < V4L2_VP8_MV_PROB_CNT; j++)
+			entropy.mv_probs[i][j] = json_object_get_int(json_object_array_get_idx(mv_probs_obj, count++));
+
+	/* __u8 padding[3] */
+	json_object *padding_obj;
+	json_object_object_get_ex(entropy_obj, "padding", &padding_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.padding); i++)
+		entropy.padding[i] = json_object_get_int(json_object_array_get_idx(padding_obj, i));
+
+	return entropy;
+}
+
+struct v4l2_vp8_entropy_coder_state retrace_v4l2_vp8_entropy_coder_state(json_object *coder_state_obj)
+{
+	struct v4l2_vp8_entropy_coder_state coder_state;
+	memset(&coder_state, 0, sizeof(coder_state));
+
+	json_object *range_obj;
+	json_object_object_get_ex(coder_state_obj, "range", &range_obj);
+	coder_state.range = json_object_get_int(range_obj);
+
+	json_object *value_obj;
+	json_object_object_get_ex(coder_state_obj, "value", &value_obj);
+	coder_state.value = json_object_get_int(value_obj);
+
+	json_object *bit_count_obj;
+	json_object_object_get_ex(coder_state_obj, "bit_count", &bit_count_obj);
+	coder_state.bit_count = json_object_get_int(bit_count_obj);
+
+	json_object *padding_obj;
+	json_object_object_get_ex(coder_state_obj, "padding", &padding_obj);
+	coder_state.padding = json_object_get_int(padding_obj);
+
+	return coder_state;
+}
+
+struct v4l2_ctrl_vp8_frame *retrace_v4l2_ctrl_vp8_frame_pointer(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_vp8_frame *vp8_frame_pointer = (struct v4l2_ctrl_vp8_frame *) malloc(sizeof(v4l2_ctrl_vp8_frame));
+	memset(vp8_frame_pointer, 0, sizeof(v4l2_ctrl_vp8_frame));
+
+	json_object *vp8_frame_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_vp8_frame", &vp8_frame_obj);
+
+	/* struct v4l2_vp8_segment segment */
+	json_object *segment_obj;
+	json_object_object_get_ex(vp8_frame_obj, "segment", &segment_obj);
+	vp8_frame_pointer->segment = retrace_v4l2_vp8_segment(segment_obj);
+
+	/* struct v4l2_vp8_loop_filter lf */
+	json_object *lf_obj;
+	json_object_object_get_ex(vp8_frame_obj, "lf", &lf_obj);
+	vp8_frame_pointer->lf = retrace_v4l2_vp8_loop_filter(lf_obj);
+
+	/* struct v4l2_vp8_quantization quant */
+	json_object *quant_obj;
+	json_object_object_get_ex(vp8_frame_obj, "quant", &quant_obj);
+	vp8_frame_pointer->quant = retrace_v4l2_vp8_quantization(quant_obj);
+
+	/* struct v4l2_vp8_entropy entropy */
+	json_object *entropy_obj;
+	json_object_object_get_ex(vp8_frame_obj, "entropy", &entropy_obj);
+	vp8_frame_pointer->entropy = retrace_v4l2_vp8_entropy(entropy_obj);
+
+	/* struct v4l2_vp8_entropy_coder_state coder_state */
+	json_object *coder_state_obj;
+	json_object_object_get_ex(vp8_frame_obj, "coder_state", &coder_state_obj);
+	vp8_frame_pointer->coder_state = retrace_v4l2_vp8_entropy_coder_state(coder_state_obj);
+
+	json_object *width_obj;
+	json_object_object_get_ex(vp8_frame_obj, "width", &width_obj);
+	vp8_frame_pointer->width = json_object_get_int(width_obj);
+
+	json_object *height_obj;
+	json_object_object_get_ex(vp8_frame_obj, "height", &height_obj);
+	vp8_frame_pointer->height = json_object_get_int(height_obj);
+
+	json_object *horizontal_scale_obj;
+	json_object_object_get_ex(vp8_frame_obj, "horizontal_scale", &horizontal_scale_obj);
+	vp8_frame_pointer->horizontal_scale = json_object_get_int(horizontal_scale_obj);
+
+	json_object *vertical_scale_obj;
+	json_object_object_get_ex(vp8_frame_obj, "vertical_scale", &vertical_scale_obj);
+	vp8_frame_pointer->vertical_scale = json_object_get_int(vertical_scale_obj);
+
+	json_object *version_obj;
+	json_object_object_get_ex(vp8_frame_obj, "version", &version_obj);
+	vp8_frame_pointer->version = json_object_get_int(version_obj);
+
+	json_object *prob_skip_false_obj;
+	json_object_object_get_ex(vp8_frame_obj, "prob_skip_false", &prob_skip_false_obj);
+	vp8_frame_pointer->prob_skip_false = json_object_get_int(prob_skip_false_obj);
+
+	json_object *prob_intra_obj;
+	json_object_object_get_ex(vp8_frame_obj, "prob_intra", &prob_intra_obj);
+	vp8_frame_pointer->prob_intra = json_object_get_int(prob_intra_obj);
+
+	json_object *prob_last_obj;
+	json_object_object_get_ex(vp8_frame_obj, "prob_last", &prob_last_obj);
+	vp8_frame_pointer->prob_last = json_object_get_int(prob_last_obj);
+
+	json_object *prob_gf_obj;
+	json_object_object_get_ex(vp8_frame_obj, "prob_gf", &prob_gf_obj);
+	vp8_frame_pointer->prob_gf = json_object_get_int(prob_gf_obj);
+
+	json_object *num_dct_parts_obj;
+	json_object_object_get_ex(vp8_frame_obj, "num_dct_parts", &num_dct_parts_obj);
+	vp8_frame_pointer->num_dct_parts = json_object_get_int(num_dct_parts_obj);
+
+	json_object *first_part_size_obj;
+	json_object_object_get_ex(vp8_frame_obj, "first_part_size", &first_part_size_obj);
+	vp8_frame_pointer->first_part_size = json_object_get_int(first_part_size_obj);
+
+	json_object *first_part_header_bits_obj;
+	json_object_object_get_ex(vp8_frame_obj, "first_part_header_bits", &first_part_header_bits_obj);
+	vp8_frame_pointer->first_part_header_bits = json_object_get_int(first_part_header_bits_obj);
+
+	/* __u32 dct_part_sizes[8] */
+	json_object *dct_part_sizes_obj;
+	json_object_object_get_ex(vp8_frame_obj, "dct_part_sizes", &dct_part_sizes_obj);
+	for (int i = 0; i < 8; i++)
+		vp8_frame_pointer->dct_part_sizes[i] = json_object_get_int(json_object_array_get_idx(dct_part_sizes_obj, i));
+
+	json_object *last_frame_ts_obj;
+	json_object_object_get_ex(vp8_frame_obj, "last_frame_ts", &last_frame_ts_obj);
+	vp8_frame_pointer->last_frame_ts = json_object_get_int(last_frame_ts_obj);
+
+	json_object *golden_frame_ts_obj;
+	json_object_object_get_ex(vp8_frame_obj, "golden_frame_ts", &golden_frame_ts_obj);
+	vp8_frame_pointer->golden_frame_ts = json_object_get_int(golden_frame_ts_obj);
+
+	json_object *alt_frame_ts_obj;
+	json_object_object_get_ex(vp8_frame_obj, "alt_frame_ts", &alt_frame_ts_obj);
+	vp8_frame_pointer->alt_frame_ts = json_object_get_int(alt_frame_ts_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(vp8_frame_obj, "flags", &flags_obj);
+	vp8_frame_pointer->flags = json_object_get_int(flags_obj);
+
+	return vp8_frame_pointer;
+}
\ No newline at end of file
diff --git a/utils/tracer/retrace-vp8.h b/utils/tracer/retrace-vp8.h
new file mode 100644
index 00000000..a5bea25e
--- /dev/null
+++ b/utils/tracer/retrace-vp8.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef RETRACE_VP8_H
+#define RETRACE_VP8_H
+
+struct v4l2_ctrl_vp8_frame *retrace_v4l2_ctrl_vp8_frame_pointer(json_object *ctrl_obj);
+
+#endif
diff --git a/utils/tracer/retracer.cpp b/utils/tracer/retracer.cpp
new file mode 100755
index 00000000..049761f4
--- /dev/null
+++ b/utils/tracer/retracer.cpp
@@ -0,0 +1,1090 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "retracer.h"
+
+bool debug = false;
+std::string retrace_filename;
+std::string dev_path_video;
+std::string dev_path_media;
+
+void retrace_mmap64(json_object *mmap_obj)
+{
+	json_object *mmap64_args_obj;
+	json_object_object_get_ex(mmap_obj, "mmap64_args", &mmap64_args_obj);
+
+	json_object *len_obj;
+	json_object_object_get_ex(mmap64_args_obj, "len", &len_obj);
+	size_t len = (size_t) json_object_get_int(len_obj);
+
+	json_object *prot_obj;
+	json_object_object_get_ex(mmap64_args_obj, "prot", &prot_obj);
+	int prot = json_object_get_int(prot_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(mmap64_args_obj, "flags", &flags_obj);
+	int flags = json_object_get_int(flags_obj);
+
+	json_object *fildes_obj;
+	json_object_object_get_ex(mmap64_args_obj, "fildes", &fildes_obj);
+	int buf_fd_trace = json_object_get_int(fildes_obj);
+
+	json_object *off_obj;
+	json_object_object_get_ex(mmap64_args_obj, "off", &off_obj);
+	off_t off = (off_t) json_object_get_int(off_obj);
+
+	/* Only retrace mmap64 calls that map a buffer. */
+	int buf_fd_retrace = get_fd(buf_fd_trace);
+	if (buf_fd_retrace < 0)
+		return;
+
+	void *buf_address_retrace_pointer = mmap64(0, len, prot, flags, buf_fd_retrace, off);
+	long int buf_address_retrace = (long int) buf_address_retrace_pointer;
+
+	if (buf_address_retrace_pointer == MAP_FAILED) {
+		perror("mmap64");
+		print_context();
+		exit(EXIT_FAILURE);
+	}
+
+	/* Store the original trace address so that it can be matched with the munmap address later. */
+	json_object *buffer_address_obj;
+	json_object_object_get_ex(mmap_obj, "buffer_address", &buffer_address_obj);
+	long int buf_address_trace = json_object_get_int64(buffer_address_obj);
+	set_buffer_address_retrace(buf_fd_retrace, buf_address_trace, buf_address_retrace);
+
+	if (debug || (errno != 0)) {
+		perror("mmap64 ");
+		fprintf(stderr, "fd: %d\n", buf_fd_retrace);
+		print_context();
+	}
+}
+
+void retrace_munmap(json_object *syscall_obj)
+{
+	json_object *munmap_args_obj;
+	json_object_object_get_ex(syscall_obj, "munmap_args", &munmap_args_obj);
+
+	json_object *start_obj;
+	json_object_object_get_ex(munmap_args_obj, "start", &start_obj);
+	long int start = json_object_get_int64(start_obj);
+
+	json_object *length_obj;
+	json_object_object_get_ex(munmap_args_obj, "length", &length_obj);
+	size_t length = (size_t) json_object_get_int(length_obj);
+
+	long int buffer_address_retrace = get_buffer_address_retrace(start);
+
+	if (buffer_address_retrace < 0)
+		return;
+
+	munmap((void *)buffer_address_retrace, length);
+
+	if (debug || (errno != 0)) {
+		perror("munmap");
+		fprintf(stderr, "unmapped: %ld\n", buffer_address_retrace);
+		fprintf(stderr, "\n");
+	}
+}
+
+void retrace_open64(json_object *jobj)
+{
+	json_object *fd_trace_obj;
+	json_object_object_get_ex(jobj, "fd", &fd_trace_obj);
+	int fd_trace = json_object_get_int(fd_trace_obj);
+
+	json_object *open_args_obj;
+	json_object_object_get_ex(jobj, "open_args", &open_args_obj);
+
+	json_object *path_obj;
+	json_object_object_get_ex(open_args_obj, "path", &path_obj);
+	std::string path = json_object_get_string(path_obj);
+
+	json_object *oflag_obj;
+	json_object_object_get_ex(open_args_obj, "oflag", &oflag_obj);
+	int oflag = json_object_get_int(oflag_obj);
+
+	json_object *mode_obj;
+	json_object_object_get_ex(open_args_obj, "mode", &mode_obj);
+	int mode = json_object_get_int(mode_obj);
+
+	/* If a device is provided on the command line, use it instead of the device from the trace file. */
+	if ((path.find("video") != path.npos) && !dev_path_video.empty())
+		path = dev_path_video;
+
+	if ((path.find("media") != path.npos) && !dev_path_media.empty())
+		path = dev_path_media;
+
+	int fd_retrace = open64(path.c_str(), oflag, mode);
+
+	if (fd_retrace < 0) {
+		fprintf(stderr, "Cannot open: %s\n", path.c_str());
+		exit(fd_retrace);
+	}
+
+	add_fd(fd_trace, fd_retrace);
+
+	if (debug || (errno != 0)) {
+		perror("open64");
+		fprintf(stderr, "opened: %s \n", path.c_str());
+		print_context();
+	}
+}
+
+void retrace_close(json_object *jobj)
+{
+	json_object *fd_trace_obj;
+	json_object_object_get_ex(jobj, "fd", &fd_trace_obj);
+	int fd_retrace = get_fd(json_object_get_int(fd_trace_obj));
+
+	/* Only close devices that were opened in the retrace context. */
+	if (fd_retrace) {
+		close(fd_retrace);
+		remove_fd(json_object_get_int(fd_trace_obj));
+
+		if (debug || (errno != 0)) {
+			perror("close");
+			fprintf(stderr, "fd: %d\n\n", fd_retrace);
+			print_context();
+		}
+	}
+}
+
+struct v4l2_requestbuffers retrace_v4l2_requestbuffers(json_object *ioctl_args)
+{
+	struct v4l2_requestbuffers request_buffers;
+	memset(&request_buffers, 0, sizeof(v4l2_requestbuffers));
+
+	json_object *requestbuffers_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_requestbuffers", &requestbuffers_obj);
+
+	json_object *count_obj;
+	json_object_object_get_ex(requestbuffers_obj, "count", &count_obj);
+	request_buffers.count = json_object_get_int(count_obj);
+
+	json_object *type_obj;
+	json_object_object_get_ex(requestbuffers_obj, "type", &type_obj);
+	request_buffers.type = json_object_get_int(type_obj);
+
+	json_object *memory_obj;
+	json_object_object_get_ex(requestbuffers_obj, "memory", &memory_obj);
+	request_buffers.memory = json_object_get_int(memory_obj);
+
+	json_object *capabilities_obj;
+	json_object_object_get_ex(requestbuffers_obj, "capabilities", &capabilities_obj);
+	request_buffers.capabilities = json_object_get_int(capabilities_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(requestbuffers_obj, "flags", &flags_obj);
+	request_buffers.flags = json_object_get_int(flags_obj);
+
+	return request_buffers;
+}
+
+void retrace_vidioc_reqbufs(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_requestbuffers request_buffers = retrace_v4l2_requestbuffers(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_REQBUFS, &request_buffers);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_REQBUFS");
+		fprintf(stderr, "type: %s, request_buffers.count: %d\n",
+		        buftype2s(request_buffers.type).c_str(), request_buffers.count);
+		print_context();
+	}
+}
+
+struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memory)
+{
+	struct v4l2_plane *pl = (struct v4l2_plane *) malloc(sizeof(v4l2_plane));
+
+	json_object *bytesused_obj;
+	json_object_object_get_ex(plane_obj, "bytesused", &bytesused_obj);
+	pl->bytesused = (__u32) json_object_get_int(bytesused_obj);
+
+	json_object *length_obj;
+	json_object_object_get_ex(plane_obj, "length", &length_obj);
+	pl->length = (__u32) json_object_get_int(length_obj);
+
+	json_object *m_obj;
+	json_object_object_get_ex(plane_obj, "m", &m_obj);
+	/* https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#c.V4L.v4l2_plane */
+	if (memory == V4L2_MEMORY_MMAP) {
+		json_object *mem_offset_obj;
+		json_object_object_get_ex(m_obj, "mem_offset", &mem_offset_obj);
+		pl->m.mem_offset = (__u32) json_object_get_int(mem_offset_obj);
+	}
+
+	json_object *data_offset_obj;
+	json_object_object_get_ex(plane_obj, "data_offset", &data_offset_obj);
+	pl->data_offset = (__u32) json_object_get_int(data_offset_obj);
+
+	return pl;
+}
+
+struct v4l2_buffer retrace_v4l2_buffer(json_object *ioctl_args)
+{
+	struct v4l2_buffer buf;
+	memset(&buf, 0, sizeof(v4l2_buffer));
+
+	json_object *buf_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_buffer", &buf_obj);
+
+	/* Index of the buffer. */
+	json_object *index_obj;
+	json_object_object_get_ex(buf_obj, "index", &index_obj);
+	buf.index = (__u32) json_object_get_int(index_obj);
+
+	/* Type of the buffer. */
+	json_object *type_obj;
+	json_object_object_get_ex(buf_obj, "type", &type_obj);
+	buf.type = (__u32) json_object_get_int(type_obj);
+
+	/* For multiplanar formats this bytesused field is ignored and the planes pointer is used instead. */
+	json_object *bytesused_obj;
+	json_object_object_get_ex(buf_obj, "bytesused", &bytesused_obj);
+	buf.bytesused = (__u32) json_object_get_int(bytesused_obj);
+
+	/* Flags set by application and modified by driver. */
+	json_object *flags_obj;
+	json_object_object_get_ex(buf_obj, "flags", &flags_obj);
+	buf.flags = (__u32) json_object_get_int(flags_obj);
+
+	/* Applications set the field for output, drivers set the field for capture. */
+	json_object *field_obj;
+	json_object_object_get_ex(buf_obj, "field", &field_obj);
+	buf.field = (__u32) json_object_get_int(field_obj);
+
+	json_object *timestamp_obj;
+	json_object_object_get_ex(buf_obj, "timestamp", &timestamp_obj);
+
+	struct timeval tv;
+	memset(&tv, 0, sizeof(timeval));
+	json_object *tv_sec_obj;
+	json_object_object_get_ex(timestamp_obj, "tv_sec", &tv_sec_obj);
+	tv.tv_sec = json_object_get_int(tv_sec_obj);
+	json_object *tv_usec_obj;
+	json_object_object_get_ex(timestamp_obj, "tv_usec", &tv_usec_obj);
+	tv.tv_usec = json_object_get_int(tv_usec_obj);
+	buf.timestamp = tv;
+
+	/* Sequence set by the driver. */
+	json_object *sequence_obj;
+	json_object_object_get_ex(buf_obj, "sequence", &sequence_obj);
+	buf.sequence = (__u32) json_object_get_int(sequence_obj);
+
+	json_object *memory_obj;
+	json_object_object_get_ex(buf_obj, "memory", &memory_obj);
+	buf.memory = (__u32) json_object_get_int(memory_obj);
+
+	/* Get the length before the m union, since the length holds the number of planes. */
+	json_object *length_obj;
+	json_object_object_get_ex(buf_obj, "length", &length_obj);
+	buf.length = (__u32) json_object_get_int(length_obj);
+
+	json_object *m_obj;
+	json_object_object_get_ex(buf_obj, "m", &m_obj);
+	if (buf.type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+		buf.type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		json_object *planes_obj;
+		json_object_object_get_ex(m_obj, "planes", &planes_obj);
+		json_object *plane_obj = json_object_array_get_idx(planes_obj, 0); /* TODO add planes > 0 */
+		buf.m.planes = retrace_v4l2_plane(plane_obj, buf.memory);
+	}
+
+	/* For memory-to-memory devices, applications use requests only for output buffers. */
+	if (buf.type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		json_object *request_fd_obj;
+		json_object_object_get_ex(buf_obj, "request_fd", &request_fd_obj);
+		buf.request_fd = (__s32) get_fd(json_object_get_int(request_fd_obj));
+	}
+
+	return buf;
+}
+
+void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_QUERYBUF, &buf);
+
+	if (buf.m.planes != nullptr)
+		free(buf.m.planes);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_QUERYBUF");
+		fprintf(stderr, "buf.type: %s, buf.index: %d, fd_retrace: %d, \n",
+		        buftype2s(buf.type).c_str(), buf.index, fd_retrace);
+		print_context();
+	}
+}
+
+
+void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_QBUF, &buf);
+
+	if (buf.m.planes != nullptr)
+		free(buf.m.planes);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_QBUF");
+		fprintf(stderr, "buf.type: %s, buf.index: %d, fd_retrace: %d, \n",
+		        buftype2s(buf.type).c_str(), buf.index, fd_retrace);
+		print_context();
+	}
+}
+
+struct v4l2_exportbuffer retrace_v4l2_exportbuffer(json_object *ioctl_args)
+{
+	struct v4l2_exportbuffer export_buffer;
+	memset(&export_buffer, 0, sizeof(v4l2_exportbuffer));
+
+	json_object *exportbuffer_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_exportbuffer", &exportbuffer_obj);
+
+	json_object *type_obj;
+	json_object_object_get_ex(exportbuffer_obj, "type", &type_obj);
+	export_buffer.type = json_object_get_int(type_obj);
+
+	json_object *index_obj;
+	json_object_object_get_ex(exportbuffer_obj, "index", &index_obj);
+	export_buffer.index = json_object_get_int(index_obj);
+
+	json_object *plane_obj;
+	json_object_object_get_ex(exportbuffer_obj, "plane", &plane_obj);
+	export_buffer.plane = json_object_get_int(plane_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(exportbuffer_obj, "flags", &flags_obj);
+	export_buffer.flags = json_object_get_int(flags_obj);
+
+	json_object *fd_obj;
+	json_object_object_get_ex(exportbuffer_obj, "fd", &fd_obj);
+	export_buffer.fd = json_object_get_int(fd_obj);
+
+	return export_buffer;
+}
+
+void retrace_vidioc_expbuf(int fd_retrace, json_object *ioctl_args_user, json_object *ioctl_args_driver)
+{
+	struct v4l2_exportbuffer export_buffer;
+	memset(&export_buffer, 0, sizeof(v4l2_exportbuffer));
+
+	export_buffer = retrace_v4l2_exportbuffer(ioctl_args_user);
+	ioctl(fd_retrace, VIDIOC_EXPBUF, &export_buffer);
+	int buf_fd_retrace = export_buffer.fd;
+	add_buffer_retrace(buf_fd_retrace);
+
+	/*
+	 * Get the export buffer file descriptor as provided by the driver in the original trace context.
+	 * Then associate this original file descriptor with the current file descriptor in the retrace context.
+	 */
+	memset(&export_buffer, 0, sizeof(v4l2_exportbuffer));
+	export_buffer = retrace_v4l2_exportbuffer(ioctl_args_driver);
+	int buf_fd_trace = export_buffer.fd;
+	add_fd(buf_fd_trace, buf_fd_retrace);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_EXPBUF");
+		fprintf(stderr, "type: %s \n", buftype2s(export_buffer.type).c_str());
+		fprintf(stderr, "index: %d, fd: %d\n", export_buffer.index, buf_fd_retrace);
+		print_context();
+	}
+}
+
+void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	struct pollfd *pfds = (struct pollfd *) calloc(1, sizeof(struct pollfd));
+	if (pfds == NULL)
+		exit(EXIT_FAILURE);
+	pfds[0].fd = fd_retrace;
+	pfds[0].events = POLLIN;
+	poll(pfds, 1, 5000);
+	free(pfds);
+
+	ioctl(fd_retrace, VIDIOC_DQBUF, &buf);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_DQBUF");
+		fprintf(stderr, "fd_retrace: %d\n", fd_retrace);
+		fprintf(stderr, "buf.index: %d\n", buf.index);
+		fprintf(stderr, "buf.type: %s,\n", buftype2s(buf.type).c_str());
+		fprintf(stderr, "buf.bytesused: %u, \n", buf.bytesused);
+		fprintf(stderr, "buf.flags: %u\n", buf.flags);
+		fprintf(stderr, "buf.field: %u, buf.request_fd: %d\n", buf.field, buf.request_fd);
+		fprintf(stderr, "buf.request_fd: %d\n", buf.request_fd);
+		print_context();
+	}
+
+	if (buf.m.planes != nullptr)
+		free(buf.m.planes);
+}
+
+void retrace_vidioc_streamon(int fd_retrace, json_object *ioctl_args)
+{
+	json_object *buf_type_obj;
+	json_object_object_get_ex(ioctl_args, "buf_type", &buf_type_obj);
+	v4l2_buf_type buf_type = (v4l2_buf_type) json_object_get_int(buf_type_obj);
+
+	ioctl(fd_retrace, VIDIOC_STREAMON, &buf_type);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_STREAMON");
+		fprintf(stderr, "buftype: %s\n\n", buftype2s(buf_type).c_str());
+	}
+}
+
+void retrace_vidioc_streamoff(int fd_retrace, json_object *ioctl_args)
+{
+	json_object *buf_type_obj;
+	json_object_object_get_ex(ioctl_args, "buf_type", &buf_type_obj);
+	v4l2_buf_type buf_type = (v4l2_buf_type) json_object_get_int(buf_type_obj);
+
+	ioctl(fd_retrace, VIDIOC_STREAMOFF, &buf_type);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_STREAMOFF");
+		fprintf(stderr, "buftype: %s\n", buftype2s(buf_type).c_str());
+		fprintf(stderr, "\n");
+	}
+}
+
+struct v4l2_plane_pix_format get_v4l2_plane_pix_format(json_object *pix_mp_obj, int plane)
+{
+	std::string key;
+	struct v4l2_plane_pix_format plane_fmt;
+	memset(&plane_fmt, 0, sizeof(v4l2_plane_pix_format));
+
+	json_object *plane_fmt_obj, *sizeimage_obj, *bytesperline_obj;
+
+	key = "v4l2_plane_pix_format_";
+	key += std::to_string(plane);
+	json_object_object_get_ex(pix_mp_obj, key.c_str(), &plane_fmt_obj);
+
+	json_object_object_get_ex(plane_fmt_obj, "sizeimage", &sizeimage_obj);
+	plane_fmt.sizeimage = json_object_get_int(sizeimage_obj);
+
+	json_object_object_get_ex(plane_fmt_obj, "bytesperline", &bytesperline_obj);
+	plane_fmt.bytesperline = json_object_get_int(bytesperline_obj);
+
+	return plane_fmt;
+}
+
+struct v4l2_pix_format_mplane retrace_v4l2_pix_format_mplane(json_object *v4l2_format_obj)
+{
+	struct v4l2_pix_format_mplane pix_mp;
+	memset(&pix_mp, 0, sizeof(v4l2_pix_format_mplane));
+
+	json_object *pix_mp_obj;
+	json_object_object_get_ex(v4l2_format_obj, "v4l2_pix_format_mplane", &pix_mp_obj);
+
+	json_object *width_obj;
+	json_object_object_get_ex(pix_mp_obj, "width", &width_obj);
+	pix_mp.width = json_object_get_int(width_obj);
+
+	json_object *height_obj;
+	json_object_object_get_ex(pix_mp_obj, "height", &height_obj);
+	pix_mp.height = json_object_get_int(height_obj);
+
+	json_object *pixelformat_obj;
+	json_object_object_get_ex(pix_mp_obj, "pixelformat", &pixelformat_obj);
+	pix_mp.pixelformat = json_object_get_int(pixelformat_obj);
+
+	json_object *field_obj;
+	json_object_object_get_ex(pix_mp_obj, "field", &field_obj);
+	pix_mp.field = json_object_get_int(field_obj);
+
+	json_object *colorspace_obj;
+	json_object_object_get_ex(pix_mp_obj, "colorspace", &colorspace_obj);
+	pix_mp.colorspace = json_object_get_int(colorspace_obj);
+
+	json_object *num_planes_obj;
+	json_object_object_get_ex(pix_mp_obj, "num_planes", &num_planes_obj);
+	pix_mp.num_planes = json_object_get_int(num_planes_obj);
+
+	for (int i = 0; i < pix_mp.num_planes; i++)
+		pix_mp.plane_fmt[i] = get_v4l2_plane_pix_format(pix_mp_obj, i);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(pix_mp_obj, "flags", &flags_obj);
+	pix_mp.flags = json_object_get_int(flags_obj);
+
+	json_object *ycbcr_enc_obj;
+	json_object_object_get_ex(pix_mp_obj, "ycbcr_enc", &ycbcr_enc_obj);
+	pix_mp.ycbcr_enc = json_object_get_int(ycbcr_enc_obj);
+
+	json_object *quantization_obj;
+	json_object_object_get_ex(pix_mp_obj, "quantization", &quantization_obj);
+	pix_mp.quantization = json_object_get_int(quantization_obj);
+
+	json_object *xfer_func_obj;
+	json_object_object_get_ex(pix_mp_obj, "xfer_func", &xfer_func_obj);
+	pix_mp.xfer_func = json_object_get_int(xfer_func_obj);
+
+	return pix_mp;
+}
+
+struct v4l2_format retrace_v4l2_format(json_object *ioctl_args)
+{
+	struct v4l2_format format;
+	memset(&format, 0, sizeof(format));
+
+	json_object *v4l2_format_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_format", &v4l2_format_obj);
+
+	json_object *type_obj;
+	json_object_object_get_ex(v4l2_format_obj, "type", &type_obj);
+	format.type = json_object_get_int(type_obj);
+
+	switch (format.type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
+	case V4L2_BUF_TYPE_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_VBI_OUTPUT:
+	case V4L2_BUF_TYPE_SLICED_VBI_CAPTURE:
+	case V4L2_BUF_TYPE_SLICED_VBI_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY:
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		format.fmt.pix_mp = retrace_v4l2_pix_format_mplane(v4l2_format_obj);
+		break;
+	case V4L2_BUF_TYPE_SDR_CAPTURE:
+	case V4L2_BUF_TYPE_SDR_OUTPUT:
+	case V4L2_BUF_TYPE_META_CAPTURE:
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		break;
+	}
+
+	return format;
+}
+
+void retrace_vidioc_g_fmt(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_format format;
+	memset(&format, 0, sizeof(format));
+
+	format = retrace_v4l2_format(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_G_FMT, &format);
+
+	if (debug || (errno != 0))
+		perror("VIDIOC_G_FMT");
+}
+
+void retrace_vidioc_s_fmt(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_format format;
+	memset(&format, 0, sizeof(format));
+
+	format = retrace_v4l2_format(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_S_FMT, &format);
+
+	if (debug || (errno != 0)) {
+		perror("VIDIOC_S_FMT");
+		fprintf(stderr, "%s\n", buftype2s(format.type).c_str());
+		fprintf(stderr, "format.fmt.pix_mp.pixelformat: %s\n\n",
+		        fcc2s(format.fmt.pix_mp.pixelformat).c_str());
+	}
+}
+
+struct v4l2_ext_control retrace_v4l2_ext_control(json_object *ext_controls_obj, int ctrl_idx)
+{
+	struct v4l2_ext_control ctrl;
+	memset(&ctrl, 0, sizeof(v4l2_ext_control));
+
+	std::string unique_key_for_control = "v4l2_ext_control_";
+	unique_key_for_control += std::to_string(ctrl_idx);
+
+	json_object *ctrl_obj;
+	json_object_object_get_ex(ext_controls_obj, unique_key_for_control.c_str(), &ctrl_obj);
+
+	json_object *id_obj;
+	json_object_object_get_ex(ctrl_obj, "id", &id_obj);
+	ctrl.id = json_object_get_int(id_obj);
+
+	json_object *size_obj;
+	json_object_object_get_ex(ctrl_obj, "size", &size_obj);
+	ctrl.size = json_object_get_int(size_obj);
+
+	if ((ctrl.id & V4L2_CID_CODEC_STATELESS_BASE) == V4L2_CID_CODEC_STATELESS_BASE) {
+		switch (ctrl.id) {
+		case V4L2_CID_STATELESS_VP8_FRAME:
+			ctrl.ptr = retrace_v4l2_ctrl_vp8_frame_pointer(ctrl_obj);
+			break;
+		}
+	}
+	return ctrl;
+}
+
+struct v4l2_ext_control *retrace_v4l2_ext_control_array_pointer(json_object *ext_controls_obj, int count)
+{
+	struct v4l2_ext_control *ctrl_array_pointer = (struct v4l2_ext_control *) calloc(count, sizeof(v4l2_ext_control));
+
+	for (int i = 0; i < count; i++)
+		ctrl_array_pointer[i] = retrace_v4l2_ext_control(ext_controls_obj, i);
+
+	return ctrl_array_pointer;
+}
+
+void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_ext_controls ext_controls;
+	memset(&ext_controls, 0, sizeof(ext_controls));
+
+	json_object *ext_controls_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_ext_controls", &ext_controls_obj);
+
+	json_object *which_obj;
+	json_object_object_get_ex(ext_controls_obj, "which", &which_obj);
+	ext_controls.which = json_object_get_int(which_obj);
+
+	json_object *count_obj;
+	json_object_object_get_ex(ext_controls_obj, "count", &count_obj);
+	ext_controls.count = json_object_get_int(count_obj);
+
+	/* request_fd is only valid for V4L2_CTRL_WHICH_REQUEST_VAL */
+	if (ext_controls.which == V4L2_CTRL_WHICH_REQUEST_VAL) {
+		json_object *request_fd_obj;
+		json_object_object_get_ex(ext_controls_obj, "request_fd", &request_fd_obj);
+		int request_fd_trace = json_object_get_int(request_fd_obj);
+		ext_controls.request_fd = get_fd(request_fd_trace);
+	}
+
+	ext_controls.controls = retrace_v4l2_ext_control_array_pointer(ext_controls_obj, ext_controls.count);
+
+	ioctl(fd_retrace, VIDIOC_S_EXT_CTRLS, &ext_controls);
+
+	if (debug || (errno != 0))
+		perror("VIDIOC_S_EXT_CTRLS");
+
+	/* Free controls working backwards from the end of the controls array. */
+	for (int i = (ext_controls.count - 1); i >= 0 ; i--) {
+		if (ext_controls.controls[i].ptr != nullptr)
+			free(ext_controls.controls[i].ptr);
+	}
+
+	if (ext_controls.controls != nullptr)
+		free(ext_controls.controls);
+}
+
+void retrace_query_ext_ctrl(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_query_ext_ctrl query_ext_ctrl;
+	memset(&query_ext_ctrl, 0, sizeof(v4l2_query_ext_ctrl));
+
+	json_object *query_ext_ctrl_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_query_ext_ctrl", &query_ext_ctrl_obj);
+
+	json_object *id_obj;
+	json_object_object_get_ex(query_ext_ctrl_obj, "id", &id_obj);
+	query_ext_ctrl.id = json_object_get_int(id_obj);
+
+	ioctl(fd_retrace, VIDIOC_QUERY_EXT_CTRL, &query_ext_ctrl);
+
+	if (debug) {
+		perror("VIDIOC_QUERY_EXT_CTRL");
+		fprintf(stderr, "id: %u\n\n", query_ext_ctrl.id);
+	}
+}
+
+void retrace_vidioc_enum_fmt(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_fmtdesc fmtdesc;
+	memset(&fmtdesc, 0, sizeof(v4l2_fmtdesc));
+
+	json_object *v4l2_fmtdesc_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_fmtdesc", &v4l2_fmtdesc_obj);
+
+	json_object *index_obj;
+	json_object_object_get_ex(v4l2_fmtdesc_obj, "index", &index_obj);
+	fmtdesc.index = json_object_get_int(index_obj);
+
+	json_object *type_obj;
+	json_object_object_get_ex(v4l2_fmtdesc_obj, "type", &type_obj);
+	fmtdesc.type = json_object_get_int(type_obj);
+
+	json_object *mbus_code_obj;
+	json_object_object_get_ex(v4l2_fmtdesc_obj, "mbus_code", &mbus_code_obj);
+	fmtdesc.mbus_code = json_object_get_int(mbus_code_obj);
+
+	ioctl(fd_retrace, VIDIOC_ENUM_FMT, &fmtdesc);
+
+	if (debug) {
+		perror("VIDIOC_ENUM_FMT");
+		fprintf(stderr, "index: %u\n", fmtdesc.index);
+		fprintf(stderr, "type: %u\n", fmtdesc.type);
+		fprintf(stderr, "flags: %u\n", fmtdesc.flags);
+		fprintf(stderr, "description: %s\n", fmtdesc.description);
+		fprintf(stderr, "pixelformat: %u\n", fmtdesc.pixelformat);
+		fprintf(stderr, "mbus_code: %u\n\n", fmtdesc.mbus_code);
+	}
+}
+
+void retrace_vidioc_querycap(int fd_retrace)
+{
+	struct v4l2_capability argp;
+	memset(&argp, 0, sizeof(v4l2_capability));
+
+	ioctl(fd_retrace, VIDIOC_QUERYCAP, &argp);
+
+	if (debug || (errno != 0))
+		perror("VIDIOC_QUERYCAP");
+}
+
+void retrace_media_ioc_request_alloc(int fd_retrace, json_object *ioctl_args)
+{
+	/* Get the original request file descriptor from the original trace file. */
+	json_object *request_fd_trace_obj;
+	json_object_object_get_ex(ioctl_args, "request_fd", &request_fd_trace_obj);
+	int request_fd_trace = json_object_get_int(request_fd_trace_obj);
+
+	/* Allocate a request in the retrace context. */
+	__s32 request_fd_retrace = 0;
+	ioctl(fd_retrace, MEDIA_IOC_REQUEST_ALLOC, &request_fd_retrace);
+
+	/* Associate the original request file descriptor with the current request file descriptor. */
+	add_fd(request_fd_trace, request_fd_retrace);
+
+	if (debug || (errno != 0))
+		perror("MEDIA_IOC_REQUEST_ALLOC");
+}
+
+void retrace_dma_buf_ioctl_sync(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct dma_buf_sync sync;
+	memset(&sync, 0, sizeof(dma_buf_sync));
+
+	json_object *sync_obj;
+	json_object_object_get_ex(ioctl_args_user, "dma_buf_sync",&sync_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(sync_obj, "flags",&flags_obj);
+	sync.flags = json_object_get_int(flags_obj);
+
+	ioctl(fd_retrace, DMA_BUF_IOCTL_SYNC, &sync);
+
+	if (debug || (errno != 0))
+		perror("DMA_BUF_IOCTL_SYNC");
+}
+
+void retrace_ioctl_media(int fd_retrace, long int request, json_object *ioctl_args_driver)
+{
+	switch (request){
+	case MEDIA_IOC_DEVICE_INFO:
+	case MEDIA_IOC_ENUM_ENTITIES:
+	case MEDIA_IOC_ENUM_LINKS:
+	case MEDIA_IOC_SETUP_LINK:
+	case MEDIA_IOC_G_TOPOLOGY: {
+		struct media_v2_topology top;
+		memset(&top, 0, sizeof(media_v2_topology));
+		ioctl(fd_retrace, MEDIA_IOC_G_TOPOLOGY, &top);
+		if (debug || (errno != 0))
+			perror("MEDIA_IOC_G_TOPOLOGY");
+		break;
+	}
+	case MEDIA_IOC_REQUEST_ALLOC:
+		retrace_media_ioc_request_alloc(fd_retrace, ioctl_args_driver);
+		break;
+	case MEDIA_REQUEST_IOC_QUEUE: {
+		ioctl(fd_retrace, MEDIA_REQUEST_IOC_QUEUE);
+		if (debug || (errno != 0))
+			perror("MEDIA_REQUEST_IOC_QUEUE");
+		break;
+	}
+	case MEDIA_REQUEST_IOC_REINIT: {
+		ioctl(fd_retrace, MEDIA_REQUEST_IOC_REINIT);
+		if (debug || (errno != 0))
+			perror("MEDIA_REQUEST_IOC_REINIT");
+		break;
+	}
+	default:
+		break;
+	}
+}
+
+void retrace_ioctl_video(int fd_retrace, long int request, json_object *ioctl_args_user, json_object *ioctl_args_driver)
+{
+	switch (request) {
+	//TODO ADD QUERYBUF
+	case VIDIOC_QUERYCAP:
+		retrace_vidioc_querycap(fd_retrace);
+		break;
+	case VIDIOC_ENUM_FMT:
+		retrace_vidioc_enum_fmt(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_G_FMT:
+		retrace_vidioc_g_fmt(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_FMT:
+		retrace_vidioc_s_fmt(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_REQBUFS:
+		retrace_vidioc_reqbufs(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_QUERYBUF:
+		retrace_vidioc_querybuf(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_QBUF:
+		retrace_vidioc_qbuf(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_EXPBUF:
+		retrace_vidioc_expbuf(fd_retrace, ioctl_args_user, ioctl_args_driver);
+		break;
+	case VIDIOC_DQBUF:
+		retrace_vidioc_dqbuf(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_STREAMON:
+		retrace_vidioc_streamon(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_STREAMOFF:
+		retrace_vidioc_streamoff(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_EXT_CTRLS:
+		retrace_vidioc_s_ext_ctrls(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_QUERY_EXT_CTRL:
+		retrace_query_ext_ctrl(fd_retrace, ioctl_args_user);
+		break;
+	default:
+		break;
+	}
+}
+
+void retrace_ioctl(json_object *syscall_obj)
+{
+	int fd_retrace = 0;
+	__u8 ioctl_type = 0;
+	long int request = 0;
+
+	json_object *fd_trace_obj;
+	json_object_object_get_ex(syscall_obj, "fd", &fd_trace_obj);
+	fd_retrace = get_fd(json_object_get_int(fd_trace_obj));
+
+	json_object *request_obj;
+	json_object_object_get_ex(syscall_obj, "request", &request_obj);
+	request = json_object_get_int64(request_obj);
+
+	json_object *ioctl_args_user;
+	json_object_object_get_ex(syscall_obj, "ioctl_args_from_userspace", &ioctl_args_user);
+
+	json_object *ioctl_args_driver;
+	json_object_object_get_ex(syscall_obj, "ioctl_args_from_driver", &ioctl_args_driver);
+
+	ioctl_type = _IOC_TYPE(request);
+	switch (ioctl_type) {
+	case 'V':
+		retrace_ioctl_video(fd_retrace, request, ioctl_args_user, ioctl_args_driver);
+		break;
+	case '|':
+		retrace_ioctl_media(fd_retrace, request, ioctl_args_driver);
+		break;
+	case 'b':
+		if (request == DMA_BUF_IOCTL_SYNC)
+			retrace_dma_buf_ioctl_sync(fd_retrace, ioctl_args_user);
+		break;
+	default:
+		break;
+	}
+}
+
+void write_to_output_buffer(unsigned char *buffer_pointer, int bytesused, json_object *mem_obj)
+{
+	std::string data;
+	int byteswritten = 0;
+	json_object *line_obj;
+	size_t number_of_lines;
+
+	json_object *mem_array_obj;
+	json_object_object_get_ex(mem_obj, "mem_array", &mem_array_obj);
+	number_of_lines = json_object_array_length(mem_array_obj);
+
+	for (long unsigned int i = 0; i < number_of_lines; i++) {
+		line_obj = json_object_array_get_idx(mem_array_obj, i);
+		data = json_object_get_string(line_obj);
+
+		for (long unsigned i = 0; i < data.length(); i++) {
+			if (std::isspace(data[i]))
+				continue;
+			try {
+				/* Two values from the string e.g. "D9" are needed to write one byte. */
+				*buffer_pointer = (char) std::stoi(data.substr(i,2), nullptr, 16);
+				buffer_pointer++;
+				i++;
+				byteswritten++;
+			} catch (std::invalid_argument& ia) {
+				fprintf(stderr, "Warning: \'%s\' is an invalid argument; %s line: %d.\n",
+				        data.substr(i,2).c_str(), __func__, __LINE__);
+			} catch (std::out_of_range& oor) {
+				fprintf(stderr, "Warning: \'%s\' is out of range; %s line: %d.\n",
+				        data.substr(i,2).c_str(), __func__, __LINE__);
+			}
+		}
+	}
+
+	if (debug) {
+		fprintf(stderr, "\nWrite to Output Buffer\n");
+		fprintf(stderr, "bytesused: %d, byteswritten: %d\n", bytesused, byteswritten);
+		fprintf(stderr, "\n");
+	}
+}
+
+void write_decoded_frames_to_yuv_file_retrace(unsigned char *buffer_pointer, int bytesused)
+{
+	int byteswritten = 0;
+
+	FILE *fp = fopen(retrace_filename.c_str(), "a");
+	for (int i = 0; i < bytesused; i++) {
+		fwrite(&buffer_pointer[i], sizeof(unsigned char), 1, fp);
+		byteswritten++;
+	}
+	fclose(fp);
+
+	if (debug){
+		fprintf(stderr, "\nWrite to File\n");
+		fprintf(stderr, "%s\n", retrace_filename.c_str());
+		fprintf(stderr, "bytesused: %d, byteswritten: %d\n", bytesused, byteswritten);
+		fprintf(stderr, "\n");
+	}
+}
+
+void retrace_mem(json_object *mem_obj)
+{
+	json_object *type_obj;
+	json_object_object_get_ex(mem_obj, "type", &type_obj);
+	v4l2_buf_type type = (v4l2_buf_type) json_object_get_int(type_obj);
+
+	json_object *bytesused_obj;
+	json_object_object_get_ex(mem_obj, "bytesused", &bytesused_obj);
+	int bytesused = json_object_get_int(bytesused_obj);
+
+	json_object *address_obj;
+	json_object_object_get_ex(mem_obj, "address", &address_obj);
+	long int buffer_address_trace = json_object_get_int64(address_obj);
+
+	/* Convert the trace address to the corresponding retrace address. */
+	long int buffer_address_retrace = get_buffer_address_retrace(buffer_address_trace);
+
+	unsigned char *buffer_pointer = (unsigned char *) buffer_address_retrace;
+
+	/* Get the encoded data from the json file and write it to output buffer memory. */
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		write_to_output_buffer(buffer_pointer, bytesused, mem_obj);
+
+	/* Get the decoded capture buffer from memory and write it to a binary yuv file. */
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		write_decoded_frames_to_yuv_file_retrace(buffer_pointer, bytesused);
+}
+
+void retrace_object(json_object *jobj)
+{
+	json_object *syscall_obj;
+	int ret = json_object_object_get_ex(jobj, "syscall", &syscall_obj);
+	int syscall = json_object_get_int(syscall_obj);
+
+	/* If the json object doesn't hold a syscall, check if it holds a memory dump. */
+	if (ret == 0) {
+		json_object *temp_obj;
+		if (json_object_object_get_ex(jobj, "mem_dump", &temp_obj)) {
+			retrace_mem(jobj);
+		}
+		return;
+	}
+
+	errno = 0;
+
+	switch (syscall) {
+	case LIBTRACER_SYSCALL_IOCTL:
+		retrace_ioctl(jobj);
+		break;
+	case LIBTRACER_SYSCALL_OPEN:
+	case LIBTRACER_SYSCALL_OPEN64:
+		retrace_open64(jobj);
+		break;
+	case LIBTRACER_SYSCALL_CLOSE:
+		retrace_close(jobj);
+		break;
+	case LIBTRACER_SYSCALL_MMAP64:
+		retrace_mmap64(jobj);
+		break;
+	case LIBTRACER_SYSCALL_MUNMAP:
+		retrace_munmap(jobj);
+		break;
+	default:
+		break;
+	}
+}
+
+void retrace_array(json_object *root_array_obj)
+{
+	json_object *jobj;
+	struct array_list *al = json_object_get_array(root_array_obj);
+
+	for (size_t i = 0; i < array_list_length(al); i++) {
+		jobj = (json_object *) array_list_get_idx(al, i);
+		retrace_object(jobj);
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	int ch;
+	char short_options[] = {'d', 'm', ':', 'v', ':'};
+
+	do {
+		ch = getopt(argc, argv, short_options);
+		switch (ch){
+		case 'd':
+			debug = true;
+			break;
+		case 'm':
+			dev_path_media = *optarg;
+			dev_path_media = "/dev/media" + dev_path_media;
+			fprintf(stderr, "Using: %s\n", dev_path_media.c_str());
+			break;
+		case 'v':
+			dev_path_video = *optarg;
+			dev_path_video = "/dev/video" + dev_path_video;
+			fprintf(stderr, "Using: %s\n", dev_path_video.c_str());
+			break;
+		}
+	} while (ch != -1);
+
+
+	if (optind == argc) {
+		fprintf(stderr, "usage: retracer [-d] [-m <media device number>] [-v <video device number>] <some_trace_file>.json\n");
+		return -1;
+	}
+
+	std::string trace_filename = argv[optind];
+
+	FILE *trace_file = fopen(trace_filename.c_str(), "r");
+	if (trace_file == NULL) {
+		fprintf(stderr, "Trace file error: %s\n", trace_filename.c_str());
+		return -1;
+	}
+	fclose(trace_file);
+
+	fprintf(stderr, "Retracing: %s\n", trace_filename.c_str());
+
+	/* Create file to hold the decoded frames.  Discard previous retraced file if any. */
+	retrace_filename = trace_filename;
+	retrace_filename = retrace_filename.replace(5, retrace_filename.npos, "_retrace");
+	retrace_filename += ".yuv";
+
+	json_object *root_array_obj = json_object_from_file(trace_filename.c_str());
+	retrace_array(root_array_obj);
+	json_object_put(root_array_obj);
+
+	fprintf(stderr, "Retracing complete in %s\n", retrace_filename.c_str());
+}
diff --git a/utils/tracer/retracer.h b/utils/tracer/retracer.h
new file mode 100644
index 00000000..e575b4b5
--- /dev/null
+++ b/utils/tracer/retracer.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef RETRACER_H
+#define RETRACER_H
+
+#include <fcntl.h>
+#include <unistd.h>
+#include <pthread.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <poll.h>
+#include <unordered_map>
+#include <stdexcept>
+#include <list>
+#include <json.h>
+#include <v4l2-info.h>
+#include "trace-info.h"
+#include "retrace-vp8.h"
+#include "retrace-helper.h"
+
+#endif
-- 
2.37.1

