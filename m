Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6EC363DD23
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 19:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiK3SYT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 13:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiK3SX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 13:23:57 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40F52184
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 10:23:37 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D9F746602B65;
        Wed, 30 Nov 2022 18:23:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669832616;
        bh=7kfV38MB+QE9h/Iz1CM74ou39P5+AMZu+Jrulzt3qh4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cxdxYakM8BzzeaWsXTGK+zrDjz6i6DyUjAc8lvCyu8YJzx4O1bEomIpTRcE4Pjk08
         JWnJbUMBj71F2KZujT9Eq4sc/7byxUrxBf1uA0w6fFMU4IDjJBO+4+qcFCzAWQ6Fur
         y30t2/RDYrZmrbLHe2MDT0Z3tT80qMR+zzzYONQ86tO8+ZHKvJvMzqpy4ZYPU5Mjp1
         eCeaSzt5fs1P/7gZmo7cAkbqrD8E/bn9hiDpqkDS2TTPhGMQCWnn2g2ILCvzGNnt4h
         qF8omk/YzkhSoR1sjYp7wAwXrPqDhjxlYoDK7b5+wlVtXOEl5q+Ga1mJR69bTD2d8m
         HW7g/oRSjYDZA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v4 1/2] utils: add v4l2-tracer utility
Date:   Wed, 30 Nov 2022 10:24:14 -0800
Message-Id: <05fcfa9243b5f605df36f21231db3b568778f308.1669831184.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669831184.git.deborah.brouwer@collabora.com>
References: <cover.1669831184.git.deborah.brouwer@collabora.com>
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

The v4l2-tracer traces, records and replays userspace applications that
implement the v4l2 memory-to-memory stateless video decoder interface.
It writes the traced system calls and video frame data to a file in JSON
format. It reads the JSON file to replay the same system calls and to send
the same video frame data to the kernel driver. The JSON file can be
replayed in different environments or on different machines.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 README                                   |    8 +
 configure.ac                             |   12 +
 utils/Makefile.am                        |    5 +
 utils/v4l2-tracer/.gitignore             |    7 +
 utils/v4l2-tracer/Makefile.am            |   36 +
 utils/v4l2-tracer/libv4l2tracer.cpp      |  303 +++++
 utils/v4l2-tracer/retrace-helper.cpp     |  262 +++++
 utils/v4l2-tracer/retrace.cpp            | 1357 ++++++++++++++++++++++
 utils/v4l2-tracer/retrace.h              |   43 +
 utils/v4l2-tracer/trace-helper.cpp       |  500 ++++++++
 utils/v4l2-tracer/trace.cpp              |  593 ++++++++++
 utils/v4l2-tracer/trace.h                |   75 ++
 utils/v4l2-tracer/v4l2-tracer-common.cpp |  476 ++++++++
 utils/v4l2-tracer/v4l2-tracer-common.h   |   79 ++
 utils/v4l2-tracer/v4l2-tracer-gen.pl     |  879 ++++++++++++++
 utils/v4l2-tracer/v4l2-tracer.1.in       |  111 ++
 utils/v4l2-tracer/v4l2-tracer.cpp        |  415 +++++++
 17 files changed, 5161 insertions(+)
 create mode 100644 utils/v4l2-tracer/.gitignore
 create mode 100644 utils/v4l2-tracer/Makefile.am
 create mode 100644 utils/v4l2-tracer/libv4l2tracer.cpp
 create mode 100644 utils/v4l2-tracer/retrace-helper.cpp
 create mode 100644 utils/v4l2-tracer/retrace.cpp
 create mode 100644 utils/v4l2-tracer/retrace.h
 create mode 100644 utils/v4l2-tracer/trace-helper.cpp
 create mode 100644 utils/v4l2-tracer/trace.cpp
 create mode 100644 utils/v4l2-tracer/trace.h
 create mode 100644 utils/v4l2-tracer/v4l2-tracer-common.cpp
 create mode 100644 utils/v4l2-tracer/v4l2-tracer-common.h
 create mode 100755 utils/v4l2-tracer/v4l2-tracer-gen.pl
 create mode 100644 utils/v4l2-tracer/v4l2-tracer.1.in
 create mode 100644 utils/v4l2-tracer/v4l2-tracer.cpp

diff --git a/README b/README
index a7759171..8c5561ae 100644
--- a/README
+++ b/README
@@ -45,6 +45,8 @@ you'll need also:
 	alsa-lib-devel doxygen libjpeg-turbo-devel qt5-qtbase-devel
 	libudev-devel mesa-libGLU-devel
 
+The v4l2-tracer also needs the json-c library.
+On Debian: libjson-c-dev; on Fedora: json-c-devel.
 
 After downloading and installing the needed packages, you should run:
 
@@ -227,6 +229,12 @@ v4l2-sysfs-path:
 FIXME add description.
 Installed by make install under <prefix>/bin.
 
+v4l2-tracer:
+Tool to trace, record and replay userspace applications
+that implement the v4l2 memory-to-memory stateless video
+decoder interface.
+Installed by 'make install' under <prefix>/bin.
+
 xc3028-firmware:
 Xceive XC2028/3028 tuner module firmware manipulation tool.
 xc3028-firmware does not get installed by make install.
diff --git a/configure.ac b/configure.ac
index 45423081..2b26e3dd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -32,6 +32,8 @@ AC_CONFIG_FILES([Makefile
 	utils/v4l2-ctl/Makefile
 	utils/v4l2-dbg/Makefile
 	utils/v4l2-sysfs-path/Makefile
+	utils/v4l2-tracer/Makefile
+	utils/v4l2-tracer/v4l2-tracer.1
 	utils/qv4l2/Makefile
 	utils/libcecutil/Makefile
 	utils/cec-ctl/Makefile
@@ -312,6 +314,15 @@ AS_IF([test "x$with_libudev" != xno -o "x$enable_libdvbv5" != xno],
 
 AC_SUBST([JPEG_LIBS])
 
+JSONC_VERSION_REQUIRED="0.15";
+PKG_CHECK_MODULES(JSONC, [json-c >= $JSONC_VERSION_REQUIRED], [jsonc_pkgconfig=yes], [jsonc_pkgconfig=no])
+AC_SUBST([JSONC_CFLAGS])
+AC_SUBST([JSONC_LIBS])
+AM_CONDITIONAL([HAVE_JSONC], [test x$jsonc_pkgconfig = xyes])
+if test "x$jsonc_pkgconfig" = "xno"; then
+    AC_MSG_WARN(json-c $JSONC_VERSION_REQUIRED or higher required for v4l2-tracer)
+fi
+
 # Check for pthread
 
 AS_IF([test x$enable_shared != xno],
@@ -646,6 +657,7 @@ compile time options summary
     QT version                 : $QT_VERSION
     ALSA support               : $USE_ALSA
     SDL support		       : $sdl_pc
+    JSON-C                     : $jsonc_pkgconfig >= $JSONC_VERSION_REQUIRED
 
     build dynamic libs         : $enable_shared
     build static libs          : $enable_static
diff --git a/utils/Makefile.am b/utils/Makefile.am
index 0e68a612..6f59515e 100644
--- a/utils/Makefile.am
+++ b/utils/Makefile.am
@@ -15,6 +15,11 @@ SUBDIRS = \
 	cec-follower \
 	rds-ctl
 
+if HAVE_JSONC
+SUBDIRS += \
+	v4l2-tracer
+endif
+
 if WITH_LIBDVBV5
 SUBDIRS += \
 	dvb
diff --git a/utils/v4l2-tracer/.gitignore b/utils/v4l2-tracer/.gitignore
new file mode 100644
index 00000000..48fbfc47
--- /dev/null
+++ b/utils/v4l2-tracer/.gitignore
@@ -0,0 +1,7 @@
+trace-gen.h
+trace-gen.cpp
+retrace-gen.cpp
+retrace-gen.h
+v4l2-tracer-info-gen.h
+v4l2-tracer
+v4l2-tracer.1
diff --git a/utils/v4l2-tracer/Makefile.am b/utils/v4l2-tracer/Makefile.am
new file mode 100644
index 00000000..b72ee1e9
--- /dev/null
+++ b/utils/v4l2-tracer/Makefile.am
@@ -0,0 +1,36 @@
+if HAVE_JSONC
+
+lib_LTLIBRARIES = libv4l2tracer.la
+libv4l2tracer_la_SOURCES = libv4l2tracer.cpp trace-gen.cpp trace-helper.cpp trace.cpp \
+v4l2-tracer-common.cpp $(top_srcdir)/utils/common/v4l2-info.cpp \
+$(top_srcdir)/utils/common/media-info.cpp
+libv4l2tracer_la_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
+libv4l2tracer_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -ldl $(JSONC_LIBS)
+libv4l2tracer_la_LIBTOOLFLAGS = --tag=disable-static
+
+bin_PROGRAMS = v4l2-tracer
+man_MANS = v4l2-tracer.1
+
+v4l2_tracer_SOURCES = v4l2-tracer.cpp retrace-gen.cpp retrace-helper.cpp retrace.cpp \
+v4l2-tracer-common.cpp $(top_srcdir)/utils/common/v4l2-info.cpp \
+$(top_srcdir)/utils/common/media-info.cpp
+v4l2_tracer_CPPFLAGS = -I$(top_srcdir)/utils/common -DLIBTRACER_PATH=$(libdir) $(JSONC_CFLAGS) \
+$(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
+v4l2_tracer_LDFLAGS = -lrt -lpthread $(JSONC_LIBS)
+
+V4L2_TRACER_GEN_PREREQS = $(top_srcdir)/include/linux/v4l2-controls.h \
+$(top_srcdir)/include/linux/videodev2.h $(top_srcdir)/include/linux/media.h \
+$(top_srcdir)/include/linux/v4l2-common.h
+V4L2_TRACER_GEN = trace-gen.cpp trace-gen.h retrace-gen.cpp retrace-gen.h v4l2-tracer-info-gen.h
+v4l2-tracer.cpp: $(V4L2_TRACER_GEN)
+$(V4L2_TRACER_GEN): gen.intermediate;
+.INTERMEDIATE: gen.intermediate
+gen.intermediate: v4l2-tracer-gen.pl $(V4L2_TRACER_GEN_PREREQS)
+	$(AM_V_GEN) $(top_srcdir)/utils/v4l2-tracer/v4l2-tracer-gen.pl $(V4L2_TRACER_GEN_PREREQS)
+
+clean-local:
+	-rm -vf $(V4L2_TRACER_GEN)
+
+EXTRA_DIST = v4l2-tracer.1, v4l2-tracer-gen.pl
+
+endif
diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
new file mode 100644
index 00000000..090a43d7
--- /dev/null
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -0,0 +1,303 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "trace.h"
+#include <config.h> /* For PROMOTED_MODE_T */
+#include <dlfcn.h>
+#include <stdarg.h>
+
+extern struct trace_context ctx_trace;
+
+const std::list<unsigned long> ioctls = {
+	VIDIOC_QUERYCAP,
+	VIDIOC_STREAMON,
+	VIDIOC_STREAMOFF,
+	VIDIOC_ENUM_FMT,
+	VIDIOC_G_FMT,
+	VIDIOC_S_FMT,
+	VIDIOC_REQBUFS,
+	VIDIOC_QUERYBUF,
+	VIDIOC_QBUF,
+	VIDIOC_EXPBUF,
+	VIDIOC_DQBUF,
+	VIDIOC_G_PARM,
+	VIDIOC_S_PARM,
+	VIDIOC_G_CTRL,
+	VIDIOC_S_CTRL,
+	VIDIOC_QUERYCTRL,
+	VIDIOC_G_CROP,
+	VIDIOC_S_CROP,
+	VIDIOC_TRY_FMT,
+	VIDIOC_G_EXT_CTRLS,
+	VIDIOC_S_EXT_CTRLS,
+	VIDIOC_TRY_EXT_CTRLS,
+	VIDIOC_ENCODER_CMD,
+	VIDIOC_TRY_ENCODER_CMD,
+	VIDIOC_CREATE_BUFS,
+	VIDIOC_PREPARE_BUF,
+	VIDIOC_G_SELECTION,
+	VIDIOC_S_SELECTION,
+	VIDIOC_DECODER_CMD,
+	VIDIOC_TRY_DECODER_CMD,
+	VIDIOC_QUERY_EXT_CTRL,
+	MEDIA_IOC_REQUEST_ALLOC,
+	MEDIA_REQUEST_IOC_QUEUE,
+	MEDIA_REQUEST_IOC_REINIT,
+};
+
+int open(const char *path, int oflag, ...)
+{
+	errno = 0;
+	mode_t mode = 0;
+
+	if ((oflag & O_CREAT) != 0) {
+		va_list argp;
+		va_start(argp, oflag);
+		mode = va_arg(argp, PROMOTED_MODE_T);
+		va_end(argp);
+	}
+
+	int (*original_open)(const char *path, int oflag, ...) = nullptr;
+	original_open = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open");
+	int fd = (*original_open)(path, oflag, mode);
+
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "fd: %d, path: %s\n", fd, path);
+	}
+
+	if (getenv("V4L2_TRACER_PAUSE_TRACE") != nullptr)
+		return fd;
+
+	if (is_video_or_media_device(path)) {
+		trace_open(fd, path, oflag, mode, false);
+		add_device(fd, path);
+	}
+
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		print_devices();
+	}
+
+	return fd;
+}
+
+int open64(const char *path, int oflag, ...)
+{
+	errno = 0;
+	mode_t mode = 0;
+	if ((oflag & O_CREAT) != 0) {
+		va_list argp;
+		va_start(argp, oflag);
+		mode = va_arg(argp, PROMOTED_MODE_T);
+		va_end(argp);
+	}
+
+	int (*original_open64)(const char *path, int oflag, ...) = nullptr;
+	original_open64 = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open64");
+	int fd = (*original_open64)(path, oflag, mode);
+
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "fd: %d, path: %s\n", fd, path);
+	}
+
+	if (getenv("V4L2_TRACER_PAUSE_TRACE") != nullptr)
+		return fd;
+
+	if (is_video_or_media_device(path)) {
+		add_device(fd, path);
+		trace_open(fd, path, oflag, mode, true);
+	}
+
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		print_devices();
+	}
+
+	return fd;
+}
+
+int close(int fd)
+{
+	errno = 0;
+	int (*original_close)(int fd) = nullptr;
+	original_close = (int (*)(int)) dlsym(RTLD_NEXT, "close");
+
+	if (getenv("V4L2_TRACER_PAUSE_TRACE") != nullptr)
+		return (*original_close)(fd);
+
+	std::string path = get_device(fd);
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "fd: %d, path: %s\n", fd, path.c_str());
+	}
+
+	/* Only trace the close if a corresponding open was also traced. */
+	if (!path.empty()) {
+		json_object *close_obj = json_object_new_object();
+		json_object_object_add(close_obj, "fd", json_object_new_int(fd));
+		json_object_object_add(close_obj, "close", json_object_new_string(path.c_str()));
+		write_json_object_to_json_file(close_obj);
+		json_object_put(close_obj);
+		ctx_trace.devices.erase(fd);
+
+		/* If we removed the last device, close the json trace file. */
+		if (!ctx_trace.devices.size())
+			close_json_file();
+	}
+
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		print_devices();
+	}
+
+	return (*original_close)(fd);
+}
+
+void *mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off)
+{
+	errno = 0;
+	void *(*original_mmap)(void *addr, size_t len, int prot, int flags, int fildes, off_t off) = nullptr;
+	original_mmap = (void*(*)(void*, size_t, int, int, int, off_t)) dlsym(RTLD_NEXT, "mmap");
+	void *buf_address_pointer = (*original_mmap)(addr, len, prot, flags, fildes, off);
+
+	set_buffer_address_trace(fildes, off, (unsigned long) buf_address_pointer);
+
+	if (buffer_in_trace_context(fildes, off))
+		trace_mmap(addr, len, prot, flags, fildes, off, (unsigned long) buf_address_pointer, false);
+
+	return buf_address_pointer;
+}
+
+void *mmap64(void *addr, size_t len, int prot, int flags, int fildes, off_t off)
+{
+	errno = 0;
+	void *(*original_mmap64)(void *addr, size_t len, int prot, int flags, int fildes, off_t off) = nullptr;
+	original_mmap64 = (void*(*)(void*, size_t, int, int, int, off_t)) dlsym(RTLD_NEXT, "mmap64");
+	void *buf_address_pointer = (*original_mmap64)(addr, len, prot, flags, fildes, off);
+
+	set_buffer_address_trace(fildes, off, (unsigned long) buf_address_pointer);
+
+	if (buffer_in_trace_context(fildes, off))
+		trace_mmap(addr, len, prot, flags, fildes, off, (unsigned long) buf_address_pointer, true);
+
+	return buf_address_pointer;
+}
+
+int munmap(void *start, size_t length)
+{
+	errno = 0;
+	int(*original_munmap)(void *start, size_t length) = nullptr;
+	original_munmap = (int(*)(void *, size_t)) dlsym(RTLD_NEXT, "munmap");
+	int ret = (*original_munmap)(start, length);
+
+	/* Only trace the unmapping if the original mapping was traced. */
+	if (!buffer_is_mapped((unsigned long) start))
+		return ret;
+
+	json_object *munmap_obj = json_object_new_object();
+
+	if (errno)
+		json_object_object_add(munmap_obj, "errno", json_object_new_string(strerrorname_np(errno)));
+
+	json_object *munmap_args = json_object_new_object();
+	json_object_object_add(munmap_args, "start", json_object_new_int64((int64_t)start));
+	json_object_object_add(munmap_args, "length", json_object_new_uint64(length));
+	json_object_object_add(munmap_obj, "munmap", munmap_args);
+
+	write_json_object_to_json_file(munmap_obj);
+	json_object_put(munmap_obj);
+
+	return ret;
+}
+
+int ioctl(int fd, unsigned long cmd, ...)
+{
+	errno = 0;
+	va_list argp;
+	va_start(argp, cmd);
+	void *arg = va_arg(argp, void *);
+	va_end(argp);
+
+	int (*original_ioctl)(int fd, unsigned long cmd, ...) = nullptr;
+	original_ioctl = (int (*)(int, long unsigned int, ...)) dlsym(RTLD_NEXT, "ioctl");
+
+	if (getenv("V4L2_TRACER_PAUSE_TRACE") != nullptr)
+		return (*original_ioctl)(fd, cmd, arg);
+
+	/* Don't trace ioctls that are not in the specified ioctls list. */
+	if (find(ioctls.begin(), ioctls.end(), cmd) == ioctls.end())
+		return (*original_ioctl)(fd, cmd, arg);
+
+	json_object *ioctl_obj = json_object_new_object();
+	json_object_object_add(ioctl_obj, "fd", json_object_new_int(fd));
+	json_object_object_add(ioctl_obj, "ioctl",
+	                       json_object_new_string(val2s(cmd, ioctl_val_def).c_str()));
+
+	/* Don't attempt to trace a nullptr. */
+	if (arg == nullptr) {
+		int ret = (*original_ioctl)(fd, cmd, arg);
+		if (errno)
+			json_object_object_add(ioctl_obj, "errno",
+			                       json_object_new_string(strerrorname_np(errno)));
+		write_json_object_to_json_file(ioctl_obj);
+		json_object_put(ioctl_obj);
+		return ret;
+	}
+
+	/* Get info needed for writing the decoded video data to a yuv file. */
+	if (cmd == VIDIOC_S_EXT_CTRLS)
+		s_ext_ctrls_setup(static_cast<struct v4l2_ext_controls*>(arg));
+	if (cmd == VIDIOC_QBUF)
+		qbuf_setup(static_cast<struct v4l2_buffer*>(arg));
+	if (cmd == VIDIOC_STREAMOFF)
+		streamoff_cleanup(*(static_cast<v4l2_buf_type*>(arg)));
+
+	/* Trace userspace arguments if driver will be reading them i.e. _IOW or _IOWR ioctls */
+	if ((cmd & IOC_IN) != 0U) {
+		json_object *ioctl_args_userspace = trace_ioctl_args(cmd, arg);
+		/* Some ioctls won't have arguments to trace e.g. MEDIA_REQUEST_IOC_QUEUE. */
+		if (json_object_object_length(ioctl_args_userspace))
+			json_object_object_add(ioctl_obj, "from_userspace", ioctl_args_userspace);
+		else
+			json_object_put(ioctl_args_userspace);
+	}
+
+	/* Make the original ioctl call. */
+	int ret = (*original_ioctl)(fd, cmd, arg);
+
+	if (errno)
+		json_object_object_add(ioctl_obj, "errno", json_object_new_string(strerrorname_np(errno)));
+
+	/* Trace driver arguments if userspace will be reading them i.e. _IOR or _IOWR ioctls */
+	if ((cmd & IOC_OUT) != 0U) {
+		json_object *ioctl_args_driver = trace_ioctl_args(cmd, arg);
+		/* Some ioctls won't have arguments to trace e.g. MEDIA_REQUEST_IOC_QUEUE. */
+		if (json_object_object_length(ioctl_args_driver))
+			json_object_object_add(ioctl_obj, "from_driver", ioctl_args_driver);
+		else
+			json_object_put(ioctl_args_driver);
+	}
+
+	write_json_object_to_json_file(ioctl_obj);
+	json_object_put(ioctl_obj);
+
+	/* Get additional info from driver for writing the decoded video data to a yuv file. */
+	if (cmd == VIDIOC_G_FMT)
+		g_fmt_setup_trace(static_cast<struct v4l2_format*>(arg));
+	if (cmd == VIDIOC_S_FMT)
+		s_fmt_setup(static_cast<struct v4l2_format*>(arg));
+	if (cmd == VIDIOC_EXPBUF)
+		expbuf_setup(static_cast<struct v4l2_exportbuffer*>(arg));
+	if (cmd == VIDIOC_QUERYBUF)
+		querybuf_setup(fd, static_cast<struct v4l2_buffer*>(arg));
+
+	/* Get info needed for tracing dynamic arrays */
+	if (cmd == VIDIOC_QUERY_EXT_CTRL)
+		query_ext_ctrl_setup(fd, static_cast<struct v4l2_query_ext_ctrl*>(arg));
+
+	return ret;
+}
diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
new file mode 100644
index 00000000..03b0466b
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -0,0 +1,262 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "retrace.h"
+
+struct retrace_context ctx_retrace = {};
+
+bool buffer_in_retrace_context(int fd, __u32 offset)
+{
+	bool buffer_in_retrace_context = false;
+	for (auto &b : ctx_retrace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			buffer_in_retrace_context = true;
+			break;
+		}
+	}
+	return buffer_in_retrace_context;
+}
+
+int get_buffer_fd_retrace(__u32 type, __u32 index)
+{
+	int fd = -1;
+	for (auto &b : ctx_retrace.buffers) {
+		if ((b.type == type) && (b.index == index)) {
+			fd = b.fd;
+			break;
+		}
+	}
+	return fd;
+}
+
+void add_buffer_retrace(int fd, __u32 type, __u32 index, __u32 offset)
+{
+	struct buffer_retrace buf = {};
+	buf.fd = fd;
+	buf.type = type;
+	buf.index = index;
+	buf.offset = offset;
+	ctx_retrace.buffers.push_front(buf);
+}
+
+void remove_buffer_retrace(int fd)
+{
+	for (auto it = ctx_retrace.buffers.begin(); it != ctx_retrace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			ctx_retrace.buffers.erase(it);
+			break;
+		}
+	}
+}
+
+void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace)
+{
+	for (auto &b : ctx_retrace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.address_trace = address_trace;
+			b.address_retrace = address_retrace;
+			break;
+		}
+	}
+}
+
+long get_retrace_address_from_trace_address(long address_trace)
+{
+	long address_retrace = 0;
+	for (auto &b : ctx_retrace.buffers) {
+		if (b.address_trace == address_trace) {
+			address_retrace = b.address_retrace;
+			break;
+		}
+	}
+	return address_retrace;
+}
+
+void print_buffers_retrace(void)
+{
+	for (auto &b : ctx_retrace.buffers) {
+		fprintf(stderr, "fd: %d, offset: %d, address_trace:%ld, address_retrace:%ld\n",
+		        b.fd, b.offset, b.address_trace, b.address_retrace);
+	}
+}
+
+void add_fd(int fd_trace, int fd_retrace)
+{
+	std::pair<int, int> new_pair;
+	new_pair = std::make_pair(fd_trace, fd_retrace);
+	ctx_retrace.retrace_fds.insert(new_pair);
+}
+
+int get_fd_retrace_from_fd_trace(int fd_trace)
+{
+	int fd_retrace = -1;
+	std::unordered_map<int, int>::const_iterator it;
+	it = ctx_retrace.retrace_fds.find(fd_trace);
+	if (it != ctx_retrace.retrace_fds.end())
+		fd_retrace = it->second;
+	return fd_retrace;
+}
+
+void print_fds(void)
+{
+	if (ctx_retrace.retrace_fds.empty())
+		fprintf(stderr, "all devices closed\n");
+	for (auto it = ctx_retrace.retrace_fds.cbegin(); it != ctx_retrace.retrace_fds.cend(); ++it)
+		fprintf(stderr, "fd_trace: %d, fd_retrace: %d\n", it->first, it->second);
+}
+
+std::string get_path_retrace_from_path_trace(std::string path_trace, json_object *open_obj)
+{
+	bool is_media = path_trace.find("media") != std::string::npos;
+	bool is_video = path_trace.find("video") != std::string::npos;
+
+	std::string path_media;
+	std::string path_video;
+
+	/* If user set the media or video path just return that path. */
+	if (is_media && (getenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE") != nullptr)) {
+		path_media = getenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "Use path set by user: %s ", path_media.c_str());
+		}
+		return path_media;
+	}
+	if (is_video && (getenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE") != nullptr)) {
+		path_video = getenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "Use path set by user: %s ", path_video.c_str());
+		}
+		return path_video;
+	}
+
+	std::string driver;
+	json_object *driver_obj;
+	if (json_object_object_get_ex(open_obj, "driver", &driver_obj))
+		if (json_object_get_string(driver_obj) != nullptr)
+			driver = json_object_get_string(driver_obj);
+	if (driver.empty())
+		return "";
+
+	path_media = get_path_media(driver);
+	if (path_media.empty()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "warning: driver: %s not found\n", driver.c_str());
+		return "";
+	}
+
+	if (is_media)
+		return path_media;
+
+	if (is_video) {
+		std::list<std::string> linked_entities;
+		json_object *le_obj;
+		if (json_object_object_get_ex(open_obj, "linked_entities", &le_obj)) {
+			for (size_t i = 0; i < array_list_length(json_object_get_array(le_obj)); i++) {
+				std::string ename;
+				if (json_object_get_string(json_object_array_get_idx(le_obj, i)) != nullptr)
+					ename = json_object_get_string(json_object_array_get_idx(le_obj, i));
+				linked_entities.push_back(ename);
+			}
+		}
+		if (linked_entities.size() == 0)
+			return "";
+
+		setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+		int media_fd = open(path_media.c_str(), O_RDONLY);
+		unsetenv("V4L2_TRACER_PAUSE_TRACE");
+
+		std::string path_video = get_path_video(media_fd, linked_entities);
+		setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+		close(media_fd);
+		unsetenv("V4L2_TRACER_PAUSE_TRACE");
+		return path_video;
+	}
+
+	return "";
+}
+
+void write_to_output_buffer(unsigned char *buffer_pointer, int bytesused, json_object *mem_obj)
+{
+	int byteswritten = 0;
+	const int hex_base = 16;
+	json_object *line_obj;
+	size_t number_of_lines;
+	std::string compressed_video_data;
+
+	json_object *mem_array_obj;
+	json_object_object_get_ex(mem_obj, "mem_array", &mem_array_obj);
+	number_of_lines = json_object_array_length(mem_array_obj);
+
+	for (long unsigned int i = 0; i < number_of_lines; i++) {
+		line_obj = json_object_array_get_idx(mem_array_obj, i);
+		if (json_object_get_string(line_obj) != nullptr)
+			compressed_video_data = json_object_get_string(line_obj);
+
+		for (long unsigned i = 0; i < compressed_video_data.length(); i++) {
+			if (std::isspace(compressed_video_data[i]) != 0)
+				continue;
+			try {
+				/* Two values from the string e.g. "D9" are needed to write one byte. */
+				*buffer_pointer = (char) std::stoi(compressed_video_data.substr(i,2), nullptr, hex_base);
+				buffer_pointer++;
+				i++;
+				byteswritten++;
+			} catch (std::invalid_argument& ia) {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "\'%s\' is an invalid argument.\n",
+				        compressed_video_data.substr(i,2).c_str());
+			} catch (std::out_of_range& oor) {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "\'%s\' is out of range.\n",
+				        compressed_video_data.substr(i,2).c_str());
+			}
+		}
+	}
+
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "bytesused: %d, byteswritten: %d\n", bytesused, byteswritten);
+	}
+}
+
+void compare_program_versions(json_object *v4l2_tracer_info_obj)
+{
+	json_object *package_version_obj;
+	json_object_object_get_ex(v4l2_tracer_info_obj, "package_version", &package_version_obj);
+	std::string package_version_trace;
+	if (json_object_get_string(package_version_obj) != nullptr)
+		package_version_trace = json_object_get_string(package_version_obj);
+	std::string package_version_retrace = PACKAGE_VERSION;
+	if (package_version_trace != package_version_retrace) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "warning: trace package version \'%s\' does not match current: \'%s\':\n",
+		        package_version_trace.c_str(), package_version_retrace.c_str());
+		print_v4l2_tracer_info();
+		return;
+	}
+
+	json_object *git_sha_obj;
+	json_object_object_get_ex(v4l2_tracer_info_obj, "git_sha", &git_sha_obj);
+	std::string git_sha_trace;
+	if (json_object_get_string(git_sha_obj) != nullptr)
+		git_sha_trace = json_object_get_string(git_sha_obj);
+	std::string git_sha_retrace = (STRING(GIT_SHA));
+	if (git_sha_trace != git_sha_retrace) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "warning: sha in trace file \'%s\' does not match current sha: \'%s\'\n",
+		        git_sha_trace.c_str(),  git_sha_retrace.c_str());
+		print_v4l2_tracer_info();
+		return;
+	}
+}
+
+void print_context(void)
+{
+	print_fds();
+	print_buffers_retrace();
+	fprintf(stderr, "\n");
+}
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
new file mode 100644
index 00000000..9b03d3bb
--- /dev/null
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -0,0 +1,1357 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "retrace.h"
+
+extern struct retrace_context ctx_retrace;
+
+void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
+{
+	json_object *mmap_args_obj;
+	if (is_mmap64)
+		json_object_object_get_ex(mmap_obj, "mmap64", &mmap_args_obj);
+	else
+		json_object_object_get_ex(mmap_obj, "mmap", &mmap_args_obj);
+
+	json_object *len_obj;
+	json_object_object_get_ex(mmap_args_obj, "len", &len_obj);
+	size_t len = (size_t) json_object_get_int(len_obj);
+
+	json_object *prot_obj;
+	json_object_object_get_ex(mmap_args_obj, "prot", &prot_obj);
+	int prot = json_object_get_int(prot_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(mmap_args_obj, "flags", &flags_obj);
+	int flags = s2number(json_object_get_string(flags_obj));
+
+	json_object *fildes_obj;
+	json_object_object_get_ex(mmap_args_obj, "fildes", &fildes_obj);
+	int fd_trace = json_object_get_int(fildes_obj);
+
+	json_object *off_obj;
+	json_object_object_get_ex(mmap_args_obj, "off", &off_obj);
+	off_t off = (off_t) json_object_get_int64(off_obj);
+
+	int fd_retrace = get_fd_retrace_from_fd_trace(fd_trace);
+	if (fd_retrace < 0) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "bad or missing file descriptor.\n");
+		return;
+	}
+
+	/* Only retrace mmap calls that map a buffer. */
+	if (!buffer_in_retrace_context(fd_retrace, off))
+		return;
+
+	void *buf_address_retrace_pointer = nullptr;
+	if (is_mmap64)
+		buf_address_retrace_pointer = mmap64(0, len, prot, flags, fd_retrace, off);
+	else
+		buf_address_retrace_pointer = mmap(0, len, prot, flags, fd_retrace, off);
+
+	if (buf_address_retrace_pointer == MAP_FAILED) {
+		if (is_mmap64)
+			perror("mmap64");
+		else
+			perror("mmap");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+		exit(EXIT_FAILURE);
+	}
+
+	/*
+	 * Get and store the original trace address so that it can be matched
+	 * with the munmap address later.
+	 */
+	json_object *buffer_address_obj;
+	json_object_object_get_ex(mmap_obj, "buffer_address", &buffer_address_obj);
+	long buf_address_trace = json_object_get_int64(buffer_address_obj);
+	set_buffer_address_retrace(fd_retrace, off, buf_address_trace,
+	                           (long) buf_address_retrace_pointer);
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "fd: %d, offset: %ld, ", fd_retrace, off);
+		if (is_mmap64)
+			perror("mmap64");
+		else
+			perror("mmap");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+}
+
+void retrace_munmap(json_object *syscall_obj)
+{
+	json_object *munmap_args_obj;
+	json_object_object_get_ex(syscall_obj, "munmap", &munmap_args_obj);
+
+	json_object *start_obj;
+	json_object_object_get_ex(munmap_args_obj, "start", &start_obj);
+	long start = json_object_get_int64(start_obj);
+
+	json_object *length_obj;
+	json_object_object_get_ex(munmap_args_obj, "length", &length_obj);
+	size_t length = (size_t) json_object_get_int(length_obj);
+
+	long buffer_address_retrace = get_retrace_address_from_trace_address(start);
+
+	if (buffer_address_retrace < 0)
+		return;
+
+	munmap((void *)buffer_address_retrace, length);
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "unmapped: %ld, ", buffer_address_retrace);
+		perror("munmap");
+	}
+}
+
+void retrace_open(json_object *jobj, bool is_open64)
+{
+	json_object *fd_trace_obj;
+	json_object_object_get_ex(jobj, "fd", &fd_trace_obj);
+	int fd_trace = json_object_get_int(fd_trace_obj);
+
+	json_object *open_args_obj;
+	if (is_open64)
+		json_object_object_get_ex(jobj, "open64", &open_args_obj);
+	else
+		json_object_object_get_ex(jobj, "open", &open_args_obj);
+
+	json_object *path_obj;
+	std::string path_trace;
+	json_object_object_get_ex(open_args_obj, "path", &path_obj);
+	if (json_object_get_string(path_obj) != nullptr)
+		path_trace = json_object_get_string(path_obj);
+	std::string path_retrace = get_path_retrace_from_path_trace(path_trace, jobj);
+
+	/*
+	 * Don't fail if a retrace path can't be found.
+	 * Try using the same path as in the trace file.
+	 */
+	if (path_retrace.empty()) {
+		if (is_verbose()) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "warning: can't find retrace device. Attempting to use: %s\n",
+			        path_trace.c_str());
+		}
+		path_retrace = path_trace;
+	}
+
+	json_object *oflag_obj;
+	json_object_object_get_ex(open_args_obj, "oflag", &oflag_obj);
+	int oflag = s2val(json_object_get_string(oflag_obj), open_val_def);
+
+	int mode = 0;
+	json_object *mode_obj;
+	if (json_object_object_get_ex(open_args_obj, "mode", &mode_obj))
+		mode = s2number(json_object_get_string(mode_obj));
+
+	int fd_retrace = 0;
+	if (is_open64)
+		fd_retrace = open64(path_retrace.c_str(), oflag, mode);
+	else
+		fd_retrace = open(path_retrace.c_str(), oflag, mode);
+
+	if (fd_retrace <= 0) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "cannot open: %s\n", path_retrace.c_str());
+		exit(fd_retrace);
+	}
+
+	add_fd(fd_trace, fd_retrace);
+
+	if (is_verbose() || errno != 0) {
+		fprintf(stderr, "path: %s ", path_retrace.c_str());
+		if (is_open64)
+			perror("open64");
+		else
+			perror("open");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+}
+
+void retrace_close(json_object *jobj)
+{
+	json_object *fd_trace_obj;
+	json_object_object_get_ex(jobj, "fd", &fd_trace_obj);
+	int fd_retrace = get_fd_retrace_from_fd_trace(json_object_get_int(fd_trace_obj));
+
+	/* Only close devices that were opened in the retrace context. */
+	if (fd_retrace < 0)
+		return;
+
+	close(fd_retrace);
+	ctx_retrace.retrace_fds.erase(json_object_get_int(fd_trace_obj));
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "fd: %d ", fd_retrace);
+		perror("close");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+}
+
+void retrace_vidioc_reqbufs(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_requestbuffers *ptr = retrace_v4l2_requestbuffers_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_REQBUFS, ptr);
+	free(ptr);
+}
+
+struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memory)
+{
+	struct v4l2_plane *ptr = (struct v4l2_plane *) calloc(1, sizeof(v4l2_plane));
+
+	json_object *bytesused_obj;
+	json_object_object_get_ex(plane_obj, "bytesused", &bytesused_obj);
+	ptr->bytesused = (__u32) json_object_get_int64(bytesused_obj);
+
+	json_object *length_obj;
+	json_object_object_get_ex(plane_obj, "length", &length_obj);
+	ptr->length = (__u32) json_object_get_int64(length_obj);
+
+	json_object *m_obj;
+	json_object_object_get_ex(plane_obj, "m", &m_obj);
+	if (memory == V4L2_MEMORY_MMAP) {
+		json_object *mem_offset_obj;
+		json_object_object_get_ex(m_obj, "mem_offset", &mem_offset_obj);
+		ptr->m.mem_offset = (__u32) json_object_get_int64(mem_offset_obj);
+	}
+
+	json_object *data_offset_obj;
+	json_object_object_get_ex(plane_obj, "data_offset", &data_offset_obj);
+	ptr->data_offset = (__u32) json_object_get_int64(data_offset_obj);
+
+	return ptr;
+}
+
+struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
+{
+	struct v4l2_buffer *buf = (struct v4l2_buffer *) calloc(1, sizeof(struct v4l2_buffer));
+
+	json_object *buf_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_buffer", &buf_obj);
+
+	json_object *index_obj;
+	json_object_object_get_ex(buf_obj, "index", &index_obj);
+	buf->index = (__u32) json_object_get_uint64(index_obj);
+
+	json_object *type_obj;
+	json_object_object_get_ex(buf_obj, "type", &type_obj);
+	buf->type = s2val(json_object_get_string(type_obj), v4l2_buf_type_val_def);
+
+	json_object *bytesused_obj;
+	json_object_object_get_ex(buf_obj, "bytesused", &bytesused_obj);
+	buf->bytesused = (__u32) json_object_get_uint64(bytesused_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(buf_obj, "flags", &flags_obj);
+	buf->flags = (__u32) s2flags_buffer(json_object_get_string(flags_obj));
+
+	json_object *field_obj;
+	json_object_object_get_ex(buf_obj, "field", &field_obj);
+	buf->field = (__u32) s2val(json_object_get_string(field_obj), v4l2_field_val_def);
+
+	json_object *timestamp_obj;
+	json_object_object_get_ex(buf_obj, "timestamp", &timestamp_obj);
+
+	struct timeval tval = {};
+	json_object *tv_sec_obj;
+	json_object_object_get_ex(timestamp_obj, "tv_sec", &tv_sec_obj);
+	tval.tv_sec = json_object_get_int64(tv_sec_obj);
+	json_object *tv_usec_obj;
+	json_object_object_get_ex(timestamp_obj, "tv_usec", &tv_usec_obj);
+	tval.tv_usec = json_object_get_int64(tv_usec_obj);
+	buf->timestamp = tval;
+
+	json_object *sequence_obj;
+	json_object_object_get_ex(buf_obj, "sequence", &sequence_obj);
+	buf->sequence = (__u32) json_object_get_uint64(sequence_obj);
+
+	json_object *memory_obj;
+	json_object_object_get_ex(buf_obj, "memory", &memory_obj);
+	buf->memory = s2val(json_object_get_string(memory_obj), v4l2_memory_val_def);
+
+	json_object *length_obj;
+	json_object_object_get_ex(buf_obj, "length", &length_obj);
+	buf->length = (__u32) json_object_get_uint64(length_obj);
+
+	json_object *m_obj;
+	json_object_object_get_ex(buf_obj, "m", &m_obj);
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		json_object *planes_obj;
+		json_object_object_get_ex(m_obj, "planes", &planes_obj);
+		 /* TODO add planes > 0 */
+		json_object *plane_obj = json_object_array_get_idx(planes_obj, 0);
+		buf->m.planes = retrace_v4l2_plane(plane_obj, buf->memory);
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		if (buf->memory == V4L2_MEMORY_MMAP) {
+			json_object *offset_obj;
+			json_object_object_get_ex(m_obj, "offset", &offset_obj);
+			buf->m.offset = (__u32) json_object_get_uint64(offset_obj);
+		}
+	}
+
+	if ((buf->flags & V4L2_BUF_FLAG_REQUEST_FD) != 0U) {
+		json_object *request_fd_obj;
+		json_object_object_get_ex(buf_obj, "request_fd", &request_fd_obj);
+		buf->request_fd = (__s32) get_fd_retrace_from_fd_trace(json_object_get_int(request_fd_obj));
+		if (buf->request_fd < 0) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "bad or missing file descriptor\n");
+		}
+	}
+
+	return buf;
+}
+
+void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_QUERYBUF, buf);
+
+	if (buf->memory == V4L2_MEMORY_MMAP) {
+		__u32 offset = 0;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT))
+			offset = buf->m.offset;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+			offset = buf->m.planes->m.mem_offset;
+		if (get_buffer_fd_retrace(buf->type, buf->index) == -1)
+			add_buffer_retrace(fd_retrace, buf->type, buf->index, offset);
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (buf->m.planes != nullptr) {
+			free(buf->m.planes);
+		}
+	}
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "%s, index: %d, fd: %d, ",
+		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
+		perror("VIDIOC_QUERYBUF");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+
+	free(buf);
+}
+
+void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer *ptr = retrace_v4l2_buffer(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_QBUF, ptr);
+
+	if (ptr->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    ptr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (ptr->m.planes != nullptr) {
+			free(ptr->m.planes);
+		}
+	}
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "%s, index: %d, fd: %d, ",
+		        buftype2s((int) ptr->type).c_str(), ptr->index, fd_retrace);
+		perror("VIDIOC_QBUF");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+
+	free(ptr);
+}
+
+void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	const int poll_timeout_ms = 5000;
+	struct pollfd *pfds = (struct pollfd *) calloc(1, sizeof(struct pollfd));
+	if (pfds == nullptr)
+		exit(EXIT_FAILURE);
+	pfds[0].fd = fd_retrace;
+	pfds[0].events = POLLIN;
+	int ret = poll(pfds, 1, poll_timeout_ms);
+	free(pfds);
+	if (ret == -1) {
+		fprintf(stderr, "%s:%s:%d: poll error: ", __FILE__, __func__, __LINE__);
+		perror("");
+		exit(EXIT_FAILURE);
+	}
+	if (ret == 0) {
+		fprintf(stderr, "%s:%s:%d: poll timed out\n", __FILE__, __func__, __LINE__);
+		exit(EXIT_FAILURE);
+	}
+
+	ioctl(fd_retrace, VIDIOC_DQBUF, buf);
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "%s, index: %d, fd: %d, ",
+		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
+		perror("VIDIOC_DQBUF");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+			free(buf->m.planes);
+
+	free(buf);
+}
+
+void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_PREPARE_BUF, buf);
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "%s, index: %d, fd: %d, ",
+		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
+		perror("VIDIOC_PREPARE_BUF");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+			free(buf->m.planes);
+
+	free(buf);
+}
+
+void retrace_vidioc_create_bufs(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_create_buffers *ptr = retrace_v4l2_create_buffers_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_CREATE_BUFS, ptr);
+
+	if (is_verbose() || (errno != 0)) {
+		perror("VIDIOC_CREATE_BUFS");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+
+	free(ptr);
+}
+
+void retrace_vidioc_expbuf(int fd_retrace, json_object *ioctl_args_user, json_object *ioctl_args_driver)
+{
+	struct v4l2_exportbuffer *ptr = retrace_v4l2_exportbuffer_gen(ioctl_args_user);
+	ioctl(fd_retrace, VIDIOC_EXPBUF, ptr);
+
+	int buf_fd_retrace = ptr->fd;
+
+	/*
+	 * If a buffer was previously added to the retrace context using the video device
+	 * file descriptor, replace the video fd with the more specific buffer fd from EXPBUF.
+	 */
+	int fd_found_in_retrace_context = get_buffer_fd_retrace(ptr->type, ptr->index);
+	if (fd_found_in_retrace_context != -1)
+		remove_buffer_retrace(fd_found_in_retrace_context);
+
+	add_buffer_retrace(buf_fd_retrace, ptr->type, ptr->index);
+
+	/* Retrace again to associate the original fd with the current buffer fd. */
+	memset(ptr, 0, sizeof(v4l2_exportbuffer));
+	ptr = retrace_v4l2_exportbuffer_gen(ioctl_args_driver);
+	int buf_fd_trace = ptr->fd;
+	add_fd(buf_fd_trace, buf_fd_retrace);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_EXPBUF");
+
+	free(ptr);
+}
+
+void retrace_vidioc_streamon(int fd_retrace, json_object *ioctl_args)
+{
+	json_object *type_obj;
+	json_object_object_get_ex(ioctl_args, "type", &type_obj);
+	v4l2_buf_type buf_type = (v4l2_buf_type) s2val(json_object_get_string(type_obj),
+	                                               v4l2_buf_type_val_def);
+
+	ioctl(fd_retrace, VIDIOC_STREAMON, &buf_type);
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "%s, ", buftype2s(buf_type).c_str());
+		perror("VIDIOC_STREAMON");
+	}
+}
+
+void retrace_vidioc_streamoff(int fd_retrace, json_object *ioctl_args)
+{
+	json_object *type_obj;
+	json_object_object_get_ex(ioctl_args, "type", &type_obj);
+	v4l2_buf_type buf_type = (v4l2_buf_type) s2val(json_object_get_string(type_obj),
+	                                               v4l2_buf_type_val_def);
+
+	ioctl(fd_retrace, VIDIOC_STREAMOFF, &buf_type);
+
+	if (is_verbose() || (errno != 0)) {
+		fprintf(stderr, "%s, ", buftype2s(buf_type).c_str());
+		perror("VIDIOC_STREAMOFF");
+	}
+}
+
+void retrace_vidioc_try_fmt(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_format *ptr = retrace_v4l2_format_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_TRY_FMT, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_TRY_FMT");
+
+	free(ptr);
+}
+
+void retrace_vidioc_g_fmt(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_format *ptr = retrace_v4l2_format_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_FMT, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_FMT");
+
+	free(ptr);
+}
+
+void retrace_vidioc_s_fmt(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_format *ptr = retrace_v4l2_format_gen(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_S_FMT, ptr);
+
+	if (is_verbose() || (errno != 0)) {
+		perror("VIDIOC_S_FMT");
+	}
+
+	free(ptr);
+}
+
+struct v4l2_streamparm *retrace_v4l2_streamparm(json_object *parent_obj, std::string key_name = "")
+{
+	struct v4l2_streamparm *ptr = (struct v4l2_streamparm *) calloc(1, sizeof(v4l2_streamparm));
+
+	json_object *v4l2_streamparm_obj;
+	json_object_object_get_ex(parent_obj, "v4l2_streamparm", &v4l2_streamparm_obj);
+
+	json_object *type_obj;
+	if (json_object_object_get_ex(v4l2_streamparm_obj, "type", &type_obj))
+		ptr->type = (__u32) s2val(json_object_get_string(type_obj), v4l2_buf_type_val_def);
+
+	if ((ptr->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) || (ptr->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE))
+		ptr->parm.capture = *retrace_v4l2_captureparm_gen(v4l2_streamparm_obj);
+
+	if ((ptr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) || (ptr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+		ptr->parm.output = *retrace_v4l2_outputparm_gen(v4l2_streamparm_obj);
+
+	return ptr;
+}
+
+void retrace_vidioc_g_parm (int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_streamparm *ptr = retrace_v4l2_streamparm(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_PARM, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_PARM");
+
+	free(ptr);
+}
+
+void retrace_vidioc_s_parm (int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_streamparm *ptr = retrace_v4l2_streamparm(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_S_PARM, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_S_PARM");
+
+	free(ptr);
+}
+
+void retrace_vidioc_queryctrl(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_queryctrl *ptr = retrace_v4l2_queryctrl_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_QUERYCTRL, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_QUERYCTRL");
+
+	free(ptr);
+}
+
+void retrace_vidioc_g_control(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_control *ptr = retrace_v4l2_control_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_CTRL, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_CTRL");
+
+	free(ptr);
+}
+
+void retrace_vidioc_s_control(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_control *ptr = retrace_v4l2_control_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_S_CTRL, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_S_CTRL");
+
+	free(ptr);
+}
+
+void retrace_vidioc_g_crop(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_crop *ptr = retrace_v4l2_crop_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_CROP, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_CROP");
+
+	free(ptr);
+}
+
+void retrace_vidioc_s_crop(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_crop *ptr = retrace_v4l2_crop_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_S_CROP, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_S_CROP");
+
+	free(ptr);
+}
+
+int retrace_v4l2_ext_control_value(json_object *ctrl_obj, const val_def *def)
+{
+	__s32 value = -1;
+
+	json_object *value_obj;
+	if (json_object_object_get_ex(ctrl_obj, "value", &value_obj))
+		value = (__s32) s2val(json_object_get_string(value_obj), def);
+
+	return value;
+}
+
+__u32 *retrace_v4l2_dynamic_array(json_object *v4l2_ext_control_obj)
+{
+	__u32 elems = 0;
+	json_object *elems_obj;
+	if (json_object_object_get_ex(v4l2_ext_control_obj, "elems", &elems_obj))
+		elems = (__u32) json_object_get_int64(elems_obj);
+
+	__u32 *ptr = static_cast<__u32 *>(calloc(elems, sizeof(__u32)));
+	if (ptr == nullptr) {
+		fprintf(stderr, "%s:%s:%d: memory allocation failed.\n", __FILE__, __func__, __LINE__);
+		return ptr;
+	}
+
+	json_object *p_u32_obj;
+	if (json_object_object_get_ex(v4l2_ext_control_obj, "p_u32", &p_u32_obj)) {
+		for (size_t i = 0; i < elems; i++) {
+			if (json_object_array_get_idx(p_u32_obj, i))
+				ptr[i] = (__u32) json_object_get_int64(json_object_array_get_idx(p_u32_obj, i));
+		}
+	}
+
+	return ptr;
+}
+
+struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int ctrl_idx)
+{
+	struct v4l2_ext_control *p = (struct v4l2_ext_control *) calloc(1, sizeof(v4l2_ext_control));
+
+	json_object *v4l2_ext_control_obj = json_object_array_get_idx(parent_obj, ctrl_idx);
+	if (!v4l2_ext_control_obj)
+		return p;
+
+	json_object *id_obj;
+	if (json_object_object_get_ex(v4l2_ext_control_obj, "id", &id_obj))
+		p->id = s2val(json_object_get_string(id_obj), control_val_def);
+
+	json_object *size_obj;
+	if (json_object_object_get_ex(v4l2_ext_control_obj, "size", &size_obj))
+		p->size = json_object_get_int64(size_obj);
+
+	switch (p->id) {
+	case V4L2_CID_STATELESS_H264_DECODE_MODE:
+		p->value = retrace_v4l2_ext_control_value(v4l2_ext_control_obj,
+		                                          v4l2_stateless_h264_decode_mode_val_def);
+		break;
+	case V4L2_CID_STATELESS_H264_START_CODE:
+		p->value = retrace_v4l2_ext_control_value(v4l2_ext_control_obj,
+		                                          v4l2_stateless_h264_start_code_val_def);
+		break;
+	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:
+		p->value = retrace_v4l2_ext_control_value(v4l2_ext_control_obj,
+		                                          v4l2_stateless_hevc_decode_mode_val_def);
+		break;
+	case V4L2_CID_STATELESS_HEVC_START_CODE:
+		p->value = retrace_v4l2_ext_control_value(v4l2_ext_control_obj,
+		                                          v4l2_stateless_hevc_start_code_val_def);
+		break;
+	default:
+		break;
+	}
+
+	/* Don't retrace pointers that were not traced because they were null. */
+	if (p->size == 0)
+		return p;
+
+	switch (p->id) {
+	case V4L2_CID_STATELESS_VP8_FRAME:
+		p->ptr = retrace_v4l2_ctrl_vp8_frame_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SPS:
+		p->ptr = retrace_v4l2_ctrl_h264_sps_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PPS:
+		p->ptr = retrace_v4l2_ctrl_h264_pps_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
+		p->ptr = retrace_v4l2_ctrl_h264_scaling_matrix_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
+		p->ptr = retrace_v4l2_ctrl_h264_pred_weights_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
+		p->ptr = retrace_v4l2_ctrl_h264_slice_params_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
+		p->ptr = retrace_v4l2_ctrl_h264_decode_params_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_FWHT_PARAMS:
+		p->ptr = retrace_v4l2_ctrl_fwht_params_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_VP9_FRAME:
+		p->ptr = retrace_v4l2_ctrl_vp9_frame_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
+		p->ptr = retrace_v4l2_ctrl_vp9_compressed_hdr_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SPS:
+		p->ptr = retrace_v4l2_ctrl_hevc_sps_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_PPS:
+		p->ptr = retrace_v4l2_ctrl_hevc_pps_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:
+		p->ptr = retrace_v4l2_ctrl_hevc_slice_params_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:
+		p->ptr = retrace_v4l2_ctrl_hevc_scaling_matrix_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
+		p->ptr = retrace_v4l2_ctrl_hevc_decode_params_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:
+		p->p_u32 = retrace_v4l2_dynamic_array(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:
+		p->ptr = retrace_v4l2_ctrl_mpeg2_sequence_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_PICTURE:
+		p->ptr = retrace_v4l2_ctrl_mpeg2_picture_gen(v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
+		p->ptr = retrace_v4l2_ctrl_mpeg2_quantisation_gen(v4l2_ext_control_obj);
+		break;
+	default:
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "warning: cannot retrace control: %s\n",
+		        val2s(p->id, control_val_def).c_str());
+		break;
+	}
+
+	return p;
+}
+
+struct v4l2_ext_controls *retrace_v4l2_ext_controls(json_object *parent_obj)
+{
+	struct v4l2_ext_controls *ptr = (struct v4l2_ext_controls *) calloc(1, sizeof(v4l2_ext_controls));
+
+	json_object *v4l2_ext_controls_obj;
+	json_object_object_get_ex(parent_obj, "v4l2_ext_controls", &v4l2_ext_controls_obj);
+
+	json_object *which_obj;
+	if (json_object_object_get_ex(v4l2_ext_controls_obj, "which", &which_obj))
+		ptr->which = (__u32) s2val(json_object_get_string(which_obj), which_val_def);
+
+	json_object *count_obj;
+	if (json_object_object_get_ex(v4l2_ext_controls_obj, "count", &count_obj))
+		ptr->count = (__u32) json_object_get_int64(count_obj);
+
+	json_object *error_idx_obj;
+	if (json_object_object_get_ex(v4l2_ext_controls_obj, "error_idx", &error_idx_obj))
+		ptr->error_idx = (__u32) json_object_get_int64(error_idx_obj);
+
+	/* request_fd is only valid for V4L2_CTRL_WHICH_REQUEST_VAL */
+	if (ptr->which == V4L2_CTRL_WHICH_REQUEST_VAL) {
+		json_object *request_fd_obj;
+		if (json_object_object_get_ex(v4l2_ext_controls_obj, "request_fd", &request_fd_obj)) {
+
+			int request_fd_trace = json_object_get_int(request_fd_obj);
+			int request_fd_retrace = get_fd_retrace_from_fd_trace(request_fd_trace);
+			if (request_fd_retrace < 0) {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "bad file descriptor\n");
+				return ptr;
+			}
+			ptr->request_fd = (__s32) request_fd_retrace;
+		}
+	}
+
+	json_object *controls_obj;
+	if (json_object_object_get_ex(v4l2_ext_controls_obj, "controls", &controls_obj)) {
+		ptr->controls = (struct v4l2_ext_control *) calloc(ptr->count, sizeof(v4l2_ext_control));
+		for (__u32 i = 0; i < ptr->count; i++) {
+			void *temp = retrace_v4l2_ext_control(controls_obj, i);
+			if (temp != nullptr) {
+				ptr->controls[i] = *(static_cast<struct v4l2_ext_control*>(temp));
+				free(temp);
+			}
+		}
+	}
+
+	return ptr;
+}
+
+void retrace_vidioc_try_ext_ctrls(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_TRY_EXT_CTRLS, ptr);
+
+	free(ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_TRY_EXT_CTRLS");
+}
+
+void retrace_vidioc_g_ext_ctrls(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_EXT_CTRLS, ptr);
+
+	free(ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_EXT_CTRLS");
+}
+
+void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_S_EXT_CTRLS, ptr);
+
+	free(ptr);
+
+	if (is_verbose() || (errno != 0)) {
+		perror("VIDIOC_S_EXT_CTRLS");
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_context();
+		}
+	}
+}
+
+void retrace_vidioc_try_encoder_cmd(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_encoder_cmd *ptr = retrace_v4l2_encoder_cmd_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_TRY_ENCODER_CMD, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_TRY_ENCODER_CMD");
+
+	free(ptr);
+}
+
+void retrace_vidioc_encoder_cmd(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_encoder_cmd *ptr = retrace_v4l2_encoder_cmd_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_ENCODER_CMD, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_ENCODER_CMD");
+
+	free(ptr);
+}
+
+void retrace_vidioc_g_selection(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_selection *ptr = retrace_v4l2_selection_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_G_SELECTION, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_SELECTION");
+
+	free(ptr);
+
+}
+
+void retrace_vidioc_s_selection(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_selection *ptr = retrace_v4l2_selection_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_S_SELECTION, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_S_SELECTION");
+
+	free(ptr);
+}
+
+struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
+{
+	struct v4l2_decoder_cmd *ptr = (struct v4l2_decoder_cmd *) calloc(1, sizeof(v4l2_decoder_cmd));
+
+	json_object *v4l2_decoder_cmd_obj;
+	json_object_object_get_ex(parent_obj, "v4l2_decoder_cmd", &v4l2_decoder_cmd_obj);
+
+	json_object *cmd_obj;
+	/* Since V4L2_DEC_CMD_START is 0, an empty key will be retraced as V4L2_DEC_CMD_START. */
+	if (json_object_object_get_ex(v4l2_decoder_cmd_obj, "cmd", &cmd_obj))
+		ptr->cmd = (__u32) s2val(json_object_get_string(cmd_obj), decoder_cmd_val_def);
+
+	std::string flags;
+	json_object *flags_obj;
+	if (json_object_object_get_ex(v4l2_decoder_cmd_obj, "flags", &flags_obj))
+		if (json_object_get_string(flags_obj) != nullptr)
+			flags = json_object_get_string(flags_obj);
+
+	switch (ptr->cmd) {
+	case V4L2_DEC_CMD_START: {
+		if (flags == "V4L2_DEC_CMD_START_MUTE_AUDIO")
+			ptr->flags = V4L2_DEC_CMD_START_MUTE_AUDIO;
+
+		json_object *start_obj;
+		json_object_object_get_ex(v4l2_decoder_cmd_obj, "start", &start_obj);
+
+		json_object *speed_obj;
+		if (json_object_object_get_ex(start_obj, "speed", &speed_obj))
+			ptr->start.speed = json_object_get_int(speed_obj);
+
+		std::string format;
+		json_object *format_obj;
+		if (json_object_object_get_ex(start_obj, "format", &format_obj))
+			if (json_object_get_string(format_obj) != nullptr)
+				format = json_object_get_string(format_obj);
+
+		if (format == "V4L2_DEC_START_FMT_GOP")
+			ptr->start.format = V4L2_DEC_START_FMT_GOP;
+		else if (format == "V4L2_DEC_START_FMT_NONE")
+			ptr->start.format = V4L2_DEC_START_FMT_NONE;
+		break;
+	}
+	case V4L2_DEC_CMD_STOP: {
+		if (flags == "V4L2_DEC_CMD_STOP_TO_BLACK")
+			ptr->flags = V4L2_DEC_CMD_STOP_TO_BLACK;
+		else if (flags == "V4L2_DEC_CMD_STOP_IMMEDIATELY")
+			ptr->flags = V4L2_DEC_CMD_STOP_IMMEDIATELY;
+
+		json_object *stop_obj;
+		json_object_object_get_ex(v4l2_decoder_cmd_obj, "stop", &stop_obj);
+
+		json_object *pts_obj;
+		if (json_object_object_get_ex(stop_obj, "pts", &pts_obj))
+			ptr->stop.pts = (__u64) json_object_get_uint64(pts_obj);
+		break;
+	}
+	case V4L2_DEC_CMD_PAUSE: {
+		if (flags == "V4L2_DEC_CMD_PAUSE_TO_BLACK")
+			ptr->flags = V4L2_DEC_CMD_PAUSE_TO_BLACK;
+		break;
+	}
+	default:
+		break;
+	}
+
+	return ptr;
+}
+
+void retrace_vidioc_try_decoder_cmd(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_decoder_cmd *ptr = retrace_v4l2_decoder_cmd(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_TRY_DECODER_CMD, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_TRY_DECODER_CMD");
+
+	free (ptr);
+}
+
+void retrace_vidioc_decoder_cmd(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_decoder_cmd *ptr = retrace_v4l2_decoder_cmd(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_DECODER_CMD, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_DECODER_CMD");
+
+	free (ptr);
+}
+
+void retrace_vidioc_query_ext_ctrl(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_query_ext_ctrl *ptr = retrace_v4l2_query_ext_ctrl_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_QUERY_EXT_CTRL, ptr);
+
+	if (is_verbose())
+		perror("VIDIOC_QUERY_EXT_CTRL");
+
+	free(ptr);
+}
+
+void retrace_vidioc_enum_fmt(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_fmtdesc *ptr = retrace_v4l2_fmtdesc_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_ENUM_FMT, ptr);
+
+	if (is_verbose())
+		perror("VIDIOC_ENUM_FMT");
+
+	free(ptr);
+}
+
+void retrace_vidioc_querycap(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_capability *ptr = retrace_v4l2_capability_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_QUERYCAP, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_QUERYCAP");
+
+	free(ptr);
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
+}
+
+void retrace_ioctl(json_object *syscall_obj)
+{
+	long cmd = 0;
+	int fd_retrace = 0;
+
+	json_object *fd_trace_obj;
+	json_object_object_get_ex(syscall_obj, "fd", &fd_trace_obj);
+	fd_retrace = get_fd_retrace_from_fd_trace(json_object_get_int(fd_trace_obj));
+	if (fd_retrace < 0) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "bad file descriptor\n");
+		return;
+	}
+
+	json_object *cmd_obj;
+	json_object_object_get_ex(syscall_obj, "ioctl", &cmd_obj);
+	cmd = s2val(json_object_get_string(cmd_obj), ioctl_val_def);
+
+	json_object *ioctl_args_user;
+	json_object_object_get_ex(syscall_obj, "from_userspace", &ioctl_args_user);
+
+	json_object *ioctl_args_driver;
+	json_object_object_get_ex(syscall_obj, "from_driver", &ioctl_args_driver);
+
+	switch (cmd) {
+	case VIDIOC_QUERYCAP:
+		retrace_vidioc_querycap(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_ENUM_FMT:
+		retrace_vidioc_enum_fmt(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_TRY_FMT:
+		retrace_vidioc_try_fmt(fd_retrace, ioctl_args_user);
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
+	case VIDIOC_G_PARM:
+		retrace_vidioc_g_parm(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_PARM:
+		retrace_vidioc_s_parm(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_G_CTRL:
+		retrace_vidioc_g_control(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_CTRL:
+		retrace_vidioc_s_control(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_QUERYCTRL:
+		retrace_vidioc_queryctrl(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_G_CROP:
+		retrace_vidioc_g_crop(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_CROP:
+		retrace_vidioc_s_crop(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_G_EXT_CTRLS:
+		retrace_vidioc_g_ext_ctrls(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_TRY_EXT_CTRLS:
+		retrace_vidioc_try_ext_ctrls(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_EXT_CTRLS:
+		retrace_vidioc_s_ext_ctrls(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_TRY_ENCODER_CMD:
+		retrace_vidioc_try_encoder_cmd(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_ENCODER_CMD:
+		retrace_vidioc_encoder_cmd(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_CREATE_BUFS:
+		retrace_vidioc_create_bufs(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_G_SELECTION:
+		retrace_vidioc_g_selection(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_SELECTION:
+		retrace_vidioc_s_selection(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_PREPARE_BUF:
+		retrace_vidioc_prepare_buf(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_TRY_DECODER_CMD:
+		retrace_vidioc_try_decoder_cmd(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_DECODER_CMD:
+		retrace_vidioc_decoder_cmd(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_QUERY_EXT_CTRL:
+		retrace_vidioc_query_ext_ctrl(fd_retrace, ioctl_args_user);
+		break;
+	case MEDIA_IOC_REQUEST_ALLOC:
+		retrace_media_ioc_request_alloc(fd_retrace, ioctl_args_driver);
+		break;
+	case MEDIA_REQUEST_IOC_QUEUE:
+		ioctl(fd_retrace, MEDIA_REQUEST_IOC_QUEUE);
+		break;
+	case MEDIA_REQUEST_IOC_REINIT:
+		ioctl(fd_retrace, MEDIA_REQUEST_IOC_REINIT);
+		break;
+	default:
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "warning: cannot retrace ioctl");
+		if (json_object_get_string(cmd_obj) != nullptr)
+			fprintf(stderr, ": \'%s\'\n", json_object_get_string(cmd_obj));
+		else
+			fprintf(stderr, "\n");
+		break;
+	}
+}
+
+void retrace_mem(json_object *mem_obj)
+{
+	json_object *type_obj;
+	json_object_object_get_ex(mem_obj, "mem_dump", &type_obj);
+	v4l2_buf_type type = (v4l2_buf_type) s2val(json_object_get_string(type_obj),
+	                                           v4l2_buf_type_val_def);
+	json_object *bytesused_obj;
+	json_object_object_get_ex(mem_obj, "bytesused", &bytesused_obj);
+	int bytesused = json_object_get_int64(bytesused_obj);
+	if (bytesused == 0)
+		return;
+
+	json_object *offset_obj;
+	json_object_object_get_ex(mem_obj, "offset", &offset_obj);
+	__u32 offset = json_object_get_int64(offset_obj);
+
+	json_object *address_obj;
+	json_object_object_get_ex(mem_obj, "address", &address_obj);
+	long buffer_address_trace = json_object_get_int64(address_obj);
+
+	long buffer_address_retrace = get_retrace_address_from_trace_address(buffer_address_trace);
+
+	unsigned char *buffer_pointer = (unsigned char *) buffer_address_retrace;
+
+	/* Get the encoded data from the json file and write it to output buffer memory. */
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE || type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		write_to_output_buffer(buffer_pointer, bytesused, mem_obj);
+
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s, bytesused: %d, offset: %d, addr: %ld\n",
+		        buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
+		print_context();
+	}
+}
+
+void retrace_object(json_object *jobj)
+{
+	errno = 0;
+	json_object *temp_obj;
+	if (json_object_object_get_ex(jobj, "ioctl", &temp_obj)) {
+		retrace_ioctl(jobj);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "open", &temp_obj)) {
+		retrace_open(jobj, false);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "open64", &temp_obj)) {
+		retrace_open(jobj, true);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "close", &temp_obj)) {
+		retrace_close(jobj);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "mmap", &temp_obj)) {
+		retrace_mmap(jobj, false);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "mmap64", &temp_obj)) {
+		retrace_mmap(jobj, true);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "munmap", &temp_obj)) {
+		retrace_munmap(jobj);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "mem_dump", &temp_obj)) {
+		retrace_mem(jobj);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "package_version", &temp_obj)) {
+		compare_program_versions(jobj);
+		return;
+	}
+
+	if (json_object_object_get_ex(jobj, "Trace", &temp_obj)) {
+		return;
+	}
+
+	fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+	fprintf(stderr, "warning: unexpected JSON object in trace file.\n");
+}
+
+void retrace_array(json_object *root_array_obj)
+{
+	json_object *jobj;
+	struct array_list *array_list_pointer = json_object_get_array(root_array_obj);
+	size_t json_objects_in_file = array_list_length(array_list_pointer);
+
+	if (json_objects_in_file < 3) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "warning: trace file may be empty.\n");
+	}
+
+	for (size_t i = 0; i < json_objects_in_file; i++) {
+		jobj = (json_object *) array_list_get_idx(array_list_pointer, i);
+		retrace_object(jobj);
+	}
+}
+
+int retrace(std::string trace_filename)
+{
+	FILE *trace_file = fopen(trace_filename.c_str(), "r");
+	if (trace_file == nullptr) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "Trace file error: \'%s\'\n", trace_filename.c_str());
+		return 1;
+	}
+	fclose(trace_file);
+
+	fprintf(stderr, "Retracing: %s\n", trace_filename.c_str());
+
+	json_object *root_array_obj = json_object_from_file(trace_filename.c_str());
+
+	if (root_array_obj == nullptr) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "cannot get JSON-object from file: %s\n", trace_filename.c_str());
+		return 1;
+	}
+
+	retrace_array(root_array_obj);
+	json_object_put(root_array_obj);
+
+	return 0;
+}
diff --git a/utils/v4l2-tracer/retrace.h b/utils/v4l2-tracer/retrace.h
new file mode 100644
index 00000000..01157336
--- /dev/null
+++ b/utils/v4l2-tracer/retrace.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef RETRACE_H
+#define RETRACE_H
+
+#include "v4l2-tracer-common.h"
+#include "retrace-gen.h"
+
+struct buffer_retrace {
+	int fd;
+	__u32 type;
+	__u32 index;
+	__u32 offset;
+	long address_trace;
+	long address_retrace;
+};
+
+struct retrace_context {
+	/* Key is a file descriptor from the trace, value is the corresponding fd in the retrace. */
+	std::unordered_map<int, int> retrace_fds;
+	/* List of output and capture buffers being retraced. */
+	std::list<struct buffer_retrace> buffers;
+};
+
+int retrace(std::string trace_filename);
+
+bool buffer_in_retrace_context(int fd, __u32 offset = 0);
+int get_buffer_fd_retrace(__u32 type, __u32 index);
+void add_buffer_retrace(int fd, __u32 type, __u32 index, __u32 offset = 0);
+void remove_buffer_retrace(int fd);
+void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace);
+long get_retrace_address_from_trace_address(long address_trace);
+void add_fd(int fd_trace, int fd_retrace);
+int get_fd_retrace_from_fd_trace(int fd_trace);
+std::string get_path_retrace_from_path_trace(std::string path_trace, json_object *jobj);
+void write_to_output_buffer(unsigned char *buffer_pointer, int bytesused, json_object *mem_obj);
+void compare_program_versions(json_object *v4l2_tracer_info_obj);
+void print_context(void);
+
+#endif
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
new file mode 100644
index 00000000..0030272b
--- /dev/null
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -0,0 +1,500 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "trace.h"
+#include <math.h>
+
+struct trace_context ctx_trace = {};
+
+bool is_video_or_media_device(const char *path)
+{
+	std::string dev_path_video = "/dev/video";
+	std::string dev_path_media = "/dev/media";
+	bool is_video = strncmp(path, dev_path_video.c_str(), dev_path_video.length()) == 0;
+	bool is_media = strncmp(path, dev_path_media.c_str(), dev_path_media.length()) == 0;
+	return (is_video || is_media);
+}
+
+void add_device(int fd, std::string path)
+{
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "fd: %d, path: %s\n", fd, path.c_str());
+	}
+	std::pair<int, std::string> new_pair = std::make_pair(fd, path);
+	ctx_trace.devices.insert(new_pair);
+}
+
+std::string get_device(int fd)
+{
+	std::string path;
+	std::unordered_map<int, std::string>::const_iterator it;
+	it = ctx_trace.devices.find(fd);
+	if (it != ctx_trace.devices.end())
+		path = it->second;
+	return path;
+}
+
+void print_devices(void)
+{
+	if (ctx_trace.devices.size())
+		fprintf(stderr, "Devices:\n");
+	for (auto &device_pair : ctx_trace.devices)
+		fprintf(stderr, "fd: %d, path: %s\n", device_pair.first, device_pair.second.c_str());
+}
+
+void print_decode_order(void)
+{
+	fprintf(stderr, "Decode order: ");
+	for (auto &num : ctx_trace.decode_order)
+		fprintf(stderr, "%ld, ",  num);
+	fprintf(stderr, ".\n");
+}
+
+void set_decode_order(long decode_order)
+{
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%ld\n", decode_order);
+	}
+
+	std::list<long>::iterator it;
+	it = find(ctx_trace.decode_order.begin(), ctx_trace.decode_order.end(), decode_order);
+	if (it == ctx_trace.decode_order.end())
+		ctx_trace.decode_order.push_front(decode_order);
+
+	if (is_debug())
+		print_decode_order();
+}
+
+long get_decode_order(void)
+{
+	long decode_order = 0;
+	if (!ctx_trace.decode_order.empty())
+		decode_order = ctx_trace.decode_order.front();
+	return decode_order;
+}
+
+void add_buffer_trace(int fd, __u32 type, __u32 index, __u32 offset = 0)
+{
+	struct buffer_trace buf = {};
+	buf.fd = fd;
+	buf.type = type;
+	buf.index = index;
+	buf.offset = offset;
+	buf.display_order = -1;
+	ctx_trace.buffers.push_front(buf);
+}
+
+void remove_buffer_trace(int fd)
+{
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			ctx_trace.buffers.erase(it);
+			break;
+		}
+	}
+}
+
+bool buffer_in_trace_context(int fd, __u32 offset)
+{
+	bool buffer_in_trace_context = false;
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			buffer_in_trace_context = true;
+			break;
+		}
+	}
+	return buffer_in_trace_context;
+}
+
+int get_buffer_fd_trace(__u32 type, __u32 index)
+{
+	int fd = 0;
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.type == type) && (b.index == index)) {
+			fd = b.fd;
+			break;
+		}
+	}
+	return fd;
+}
+
+__u32 get_buffer_type_trace(int fd, __u32 offset)
+{
+	__u32 type = 0;
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			type = b.type;
+			break;
+		}
+	}
+	return type;
+}
+
+int get_buffer_index_trace(int fd, __u32 offset)
+{
+	int index = -1;
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			index = b.index;
+			break;
+		}
+	}
+	return index;
+}
+
+__u32 get_buffer_offset_trace(__u32 type, __u32 index)
+{
+	__u32 offset = 0;
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.type == type) && (b.index == index)) {
+			offset = b.offset;
+			break;
+		}
+	}
+	return offset;
+}
+
+void set_buffer_bytesused_trace(int fd, __u32 offset, __u32 bytesused)
+{
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.bytesused = bytesused;
+			break;
+		}
+	}
+}
+
+long get_buffer_bytesused_trace(int fd, __u32 offset)
+{
+	long bytesused = 0;
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			bytesused = b.bytesused;
+			break;
+		}
+	}
+	return bytesused;
+}
+
+void set_buffer_display_order(int fd, __u32 offset, long display_order)
+{
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%ld\n", display_order);
+	}
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.display_order = display_order;
+			break;
+		}
+	}
+}
+
+void set_buffer_address_trace(int fd, __u32 offset, unsigned long address)
+{
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.address = address;
+			break;
+		}
+	}
+}
+
+unsigned long get_buffer_address_trace(int fd, __u32 offset)
+{
+	unsigned long address = 0;
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			address = b.address;
+			break;
+		}
+	}
+	return address;
+}
+
+bool buffer_is_mapped(unsigned long buffer_address)
+{
+	bool ret = false;
+	for (auto &b : ctx_trace.buffers) {
+		if (b.address == buffer_address) {
+			ret = true;
+			break;
+		}
+	}
+	return ret;
+}
+
+void print_buffers_trace(void)
+{
+	for (auto &b : ctx_trace.buffers) {
+		fprintf(stderr, "fd: %d, %s, index: %d, display_order: %ld, bytesused: %d, ",
+		        b.fd, buftype2s(b.type).c_str(), b.index, b.display_order, b.bytesused);
+		fprintf(stderr, "address: %lu, offset: %u \n",  b.address, b.offset);
+	}
+}
+
+unsigned get_expected_length_trace()
+{
+	/*
+	 * TODO: this assumes that the stride is equal to the real width and that the
+	 * padding follows the end of the chroma plane. It could be improved by
+	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_frame()
+	 */
+	unsigned expected_length = ctx_trace.width * ctx_trace.height;
+	if (ctx_trace.pixelformat == V4L2_PIX_FMT_NV12 || ctx_trace.pixelformat == V4L2_PIX_FMT_YUV420) {
+		expected_length *= 3;
+		expected_length /= 2;
+		expected_length += (expected_length % 2);
+	}
+	return expected_length;
+}
+
+void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
+{
+	if (ext_controls->which != V4L2_CTRL_WHICH_REQUEST_VAL)
+		return;
+
+	if (is_debug())
+		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+
+	/*
+	 * Since userspace sends H264 frames out of order, get information
+	 * about the correct display order of each frame so that v4l2-tracer
+	 * can write the decoded frames to a file.
+	 */
+	for (__u32 i = 0; i < ext_controls->count; i++) {
+		struct v4l2_ext_control ctrl = ext_controls->controls[i];
+
+		switch (ctrl.id) {
+		case V4L2_CID_STATELESS_H264_SPS: {
+			ctx_trace.fmt.h264.max_pic_order_cnt_lsb = pow(2, ctrl.p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 + 4);
+			break;
+		}
+		case V4L2_CID_STATELESS_H264_DECODE_PARAMS: {
+			long pic_order_cnt_msb;
+			int max = ctx_trace.fmt.h264.max_pic_order_cnt_lsb;
+			long prev_pic_order_cnt_msb = get_decode_order();
+			int prev_pic_order_cnt_lsb = ctx_trace.fmt.h264.pic_order_cnt_lsb;
+			int pic_order_cnt_lsb = ctrl.p_h264_decode_params->pic_order_cnt_lsb;
+
+			if (is_debug()) {
+				fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "\tprev_pic_order_cnt_lsb: %d\n", prev_pic_order_cnt_lsb);
+				fprintf(stderr, "\tprev_pic_order_cnt_msb: %ld\n", prev_pic_order_cnt_msb);
+				fprintf(stderr, "\tpic_order_cnt_lsb: %d\n", pic_order_cnt_lsb);
+			}
+
+			/*
+			 * TODO: improve the displaying of decoded frames following H264 specification
+			 * 8.2.1.1. For now, dump all the previously decoded frames when an IDR_PIC is
+			 * received to avoid losing frames although this will still sometimes result
+			 * in frames out of order.
+			 */
+			if ((ctrl.p_h264_decode_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) != 0U) {
+				if (ctx_trace.compressed_frame_count != 0)
+					trace_mem_decoded();
+			}
+
+			/*
+			 * When pic_order_cnt_lsb wraps around to zero, adjust the total count using
+			 * max to keep the correct display order.
+			 */
+			if ((pic_order_cnt_lsb < prev_pic_order_cnt_lsb) &&
+				((prev_pic_order_cnt_lsb - pic_order_cnt_lsb) >= (max / 2))) {
+				pic_order_cnt_msb = prev_pic_order_cnt_msb + max;
+			} else if ((pic_order_cnt_lsb > prev_pic_order_cnt_lsb) &&
+				((pic_order_cnt_lsb - prev_pic_order_cnt_lsb) > (max / 2))) {
+				pic_order_cnt_msb = prev_pic_order_cnt_msb - max;
+			} else {
+				pic_order_cnt_msb = prev_pic_order_cnt_msb + (pic_order_cnt_lsb - prev_pic_order_cnt_lsb);
+			}
+
+			if (is_debug()) {
+				fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "\tpic_order_cnt_msb: %ld\n", pic_order_cnt_msb);
+			}
+			ctx_trace.fmt.h264.pic_order_cnt_lsb = pic_order_cnt_lsb;
+			set_decode_order(pic_order_cnt_msb);
+			break;
+		}
+		default:
+			break;
+		}
+	}
+}
+
+void qbuf_setup(struct v4l2_buffer *buf)
+{
+	if (is_debug()) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s, index: %d\n", buftype2s((int) buf->type).c_str(), buf->index);
+	}
+
+	int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
+	__u32 buf_offset = get_buffer_offset_trace(buf->type, buf->index);
+
+	__u32 bytesused = 0;
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		bytesused = buf->m.planes[0].bytesused;
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT || buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		bytesused = buf->bytesused;
+	set_buffer_bytesused_trace(buf_fd, buf_offset, bytesused);
+
+	/* The output buffer should have compressed data just before it is queued, so trace it. */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		trace_mem_encoded(buf_fd, buf_offset);
+		ctx_trace.compressed_frame_count = ctx_trace.compressed_frame_count + 1;
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+
+		/* If the capture buffer is queued for reuse, trace it before it is reused. */
+		if (ctx_trace.compressed_frame_count != 0)
+			trace_mem_decoded();
+
+		/* H264 sets display order in controls, otherwise display just in the order queued. */
+		if (ctx_trace.compression_format != V4L2_PIX_FMT_H264_SLICE)
+			set_decode_order(get_decode_order() + 1);
+
+		set_buffer_display_order(buf_fd, buf_offset, get_decode_order());
+
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			print_decode_order();
+			print_buffers_trace();
+		}
+	}
+}
+
+void streamoff_cleanup(v4l2_buf_type buf_type)
+{
+
+	if (is_debug())
+		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+	if (is_verbose() || (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE") != nullptr)) {
+		fprintf(stderr, "VIDIOC_STREAMOFF: %s\n", buftype2s(buf_type).c_str());
+		fprintf(stderr, "%s, %s %s, width: %d, height: %d\n",
+		        val2s(ctx_trace.compression_format, v4l2_pix_fmt_val_def).c_str(),
+		        val2s(ctx_trace.pixelformat, v4l2_pix_fmt_val_def).c_str(),
+		        fcc2s(ctx_trace.pixelformat).c_str(), ctx_trace.width, ctx_trace.height);
+	}
+
+	/*
+	 * Before turning off the stream, trace any remaining capture buffers that were missed
+	 * because they were not queued for reuse.
+	 */
+	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		if (ctx_trace.compressed_frame_count != 0)
+			trace_mem_decoded();
+	}
+}
+
+void g_fmt_setup_trace(struct v4l2_format *format)
+{
+	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		ctx_trace.width = format->fmt.pix.width;
+		ctx_trace.height = format->fmt.pix.height;
+		ctx_trace.pixelformat = format->fmt.pix.pixelformat;
+	}
+	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		ctx_trace.width = format->fmt.pix_mp.width;
+		ctx_trace.height = format->fmt.pix_mp.height;
+		ctx_trace.pixelformat = format->fmt.pix_mp.pixelformat;
+	}
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		ctx_trace.compression_format = format->fmt.pix.pixelformat;
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		ctx_trace.compression_format = format->fmt.pix_mp.pixelformat;
+}
+
+void s_fmt_setup(struct v4l2_format *format)
+{
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		ctx_trace.compression_format = format->fmt.pix.pixelformat;
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		ctx_trace.compression_format = format->fmt.pix_mp.pixelformat;
+}
+
+void expbuf_setup(struct v4l2_exportbuffer *export_buffer)
+{
+	__u32 type = export_buffer->type;
+	__u32 index = export_buffer->index;
+	int fd_found_in_trace_context = get_buffer_fd_trace(type, index);
+
+	/* If the buffer was already added to the trace context don't add it again. */
+	if (fd_found_in_trace_context == export_buffer->fd)
+		return;
+
+	/*
+	 * If a buffer was previously added to the trace context using the video device
+	 * file descriptor, replace the video fd with the more specific buffer fd from EXPBUF.
+	 */
+	if (fd_found_in_trace_context != 0)
+		remove_buffer_trace(fd_found_in_trace_context);
+
+	add_buffer_trace(export_buffer->fd, type, index);
+}
+
+void querybuf_setup(int fd, struct v4l2_buffer *buf)
+{
+	/* If the buffer was already added to the trace context don't add it again. */
+	if (get_buffer_fd_trace(buf->type, buf->index) != 0)
+		return;
+
+	if (buf->memory == V4L2_MEMORY_MMAP) {
+		__u32 offset = 0;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT))
+			offset = buf->m.offset;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+			offset = buf->m.planes->m.mem_offset;
+		add_buffer_trace(fd, buf->type, buf->index, offset);
+	}
+}
+
+void query_ext_ctrl_setup(int fd, struct v4l2_query_ext_ctrl *ptr)
+{
+	if (ptr->flags & (V4L2_CTRL_FLAG_HAS_PAYLOAD|V4L2_CTRL_FLAG_DYNAMIC_ARRAY)) {
+		if (ptr->id == V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS)
+			ctx_trace.elems = ptr->elems;
+	}
+}
+
+void write_json_object_to_json_file(json_object *jobj)
+{
+	std::string json_str;
+	if (getenv("V4L2_TRACER_OPTION_COMPACT_PRINT") != nullptr)
+		json_str = json_object_to_json_string_ext(jobj, JSON_C_TO_STRING_PLAIN);
+	else
+		json_str = json_object_to_json_string_ext(jobj, JSON_C_TO_STRING_PRETTY);
+
+	if (ctx_trace.trace_file == nullptr) {
+		std::string filename;
+		if (getenv("TRACE_ID") != nullptr)
+			filename = getenv("TRACE_ID");
+		ctx_trace.trace_filename = filename;
+		ctx_trace.trace_filename += ".json";
+		ctx_trace.trace_file = fopen(ctx_trace.trace_filename.c_str(), "a");
+	}
+
+	fwrite(json_str.c_str(), sizeof(char), json_str.length(), ctx_trace.trace_file);
+	fputs(",\n", ctx_trace.trace_file);
+	fflush(ctx_trace.trace_file);
+}
+
+void close_json_file(void)
+{
+	if (ctx_trace.trace_file != nullptr) {
+		fclose(ctx_trace.trace_file);
+		ctx_trace.trace_file = 0;
+	}
+}
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
new file mode 100644
index 00000000..cff78315
--- /dev/null
+++ b/utils/v4l2-tracer/trace.cpp
@@ -0,0 +1,593 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "trace.h"
+
+extern struct trace_context ctx_trace;
+
+void trace_open(int fd, const char *path, int oflag, mode_t mode, bool is_open64)
+{
+	json_object *open_obj = json_object_new_object();
+	json_object_object_add(open_obj, "fd", json_object_new_int(fd));
+
+	json_object *open_args = json_object_new_object();
+	json_object_object_add(open_args, "path", json_object_new_string(path));
+	json_object_object_add(open_args, "oflag",
+	                       json_object_new_string(val2s(oflag, open_val_def).c_str()));
+	json_object_object_add(open_args, "mode", json_object_new_string(number2s_oct(mode).c_str()));
+	if (is_open64)
+		json_object_object_add(open_obj, "open64", open_args);
+	else
+		json_object_object_add(open_obj, "open", open_args);
+
+	/* Add additional topology information about device. */
+	std::string path_str = path;
+	bool is_media = path_str.find("media") != std::string::npos;
+	bool is_video = path_str.find("video") != std::string::npos;
+
+	int media_fd = -1;
+	if (is_media)
+		media_fd = fd;
+
+	std::string driver;
+	if (is_video) {
+		struct v4l2_capability cap = {};
+		setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+		ioctl(fd, VIDIOC_QUERYCAP, &cap);
+		unsetenv("V4L2_TRACER_PAUSE_TRACE");
+
+		std::string path_media = get_path_media(reinterpret_cast<const char *>(cap.driver));
+
+		setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+		media_fd = open(path_media.c_str(), O_RDONLY);
+		unsetenv("V4L2_TRACER_PAUSE_TRACE");
+	}
+
+	struct media_device_info info = {};
+	ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &info);
+
+	json_object_object_add(open_obj, "driver", json_object_new_string(info.driver));
+	json_object_object_add(open_obj, "bus_info", json_object_new_string(info.bus_info));
+
+	if (is_video) {
+		std::list<std::string> linked_entities = get_linked_entities(media_fd, path_str);
+		json_object *linked_entities_obj = json_object_new_array();
+		for (auto &name : linked_entities)
+			json_object_array_add(linked_entities_obj, json_object_new_string(name.c_str()));
+		json_object_object_add(open_obj, "linked_entities", linked_entities_obj);
+		setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+		close(media_fd);
+		unsetenv("V4L2_TRACER_PAUSE_TRACE");
+	}
+
+	write_json_object_to_json_file(open_obj);
+	json_object_put(open_obj);
+}
+
+void trace_mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off, unsigned long buf_address, bool is_mmap64)
+{
+	json_object *mmap_obj = json_object_new_object();
+
+	if (errno)
+		json_object_object_add(mmap_obj, "errno", json_object_new_string(strerrorname_np(errno)));
+
+	json_object *mmap_args = json_object_new_object();
+	json_object_object_add(mmap_args, "addr", json_object_new_int64((int64_t)addr));
+	json_object_object_add(mmap_args, "len", json_object_new_uint64(len));
+	json_object_object_add(mmap_args, "prot", json_object_new_int(prot));
+	json_object_object_add(mmap_args, "flags", json_object_new_string(number2s(flags).c_str()));
+	json_object_object_add(mmap_args, "fildes", json_object_new_int(fildes));
+	json_object_object_add(mmap_args, "off", json_object_new_int64(off));
+
+	if (is_mmap64)
+		json_object_object_add(mmap_obj, "mmap64", mmap_args);
+	else
+		json_object_object_add(mmap_obj, "mmap", mmap_args);
+
+	json_object_object_add(mmap_obj, "buffer_address", json_object_new_uint64(buf_address));
+
+	write_json_object_to_json_file(mmap_obj);
+	json_object_put(mmap_obj);
+}
+
+json_object *trace_buffer(unsigned char *buffer_pointer, __u32 bytesused)
+{
+	const int BUF_SIZE = 5;
+	const int MAX_BYTES_PER_LINE = 32;
+	char buf[BUF_SIZE];
+	std::string str;
+	int byte_count_per_line = 0;
+	json_object *mem_array_obj = json_object_new_array();
+
+	for (__u32 i = 0; i < bytesused; i++) {
+		memset(buf, 0, BUF_SIZE);
+		/* Each byte e.g. D9 will write a string of two characters "D9". */
+		sprintf(buf, "%02x", buffer_pointer[i]);
+		str += buf;
+		byte_count_per_line++;
+
+		/*  Add a newline every 32 bytes. */
+		if (byte_count_per_line == MAX_BYTES_PER_LINE) {
+			byte_count_per_line = 0;
+			json_object_array_add(mem_array_obj, json_object_new_string(str.c_str()));
+			str.clear();
+		} else if (getenv("V4L2_TRACER_OPTION_COMPACT_PRINT") == nullptr) {
+			/* Add a space every byte e.g. "01 2A 40 01" */
+			str += " ";
+		}
+	}
+
+	/* Trace the last line if it was less than a full line. */
+	if (byte_count_per_line)
+		json_object_array_add(mem_array_obj, json_object_new_string(str.c_str()));
+
+	return mem_array_obj;
+}
+
+void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start)
+{
+	json_object *mem_obj = json_object_new_object();
+	json_object_object_add(mem_obj, "mem_dump",
+	                       json_object_new_string(val2s(type, v4l2_buf_type_val_def).c_str()));
+	json_object_object_add(mem_obj, "fd", json_object_new_int(fd));
+	json_object_object_add(mem_obj, "offset", json_object_new_uint64(offset));
+	json_object_object_add(mem_obj, "index", json_object_new_int(index));
+	json_object_object_add(mem_obj, "bytesused", json_object_new_uint64(bytesused));
+	json_object_object_add(mem_obj, "address", json_object_new_uint64(start));
+
+	if ((type == V4L2_BUF_TYPE_VIDEO_OUTPUT || type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ||
+	    (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_JSON_FILE") != nullptr)) {
+		json_object *mem_array_obj = trace_buffer((unsigned char*) start, bytesused);
+		json_object_object_add(mem_obj, "mem_array", mem_array_obj);
+	}
+
+	write_json_object_to_json_file(mem_obj);
+
+	json_object_put(mem_obj);
+}
+
+void trace_mem_encoded(int fd, __u32 offset)
+{
+	unsigned long start = get_buffer_address_trace(fd, offset);
+	if (start == 0U)
+		return;
+
+	__u32 bytesused = get_buffer_bytesused_trace(fd, offset);
+	__u32 type = get_buffer_type_trace(fd, offset);
+	int index = get_buffer_index_trace(fd, offset);
+	trace_mem(fd, offset, type, index, bytesused, start);
+}
+
+void trace_mem_decoded(void)
+{
+	int displayed_count = 0;
+	unsigned expected_length = get_expected_length_trace();
+
+	while (!ctx_trace.decode_order.empty()) {
+		std::list<buffer_trace>::iterator it;
+		long next_frame_to_be_displayed = *std::min_element(ctx_trace.decode_order.begin(),
+		                                                    ctx_trace.decode_order.end());
+		for (it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+			if (it->display_order != next_frame_to_be_displayed)
+				continue;
+			if (!it->address)
+				break;
+			/*
+			 * If bytesused exceeds the expected length of the decoded video data,
+			 * then assume that this is extraneous padding or info added by the driver
+			 * and do not trace it.
+			 */
+			if (it->bytesused < expected_length)
+				break;
+			if (is_debug()) {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "displaying: %ld, %s, index: %d\n",
+				        it->display_order, buftype2s(it->type).c_str(), it->index);
+			}
+			displayed_count++;
+
+			if (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE") != nullptr) {
+				std::string filename;
+				if (getenv("TRACE_ID") != nullptr)
+					filename = getenv("TRACE_ID");
+				filename +=  ".yuv";
+				FILE *fp = fopen(filename.c_str(), "a");
+				unsigned char *buffer_pointer = (unsigned char*) it->address;
+				for (__u32 i = 0; i < expected_length; i++)
+					fwrite(&buffer_pointer[i], sizeof(unsigned char), 1, fp);
+				fclose(fp);
+			}
+			trace_mem(it->fd, it->offset, it->type, it->index, it->bytesused, it->address);
+			ctx_trace.decode_order.remove(next_frame_to_be_displayed);
+			it->display_order = -1;
+			break;
+		}
+		if (!it->address || it == ctx_trace.buffers.end() || it->bytesused < expected_length)
+			break;
+	}
+	ctx_trace.compressed_frame_count = ctx_trace.compressed_frame_count - displayed_count;
+}
+
+json_object *trace_v4l2_plane(struct v4l2_plane *ptr, __u32 memory)
+{
+	json_object *plane_obj = json_object_new_object();
+
+	json_object_object_add(plane_obj, "bytesused", json_object_new_int64(ptr->bytesused));
+	json_object_object_add(plane_obj, "length", json_object_new_int64(ptr->length));
+
+	json_object *m_obj = json_object_new_object();
+
+	if (memory == V4L2_MEMORY_MMAP)
+		json_object_object_add(m_obj, "mem_offset", json_object_new_int64(ptr->m.mem_offset));
+	json_object_object_add(plane_obj, "m", m_obj);
+
+	json_object_object_add(plane_obj, "data_offset", json_object_new_int64(ptr->data_offset));
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
+	json_object_object_add(buf_obj, "type",
+	                       json_object_new_string(val2s(buf->type, v4l2_buf_type_val_def).c_str()));
+	json_object_object_add(buf_obj, "bytesused", json_object_new_uint64(buf->bytesused));
+	json_object_object_add(buf_obj, "flags", json_object_new_string(fl2s_buffer(buf->flags).c_str()));
+	json_object_object_add(buf_obj, "field",
+	                       json_object_new_string(val2s(buf->field, v4l2_field_val_def).c_str()));
+	json_object *timestamp_obj = json_object_new_object();
+	json_object_object_add(timestamp_obj, "tv_sec", json_object_new_int64(buf->timestamp.tv_sec));
+	json_object_object_add(timestamp_obj, "tv_usec",
+	                       json_object_new_int64(buf->timestamp.tv_usec));
+	json_object_object_add(buf_obj, "timestamp", timestamp_obj);
+	json_object_object_add(buf_obj, "timestamp_ns",
+	                       json_object_new_uint64(v4l2_timeval_to_ns(&buf->timestamp)));
+
+	json_object_object_add(buf_obj, "sequence", json_object_new_uint64(buf->sequence));
+	json_object_object_add(buf_obj, "memory",
+	                       json_object_new_string(val2s(buf->memory, v4l2_memory_val_def).c_str()));
+
+	json_object *m_obj = json_object_new_object();
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		json_object *planes_obj = json_object_new_array();
+		/* TODO add planes > 0 */
+		json_object_array_add(planes_obj, trace_v4l2_plane(buf->m.planes, buf->memory));
+		json_object_object_add(m_obj, "planes", planes_obj);
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		if (buf->memory == V4L2_MEMORY_MMAP)
+			json_object_object_add(m_obj, "offset", json_object_new_uint64(buf->m.offset));
+	}
+	json_object_object_add(buf_obj, "m", m_obj);
+	json_object_object_add(buf_obj, "length", json_object_new_uint64(buf->length));
+
+	if (buf->flags & V4L2_BUF_FLAG_REQUEST_FD)
+		json_object_object_add(buf_obj, "request_fd", json_object_new_int(buf->request_fd));
+
+	json_object_object_add(ioctl_args, "v4l2_buffer", buf_obj);
+}
+
+void trace_vidioc_stream(void *arg, json_object *ioctl_args)
+{
+	v4l2_buf_type buf_type = *(static_cast<v4l2_buf_type*>(arg));
+	json_object_object_add(ioctl_args, "type",
+	                       json_object_new_string(val2s(buf_type, v4l2_buf_type_val_def).c_str()));
+}
+
+void trace_v4l2_streamparm(void *arg, json_object *ioctl_args)
+{
+	json_object *v4l2_streamparm_obj = json_object_new_object();
+	struct v4l2_streamparm *streamparm = static_cast<struct v4l2_streamparm*>(arg);
+
+	json_object_object_add(v4l2_streamparm_obj, "type",
+	                       json_object_new_string(val2s(streamparm->type, v4l2_buf_type_val_def).c_str()));
+
+	if ((streamparm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
+	    (streamparm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE))
+		trace_v4l2_captureparm_gen(&streamparm->parm, v4l2_streamparm_obj);
+
+	if ((streamparm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ||
+	    (streamparm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+		trace_v4l2_outputparm_gen(&streamparm->parm, v4l2_streamparm_obj);
+
+	json_object_object_add(ioctl_args, "v4l2_streamparm", v4l2_streamparm_obj);
+}
+
+void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_name = "")
+{
+	json_object *v4l2_ext_control_obj = json_object_new_object();
+	struct v4l2_ext_control *p = static_cast<struct v4l2_ext_control*>(arg);
+
+	json_object_object_add(v4l2_ext_control_obj, "id",
+	                       json_object_new_string(val2s(p->id, control_val_def).c_str()));
+	json_object_object_add(v4l2_ext_control_obj, "size", json_object_new_uint64(p->size));
+
+	/* trace controls of type V4L2_CTRL_TYPE_MENU */
+	switch (p->id) {
+	case V4L2_CID_STATELESS_H264_DECODE_MODE: {
+		json_object_object_add(v4l2_ext_control_obj, "value",
+		                       json_object_new_string(val2s(p->value, v4l2_stateless_h264_decode_mode_val_def).c_str()));
+		json_object_array_add(parent_obj, v4l2_ext_control_obj);
+		return;
+	}
+	case V4L2_CID_STATELESS_H264_START_CODE: {
+		json_object_object_add(v4l2_ext_control_obj, "value",
+		                       json_object_new_string(val2s(p->value, v4l2_stateless_h264_start_code_val_def).c_str()));
+		json_object_array_add(parent_obj, v4l2_ext_control_obj);
+		return;
+	}
+	case V4L2_CID_STATELESS_HEVC_DECODE_MODE: {
+		json_object_object_add(v4l2_ext_control_obj, "value",
+		                       json_object_new_string(val2s(p->value, v4l2_stateless_hevc_decode_mode_val_def).c_str()));
+		json_object_array_add(parent_obj, v4l2_ext_control_obj);
+		return;
+	}
+	case V4L2_CID_STATELESS_HEVC_START_CODE: {
+		json_object_object_add(v4l2_ext_control_obj, "value",
+		                       json_object_new_string(val2s(p->value, v4l2_stateless_hevc_start_code_val_def).c_str()));
+		json_object_array_add(parent_obj, v4l2_ext_control_obj);
+		return;
+	}
+	default:
+		break;
+	}
+
+	if (p->ptr == nullptr) {
+		json_object_array_add(parent_obj, v4l2_ext_control_obj);
+		return;
+	}
+
+	switch (p->id) {
+	case V4L2_CID_STATELESS_VP8_FRAME:
+		trace_v4l2_ctrl_vp8_frame_gen(p->p_vp8_frame, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SPS:
+		trace_v4l2_ctrl_h264_sps_gen(p->p_h264_sps, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PPS:
+		trace_v4l2_ctrl_h264_pps_gen(p->p_h264_pps, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
+		trace_v4l2_ctrl_h264_scaling_matrix_gen(p->p_h264_scaling_matrix, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
+		trace_v4l2_ctrl_h264_pred_weights_gen(p->p_h264_pred_weights, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
+		trace_v4l2_ctrl_h264_slice_params_gen(p->p_h264_slice_params, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
+		trace_v4l2_ctrl_h264_decode_params_gen(p->p_h264_decode_params, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_FWHT_PARAMS:
+		trace_v4l2_ctrl_fwht_params_gen(p->p_fwht_params, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_VP9_FRAME:
+		trace_v4l2_ctrl_vp9_frame_gen(p->p_vp9_frame, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
+		trace_v4l2_ctrl_vp9_compressed_hdr_gen(p->p_vp9_compressed_hdr_probs, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SPS:
+		trace_v4l2_ctrl_hevc_sps_gen(p->p_hevc_sps, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_PPS:
+		trace_v4l2_ctrl_hevc_pps_gen(p->p_hevc_pps, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:
+		trace_v4l2_ctrl_hevc_slice_params_gen(p->p_hevc_slice_params, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:
+		trace_v4l2_ctrl_hevc_scaling_matrix_gen(p->p_hevc_scaling_matrix, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
+		trace_v4l2_ctrl_hevc_decode_params_gen(p->p_hevc_decode_params, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS: {
+		/* V4L2_CTRL_TYPE_U32, V4L2_CTRL_FLAG_DYNAMIC_ARRAY */
+		__u32 elems = ctx_trace.elems;
+		json_object_object_add(v4l2_ext_control_obj, "elems", json_object_new_int64(elems));
+		json_object *hevc_entry_point_offsets_obj = json_object_new_array();
+		for (__u32 i = 0; i < elems; i++)
+			json_object_array_add(hevc_entry_point_offsets_obj, json_object_new_int64(p->p_u32[i]));
+		json_object_object_add(v4l2_ext_control_obj, "p_u32", hevc_entry_point_offsets_obj);
+		break;
+	}
+	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:
+		trace_v4l2_ctrl_mpeg2_sequence_gen(p->p_mpeg2_sequence, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_PICTURE:
+		trace_v4l2_ctrl_mpeg2_picture_gen(p->p_mpeg2_picture, v4l2_ext_control_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
+		trace_v4l2_ctrl_mpeg2_quantisation_gen(p->p_mpeg2_quantisation, v4l2_ext_control_obj);
+		break;
+	default:
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
+		break;
+	}
+
+	json_object_array_add(parent_obj, v4l2_ext_control_obj);
+}
+
+void trace_v4l2_ext_controls(void *arg, json_object *ioctl_args)
+{
+	json_object *ext_controls_obj = json_object_new_object();
+	struct v4l2_ext_controls *ext_controls = static_cast<struct v4l2_ext_controls*>(arg);
+
+	json_object_object_add(ext_controls_obj, "which",
+	                       json_object_new_string(val2s(ext_controls->which, which_val_def).c_str()));
+
+	json_object_object_add(ext_controls_obj, "count", json_object_new_int64(ext_controls->count));
+
+	/* error_idx is defined only if the ioctl returned an error  */
+	if (errno)
+		json_object_object_add(ext_controls_obj, "error_idx",
+		                       json_object_new_uint64(ext_controls->error_idx));
+
+	/* request_fd is only valid when "which" == V4L2_CTRL_WHICH_REQUEST_VAL */
+	if (ext_controls->which == V4L2_CTRL_WHICH_REQUEST_VAL)
+		json_object_object_add(ext_controls_obj, "request_fd",
+		                       json_object_new_int(ext_controls->request_fd));
+
+	json_object *controls_obj = json_object_new_array();
+	for (__u32 i = 0; i < ext_controls->count; i++) {
+		if ((void *) ext_controls->controls == nullptr)
+			break;
+		trace_v4l2_ext_control((void *) &ext_controls->controls[i], controls_obj);
+	}
+	json_object_object_add(ext_controls_obj, "controls", controls_obj);
+
+	json_object_object_add(ioctl_args, "v4l2_ext_controls", ext_controls_obj);
+}
+
+void trace_v4l2_decoder_cmd(void *arg, json_object *ioctl_args)
+{
+	json_object *v4l2_decoder_cmd_obj = json_object_new_object();
+	struct v4l2_decoder_cmd *ptr = static_cast<struct v4l2_decoder_cmd*>(arg);
+
+	json_object_object_add(v4l2_decoder_cmd_obj, "cmd",
+	                       json_object_new_string(val2s(ptr->cmd, decoder_cmd_val_def).c_str()));
+
+	std::string flags;
+
+	switch (ptr->cmd) {
+	case V4L2_DEC_CMD_START: {
+		/*  This command has one flag: V4L2_DEC_CMD_START_MUTE_AUDIO. */
+		if (ptr->flags == V4L2_DEC_CMD_START_MUTE_AUDIO)
+			flags = "V4L2_DEC_CMD_START_MUTE_AUDIO";
+
+		/* struct start */
+		json_object *start_obj = json_object_new_object();
+		json_object_object_add(start_obj, "speed", json_object_new_int(ptr->start.speed));
+
+		std::string format;
+		/* possible values V4L2_DEC_START_FMT_NONE, V4L2_DEC_START_FMT_GOP */
+		if (ptr->start.format == V4L2_DEC_START_FMT_GOP)
+			format = "V4L2_DEC_START_FMT_GOP";
+		else if (ptr->start.format == V4L2_DEC_START_FMT_NONE)
+			format = "V4L2_DEC_START_FMT_NONE";
+		json_object_object_add(start_obj, "format", json_object_new_string(format.c_str()));
+
+		json_object_object_add(v4l2_decoder_cmd_obj, "start", start_obj);
+		break;
+	}
+	case V4L2_DEC_CMD_STOP: {
+		/*  This command has two flags */
+		if (ptr->flags == V4L2_DEC_CMD_STOP_TO_BLACK)
+			flags = "V4L2_DEC_CMD_STOP_TO_BLACK";
+		else if (ptr->flags == V4L2_DEC_CMD_STOP_IMMEDIATELY)
+			flags = "V4L2_DEC_CMD_STOP_IMMEDIATELY";
+
+		json_object *stop_obj = json_object_new_object();
+		json_object_object_add(stop_obj, "pts", json_object_new_uint64(ptr->stop.pts));
+
+		json_object_object_add(v4l2_decoder_cmd_obj, "stop", stop_obj);
+		break;
+	}
+
+	case V4L2_DEC_CMD_PAUSE: {
+		if (ptr->flags == V4L2_DEC_CMD_PAUSE_TO_BLACK)
+			flags = "V4L2_DEC_CMD_PAUSE_TO_BLACK";
+		break;
+	}
+	case V4L2_DEC_CMD_RESUME:
+	case V4L2_DEC_CMD_FLUSH:
+	default:
+		break;
+	}
+	json_object_object_add(v4l2_decoder_cmd_obj, "flags", json_object_new_string(flags.c_str()));
+
+	json_object_object_add(ioctl_args, "v4l2_decoder_cmd", v4l2_decoder_cmd_obj);
+}
+
+json_object *trace_ioctl_args(unsigned long cmd, void *arg)
+{
+	json_object *ioctl_args = json_object_new_object();
+
+	switch (cmd) {
+	case VIDIOC_QUERYCAP:
+		trace_v4l2_capability_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_ENUM_FMT:
+		trace_v4l2_fmtdesc_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_G_FMT:
+	case VIDIOC_TRY_FMT:
+	case VIDIOC_S_FMT:
+		trace_v4l2_format_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_REQBUFS:
+		trace_v4l2_requestbuffers_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_PREPARE_BUF:
+	case VIDIOC_QUERYBUF:
+	case VIDIOC_QBUF:
+	case VIDIOC_DQBUF:
+		trace_v4l2_buffer(arg, ioctl_args);
+		break;
+	case VIDIOC_EXPBUF:
+		trace_v4l2_exportbuffer_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_STREAMON:
+	case VIDIOC_STREAMOFF:
+		trace_vidioc_stream(arg, ioctl_args);
+		break;
+	case VIDIOC_G_PARM:
+	case VIDIOC_S_PARM:
+		trace_v4l2_streamparm(arg, ioctl_args);
+		break;
+	case VIDIOC_G_CTRL:
+	case VIDIOC_S_CTRL:
+		trace_v4l2_control_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_QUERYCTRL:
+		trace_v4l2_queryctrl_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_G_CROP:
+	case VIDIOC_S_CROP:
+		trace_v4l2_crop_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_G_EXT_CTRLS:
+	case VIDIOC_TRY_EXT_CTRLS:
+	case VIDIOC_S_EXT_CTRLS:
+		trace_v4l2_ext_controls(arg, ioctl_args);
+		break;
+	case VIDIOC_TRY_ENCODER_CMD:
+	case VIDIOC_ENCODER_CMD:
+		trace_v4l2_encoder_cmd_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_CREATE_BUFS:
+		trace_v4l2_create_buffers_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_G_SELECTION:
+	case VIDIOC_S_SELECTION:
+		trace_v4l2_selection_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_TRY_DECODER_CMD:
+	case VIDIOC_DECODER_CMD:
+		trace_v4l2_decoder_cmd(arg, ioctl_args);
+		break;
+	case VIDIOC_QUERY_EXT_CTRL:
+		trace_v4l2_query_ext_ctrl_gen(arg, ioctl_args);
+		break;
+	case MEDIA_IOC_REQUEST_ALLOC: {
+		__s32 *request_fd = static_cast<__s32*>(arg);
+		json_object_object_add(ioctl_args, "request_fd", json_object_new_int(*request_fd));
+		break;
+	}
+	default:
+		break;
+	}
+
+	return ioctl_args;
+}
diff --git a/utils/v4l2-tracer/trace.h b/utils/v4l2-tracer/trace.h
new file mode 100644
index 00000000..1e8b17e7
--- /dev/null
+++ b/utils/v4l2-tracer/trace.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_H
+#define TRACE_H
+
+#include "v4l2-tracer-common.h"
+#include "trace-gen.h"
+
+struct buffer_trace {
+	int fd;
+	__u32 type;
+	__u32 index;
+	__u32 offset;
+	__u32 bytesused;
+	long display_order;
+	unsigned long address;
+};
+
+struct h264_info {
+	int pic_order_cnt_lsb;
+	int max_pic_order_cnt_lsb;
+};
+
+struct trace_context {
+	__u32 elems;
+	__u32 width;
+	__u32 height;
+	FILE *trace_file;
+	__u32 pixelformat;
+	std::string media_device;
+	__u32 compression_format;
+	union {
+		struct h264_info h264;
+	} fmt;
+	std::string trace_filename;
+	int compressed_frame_count;
+	std::list<long> decode_order;
+	std::list<struct buffer_trace> buffers;
+	std::unordered_map<int, std::string> devices; /* key:fd, value: path of the device */
+};
+
+void trace_open(int fd, const char *path, int oflag, mode_t mode, bool is_open64);
+void trace_mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off, unsigned long buf_address, bool is_mmap64);
+void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start);
+void trace_mem_encoded(int fd, __u32 offset);
+void trace_mem_decoded(void);
+json_object *trace_ioctl_args(unsigned long cmd, void *arg);
+
+bool is_video_or_media_device(const char *path);
+void add_device(int fd, std::string path);
+std::string get_device(int fd);
+void print_devices(void);
+bool buffer_in_trace_context(int fd, __u32 offset = 0);
+__u32 get_buffer_type_trace(int fd, __u32 offset = 0);
+int get_buffer_index_trace(int fd, __u32 offset);
+long get_buffer_bytesused_trace(int fd, __u32 offset);
+void set_buffer_address_trace(int fd, __u32 offset, unsigned long address);
+unsigned long get_buffer_address_trace(int fd, __u32 offset);
+bool buffer_is_mapped(unsigned long buffer_address);
+unsigned get_expected_length_trace(void);
+void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls);
+void qbuf_setup(struct v4l2_buffer *buf);
+void streamoff_cleanup(v4l2_buf_type buf_type);
+void g_fmt_setup_trace(struct v4l2_format *format);
+void s_fmt_setup(struct v4l2_format *format);
+void expbuf_setup(struct v4l2_exportbuffer *export_buffer);
+void querybuf_setup(int fd, struct v4l2_buffer *buf);
+void query_ext_ctrl_setup(int fd, struct v4l2_query_ext_ctrl *ptr);
+void write_json_object_to_json_file(json_object *jobj);
+void close_json_file(void);
+
+#endif
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.cpp b/utils/v4l2-tracer/v4l2-tracer-common.cpp
new file mode 100644
index 00000000..869347a1
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer-common.cpp
@@ -0,0 +1,476 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer-common.h"
+#include <iomanip>
+#include <iostream>
+#include <sstream>
+
+bool is_debug(void)
+{
+	return (getenv("V4L2_TRACER_OPTION_DEBUG") != nullptr);
+}
+
+bool is_verbose(void)
+{
+	return (getenv("V4L2_TRACER_OPTION_VERBOSE") != nullptr);
+}
+
+void print_v4l2_tracer_info(void)
+{
+	fprintf(stderr, "v4l2-tracer %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
+	if (strlen(STRING(GIT_SHA)) != 0U)
+		fprintf(stderr, "v4l2-tracer SHA: '%s' %s\n", STRING(GIT_SHA), STRING(GIT_COMMIT_DATE));
+}
+
+void print_usage(void)
+{
+	print_v4l2_tracer_info();
+	fprintf(stderr, "Usage:\n\tv4l2-tracer [options] trace <tracee>\n"
+	        "\tv4l2-tracer [options] retrace <trace_file>.json\n"
+	        "\tv4l2-tracer clean <trace_file>.json\n\n"
+
+	        "\tCommon options:\n"
+	        "\t\t-c, --compact     Write minimal whitespace in JSON file.\n"
+	        "\t\t-g, --debug       Turn on verbose reporting plus additional debug info.\n"
+	        "\t\t-h, --help        Display this message.\n"
+	        "\t\t-r  --raw         Write decoded video frame data to JSON file.\n"
+	        "\t\t-v, --verbose     Turn on verbose reporting.\n"
+	        "\t\t-y, --yuv         Write decoded video frame data to yuv file.\n\n"
+
+	        "\tRetrace options:\n"
+	        "\t\t-d, --video_device <dev>   Retrace with a specific video device.\n"
+	        "\t\t                           <dev> must be a digit corresponding to\n"
+	        "\t\t                           /dev/video<dev> \n\n"
+	        "\t\t-m, --media_device <dev>   Retrace with a specific media device.\n"
+	        "\t\t                           <dev> must be a digit corresponding to\n"
+	        "\t\t                           /dev/media<dev> \n\n");
+}
+
+void add_separator(std::string &str)
+{
+	if (!str.empty())
+		str += "|";
+}
+
+void clean_string(size_t idx, std::string substring_to_erase, std::string &str)
+{
+	std::string temp = substring_to_erase + '|';
+	if (str.find(temp) != std::string::npos)
+		str.erase(idx, temp.length());
+	else
+		str.erase(idx, substring_to_erase.length());
+}
+
+std::string ver2s(unsigned int version)
+{
+	const int mask = 0xff;
+	const int BUF_SIZE = 16;
+	char buf[BUF_SIZE];
+	sprintf(buf, "%d.%d.%d", version >> BUF_SIZE, (version >> (BUF_SIZE / 2)) & mask, version & mask);
+	return buf;
+}
+
+/* Convert a number to an octal string. If num is 0, return an empty string. */
+std::string number2s_oct(long num)
+{
+	const int min_width = 5;
+	std::stringstream stream;
+	stream << std::setfill ('0') << std::setw(min_width) << std::oct << num;
+	return stream.str();
+}
+
+/* Convert a number to a hex string. If num is 0, return an empty string. */
+std::string number2s(long num)
+{
+	if (num == 0)
+		return "";
+	std::stringstream stream;
+	stream << std::hex << num;
+	return "0x" + stream.str();
+}
+
+std::string val2s(long val, const val_def *def)
+{
+	if (def == nullptr)
+		return number2s(val);
+
+	while ((def->val != -1) && (def->val != val))
+		def++;
+
+	if (def->val == val)
+		return def->str;
+
+	return number2s(val);
+}
+
+std::string fl2s(unsigned val, const flag_def *def)
+{
+	std::string str;
+
+	if (def == nullptr)
+		return number2s(val);
+
+	while ((def->flag) != 0U) {
+		if ((val & def->flag) != 0U) {
+			add_separator(str);
+			str += def->str;
+			val &= ~def->flag;
+		}
+		def++;
+	}
+	if (val != 0U) {
+		add_separator(str);
+		str += number2s(val);
+	}
+
+	return str;
+}
+
+std::string fl2s_buffer(__u32 flags)
+{
+	std::string str;
+
+	switch (flags & V4L2_BUF_FLAG_TIMESTAMP_MASK) {
+	case V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN:
+		str += "V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN";
+		flags &= ~V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN;
+		break;
+	case V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC:
+		str += "V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC";
+		flags &= ~V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		break;
+	case V4L2_BUF_FLAG_TIMESTAMP_COPY:
+		str += "V4L2_BUF_FLAG_TIMESTAMP_COPY";
+		flags &= ~V4L2_BUF_FLAG_TIMESTAMP_COPY;
+		break;
+	default:
+		break;
+	}
+
+	/* Since V4L2_BUF_FLAG_TSTAMP_SRC_EOF == 0, at least this flag will always be added. */
+	add_separator(str);
+	switch (flags & V4L2_BUF_FLAG_TSTAMP_SRC_MASK) {
+	case V4L2_BUF_FLAG_TSTAMP_SRC_EOF:
+		str += "V4L2_BUF_FLAG_TSTAMP_SRC_EOF";
+		flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
+		break;
+	case V4L2_BUF_FLAG_TSTAMP_SRC_SOE:
+		str += "V4L2_BUF_FLAG_TSTAMP_SRC_SOE";
+		flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
+		break;
+	default:
+		break;
+	}
+
+	if (flags != 0U) {
+		add_separator(str);
+		const unsigned ts_mask = V4L2_BUF_FLAG_TIMESTAMP_MASK | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+		str += fl2s(flags & ~ts_mask, v4l2_buf_flag_def);
+	}
+
+	return str;
+}
+
+std::string fl2s_fwht(__u32 flags)
+{
+	std::string str;
+	switch (flags & V4L2_FWHT_FL_PIXENC_MSK) {
+	case V4L2_FWHT_FL_PIXENC_YUV:
+		str += "V4L2_FWHT_FL_PIXENC_YUV";
+		flags &= ~V4L2_FWHT_FL_PIXENC_YUV;
+		break;
+	case V4L2_FWHT_FL_PIXENC_RGB:
+		str += "V4L2_FWHT_FL_PIXENC_RGB";
+		flags &= ~V4L2_FWHT_FL_PIXENC_RGB;
+		break;
+	case V4L2_FWHT_FL_PIXENC_HSV:
+		str += "V4L2_FWHT_FL_PIXENC_HSV";
+		flags &= ~V4L2_FWHT_FL_PIXENC_HSV;
+		break;
+	default:
+		break;
+	}
+	add_separator(str);
+	str += fl2s(flags, v4l2_ctrl_fwht_params_flag_def);
+	return str;
+}
+
+long s2number(const char *char_str)
+{
+	if (char_str == nullptr)
+		return 0;
+
+	std::string str = char_str;
+
+	long num = 0;
+	if (str.empty())
+		return 0;
+	try {
+		num = std::strtol(str.c_str(), nullptr, 0); /* base is auto-detected */
+	} catch (std::invalid_argument& ia) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "string \'%s\' is invalid\n", str.c_str());
+	} catch (std::out_of_range& oor) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "string \'%s\' is out of range\n", str.c_str());
+	}
+	return num;
+}
+
+long s2val(const char *char_str, const val_def *def)
+{
+	if (char_str == nullptr)
+		return 0;
+	std::string str = char_str;
+
+	if (str.empty())
+		return 0;
+
+	if (def == nullptr)
+		return s2number(char_str);
+
+	while ((def->val != -1) && (def->str != str))
+		def++;
+
+	if (def->str == str)
+		return def->val;
+
+	return s2number(char_str);
+}
+
+unsigned long s2flags(const char *char_str, const flag_def *def)
+{
+	if (char_str == nullptr)
+		return 0;
+	std::string str = char_str;
+
+	size_t idx = 0;
+	unsigned long flags = 0;
+
+	if (def == nullptr)
+		return s2number(char_str);
+
+	while ((def->flag) != 0U) {
+		idx = str.find(def->str);
+		if (idx == std::string::npos) {
+			def++;
+			continue;
+		}
+		/* Stop false substring matches e.g. in V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS */
+		std::string check = def->str;
+		if (check.length() != str.length()) {
+			idx = str.find(check + '|');
+			if (idx == std::string::npos) {
+				def++;
+				continue;
+			}
+		}
+		flags += def->flag;
+		clean_string(idx, def->str, str);
+		def++;
+	}
+	if (!str.empty())
+		flags += s2number(str.c_str());
+
+	return flags;
+}
+
+unsigned long s2flags_buffer(const char *char_str)
+{
+	if (char_str == nullptr)
+		return 0;
+	std::string str = char_str;
+
+	size_t idx = 0;
+	unsigned long flags = 0;
+
+	idx = str.find("V4L2_BUF_FLAG_TIMESTAMP_COPY");
+	if (idx != std::string::npos) {
+		flags += V4L2_BUF_FLAG_TIMESTAMP_COPY;
+		clean_string(idx, "V4L2_BUF_FLAG_TIMESTAMP_COPY", str);
+	}
+	idx = str.find("V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC");
+	if (idx != std::string::npos) {
+		flags += V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		clean_string(idx, "V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC", str);
+	}
+	idx = str.find("V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN");
+	if (idx != std::string::npos) {
+		flags += V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN;
+		clean_string(idx, "V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN", str);
+	}
+	idx = str.find("V4L2_BUF_FLAG_TSTAMP_SRC_SOE");
+	if (idx != std::string::npos) {
+		flags += V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
+		clean_string(idx, "V4L2_BUF_FLAG_TSTAMP_SRC_SOE", str);
+	}
+	idx = str.find("V4L2_BUF_FLAG_TSTAMP_SRC_EOF");
+	if (idx != std::string::npos) {
+		flags += V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
+		clean_string(idx, "V4L2_BUF_FLAG_TSTAMP_SRC_EOF", str);
+	}
+	if (!str.empty())
+		flags += s2flags(str.c_str(), v4l2_buf_flag_def);
+	return flags;
+}
+
+unsigned long s2flags_fwht(const char *char_str)
+{
+	if (char_str == nullptr)
+		return 0;
+	std::string str = char_str;
+
+	size_t idx = 0;
+	unsigned long flags = 0;
+	idx = str.find("V4L2_FWHT_FL_PIXENC_YUV");
+	if (idx != std::string::npos) {
+		flags += V4L2_FWHT_FL_PIXENC_YUV;
+		clean_string(idx, "V4L2_FWHT_FL_PIXENC_YUV", str);
+	}
+	idx = str.find("V4L2_FWHT_FL_PIXENC_RGB");
+	if (idx != std::string::npos) {
+		flags += V4L2_FWHT_FL_PIXENC_RGB;
+		clean_string(idx, "V4L2_FWHT_FL_PIXENC_RGB", str);
+	}
+	idx = str.find("V4L2_FWHT_FL_PIXENC_HSV");
+	if (idx != std::string::npos) {
+		flags += V4L2_FWHT_FL_PIXENC_HSV;
+		clean_string(idx, "V4L2_FWHT_FL_PIXENC_HSV", str);
+	}
+	if (!str.empty())
+		flags += s2flags(str.c_str(), v4l2_ctrl_fwht_params_flag_def);
+	return flags;
+}
+
+std::string get_path_media(std::string driver)
+{
+	struct dirent *entry_pointer = nullptr;
+	std::string path_media;
+	DIR *directory_pointer = opendir("/dev");
+	if (directory_pointer == nullptr)
+		return path_media;
+
+	while ((entry_pointer = readdir(directory_pointer)) != nullptr) {
+		std::string media = "media";
+		const char *name = entry_pointer->d_name;
+		if ((memcmp(name, media.c_str(), media.length()) != 0) || (isdigit(name[media.length()]) == 0))
+			continue;
+
+		std::string media_devname = std::string("/dev/") + name;
+		setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+		int media_fd = open(media_devname.c_str(), O_RDONLY);
+		unsetenv("V4L2_TRACER_PAUSE_TRACE");
+		if (media_fd < 0)
+			continue;
+
+		struct media_device_info info = {};
+		if (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &info) || info.driver != driver) {
+			setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+			close(media_fd);
+			unsetenv("V4L2_TRACER_PAUSE_TRACE");
+			continue;
+		}
+		path_media = media_devname;
+		setenv("V4L2_TRACER_PAUSE_TRACE", "true", 0);
+		close(media_fd);
+		unsetenv("V4L2_TRACER_PAUSE_TRACE");
+	}
+	closedir(directory_pointer);
+	return path_media;
+}
+
+std::string get_path_video(int media_fd, std::list<std::string> linked_entities)
+{
+	int err = 0;
+	std::string path_video;
+	struct media_v2_topology topology = {};
+
+	err = ioctl(media_fd, MEDIA_IOC_G_TOPOLOGY, &topology);
+	if (err < 0)
+		return path_video;
+
+	std::vector<media_v2_interface> ifaces(topology.num_interfaces);
+	topology.ptr_interfaces = (uintptr_t) ifaces.data();
+
+	std::vector<media_v2_link> links(topology.num_links);
+	topology.ptr_links = (uintptr_t) links.data();
+
+	std::vector<media_v2_entity> ents(topology.num_entities);
+	topology.ptr_entities = (uintptr_t) ents.data();
+
+	err = ioctl(media_fd, MEDIA_IOC_G_TOPOLOGY, &topology);
+	if (err < 0)
+		return path_video;
+
+	for (auto &name : linked_entities) {
+		/* Find an entity listed in the video device's linked_entities. */
+		for (__u32 i = 0; i < topology.num_entities; i++) {
+			if (ents[i].name != name)
+				continue;
+			/* Find the first link connected to that entity. */
+			for (__u32 j = 0; j < topology.num_links; j++) {
+				if (links[j].sink_id != ents[i].id)
+					continue;
+				/* Find the interface connected to that link. */
+				for (__u32 k = 0; k < topology.num_interfaces; k++) {
+					if (ifaces[k].id != links[j].source_id)
+						continue;
+					std::string video_devname = mi_media_get_device(ifaces[k].devnode.major,
+					                                                ifaces[k].devnode.minor);
+					if (!video_devname.empty()) {
+						path_video = video_devname;
+						break;
+					}
+				}
+			}
+		}
+	}
+	return path_video;
+}
+
+std::list<std::string> get_linked_entities(int media_fd, std::string path_video)
+{
+	int err = 0;
+	std::list<std::string> linked_entities;
+	struct media_v2_topology topology = {};
+
+	err = ioctl(media_fd, MEDIA_IOC_G_TOPOLOGY, &topology);
+	if (err < 0)
+		return linked_entities;
+
+	std::vector<media_v2_interface> ifaces(topology.num_interfaces);
+	topology.ptr_interfaces = (uintptr_t) ifaces.data();
+
+	std::vector<media_v2_link> links(topology.num_links);
+	topology.ptr_links = (uintptr_t) links.data();
+
+	std::vector<media_v2_entity> ents(topology.num_entities);
+	topology.ptr_entities = (uintptr_t) ents.data();
+
+	err = ioctl(media_fd, MEDIA_IOC_G_TOPOLOGY, &topology);
+	if (err < 0)
+		return linked_entities;
+
+	/* find the interface corresponding to the path_video */
+	for (__u32 i = 0; i < topology.num_interfaces; i++) {
+		if (path_video != mi_media_get_device(ifaces[i].devnode.major, ifaces[i].devnode.minor))
+			continue;
+		/* find the links from that interface */
+		for (__u32 j = 0; j < topology.num_links; j++) {
+			if (links[j].source_id != ifaces[i].id)
+				continue;
+			/* find the entities connected by that link to the interface */
+			for (__u32 k = 0; k < topology.num_entities; k++) {
+				if (ents[k].id != links[j].sink_id)
+					continue;
+				linked_entities.push_back(ents[k].name);
+			}
+		}
+		if (linked_entities.size())
+			break;
+	}
+	return linked_entities;
+}
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
new file mode 100644
index 00000000..362a7ba6
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer-common.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef V4L2_TRACER_COMMON_H
+#define V4L2_TRACER_COMMON_H
+
+#include "v4l2-info.h"
+#include "codec-fwht.h"
+#include "config.h"
+#include "media-info.h"
+#include <algorithm>
+#include <dirent.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <json.h>
+#include <linux/media.h>
+#include <linux/videodev2.h>
+#include <list>
+#include <poll.h>
+#include <pthread.h>
+#include <stdexcept>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <unordered_map>
+#include <vector>
+
+#define STR(x) #x
+#define STRING(x) STR(x)
+
+struct val_def {
+	long val;
+	const char *str;
+};
+
+bool is_debug(void);
+bool is_verbose(void);
+void print_v4l2_tracer_info(void);
+void print_usage(void);
+std::string ver2s(unsigned int version);
+std::string number2s_oct(long num);
+std::string number2s(long num);
+std::string val2s(long val, const val_def *def);
+std::string fl2s(unsigned val, const flag_def *def);
+std::string fl2s_buffer(__u32 flags);
+std::string fl2s_fwht(__u32 flags);
+long s2number(const char *char_str);
+long s2val(const char *char_str, const val_def *def);
+unsigned long s2flags(const char *char_str, const flag_def *def);
+unsigned long s2flags_buffer(const char *char_str);
+unsigned long s2flags_fwht(const char *char_str);
+std::string which2s(unsigned long which);
+std::string get_path_media(std::string driver);
+std::string get_path_video(int media_fd, std::list<std::string> linked_entities);
+std::list<std::string> get_linked_entities(int media_fd, std::string path_video);
+
+constexpr val_def which_val_def[] = {
+	{ V4L2_CTRL_WHICH_CUR_VAL,	"V4L2_CTRL_WHICH_CUR_VAL" },
+	{ V4L2_CTRL_WHICH_DEF_VAL,	"V4L2_CTRL_WHICH_DEF_VAL" },
+	{ V4L2_CTRL_WHICH_REQUEST_VAL,	"V4L2_CTRL_WHICH_REQUEST_VAL" },
+	{ -1, "" }
+};
+
+constexpr val_def open_val_def[] = {
+	{ O_RDONLY,	"O_RDONLY" },
+	{ O_WRONLY,	"O_WRONLY" },
+	{ O_RDWR,	"O_RDWR" },
+	{ -1, "" }
+};
+
+#include "v4l2-tracer-info-gen.h"
+
+#endif
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
new file mode 100755
index 00000000..fe648182
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -0,0 +1,879 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0-only */
+# Copyright 2022 Collabora Ltd.
+
+sub convert_type_to_json_type {
+	my $type = shift;
+	if ($type eq __u8 || $type eq char || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32 || $type eq 'int') {
+		return "int";
+	}
+	if ($type eq __u32 || $type eq __le32 || $type eq __s64) {
+		return "int64";
+	}
+
+	# unsigned appears just twice in videodev2.h and in both cases it is 'unsigned long'
+	if ($type eq __u64 || $type eq 'v4l2_std_id' || $type eq 'unsigned') {
+		return "uint64";
+	}
+	if ($type eq struct || $type eq union || $type eq void) {
+		return;
+	}
+	print "v4l2_tracer: error: couldn't convert \'$type\' to json_object type.\n";
+	return;
+}
+
+sub get_index_letter {
+	my $index = shift;
+	if ($index eq 0) {return "i";}
+	if ($index eq 1) {return "j";}
+	if ($index eq 2) {return "k";}
+	if ($index eq 3) {return "l";}
+	if ($index eq 4) {return "m";}
+	if ($index eq 5) {return "n";}
+	if ($index eq 6) {return "o";} # "p" is saved for pointer
+	if ($index eq 8) {return "q";}
+	return "z";
+}
+
+$flag_func_name;
+
+sub flag_gen {
+	my $flag_type = shift;
+
+	if ($flag_type =~ /fwht/) {
+		$flag_func_name = v4l2_ctrl_fwht_params_;
+	} elsif ($flag_type =~ /vp8_loop_filter/) {
+		$flag_func_name = v4l2_vp8_loop_filter_;
+	} else {
+		($flag_func_name) = ($_) =~ /#define (\w+_)FL.+/;
+		$flag_func_name = lc $flag_func_name;
+	}
+
+	printf $fh_common_info_h "constexpr flag_def %sflag_def[] = {\n", $flag_func_name;
+
+	($flag) = ($_) =~ /#define\s+(\w+)\s+.+/;
+	printf $fh_common_info_h "\t{ $flag, \"$flag\" },\n"; # get the first flag
+
+	while (<>) {
+		next if ($_ =~ /^\/?\s?\*.*/); # skip comments between flags if any
+		next if $_ =~ /^\s*$/; # skip blank lines between flags if any
+		last if ((grep {!/^#define\s+\w+_FL/} $_) && (grep {!/^#define V4L2_VP8_LF/} $_));
+		($flag) = ($_) =~ /#\s*define\s+(\w+)\s+.+/;
+
+		# don't include flags that are masks
+		next if ($flag_func_name eq v4l2_buf_) && ($flag =~ /.*TIMESTAMP.*/ || $flag =~ /.*TSTAMP.*/);
+		next if ($flag_func_name eq v4l2_ctrl_fwht_params_) && ($flag =~ /.*COMPONENTS.*/ || $flag =~ /.*PIXENC.*/);
+		next if ($flag =~ /.*MEDIA_LNK_FL_LINK_TYPE.*/);
+		next if ($flag =~ /.*MEDIA_ENT_ID_FLAG_NEXT.*/);
+
+		printf $fh_common_info_h "\t{ $flag, \"$flag\" },\n";
+	}
+	printf $fh_common_info_h "\t{ 0, \"\" }\n};\n\n";
+}
+
+sub enum_gen {
+	($enum_name) = ($_) =~ /enum (\w+) {/;
+	printf $fh_common_info_h "constexpr val_def %s_val_def[] = {\n", $enum_name;
+	while (<>) {
+		last if $_ =~ /};/;
+		($name) = ($_) =~ /\s+(\w+)\s?.*/;
+		next if ($name ne uc $name); # skip comments that don't start with *
+		next if ($_ =~ /^\s*\/?\s?\*.*/); # skip comments
+		next if $name =~ /^\s*$/;  # skip blank lines
+		printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $name, $name;
+	}
+	printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+}
+
+sub clean_up_line {
+	my $line = shift;
+	chomp($line);
+	$line =~ s/^\s+//; # remove leading whitespace
+	$line =~ s/.*\# define.*//; # zero out line if it has defines inside a structure (e.g. v4l2_jpegcompression)
+	$line =~ s/^\s*\/?\s?\*.*//; # zero out line if it has comments where the line starts with start with /* / * or just *
+	$line =~ s/\s*\/\*.*//; # remove comments at the end of a line following a member
+	$line =~ s/\*\/$//; # zero out line if it has comments that begin without any slashs or asterisks but end with */
+	# zero out lines that don't have a ; or { because they are comments but without any identifying slashes or asteriks
+	if ($line !~ /.*[\;|\{].*/) {
+		$line =~ s/.*//;
+	}
+	$line =~ s/.*reserved.*//; # zero out lines with reserved members, they will segfault on retracing
+	$line =~ s/.*raw_data.*//;
+	# don't remove semi-colon at end because some functions will look for it
+	return $line;
+}
+
+sub get_val_def_name {
+	my @params = @_;
+	my $member = @params[0];
+	my $struct_name = @params[1];
+
+	$val_def_name = "";
+	if ($member =~ /type/) {
+		if ($struct_name =~ /.*fmt|format|buf|parm|crop|selection|vbi.*/) {
+			$val_def_name = "v4l2_buf_type_val_def";
+		} elsif ($struct_name =~ /ctrl$/) {
+			$val_def_name = "v4l2_ctrl_type_val_def";
+		} else {
+			$val_def_name = "nullptr"; # will print as hex string
+		}
+	}
+	if ($member =~ /pixelformat/) {
+		$val_def_name = "v4l2_pix_fmt_val_def";
+	}
+	if ($member =~ /cmd/) {
+		if ($struct_name =~ /v4l2_decoder_cmd/) {
+			$val_def_name = "decoder_cmd_val_def";
+		}
+		if ($struct_name =~ /v4l2_encoder_cmd/) {
+			$val_def_name = "encoder_cmd_val_def";
+		}
+	}
+	if ($member =~ /memory/) {
+		$val_def_name = "v4l2_memory_val_def";
+	}
+	if ($member =~ /field/) {
+		if ($struct_name =~ /.*pix|buffer.*/) {
+			$val_def_name = "v4l2_field_val_def";
+		} else {
+			$val_def_name = "nullptr"; # will print as hex string
+		}
+	}
+	if ($member =~ /^id$/) {
+		if ($struct_name =~ /.*control|query.*/) {
+			$val_def_name = "control_val_def";
+		} else {
+			$val_def_name = "nullptr"; # will print as hex string
+		}
+	}
+	if ($member =~ /capability|outputmode|capturemode/) {
+		if ($struct_name =~ /.*v4l2_captureparm|v4l2_outputparm.*/) {
+		$val_def_name = "streamparm_val_def";
+		}
+	}
+	if ($member =~ /colorspace/) {
+		$val_def_name = "v4l2_colorspace_val_def";
+	}
+	if ($member =~ /ycbcr_enc/) {
+		$val_def_name = "v4l2_ycbcr_encoding_val_def";
+	}
+	if ($member =~ /quantization/) {
+		$val_def_name = "v4l2_quantization_val_def";
+	}
+	if ($member =~ /xfer_func/) {
+		$val_def_name = "v4l2_xfer_func_val_def";
+	}
+
+	return $val_def_name;
+}
+
+sub get_flag_def_name {
+	my @params = @_;
+	my $member = @params[0];
+	my $struct_name = @params[1];
+
+	$flag_def_name = "";
+	if ($member =~ /flags/) {
+		if ($struct_name =~ /buffers$/) {
+			$flag_def_name = "v4l2_memory_flag_def";
+		} elsif ($struct_name =~ /.*pix_format.*/) {
+			$flag_def_name = "v4l2_pix_fmt_flag_def";
+		} elsif ($struct_name =~ /.*ctrl$/) {
+			$flag_def_name = "v4l2_ctrl_flag_def";
+		} elsif ($struct_name =~ /.*fmtdesc$/) {
+			$flag_def_name = "v4l2_fmt_flag_def";
+		} elsif ($struct_name =~ /.*selection$/) {
+			$flag_def_name = "v4l2_sel_flag_def";
+		} else {
+			$flag_def_name = "nullptr"
+		}
+	}
+
+	if ($member =~ /.*cap.*/) {
+		# v4l2_requestbuffers, v4l2_create_buffers
+		if ($struct_name =~ /buffers$/) {
+			$flag_def_name = "v4l2_buf_cap_flag_def";
+		}
+		# v4l2_capability
+		if ($struct_name =~ /capability$/) {
+			$flag_def_name = "v4l2_cap_flag_def";
+		}
+	}
+
+	return $flag_def_name;
+}
+
+# trace a struct nested in another struct in videodev2.h
+sub handle_struct {
+	printf $fh_trace_cpp "\t//$line\n";
+	printf $fh_retrace_cpp "\t//$line\n";
+
+	# this is a multi-lined nested struct so iterate through it
+	if ($line !~ /.*;$/) {
+		$suppress_struct = true;
+		return;
+	}
+
+	# don't trace struct pointers
+	if ($line =~ /\*/) {
+		return;
+	}
+	# don't trace struct arrays
+	if ($line =~ /\[/) {
+		return;
+	}
+
+	my ($struct_tag) = ($line) =~ /\s*struct (\w+)\s+.*/;
+
+	# structs defined outside of videodev2.h
+	if ($struct_tag =~ /v4l2_ctrl|timeval|timespec/) {
+		return;
+	}
+
+	# e.g. $struct_tag_parent = v4l2_captureparm, $struct_tag = v4l2_fract, $struct_var = timeperframe
+	my $struct_tag_parent = $struct_name;
+	my ($struct_var) = ($line) =~ /(\w+)\;$/;
+	printf $fh_trace_cpp "\ttrace_%s_gen(&p->%s, %s_obj, \"%s\");\n", $struct_tag, $struct_var, $struct_tag_parent, $struct_var;
+
+	printf $fh_retrace_cpp "\tvoid *%s_ptr = (void *) retrace_%s_gen(%s_obj, \"%s\");\n", $struct_var, $struct_tag, $struct_tag_parent, $struct_var;
+	printf $fh_retrace_cpp "\tp->$struct_var = *static_cast<struct %s*>(%s_ptr);\n", $struct_tag, $struct_var;
+	printf $fh_retrace_cpp "\tfree(%s_ptr);\n\n", $struct_var;
+}
+
+# trace a union in videodev2.h
+sub handle_union {
+	my @params = @_;
+	my $struct_name = @params[0];
+
+	$in_union = true;
+	$suppress_union = true;
+	printf $fh_trace_cpp "\t//union\n";
+	printf $fh_retrace_cpp "\t//union\n";
+
+	if ($struct_name =~ /^v4l2_pix_format/) {
+		$suppress_union = false;
+	}
+
+	if ($struct_name =~ /^v4l2_format$/) {
+		printf $fh_trace_cpp "\tswitch (p->type) {\n";
+		printf $fh_trace_cpp "\tcase V4L2_BUF_TYPE_VIDEO_CAPTURE:\n\tcase V4L2_BUF_TYPE_VIDEO_OUTPUT:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_pix_format_gen(&p->fmt.pix, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tcase V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:\n\tcase V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_pix_format_mplane_gen(&p->fmt.pix, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
+
+		printf $fh_retrace_cpp "\tswitch (p->type) {\n";
+		printf $fh_retrace_cpp "\tcase V4L2_BUF_TYPE_VIDEO_CAPTURE:\n\tcase V4L2_BUF_TYPE_VIDEO_OUTPUT: {\n";
+		printf $fh_retrace_cpp "\t\tvoid *pix_ptr = (void *) retrace_v4l2_pix_format_gen(v4l2_format_obj);\n";
+		printf $fh_retrace_cpp "\t\tp->fmt.pix = *static_cast<struct v4l2_pix_format*>(pix_ptr);\n";
+		printf $fh_retrace_cpp "\t\tfree(pix_ptr);\n\t\tbreak;\n\t}\n";
+
+		printf $fh_retrace_cpp "\tcase V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:\n\tcase V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE: {\n";
+		printf $fh_retrace_cpp "\t\tvoid *pix_mp_ptr = (void *) retrace_v4l2_pix_format_mplane_gen(v4l2_format_obj);\n";
+		printf $fh_retrace_cpp "\t\tp->fmt.pix_mp = *static_cast<struct v4l2_pix_format_mplane*>(pix_mp_ptr);\n";
+		printf $fh_retrace_cpp "\t\tfree(pix_mp_ptr);\n\t\tbreak;\n\t}\n";
+
+		printf $fh_retrace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
+	}
+
+	return $suppress_union;
+}
+
+# generate functions for structs in videodev2.h
+sub struct_gen {
+	($struct_name) = ($_) =~ /struct (\w+) {/;
+
+	# it's not being used and was generating a warning
+	if ($struct_name =~ /v4l2_mpeg_vbi_ITV0/) {
+		return;
+	}
+	printf $fh_trace_cpp "void trace_%s_gen(void *arg, json_object *parent_obj, std::string key_name = \"\")\n{\n", $struct_name;
+	printf $fh_trace_h "void trace_%s_gen(void *arg, json_object *parent_obj, std::string key_name = \"\");\n", $struct_name;
+	printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_object();\n", $struct_name;
+	printf $fh_trace_cpp "\tstruct %s *p = static_cast<struct %s*>(arg);\n\n", $struct_name, $struct_name;
+
+	printf $fh_retrace_h "struct %s *retrace_%s_gen(json_object *parent_obj, std::string key_name = \"\");\n", $struct_name, $struct_name;
+	printf $fh_retrace_cpp "struct %s *retrace_%s_gen(json_object *parent_obj, std::string key_name = \"\")\n{\n", $struct_name, $struct_name;
+
+	printf $fh_retrace_cpp "\tstruct %s *p = (struct %s *) calloc(1, sizeof(%s));\n\n", $struct_name, $struct_name, $struct_name;
+	printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $struct_name;
+	printf $fh_retrace_cpp "\tif (key_name.empty())\n";
+	printf $fh_retrace_cpp "\t\tjson_object_object_get_ex(parent_obj, \"%s\", &%s_obj);\n", $struct_name, $struct_name;
+	printf $fh_retrace_cpp "\telse\n";
+	printf $fh_retrace_cpp "\t\tjson_object_object_get_ex(parent_obj, key_name.c_str(), &%s_obj);\n\n", $struct_name;
+
+	$suppress_union = false;
+	$suppress_struct = false;
+	while ($line = <>) {
+		chomp($line);
+		$member = "";
+		if ($line =~ /}.*;/) {
+			if ($suppress_struct eq true) {
+				printf $fh_trace_cpp "\t//end of struct $line\n";
+				printf $fh_retrace_cpp "\t//end of struct $line\n";
+				$suppress_struct = false;
+				next;
+			} elsif ($in_union eq true) {
+				if ($suppress_union eq true) {
+					$suppress_union = false; # end of union
+				}
+				printf $fh_trace_cpp "\t//end of union $line\n";
+				printf $fh_retrace_cpp "\t//end of union $line\n";
+				$in_union = false;
+				next;
+			} else {
+				last;
+			}
+		}
+		last if $line =~ /^} __attribute__.*/;
+
+		$line = clean_up_line($line);
+		next if $line =~ /^\s*$/; # ignore blank lines
+
+		@words = split /[\s\[]/, $line; # split on whitespace and also'[' to get char arrays
+		@words = grep  {/^\D/} @words; # remove values that start with digit from inside []
+		@words = grep  {!/\]/} @words; # remove values with brackets e.g. V4L2_H264_REF_LIST_LEN]
+
+		($type) = $words[0];
+
+		# unions inside the struct
+		if ($type eq 'union') {
+			handle_union($struct_name);
+			next;
+		}
+		# suppress anything inside a union including structs nested inside a union
+		if ($suppress_union eq true) {
+			printf $fh_trace_cpp "\t//$line\n";
+			printf $fh_retrace_cpp "\t//$line\n";
+			next;
+		}
+
+		# struct members inside the struct
+		if ($type eq 'struct') {
+			handle_struct();
+			next;
+		}
+		if ($suppress_struct eq true) {
+			printf $fh_trace_cpp "\t//$line\n";
+			printf $fh_retrace_cpp "\t//$line\n";
+			next;
+		}
+
+		$json_type = convert_type_to_json_type($type);
+
+		($member) = $words[scalar @words - 1];
+		$member =~ s/;//; # remove the ;
+
+		if ($member =~ /service_lines/) {
+			printf $fh_trace_cpp "\t//$line\n";
+			printf $fh_retrace_cpp "\t//$line\n";
+			next;
+		}
+
+		# Don't trace members that are pointers
+		if ($member =~ /\*/) {
+			printf $fh_trace_cpp "\t//$line\n";
+			printf $fh_retrace_cpp "\t//$line\n";
+			next;
+		}
+
+		if ($line =~ /dims\[V4L2_CTRL_MAX_DIMS\]/) {
+			printf $fh_trace_cpp "\t\/\* $line \*\/\n"; # add comment
+			printf $fh_trace_cpp "\tjson_object *dims_obj = json_object_new_array();\n";
+			printf $fh_trace_cpp "\tfor (int i = 0; i < (std::min((int) p->nr_of_dims, V4L2_CTRL_MAX_DIMS)); i++) {\n";
+			printf $fh_trace_cpp "\t\tjson_object_array_add(dims_obj, json_object_new_int64(p->dims[i]));\n\t}\n";
+			printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"$member\", dims_obj);\n", $struct_name;
+
+			printf $fh_retrace_cpp "\t\/\* $line \*\/\n"; # add comment
+			printf $fh_retrace_cpp "\tjson_object *dims_obj;\n";
+			printf $fh_retrace_cpp "\tif (json_object_object_get_ex(%s_obj, \"$member\", &%s_obj)) {\n", $struct_name, $member;
+			printf $fh_retrace_cpp "\t\tfor (int i = 0; i < (std::min((int) p->nr_of_dims, V4L2_CTRL_MAX_DIMS)); i++) {\n";
+			printf $fh_retrace_cpp "\t\t\tif (json_object_array_get_idx(dims_obj, i))\n";
+			printf $fh_retrace_cpp "\t\t\t\tp->dims[i] = (__u32) json_object_get_int64(json_object_array_get_idx(dims_obj, i));\n\t\t}\n\t}\n";
+			next;
+		}
+
+		printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $member;
+
+		# struct v4l2_pix_format
+		if ($member =~ /priv/) {
+			printf $fh_trace_cpp "\tif (p->priv == V4L2_PIX_FMT_PRIV_MAGIC)\n";
+			printf $fh_trace_cpp "\t\tjson_object_object_add(%s_obj, \"%s\", json_object_new_string(\"V4L2_PIX_FMT_PRIV_MAGIC\"));\n", $struct_name, $member;
+			printf $fh_trace_cpp "\telse\n";
+			printf $fh_trace_cpp "\t\tjson_object_object_add(%s_obj, \"%s\", json_object_new_string(\"\"));\n", $struct_name, $member;
+
+			printf $fh_retrace_cpp "\tif (json_object_object_get_ex(%s_obj, \"$member\", &%s_obj)) {\n", $struct_name, $member;
+			printf $fh_retrace_cpp "\t\tif (json_object_get_string(priv_obj) == nullptr)\n\t\t\treturn p;\n";
+			printf $fh_retrace_cpp "\t\tstd::string priv_str = json_object_get_string(priv_obj);\n";
+			printf $fh_retrace_cpp "\t\tif (!priv_str.empty())\n";
+			printf $fh_retrace_cpp "\t\t\tp->priv = V4L2_PIX_FMT_PRIV_MAGIC;\n\t}\n";
+			next;
+		}
+
+		printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"%s\", json_object_new_", $struct_name, $member;
+		printf $fh_retrace_cpp "\tif (json_object_object_get_ex(%s_obj, \"$member\", &%s_obj))\n", $struct_name, $member;
+
+		# Convert char array members to string
+		if ($line =~ /.*\[.*/) {
+			if ($member =~ /.*name|driver|card|bus_info|description|model|magic|serial|userbits|APP_data|COM_data|linemask|data|start|count|raw|.*/) {
+				printf $fh_trace_cpp "string(reinterpret_cast<const char *>(p->$member)));\n";
+
+				printf $fh_retrace_cpp "\t\tif (json_object_get_string(%s_obj) != nullptr)\n", $member;
+				my @char_array_size = ($line) =~ /\[(\w+)\]/g;
+				printf $fh_retrace_cpp "\t\t\tmemcpy(p->$member, json_object_get_string(%s_obj), @char_array_size);\n\n", $member;
+				next;
+			}
+		}
+
+		# special strings
+		if ($member =~ /version/) {
+			printf $fh_trace_cpp "string(ver2s(p->$member).c_str()));\n";
+			printf $fh_retrace_cpp "\t\tmemset(&p->$member, 0, sizeof(p->$member));\n\n"; # driver can fill in version
+			next;
+		}
+
+		printf $fh_retrace_cpp "\t\tp->$member = ";
+
+		if ($struct_name =~ /^v4l2_buffer$/) {
+			if ($member =~ /flags/) {
+				printf $fh_trace_cpp "string(fl2s_buffer(p->$member).c_str()));\n";
+				printf $fh_retrace_cpp "(%s) s2flags_buffer(json_object_get_string(%s_obj));\n\n", $type, $member, $flag_def_name;
+				next;
+			}
+		}
+
+		# strings
+		$val_def_name = get_val_def_name($member, $struct_name);
+		if ($val_def_name !~ /^\s*$/) {
+			printf $fh_trace_cpp "string(val2s(p->$member, %s).c_str()));\n", $val_def_name;
+			printf $fh_retrace_cpp "(%s) s2val(json_object_get_string(%s_obj), %s);\n", $type,  $member, $val_def_name;
+			next;
+		}
+
+		$flag_def_name = get_flag_def_name($member, $struct_name);
+		if ($flag_def_name !~ /^\s*$/) {
+			printf $fh_trace_cpp "string(fl2s(p->$member, %s).c_str()));\n", $flag_def_name;
+			printf $fh_retrace_cpp "(%s) s2flags(json_object_get_string(%s_obj), %s);\n\n", $type, $member, $flag_def_name;
+			next;
+		}
+
+		# integers
+		printf $fh_trace_cpp "$json_type(p->$member));\n";
+		printf $fh_retrace_cpp "(%s) json_object_get_%s(%s_obj);\n\n", $type, $json_type, $member;
+
+		# special treatment for v4l2_pix_format_mplane member plane_fmt[VIDEO_MAX_PLANES]
+		# it can only be traced after num_planes is known
+		if ($member =~ /num_planes/) {
+			printf $fh_trace_cpp "\tjson_object *plane_fmt_obj = json_object_new_array();\n";
+			printf $fh_trace_cpp "\tfor (int i = 0; i < (std::min((int) p->num_planes, VIDEO_MAX_PLANES)); i++) {\n";
+			printf $fh_trace_cpp "\t\tjson_object *element_obj = json_object_new_object();\n";
+			printf $fh_trace_cpp "\t\ttrace_v4l2_plane_pix_format_gen(&(p->plane_fmt[i]), element_obj);\n";
+			printf $fh_trace_cpp "\t\tjson_object *element_no_key_obj;\n";
+			printf $fh_trace_cpp "\t\tjson_object_object_get_ex(element_obj, \"v4l2_plane_pix_format\", &element_no_key_obj);\n";
+			printf $fh_trace_cpp "\t\tjson_object_array_add(plane_fmt_obj, element_no_key_obj);\n\t}\n";
+			printf $fh_trace_cpp "\tjson_object_object_add(v4l2_pix_format_mplane_obj, \"plane_fmt\", plane_fmt_obj);\n\n";
+
+			printf $fh_retrace_cpp "\tjson_object *plane_fmt_obj;\n";
+			printf $fh_retrace_cpp "\tif (json_object_object_get_ex(v4l2_pix_format_mplane_obj, \"plane_fmt\", &plane_fmt_obj)) {\n";
+			printf $fh_retrace_cpp "\t\tfor (int i = 0; i < (std::min((int) p->num_planes, VIDEO_MAX_PLANES)); i++) {\n";
+			printf $fh_retrace_cpp "\t\t\tif (json_object_array_get_idx(plane_fmt_obj, i)) {\n";
+			printf $fh_retrace_cpp "\t\t\t\tjson_object *element_obj = json_object_new_object();\n";
+			printf $fh_retrace_cpp "\t\t\t\tjson_object_object_add(element_obj, \"v4l2_plane_pix_format\", json_object_array_get_idx(plane_fmt_obj, i));\n";
+			printf $fh_retrace_cpp "\t\t\t\tvoid *ptr = (void *) retrace_v4l2_plane_pix_format_gen(element_obj);\n";
+			printf $fh_retrace_cpp "\t\t\t\tp->plane_fmt[i] = *static_cast<struct v4l2_plane_pix_format *>(ptr);\n";
+			printf $fh_retrace_cpp "\t\t\t\tfree(ptr);\n";
+			printf $fh_retrace_cpp "\t\t\t}\n\t\t}\n\t}\n\n";
+		}
+	}
+
+	# The key name option allows a struct to be traced when it is nested inside another struct.
+	printf $fh_trace_cpp "\n\tif (key_name.empty())\n";
+	printf $fh_trace_cpp "\t\tjson_object_object_add(parent_obj, \"%s\", %s_obj);\n", $struct_name, $struct_name;
+	printf $fh_trace_cpp "\telse\n";
+	printf $fh_trace_cpp "\t\tjson_object_object_add(parent_obj, key_name.c_str(), %s_obj);\n", $struct_name;
+	printf $fh_trace_cpp "}\n\n";
+
+	printf $fh_retrace_cpp "\treturn p;\n}\n";
+}
+
+# generate functions for structs in v4l2-controls.h
+sub struct_gen_ctrl {
+	($struct_name) = ($_) =~ /struct (\w+) {/;
+
+	printf $fh_trace_h "void trace_%s_gen(void *ptr, json_object *parent_obj);\n", $struct_name;
+	printf $fh_trace_cpp "void trace_%s_gen(void *ptr, json_object *parent_obj)\n{\n", $struct_name;
+	printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_object();\n", $struct_name;
+	printf $fh_trace_cpp "\tstruct %s *p = static_cast<struct %s*>(ptr);\n", $struct_name, $struct_name;
+
+	printf $fh_retrace_h "struct %s *retrace_%s_gen(json_object *ctrl_obj);\n", $struct_name, $struct_name;
+	printf $fh_retrace_cpp "struct %s *retrace_%s_gen(json_object *ctrl_obj)\n{\n", $struct_name, $struct_name;
+	printf $fh_retrace_cpp "\tstruct %s *p = (struct %s *) calloc(1, sizeof(%s));\n", $struct_name, $struct_name, $struct_name;
+	printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $struct_name;
+	# if a key value isn't found, assume it is retracing an element of an array
+	# e.g. in struct v4l2_ctrl_h264_pred_weights
+	printf $fh_retrace_cpp "\tif (!json_object_object_get_ex(ctrl_obj, \"%s\", &%s_obj))\n", $struct_name, $struct_name;
+	printf $fh_retrace_cpp "\t\t%s_obj = ctrl_obj;\n", $struct_name;
+
+	while ($line = <>) {
+		chomp($line);
+		last if $line =~ /};/;
+		$line = clean_up_line($line);
+		next if $line =~ /^\s*$/; # ignore blank lines
+		$line =~ s/;$//; # remove semi-colon at the end
+		@words = split /[\s\[]/, $line; # also split on '[' to avoid arrays
+		@words = grep  {/^\D/} @words; # remove values that start with digit from inside []
+		@words = grep  {!/\]/} @words; # remove values with brackets e.g. V4L2_H264_REF_LIST_LEN]
+
+		($type) = $words[0];
+		$json_type = convert_type_to_json_type($type);
+
+		($member) = $words[scalar @words - 1];
+
+		# generate members that are arrays
+		if ($line =~ /.*\[.*/) {
+			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line; # add comment
+			printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_array();\n", $member;
+			printf $fh_retrace_cpp "\n\t\/\* %s \*\/\n", $line; # add comment
+
+			my @dimensions = ($line) =~ /\[(\w+)\]/g;
+			$dimensions_count = scalar @dimensions;
+
+			if ($dimensions_count > 1) {
+				printf $fh_retrace_cpp "\tint count_%s = 0;\n", $member;
+			}
+			printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $member;
+			printf $fh_retrace_cpp "\tif (json_object_object_get_ex(%s_obj, \"%s\", &%s_obj)) {\n", $struct_name, $member, $member;
+
+			for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1) {
+				$size = $dimensions[$idx];
+				$index_letter = get_index_letter($idx);
+				printf $fh_trace_cpp "\t" x ($idx + 1);
+				printf $fh_trace_cpp "for (size_t %s = 0; %s < %s\; %s++) {\n", $index_letter, $index_letter, $size, $index_letter;
+
+				printf $fh_retrace_cpp "\t" x ($idx + 1);
+				printf $fh_retrace_cpp "\t";
+				printf $fh_retrace_cpp "for (size_t %s = 0; %s < %s\; %s++) {\n", $index_letter, $index_letter, $size, $index_letter;
+			}
+			printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+			printf $fh_retrace_cpp "\t" x ($dimensions_count + 1);
+			printf $fh_retrace_cpp "\t";
+
+			# handle arrays of structs e.g. struct v4l2_ctrl_h264_pred_weights weight_factors
+			if ($type =~ /struct/) {
+				my $struct_tag = @words[1];
+				my $struct_var = $member;
+				printf $fh_trace_cpp "json_object *element_obj = json_object_new_object();\n";
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "trace_%s_gen(&(p->%s", $struct_tag, $struct_var;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1) {
+					printf $fh_trace_cpp "[%s]", get_index_letter($idx);
+				}
+				printf $fh_trace_cpp "), element_obj);\n";
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "json_object *element_no_key_obj;\n";
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "json_object_object_get_ex(element_obj, \"%s\", &element_no_key_obj);\n", $struct_tag;
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "json_object_array_add(%s_obj, element_no_key_obj);\n", $struct_var;
+
+				printf $fh_retrace_cpp "void *%s_ptr", $struct_var;
+				printf $fh_retrace_cpp " = (void *) retrace_%s_gen(json_object_array_get_idx(%s_obj, ", $struct_tag, $struct_var;
+				if ($dimensions_count > 1) {
+					printf $fh_retrace_cpp "count_%s++", $struct_var;
+				} else {
+					printf $fh_retrace_cpp "i";
+				}
+				printf $fh_retrace_cpp "));\n";
+
+				printf $fh_retrace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_retrace_cpp "\tp->%s", $struct_var;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1) {
+					printf $fh_retrace_cpp "[%s]", get_index_letter($idx);
+				}
+				printf $fh_retrace_cpp " = *static_cast<struct %s*>(%s_ptr);\n", $struct_tag, $struct_var;
+
+				printf $fh_retrace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_retrace_cpp "\tfree(%s_ptr);\n", $struct_var;
+			} else {
+				# handle arrays of ints
+				printf $fh_trace_cpp "json_object_array_add(%s_obj, json_object_new_%s(p->%s", $member, $json_type, $member;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1) {
+					printf $fh_trace_cpp "[%s]", get_index_letter($idx);
+				}
+				printf $fh_trace_cpp "));\n";
+
+				# add a check to avoid accessing a null array index
+				printf $fh_retrace_cpp "if (json_object_array_get_idx(%s_obj, ", $member;
+				if ($dimensions_count > 1) {
+					printf $fh_retrace_cpp "count_%s", $member;
+				} else {
+					printf $fh_retrace_cpp "i";
+				}
+				printf $fh_retrace_cpp "))\n";
+
+				printf $fh_retrace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_retrace_cpp "\t\t";
+				printf $fh_retrace_cpp "p->%s", $member;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1) {
+					printf $fh_retrace_cpp "[%s]", get_index_letter($idx);
+				}
+
+				printf $fh_retrace_cpp " = ($type) json_object_get_%s(json_object_array_get_idx(%s_obj, ", $json_type, $member;
+				if ($dimensions_count > 1) {
+					printf $fh_retrace_cpp "count_%s++", $member;
+				} else {
+					printf $fh_retrace_cpp "i";
+				}
+				printf $fh_retrace_cpp "));\n";
+			}
+			# closing brackets for all array types
+			for (my $idx = $dimensions_count - 1; $idx >= 0 ; $idx = $idx - 1) {
+				printf $fh_trace_cpp "\t" x ($idx + 1);
+				printf $fh_trace_cpp "}\n";
+
+				printf $fh_retrace_cpp "\t" x ($idx + 1);
+				printf $fh_retrace_cpp "\t";
+				printf $fh_retrace_cpp "}\n";
+			}
+			printf $fh_retrace_cpp "\t}\n";
+			printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"%s\", %s_obj);\n\n", $struct_name, $member, $member;
+			next;
+		}
+
+		# member that is a struct but not an array of structs
+		# e.g. $struct_tag_parent = v4l2_ctrl_vp8_frame, $struct_tag = v4l2_vp8_segment, $struct_var = segment
+		if ($type =~ /struct/) {
+			my $struct_tag_parent = $struct_name;
+			my ($struct_tag) = ($line) =~ /\s*struct (\w+)\s+.*/;
+			my ($struct_var) = $member;
+			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line;
+			printf $fh_trace_cpp "\ttrace_%s_gen(&p->%s, %s_obj);\n", $struct_tag, $struct_var, $struct_tag_parent;
+
+			printf $fh_retrace_cpp "\n\t\/\* %s \*\/\n", $line;
+			printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $struct_var;
+			printf $fh_retrace_cpp "\tif (!json_object_object_get_ex(%s_obj, \"%s\", &%s_obj))\n", $struct_tag_parent, $struct_tag, $struct_var;
+			printf $fh_retrace_cpp "\t\treturn p;\n", $struct_tag_parent, $struct_tag, $struct_var;
+
+			printf $fh_retrace_cpp "\tvoid *%s_ptr = (void *) retrace_%s_gen(%s_obj);\n", $struct_var, $struct_tag, $struct_var;
+			printf $fh_retrace_cpp "\tp->$struct_var = *static_cast<struct %s*>(%s_ptr);\n", $struct_tag, $struct_var;
+			printf $fh_retrace_cpp "\tfree(%s_ptr);\n", $struct_var;
+			next;
+		}
+
+		printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"%s\", json_object_new_", $struct_name, $member;
+		printf $fh_retrace_cpp "\n\tjson_object *%s_obj;\n", $member;
+		printf $fh_retrace_cpp "\tif (json_object_object_get_ex(%s_obj, \"%s\", &%s_obj))\n", $struct_name, $member, $member;
+
+		# strings
+		if ($member =~ /flags/) {
+			if ($struct_name eq "v4l2_ctrl_fwht_params") {
+				printf $fh_trace_cpp "string(fl2s_fwht(p->$member).c_str()));\n";
+				printf $fh_retrace_cpp "\t\tp->%s = ($type) s2flags_fwht(json_object_get_string(%s_obj));\n", $member, $member, $flag_func_name;
+			} else {
+				printf $fh_trace_cpp "string(fl2s(p->$member, %sflag_def).c_str()));\n", $flag_func_name;
+				printf $fh_retrace_cpp "\t\tp->%s = ($type) s2flags(json_object_get_string(%s_obj), %sflag_def);\n", $member, $member, $flag_func_name;
+			}
+			next;
+		}
+
+		# Add members with a single string value (e.g. enums, #define)
+		$val_def_name = get_val_def_name($member, $struct_name);
+		if ($val_def_name !~ /^\s*$/) {
+			printf $fh_trace_cpp "string(val2s(p->$member, %s).c_str()));\n", $val_def_name;
+			printf $fh_retrace_cpp "\t\tp->%s = ($type) s2val(json_object_get_string(%s_obj), $val_def_name);\n", $member, $member;
+			next;
+		}
+
+		# integers
+		printf $fh_trace_cpp "%s(p->%s));\n", $json_type, $member;
+		printf $fh_retrace_cpp "\t\tp->%s = ($type) json_object_get_%s(%s_obj);\n", $member, $json_type, $member;
+	}
+
+	printf $fh_trace_cpp "\tjson_object_object_add(parent_obj, \"%s\", %s_obj);\n", $struct_name, $struct_name;
+	printf $fh_trace_cpp "}\n\n";
+
+	printf $fh_retrace_cpp "\n\treturn p;\n";
+	printf $fh_retrace_cpp "}\n\n";
+}
+
+open($fh_trace_cpp, '>', 'trace-gen.cpp') or die "Could not open trace-gen.cpp for writing";
+printf $fh_trace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
+printf $fh_trace_cpp " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
+printf $fh_trace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
+
+open($fh_trace_h, '>', 'trace-gen.h') or die "Could not open trace-gen.h for writing";
+printf $fh_trace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
+printf $fh_trace_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
+printf $fh_trace_h "\#ifndef TRACE_GEN_H\n";
+printf $fh_trace_h "\#define TRACE_GEN_H\n\n";
+
+open($fh_retrace_cpp, '>', 'retrace-gen.cpp') or die "Could not open retrace-gen.cpp for writing";
+printf $fh_retrace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
+printf $fh_retrace_cpp " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
+printf $fh_retrace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
+
+open($fh_retrace_h, '>', 'retrace-gen.h') or die "Could not open retrace-gen.h for writing";
+printf $fh_retrace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
+printf $fh_retrace_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
+printf $fh_retrace_h "\#ifndef RETRACE_GEN_H\n";
+printf $fh_retrace_h "\#define RETRACE_GEN_H\n\n";
+
+open($fh_common_info_h, '>', 'v4l2-tracer-info-gen.h') or die "Could not open v4l2-tracer-info-gen.h for writing";
+printf $fh_common_info_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
+printf $fh_common_info_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
+printf $fh_common_info_h "\#ifndef V4L2_TRACER_INFO_GEN_H\n";
+printf $fh_common_info_h "\#define V4L2_TRACER_INFO_GEN_H\n\n";
+printf $fh_common_info_h "#include \"v4l2-tracer-common.h\"\n\n";
+
+$in_v4l2_controls = true;
+
+while (<>) {
+	if (grep {/#define __LINUX_VIDEODEV2_H/} $_) {
+		$in_v4l2_controls = false;
+	}
+
+	if (grep {/^#define.+FWHT_FL_.+/} $_) {
+		flag_gen("fwht");
+	} elsif (grep {/^#define V4L2_VP8_LF.*/} $_) {
+		flag_gen("vp8_loop_filter");
+	} elsif (grep {/^#define.+_FL_.+/} $_) {  #use to get media flags
+		flag_gen();
+	} elsif (grep {/^#define.+_FLAG_.+/} $_) {
+		flag_gen();
+	}
+
+	if ($in_v4l2_controls eq true) {
+		if (grep {/^struct/} $_) {
+			struct_gen_ctrl();
+		}
+	} else {
+		if (grep {/^struct/} $_) {
+			struct_gen();
+		}
+	}
+
+	if (grep {/^enum/} $_) {
+		enum_gen();
+	}
+
+	if (grep {/^#define\s+(V4L2_CID\w*)\s*.*/} $_) {
+		push (@controls, $_);
+	}
+
+	if (grep {/^\/\* Control classes \*\//} $_) {
+		printf $fh_common_info_h "constexpr val_def ctrlclass_val_def[] = {\n";
+		while (<>) {
+			last if $_ =~ /^\s*$/; # last if blank line
+			($ctrl_class) = ($_) =~ /#define\s*(\w+)\s+.*/;
+			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $ctrl_class, $ctrl_class;
+		}
+		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+	}
+
+	if (grep {/\/\* Values for 'capabilities' field \*\//} $_) {
+		printf $fh_common_info_h "constexpr flag_def v4l2_cap_flag_def[] = {\n";
+		while (<>) {
+			last if $_ =~ /.*V I D E O   I M A G E   F O R M A T.*/;
+			next if ($_ =~ /^\/?\s?\*.*/); # skip comments
+			next if $_ =~ /^\s*$/; # skip blank lines
+			($cap) = ($_) =~ /#define\s+(\w+)\s+.+/;
+			printf $fh_common_info_h "\t{ $cap, \"$cap\" },\n"
+		}
+		printf $fh_common_info_h "\t{ 0, \"\" }\n};\n\n";
+	}
+
+	if (grep {/\*      Pixel format         FOURCC                          depth  Description  \*\//} $_) {
+		printf $fh_common_info_h "constexpr val_def v4l2_pix_fmt_val_def[] = {\n";
+		while (<>) {
+			last if $_ =~ /.*SDR formats - used only for Software Defined Radio devices.*/;
+			next if ($_ =~ /^\s*\/\*.*/); # skip comments
+			next if $_ =~ /^\s*$/; # skip blank lines
+			($pixfmt) = ($_) =~ /#define (\w+)\s+.*/;
+			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $pixfmt, $pixfmt;
+		}
+		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+	}
+
+	if (grep {/^#define V4L2_BUF_CAP_SUPPORTS_MMAP.*/} $_) {
+		printf $fh_common_info_h "constexpr flag_def v4l2_buf_cap_flag_def[] = {\n";
+		($buf_cap) = ($_) =~ /#define (\w+)\s+.*/;
+		printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $buf_cap, $buf_cap;
+		while (<>) {
+			last if $_ =~ /^\s*$/; # blank line
+			($buf_cap) = ($_) =~ /#define (\w+)\s+.*/;
+			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $buf_cap, $buf_cap;
+		}
+		printf $fh_common_info_h "\t{ 0, \"\" }\n};\n\n";
+	}
+
+	if (grep {/.*Flags for 'capability' and 'capturemode' fields.*/} $_) {
+		printf $fh_common_info_h "constexpr val_def streamparm_val_def[] = {\n";
+		while (<>) {
+			last if $_ =~ /^\s*$/; # blank line
+			($streamparm) = ($_) =~ /^#define\s*(\w+)\s*/;
+			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $streamparm, $streamparm;
+		}
+		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+	}
+
+	if (grep {/.*V4L2_ENC_CMD_START.*/} $_) {
+		printf $fh_common_info_h "constexpr val_def encoder_cmd_val_def[] = {\n";
+		($enc_cmd) = ($_) =~ /^#define\s*(\w+)\s*/;
+		printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $enc_cmd, $enc_cmd;
+		while (<>) {
+			last if $_ =~ /^\s*$/; # blank line
+			($enc_cmd) = ($_) =~ /^#define\s*(\w+)\s*/;
+			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $enc_cmd, $enc_cmd;
+		}
+		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+	}
+
+	if (grep {/.*Decoder commands.*/} $_) {
+		printf $fh_common_info_h "constexpr val_def decoder_cmd_val_def[] = {\n";
+		while (<>) {
+			last if $_ =~ /^\s*$/; # blank line
+			($dec_cmd) = ($_) =~ /^#define\s*(\w+)\s*/;
+			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $dec_cmd, $dec_cmd;
+		}
+		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+	}
+
+	if (grep {/^#define\s+(VIDIOC_\w*)\s*.*/} $_) {
+		push (@ioctls, $_);
+	}
+
+	if (grep {/^#define\s+(MEDIA_IOC\w*)\s*.*/} $_) {
+		push (@ioctls, $_);
+	}
+
+	if (grep {/^#define\s+(MEDIA_REQUEST_IOC\w*)\s*.*/} $_) {
+		push (@ioctls, $_);
+	}
+}
+
+printf $fh_common_info_h "constexpr val_def control_val_def[] = {\n";
+foreach (@controls) {
+	($control) = ($_) =~ /^#define\s*(\w+)\s*/;
+	next if ($control =~ /BASE$/);
+	printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $control, $control;
+}
+printf $fh_common_info_h "\t{ -1, \"\" }\n};\n";
+
+printf $fh_common_info_h "constexpr val_def ioctl_val_def[] = {\n";
+foreach (@ioctls) {
+	($ioctl) = ($_) =~ /^#define\s*(\w+)\s*/;
+	printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $ioctl, $ioctl;
+}
+printf $fh_common_info_h "\t{ -1, \"\" }\n};\n";
+
+
+printf $fh_trace_h "\n#endif\n";
+close $fh_trace_h;
+close $fh_trace_cpp;
+
+printf $fh_retrace_h "\n#endif\n";
+close $fh_retrace_h;
+close $fh_retrace_cpp;
+
+printf $fh_common_info_h "\n#endif\n";
+close $fh_common_info_h;
diff --git a/utils/v4l2-tracer/v4l2-tracer.1.in b/utils/v4l2-tracer/v4l2-tracer.1.in
new file mode 100644
index 00000000..13942eba
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer.1.in
@@ -0,0 +1,111 @@
+.TH "V4L2-TRACER" "1" "November 2022" "v4l-utils @PACKAGE_VERSION@" "User Commands"
+.SH NAME
+v4l2-tracer - An application to trace and replay stateless video decoding.
+.SH SYNOPSIS
+\fBv4l2-tracer \fR[options] \fBtrace\fR <\fItracee\fR>
+.RS
+.RE
+\fBv4l2-tracer \fR[options] \fBretrace\fR  <\fItrace_file\fR>\fB.json\fR
+.RS
+.RE
+\fBv4l2-tracer clean\fR  <\fIfile\fR>\fB.json\fR
+.RS
+.RE
+
+.SH DESCRIPTION
+The v4l2-tracer utility traces, records and replays userspace applications
+that implement the v4l2 memory-to-memory stateless video decoder interface.
+.SS Trace
+Trace system calls and video frame data passed by userspace application <\fItracee\fR> to kernel driver.
+All stateless codec controls in user-space API can be traced. Outputs a JSON-formatted trace file.
+.SS Retrace
+Read the JSON-formatted <\fItrace_file\fR>\fB.json\fR. Replay the same system calls and pass the same video frame data to kernel driver.
+Outputs a JSON-formatted retrace file.
+
+.SS Clean
+Remove lines with irrelevant differences (e.g. file descriptors and memory addresses) from JSON files.
+Outputs a clean copy, not necessarily still in JSON-format.
+
+.SH OPTIONS
+.SS Common Options
+.TP
+\fB\-c\fR, \fB\-\-compact\fR
+Write minimal whitespace in JSON file.
+.TP
+\fB\-g\fR, \fB\-\-debug\fR
+Turn on verbose reporting plus additional debug info.
+.TP
+\fB\-h\fR, \fB\-\-help\fR
+Display this message.
+.TP
+\fB\-r\fR, \fB\-\-raw\fR
+Write decoded video frame data to JSON file.
+.TP
+\fB\-v\fR, \fB\-\-verbose\fR
+Turn on verbose reporting.
+.TP
+\fB\-y\fR, \fB\-\-yuv\fR
+Write decoded video frame data to yuv file.
+
+.SS Retrace Options
+.TP
+\fB\-d\fR, \fB\-\-device\fR <\fIdev\fR>
+Use a different video device than specified in the trace file.
+.RS
+<\fIdev\fR> must be a digit corresponding to an existing /dev/video<\fIdev\fR>
+.RE
+.TP
+\fB\-m\fR, \fB\-\-media\fR <\fIdev\fR>
+Use a different media device than specified in the trace file.
+.RS
+<\fIdev\fR> must be a digit corresponding to an existing /dev/media<\fIdev\fR>
+.RE
+
+.SH EXIT STATUS
+On success, it returns 0. Otherwise, it will return 1 or an error code.
+
+.SH EXAMPLE
+.TP
+Trace an application decoding VP8 video:
+.EX
+\fIv4l2-tracer trace gst-launch-1.0 -- filesrc location=test-25fps.vp8 ! parsebin ! v4l2slvp8dec ! videocodectestsink\fR
+.EE
+.TP
+A trace file is generated:
+.EE
+\fI71827_trace.json\fR
+.TP
+Retrace the trace file:
+.EX
+\fIv4l2-tracer retrace 71827_trace.json\fR
+.EE
+.TP
+Specify device nodes if retracing on a different driver:
+.EX
+\fIv4l2-tracer -d0 -m0 retrace 71827_trace.json\fR
+.EE
+.TP
+A retrace file is generated:
+.EE
+\fI71827_trace_retrace.json\fR
+.EX
+.TP
+Remove file descriptors and addresses (optional):
+.EX
+\fIv4l2-tracer clean 71827_trace.json\fR
+.EE
+.EX
+\fIv4l2-tracer clean 71827_trace_retrace.json\fR
+.EE
+.TP
+Clean files are generated for comparison:
+.EX
+\fIclean_71827_trace.json\fR
+.EE
+.EE
+\fIclean_71827_trace_retrace.json\fR
+.EX
+
+.SH BUGS
+Bug reports or questions about this utility should be sent to the
+linux-media@vger.kernel.org mailinglist.
diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
new file mode 100644
index 00000000..3afcd34f
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -0,0 +1,415 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "retrace.h"
+#include <climits>
+#include <sys/wait.h>
+#include <time.h>
+
+int tracer(int argc, char *argv[], bool retrace = false);
+
+enum Options {
+	V4l2TracerOptCompactPrint = 'c',
+	V4l2TracerOptSetVideoDevice = 'd',
+	V4l2TracerOptDebug = 'g',
+	V4l2TracerOptHelp = 'h',
+	V4l2TracerOptSetMediaDevice = 'm',
+	V4l2TracerOptWriteDecodedToJson = 'r',
+	V4l2TracerOptVerbose = 'v',
+	V4l2TracerOptWriteDecodedToYUVFile = 'y',
+};
+
+const static struct option long_options[] = {
+	{ "compact", no_argument, nullptr, V4l2TracerOptCompactPrint },
+	{ "video_device", required_argument, nullptr, V4l2TracerOptSetVideoDevice },
+	{ "debug", no_argument, nullptr, V4l2TracerOptDebug },
+	{ "help", no_argument, nullptr, V4l2TracerOptHelp },
+	{ "media_device", required_argument, nullptr, V4l2TracerOptSetMediaDevice },
+	{ "raw", no_argument, nullptr, V4l2TracerOptWriteDecodedToJson },
+	{ "verbose", no_argument, nullptr, V4l2TracerOptVerbose },
+	{ "yuv", no_argument, nullptr, V4l2TracerOptWriteDecodedToYUVFile },
+	{ nullptr, 0, nullptr, 0 }
+};
+
+const char short_options[] = {
+	V4l2TracerOptCompactPrint,
+	V4l2TracerOptSetVideoDevice, ':',
+	V4l2TracerOptDebug,
+	V4l2TracerOptHelp,
+	V4l2TracerOptSetMediaDevice, ':',
+	V4l2TracerOptWriteDecodedToJson,
+	V4l2TracerOptVerbose,
+	V4l2TracerOptWriteDecodedToYUVFile
+};
+
+int get_options(int argc, char *argv[])
+{
+	int option = 0;
+
+	do {
+		/* If there are no commands after the valid options, return err. */
+		if (optind == argc) {
+			print_usage();
+			return -1;
+		}
+
+		/* Avoid reading the tracee's options. */
+		if ((strcmp(argv[optind], "trace") == 0) || (strcmp(argv[optind], "retrace") == 0))
+			return 0;
+
+		option = getopt_long(argc, argv, short_options, long_options, NULL);
+		switch (option) {
+		case V4l2TracerOptCompactPrint: {
+			setenv("V4L2_TRACER_OPTION_COMPACT_PRINT", "true", 0);
+			break;
+		}
+		case V4l2TracerOptSetVideoDevice: {
+			std::string device_num = optarg;
+			try {
+				std::stoi(device_num, nullptr, 0);
+			} catch (std::exception& e) {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "can't convert <dev> \'%s\' to integer\n", device_num.c_str());
+				return -1;
+			}
+			if (device_num[0] >= '0' && device_num[0] <= '9' && device_num.length() <= 3) {
+				std::string path_video = "/dev/video";
+				path_video += optarg;
+				setenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE", path_video.c_str(), 0);
+			} else {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "cannot use device number\'%s\'\n", device_num.c_str());
+				return -1;
+			}
+			break;
+		}
+		case V4l2TracerOptDebug:
+			setenv("V4L2_TRACER_OPTION_VERBOSE", "true", 0);
+			setenv("V4L2_TRACER_OPTION_DEBUG", "true", 0);
+			break;
+		case V4l2TracerOptHelp:
+			print_usage();
+			return -1;
+		case V4l2TracerOptSetMediaDevice: {
+			std::string device_num = optarg;
+			try {
+				std::stoi(device_num, nullptr, 0);
+			} catch (std::exception& e) {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "can't convert <dev> \'%s\' to integer\n", device_num.c_str());
+				return -1;
+			}
+			if (device_num[0] >= '0' && device_num[0] <= '9' && device_num.length() <= 3) {
+				std::string path_media = "/dev/media";
+				path_media += optarg;
+				setenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE", path_media.c_str(), 0);
+			} else {
+				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "cannot use device number\'%s\'\n", device_num.c_str());
+				return -1;
+			}
+			break;
+		}
+		case V4l2TracerOptWriteDecodedToJson:
+			setenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_JSON_FILE", "true", 0);
+			break;
+		case V4l2TracerOptVerbose:
+			setenv("V4L2_TRACER_OPTION_VERBOSE", "true", 0);
+			break;
+		case V4l2TracerOptWriteDecodedToYUVFile:
+			setenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE", "true", 0);
+			break;
+		default:
+			break;
+		}
+
+		/* invalid option */
+		if (optopt > 0) {
+			print_usage();
+			return -1;
+		}
+
+	} while (option != -1);
+
+	return 0;
+}
+
+int clean(std::string trace_filename)
+{
+	FILE *trace_file = fopen(trace_filename.c_str(), "r");
+	if (trace_file == nullptr) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "cannot open \'%s\'\n", trace_filename.c_str());
+		return 1;
+	}
+
+	fprintf(stderr, "Cleaning: %s\n", trace_filename.c_str());
+
+	std::string clean_filename = "clean_" + trace_filename;
+	FILE *clean_file = fopen(clean_filename.c_str(), "w");
+	if (clean_file == nullptr) {
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "cannot open \'%s\'\n", clean_filename.c_str());
+		return 1;
+	}
+
+	std::string line;
+	char buf[SHRT_MAX];
+	int count_total = 0;
+	int count_lines_removed = 0;
+
+	while (fgets(buf, SHRT_MAX, trace_file) != nullptr) {
+		line = buf;
+		count_total++;
+		if (line.find("fd") != std::string::npos) {
+			count_lines_removed++;
+			continue;
+		}
+		if (line.find("address") != std::string::npos) {
+			count_lines_removed++;
+			continue;
+		}
+		if (line.find("fildes") != std::string::npos) {
+			count_lines_removed++;
+			continue;
+		}
+		if (line.find("\"start\"") != std::string::npos) {
+			count_lines_removed++;
+			continue;
+		}
+		if (line.find("\"name\"") != std::string::npos) {
+			count_lines_removed++;
+			continue;
+		}
+
+		fputs(buf, clean_file);
+	}
+
+	fclose(trace_file);
+	fclose(clean_file);
+	fprintf(stderr, "Removed %d lines of %d total lines: %s\n",
+	        count_lines_removed, count_total, clean_filename.c_str());
+
+	return 0;
+}
+
+int tracer(int argc, char *argv[], bool retrace)
+{
+	char *exec[argc];
+	int exec_index = 0;
+
+	char retrace_command[] = "__retrace";
+
+	if (retrace) {
+		std::string trace_file = argv[optind];
+		if (trace_file.find(".json") == std::string::npos) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "Trace file \'%s\' must have .json file extension\n",
+			        trace_file.c_str());
+			print_usage();
+			return -1;
+		}
+	}
+
+	/* Get the application to be traced. */
+	if (retrace) {
+		exec[exec_index++] = argv[0]; /* tracee is v4l2-tracer, local or installed */
+		exec[exec_index++] = retrace_command;
+		exec[exec_index++] = argv[optind]; /* json file to be retraced */
+	} else {
+		while (optind < argc)
+			exec[exec_index++] = argv[optind++];
+	}
+	exec[exec_index] = nullptr;
+
+	/* Create a unique trace filename and open a file. */
+	std::string trace_id;
+	if (retrace) {
+		std::string json_file_name = argv[optind];
+		trace_id = json_file_name.substr(0, json_file_name.find(".json"));
+		trace_id += "_retrace";
+	} else {
+		const int timestamp_start_pos = 5;
+		trace_id = std::to_string(time(nullptr));
+		// trace_id = trace_id.substr(timestamp_start_pos, std::string::npos) + "_trace";
+		trace_id = trace_id.substr(timestamp_start_pos) + "_trace";
+
+	}
+	setenv("TRACE_ID", trace_id.c_str(), 0);
+	std::string trace_filename = trace_id + ".json";
+	FILE *trace_file = fopen(trace_filename.c_str(), "w");
+	if (trace_file == nullptr) {
+		fprintf(stderr, "Could not open trace file: %s\n", trace_filename.c_str());
+		perror("");
+		return errno;
+	}
+
+	/* Open the json array.*/
+	fputs("[\n", trace_file);
+
+	/* Add v4l-utils package and git info to the top of the trace file. */
+	std::string json_str;
+	json_object *v4l2_tracer_info_obj = json_object_new_object();
+	json_object_object_add(v4l2_tracer_info_obj, "package_version",
+	                       json_object_new_string(PACKAGE_VERSION));
+	std::string git_commit_cnt = STRING(GIT_COMMIT_CNT);
+	git_commit_cnt = git_commit_cnt.erase(0, 1); /* remove the hyphen in front of git_commit_cnt */
+	json_object_object_add(v4l2_tracer_info_obj, "git_commit_cnt",
+	                       json_object_new_string(git_commit_cnt.c_str()));
+	json_object_object_add(v4l2_tracer_info_obj, "git_sha",
+	                       json_object_new_string(STRING(GIT_SHA)));
+	json_object_object_add(v4l2_tracer_info_obj, "git_commit_date",
+	                       json_object_new_string(STRING(GIT_COMMIT_DATE)));
+	json_str = json_object_to_json_string(v4l2_tracer_info_obj);
+	fwrite(json_str.c_str(), sizeof(char), json_str.length(), trace_file);
+	fputs(",\n", trace_file);
+	json_object_put(v4l2_tracer_info_obj);
+
+	/* Add v4l2-tracer command line to the top of the trace file. */
+	json_object *tracee_obj = json_object_new_object();
+	std::string tracee;
+	for (int i = 0; i < argc; i++) {
+		tracee += argv[i];
+		tracee += " ";
+	}
+	json_object_object_add(tracee_obj, "Trace", json_object_new_string(tracee.c_str()));
+	const time_t current_time = time(nullptr);
+	json_object_object_add(tracee_obj, "Timestamp", json_object_new_string(ctime(&current_time)));
+
+	json_str = json_object_to_json_string(tracee_obj);
+	fwrite(json_str.c_str(), sizeof(char), json_str.length(), trace_file);
+	fputs(",\n", trace_file);
+	json_object_put(tracee_obj);
+	fclose(trace_file);
+
+	/*
+	 * Preload the libv4l2tracer library. If the program is installed, load the library
+	 * from its installed location, otherwise load it locally. If it's loaded locally,
+	 * use ./configure --disable-dyn-libv4l.
+	 */
+	std::string libv4l2tracer_path;
+	std::string program = argv[0];
+	std::size_t idx = program.rfind("/v4l2-tracer");
+	if (idx != std::string::npos) {
+		libv4l2tracer_path = program.replace(program.begin() + idx + 1, program.end(), ".libs");
+		DIR *directory_pointer = opendir(libv4l2tracer_path.c_str());
+		if (directory_pointer == nullptr)
+			libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "./.libs");
+		else
+			closedir(directory_pointer);
+	} else {
+		libv4l2tracer_path = STRING(LIBTRACER_PATH);
+	}
+	libv4l2tracer_path += "/libv4l2tracer.so";
+	if (is_verbose())
+		fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_str());
+	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);
+
+	if (fork() == 0) {
+
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "tracee: ");
+			for (int i = 0; i < exec_index; i++)
+				fprintf(stderr,"%s ", exec[i]);
+			fprintf(stderr, "\n");
+		}
+
+		execvpe(exec[0], (char* const*) exec, environ);
+
+		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "could not execute application \'%s\'", exec[0]);
+		perror(" ");
+		return errno;
+	}
+
+	int exec_result = 0;
+	wait(&exec_result);
+
+	if (WEXITSTATUS(exec_result)) {
+		fprintf(stderr, "Trace error: %s\n", trace_filename.c_str());
+
+		trace_file = fopen(trace_filename.c_str(), "a");
+		fseek(trace_file, 0L, SEEK_END);
+		fputs("\n]\n", trace_file);
+		fclose(trace_file);
+
+		exit(EXIT_FAILURE);
+	}
+
+	/* Close the json-array and the trace file. */
+	trace_file = fopen(trace_filename.c_str(), "a");
+	fseek(trace_file, 0L, SEEK_END);
+	fputs("\n]\n", trace_file);
+	fclose(trace_file);
+
+	if (retrace)
+		fprintf(stderr, "Retrace complete: ");
+	else
+		fprintf(stderr, "Trace complete: ");
+	fprintf(stderr, "%s", trace_filename.c_str());
+	fprintf(stderr, "\n");
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int ret = -1;
+
+	if (argc <= 1) {
+		print_usage();
+		return ret;
+	}
+
+	ret = get_options(argc, argv);
+
+	if (ret < 0) {
+		if (is_debug())
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		return ret;
+	}
+
+	if (optind == argc) {
+		if (is_debug())
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		print_usage();
+		return ret;
+	}
+
+	std::string command = argv[optind++];
+
+	if (optind == argc) {
+		if (is_debug())
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		print_usage();
+		return ret;
+	}
+
+	if (command == "trace") {
+		ret = tracer(argc, argv);
+	} else if (command == "retrace") {
+		ret = tracer(argc, argv, true);
+	} else if (command == "__retrace") {
+		/*
+		 * This command is meant to be used only internally to allow
+		 * v4l2-tracer to recursively trace itself during a retrace.
+		 */
+		ret = retrace(argv[optind]);
+	} else if (command == "clean") {
+		ret = clean (argv[optind]);
+	} else {
+		if (is_debug()) {
+			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "tracee: ");
+			for (int i = 0; i < argc; i++)
+				fprintf(stderr,"%s ", argv[i]);
+			fprintf(stderr, "\n");
+		}
+		print_usage();
+	}
+
+	return ret;
+}
-- 
2.38.0

