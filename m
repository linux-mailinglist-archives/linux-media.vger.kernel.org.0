Return-Path: <linux-media+bounces-296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1A97EA441
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DF45B20BFB
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467072420A;
	Mon, 13 Nov 2023 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D7erCRJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B623752
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:06:53 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75251D72
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:52 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7FBDA6602F3B;
	Mon, 13 Nov 2023 20:06:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906011;
	bh=t1xZWlhchKGP0n8QeyuIPCkTHwVlK1fn3Qg3rjrtKdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7erCRJQuvJcfxVQy7FXXji4cJ9Xmlm3DM3YIyLWsVaFk/5HsuEp898hxyylPyZEF
	 w0RlhJ4OFlhponoqodMsmWQ1UXKbjds22MG80aPe7IJaqhL+1jM4qEMhUQfuVJLjbY
	 53hOxfgoqFZkkQQAyB9HgW6IwkHcV7IUwlp8KCybcxb0CZZrulWwoAFjRwPvSPuX9G
	 1oIl3UpORlLhZnFQoYefiVCxQx3VcvR1SfR2PdgER5OaPrezVvDsDLqfS5n/B6nvUD
	 UOO/x9rnZtIdRaNjKmcZPn69yx71kc+Mae+8N7d4e4bPfoYTzqilGGVpyM0bFe9c7m
	 M0kNcIaKv+ipQ==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 4/8] v4l2-tracer: remove compress_frame_count
Date: Mon, 13 Nov 2023 12:06:15 -0800
Message-ID: <e109a57ebf659d0a0805322277ea0a3d1b1f9c89.1699904350.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699904350.git.deborah.brouwer@collabora.com>
References: <cover.1699904350.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trace context attempts to keep track of the number of compressed
frames received to avoid tracing the same decoded frame more than once.
However, this shared context only works if both the OUTPUT and CAPTURE
queues are run in the same process. If they are run in different
processes, then they will each have their own separate context and no
decoded frames will be traced.

Remove the compressed_frame_count since it is not functioning as expected.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/trace-helper.cpp | 23 ++++++++++-------------
 utils/v4l2-tracer/trace.cpp        |  1 -
 utils/v4l2-tracer/trace.h          |  1 -
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index b6336313..f58671df 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -288,10 +288,8 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 			 * received to avoid losing frames although this will still sometimes result
 			 * in frames out of order.
 			 */
-			if ((ctrl.p_h264_decode_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) != 0U) {
-				if (ctx_trace.compressed_frame_count != 0)
-					trace_mem_decoded();
-			}
+			if ((ctrl.p_h264_decode_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) != 0U)
+				trace_mem_decoded();
 
 			/*
 			 * When pic_order_cnt_lsb wraps around to zero, adjust the total count using
@@ -337,15 +335,16 @@ void qbuf_setup(struct v4l2_buffer *buf)
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
 		trace_mem_encoded(buf_fd, buf_offset);
-		ctx_trace.compressed_frame_count = ctx_trace.compressed_frame_count + 1;
 	}
 
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-
-		/* If the capture buffer is queued for reuse, trace it before it is reused. */
-		if (ctx_trace.compressed_frame_count != 0)
-			trace_mem_decoded();
+		/*
+		 * If the capture buffer is queued for reuse, trace it before it is reused.
+		 * Capture buffers can't be traced using dqbuf because the buffer is mmapped
+		 * after the call to dqbuf.
+		 */
+		trace_mem_decoded();
 
 		/* H264 sets display order in controls, otherwise display just in the order queued. */
 		if (ctx_trace.compression_format != V4L2_PIX_FMT_H264_SLICE)
@@ -373,10 +372,8 @@ void streamoff_cleanup(v4l2_buf_type buf_type)
 	 * because they were not queued for reuse.
 	 */
 	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
-	    buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		if (ctx_trace.compressed_frame_count != 0)
-			trace_mem_decoded();
-	}
+	    buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		trace_mem_decoded();
 }
 
 void g_fmt_setup_trace(struct v4l2_format *format)
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index f81f68d1..31447f24 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -204,7 +204,6 @@ void trace_mem_decoded(void)
 		if (!it->address || it == ctx_trace.buffers.end() || it->bytesused < expected_length)
 			break;
 	}
-	ctx_trace.compressed_frame_count = ctx_trace.compressed_frame_count - displayed_count;
 }
 
 json_object *trace_v4l2_plane(struct v4l2_plane *ptr, __u32 memory)
diff --git a/utils/v4l2-tracer/trace.h b/utils/v4l2-tracer/trace.h
index 1e8b17e7..272f6c3c 100644
--- a/utils/v4l2-tracer/trace.h
+++ b/utils/v4l2-tracer/trace.h
@@ -36,7 +36,6 @@ struct trace_context {
 		struct h264_info h264;
 	} fmt;
 	std::string trace_filename;
-	int compressed_frame_count;
 	std::list<long> decode_order;
 	std::list<struct buffer_trace> buffers;
 	std::unordered_map<int, std::string> devices; /* key:fd, value: path of the device */
-- 
2.41.0


