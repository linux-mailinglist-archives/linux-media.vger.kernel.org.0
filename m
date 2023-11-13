Return-Path: <linux-media+bounces-297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2567EA442
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C61D01C209CD
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2473A249E9;
	Mon, 13 Nov 2023 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R1noy5SD"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597D2375B
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:06:55 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51358D5D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:54 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 603A36602F3A;
	Mon, 13 Nov 2023 20:06:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906013;
	bh=vrzkrO1vH5Duvjf1HH/dlHBkhwV/K7VPrQpRAVRtj5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R1noy5SDghpQWZkKKOgTDVXWLSdWidcBnb+mnJ7O6jb5ne18BTh9vJA9Eiee0JXt8
	 vKbLxoaiLSh4w7XvnUwEByQcl8BN5y9SPj477iiSd9iLsZsZxyxPVceuArDi55usf7
	 /lmt3ycyRcV91bhtOP48XPZS/96r3S2G55aQJC9tEXpGNFjq+lQ7RWJrainxhkd3Qs
	 Y0IDznFYuGVawDjwBilPDsb4clpwoRefinFy1pv5e3sEnl2CoLOM9xP6Uwv3Lteg2d
	 tErLYbMNiWMxMwb63CVo2SgxhZnZkB8fY+ApoMajaL2ETafYgPhhhE3kVOz7pBY47r
	 KacsBeFG5kFeQ==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 5/8] v4l2-tracer: get decoded bytesused from DQBUF
Date: Mon, 13 Nov 2023 12:06:16 -0800
Message-ID: <74dffcc4bac749b406030747bfdf6b78d0a1975c.1699904350.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699904350.git.deborah.brouwer@collabora.com>
References: <cover.1699904350.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To write the decoded video data to a file, the tracer gets the bytesused
from userspace arguments when the capture buffers are queued for reuse.
But this only works by accident because the values in the buffers
haven’t been cleared for reuse. Instead get the bytesused from the
driver arguments when the capture buffer is dequeued.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp |  2 ++
 utils/v4l2-tracer/trace-helper.cpp  | 27 +++++++++++++++++++++++----
 utils/v4l2-tracer/trace.h           |  1 +
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index c6a74afb..7618f554 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -309,6 +309,8 @@ int ioctl(int fd, unsigned long cmd, ...)
 		expbuf_setup(static_cast<struct v4l2_exportbuffer*>(arg));
 	if (cmd == VIDIOC_QUERYBUF)
 		querybuf_setup(fd, static_cast<struct v4l2_buffer*>(arg));
+	if (cmd == VIDIOC_DQBUF)
+		dqbuf_setup(static_cast<struct v4l2_buffer*>(arg));
 
 	/* Get info needed for tracing dynamic arrays */
 	if (cmd == VIDIOC_QUERY_EXT_CTRL)
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index f58671df..3eee20c2 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -324,12 +324,13 @@ void qbuf_setup(struct v4l2_buffer *buf)
 	__u32 buf_offset = get_buffer_offset_trace(buf->type, buf->index);
 
 	__u32 bytesused = 0;
-	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
-	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		bytesused = buf->m.planes[0].bytesused;
-	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT || buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	else if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		bytesused = buf->bytesused;
-	set_buffer_bytesused_trace(buf_fd, buf_offset, bytesused);
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		set_buffer_bytesused_trace(buf_fd, buf_offset, bytesused);
 
 	/* The output buffer should have compressed data just before it is queued, so trace it. */
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
@@ -356,6 +357,24 @@ void qbuf_setup(struct v4l2_buffer *buf)
 	}
 }
 
+void dqbuf_setup(struct v4l2_buffer *buf)
+{
+	debug_line_info("\n\t%s, index: %d", val2s(buf->type, v4l2_buf_type_val_def).c_str(), buf->index);
+
+	int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
+	__u32 buf_offset = get_buffer_offset_trace(buf->type, buf->index);
+
+	__u32 bytesused = 0;
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		bytesused = buf->m.planes[0].bytesused;
+	else if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		bytesused = buf->bytesused;
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		set_buffer_bytesused_trace(buf_fd, buf_offset, bytesused);
+}
+
 void streamoff_cleanup(v4l2_buf_type buf_type)
 {
 	debug_line_info();
diff --git a/utils/v4l2-tracer/trace.h b/utils/v4l2-tracer/trace.h
index 272f6c3c..a74a5f3f 100644
--- a/utils/v4l2-tracer/trace.h
+++ b/utils/v4l2-tracer/trace.h
@@ -62,6 +62,7 @@ bool buffer_is_mapped(unsigned long buffer_address);
 unsigned get_expected_length_trace(void);
 void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls);
 void qbuf_setup(struct v4l2_buffer *buf);
+void dqbuf_setup(struct v4l2_buffer *buf);
 void streamoff_cleanup(v4l2_buf_type buf_type);
 void g_fmt_setup_trace(struct v4l2_format *format);
 void s_fmt_setup(struct v4l2_format *format);
-- 
2.41.0


