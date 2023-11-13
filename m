Return-Path: <linux-media+bounces-294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38097EA43F
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D648F1C208C4
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290302420C;
	Mon, 13 Nov 2023 20:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gDWWDLBO"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2479724207
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:06:50 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD5DD75
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:48 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A284B6602F3B;
	Mon, 13 Nov 2023 20:06:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906007;
	bh=oxwICCOCbCvcoqq1t7x/iWOsEDjvjanFoD/DqRSA2pE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gDWWDLBO0UMXh6K9c42vRsYeu/jxVg/1dzEGkn5eYfa1jZ7anBdYpvoumbMmvMG4J
	 ypewuIzUq3oVi1nOLOUJzSneQEW1K7hkxHXGG9sMbxH5xTbduWdSHUjBphZ4Dm3pb4
	 x5MdUBhohwtFKUiyIOAvC3P2B8uoJ/VTpnuDdbmy1jgN6brAqCzMGxV/gZ5GG4t4h1
	 BloYjVT4V64CuLpf+3VOCA6zH9sYQBFmh+lBHyHhEWK579aux6z/ytErz3SJX2DX+w
	 JUBIPuLlD35DtKhArLoJnub3JbeZdOgnww/Aa6MQubPEclO4QUfKQ2nf9rRrSANSzB
	 1J0P23evKcthg==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 2/8] v4l2-tracer: replace buftype2s with val2s
Date: Mon, 13 Nov 2023 12:06:13 -0800
Message-ID: <0d7a8b49dafb090481a03b61c5bd4dabcf4b4386.1699904350.git.deborah.brouwer@collabora.com>
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

While buftype2s gives a written description of the buffer type, val2s will
reproduce the type exactly as it appears in videodev2.h which is easier to
follow for tracing.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/retrace.cpp      | 19 ++++++++++++-------
 utils/v4l2-tracer/trace-helper.cpp |  6 +++---
 utils/v4l2-tracer/trace.cpp        |  4 ++--
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 14c42568..1bec635d 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -336,7 +336,8 @@ void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
 
 	if (is_verbose() || (errno != 0)) {
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
-		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
+			val2s(buf->type, v4l2_buf_type_val_def).c_str(),
+			buf->index, fd_retrace);
 		perror("VIDIOC_QUERYBUF");
 		debug_line_info();
 		print_context();
@@ -360,7 +361,8 @@ void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
 
 	if (is_verbose() || (errno != 0)) {
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
-		        buftype2s((int) ptr->type).c_str(), ptr->index, fd_retrace);
+		        val2s(ptr->type, v4l2_buf_type_val_def).c_str(),
+		        ptr->index, fd_retrace);
 		perror("VIDIOC_QBUF");
 		debug_line_info();
 		print_context();
@@ -395,7 +397,8 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
 
 	if (is_verbose() || (errno != 0)) {
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
-		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
+		        val2s(buf->type, v4l2_buf_type_val_def).c_str(),
+		        buf->index, fd_retrace);
 		perror("VIDIOC_DQBUF");
 		debug_line_info();
 		print_context();
@@ -416,7 +419,8 @@ void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args_user)
 
 	if (is_verbose() || (errno != 0)) {
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
-		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
+		        val2s(buf->type, v4l2_buf_type_val_def).c_str(),
+		        buf->index, fd_retrace);
 		perror("VIDIOC_PREPARE_BUF");
 		debug_line_info();
 		print_context();
@@ -482,7 +486,7 @@ void retrace_vidioc_streamon(int fd_retrace, json_object *ioctl_args)
 	ioctl(fd_retrace, VIDIOC_STREAMON, &buf_type);
 
 	if (is_verbose() || (errno != 0)) {
-		fprintf(stderr, "%s, ", buftype2s(buf_type).c_str());
+		fprintf(stderr, "%s, ", val2s(buf_type, v4l2_buf_type_val_def).c_str());
 		perror("VIDIOC_STREAMON");
 	}
 }
@@ -497,7 +501,7 @@ void retrace_vidioc_streamoff(int fd_retrace, json_object *ioctl_args)
 	ioctl(fd_retrace, VIDIOC_STREAMOFF, &buf_type);
 
 	if (is_verbose() || (errno != 0)) {
-		fprintf(stderr, "%s, ", buftype2s(buf_type).c_str());
+		fprintf(stderr, "%s, ", val2s(buf_type, v4l2_buf_type_val_def).c_str());
 		perror("VIDIOC_STREAMOFF");
 	}
 }
@@ -1451,7 +1455,8 @@ void retrace_mem(json_object *mem_obj)
 		write_to_output_buffer(buffer_pointer, bytesused, mem_obj);
 
 	debug_line_info("\n\t%s, bytesused: %d, offset: %d, addr: %ld",
-	                buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
+			val2s(type, v4l2_buf_type_val_def).c_str(),
+			bytesused, offset, buffer_address_retrace);
 	print_context();
 }
 
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index e5094b67..a1e83a44 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -228,7 +228,7 @@ void print_buffers_trace(void)
 		return;
 	for (auto &b : ctx_trace.buffers) {
 		fprintf(stderr, "fd: %d, %s, index: %d, display_order: %ld, bytesused: %d, ",
-		        b.fd, buftype2s(b.type).c_str(), b.index, b.display_order, b.bytesused);
+		        b.fd, val2s(b.type, v4l2_buf_type_val_def).c_str(), b.index, b.display_order, b.bytesused);
 		fprintf(stderr, "address: %lu, offset: %u \n",  b.address, b.offset);
 	}
 }
@@ -320,7 +320,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 
 void qbuf_setup(struct v4l2_buffer *buf)
 {
-	debug_line_info("\n\t%s, index: %d", buftype2s((int) buf->type).c_str(), buf->index);
+	debug_line_info("\n\t%s, index: %d", val2s(buf->type, v4l2_buf_type_val_def).c_str(), buf->index);
 
 	int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
 	__u32 buf_offset = get_buffer_offset_trace(buf->type, buf->index);
@@ -361,7 +361,7 @@ void streamoff_cleanup(v4l2_buf_type buf_type)
 {
 	debug_line_info();
 	if (is_verbose() || (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE") != nullptr)) {
-		fprintf(stderr, "VIDIOC_STREAMOFF: %s\n", buftype2s(buf_type).c_str());
+		fprintf(stderr, "VIDIOC_STREAMOFF: %s\n", val2s(buf_type, v4l2_buf_type_val_def).c_str());
 		fprintf(stderr, "%s, %s %s, width: %d, height: %d\n",
 		        val2s(ctx_trace.compression_format, v4l2_pix_fmt_val_def).c_str(),
 		        val2s(ctx_trace.pixelformat, v4l2_pix_fmt_val_def).c_str(),
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index 0e8531ff..f81f68d1 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -181,8 +181,8 @@ void trace_mem_decoded(void)
 			 */
 			if (it->bytesused < expected_length)
 				break;
-			debug_line_info("\n\tDisplaying: %ld, %s, index: %d",
-			                it->display_order, buftype2s(it->type).c_str(), it->index);
+			debug_line_info("\n\tDisplaying: %ld, %s, index: %d", it->display_order,
+					val2s(it->type, v4l2_buf_type_val_def).c_str(), it->index);
 			displayed_count++;
 
 			if (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE") != nullptr) {
-- 
2.41.0


