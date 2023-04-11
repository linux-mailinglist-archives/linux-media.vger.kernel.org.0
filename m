Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2387E6DE60E
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 22:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjDKUze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 16:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjDKUzd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 16:55:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0443449A
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 13:55:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AAD2466031F9;
        Tue, 11 Apr 2023 21:55:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681246530;
        bh=7ZLd7BG0LTj5W5G00CnDRbSo0W9oUKU1LQ7NUflvf4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h7wAcahEdZhCbZDESi/sfNPqElSIZ7V0I/EZT9nESwMrVT5/QY/x6pxq76A8lOqxu
         /N6J7jc/c8Bt2rbKrjBOGith5vm93+eEJnxc84BBoGTU2BztZobYPktHNbAaUEfNrx
         DaS4revgBn9oi+BRtWWoADPvFtJBY+oDKrna+N0kd07NYGvGmclNOeaZ0PgYqDGI4g
         LYcCqy3rdVniFXxUWdxoaaH6PtZqkVTbuSWD+8kzfTruTYbeWhmPANkKh/8ArFzYav
         6bPXYU85j0e2rlwVPMpaE0RfKGyuiPgdSq2vFb2vaAXk2cHiytMLk7qxcHQWcguwYc
         oEC9MyZHmzBAA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 1/2] v4l2-tracer: print only if debugging option is set
Date:   Tue, 11 Apr 2023 13:54:57 -0700
Message-Id: <f04abeae38dfa923741d9dd66d359b48c69050b6.1681245372.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1681245372.git.deborah.brouwer@collabora.com>
References: <cover.1681245372.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a print function is used only for debugging, check for the debug
option within the print function itself. This makes the main code easier
to read.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp  |  6 +++---
 utils/v4l2-tracer/retrace-helper.cpp |  2 ++
 utils/v4l2-tracer/retrace.cpp        | 22 +++++++++++-----------
 utils/v4l2-tracer/trace-helper.cpp   | 13 +++++++++----
 4 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index a9f039c7..cc7d5657 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -83,8 +83,8 @@ int open(const char *path, int oflag, ...)
 
 	if (is_debug()) {
 		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		print_devices();
 	}
+	print_devices();
 
 	return fd;
 }
@@ -119,8 +119,8 @@ int open64(const char *path, int oflag, ...)
 
 	if (is_debug()) {
 		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		print_devices();
 	}
+	print_devices();
 
 	return fd;
 }
@@ -156,8 +156,8 @@ int close(int fd)
 
 	if (is_debug()) {
 		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		print_devices();
 	}
+	print_devices();
 
 	return (*original_close)(fd);
 }
diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
index 03b0466b..f58987ac 100644
--- a/utils/v4l2-tracer/retrace-helper.cpp
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -256,6 +256,8 @@ void compare_program_versions(json_object *v4l2_tracer_info_obj)
 
 void print_context(void)
 {
+	if (!is_debug())
+		return;
 	print_fds();
 	print_buffers_retrace();
 	fprintf(stderr, "\n");
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 8667826c..0e6600da 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -59,8 +59,8 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 			perror("mmap");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 		exit(EXIT_FAILURE);
 	}
 
@@ -82,8 +82,8 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 			perror("mmap");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 }
 
@@ -176,8 +176,8 @@ void retrace_open(json_object *jobj, bool is_open64)
 			perror("open");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 }
 
@@ -199,8 +199,8 @@ void retrace_close(json_object *jobj)
 		perror("close");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 }
 
@@ -354,8 +354,8 @@ void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
 		perror("VIDIOC_QUERYBUF");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 
 	free(buf);
@@ -380,8 +380,8 @@ void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
 		perror("VIDIOC_QBUF");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 
 	free(ptr);
@@ -417,8 +417,8 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
 		perror("VIDIOC_DQBUF");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
@@ -440,8 +440,8 @@ void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args_user)
 		perror("VIDIOC_PREPARE_BUF");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
@@ -460,8 +460,8 @@ void retrace_vidioc_create_bufs(int fd_retrace, json_object *ioctl_args)
 		perror("VIDIOC_CREATE_BUFS");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 
 	free(ptr);
@@ -967,8 +967,8 @@ void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 		perror("VIDIOC_S_EXT_CTRLS");
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_context();
 		}
+		print_context();
 	}
 }
 
@@ -1352,8 +1352,8 @@ void retrace_mem(json_object *mem_obj)
 		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
 		fprintf(stderr, "%s, bytesused: %d, offset: %d, addr: %ld\n",
 		        buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
-		print_context();
 	}
+	print_context();
 }
 
 void retrace_object(json_object *jobj)
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 0030272b..0b6382ee 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -39,6 +39,8 @@ std::string get_device(int fd)
 
 void print_devices(void)
 {
+	if (!is_debug())
+		return;
 	if (ctx_trace.devices.size())
 		fprintf(stderr, "Devices:\n");
 	for (auto &device_pair : ctx_trace.devices)
@@ -47,6 +49,8 @@ void print_devices(void)
 
 void print_decode_order(void)
 {
+	if (!is_debug())
+		return;
 	fprintf(stderr, "Decode order: ");
 	for (auto &num : ctx_trace.decode_order)
 		fprintf(stderr, "%ld, ",  num);
@@ -65,8 +69,7 @@ void set_decode_order(long decode_order)
 	if (it == ctx_trace.decode_order.end())
 		ctx_trace.decode_order.push_front(decode_order);
 
-	if (is_debug())
-		print_decode_order();
+	print_decode_order();
 }
 
 long get_decode_order(void)
@@ -230,6 +233,8 @@ bool buffer_is_mapped(unsigned long buffer_address)
 
 void print_buffers_trace(void)
 {
+	if (!is_debug())
+		return;
 	for (auto &b : ctx_trace.buffers) {
 		fprintf(stderr, "fd: %d, %s, index: %d, display_order: %ld, bytesused: %d, ",
 		        b.fd, buftype2s(b.type).c_str(), b.index, b.display_order, b.bytesused);
@@ -367,9 +372,9 @@ void qbuf_setup(struct v4l2_buffer *buf)
 
 		if (is_debug()) {
 			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			print_decode_order();
-			print_buffers_trace();
 		}
+		print_decode_order();
+		print_buffers_trace();
 	}
 }
 
-- 
2.39.1

