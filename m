Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDFED59AA4D
	for <lists+linux-media@lfdr.de>; Sat, 20 Aug 2022 02:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245633AbiHTAuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 20:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245644AbiHTAuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 20:50:17 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B5E11830
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 17:50:14 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D285A6601DC8;
        Sat, 20 Aug 2022 01:50:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660956612;
        bh=fHVoLTHrqX8MEKgxsu7Krxlbu7SdIhuIviRtxKOXl0M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AyB+D49qQJZcqFqkLNfQZ8scFHdOkNW6+jRLin6Ok0z64YdxAoifIxVH9gFulQcCP
         2pfhjc1Cg/5gcEo1moK8d6RCOq0RyJ/KOP9fblpMSDk4RpcAR3/tDPja21bMjvSIM/
         Z4vC3wu7eZcC59m72QrmJd2KGdNkhdPq3B79nw4XDe9CDiDZN4x3pb2/Q4wBtV0rCR
         SXGKbj+Qt4Q4Ci4ussb9kLXducZgyGtwJ+MjVzMEI7x8XliZtWWBuF0O/UeKhg7Vtf
         4QJctgyJnwfzvH2N4UDpylzPNJrEHtutmYym1rYM7N2isgVKHQVQYkD+++W58UNT+P
         qD1d4Bzukg1Ag==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [RFC 1/2] utils: add stateless tracer utility
Date:   Fri, 19 Aug 2022 17:50:18 -0700
Message-Id: <088185de3da0eaab21fc6def679e59033fd2fd24.1660955263.git.deborah.brouwer@collabora.com>
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

The tracer utility helps to test v4l2 stateless decoder drivers by tracing
and recording userspace's interaction with a stateless decoder driver.
Only system calls relevant to the v4l2 memory-to-memory stateless video
decoder interface are traced. The tracer traces encoded data from output
buffers and, optionally, may trace decoded data from capture buffers. The
tracer records its results in a json-formatted trace file.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 configure.ac                  |   6 +
 utils/Makefile.am             |   5 +
 utils/common/v4l2-info.cpp    |   7 +-
 utils/common/v4l2-info.h      |   8 +
 utils/tracer/.gitignore       |   9 +
 utils/tracer/Makefile.am      |  19 ++
 utils/tracer/libtracer.cpp    | 217 ++++++++++++++
 utils/tracer/libtracer.h      |  92 ++++++
 utils/tracer/trace-helper.cpp | 218 ++++++++++++++
 utils/tracer/trace-info.cpp   | 358 +++++++++++++++++++++++
 utils/tracer/trace-info.h     |  72 +++++
 utils/tracer/trace-vp8.cpp    | 183 ++++++++++++
 utils/tracer/trace.cpp        | 520 ++++++++++++++++++++++++++++++++++
 utils/tracer/tracer.cpp       |  91 ++++++
 14 files changed, 1799 insertions(+), 6 deletions(-)
 create mode 100644 utils/tracer/.gitignore
 create mode 100644 utils/tracer/Makefile.am
 create mode 100644 utils/tracer/libtracer.cpp
 create mode 100644 utils/tracer/libtracer.h
 create mode 100644 utils/tracer/trace-helper.cpp
 create mode 100644 utils/tracer/trace-info.cpp
 create mode 100644 utils/tracer/trace-info.h
 create mode 100644 utils/tracer/trace-vp8.cpp
 create mode 100644 utils/tracer/trace.cpp
 create mode 100644 utils/tracer/tracer.cpp

diff --git a/configure.ac b/configure.ac
index 05298981..cc604cad 100644
--- a/configure.ac
+++ b/configure.ac
@@ -42,6 +42,7 @@ AC_CONFIG_FILES([Makefile
 	utils/cec-follower/cec-follower.1
 	utils/qvidcap/Makefile
 	utils/rds-ctl/Makefile
+	utils/tracer/Makefile
 
 	contrib/Makefile
 	contrib/freebsd/Makefile
@@ -311,6 +312,11 @@ AS_IF([test "x$with_libudev" != xno -o "x$enable_libdvbv5" != xno],
 
 AC_SUBST([JPEG_LIBS])
 
+PKG_CHECK_MODULES(JSONC, [json-c >= 0.16], [jsonc_pkgconfig=yes], [jsonc_pkgconfig=no])
+AC_SUBST([JSONC_CFLAGS])
+AC_SUBST([JSONC_LIBS])
+AM_CONDITIONAL([HAVE_JSONC], [test x$jsonc_pkgconfig = xyes])
+
 # Check for pthread
 
 AS_IF([test x$enable_shared != xno],
diff --git a/utils/Makefile.am b/utils/Makefile.am
index 0e68a612..3ccc3d81 100644
--- a/utils/Makefile.am
+++ b/utils/Makefile.am
@@ -15,6 +15,11 @@ SUBDIRS = \
 	cec-follower \
 	rds-ctl
 
+if HAVE_JSONC
+SUBDIRS += \
+	tracer
+endif
+
 if WITH_LIBDVBV5
 SUBDIRS += \
 	dvb
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 40d45471..74e77b7a 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -16,12 +16,7 @@ static std::string num2s(unsigned num, bool is_hex = true)
 	return buf;
 }
 
-struct flag_def {
-	unsigned flag;
-	const char *str;
-};
-
-static std::string flags2s(unsigned val, const flag_def *def)
+std::string flags2s(unsigned int val, const flag_def *def)
 {
 	std::string s;
 
diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index 35237853..8eb14bc4 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -11,6 +11,14 @@
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 
+struct flag_def {
+	unsigned int flag;
+	const char *str;
+};
+
+/* Return a comma-separated string of flags or hex value if unknown */
+std::string flags2s(unsigned int val, const flag_def *def);
+
 /* Print capability information */
 void v4l2_info_capability(const v4l2_capability &cap);
 void v4l2_info_subdev_capability(const v4l2_subdev_capability &subdevcap);
diff --git a/utils/tracer/.gitignore b/utils/tracer/.gitignore
new file mode 100644
index 00000000..4098662d
--- /dev/null
+++ b/utils/tracer/.gitignore
@@ -0,0 +1,9 @@
+*.json
+*.yuv
+*.webm
+*.h264
+*.ivf
+*.vp8
+tracer
+retracer
+.clang-tidy
diff --git a/utils/tracer/Makefile.am b/utils/tracer/Makefile.am
new file mode 100644
index 00000000..f5579198
--- /dev/null
+++ b/utils/tracer/Makefile.am
@@ -0,0 +1,19 @@
+if HAVE_JSONC
+
+lib_LTLIBRARIES = libtracer.la
+include_HEADERS = libtracer.h ../../utils/common/v4l2-info.h ../../utils/common/media-info.h
+libtracer_la_SOURCES = libtracer.cpp trace.cpp trace-vp8.cpp trace-helper.cpp \
+trace-info.cpp ../../utils/common/v4l2-info.cpp ../../utils/common/media-info.cpp
+
+libtracer_la_CFLAGS = $(JSONC_CFLAGS)
+libtracer_la_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
+libtracer_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -ldl $(JSONC_LIBS)
+libtracer_la_LIBTOOLFLAGS = --tag=disable-static
+
+bin_PROGRAMS = tracer
+
+tracer_SOURCES = tracer.cpp
+tracer_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
+tracer_LDFLAGS = -lrt -lpthread $(JSONC_LIBS)
+
+endif
diff --git a/utils/tracer/libtracer.cpp b/utils/tracer/libtracer.cpp
new file mode 100644
index 00000000..0d18b224
--- /dev/null
+++ b/utils/tracer/libtracer.cpp
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
+
+int open64(const char *path, int oflag, ...)
+{
+	errno = 0;
+	mode_t mode = 0;
+
+	if (oflag & O_CREAT) {
+		va_list ap;
+		va_start(ap, oflag);
+		mode = va_arg(ap, PROMOTED_MODE_T);
+		va_end(ap);
+	}
+
+	int (*original_open64)(const char *path, int oflag, ...);
+	original_open64 = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open64");
+	int fd = (*original_open64)(path, oflag, mode);
+
+	/* Only trace calls to video or media devices. */
+	std::string dev_path_video = "/dev/video";
+	std::string dev_path_media = "/dev/media";
+	if (strncmp(path, dev_path_video.c_str(), dev_path_video.length()) &&
+	    strncmp(path, dev_path_media.c_str(), dev_path_media.length()))
+		return fd;
+
+	/* Set trace options if this is the first call to libtracer. */
+	if (!options_are_set())
+		set_options();
+
+	add_device(fd, path);
+
+	json_object *open_obj = json_object_new_object();
+	json_object_object_add(open_obj, "syscall_str", json_object_new_string("open64"));
+	json_object_object_add(open_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_OPEN64));
+	json_object_object_add(open_obj, "fd", json_object_new_int(fd));
+	json_object *open_args = trace_open(path, oflag, mode);
+	json_object_object_add(open_obj, "open_args", open_args);
+
+	write_json_object_to_json_file(open_obj);
+	json_object_put(open_obj);
+
+	return fd;
+}
+
+void *mmap64(void *addr, size_t len, int prot, int flags, int fildes, off_t off)
+{
+	errno = 0;
+
+	void *(*original_mmap64)(void *addr, size_t len, int prot, int flags, int fildes, off_t off);
+	original_mmap64 = (void*(*)(void*, size_t, int, int, int, off_t)) dlsym(RTLD_NEXT, "mmap64");
+	void *buf_address_pointer = (*original_mmap64)(addr, len, prot, flags, fildes, off);
+
+	/* Only trace mmap64 calls for output or capture buffers. */
+	__u32 type = get_buffer_type_trace(fildes);
+	if (!type)
+		return buf_address_pointer;
+
+	/* Save the buffer address for future reference. */
+	set_buffer_address_trace(fildes, (long int) buf_address_pointer);
+
+	json_object *mmap_obj = json_object_new_object();
+	if (errno) {
+		json_object_object_add(mmap_obj, "errno", json_object_new_int(errno));
+		json_object_object_add(mmap_obj, "errno_str", json_object_new_string(strerror(errno)));
+	}
+	json_object_object_add(mmap_obj, "syscall_str", json_object_new_string("mmap64"));
+	json_object_object_add(mmap_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_MMAP64));
+
+	json_object *mmap64_args = trace_mmap64(addr, len, prot, flags, fildes, off);
+	json_object_object_add(mmap_obj, "mmap64_args", mmap64_args);
+
+	json_object_object_add(mmap_obj, "buffer_address", json_object_new_int64((long int) buf_address_pointer));
+	write_json_object_to_json_file(mmap_obj);
+	json_object_put(mmap_obj);
+
+	/*
+	 * The capture buffer is traced for the first time here when the buffer is first mapped.
+	 * Subsequently, the capture buffer will be traced when VIDIOC_DQBUF is called.
+	 */
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		trace_mem(fildes);
+
+	return buf_address_pointer;
+}
+
+int munmap(void *start, size_t length)
+{
+	errno = 0;
+
+	int(*original_munmap)(void *start, size_t length);
+	original_munmap = (int(*)(void *, size_t)) dlsym(RTLD_NEXT, "munmap");
+	int ret = (*original_munmap)(start, length);
+
+	/* Only trace the unmapping if the original mapping was traced. */
+	if (!buffer_is_mapped((long int) start))
+		return ret;
+
+	json_object *munmap_obj = json_object_new_object();
+	json_object_object_add(munmap_obj, "syscall_str", json_object_new_string("munmap"));
+	json_object_object_add(munmap_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_MUNMAP));
+
+	if (errno) {
+		json_object_object_add(munmap_obj, "errno", json_object_new_int(errno));
+		json_object_object_add(munmap_obj, "errno_str", json_object_new_string(strerror(errno)));
+	}
+
+	json_object *munmap_args = json_object_new_object();
+	json_object_object_add(munmap_args, "start", json_object_new_int64((int64_t)start));
+	json_object_object_add(munmap_args, "length", json_object_new_uint64(length));
+	json_object_object_add(munmap_obj, "munmap_args", munmap_args);
+
+	write_json_object_to_json_file(munmap_obj);
+	json_object_put(munmap_obj);
+
+	return ret;
+}
+
+int ioctl(int fd, unsigned long int request, ...)
+{
+	errno = 0;
+
+	va_list ap;
+	va_start(ap, request);
+	void *arg = va_arg(ap, void *);
+	va_end(ap);
+
+	int (*original_ioctl)(int fd, unsigned long int request, ...);
+	original_ioctl = (int (*)(int, long unsigned int, ...)) dlsym(RTLD_NEXT, "ioctl");
+
+	/* If the ioctl is queuing an output buffer, trace the output buffer before tracing the ioctl. */
+	if ((request == VIDIOC_QBUF) && (_IOC_TYPE(request) == 'V')) {
+		struct v4l2_buffer *buf = static_cast<struct v4l2_buffer*>(arg);
+		if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+			int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
+			if (buf_fd) {
+				set_buffer_bytesused_trace(buf_fd, buf->m.planes[0].bytesused);
+				trace_mem(buf_fd);
+			}
+		}
+	}
+
+	json_object *ioctl_obj = json_object_new_object();
+	json_object_object_add(ioctl_obj, "syscall_str", json_object_new_string("ioctl"));
+	json_object_object_add(ioctl_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_IOCTL));
+	json_object_object_add(ioctl_obj, "fd", json_object_new_int(fd));
+	json_object_object_add(ioctl_obj, "request", json_object_new_uint64(request));
+	json_object_object_add(ioctl_obj, "request_str", json_object_new_string(get_ioctl_request_str(request).c_str()));
+
+	/* Trace the ioctl arguments provided by userspace if relevant. */
+	json_object *ioctl_args_userspace = trace_ioctl_args(fd, request, arg);
+	if (json_object_object_length(ioctl_args_userspace))
+		json_object_object_add(ioctl_obj, "ioctl_args_from_userspace", ioctl_args_userspace);
+
+	/* Make the original ioctl call. */
+	int ret = (*original_ioctl)(fd, request, arg);
+
+	if (errno) {
+		json_object_object_add(ioctl_obj, "errno", json_object_new_int(errno));
+		json_object_object_add(ioctl_obj, "errno_str", json_object_new_string(strerror(errno)));
+	}
+
+	/* Also trace the ioctl arguments as modified by the driver if relevant. */
+	json_object *ioctl_args_driver = trace_ioctl_args(fd, request, arg, false);
+	if (json_object_object_length(ioctl_args_driver))
+		json_object_object_add(ioctl_obj, "ioctl_args_from_driver", ioctl_args_driver);
+
+	write_json_object_to_json_file(ioctl_obj);
+	json_object_put(ioctl_obj);
+
+	/* If the ioctl is exporting a buffer, store the buffer file descriptor and index for future access. */
+	if ((request == VIDIOC_EXPBUF) && (_IOC_TYPE(request) == 'V')) {
+		struct v4l2_exportbuffer *export_buffer = static_cast<struct v4l2_exportbuffer*>(arg);
+		add_buffer_trace(export_buffer->fd, export_buffer->type, export_buffer->index);
+	}
+
+	/* If the ioctl is dequeuing a capture buffer, trace the buffer. */
+	if ((request == VIDIOC_DQBUF) && (_IOC_TYPE(request) == 'V')) {
+		struct v4l2_buffer *buf = static_cast<struct v4l2_buffer*>(arg);
+		if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+			int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
+			if (buf_fd) {
+				/* TODO tracer only works for decoded formats with one plane e.g. V4L2_PIX_FMT_NV12 */
+				set_buffer_bytesused_trace(buf_fd, buf->m.planes[0].bytesused);
+				trace_mem(buf_fd);
+			}
+		}
+	}
+
+	return ret;
+}
+
+int close(int fd)
+{
+	std::string path = get_device(fd);
+
+	/* Only trace the close if a corresponding open was also traced. */
+	if (!path.empty()) {
+		json_object *close_obj = json_object_new_object();
+		json_object_object_add(close_obj, "syscall_str", json_object_new_string("close"));
+		json_object_object_add(close_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_CLOSE));
+		json_object_object_add(close_obj, "fd", json_object_new_int(fd));
+		json_object_object_add(close_obj, "path", json_object_new_string(path.c_str()));
+		write_json_object_to_json_file(close_obj);
+		json_object_put(close_obj);
+		remove_device(fd);
+	}
+
+	int (*original_close)(int fd);
+	original_close = (int (*)(int)) dlsym(RTLD_NEXT, "close");
+
+	return (*original_close)(fd);
+}
diff --git a/utils/tracer/libtracer.h b/utils/tracer/libtracer.h
new file mode 100644
index 00000000..5f86aadf
--- /dev/null
+++ b/utils/tracer/libtracer.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef LIBTRACER_H
+#define LIBTRACER_H
+
+#include <stdio.h>
+#include <stdarg.h>
+#include <dlfcn.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <config.h>
+#include <pthread.h>
+#include <unistd.h> /* needed for close */
+#include <linux/dma-buf.h>
+#include <json-c/json.h>
+#include <v4l2-info.h>
+#include <unordered_map>
+#include <list>
+#include "trace-info.h"
+
+struct trace_options {
+	bool set;
+	bool pretty_print_all;
+	bool pretty_print_mem;
+	bool decoded_data_to_json;
+	bool create_yuv_file;
+};
+
+struct buffer_trace {
+	int fd;
+	__u32 type; /* enum v4l2_buf_type */
+	__u32 index;
+	long address;
+	__u32 bytesused;
+};
+
+struct trace_context {
+	FILE *trace_file;
+	std::string trace_filename;
+	pthread_mutex_t lock;
+	/* Key is the file descriptor, value is the path of the video or media device. */
+	std::unordered_map<int, std::string> devices;
+	/* List of output and capture buffers being traced. */
+	std::list<struct buffer_trace> buffers;
+};
+
+bool options_are_set(void);
+void set_options(void);
+bool pretty_print_mem(void);
+bool pretty_print_all(void);
+bool write_decoded_data_to_json(void);
+bool create_yuv_file(void);
+
+void add_device(int fd, std::string path);
+std::string get_device(int fd);
+int remove_device(int fd);
+void add_buffer_trace(int fd, __u32 type, __u32 index);
+int get_buffer_fd_trace(__u32 type, __u32 index);
+__u32 get_buffer_type_trace(int fd);
+int get_buffer_index_trace(int fd);
+void set_buffer_address_trace(int fd, long address);
+long get_buffer_address_trace(int fd);
+void set_buffer_bytesused_trace(int fd, __u32 bytesused);
+long get_buffer_bytesused_trace(int fd);
+bool buffer_is_mapped(long buffer_address);
+void write_json_object_to_json_file(json_object *jobj, int flags = JSON_C_TO_STRING_PLAIN);
+
+json_object *trace_open(const char *path, int oflag, mode_t mode);
+json_object *trace_mmap64(void *addr, size_t len, int prot, int flags, int fildes, off_t off);
+void trace_mem(int fd);
+std::string get_ioctl_request_str(unsigned long request);
+json_object *trace_ioctl_args(int fd, unsigned long request, void *arg, bool from_userspace = true);
+
+void trace_v4l2_ctrl_h264_decode_mode(struct v4l2_ext_control ctrl, json_object *ctrl_obj);
+void trace_v4l2_ctrl_h264_start_code(struct v4l2_ext_control ctrl, json_object *ctrl_obj);
+void trace_v4l2_ctrl_h264_sps(void *p_h264_sps, json_object *ctrl_obj);
+void trace_v4l2_ctrl_h264_pps(void *p_h264_pps, json_object *ctrl_obj);
+void trace_v4l2_ctrl_h264_scaling_matrix(void *p_h264_scaling_matrix, json_object *ctrl_obj);
+void trace_v4l2_ctrl_h264_pred_weights(void *p_h264_pred_weights, json_object *ctrl_obj);
+void trace_v4l2_ctrl_h264_slice_params(void *p_h264_slice_params, json_object *ctrl_obj);
+void trace_v4l2_ctrl_h264_decode_params(void *p_h264_decode_params, json_object *ctrl_obj);
+
+void trace_v4l2_ctrl_vp8_frame(void *p_vp8_frame, json_object *ctrl_obj);
+
+void trace_v4l2_ctrl_fwht_params(void *p_fwht_params, json_object *ctrl_obj);
+
+#endif
diff --git a/utils/tracer/trace-helper.cpp b/utils/tracer/trace-helper.cpp
new file mode 100644
index 00000000..402c602b
--- /dev/null
+++ b/utils/tracer/trace-helper.cpp
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
+
+struct trace_options options;
+
+struct trace_context ctx_trace = {
+	.lock = PTHREAD_MUTEX_INITIALIZER
+};
+
+bool options_are_set(void)
+{
+	return options.set;
+}
+
+void set_options(void)
+{
+	options.pretty_print_mem = getenv("TRACE_OPTION_PRETTY_PRINT_MEM") ? true : false;
+	options.pretty_print_all = getenv("TRACE_OPTION_PRETTY_PRINT_ALL") ? true : false;
+	options.decoded_data_to_json = getenv("TRACE_OPTION_DECODED_TO_JSON") ? true : false;
+	options.create_yuv_file = getenv("TRACE_OPTION_CREATE_YUV_FILE") ? true : false;
+	options.set = true;
+}
+
+bool pretty_print_mem(void)
+{
+	return options.pretty_print_mem;
+}
+
+bool pretty_print_all(void)
+{
+	return options.pretty_print_all;
+}
+
+bool write_decoded_data_to_json(void)
+{
+	return options.decoded_data_to_json;
+}
+
+bool create_yuv_file(void)
+{
+	return options.create_yuv_file;
+}
+
+void add_device(int fd, std::string path)
+{
+	std::pair<int, std::string> new_pair = std::make_pair(fd, path);
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.devices.insert(new_pair);
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+std::string get_device(int fd)
+{
+	std::string path;
+	std::unordered_map<int, std::string>::const_iterator it;
+	pthread_mutex_lock(&ctx_trace.lock);
+	it = ctx_trace.devices.find(fd);
+	if (it != ctx_trace.devices.end())
+		path = it->second;
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return path;
+}
+
+int remove_device(int fd)
+{
+	int ret = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	ret = ctx_trace.devices.erase(fd);
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return ret;
+}
+
+void add_buffer_trace(int fd, __u32 type, __u32 index)
+{
+	struct buffer_trace buf;
+	memset(&buf, 0, sizeof(buffer_trace));
+	buf.fd = fd;
+	buf.type = type;
+	buf.index = index;
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.buffers.push_front(buf);
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+int get_buffer_fd_trace(__u32 type, __u32 index)
+{
+	int fd = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->type == type) && (it->index == index)) {
+			fd = it->fd;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return fd;
+}
+
+__u32 get_buffer_type_trace(int fd)
+{
+	__u32 ret = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			ret = it->type;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return ret;
+}
+
+int get_buffer_index_trace(int fd)
+{
+	int index = -1;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			index = it->index;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return index;
+}
+
+void set_buffer_address_trace(int fd, long address)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			it->address = address;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+long get_buffer_address_trace(int fd)
+{
+	long int address = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			address = it->address;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return address;
+}
+
+void set_buffer_bytesused_trace(int fd, __u32 bytesused)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			it->bytesused = bytesused;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+long get_buffer_bytesused_trace(int fd)
+{
+	long int bytesused = -1;
+
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			bytesused = it->bytesused;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+
+	return bytesused;
+}
+
+/* Returns true if the memory address is a mapped buffer address, false otherwise. */
+bool buffer_is_mapped(long buffer_address)
+{
+	bool ret = false;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.cbegin(); it != ctx_trace.buffers.cend(); ++it) {
+		if (it->address == buffer_address) {
+			ret = true;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return ret;
+}
+
+void write_json_object_to_json_file(json_object *jobj, int flags)
+{
+	if (pretty_print_all())
+		flags = JSON_C_TO_STRING_PRETTY;
+
+	std::string json_str = json_object_to_json_string_ext(jobj, flags);
+	pthread_mutex_lock(&ctx_trace.lock);
+
+	if (ctx_trace.trace_filename.empty()) {
+		ctx_trace.trace_filename = getenv("TRACE_ID");
+		ctx_trace.trace_filename += ".json";
+		ctx_trace.trace_file = fopen(ctx_trace.trace_filename.c_str(), "a");
+	}
+
+	fwrite(json_str.c_str(), sizeof(char), json_str.length(), ctx_trace.trace_file);
+	fputs(",\n", ctx_trace.trace_file);
+	fflush(ctx_trace.trace_file);
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
diff --git a/utils/tracer/trace-info.cpp b/utils/tracer/trace-info.cpp
new file mode 100644
index 00000000..a1d58c64
--- /dev/null
+++ b/utils/tracer/trace-info.cpp
@@ -0,0 +1,358 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include <v4l2-info.h>
+#include "trace-info.h"
+
+struct definition {
+	unsigned long val;
+	const char *str;
+};
+
+static std::string val2s(unsigned long val, const definition *def)
+{
+	std::string s;
+
+	if (val == 0)
+		return s;
+
+	while ((def->val) && (def->val != val))
+		def++;
+
+	if (def->val == val)
+		s = def->str;
+
+	return s;
+}
+
+std::string ioctl2s_video(unsigned long request)
+{
+	static constexpr definition defs[] = {
+		{ VIDIOC_QUERYCAP,    "VIDIOC_QUERYCAP" },
+		{ VIDIOC_ENUM_FMT,    "VIDIOC_ENUM_FMT" },
+		{ VIDIOC_G_FMT,    "VIDIOC_G_FMT" },
+		{ VIDIOC_S_FMT,    "VIDIOC_S_FMT" },
+		{ VIDIOC_REQBUFS,    "VIDIOC_REQBUFS" },
+		{ VIDIOC_QUERYBUF,    "VIDIOC_QUERYBUF" },
+		{ VIDIOC_G_FBUF,    "VIDIOC_G_FBUF" },
+		{ VIDIOC_S_FBUF,    "VIDIOC_S_FBUF" },
+		{ VIDIOC_OVERLAY,    "VIDIOC_OVERLAY" },
+		{ VIDIOC_QBUF,    "VIDIOC_QBUF" },
+		{ VIDIOC_EXPBUF,    "VIDIOC_EXPBUF" },
+		{ VIDIOC_DQBUF,    "VIDIOC_DQBUF" },
+		{ VIDIOC_STREAMON,    "VIDIOC_STREAMON" },
+		{ VIDIOC_STREAMOFF,    "VIDIOC_STREAMOFF" },
+		{ VIDIOC_G_PARM,    "VIDIOC_G_PARM" },
+		{ VIDIOC_S_PARM,    "VIDIOC_S_PARM" },
+		{ VIDIOC_G_STD,    "VIDIOC_G_STD" },
+		{ VIDIOC_S_STD,    "VIDIOC_S_STD" },
+		{ VIDIOC_ENUMSTD,    "VIDIOC_ENUMSTD" },
+		{ VIDIOC_ENUMINPUT,    "VIDIOC_ENUMINPUT" },
+		{ VIDIOC_G_CTRL,    "VIDIOC_G_CTRL" },
+		{ VIDIOC_S_CTRL,    "VIDIOC_S_CTRL" },
+		{ VIDIOC_G_TUNER,    "VIDIOC_G_TUNER" },
+		{ VIDIOC_S_TUNER,    "VIDIOC_S_TUNER" },
+		{ VIDIOC_G_AUDIO,    "VIDIOC_G_AUDIO" },
+		{ VIDIOC_S_AUDIO,    "VIDIOC_S_AUDIO" },
+		{ VIDIOC_QUERYCTRL,    "VIDIOC_QUERYCTRL" },
+		{ VIDIOC_QUERYMENU,    "VIDIOC_QUERYMENU" },
+		{ VIDIOC_G_INPUT,    "VIDIOC_G_INPUT" },
+		{ VIDIOC_S_INPUT,    "VIDIOC_S_INPUT" },
+		{ VIDIOC_G_EDID,    "VIDIOC_G_EDID" },
+		{ VIDIOC_S_EDID,    "VIDIOC_S_EDID" },
+		{ VIDIOC_G_OUTPUT,    "VIDIOC_G_OUTPUT" },
+		{ VIDIOC_S_OUTPUT,    "VIDIOC_S_OUTPUT" },
+		{ VIDIOC_ENUMOUTPUT,    "VIDIOC_ENUMOUTPUT" },
+		{ VIDIOC_G_AUDOUT,    "VIDIOC_G_AUDOUT" },
+		{ VIDIOC_S_AUDOUT,    "VIDIOC_S_AUDOUT" },
+		{ VIDIOC_G_MODULATOR,    "VIDIOC_G_MODULATOR" },
+		{ VIDIOC_S_MODULATOR,    "VIDIOC_S_MODULATOR" },
+		{ VIDIOC_G_FREQUENCY,    "VIDIOC_G_FREQUENCY" },
+		{ VIDIOC_S_FREQUENCY,    "VIDIOC_S_FREQUENCY" },
+		{ VIDIOC_CROPCAP,    "VIDIOC_CROPCAP" },
+		{ VIDIOC_G_CROP,    "VIDIOC_G_CROP" },
+		{ VIDIOC_S_CROP,    "VIDIOC_S_CROP" },
+		{ VIDIOC_G_JPEGCOMP,    "VIDIOC_G_JPEGCOMP" },
+		{ VIDIOC_S_JPEGCOMP,    "VIDIOC_S_JPEGCOMP" },
+		{ VIDIOC_QUERYSTD,    "VIDIOC_QUERYSTD" },
+		{ VIDIOC_TRY_FMT,    "VIDIOC_TRY_FMT" },
+		{ VIDIOC_ENUMAUDIO,    "VIDIOC_ENUMAUDIO" },
+		{ VIDIOC_ENUMAUDOUT,    "VIDIOC_ENUMAUDOUT" },
+		{ VIDIOC_G_PRIORITY,    "VIDIOC_G_PRIORITY" },
+		{ VIDIOC_S_PRIORITY,    "VIDIOC_S_PRIORITY" },
+		{ VIDIOC_G_SLICED_VBI_CAP,    "VIDIOC_G_SLICED_VBI_CAP" },
+		{ VIDIOC_LOG_STATUS,    "VIDIOC_LOG_STATUS" },
+		{ VIDIOC_G_EXT_CTRLS,    "VIDIOC_G_EXT_CTRLS" },
+		{ VIDIOC_S_EXT_CTRLS,    "VIDIOC_S_EXT_CTRLS" },
+		{ VIDIOC_TRY_EXT_CTRLS,    "VIDIOC_TRY_EXT_CTRLS" },
+		{ VIDIOC_ENUM_FRAMESIZES,    "VIDIOC_ENUM_FRAMESIZES" },
+		{ VIDIOC_ENUM_FRAMEINTERVALS,    "VIDIOC_ENUM_FRAMEINTERVALS" },
+		{ VIDIOC_G_ENC_INDEX,    "VIDIOC_G_ENC_INDEX" },
+		{ VIDIOC_ENCODER_CMD,    "VIDIOC_ENCODER_CMD" },
+		{ VIDIOC_TRY_ENCODER_CMD,    "VIDIOC_TRY_ENCODER_CMD" },
+		{ VIDIOC_DBG_S_REGISTER,    "VIDIOC_DBG_S_REGISTER" },
+		{ VIDIOC_DBG_G_REGISTER,    "VIDIOC_DBG_G_REGISTER" },
+		{ VIDIOC_S_HW_FREQ_SEEK,    "VIDIOC_S_HW_FREQ_SEEK" },
+		{ VIDIOC_S_DV_TIMINGS,    "VIDIOC_S_DV_TIMINGS" },
+		{ VIDIOC_G_DV_TIMINGS,    "VIDIOC_G_DV_TIMINGS" },
+		{ VIDIOC_DQEVENT,    "VIDIOC_DQEVENT" },
+		{ VIDIOC_SUBSCRIBE_EVENT,    "VIDIOC_SUBSCRIBE_EVENT" },
+		{ VIDIOC_UNSUBSCRIBE_EVENT,    "VIDIOC_UNSUBSCRIBE_EVENT" },
+		{ VIDIOC_CREATE_BUFS,    "VIDIOC_CREATE_BUFS" },
+		{ VIDIOC_PREPARE_BUF,    "VIDIOC_PREPARE_BUF" },
+		{ VIDIOC_G_SELECTION,    "VIDIOC_G_SELECTION" },
+		{ VIDIOC_S_SELECTION,    "VIDIOC_S_SELECTION" },
+		{ VIDIOC_DECODER_CMD,    "VIDIOC_DECODER_CMD" },
+		{ VIDIOC_TRY_DECODER_CMD,    "VIDIOC_TRY_DECODER_CMD" },
+		{ VIDIOC_ENUM_DV_TIMINGS,    "VIDIOC_ENUM_DV_TIMINGS" },
+		{ VIDIOC_QUERY_DV_TIMINGS,    "VIDIOC_QUERY_DV_TIMINGS" },
+		{ VIDIOC_DV_TIMINGS_CAP,    "VIDIOC_DV_TIMINGS_CAP" },
+		{ VIDIOC_ENUM_FREQ_BANDS,    "VIDIOC_ENUM_FREQ_BANDS" },
+		{ VIDIOC_DBG_G_CHIP_INFO,    "VIDIOC_DBG_G_CHIP_INFO" },
+		{ VIDIOC_QUERY_EXT_CTRL,    "VIDIOC_QUERY_EXT_CTRL" },
+		{ BASE_VIDIOC_PRIVATE,    "BASE_VIDIOC_PRIVATE" },
+		{ 0, nullptr }
+	};
+	return val2s(request, defs);
+}
+
+std::string ioctl2s_media(unsigned long request)
+{
+	static constexpr definition defs[] = {
+		{ MEDIA_IOC_DEVICE_INFO,    "MEDIA_IOC_DEVICE_INFO" },
+		{ MEDIA_IOC_ENUM_ENTITIES,    "MEDIA_IOC_ENUM_ENTITIES" },
+		{ MEDIA_IOC_ENUM_LINKS,    "MEDIA_IOC_ENUM_LINKS" },
+		{ MEDIA_IOC_SETUP_LINK,    "MEDIA_IOC_SETUP_LINK" },
+		{ MEDIA_IOC_G_TOPOLOGY,    "MEDIA_IOC_G_TOPOLOGY" },
+		{ MEDIA_IOC_REQUEST_ALLOC,    "MEDIA_IOC_REQUEST_ALLOC" },
+		{ MEDIA_REQUEST_IOC_QUEUE,    "MEDIA_REQUEST_IOC_QUEUE" },
+		{ MEDIA_REQUEST_IOC_REINIT,    "MEDIA_REQUEST_IOC_REINIT" },
+		{ 0, nullptr }
+	};
+	return val2s(request, defs);
+}
+
+std::string ctrltype2s(__u32 val)
+{
+	static constexpr definition defs[] = {
+		{ V4L2_CTRL_TYPE_INTEGER,    "V4L2_CTRL_TYPE_INTEGER" },
+		{ V4L2_CTRL_TYPE_BOOLEAN,    "V4L2_CTRL_TYPE_BOOLEAN" },
+		{ V4L2_CTRL_TYPE_MENU,    "V4L2_CTRL_TYPE_MENU" },
+		{ V4L2_CTRL_TYPE_BUTTON,    "V4L2_CTRL_TYPE_BUTTON" },
+		{ V4L2_CTRL_TYPE_INTEGER64,    "V4L2_CTRL_TYPE_INTEGER64" },
+		{ V4L2_CTRL_TYPE_CTRL_CLASS,    "V4L2_CTRL_TYPE_CTRL_CLASS" },
+		{ V4L2_CTRL_TYPE_STRING,    "V4L2_CTRL_TYPE_STRING" },
+		{ V4L2_CTRL_TYPE_BITMASK,    "V4L2_CTRL_TYPE_BITMASK" },
+		{ V4L2_CTRL_TYPE_INTEGER_MENU,    "V4L2_CTRL_TYPE_INTEGER_MENU" },
+		{ V4L2_CTRL_COMPOUND_TYPES,    "V4L2_CTRL_COMPOUND_TYPES" },
+		{ V4L2_CTRL_TYPE_U8,    "V4L2_CTRL_TYPE_U8" },
+		{ V4L2_CTRL_TYPE_U16,    "V4L2_CTRL_TYPE_U16" },
+		{ V4L2_CTRL_TYPE_U32,    "V4L2_CTRL_TYPE_U32" },
+		{ V4L2_CTRL_TYPE_AREA,    "V4L2_CTRL_TYPE_AREA" },
+		{ V4L2_CTRL_TYPE_HDR10_CLL_INFO,    "V4L2_CTRL_TYPE_HDR10_CLL_INFO" },
+		{ V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY,    "V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY" },
+		{ V4L2_CTRL_TYPE_H264_SPS,    "V4L2_CTRL_TYPE_H264_SPS" },
+		{ V4L2_CTRL_TYPE_H264_PPS,    "V4L2_CTRL_TYPE_H264_PPS" },
+		{ V4L2_CTRL_TYPE_H264_SCALING_MATRIX,    "V4L2_CTRL_TYPE_H264_SCALING_MATRIX" },
+		{ V4L2_CTRL_TYPE_H264_SLICE_PARAMS,    "V4L2_CTRL_TYPE_H264_SLICE_PARAMS" },
+		{ V4L2_CTRL_TYPE_H264_DECODE_PARAMS,    "V4L2_CTRL_TYPE_H264_DECODE_PARAMS" },
+		{ V4L2_CTRL_TYPE_H264_PRED_WEIGHTS,    "V4L2_CTRL_TYPE_H264_PRED_WEIGHTS" },
+		{ V4L2_CTRL_TYPE_FWHT_PARAMS,    "V4L2_CTRL_TYPE_FWHT_PARAMS" },
+		{ V4L2_CTRL_TYPE_VP8_FRAME,    "V4L2_CTRL_TYPE_VP8_FRAME" },
+		{ V4L2_CTRL_TYPE_MPEG2_QUANTISATION,    "V4L2_CTRL_TYPE_MPEG2_QUANTISATION" },
+		{ V4L2_CTRL_TYPE_MPEG2_SEQUENCE,    "V4L2_CTRL_TYPE_MPEG2_SEQUENCE" },
+		{ V4L2_CTRL_TYPE_MPEG2_PICTURE,    "V4L2_CTRL_TYPE_MPEG2_PICTURE" },
+		{ V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR,    "V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR" },
+		{ V4L2_CTRL_TYPE_VP9_FRAME,    "V4L2_CTRL_TYPE_VP9_FRAME" },
+		{ 0, nullptr }
+	};
+	return val2s(val, defs);
+}
+
+std::string capflag2s(unsigned long cap)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_CAP_VIDEO_M2M_MPLANE,    "V4L2_CAP_VIDEO_M2M_MPLANE" },
+		{ V4L2_CAP_VIDEO_CAPTURE, "V4L2_CAP_VIDEO_CAPTURE" },
+		{ V4L2_CAP_VIDEO_OUTPUT, "V4L2_CAP_VIDEO_OUTPUT" },
+		{ V4L2_CAP_VIDEO_OVERLAY, "V4L2_CAP_VIDEO_OVERLAY" },
+		{ V4L2_CAP_VBI_CAPTURE, "V4L2_CAP_VBI_CAPTURE" },
+		{ V4L2_CAP_VBI_OUTPUT, "V4L2_CAP_VBI_OUTPUT" },
+		{ V4L2_CAP_SLICED_VBI_CAPTURE, "V4L2_CAP_SLICED_VBI_CAPTURE" },
+		{ V4L2_CAP_SLICED_VBI_OUTPUT, "V4L2_CAP_SLICED_VBI_OUTPUT" },
+		{ V4L2_CAP_RDS_CAPTURE, "V4L2_CAP_RDS_CAPTURE" },
+		{ V4L2_CAP_VIDEO_OUTPUT_OVERLAY, "V4L2_CAP_VIDEO_OUTPUT_OVERLAY" },
+		{ V4L2_CAP_HW_FREQ_SEEK, "V4L2_CAP_HW_FREQ_SEEK" },
+		{ V4L2_CAP_RDS_OUTPUT, "V4L2_CAP_RDS_OUTPUT" },
+		{ V4L2_CAP_VIDEO_CAPTURE_MPLANE, "V4L2_CAP_VIDEO_CAPTURE_MPLANE" },
+		{ V4L2_CAP_VIDEO_OUTPUT_MPLANE, "V4L2_CAP_VIDEO_OUTPUT_MPLANE" },
+		{ V4L2_CAP_VIDEO_M2M_MPLANE, "V4L2_CAP_VIDEO_M2M_MPLANE" },
+		{ V4L2_CAP_VIDEO_M2M, "V4L2_CAP_VIDEO_M2M" },
+		{ V4L2_CAP_TUNER, "V4L2_CAP_TUNER" },
+		{ V4L2_CAP_AUDIO, "V4L2_CAP_AUDIO" },
+		{ V4L2_CAP_RADIO, "V4L2_CAP_RADIO" },
+		{ V4L2_CAP_MODULATOR, "V4L2_CAP_MODULATOR" },
+		{ V4L2_CAP_SDR_CAPTURE, "V4L2_CAP_SDR_CAPTURE" },
+		{ V4L2_CAP_EXT_PIX_FORMAT, "V4L2_CAP_EXT_PIX_FORMAT" },
+		{ V4L2_CAP_SDR_OUTPUT, "V4L2_CAP_SDR_OUTPUT" },
+		{ V4L2_CAP_META_CAPTURE, "V4L2_CAP_META_CAPTURE" },
+		{ V4L2_CAP_READWRITE, "V4L2_CAP_READWRITE" },
+		{ V4L2_CAP_ASYNCIO, "V4L2_CAP_ASYNCIO" },
+		{ V4L2_CAP_STREAMING, "V4L2_CAP_STREAMING" },
+		{ V4L2_CAP_META_OUTPUT, "V4L2_CAP_META_OUTPUT" },
+		{ V4L2_CAP_TOUCH, "V4L2_CAP_TOUCH" },
+		{ V4L2_CAP_IO_MC, "V4L2_CAP_IO_MC" },
+		{ V4L2_CAP_DEVICE_CAPS, "V4L2_CAP_DEVICE_CAPS" },
+		{ 0, nullptr }
+	};
+	return flags2s(cap, def);
+}
+
+std::string bufsyncflag2s(unsigned long flag)
+{
+	static constexpr flag_def def[] = {
+		{ DMA_BUF_SYNC_READ , "DMA_BUF_SYNC_READ " },
+		{ DMA_BUF_SYNC_WRITE, "DMA_BUF_SYNC_WRITE" },
+		{ DMA_BUF_SYNC_RW , "DMA_BUF_SYNC_RW " },
+		{ DMA_BUF_SYNC_START , "DMA_BUF_SYNC_START" },
+		{ DMA_BUF_SYNC_END, "DMA_BUF_SYNC_END" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string vp8_segment_flag2s(unsigned long flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_VP8_SEGMENT_FLAG_ENABLED, "V4L2_VP8_SEGMENT_FLAG_ENABLED" },
+		{ V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP, "V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP" },
+		{ V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA, "V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA" },
+		{ V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE, "V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string vp8_loop_filter_flag2s(unsigned long flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_VP8_LF_ADJ_ENABLE, "V4L2_VP8_LF_ADJ_ENABLE" },
+		{ V4L2_VP8_LF_DELTA_UPDATE, "V4L2_VP8_LF_DELTA_UPDATE" },
+		{ V4L2_VP8_LF_FILTER_TYPE_SIMPLE, "V4L2_VP8_LF_FILTER_TYPE_SIMPLE" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string vp8_frame_flag2s(unsigned long flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_VP8_FRAME_FLAG_KEY_FRAME, "V4L2_VP8_FRAME_FLAG_KEY_FRAME" },
+		{ V4L2_VP8_FRAME_FLAG_EXPERIMENTAL, "V4L2_VP8_FRAME_FLAG_EXPERIMENTAL" },
+		{ V4L2_VP8_FRAME_FLAG_SHOW_FRAME, "V4L2_VP8_FRAME_FLAG_SHOW_FRAME" },
+		{ V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF, "V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF" },
+		{ V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN, "V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN" },
+		{ V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT, "V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string ver2s(unsigned int version)
+{
+	char buf[16];
+	sprintf(buf, "%d.%d.%d", version >> 16, (version >> 8) & 0xff, version & 0xff);
+	return buf;
+}
+
+std::string which2s(unsigned long which)
+{
+	std::string s = "unknown";
+
+	switch (which) {
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		s = "V4L2_CTRL_WHICH_CUR_VAL";
+		break;
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		s= "V4L2_CTRL_WHICH_DEF_VAL";
+		break;
+	case V4L2_CTRL_WHICH_REQUEST_VAL:
+		s = "V4L2_CTRL_WHICH_REQUEST_VAL";
+		break;
+	default:
+		break;
+	}
+
+	return s;
+}
+
+std::string ctrlclass2s(__u32 id)
+{
+	static constexpr definition defs[] = {
+		{ V4L2_CTRL_CLASS_USER, "V4L2_CTRL_CLASS_USER" },
+		{ V4L2_CTRL_CLASS_CODEC,	"V4L2_CTRL_CLASS_CODEC" },
+		{ V4L2_CTRL_CLASS_CAMERA, "V4L2_CTRL_CLASS_CAMERA" },
+		{ V4L2_CTRL_CLASS_FM_TX, "V4L2_CTRL_CLASS_FM_TX" },
+		{ V4L2_CTRL_CLASS_FLASH, "V4L2_CTRL_CLASS_FLASH" },
+		{ V4L2_CTRL_CLASS_JPEG,	"V4L2_CTRL_CLASS_JPEG" },
+		{ V4L2_CTRL_CLASS_IMAGE_SOURCE,	"V4L2_CTRL_CLASS_IMAGE_SOURCE" },
+		{ V4L2_CTRL_CLASS_IMAGE_PROC, "V4L2_CTRL_CLASS_IMAGE_PROC" },
+		{ V4L2_CTRL_CLASS_DV, "V4L2_CTRL_CLASS_DV" },
+		{ V4L2_CTRL_CLASS_FM_RX, "V4L2_CTRL_CLASS_FM_RX" },
+		{ V4L2_CTRL_CLASS_RF_TUNER, "V4L2_CTRL_CLASS_RF_TUNER" },
+		{ V4L2_CTRL_CLASS_DETECT, "V4L2_CTRL_CLASS_DETECT" },
+		{ V4L2_CTRL_CLASS_CODEC_STATELESS, "V4L2_CTRL_CLASS_CODEC_STATELESS" },
+		{ V4L2_CTRL_CLASS_COLORIMETRY, "V4L2_CTRL_CLASS_COLORIMETRY" },
+		{ 0, nullptr }
+	};
+	return val2s(id & 0xff0000, defs);
+}
+
+std::string request_buffers_flag2s(unsigned int flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_MEMORY_FLAG_NON_COHERENT, "V4L2_MEMORY_FLAG_NON_COHERENT" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string v4l2_memory2s(__u32 id)
+{
+	static constexpr definition defs[] = {
+		{ V4L2_MEMORY_MMAP, "V4L2_MEMORY_MMAP" },
+		{ V4L2_MEMORY_USERPTR, "V4L2_MEMORY_USERPTR" },
+		{ V4L2_MEMORY_OVERLAY, "V4L2_MEMORY_OVERLAY" },
+		{ V4L2_MEMORY_DMABUF, "V4L2_MEMORY_DMABUF" },
+		{ 0, nullptr }
+	};
+	return val2s(id, defs);
+}
+
+std::string tc_type2s(__u32 id)
+{
+	static constexpr definition defs[] = {
+		{ V4L2_TC_TYPE_24FPS, "V4L2_TC_TYPE_24FPS" },
+		{ V4L2_TC_TYPE_25FPS, "V4L2_TC_TYPE_25FPS" },
+		{ V4L2_TC_TYPE_30FPS, "V4L2_TC_TYPE_30FPS" },
+		{ V4L2_TC_TYPE_50FPS, "V4L2_TC_TYPE_50FPS" },
+		{ V4L2_TC_TYPE_60FPS, "V4L2_TC_TYPE_60FPS" },
+		{ 0, nullptr }
+	};
+	return val2s(id, defs);
+}
+
+std::string tc_flag2s(unsigned int flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_TC_FLAG_DROPFRAME, "V4L2_TC_FLAG_DROPFRAME" },
+		{ V4L2_TC_FLAG_COLORFRAME, "V4L2_TC_FLAG_COLORFRAME" },
+		{ V4L2_TC_USERBITS_field, "V4L2_TC_USERBITS_field" },
+		{ V4L2_TC_USERBITS_USERDEFINED, "V4L2_TC_USERBITS_USERDEFINED" },
+		{ V4L2_TC_USERBITS_8BITCHARS, "V4L2_TC_USERBITS_8BITCHARS" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
diff --git a/utils/tracer/trace-info.h b/utils/tracer/trace-info.h
new file mode 100644
index 00000000..4c06190a
--- /dev/null
+++ b/utils/tracer/trace-info.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_INFO_H
+#define TRACE_INFO_H
+
+#include <cstring>
+#include <linux/videodev2.h>
+#include <linux/media.h>
+#include <linux/dma-buf.h>
+
+#define ARRAY_SIZE(array)	(sizeof(array) / sizeof((array)[0]))
+
+enum LIBTRACER_SYSCALL {
+	LIBTRACER_SYSCALL_IOCTL,
+	LIBTRACER_SYSCALL_OPEN,
+	LIBTRACER_SYSCALL_OPEN64,
+	LIBTRACER_SYSCALL_CLOSE,
+	LIBTRACER_SYSCALL_MMAP64,
+	LIBTRACER_SYSCALL_MUNMAP,
+	LIBTRACER_SYSCALL_SELECT,
+	LIBTRACER_SYSCALL_POLL,
+};
+
+/* Convert an ioctl request of type 'V' to string. */
+std::string ioctl2s_video(unsigned long request);
+
+/* Convert an ioctl request of type '|' to string. */
+std::string ioctl2s_media(unsigned long request);
+
+/* Convert capability flags to common separated string. */
+std::string capflag2s(unsigned long cap);
+
+/* Convert a decimal number to a string with kernel_version.major_revision.minor_revision. */
+std::string ver2s(unsigned int version);
+
+/* Convert v4l2_ext_controls member "which" to string. */
+std::string which2s(unsigned long which);
+
+/* Convert control class to string. */
+std::string ctrlclass2s(__u32 id);
+
+/* Convert control type to string. */
+std::string ctrltype2s(__u32 type);
+
+/* Convert struct dma_buf_sync flags to string. */
+std::string bufsyncflag2s(unsigned long flag);
+
+/* Convert v4l2_vp8_segment flags to string. */
+std::string vp8_segment_flag2s(unsigned long flag);
+
+/* Convert v4l2_vp8_loop_filter flags to string. */
+std::string vp8_loop_filter_flag2s(unsigned long flag);
+
+/* Convert v4l2_ctrl_vp8_frame flags to string. */
+std::string vp8_frame_flag2s(unsigned long flag);
+
+/* Convert v4l2_requestbuffers flags to string. */
+std::string request_buffers_flag2s(unsigned int flag);
+
+/* Convert enum v4l2_memory type to string. */
+std::string v4l2_memory2s(__u32 id);
+
+/* Convert v4l2_timecode type to string. */
+std::string tc_type2s(__u32 id);
+
+/* Convert v4l2_timecode flags to string. */
+std::string tc_flag2s(unsigned int flag);
+
+#endif
diff --git a/utils/tracer/trace-vp8.cpp b/utils/tracer/trace-vp8.cpp
new file mode 100644
index 00000000..a0a8ccdd
--- /dev/null
+++ b/utils/tracer/trace-vp8.cpp
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
+
+json_object *trace_v4l2_vp8_segment(struct v4l2_vp8_segment segment)
+{
+	json_object *vp8_segment_obj = json_object_new_object();
+
+	/* __s8 quant_update[4] */
+	json_object *quant_update_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(segment.quant_update); i++)
+		json_object_array_add(quant_update_obj, json_object_new_int(segment.quant_update[i]));
+	json_object_object_add(vp8_segment_obj, "quant_update", quant_update_obj);
+
+	/* __s8 lf_update[4] */
+	json_object *lf_update_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(segment.lf_update); i++)
+		json_object_array_add(lf_update_obj, json_object_new_int(segment.lf_update[i]));
+	json_object_object_add(vp8_segment_obj, "lf_update", lf_update_obj);
+
+	/* __u8 segment_probs[3] */
+	json_object *segment_probs_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(segment.segment_probs); i++)
+		json_object_array_add(segment_probs_obj, json_object_new_int(segment.segment_probs[i]));
+	json_object_object_add(vp8_segment_obj, "segment_probs", segment_probs_obj);
+
+	json_object_object_add(vp8_segment_obj, "padding", json_object_new_int(segment.padding));
+	json_object_object_add(vp8_segment_obj, "flags", json_object_new_int(segment.flags));
+	json_object_object_add(vp8_segment_obj, "flags_str",
+						   json_object_new_string(vp8_segment_flag2s(segment.flags).c_str()));
+
+	return vp8_segment_obj;
+}
+
+json_object *trace_v4l2_vp8_loop_filter(struct v4l2_vp8_loop_filter lf)
+{
+	json_object *vp8_loop_filter_obj = json_object_new_object();
+
+	/* 	__s8 ref_frm_delta[4] */
+	json_object *ref_frm_delta_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(lf.ref_frm_delta); i++)
+		json_object_array_add(ref_frm_delta_obj, json_object_new_int(lf.ref_frm_delta[i]));
+	json_object_object_add(vp8_loop_filter_obj, "ref_frm_delta", ref_frm_delta_obj);
+
+	/* 	__s8 mb_mode_delta[4] */
+	json_object *mb_mode_delta_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(lf.mb_mode_delta); i++)
+		json_object_array_add(mb_mode_delta_obj, json_object_new_int(lf.mb_mode_delta[i]));
+	json_object_object_add(vp8_loop_filter_obj, "mb_mode_delta", mb_mode_delta_obj);
+
+	json_object_object_add(vp8_loop_filter_obj, "sharpness_level", json_object_new_int(lf.sharpness_level));
+	json_object_object_add(vp8_loop_filter_obj, "level", json_object_new_int(lf.level));
+	json_object_object_add(vp8_loop_filter_obj, "padding", json_object_new_int(lf.padding));
+	json_object_object_add(vp8_loop_filter_obj, "flags", json_object_new_int(lf.flags));
+	json_object_object_add(vp8_loop_filter_obj, "flags_str", json_object_new_string(vp8_loop_filter_flag2s(lf.flags).c_str()));
+
+	return vp8_loop_filter_obj;
+}
+
+json_object *trace_v4l2_vp8_quantization(struct v4l2_vp8_quantization quant)
+{
+	json_object *vp8_quantization_obj = json_object_new_object();
+
+	json_object_object_add(vp8_quantization_obj, "y_ac_qi", json_object_new_int(quant.y_ac_qi));
+	json_object_object_add(vp8_quantization_obj, "y_dc_delta", json_object_new_int(quant.y_dc_delta));
+	json_object_object_add(vp8_quantization_obj, "y2_dc_delta", json_object_new_int(quant.y2_dc_delta));
+	json_object_object_add(vp8_quantization_obj, "y2_ac_delta", json_object_new_int(quant.y2_ac_delta));
+	json_object_object_add(vp8_quantization_obj, "uv_dc_delta", json_object_new_int(quant.uv_dc_delta));
+	json_object_object_add(vp8_quantization_obj, "uv_ac_delta", json_object_new_int(quant.uv_ac_delta));
+	json_object_object_add(vp8_quantization_obj, "padding", json_object_new_int(quant.padding));
+
+	return vp8_quantization_obj;
+}
+
+json_object *trace_v4l2_vp8_entropy(struct v4l2_vp8_entropy entropy)
+{
+	json_object *vp8_entropy_obj = json_object_new_object();
+
+	/*__u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT] */
+	json_object *coeff_probs_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.coeff_probs); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(entropy.coeff_probs[0]); j++)
+			for (size_t k = 0; k < ARRAY_SIZE(entropy.coeff_probs[0][0]); k++)
+				for (size_t l = 0; l < V4L2_VP8_COEFF_PROB_CNT; l++)
+					json_object_array_add(coeff_probs_obj,
+					                      json_object_new_int(entropy.coeff_probs[i][j][k][l]));
+	json_object_object_add(vp8_entropy_obj, "coeff_probs", coeff_probs_obj);
+
+	/* __u8 y_mode_probs[4] */
+	json_object *y_mode_probs_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.y_mode_probs); i++)
+		json_object_array_add(y_mode_probs_obj, json_object_new_int(entropy.y_mode_probs[i]));
+	json_object_object_add(vp8_entropy_obj, "y_mode_probs", y_mode_probs_obj);
+
+	/* __u8 uv_mode_probs[3] */
+	json_object *uv_mode_probs_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.uv_mode_probs); i++)
+		json_object_array_add(uv_mode_probs_obj, json_object_new_int(entropy.uv_mode_probs[i]));
+	json_object_object_add(vp8_entropy_obj, "uv_mode_probs", uv_mode_probs_obj);
+
+	/* __u8 mv_probs[2][V4L2_VP8_MV_PROB_CNT] */
+	json_object *mv_probs_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.mv_probs); i++)
+		for (size_t j = 0; j < V4L2_VP8_MV_PROB_CNT; j++)
+			json_object_array_add(mv_probs_obj, json_object_new_int(entropy.mv_probs[i][j]));
+	json_object_object_add(vp8_entropy_obj, "mv_probs", mv_probs_obj);
+
+	/*__u8 padding[3] */
+	json_object *padding_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(entropy.padding); i++)
+		json_object_array_add(padding_obj, json_object_new_int(entropy.padding[i]));
+	json_object_object_add(vp8_entropy_obj, "padding", padding_obj);
+
+	return vp8_entropy_obj;
+}
+
+json_object *trace_v4l2_vp8_entropy_coder_state(struct v4l2_vp8_entropy_coder_state coder_state)
+{
+	json_object *vp8_entropy_coder_state_obj = json_object_new_object();
+
+	json_object_object_add(vp8_entropy_coder_state_obj, "range", json_object_new_int(coder_state.range));
+	json_object_object_add(vp8_entropy_coder_state_obj, "value", json_object_new_int(coder_state.value));
+	json_object_object_add(vp8_entropy_coder_state_obj, "bit_count", json_object_new_int(coder_state.bit_count));
+	json_object_object_add(vp8_entropy_coder_state_obj, "padding", json_object_new_int(coder_state.padding));
+
+	return vp8_entropy_coder_state_obj;
+}
+
+void trace_v4l2_ctrl_vp8_frame(void *p_vp8_frame, json_object *ctrl_obj)
+{
+	json_object *vp8_frame_obj = json_object_new_object();
+	struct v4l2_ctrl_vp8_frame *vp8_frame = static_cast<struct v4l2_ctrl_vp8_frame*>(p_vp8_frame);
+
+	/* struct v4l2_vp8_segment segment */
+	json_object *v4l2_vp8_segment_obj = trace_v4l2_vp8_segment(vp8_frame->segment);
+	json_object_object_add(vp8_frame_obj, "segment", v4l2_vp8_segment_obj);
+
+	/* struct v4l2_vp8_loop_filter lf */
+	json_object *v4l2_vp8_loop_filter_obj = trace_v4l2_vp8_loop_filter(vp8_frame->lf);
+	json_object_object_add(vp8_frame_obj, "lf", v4l2_vp8_loop_filter_obj);
+
+	/* struct v4l2_vp8_quantization quant */
+	json_object *v4l2_vp8_quantization_obj = trace_v4l2_vp8_quantization(vp8_frame->quant);
+	json_object_object_add(vp8_frame_obj, "quant", v4l2_vp8_quantization_obj);
+
+	/* struct v4l2_vp8_entropy entropy */
+	json_object *v4l2_vp8_entropy_obj = trace_v4l2_vp8_entropy(vp8_frame->entropy);
+	json_object_object_add(vp8_frame_obj, "entropy", v4l2_vp8_entropy_obj);
+
+	/* struct v4l2_vp8_entropy_coder_state coder_state */
+	json_object *v4l2_vp8_entropy_coder_state_obj = trace_v4l2_vp8_entropy_coder_state(vp8_frame->coder_state);
+	json_object_object_add(vp8_frame_obj, "coder_state", v4l2_vp8_entropy_coder_state_obj);
+
+	json_object_object_add(vp8_frame_obj, "width", json_object_new_int(vp8_frame->width));
+	json_object_object_add(vp8_frame_obj, "height", json_object_new_int(vp8_frame->height));
+	json_object_object_add(vp8_frame_obj, "horizontal_scale", json_object_new_int(vp8_frame->horizontal_scale));
+	json_object_object_add(vp8_frame_obj, "vertical_scale", json_object_new_int(vp8_frame->vertical_scale));
+	json_object_object_add(vp8_frame_obj, "version", json_object_new_int(vp8_frame->version));
+	json_object_object_add(vp8_frame_obj, "prob_skip_false", json_object_new_int(vp8_frame->prob_skip_false));
+	json_object_object_add(vp8_frame_obj, "prob_intra", json_object_new_int(vp8_frame->prob_intra));
+	json_object_object_add(vp8_frame_obj, "prob_last", json_object_new_int(vp8_frame->prob_last));
+	json_object_object_add(vp8_frame_obj, "prob_gf", json_object_new_int(vp8_frame->prob_gf));
+	json_object_object_add(vp8_frame_obj, "num_dct_parts", json_object_new_int(vp8_frame->num_dct_parts));
+	json_object_object_add(vp8_frame_obj, "first_part_size", json_object_new_int(vp8_frame->first_part_size));
+	json_object_object_add(vp8_frame_obj, "first_part_header_bits", json_object_new_int(vp8_frame->first_part_header_bits));
+
+	/* __u32 dct_part_sizes[8] */
+	json_object *dct_part_sizes_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(vp8_frame->dct_part_sizes); i++)
+		json_object_array_add(dct_part_sizes_obj, json_object_new_int(vp8_frame->dct_part_sizes[i]));
+	json_object_object_add(vp8_frame_obj, "dct_part_sizes", dct_part_sizes_obj);
+
+	json_object_object_add(vp8_frame_obj, "last_frame_ts", json_object_new_int(vp8_frame->last_frame_ts));
+	json_object_object_add(vp8_frame_obj, "golden_frame_ts", json_object_new_int(vp8_frame->golden_frame_ts));
+	json_object_object_add(vp8_frame_obj, "alt_frame_ts", json_object_new_int(vp8_frame->alt_frame_ts));
+	json_object_object_add(vp8_frame_obj, "flags", json_object_new_int(vp8_frame->flags));
+	json_object_object_add(vp8_frame_obj, "flags_str", json_object_new_string(vp8_frame_flag2s(vp8_frame->flags).c_str()));
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_vp8_frame", vp8_frame_obj);
+}
diff --git a/utils/tracer/trace.cpp b/utils/tracer/trace.cpp
new file mode 100644
index 00000000..5e952a7b
--- /dev/null
+++ b/utils/tracer/trace.cpp
@@ -0,0 +1,520 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
+
+json_object *trace_open(const char *path, int oflag, mode_t mode)
+{
+	json_object *open_args = json_object_new_object();
+
+	json_object_object_add(open_args, "path", json_object_new_string(path));
+	json_object_object_add(open_args, "oflag", json_object_new_int(oflag));
+	json_object_object_add(open_args, "mode", json_object_new_uint64(mode));
+
+	return open_args;
+}
+
+json_object *trace_mmap64(void *addr, size_t len, int prot, int flags, int fildes, off_t off)
+{
+	json_object *mmap_args = json_object_new_object();
+
+	json_object_object_add(mmap_args, "addr", json_object_new_int64((int64_t)addr));
+	json_object_object_add(mmap_args, "len", json_object_new_uint64(len));
+	json_object_object_add(mmap_args, "prot", json_object_new_int(prot));
+	json_object_object_add(mmap_args, "flags", json_object_new_int(flags));
+	json_object_object_add(mmap_args, "fildes", json_object_new_int(fildes));
+	json_object_object_add(mmap_args, "off", json_object_new_int64(off));
+
+	return mmap_args;
+}
+
+/*
+ * Get a buffer from memory and convert it to a json string array.
+ * The bytes are displayed with the most-significant bits first.
+ */
+json_object *trace_buffer(unsigned char *buffer_pointer, __u32 bytesused)
+{
+	char buf[5];
+	std::string s;
+	int byte_count_per_line = 0;
+	json_object *mem_array_obj = json_object_new_array();
+
+	for (__u32 i = 0; i < bytesused; i++) {
+		memset(buf, 0, sizeof(buf));
+
+		/* Each byte e.g. D9 will write a string of two characters "D9". */
+		sprintf(buf, "%02x", buffer_pointer[i]);
+		s += buf;
+		byte_count_per_line++;
+
+		/*  Add a space every two bytes e.g. "012A 4001" and a newline every 16 bytes. */
+		if (byte_count_per_line == 16) {
+			byte_count_per_line = 0;
+			json_object_array_add(mem_array_obj, json_object_new_string(s.c_str()));
+			s.clear();
+		} else if (i % 2) {
+			s += " ";
+		}
+	}
+
+	/* Trace the last line if it was less than a full 16 bytes. */
+	if (byte_count_per_line)
+		json_object_array_add(mem_array_obj, json_object_new_string(s.c_str()));
+
+	return mem_array_obj;
+}
+
+/* Get the decoded capture buffer from memory and write it to a binary yuv file. */
+void write_decoded_frames_to_yuv_file(unsigned char *buffer_pointer, __u32 bytesused, std::string filename)
+{
+	FILE *fp = fopen(filename.c_str(), "a");
+	for (__u32 i = 0; i < bytesused; i++)
+		fwrite(&buffer_pointer[i], sizeof(unsigned char), 1, fp);
+	fflush(fp);
+	fclose(fp);
+}
+
+/* Trace an output or capture buffer. */
+void trace_mem(int fd)
+{
+	int index;
+	__u32 type;
+	__u32 bytesused;
+	unsigned char *buffer_pointer;
+	long int start = get_buffer_address_trace(fd);
+
+	/* Don't trace unmapped memory. */
+	if (!start)
+		return;
+
+	buffer_pointer = (unsigned char*) start;
+	type = get_buffer_type_trace(fd);
+	index = get_buffer_index_trace(fd);
+	bytesused = get_buffer_bytesused_trace(fd);
+
+	json_object *mem_obj = json_object_new_object();
+	json_object_object_add(mem_obj, "mem_dump", json_object_new_string(buftype2s(type).c_str()));
+	json_object_object_add(mem_obj, "fd", json_object_new_int(fd));
+	json_object_object_add(mem_obj, "type", json_object_new_uint64(type));
+	json_object_object_add(mem_obj, "index", json_object_new_int(index));
+	json_object_object_add(mem_obj, "bytesused", json_object_new_uint64(bytesused));
+	json_object_object_add(mem_obj, "address", json_object_new_int64(start));
+
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		json_object *mem_array_obj = trace_buffer(buffer_pointer, bytesused);
+		json_object_object_add(mem_obj, "mem_array", mem_array_obj);
+	}
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+
+		if (create_yuv_file()) {
+			std::string filename = getenv("TRACE_ID");
+			filename +=  ".yuv";
+			write_decoded_frames_to_yuv_file(buffer_pointer, bytesused, filename);
+			json_object_object_add(mem_obj, "filename", json_object_new_string(filename.c_str()));
+		}
+
+		if (write_decoded_data_to_json()) {
+			json_object *mem_array_obj = trace_buffer(buffer_pointer, bytesused);
+			json_object_object_add(mem_obj, "mem_array_capture", mem_array_obj);
+		}
+
+	}
+
+	if (pretty_print_mem())
+		write_json_object_to_json_file(mem_obj, JSON_C_TO_STRING_PRETTY);
+	else
+		write_json_object_to_json_file(mem_obj);
+
+	json_object_put(mem_obj);
+}
+
+void trace_vidioc_querycap(void *arg, json_object *ioctl_args)
+{
+	json_object *cap_obj = json_object_new_object();
+	struct v4l2_capability *cap = static_cast<struct v4l2_capability*>(arg);
+
+	json_object_object_add(cap_obj, "driver", json_object_new_string((const char *)cap->driver));
+	json_object_object_add(cap_obj, "card", json_object_new_string((const char *)cap->card));
+	json_object_object_add(cap_obj, "bus_info", json_object_new_string((const char *)cap->bus_info));
+	json_object_object_add(cap_obj, "version", json_object_new_string(ver2s(cap->version).c_str()));
+	json_object_object_add(cap_obj, "capabilities", json_object_new_int64(cap->capabilities));
+	json_object_object_add(cap_obj, "capabilities_str",
+		                       json_object_new_string(capflag2s(cap->capabilities).c_str()));
+	json_object_object_add(cap_obj, "device_caps", json_object_new_int64(cap->device_caps));
+	json_object_object_add(ioctl_args, "v4l2_capability", cap_obj);
+}
+
+void trace_vidioc_enum_fmt(void *arg, json_object *ioctl_args)
+{
+	json_object *fmtdesc_obj = json_object_new_object();
+	struct v4l2_fmtdesc *fmtdesc = static_cast<struct v4l2_fmtdesc*>(arg);
+
+	json_object_object_add(fmtdesc_obj, "index", json_object_new_uint64(fmtdesc->index));
+	json_object_object_add(fmtdesc_obj, "type_str", json_object_new_string(buftype2s(fmtdesc->type).c_str()));
+	json_object_object_add(fmtdesc_obj, "type", json_object_new_uint64(fmtdesc->type));
+	json_object_object_add(fmtdesc_obj, "flags", json_object_new_uint64(fmtdesc->flags));
+	json_object_object_add(fmtdesc_obj, "description", json_object_new_string((const char *)fmtdesc->description));
+	json_object_object_add(fmtdesc_obj, "pixelformat", json_object_new_uint64(fmtdesc->pixelformat));
+	json_object_object_add(fmtdesc_obj, "mbus_code", json_object_new_uint64(fmtdesc->mbus_code));
+	json_object_object_add(ioctl_args, "v4l2_fmtdesc", fmtdesc_obj);
+}
+
+void trace_v4l2_plane_pix_format(json_object *pix_mp_obj, struct v4l2_plane_pix_format plane_fmt, int plane)
+{
+	json_object *plane_fmt_obj = json_object_new_object();
+
+	json_object_object_add(plane_fmt_obj, "sizeimage", json_object_new_uint64(plane_fmt.sizeimage));
+	json_object_object_add(plane_fmt_obj, "bytesperline", json_object_new_uint64(plane_fmt.bytesperline));
+
+	/* Create a unique key name for each plane. */
+	std::string unique_key_for_plane = "v4l2_plane_pix_format_";
+	unique_key_for_plane += std::to_string(plane);
+
+	json_object_object_add(pix_mp_obj, unique_key_for_plane.c_str(), plane_fmt_obj);
+}
+
+void trace_v4l2_pix_format_mplane(json_object *format_obj, struct v4l2_pix_format_mplane pix_mp)
+{
+	json_object *pix_mp_obj = json_object_new_object();
+
+	json_object_object_add(pix_mp_obj, "width", json_object_new_uint64(pix_mp.width));
+	json_object_object_add(pix_mp_obj, "height", json_object_new_uint64(pix_mp.height));
+	json_object_object_add(pix_mp_obj, "pixelformat", json_object_new_uint64(pix_mp.pixelformat));
+	json_object_object_add(pix_mp_obj, "pixelformat_str", json_object_new_string(fcc2s(pix_mp.pixelformat).c_str()));
+	json_object_object_add(pix_mp_obj, "field", json_object_new_uint64(pix_mp.field));
+	json_object_object_add(pix_mp_obj, "field_str", json_object_new_string(field2s(pix_mp.field).c_str()));
+	json_object_object_add(pix_mp_obj, "colorspace", json_object_new_uint64(pix_mp.colorspace));
+	json_object_object_add(pix_mp_obj, "colorspace_str", json_object_new_string(colorspace2s(pix_mp.colorspace).c_str()));
+	json_object_object_add(pix_mp_obj, "num_planes", json_object_new_int(pix_mp.num_planes));
+	for (int i = 0; i < pix_mp.num_planes; i++)
+		trace_v4l2_plane_pix_format(pix_mp_obj, pix_mp.plane_fmt[i], i);
+
+	json_object_object_add(pix_mp_obj, "flags", json_object_new_int(pix_mp.flags));
+	json_object_object_add(pix_mp_obj, "flags_str", json_object_new_string(pixflags2s(pix_mp.flags).c_str()));
+	json_object_object_add(pix_mp_obj, "ycbcr_enc", json_object_new_int(pix_mp.ycbcr_enc));
+	json_object_object_add(pix_mp_obj, "ycbcr_enc_str", json_object_new_string(ycbcr_enc2s(pix_mp.ycbcr_enc).c_str()));
+	json_object_object_add(pix_mp_obj, "quantization", json_object_new_int(pix_mp.quantization));
+	json_object_object_add(pix_mp_obj, "quantization_str", json_object_new_string(quantization2s(pix_mp.quantization).c_str()));
+	json_object_object_add(pix_mp_obj, "xfer_func", json_object_new_int(pix_mp.xfer_func));
+	json_object_object_add(pix_mp_obj, "xfer_func_str", json_object_new_string(xfer_func2s(pix_mp.xfer_func).c_str()));
+
+	json_object_object_add(format_obj, "v4l2_pix_format_mplane", pix_mp_obj);
+}
+
+void trace_v4l2_format(void *arg, json_object *ioctl_args)
+{
+	json_object *format_obj = json_object_new_object();
+	struct v4l2_format *format = static_cast<struct v4l2_format*>(arg);
+
+	json_object_object_add(format_obj, "type", json_object_new_uint64(format->type));
+	json_object_object_add(format_obj, "type_str", json_object_new_string(buftype2s(format->type).c_str()));
+
+	switch (format->type) {
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
+		trace_v4l2_pix_format_mplane(format_obj, format->fmt.pix_mp);
+		break;
+	case V4L2_BUF_TYPE_SDR_CAPTURE:
+	case V4L2_BUF_TYPE_SDR_OUTPUT:
+	case V4L2_BUF_TYPE_META_CAPTURE:
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		break;
+	}
+	json_object_object_add(ioctl_args, "v4l2_format", format_obj);
+}
+
+void trace_v4l2_requestbuffers(void *arg, json_object *ioctl_args)
+{
+	json_object *request_buffers_obj = json_object_new_object();
+	struct v4l2_requestbuffers *request_buffers = static_cast<struct v4l2_requestbuffers*>(arg);
+
+	json_object_object_add(request_buffers_obj, "count", json_object_new_uint64(request_buffers->count));
+	json_object_object_add(request_buffers_obj, "type", json_object_new_uint64(request_buffers->type));
+	json_object_object_add(request_buffers_obj, "type_str",
+	                       json_object_new_string(buftype2s(request_buffers->type).c_str()));
+	json_object_object_add(request_buffers_obj, "memory", json_object_new_uint64(request_buffers->memory));
+	json_object_object_add(request_buffers_obj, "memory_str",
+	                       json_object_new_string(v4l2_memory2s(request_buffers->memory).c_str()));
+	json_object_object_add(request_buffers_obj, "capabilities", json_object_new_uint64(request_buffers->capabilities));
+	json_object_object_add(request_buffers_obj, "capabilities_str",
+	                       json_object_new_string(bufcap2s(request_buffers->capabilities).c_str()));
+	json_object_object_add(request_buffers_obj, "flags", json_object_new_int(request_buffers->flags));
+	json_object_object_add(request_buffers_obj, "flags_str",
+						   json_object_new_string(request_buffers_flag2s(request_buffers->flags).c_str()));
+
+	json_object_object_add(ioctl_args, "v4l2_requestbuffers", request_buffers_obj);
+}
+
+json_object *trace_v4l2_plane(struct v4l2_plane *p, __u32 memory)
+{
+	json_object *plane_obj = json_object_new_object();
+
+	json_object_object_add(plane_obj, "bytesused", json_object_new_int64(p->bytesused));
+	json_object_object_add(plane_obj, "length", json_object_new_uint64(p->length));
+
+	json_object *m_obj = json_object_new_object();
+	if (memory == V4L2_MEMORY_MMAP)
+		json_object_object_add(m_obj, "mem_offset", json_object_new_int64(p->m.mem_offset));
+	json_object_object_add(plane_obj, "m", m_obj);
+
+	json_object_object_add(plane_obj, "data_offset", json_object_new_int64(p->data_offset));
+
+	return plane_obj;
+}
+
+void trace_v4l2_buffer(void *arg, json_object *ioctl_args)
+{
+	json_object *buf_obj = json_object_new_object();
+	struct v4l2_buffer *buf = static_cast<struct v4l2_buffer*>(arg);
+
+	json_object_object_add(buf_obj, "index", json_object_new_uint64(buf->index));
+	json_object_object_add(buf_obj, "type", json_object_new_uint64(buf->type));
+	json_object_object_add(buf_obj, "type_str",
+	                       json_object_new_string(buftype2s(buf->type).c_str()));
+	json_object_object_add(buf_obj, "bytesused", json_object_new_uint64(buf->bytesused));
+	json_object_object_add(buf_obj, "flags", json_object_new_uint64(buf->flags));
+	json_object_object_add(buf_obj, "flags_str",
+	                       json_object_new_string(bufferflags2s(buf->flags).c_str()));
+	json_object_object_add(buf_obj, "field", json_object_new_uint64(buf->field));
+
+	json_object *timestamp_obj = json_object_new_object();
+	json_object_object_add(timestamp_obj, "tv_sec", json_object_new_int64(buf->timestamp.tv_sec));
+	json_object_object_add(timestamp_obj, "tv_usec", json_object_new_int64(buf->timestamp.tv_usec));
+	json_object_object_add(buf_obj, "timestamp", timestamp_obj);
+	json_object_object_add(buf_obj, "sequence", json_object_new_uint64(buf->sequence));
+	json_object_object_add(buf_obj, "memory", json_object_new_uint64(buf->memory));
+	json_object_object_add(buf_obj, "memory_str",
+	                       json_object_new_string(v4l2_memory2s(buf->memory).c_str()));
+
+	json_object *m_obj = json_object_new_object();
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+
+		json_object *planes_obj = json_object_new_array();
+		/* TODO tracer only works for decoded formats with one plane e.g. V4L2_PIX_FMT_NV12 */
+		json_object_array_add(planes_obj, trace_v4l2_plane(buf->m.planes, buf->memory));
+		json_object_object_add(m_obj, "planes", planes_obj);
+	}
+	json_object_object_add(buf_obj, "m", m_obj);
+	json_object_object_add(buf_obj, "length", json_object_new_uint64(buf->length));
+
+	/* For memory-to-memory devices you can use requests only for output buffers. */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		json_object_object_add(buf_obj, "request_fd", json_object_new_int(buf->request_fd));
+
+	json_object_object_add(ioctl_args, "v4l2_buffer", buf_obj);
+}
+
+void trace_v4l2_exportbuffer(void *arg, json_object *ioctl_args)
+{
+	json_object *exportbuffer_obj = json_object_new_object();
+	struct v4l2_exportbuffer *export_buffer = static_cast<struct v4l2_exportbuffer*>(arg);
+
+	json_object_object_add(exportbuffer_obj, "type", json_object_new_uint64(export_buffer->type));
+	json_object_object_add(exportbuffer_obj, "type_str",
+	                       json_object_new_string(buftype2s(export_buffer->type).c_str()));
+
+	json_object_object_add(exportbuffer_obj, "index", json_object_new_uint64(export_buffer->index));
+	json_object_object_add(exportbuffer_obj, "plane", json_object_new_uint64(export_buffer->plane));
+	json_object_object_add(exportbuffer_obj, "flags", json_object_new_uint64(export_buffer->flags));
+	json_object_object_add(exportbuffer_obj, "fd", json_object_new_int(export_buffer->fd));
+
+	json_object_object_add(ioctl_args, "v4l2_exportbuffer", exportbuffer_obj);
+}
+
+void trace_vidioc_stream(void *arg, json_object *ioctl_args)
+{
+	v4l2_buf_type buf_type = *(static_cast<v4l2_buf_type*>(arg));
+	json_object_object_add(ioctl_args, "buf_type", json_object_new_int(buf_type));
+	json_object_object_add(ioctl_args, "buf_type_str", json_object_new_string(buftype2s(buf_type).c_str()));
+}
+
+void trace_v4l2_ext_control(json_object *ext_controls_obj, struct v4l2_ext_control ctrl, __u32 control_idx)
+{
+	std::string unique_key_for_control;
+
+	json_object *ctrl_obj = json_object_new_object();
+	json_object_object_add(ctrl_obj, "id", json_object_new_uint64(ctrl.id));
+	json_object_object_add(ctrl_obj, "control_class_str", json_object_new_string(ctrlclass2s(ctrl.id).c_str()));
+	json_object_object_add(ctrl_obj, "size", json_object_new_uint64(ctrl.size));
+
+	if ((ctrl.id & V4L2_CID_CODEC_STATELESS_BASE) == V4L2_CID_CODEC_STATELESS_BASE) {
+		switch (ctrl.id) {
+		case V4L2_CID_STATELESS_VP8_FRAME:
+			trace_v4l2_ctrl_vp8_frame(ctrl.p_vp8_frame, ctrl_obj);
+			break;
+		default:
+			break;
+		}
+	}
+
+	unique_key_for_control = "v4l2_ext_control_";
+	unique_key_for_control += std::to_string(control_idx);
+
+	json_object_object_add(ext_controls_obj, unique_key_for_control.c_str(), ctrl_obj);
+}
+
+void trace_v4l2_ext_controls(void *arg, json_object *ioctl_args)
+{
+	json_object *ext_controls_obj = json_object_new_object();
+	struct v4l2_ext_controls *ext_controls = static_cast<struct v4l2_ext_controls*>(arg);
+
+	json_object_object_add(ext_controls_obj, "which", json_object_new_int64(ext_controls->which));
+	json_object_object_add(ext_controls_obj, "which_str", json_object_new_string(which2s(ext_controls->which).c_str()));
+	json_object_object_add(ext_controls_obj, "count", json_object_new_uint64(ext_controls->count));
+
+	/* error_idx is defined only if the ioctl returned an error  */
+	if (errno)
+		json_object_object_add(ext_controls_obj, "error_idx", json_object_new_uint64(ext_controls->error_idx));
+
+	/* request_fd is only valid when "which" == V4L2_CTRL_WHICH_REQUEST_VAL */
+	if (ext_controls->which == V4L2_CTRL_WHICH_REQUEST_VAL)
+		json_object_object_add(ext_controls_obj, "request_fd", json_object_new_int(ext_controls->request_fd));
+
+	for (__u32 i = 0; i < ext_controls->count; i++)
+		trace_v4l2_ext_control(ext_controls_obj, ext_controls->controls[i], i);
+
+	json_object_object_add(ioctl_args, "v4l2_ext_controls", ext_controls_obj);
+}
+
+void trace_vidioc_query_ext_ctrl(void *arg, json_object *ioctl_args)
+{
+	json_object *query_ext_ctrl_obj = json_object_new_object();
+	struct v4l2_query_ext_ctrl *queryextctrl = static_cast<struct v4l2_query_ext_ctrl*>(arg);
+
+	json_object_object_add(query_ext_ctrl_obj, "id", json_object_new_uint64(queryextctrl->id));
+	json_object_object_add(query_ext_ctrl_obj, "control_class_str", json_object_new_string(ctrlclass2s(queryextctrl->id).c_str()));
+	json_object_object_add(query_ext_ctrl_obj, "type", json_object_new_uint64(queryextctrl->type));
+	json_object_object_add(query_ext_ctrl_obj, "type_str", json_object_new_string(ctrltype2s(queryextctrl->type).c_str()));
+	json_object_object_add(query_ext_ctrl_obj, "name", json_object_new_string(queryextctrl->name));
+	json_object_object_add(query_ext_ctrl_obj, "minimum", json_object_new_int64(queryextctrl->minimum));
+	json_object_object_add(query_ext_ctrl_obj, "maximum", json_object_new_int64(queryextctrl->maximum));
+	json_object_object_add(query_ext_ctrl_obj, "step", json_object_new_uint64(queryextctrl->step));
+	json_object_object_add(query_ext_ctrl_obj, "default_value", json_object_new_int64(queryextctrl->default_value));
+	json_object_object_add(query_ext_ctrl_obj, "flags", json_object_new_uint64(queryextctrl->flags));
+	json_object_object_add(query_ext_ctrl_obj, "flags_str", json_object_new_string(ctrlflags2s(queryextctrl->flags).c_str()));
+	json_object_object_add(query_ext_ctrl_obj, "elem_size", json_object_new_uint64(queryextctrl->elem_size));
+	json_object_object_add(query_ext_ctrl_obj, "elems", json_object_new_uint64(queryextctrl->elems));
+	json_object_object_add(query_ext_ctrl_obj, "nr_of_dims", json_object_new_uint64(queryextctrl->nr_of_dims));
+
+	/* 	__u32   dims[V4L2_CTRL_MAX_DIMS] */
+	json_object *dim_obj = json_object_new_array();
+
+	for (unsigned int i = 0; i < queryextctrl->nr_of_dims; i++)
+		json_object_array_add(dim_obj, json_object_new_uint64(queryextctrl->dims[i]));
+
+	json_object_object_add(query_ext_ctrl_obj, "dims", dim_obj);
+	json_object_object_add(ioctl_args, "v4l2_query_ext_ctrl", query_ext_ctrl_obj);
+}
+
+void trace_ioctl_media(unsigned long request, void *arg, json_object *ioctl_args)
+{
+	if (request ==  MEDIA_IOC_REQUEST_ALLOC) {
+		__s32 *request_fd = static_cast<__s32*>(arg);
+		json_object_object_add(ioctl_args, "request_fd", json_object_new_int(*request_fd));
+	}
+}
+
+void trace_ioctl_video(unsigned long int request, void *arg, json_object *ioctl_args, bool from_userspace)
+{
+	switch (request) {
+	case VIDIOC_QUERYCAP:
+		if (!from_userspace)
+			trace_vidioc_querycap(arg, ioctl_args);
+		break;
+	case VIDIOC_ENUM_FMT:
+		trace_vidioc_enum_fmt(arg, ioctl_args);
+		break;
+	case VIDIOC_G_FMT:
+	case VIDIOC_S_FMT:
+		trace_v4l2_format(arg, ioctl_args);
+		break;
+	case VIDIOC_REQBUFS:
+		trace_v4l2_requestbuffers(arg, ioctl_args);
+		break;
+	case VIDIOC_QUERYBUF:
+	case VIDIOC_QBUF:
+	case VIDIOC_DQBUF:
+		trace_v4l2_buffer(arg, ioctl_args);
+		break;
+	case VIDIOC_EXPBUF:
+		trace_v4l2_exportbuffer(arg, ioctl_args);
+		break;
+	case VIDIOC_STREAMON:
+	case VIDIOC_STREAMOFF:
+		if (from_userspace)
+			trace_vidioc_stream(arg, ioctl_args);
+		break;
+	case VIDIOC_G_EXT_CTRLS:
+	case VIDIOC_S_EXT_CTRLS:
+		trace_v4l2_ext_controls(arg, ioctl_args);
+		break;
+	case VIDIOC_QUERY_EXT_CTRL:
+		trace_vidioc_query_ext_ctrl(arg, ioctl_args);
+		break;
+	default:
+		break;
+	}
+}
+
+void trace_dma_buf_ioctl_sync(void *arg, json_object *ioctl_args)
+{
+	struct dma_buf_sync *sync = static_cast<struct dma_buf_sync*>(arg);
+	json_object *sync_obj = json_object_new_object();
+	json_object_object_add(sync_obj, "flags", json_object_new_uint64(sync->flags));
+	json_object_object_add(sync_obj, "flags_str", json_object_new_string(bufsyncflag2s(sync->flags).c_str()));
+	json_object_object_add(ioctl_args, "dma_buf_sync", sync_obj);
+}
+
+std::string get_ioctl_request_str(unsigned long request)
+{
+	__u8 ioctl_type = _IOC_TYPE(request);
+	switch (ioctl_type) {
+		case 'V':
+			return ioctl2s_video(request);
+		case '|':
+			return ioctl2s_media(request);
+		case 'b':
+			if (request == DMA_BUF_IOCTL_SYNC)
+				return "DMA_BUF_IOCTL_SYNC";
+			break;
+		default:
+			break;
+	}
+	return "unknown ioctl";
+}
+
+json_object *trace_ioctl_args(int fd, unsigned long request, void *arg, bool from_userspace)
+{
+	json_object *ioctl_args = json_object_new_object();
+	__u8 ioctl_type = _IOC_TYPE(request);
+	switch (ioctl_type) {
+		case 'V':
+			trace_ioctl_video(request, arg, ioctl_args, from_userspace);
+			break;
+		case '|':
+			trace_ioctl_media(request, arg, ioctl_args);
+			break;
+		case 'b':
+			if (request == DMA_BUF_IOCTL_SYNC && from_userspace) {
+				trace_dma_buf_ioctl_sync(arg, ioctl_args);
+			}
+			break;
+		default:
+			break;
+	}
+
+	return ioctl_args;
+}
diff --git a/utils/tracer/tracer.cpp b/utils/tracer/tracer.cpp
new file mode 100644
index 00000000..1b84f85d
--- /dev/null
+++ b/utils/tracer/tracer.cpp
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <json.h>
+#include <time.h>
+#include <cstring>
+#include <string>
+
+int main(int argc, char *argv[])
+{
+	int ch;
+	char short_options[] = {'e', 'p', 'r', 'y'};
+
+	if (argc <= 1) {
+		fprintf(stderr, "usage: tracer [-e] [-p] [-r] [-y] <tracee>\n");
+		return -1;
+	}
+
+	do {
+		ch = getopt(argc, argv, short_options);
+		switch (ch){
+		case 'e':
+			setenv("TRACE_OPTION_PRETTY_PRINT_MEM", "true", 0);
+			break;
+		case 'p':
+			setenv("TRACE_OPTION_PRETTY_PRINT_ALL", "true", 0);
+			break;
+		case 'r':
+			setenv("TRACE_OPTION_DECODED_TO_JSON", "true", 0);
+			break;
+		case 'y':
+			setenv("TRACE_OPTION_CREATE_YUV_FILE", "true", 0);
+			break;
+		}
+	} while (ch != -1);
+
+	/* Get the tracee from the command line. */
+	int count = 0;
+	char *exec_array[argc];
+	while (optind < argc)
+		exec_array[count++] = argv[optind++];
+	exec_array[count] = nullptr;
+
+	/* Use a substring of the time to create a unique id for the trace. */
+	std::string trace_id = std::to_string(time(nullptr));
+	trace_id = trace_id.substr(5, trace_id.npos) + "_trace";
+
+	/* Create the trace file to hold the json-objects as a large json array. */
+	std::string trace_filename = trace_id + ".json";
+	FILE *trace_file = fopen(trace_filename.c_str(), "w");
+	fputs("[\n", trace_file);
+	fflush(trace_file);
+
+	setenv("TRACE_ID", trace_id.c_str(), 0);
+	setenv("LD_PRELOAD", ".libs/libtracer.so", 0);
+
+	if (fork() == 0) {
+		execvpe(exec_array[0], exec_array, environ);
+		perror("Could not execute tracee");
+		return -1;
+	}
+
+	int tracee_result;
+	wait(&tracee_result);
+	unsetenv("TRACE_ID");
+	unsetenv("LD_PRELOAD");
+
+	if (WEXITSTATUS(tracee_result)) {
+		fprintf(stderr, "Trace error: %s\n", trace_filename.c_str());
+		exit(EXIT_FAILURE);
+	}
+
+	/* Close the json-array and the trace file. */
+	trace_file = fopen(trace_filename.c_str(), "r+");
+	fseek(trace_file, 0L, SEEK_END);
+	fseek(trace_file, (ftell(trace_file) - 2), SEEK_SET);
+	std::string end = "\n]\n";
+	fwrite(end.c_str(), sizeof(char), end.length(), trace_file);
+	fclose(trace_file);
+
+	fprintf(stderr, "Trace complete: %s\n", trace_filename.c_str());
+	return 0;
+}
-- 
2.37.1

