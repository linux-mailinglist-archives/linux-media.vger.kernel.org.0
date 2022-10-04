Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623F25F4988
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 20:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiJDS47 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 14:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiJDS46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 14:56:58 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567476AA10
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 11:56:53 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id DB7BC6602293;
        Tue,  4 Oct 2022 19:56:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664909811;
        bh=ZuntEEbMDUQkbXWsNWYH6QjcbsM2Qj0ttsCOBT2cbXg=;
        h=From:To:Cc:Subject:Date:From;
        b=TQRSoimYCU22hmehImIVvzOXBdiJrmebfgsovcKk7rhCk+1Q6IuoNb2Qb7YENYf1e
         hEueg3yOZ/olUO7CJba7akJRWJ/kSQlv7L8KxzKZJ2wl9Bb1w3MQsSfLZJJPrsvRKQ
         SW/mkPUMD1amKUTQ87L0ZUG8gaRbXjrDUTw0FJnPtkHevqT/UHeD+6nfhMO+FCbQmu
         mkwZzLHR1WodfmsPTqfYxQe6CvTcLIu3G0sWpOZc8OHSiRBoI+bjD+/2nI6K5GVlWs
         MboIilELDiLAUMFA71sLyVSurCswJdaPiWujOF6qjx5PduDNSP6DnOZOHC4nP8rurB
         sd2Oe6zhoQg7g==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] utils: add v4l2-tracer utility
Date:   Tue,  4 Oct 2022 11:57:03 -0700
Message-Id: <20221004185703.13393-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.37.3
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

The v4l2-tracer utility traces, records and replays userspace applications
that implement the v4l2 memory-to-memory stateless video decoder
interface. The trace function intercepts and copies system calls,
stateless codec controls and buffers to a json-formatted trace file.
The retrace function independently reads and replays the json trace file.
The json trace file can be retraced independently from its original
userspace environment and can be edited to inject errors to test a
driver's error handling abilities.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Currently supports MPEG2, VP8, H264, FWHT

Changes since v1:
- auto-generate code from uAPI headers
- generated code adds some ability to trace
  VP9/HEVC which compiles but still needs work
- generated code adds full support for MPEG2
- fix multiplanar decoding for vicodec
- change library name to libv4l2tracer
- update README
- expand help to show options
- remove extraneous files from gitignore

Examples:

Trace VP8 decoding:

  v4l2-tracer trace -- gst-launch-1.0 -- filesrc
  location=test-25fps.vp8 ! parsebin ! v4l2slvp8dec !
  videocodectestsink

Trace H264 decoding:

  v4l2-tracer trace -y -- gst-launch-1.0 -- filesrc
  location=test-25fps.h264 ! parsebin ! v4l2slh264dec !
  videocodectestsink

Trace FWHT decoding:

  v4l2-tracer trace -- v4l2-ctl -d9 --stream-mmap
  --stream-out-mmap --stream-from-hdr test-25fps.fwht
  --stream-to out.yuv

Note: if tracing another v4l2 utility like
v4l2-ctl, either used the installed versions
or configure with:
 --disable-dyn-libv4l --disable-v4l2-ctl-libv4l

Retrace:
  v4l2-tracer retrace 79568_trace.json

Trace a Retrace:
  v4l2-tracer trace -- v4l2-tracer retrace
  79568_trace.json

 README                                 |    8 +
 configure.ac                           |   12 +
 utils/Makefile.am                      |    5 +
 utils/v4l2-tracer/.gitignore           |    8 +
 utils/v4l2-tracer/Makefile.am          |   33 +
 utils/v4l2-tracer/libv4l2tracer.cpp    |  222 ++++
 utils/v4l2-tracer/retrace-helper.cpp   |  196 ++++
 utils/v4l2-tracer/retracer.cpp         | 1319 ++++++++++++++++++++++++
 utils/v4l2-tracer/trace-helper.cpp     |  816 +++++++++++++++
 utils/v4l2-tracer/trace-helper.h       |   51 +
 utils/v4l2-tracer/trace.cpp            |  669 ++++++++++++
 utils/v4l2-tracer/v4l2-tracer-common.h |   40 +
 utils/v4l2-tracer/v4l2-tracer-gen.pl   |  359 +++++++
 utils/v4l2-tracer/v4l2-tracer.1.in     |  104 ++
 utils/v4l2-tracer/v4l2-tracer.cpp      |  187 ++++
 15 files changed, 4029 insertions(+)
 create mode 100644 utils/v4l2-tracer/.gitignore
 create mode 100644 utils/v4l2-tracer/Makefile.am
 create mode 100644 utils/v4l2-tracer/libv4l2tracer.cpp
 create mode 100644 utils/v4l2-tracer/retrace-helper.cpp
 create mode 100644 utils/v4l2-tracer/retracer.cpp
 create mode 100644 utils/v4l2-tracer/trace-helper.cpp
 create mode 100644 utils/v4l2-tracer/trace-helper.h
 create mode 100644 utils/v4l2-tracer/trace.cpp
 create mode 100644 utils/v4l2-tracer/v4l2-tracer-common.h
 create mode 100755 utils/v4l2-tracer/v4l2-tracer-gen.pl
 create mode 100644 utils/v4l2-tracer/v4l2-tracer.1.in
 create mode 100644 utils/v4l2-tracer/v4l2-tracer.cpp

diff --git a/README b/README
index a7759171..c5b6df16 100644
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
+Installed by make install under <prefix>/bin.
+
 xc3028-firmware:
 Xceive XC2028/3028 tuner module firmware manipulation tool.
 xc3028-firmware does not get installed by make install.
diff --git a/configure.ac b/configure.ac
index 05298981..39d83579 100644
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
@@ -311,6 +313,15 @@ AS_IF([test "x$with_libudev" != xno -o "x$enable_libdvbv5" != xno],
 
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
@@ -645,6 +656,7 @@ compile time options summary
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
index 00000000..c3389d24
--- /dev/null
+++ b/utils/v4l2-tracer/.gitignore
@@ -0,0 +1,8 @@
+trace-gen.cpp
+trace-gen.h
+retrace-gen.cpp
+retrace-gen.h
+trace-info-gen.cpp
+trace-info-gen.h
+v4l2-tracer
+v4l2-tracer.1
diff --git a/utils/v4l2-tracer/Makefile.am b/utils/v4l2-tracer/Makefile.am
new file mode 100644
index 00000000..ef21bb7c
--- /dev/null
+++ b/utils/v4l2-tracer/Makefile.am
@@ -0,0 +1,33 @@
+if HAVE_JSONC
+
+lib_LTLIBRARIES = libv4l2tracer.la
+libv4l2tracer_la_SOURCES = libv4l2tracer.cpp trace-gen.cpp trace-info-gen.cpp trace-helper.cpp \
+trace.cpp $(top_srcdir)/utils/common/v4l2-info.cpp
+libv4l2tracer_la_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
+libv4l2tracer_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -ldl $(JSONC_LIBS)
+libv4l2tracer_la_LIBTOOLFLAGS = --tag=disable-static
+
+bin_PROGRAMS = v4l2-tracer
+man_MANS = v4l2-tracer.1
+
+v4l2_tracer_SOURCES = v4l2-tracer.cpp retrace-gen.cpp retrace-helper.cpp retracer.cpp \
+$(top_srcdir)/utils/common/v4l2-info.cpp $(top_srcdir)/utils/common/codec-fwht.h
+v4l2_tracer_CPPFLAGS = -I$(top_srcdir)/utils/common -DLIBTRACER_PATH=$(libdir) $(JSONC_CFLAGS)
+v4l2_tracer_LDFLAGS = -lrt -lpthread $(JSONC_LIBS)
+
+V4L2_TRACER_GEN_PREREQS = $(top_srcdir)/include/linux/v4l2-controls.h \
+$(top_srcdir)/include/linux/videodev2.h $(top_srcdir)/include/linux/media.h
+V4L2_TRACER_GEN = trace-gen.cpp trace-gen.h trace-info-gen.cpp trace-info-gen.h \
+retrace-gen.cpp retrace-gen.h
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
index 00000000..c344d8a1
--- /dev/null
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -0,0 +1,222 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include <dlfcn.h>
+#include <stdarg.h>
+#include <config.h> /* For PROMOTED_MODE_T */
+#include "v4l2-tracer-common.h"
+#include "trace-helper.h"
+
+/* from trace.cpp */
+void trace_open(int fd, const char *path, int oflag, mode_t mode, bool is_open64);
+void trace_mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off,
+                unsigned long buf_address, bool is_mmap64);
+void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start);
+void trace_mem_encoded(int fd, __u32 offset);
+json_object *trace_ioctl_args(int fd, unsigned long request, void *arg,
+                              bool from_userspace = true);
+
+int open(const char *path, int oflag, ...)
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
+	int (*original_open)(const char *path, int oflag, ...);
+	original_open = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open");
+	int fd = (*original_open)(path, oflag, mode);
+
+	if (is_video_or_media_device(path)) {
+		if (!options_are_set())
+			set_options();
+		add_device(fd, path);
+		trace_open(fd, path, oflag, mode, false);
+	}
+
+	return fd;
+}
+
+int open64(const char *path, int oflag, ...)
+{
+	errno = 0;
+	mode_t mode = 0;
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
+	if (is_video_or_media_device(path)) {
+		if (!options_are_set())
+			set_options();
+		add_device(fd, path);
+		trace_open(fd, path, oflag, mode, true);
+	}
+
+	return fd;
+}
+
+int close(int fd)
+{
+	errno = 0;
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
+
+		/* If we removed the last device, close the json trace file. */
+		if (!count_devices())
+			close_json_file();
+	}
+
+	int (*original_close)(int fd);
+	original_close = (int (*)(int)) dlsym(RTLD_NEXT, "close");
+
+	return (*original_close)(fd);
+}
+
+void *mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off)
+{
+	errno = 0;
+	void *(*original_mmap)(void *addr, size_t len, int prot, int flags, int fildes, off_t off);
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
+	void *(*original_mmap64)(void *addr, size_t len, int prot, int flags, int fildes, off_t off);
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
+	int(*original_munmap)(void *start, size_t length);
+	original_munmap = (int(*)(void *, size_t)) dlsym(RTLD_NEXT, "munmap");
+	int ret = (*original_munmap)(start, length);
+
+	/* Only trace the unmapping if the original mapping was traced. */
+	if (!buffer_is_mapped((unsigned long) start))
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
+int ioctl(int fd, unsigned long request, ...)
+{
+	errno = 0;
+	va_list ap;
+	va_start(ap, request);
+	void *arg = va_arg(ap, void *);
+	va_end(ap);
+
+	int (*original_ioctl)(int fd, unsigned long request, ...);
+	original_ioctl = (int (*)(int, long unsigned int, ...)) dlsym(RTLD_NEXT, "ioctl");
+
+	if ((request == VIDIOC_S_EXT_CTRLS) && (_IOC_TYPE(request) == 'V'))
+		s_ext_ctrls_setup(static_cast<struct v4l2_ext_controls*>(arg));
+
+	if ((request == VIDIOC_QBUF) && (_IOC_TYPE(request) == 'V'))
+		qbuf_setup(static_cast<struct v4l2_buffer*>(arg));
+
+	if ((request == VIDIOC_STREAMOFF) && (_IOC_TYPE(request) == 'V'))
+		streamoff_cleanup(*(static_cast<v4l2_buf_type*>(arg)));
+
+	json_object *ioctl_obj = json_object_new_object();
+	json_object_object_add(ioctl_obj, "syscall_str", json_object_new_string("ioctl"));
+	json_object_object_add(ioctl_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_IOCTL));
+	json_object_object_add(ioctl_obj, "fd", json_object_new_int(fd));
+	json_object_object_add(ioctl_obj, "request", json_object_new_uint64(request));
+	json_object_object_add(ioctl_obj, "request_str",
+	                       json_object_new_string(get_ioctl_request_str(request).c_str()));
+
+	/* Trace the ioctl arguments provided by userspace. */
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
+	/* Also trace the ioctl arguments as modified by the driver. */
+	json_object *ioctl_args_driver = trace_ioctl_args(fd, request, arg, false);
+	if (json_object_object_length(ioctl_args_driver))
+		json_object_object_add(ioctl_obj, "ioctl_args_from_driver", ioctl_args_driver);
+
+	write_json_object_to_json_file(ioctl_obj);
+	json_object_put(ioctl_obj);
+
+	if ((request == VIDIOC_G_FMT) && (_IOC_TYPE(request) == 'V'))
+		g_fmt_setup_trace(static_cast<struct v4l2_format*>(arg));
+
+	if ((request == VIDIOC_S_FMT) && (_IOC_TYPE(request) == 'V'))
+		s_fmt_setup(static_cast<struct v4l2_format*>(arg));
+
+	if ((request == VIDIOC_EXPBUF) && (_IOC_TYPE(request) == 'V'))
+		expbuf_setup(static_cast<struct v4l2_exportbuffer*>(arg));
+
+	if ((request == VIDIOC_QUERYBUF) && (_IOC_TYPE(request) == 'V'))
+		querybuf_setup(fd, static_cast<struct v4l2_buffer*>(arg));
+
+	return ret;
+}
diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
new file mode 100644
index 00000000..37fad2c3
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer-common.h"
+
+struct buffer_retrace {
+	int fd;
+	__u32 type; /* enum v4l2_buf_type */
+	__u32 index;
+	__u32 offset;
+	long address_trace;
+	long address_retrace;
+};
+
+struct retrace_context {
+	__u32 width;
+	__u32 height;
+	__u32 pixelformat;
+	pthread_mutex_t lock;
+	/* Key is a file descriptor from the trace, value is the corresponding fd in the retrace. */
+	std::unordered_map<int, int> retrace_fds;
+	/* List of output and capture buffers being retraced. */
+	std::list<struct buffer_retrace> buffers;
+};
+
+static struct retrace_context ctx_retrace = {
+	.lock = PTHREAD_MUTEX_INITIALIZER
+};
+
+bool buffer_in_retrace_context(int fd, __u32 offset)
+{
+	bool buffer_in_retrace_context = false;
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto &b : ctx_retrace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			buffer_in_retrace_context = true;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+	return buffer_in_retrace_context;
+}
+
+int get_buffer_fd_retrace(__u32 type, __u32 index)
+{
+	int fd = 0;
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto &b : ctx_retrace.buffers) {
+		if ((b.type == type) && (b.index == index)) {
+			fd = b.fd;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+	return fd;
+}
+
+void add_buffer_retrace(int fd, __u32 type, __u32 index, __u32 offset)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	struct buffer_retrace buf = {};
+	buf.fd = fd;
+	buf.type = type;
+	buf.index = index;
+	buf.offset = offset;
+	ctx_retrace.buffers.push_front(buf);
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+void remove_buffer_retrace(int fd)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto it = ctx_retrace.buffers.begin(); it != ctx_retrace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			ctx_retrace.buffers.erase(it);
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto &b : ctx_retrace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.address_trace = address_trace;
+			b.address_retrace = address_retrace;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+long get_retrace_address_from_trace_address(long address_trace)
+{
+	long address_retrace = 0;
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto &b : ctx_retrace.buffers) {
+		if (b.address_trace == address_trace) {
+			address_retrace = b.address_retrace;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+	return address_retrace;
+}
+
+void print_buffers_retrace(void)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto &b : ctx_retrace.buffers) {
+		fprintf(stderr, "fd: %d, offset: %d, address_trace:%ld, address_retrace:%ld\n",
+		        b.fd, b.offset, b.address_trace, b.address_retrace);
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
+int get_fd_retrace_from_fd_trace(int fd_trace)
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
+	for (auto it = ctx_retrace.retrace_fds.cbegin(); it != ctx_retrace.retrace_fds.cend(); ++it)
+		fprintf(stderr, "fd_trace: %d, fd_retrace: %d\n", it->first, it->second);
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+void set_pixelformat_retrace(__u32 width, __u32 height, __u32 pixelformat)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	ctx_retrace.width = width;
+	ctx_retrace.height = height;
+	ctx_retrace.pixelformat = pixelformat;
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+unsigned get_expected_length_retrace(void)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	unsigned width = ctx_retrace.width;
+	unsigned height = ctx_retrace.height;
+	unsigned pixelformat = ctx_retrace.pixelformat;
+	pthread_mutex_unlock(&ctx_retrace.lock);
+
+	unsigned expected_length = width * height;
+	if (pixelformat == V4L2_PIX_FMT_NV12 || pixelformat == V4L2_PIX_FMT_YUV420) {
+		expected_length *= 3;
+		expected_length /= 2;
+		expected_length += (expected_length % 2);
+	}
+	return expected_length;
+}
+
+void print_context(void)
+{
+	print_fds();
+	print_buffers_retrace();
+	fprintf(stderr, "\n");
+}
diff --git a/utils/v4l2-tracer/retracer.cpp b/utils/v4l2-tracer/retracer.cpp
new file mode 100644
index 00000000..be6eddb2
--- /dev/null
+++ b/utils/v4l2-tracer/retracer.cpp
@@ -0,0 +1,1319 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+#include <stdexcept>
+#include "v4l2-tracer-common.h"
+#include "retrace-gen.h"
+
+bool buffer_in_retrace_context(int fd, __u32 offset = 0);
+int get_buffer_fd_retrace(__u32 type, __u32 index);
+void add_buffer_retrace(int fd, __u32 type, __u32 index, __u32 offset = 0);
+void remove_buffer_retrace(int fd);
+void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace);
+long get_retrace_address_from_trace_address(long address_trace);
+void add_fd(int fd_trace, int fd_retrace);
+int get_fd_retrace_from_fd_trace(int fd_trace);
+void remove_fd(int fd_trace);
+void set_pixelformat_retrace(__u32 width, __u32 height, __u32 pixelformat);
+unsigned get_expected_length_retrace(void);
+void print_context(void);
+
+bool verbose = false;
+std::string retrace_filename;
+std::string dev_path_video;
+std::string dev_path_media;
+
+enum Option_Retracer {
+    OptSetDevice_Retracer = 'd',
+    OptSetMediaDevice_Retracer = 'm',
+    OptVerbose_Retracer = 'v',
+};
+
+static struct option long_options_retracer[] = {
+    { "device", required_argument, nullptr, OptSetDevice_Retracer },
+    { "media", required_argument, nullptr, OptSetMediaDevice_Retracer },
+    { "verbose", no_argument, nullptr, OptVerbose_Retracer },
+    { nullptr, 0, nullptr, 0 }
+};
+
+char short_options_retracer[] = {
+    OptSetDevice_Retracer, ':',
+    OptSetMediaDevice_Retracer, ':',
+    OptVerbose_Retracer
+};
+
+void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
+{
+	json_object *mmap_args_obj;
+	json_object_object_get_ex(mmap_obj, "mmap_args", &mmap_args_obj);
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
+	int flags = json_object_get_int(flags_obj);
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
+
+	/* Only retrace mmap calls that map a buffer. */
+	if (!buffer_in_retrace_context(fd_retrace, off))
+		return;
+
+	void *buf_address_retrace_pointer;
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
+		print_context();
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
+	if (verbose || (errno != 0)) {
+		if (is_mmap64)
+			perror("mmap64");
+		else
+			perror("mmap");
+		fprintf(stderr, "fd: %d, offset: %ld\n", fd_retrace, off);
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
+	if (verbose || (errno != 0)) {
+		perror("munmap");
+		fprintf(stderr, "unmapped: %ld\n", buffer_address_retrace);
+		fprintf(stderr, "\n");
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
+	/* Use device from the command line, instead of from the trace file. */
+	if ((path.find("video") != path.npos) && !dev_path_video.empty())
+		path = dev_path_video;
+
+	if ((path.find("media") != path.npos) && !dev_path_media.empty())
+		path = dev_path_media;
+
+	int fd_retrace = 0;
+	if (is_open64)
+		fd_retrace = open64(path.c_str(), oflag, mode);
+	else
+		fd_retrace = open(path.c_str(), oflag, mode);
+
+	if (fd_retrace <= 0) {
+		fprintf(stderr, "Cannot open: %s\n", path.c_str());
+		exit(fd_retrace);
+	}
+
+	add_fd(fd_trace, fd_retrace);
+
+	if (verbose || (errno != 0)) {
+		if (is_open64)
+			perror("open64");
+		else
+			perror("open");
+		fprintf(stderr, "path: %s \n", path.c_str());
+		print_context();
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
+	if (fd_retrace) {
+		close(fd_retrace);
+		remove_fd(json_object_get_int(fd_trace_obj));
+
+		if (verbose || (errno != 0)) {
+			perror("close");
+			fprintf(stderr, "fd: %d\n\n", fd_retrace);
+			print_context();
+		}
+	}
+}
+
+struct v4l2_requestbuffers retrace_v4l2_requestbuffers(json_object *ioctl_args)
+{
+	struct v4l2_requestbuffers request_buffers = {};
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
+	if (verbose || (errno != 0)) {
+		perror("VIDIOC_REQBUFS");
+		fprintf(stderr, "type: %s, request_buffers.count: %d\n",
+		        buftype2s(request_buffers.type).c_str(), request_buffers.count);
+		print_context();
+	}
+}
+
+struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memory)
+{
+	struct v4l2_plane *pl = (struct v4l2_plane *) calloc(1, sizeof(v4l2_plane));
+
+	json_object *bytesused_obj;
+	json_object_object_get_ex(plane_obj, "bytesused", &bytesused_obj);
+	pl->bytesused = (__u32) json_object_get_uint64(bytesused_obj);
+
+	json_object *length_obj;
+	json_object_object_get_ex(plane_obj, "length", &length_obj);
+	pl->length = (__u32) json_object_get_uint64(length_obj);
+
+	json_object *m_obj;
+	json_object_object_get_ex(plane_obj, "m", &m_obj);
+	if (memory == V4L2_MEMORY_MMAP) {
+		json_object *mem_offset_obj;
+		json_object_object_get_ex(m_obj, "mem_offset", &mem_offset_obj);
+		pl->m.mem_offset = (__u32) json_object_get_int64(mem_offset_obj);
+	}
+
+	json_object *data_offset_obj;
+	json_object_object_get_ex(plane_obj, "data_offset", &data_offset_obj);
+	pl->data_offset = (__u32) json_object_get_int64(data_offset_obj);
+
+	return pl;
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
+	buf->type = (__u32) json_object_get_uint64(type_obj);
+
+	json_object *bytesused_obj;
+	json_object_object_get_ex(buf_obj, "bytesused", &bytesused_obj);
+	buf->bytesused = (__u32) json_object_get_uint64(bytesused_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(buf_obj, "flags", &flags_obj);
+	buf->flags = (__u32) json_object_get_uint64(flags_obj);
+
+	json_object *field_obj;
+	json_object_object_get_ex(buf_obj, "field", &field_obj);
+	buf->field = (__u32) json_object_get_uint64(field_obj);
+
+	json_object *timestamp_obj;
+	json_object_object_get_ex(buf_obj, "timestamp", &timestamp_obj);
+
+	struct timeval tv = {};
+	json_object *tv_sec_obj;
+	json_object_object_get_ex(timestamp_obj, "tv_sec", &tv_sec_obj);
+	tv.tv_sec = json_object_get_int64(tv_sec_obj);
+	json_object *tv_usec_obj;
+	json_object_object_get_ex(timestamp_obj, "tv_usec", &tv_usec_obj);
+	tv.tv_usec = json_object_get_int64(tv_usec_obj);
+	buf->timestamp = tv;
+
+	json_object *sequence_obj;
+	json_object_object_get_ex(buf_obj, "sequence", &sequence_obj);
+	buf->sequence = (__u32) json_object_get_uint64(sequence_obj);
+
+	json_object *memory_obj;
+	json_object_object_get_ex(buf_obj, "memory", &memory_obj);
+	buf->memory = (__u32) json_object_get_uint64(memory_obj);
+
+	json_object *length_obj;
+	json_object_object_get_ex(buf_obj, "length", &length_obj);
+	buf->length = (__u32) json_object_get_uint64(length_obj);
+
+	json_object *m_obj;
+	json_object_object_get_ex(buf_obj, "m", &m_obj);
+
+	/* multi-planar API */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		json_object *planes_obj;
+		json_object_object_get_ex(m_obj, "planes", &planes_obj);
+		 /* TODO add planes > 0 */
+		json_object *plane_obj = json_object_array_get_idx(planes_obj, 0);
+		buf->m.planes = retrace_v4l2_plane(plane_obj, buf->memory);
+	}
+
+	/* single-planar API */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+
+		switch (buf->memory) {
+		case V4L2_MEMORY_MMAP: {
+			json_object *offset_obj;
+			json_object_object_get_ex(m_obj, "offset", &offset_obj);
+			buf->m.offset = (__u32) json_object_get_uint64(offset_obj);
+			break;
+		}
+		case V4L2_MEMORY_USERPTR:
+		case V4L2_MEMORY_DMABUF:
+			break;
+		}
+	}
+
+	if (buf->flags & V4L2_BUF_FLAG_REQUEST_FD) {
+		json_object *request_fd_obj;
+		json_object_object_get_ex(buf_obj, "request_fd", &request_fd_obj);
+		buf->request_fd = (__s32) get_fd_retrace_from_fd_trace(json_object_get_int(request_fd_obj));
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
+	switch (buf->memory) {
+	case V4L2_MEMORY_MMAP: {
+		__u32 offset = 0;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT))
+			offset = buf->m.offset;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+			offset = buf->m.planes->m.mem_offset;
+		if (!get_buffer_fd_retrace(buf->type, buf->index))
+			add_buffer_retrace(fd_retrace, buf->type, buf->index, offset);
+		break;
+	}
+	case V4L2_MEMORY_USERPTR:
+	case V4L2_MEMORY_DMABUF:
+	default:
+		break;
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (buf->m.planes != nullptr) {
+			free(buf->m.planes);
+		}
+	}
+
+	if (verbose || (errno != 0)) {
+		perror("VIDIOC_QUERYBUF");
+		fprintf(stderr, "buf->type: %s, buf->index: %d, fd_retrace: %d\n",
+		        buftype2s(buf->type).c_str(), buf->index, fd_retrace);
+		print_context();
+	}
+
+	free(buf);
+}
+
+void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_QBUF, buf);
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (buf->m.planes != nullptr) {
+			free(buf->m.planes);
+		}
+	}
+
+	if (verbose || (errno != 0)) {
+		perror("VIDIOC_QBUF");
+		fprintf(stderr, "buf->type: %s, buf->index: %d, fd_retrace: %d, \n",
+		        buftype2s(buf->type).c_str(), buf->index, fd_retrace);
+		print_context();
+	}
+
+	free(buf);
+}
+
+struct v4l2_exportbuffer retrace_v4l2_exportbuffer(json_object *ioctl_args)
+{
+	struct v4l2_exportbuffer export_buffer = {};
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
+	struct v4l2_exportbuffer export_buffer = retrace_v4l2_exportbuffer(ioctl_args_user);
+	ioctl(fd_retrace, VIDIOC_EXPBUF, &export_buffer);
+
+	int buf_fd_retrace = export_buffer.fd;
+
+	/*
+	 * If a buffer was previously added to the retrace context using the video device
+	 * file descriptor, replace the video fd with the more specific buffer fd from EXPBUF.
+	 */
+	int fd_found_in_retrace_context = get_buffer_fd_retrace(export_buffer.type, export_buffer.index);
+	if (fd_found_in_retrace_context)
+		remove_buffer_retrace(fd_found_in_retrace_context);
+
+	add_buffer_retrace(buf_fd_retrace, export_buffer.type, export_buffer.index);
+
+	/*
+	 * Get the export buffer file descriptor as provided by the driver in the original
+	 * trace context. Then associate this original file descriptor with the current
+	 * file descriptor in the retrace context.
+	 */
+	memset(&export_buffer, 0, sizeof(v4l2_exportbuffer));
+	export_buffer = retrace_v4l2_exportbuffer(ioctl_args_driver);
+	int buf_fd_trace = export_buffer.fd;
+	add_fd(buf_fd_trace, buf_fd_retrace);
+
+	if (verbose || (errno != 0)) {
+		perror("VIDIOC_EXPBUF");
+		fprintf(stderr, "type: %s \n", buftype2s(export_buffer.type).c_str());
+		fprintf(stderr, "index: %d, fd: %d\n", export_buffer.index, buf_fd_retrace);
+		print_context();
+	}
+}
+
+void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+
+	struct pollfd *pfds = (struct pollfd *) calloc(1, sizeof(struct pollfd));
+	if (pfds == NULL)
+		exit(EXIT_FAILURE);
+	pfds[0].fd = fd_retrace;
+	pfds[0].events = POLLIN;
+	poll(pfds, 1, 5000);
+	free(pfds);
+
+	ioctl(fd_retrace, VIDIOC_DQBUF, buf);
+
+	if (verbose || (errno != 0)) {
+		perror("VIDIOC_DQBUF");
+		fprintf(stderr, "fd_retrace: %d\n", fd_retrace);
+		fprintf(stderr, "buf->index: %d\n", buf->index);
+		fprintf(stderr, "buf->type: %s,\n", buftype2s(buf->type).c_str());
+		fprintf(stderr, "buf->bytesused: %u, \n", buf->bytesused);
+		fprintf(stderr, "buf->flags: %u\n", buf->flags);
+		fprintf(stderr, "buf->field: %u, buf->request_fd: %d\n", buf->field, buf->request_fd);
+		fprintf(stderr, "buf->request_fd: %d\n", buf->request_fd);
+		print_context();
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE || buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (buf->m.planes != nullptr) {
+			free(buf->m.planes);
+		}
+	}
+
+	free(buf);
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
+	if (verbose || (errno != 0)) {
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
+	if (verbose || (errno != 0)) {
+		perror("VIDIOC_STREAMOFF");
+		fprintf(stderr, "buftype: %s\n", buftype2s(buf_type).c_str());
+		fprintf(stderr, "\n");
+	}
+}
+
+struct v4l2_plane_pix_format get_v4l2_plane_pix_format(json_object *pix_mp_obj, int plane)
+{
+	std::string key;
+	struct v4l2_plane_pix_format plane_fmt = {};
+
+	json_object *plane_fmt_obj, *sizeimage_obj, *bytesperline_obj;
+
+	key = "v4l2_plane_pix_format_";
+	key += std::to_string(plane);
+	json_object_object_get_ex(pix_mp_obj, key.c_str(), &plane_fmt_obj);
+
+	json_object_object_get_ex(plane_fmt_obj, "sizeimage", &sizeimage_obj);
+	plane_fmt.sizeimage = json_object_get_int64(sizeimage_obj);
+
+	json_object_object_get_ex(plane_fmt_obj, "bytesperline", &bytesperline_obj);
+	plane_fmt.bytesperline = json_object_get_int64(bytesperline_obj);
+
+	return plane_fmt;
+}
+
+struct v4l2_pix_format_mplane retrace_v4l2_pix_format_mplane(json_object *v4l2_format_obj)
+{
+	struct v4l2_pix_format_mplane pix_mp = {};
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
+	struct v4l2_format format = {};
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
+	struct v4l2_format format = retrace_v4l2_format(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_G_FMT, &format);
+
+	if (format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		set_pixelformat_retrace(format.fmt.pix.width, format.fmt.pix.height,
+		                        format.fmt.pix.pixelformat);
+	if (format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		set_pixelformat_retrace(format.fmt.pix_mp.width, format.fmt.pix_mp.height,
+		                        format.fmt.pix_mp.pixelformat);
+
+	if (verbose || (errno != 0))
+		perror("VIDIOC_G_FMT");
+}
+
+void retrace_vidioc_s_fmt(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct v4l2_format format = retrace_v4l2_format(ioctl_args_user);
+
+	ioctl(fd_retrace, VIDIOC_S_FMT, &format);
+
+	if (verbose || (errno != 0)) {
+		perror("VIDIOC_S_FMT");
+		fprintf(stderr, "%s\n", buftype2s(format.type).c_str());
+		fprintf(stderr, "format.fmt.pix_mp.pixelformat: %s\n\n",
+		        fcc2s(format.fmt.pix_mp.pixelformat).c_str());
+	}
+}
+
+int retrace_v4l2_ext_control_value(json_object *ctrl_obj)
+{
+	json_object *value_obj;
+	json_object_object_get_ex(ctrl_obj, "value", &value_obj);
+	return json_object_get_int(value_obj);
+}
+
+struct v4l2_ext_control retrace_v4l2_ext_control(json_object *ext_controls_obj, int ctrl_idx)
+{
+	struct v4l2_ext_control ctrl = {};
+
+	std::string unique_key_for_control = "v4l2_ext_control_";
+	unique_key_for_control += std::to_string(ctrl_idx);
+
+	json_object *ctrl_obj;
+	json_object_object_get_ex(ext_controls_obj, unique_key_for_control.c_str(), &ctrl_obj);
+
+	json_object *id_obj;
+	json_object_object_get_ex(ctrl_obj, "id", &id_obj);
+	ctrl.id = json_object_get_int64(id_obj);
+
+	json_object *size_obj;
+	json_object_object_get_ex(ctrl_obj, "size", &size_obj);
+	ctrl.size = json_object_get_int64(size_obj);
+
+	if ((ctrl.id & V4L2_CID_CODEC_STATELESS_BASE) == V4L2_CID_CODEC_STATELESS_BASE) {
+		switch (ctrl.id) {
+		case V4L2_CID_STATELESS_VP8_FRAME:
+			ctrl.ptr = retrace_v4l2_ctrl_vp8_frame_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_DECODE_MODE:
+		case V4L2_CID_STATELESS_H264_START_CODE:
+			ctrl.value = retrace_v4l2_ext_control_value(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_SPS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_sps_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_PPS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_pps_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_scaling_matrix_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_pred_weights_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_slice_params_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_decode_params_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_FWHT_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_fwht_params_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_VP9_FRAME:
+			ctrl.ptr = retrace_v4l2_ctrl_vp9_frame_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
+			ctrl.ptr = retrace_v4l2_ctrl_vp9_compressed_hdr_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_HEVC_SPS:
+			ctrl.ptr = retrace_v4l2_ctrl_hevc_sps_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_HEVC_PPS:
+			ctrl.ptr = retrace_v4l2_ctrl_hevc_pps_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_hevc_slice_params_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:
+			ctrl.ptr = retrace_v4l2_ctrl_hevc_scaling_matrix_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_hevc_decode_params_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_MPEG2_SEQUENCE:
+			ctrl.ptr = retrace_v4l2_ctrl_mpeg2_sequence_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_MPEG2_PICTURE:
+			ctrl.ptr = retrace_v4l2_ctrl_mpeg2_picture_gen(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
+			ctrl.ptr = retrace_v4l2_ctrl_mpeg2_quantisation_gen(ctrl_obj);
+			break;
+		default:
+			fprintf(stderr, "Unknown control: %d\n", ctrl.id);
+			break;
+		}
+	}
+	return ctrl;
+}
+
+struct v4l2_ext_control *retrace_v4l2_ext_control_array_pointer(json_object *ext_controls_obj, int count)
+{
+	struct v4l2_ext_control *ctrl_array_pointer;
+	ctrl_array_pointer = (struct v4l2_ext_control *) calloc(count, sizeof(v4l2_ext_control));
+
+	for (int i = 0; i < count; i++)
+		ctrl_array_pointer[i] = retrace_v4l2_ext_control(ext_controls_obj, i);
+
+	return ctrl_array_pointer;
+}
+
+void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_ext_controls ext_controls = {};
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
+		ext_controls.request_fd = get_fd_retrace_from_fd_trace(request_fd_trace);
+	}
+
+	ext_controls.controls = retrace_v4l2_ext_control_array_pointer(ext_controls_obj, ext_controls.count);
+
+	ioctl(fd_retrace, VIDIOC_S_EXT_CTRLS, &ext_controls);
+
+	if (verbose || (errno != 0))
+		perror("VIDIOC_S_EXT_CTRLS");
+
+	/* Free controls working backwards from the end of the controls array. */
+	for (int i = ((int) ext_controls.count - 1); i >= 0 ; i--) {
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
+	struct v4l2_query_ext_ctrl query_ext_ctrl = {};
+
+	json_object *query_ext_ctrl_obj;
+	json_object_object_get_ex(ioctl_args, "v4l2_query_ext_ctrl", &query_ext_ctrl_obj);
+
+	json_object *id_obj;
+	json_object_object_get_ex(query_ext_ctrl_obj, "id", &id_obj);
+	query_ext_ctrl.id = json_object_get_int64(id_obj);
+
+	ioctl(fd_retrace, VIDIOC_QUERY_EXT_CTRL, &query_ext_ctrl);
+
+	if (verbose) {
+		perror("VIDIOC_QUERY_EXT_CTRL");
+		fprintf(stderr, "id: %u\n\n", query_ext_ctrl.id);
+	}
+}
+
+void retrace_vidioc_enum_fmt(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_fmtdesc fmtdesc = {};
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
+	fmtdesc.mbus_code = json_object_get_int64(mbus_code_obj);
+
+	ioctl(fd_retrace, VIDIOC_ENUM_FMT, &fmtdesc);
+
+	if (verbose) {
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
+	struct v4l2_capability argp = {};
+
+	ioctl(fd_retrace, VIDIOC_QUERYCAP, &argp);
+
+	if (verbose || (errno != 0))
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
+	if (verbose || (errno != 0))
+		perror("MEDIA_IOC_REQUEST_ALLOC");
+}
+
+void retrace_dma_buf_ioctl_sync(int fd_retrace, json_object *ioctl_args_user)
+{
+	struct dma_buf_sync sync = {};
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
+	if (verbose || (errno != 0))
+		perror("DMA_BUF_IOCTL_SYNC");
+}
+
+void retrace_ioctl_media(int fd_retrace, long request, json_object *ioctl_args_driver)
+{
+	switch (request){
+	case MEDIA_IOC_DEVICE_INFO:
+	case MEDIA_IOC_ENUM_ENTITIES:
+	case MEDIA_IOC_ENUM_LINKS:
+	case MEDIA_IOC_SETUP_LINK:
+	case MEDIA_IOC_G_TOPOLOGY: {
+		struct media_v2_topology top = {};
+		ioctl(fd_retrace, MEDIA_IOC_G_TOPOLOGY, &top);
+		if (verbose || (errno != 0))
+			perror("MEDIA_IOC_G_TOPOLOGY");
+		break;
+	}
+	case MEDIA_IOC_REQUEST_ALLOC:
+		retrace_media_ioc_request_alloc(fd_retrace, ioctl_args_driver);
+		break;
+	case MEDIA_REQUEST_IOC_QUEUE: {
+		ioctl(fd_retrace, MEDIA_REQUEST_IOC_QUEUE);
+		if (verbose || (errno != 0))
+			perror("MEDIA_REQUEST_IOC_QUEUE");
+		break;
+	}
+	case MEDIA_REQUEST_IOC_REINIT: {
+		ioctl(fd_retrace, MEDIA_REQUEST_IOC_REINIT);
+		if (verbose || (errno != 0))
+			perror("MEDIA_REQUEST_IOC_REINIT");
+		break;
+	}
+	default:
+		break;
+	}
+}
+
+void retrace_ioctl_video(int fd_retrace, long request, json_object *ioctl_args_user, json_object *ioctl_args_driver)
+{
+	switch (request) {
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
+	long request = 0;
+
+	json_object *fd_trace_obj;
+	json_object_object_get_ex(syscall_obj, "fd", &fd_trace_obj);
+	fd_retrace = get_fd_retrace_from_fd_trace(json_object_get_int(fd_trace_obj));
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
+	if (verbose) {
+		fprintf(stderr, "\nWrite to Output Buffer\n");
+		fprintf(stderr, "bytesused: %d, byteswritten: %d\n", bytesused, byteswritten);
+		fprintf(stderr, "\n");
+	}
+}
+
+void write_decoded_frames_to_yuv_file_retrace(unsigned char *buffer_pointer, int bytesused)
+{
+	int byteswritten = 0;
+	int expected_length = (int) get_expected_length_retrace();
+
+	FILE *fp = fopen(retrace_filename.c_str(), "a");
+	for (int i = 0; i < bytesused; i++) {
+		if (i < expected_length) {
+			fwrite(&buffer_pointer[i], sizeof(unsigned char), 1, fp);
+			byteswritten++;
+		}
+	}
+	fclose(fp);
+
+	if (verbose){
+		fprintf(stderr, "\nWrite to File\n");
+		fprintf(stderr, "%s\n", retrace_filename.c_str());
+		fprintf(stderr, "buffer_pointer address: %ld, bytesused: %d, byteswritten: %d\n", (long) buffer_pointer, bytesused, byteswritten);
+		fprintf(stderr, "\n");
+		print_context();
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
+	int bytesused = json_object_get_int64(bytesused_obj);
+	if (!bytesused)
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
+	/* Get the decoded capture buffer from memory and write it to a binary yuv file. */
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE || type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		write_decoded_frames_to_yuv_file_retrace(buffer_pointer, bytesused);
+
+	if (verbose) {
+		fprintf(stderr, "\n%s\n", __func__);
+		fprintf(stderr, "%s, bytesused: %d, offset: %d, buffer_address_retrace: %ld\n",
+		        buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
+		print_context();
+	}
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
+		if (json_object_object_get_ex(jobj, "mem_dump", &temp_obj))
+			retrace_mem(jobj);
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
+		retrace_open(jobj, false);
+		break;
+	case LIBTRACER_SYSCALL_OPEN64:
+		retrace_open(jobj, true);
+		break;
+	case LIBTRACER_SYSCALL_CLOSE:
+		retrace_close(jobj);
+		break;
+	case LIBTRACER_SYSCALL_MMAP:
+		retrace_mmap(jobj, false);
+		break;
+	case LIBTRACER_SYSCALL_MMAP64:
+		retrace_mmap(jobj, true);
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
+	size_t json_objects_in_file = array_list_length(al);
+
+	for (size_t i = 0; i < json_objects_in_file; i++) {
+		jobj = (json_object *) array_list_get_idx(al, i);
+		retrace_object(jobj);
+	}
+}
+
+int get_options_retrace(int argc, char *argv[])
+{
+	int ch;
+	do {
+		ch = getopt_long(argc, argv, short_options_retracer, long_options_retracer, NULL);
+		switch (ch){
+		case OptSetDevice_Retracer: {
+			std::string device = optarg;
+			if (device[0] >= '0' && device[0] <= '9' && device.length() <= 3) {
+				static char newdev[20];
+				sprintf(newdev, "/dev/video%s", optarg);
+				dev_path_video = newdev;
+				fprintf(stderr, "Using: %s\n", dev_path_video.c_str());
+			} else {
+				return 1;
+			}
+			break;
+		}
+		case OptSetMediaDevice_Retracer: {
+			std::string device = optarg;
+			if (device[0] >= '0' && device[0] <= '9' && device.length() <= 3) {
+				static char newdev[20];
+				sprintf(newdev, "/dev/media%s", optarg);
+				device = newdev;
+				dev_path_media = newdev;
+				fprintf(stderr, "Using: %s\n", dev_path_media.c_str());
+			} else {
+				return 1;
+			}
+			break;
+		}
+		case OptVerbose_Retracer:
+			verbose = true;
+			break;
+		case '?':
+		case ':':
+			return 1;
+		default:
+			break;
+		}
+	} while (ch != -1);
+
+	return 0;
+}
+
+void print_help_retracer(void)
+{
+		fprintf(stderr, "v4l2-tracer retrace [retrace options] -- <trace_file>.json\n"
+	        "\t-d, --device <dev>   Use a different video device than specified in the trace file.\n"
+	        "\t                     <dev> must be a digit corresponding to an existing /dev/video<dev> \n"
+	        "\t-h, --help           Display retrace help.\n"
+	        "\t-m, --media <dev>    Use a different media device than specified in the trace file.\n"
+	        "\t                     <dev> must be a digit corresponding to an existing /dev/media<dev> \n"
+	        "\t-v, --verbose        Turn on verbose reporting\n\n");
+}
+
+int retracer(int argc, char *argv[])
+{
+	if ((get_options_retrace(argc, argv)) || (optind == argc)) {
+		print_help_retracer();
+		return 1;
+	}
+
+	std::string trace_filename = argv[optind];
+
+	if (trace_filename.substr(trace_filename.length()-4, trace_filename.npos) != "json") {
+		fprintf(stderr, "Trace file must be json-formatted: %s\n", trace_filename.c_str());
+		print_help_retracer();
+		return 1;
+	}
+
+	FILE *trace_file = fopen(trace_filename.c_str(), "r");
+	if (trace_file == NULL) {
+		fprintf(stderr, "Trace file error: %s\n", trace_filename.c_str());
+		return 1;
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
+	if (root_array_obj == nullptr) {
+		fprintf(stderr, "Retrace error from file: %s\n", trace_filename.c_str());
+		return 1;
+	}
+	/* Discard any previous retrace with same name. */
+	fclose(fopen(retrace_filename.c_str(), "w"));
+
+	retrace_array(root_array_obj);
+	json_object_put(root_array_obj);
+
+	fprintf(stderr, "Retracing complete in %s\n", retrace_filename.c_str());
+
+	return 0;
+}
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
new file mode 100644
index 00000000..6b4bf567
--- /dev/null
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -0,0 +1,816 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include <math.h> /* for pow */
+#include "v4l2-tracer-common.h"
+#include "trace-helper.h"
+#include "trace-info-gen.h"
+
+void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start);
+void trace_mem_encoded(int fd, __u32 offset);
+
+struct buffer_trace {
+	int fd;
+	__u32 type; /* enum v4l2_buf_type */
+	__u32 index;
+	__u32 offset;
+	__u32 bytesused;
+	long display_order;
+	unsigned long address;
+};
+
+struct trace_context {
+	__u32 width;
+	__u32 height;
+	FILE *trace_file;
+	__u32 pixelformat;
+	int pic_order_cnt_lsb;
+	int max_pic_order_cnt_lsb;
+	pthread_mutex_t lock;
+	__u32 compression_format;
+	std::string trace_filename;
+	int compressed_frame_count;
+	std::list<long> decode_order;
+	std::list<struct buffer_trace> buffers;
+	std::unordered_map<int, std::string> devices; /* key:fd, value: path of the device */
+};
+
+struct trace_options {
+	bool options_are_set;
+	bool verbose;
+	bool pretty_print_all;
+	bool pretty_print_mem;
+	bool write_decoded_data_to_yuv_file;
+	bool write_decoded_data_to_json_file;
+};
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
+std::string val2s(unsigned long val, const definition *def)
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
+struct trace_options options;
+
+struct trace_context ctx_trace = {
+	.lock = PTHREAD_MUTEX_INITIALIZER
+};
+
+bool options_are_set(void)
+{
+	return options.options_are_set;
+}
+
+void set_options(void)
+{
+	options.verbose = getenv("TRACE_OPTION_VERBOSE") ? true : false;
+	options.pretty_print_mem = getenv("TRACE_OPTION_PRETTY_PRINT_MEM") ? true : false;
+	options.pretty_print_all = getenv("TRACE_OPTION_PRETTY_PRINT_ALL") ? true : false;
+	options.write_decoded_data_to_json_file = getenv("TRACE_OPTION_WRITE_DECODED_TO_JSON_FILE") ? true : false;
+	options.write_decoded_data_to_yuv_file = getenv("TRACE_OPTION_WRITE_DECODED_TO_YUV_FILE") ? true : false;
+	options.options_are_set = true;
+}
+
+bool option_is_set_verbose(void)
+{
+	return options.verbose;
+}
+
+bool option_is_set_pretty_print_mem(void)
+{
+	return options.pretty_print_mem;
+}
+
+bool option_is_set_write_decoded_data_to_json_file(void)
+{
+	return options.write_decoded_data_to_json_file;
+}
+
+bool is_video_or_media_device(const char *path)
+{
+	std::string dev_path_video = "/dev/video";
+	std::string dev_path_media = "/dev/media";
+	if (strncmp(path, dev_path_video.c_str(), dev_path_video.length()) &&
+	    strncmp(path, dev_path_media.c_str(), dev_path_media.length()))
+		return false;
+	return true;
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
+int count_devices(void)
+{
+	int count = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	count = ctx_trace.devices.size();
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return count;
+}
+
+void set_pixelformat_trace(__u32 width, __u32 height, __u32 pixelformat)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.width = width;
+	ctx_trace.height = height;
+	ctx_trace.pixelformat = pixelformat;
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+__u32 get_pixelformat(void)
+{
+	__u32 pixelformat = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	pixelformat = ctx_trace.pixelformat;
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return pixelformat;
+}
+
+void set_compression_format(__u32 compression_format)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.compression_format = compression_format;
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+__u32 get_compression_format(void)
+{
+	__u32 compression_format = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	compression_format = ctx_trace.compression_format;
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return compression_format;
+}
+
+void set_compressed_frame_count(int count)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.compressed_frame_count = count;
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+int get_compressed_frame_count(void)
+{
+	int ret = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	ret = ctx_trace.compressed_frame_count;
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return ret;
+}
+
+void print_decode_order(void)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	fprintf(stderr, "Decode order: ");
+	for (auto &num : ctx_trace.decode_order)
+		fprintf(stderr, "%ld, ",  num);
+	fprintf(stderr, ".\n");
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+void set_decode_order(long decode_order)
+{
+	if (option_is_set_verbose())
+		fprintf(stderr, "%s: %ld\n", __func__, decode_order);
+
+	std::list<long>::iterator it;
+	pthread_mutex_lock(&ctx_trace.lock);
+	it = find(ctx_trace.decode_order.begin(), ctx_trace.decode_order.end(), decode_order);
+	if (it == ctx_trace.decode_order.end())
+		ctx_trace.decode_order.push_front(decode_order);
+	pthread_mutex_unlock(&ctx_trace.lock);
+
+	if (option_is_set_verbose())
+		print_decode_order();
+}
+
+long get_decode_order(void)
+{
+	long decode_order = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	if (!ctx_trace.decode_order.empty())
+		decode_order = ctx_trace.decode_order.front();
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return decode_order;
+}
+
+void set_max_pic_order_cnt_lsb(int max_pic_order_cnt_lsb)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.max_pic_order_cnt_lsb = max_pic_order_cnt_lsb;
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+int get_max_pic_order_cnt_lsb(void)
+{
+	int max_pic_order_cnt_lsb = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	max_pic_order_cnt_lsb = ctx_trace.max_pic_order_cnt_lsb;
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return max_pic_order_cnt_lsb;
+}
+
+void set_pic_order_cnt_lsb(int pic_order_cnt_lsb)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.pic_order_cnt_lsb = pic_order_cnt_lsb;
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+int get_pic_order_cnt_lsb(void)
+{
+	int pic_order_cnt_lsb = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	pic_order_cnt_lsb = ctx_trace.pic_order_cnt_lsb;
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return pic_order_cnt_lsb;
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
+
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.buffers.push_front(buf);
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+void remove_buffer_trace(int fd)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if (it->fd == fd) {
+			ctx_trace.buffers.erase(it);
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+bool buffer_in_trace_context(int fd, __u32 offset)
+{
+	bool buffer_in_trace_context = false;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			buffer_in_trace_context = true;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return buffer_in_trace_context;
+}
+
+int get_buffer_fd_trace(__u32 type, __u32 index)
+{
+	int fd = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.type == type) && (b.index == index)) {
+			fd = b.fd;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return fd;
+}
+
+__u32 get_buffer_type_trace(int fd, __u32 offset)
+{
+	__u32 type = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			type = b.type;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return type;
+}
+
+int get_buffer_index_trace(int fd, __u32 offset)
+{
+	int index = -1;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			index = b.index;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return index;
+}
+
+__u32 get_buffer_offset_trace(__u32 type, __u32 index)
+{
+	__u32 offset = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.type == type) && (b.index == index)) {
+			offset = b.offset;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return offset;
+}
+
+void set_buffer_bytesused_trace(int fd, __u32 offset, __u32 bytesused)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.bytesused = bytesused;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+long get_buffer_bytesused_trace(int fd, __u32 offset)
+{
+	long bytesused = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			bytesused = b.bytesused;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return bytesused;
+}
+
+void set_buffer_display_order(int fd, __u32 offset, long display_order)
+{
+	if (option_is_set_verbose())
+		fprintf(stderr, "%s: %ld\n", __func__, display_order);
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.display_order = display_order;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+void set_buffer_address_trace(int fd, __u32 offset, unsigned long address)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			b.address = address;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+unsigned long get_buffer_address_trace(int fd, __u32 offset)
+{
+	unsigned long address = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if ((b.fd == fd) && (b.offset == offset)) {
+			address = b.address;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return address;
+}
+
+bool buffer_is_mapped(unsigned long buffer_address)
+{
+	bool ret = false;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		if (b.address == buffer_address) {
+			ret = true;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return ret;
+}
+
+void print_buffers_trace(void)
+{
+	pthread_mutex_unlock(&ctx_trace.lock);
+	for (auto &b : ctx_trace.buffers) {
+		fprintf(stderr, "fd: %d, %s, index: %d, display_order: %ld, bytesused: %d, ",
+		        b.fd, buftype2s(b.type).c_str(), b.index, b.display_order, b.bytesused);
+		fprintf(stderr, "address: %lu, offset: %u \n",  b.address, b.offset);
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+std::string get_ioctl_request_str(unsigned long request)
+{
+	__u8 ioctl_type = _IOC_TYPE(request);
+	switch (ioctl_type) {
+		case 'V': {
+			if (option_is_set_verbose())
+				fprintf(stderr, "%s\n", ioctl2s_video(request).c_str());
+			return ioctl2s_video(request);
+		}
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
+unsigned get_expected_length_trace()
+{
+	unsigned width;
+	unsigned height;
+	unsigned pixelformat;
+	unsigned expected_length;
+
+	pthread_mutex_lock(&ctx_trace.lock);
+	width = ctx_trace.width;
+	height = ctx_trace.height;
+	pixelformat = ctx_trace.pixelformat;
+	pthread_mutex_unlock(&ctx_trace.lock);
+
+	/*
+	 * TODO: this assumes that the stride is equal to the real width and that the
+	 * padding follows the end of the chroma plane. It could be improved by
+	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_frame()
+	 */
+	expected_length = width * height;
+	if (pixelformat == V4L2_PIX_FMT_NV12 || pixelformat == V4L2_PIX_FMT_YUV420) {
+		expected_length *= 3;
+		expected_length /= 2;
+		expected_length += (expected_length % 2);
+	}
+	return expected_length;
+}
+
+void trace_mem_decoded(void)
+{
+	int displayed_count = 0;
+	unsigned expected_length = get_expected_length_trace();
+
+	pthread_mutex_lock(&ctx_trace.lock);
+
+	while (!ctx_trace.decode_order.empty()) {
+
+		std::list<buffer_trace>::iterator it;
+		long next_frame_to_be_displayed = *std::min_element(ctx_trace.decode_order.begin(),
+		                                                    ctx_trace.decode_order.end());
+
+		for (it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+			if (it->display_order != next_frame_to_be_displayed)
+				continue;
+			if (!it->address)
+				break;
+			if (it->bytesused < expected_length)
+				break;
+			if (option_is_set_verbose())
+				fprintf(stderr, "%s, displaying: %ld, %s, index: %d\n",
+				        __func__, it->display_order, buftype2s(it->type).c_str(), it->index);
+			displayed_count++;
+
+			if (options.write_decoded_data_to_yuv_file) {
+				std::string filename = getenv("TRACE_ID");
+				filename +=  ".yuv";
+				FILE *fp = fopen(filename.c_str(), "a");
+				unsigned char *buffer_pointer = (unsigned char*) it->address;
+				for (__u32 i = 0; i < expected_length; i++)
+					fwrite(&buffer_pointer[i], sizeof(unsigned char), 1, fp);
+				fclose(fp);
+			}
+			int fd = it->fd;
+			__u32 offset = it->offset;
+			__u32 type = it->type;
+			int index = it->index;
+			__u32 bytesused = it->bytesused;
+			unsigned long start = it->address;
+
+			pthread_mutex_unlock(&ctx_trace.lock);
+			trace_mem(fd, offset, type, index, bytesused, start);
+			pthread_mutex_lock(&ctx_trace.lock);
+
+			ctx_trace.decode_order.remove(next_frame_to_be_displayed);
+			it->display_order = -1;
+			break;
+		}
+		if (!it->address || it == ctx_trace.buffers.end() || it->bytesused < expected_length)
+			break;
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	set_compressed_frame_count(get_compressed_frame_count() - displayed_count);
+}
+
+void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
+{
+	if (ext_controls->which != V4L2_CTRL_WHICH_REQUEST_VAL)
+		return;
+
+	if (option_is_set_verbose())
+		fprintf(stderr, "\n%s\n", __func__);
+
+	for (__u32 i = 0; i < ext_controls->count; i++) {
+		struct v4l2_ext_control ctrl = ext_controls->controls[i];
+
+		switch (ctrl.id) {
+		case V4L2_CID_STATELESS_H264_SPS: {
+			set_max_pic_order_cnt_lsb(pow(2, ctrl.p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 + 4));
+			break;
+		}
+		case V4L2_CID_STATELESS_H264_DECODE_PARAMS: {
+			long pic_order_cnt_msb;
+			int max = get_max_pic_order_cnt_lsb();
+			long prev_pic_order_cnt_msb = get_decode_order();
+			int prev_pic_order_cnt_lsb = get_pic_order_cnt_lsb();
+			int pic_order_cnt_lsb = ctrl.p_h264_decode_params->pic_order_cnt_lsb;
+
+			if (option_is_set_verbose()) {
+				fprintf(stderr, "\tprev_pic_order_cnt_lsb: %d\n", prev_pic_order_cnt_lsb);
+				fprintf(stderr, "\tprev_pic_order_cnt_msb: %ld\n", prev_pic_order_cnt_msb);
+				fprintf(stderr, "\tpic_order_cnt_lsb: %d\n", pic_order_cnt_lsb);
+			}
+
+			/* The first frame. */
+			if (prev_pic_order_cnt_msb == 0)
+				pic_order_cnt_msb = 0;
+
+			/*
+			 * TODO: improve the displaying of decoded frames following H264 specification
+			 * 8.2.1.1. For now, dump all the previously decoded frames when an IDR_PIC is
+			 * received to avoid losing frames although this will still sometimes result
+			 * in frames out of order.
+			 */
+			if (ctrl.p_h264_decode_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) {
+				if (get_compressed_frame_count())
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
+			if (option_is_set_verbose())
+				fprintf(stderr, "\tpic_order_cnt_msb: %ld\n", pic_order_cnt_msb);
+
+			set_pic_order_cnt_lsb(pic_order_cnt_lsb);
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
+	if (option_is_set_verbose())
+		fprintf(stderr, "\n%s: %s, index: %d\n", __func__, buftype2s(buf->type).c_str(), buf->index);
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
+		set_compressed_frame_count(get_compressed_frame_count() + 1);
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+
+		/* If the capture buffer is queued for reuse, trace it before it is reused. */
+		if (get_compressed_frame_count())
+			trace_mem_decoded();
+
+		/* H264 sets display order in controls, otherwise display just in the order queued. */
+		if (get_compression_format() != V4L2_PIX_FMT_H264_SLICE)
+			set_decode_order(get_decode_order() + 1);
+
+		set_buffer_display_order(buf_fd, buf_offset, get_decode_order());
+
+		if (option_is_set_verbose()) {
+			print_decode_order();
+			print_buffers_trace();
+		}
+	}
+}
+
+void streamoff_cleanup(v4l2_buf_type buf_type)
+{
+	if (option_is_set_verbose()) {
+		fprintf(stderr, "\nVIDIOC_STREAMOFF: %s\n", buftype2s(buf_type).c_str());
+		fprintf(stderr, "compression: %s, pixelformat: %s %s, width: %d, height: %d\n",
+		        pixfmt2s(get_compression_format()).c_str(), pixfmt2s(get_pixelformat()).c_str(),
+		        fcc2s(get_pixelformat()).c_str(), ctx_trace.width, ctx_trace.height);
+	}
+
+	/*
+	 * Before turning off the stream, trace any remaining capture buffers that were missed
+	 * because they were not queued for reuse.
+	 */
+	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		if (get_compressed_frame_count())
+			trace_mem_decoded();
+	}
+}
+
+void g_fmt_setup_trace(struct v4l2_format *format)
+{
+	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		set_pixelformat_trace(format->fmt.pix.width,
+		                      format->fmt.pix.height, format->fmt.pix.pixelformat);
+	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		set_pixelformat_trace(format->fmt.pix_mp.width, format->fmt.pix_mp.height,
+		                      format->fmt.pix_mp.pixelformat);
+
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		set_compression_format(format->fmt.pix.pixelformat);
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		set_compression_format(format->fmt.pix_mp.pixelformat);
+}
+
+void s_fmt_setup(struct v4l2_format *format)
+{
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		set_compression_format(format->fmt.pix.pixelformat);
+	if (format->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		set_compression_format(format->fmt.pix_mp.pixelformat);
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
+	if (fd_found_in_trace_context)
+		remove_buffer_trace(fd_found_in_trace_context);
+
+	add_buffer_trace(export_buffer->fd, type, index);
+}
+
+void querybuf_setup(int fd, struct v4l2_buffer *buf)
+{
+	/* If the buffer was already added to the trace context don't add it again. */
+	if (get_buffer_fd_trace(buf->type, buf->index))
+		return;
+
+	switch (buf->memory) {
+	case V4L2_MEMORY_MMAP: {
+		__u32 offset = 0;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT))
+			offset = buf->m.offset;
+		if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) ||
+		    (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+			offset = buf->m.planes->m.mem_offset;
+		add_buffer_trace(fd, buf->type, buf->index, offset);
+		break;
+	}
+	case V4L2_MEMORY_USERPTR:
+	case V4L2_MEMORY_DMABUF:
+	default:
+		break;
+	}
+}
+
+void write_json_object_to_json_file(json_object *jobj, int flags)
+{
+	if (options.pretty_print_all)
+		flags = JSON_C_TO_STRING_PRETTY;
+
+	std::string json_str = json_object_to_json_string_ext(jobj, flags);
+	pthread_mutex_lock(&ctx_trace.lock);
+
+	if (!ctx_trace.trace_file) {
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
+
+void close_json_file(void)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	if (ctx_trace.trace_file) {
+		fclose(ctx_trace.trace_file);
+		ctx_trace.trace_file = 0;
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
diff --git a/utils/v4l2-tracer/trace-helper.h b/utils/v4l2-tracer/trace-helper.h
new file mode 100644
index 00000000..ee5fc5ce
--- /dev/null
+++ b/utils/v4l2-tracer/trace-helper.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_HELPER_H
+#define TRACE_HELPER_H
+
+struct definition {
+	unsigned long val;
+	const char *str;
+};
+
+std::string ver2s(unsigned int version);
+std::string which2s(unsigned long which);
+std::string val2s(unsigned long val, const definition *def);
+
+bool options_are_set(void);
+void set_options(void);
+bool option_is_set_verbose(void);
+bool option_is_set_pretty_print_mem(void);
+bool option_is_set_write_decoded_data_to_json_file(void);
+
+bool is_video_or_media_device(const char *path);
+void add_device(int fd, std::string path);
+std::string get_device(int fd);
+int remove_device(int fd);
+int count_devices(void);
+
+bool buffer_in_trace_context(int fd, __u32 offset = 0);
+__u32 get_buffer_type_trace(int fd, __u32 offset = 0);
+int get_buffer_index_trace(int fd, __u32 offset);
+long get_buffer_bytesused_trace(int fd, __u32 offset);
+void set_buffer_address_trace(int fd, __u32 offset, unsigned long address);
+unsigned long get_buffer_address_trace(int fd, __u32 offset);
+bool buffer_is_mapped(unsigned long buffer_address);
+
+std::string get_ioctl_request_str(unsigned long request);
+
+void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls);
+void qbuf_setup(struct v4l2_buffer *buf);
+void streamoff_cleanup(v4l2_buf_type buf_type);
+void g_fmt_setup_trace(struct v4l2_format *format);
+void s_fmt_setup(struct v4l2_format *format);
+void expbuf_setup(struct v4l2_exportbuffer *export_buffer);
+void querybuf_setup(int fd, struct v4l2_buffer *buf);
+
+void write_json_object_to_json_file(json_object *jobj, int flags = JSON_C_TO_STRING_PLAIN);
+void close_json_file(void);
+
+#endif
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
new file mode 100644
index 00000000..fa3c2d8f
--- /dev/null
+++ b/utils/v4l2-tracer/trace.cpp
@@ -0,0 +1,669 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer-common.h"
+#include "trace-helper.h"
+#include "trace-gen.h"
+#include "trace-info-gen.h"
+
+void trace_open(int fd, const char *path, int oflag, mode_t mode, bool is_open64)
+{
+	json_object *open_obj = json_object_new_object();
+
+	if (is_open64) {
+		json_object_object_add(open_obj, "syscall_str", json_object_new_string("open64"));
+		json_object_object_add(open_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_OPEN64));
+	} else {
+		json_object_object_add(open_obj, "syscall_str", json_object_new_string("open"));
+		json_object_object_add(open_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_OPEN));
+	}
+
+	json_object_object_add(open_obj, "fd", json_object_new_int(fd));
+
+	json_object *open_args = json_object_new_object();
+	json_object_object_add(open_args, "path", json_object_new_string(path));
+	json_object_object_add(open_args, "oflag", json_object_new_int(oflag));
+	json_object_object_add(open_args, "mode", json_object_new_uint64(mode));
+	json_object_object_add(open_obj, "open_args", open_args);
+
+	write_json_object_to_json_file(open_obj);
+	json_object_put(open_obj);
+}
+
+void trace_mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off, unsigned long buf_address, bool is_mmap64)
+{
+	json_object *mmap_obj = json_object_new_object();
+
+	if (errno) {
+		json_object_object_add(mmap_obj, "errno", json_object_new_int(errno));
+		json_object_object_add(mmap_obj, "errno_str", json_object_new_string(strerror(errno)));
+	}
+
+	if (is_mmap64) {
+		json_object_object_add(mmap_obj, "syscall_str", json_object_new_string("mmap64"));
+		json_object_object_add(mmap_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_MMAP64));
+	} else {
+		json_object_object_add(mmap_obj, "syscall_str", json_object_new_string("mmap"));
+		json_object_object_add(mmap_obj, "syscall", json_object_new_int(LIBTRACER_SYSCALL_MMAP));
+	}
+
+	json_object *mmap_args = json_object_new_object();
+	json_object_object_add(mmap_args, "addr", json_object_new_int64((int64_t)addr));
+	json_object_object_add(mmap_args, "len", json_object_new_uint64(len));
+	json_object_object_add(mmap_args, "prot", json_object_new_int(prot));
+	json_object_object_add(mmap_args, "flags", json_object_new_int(flags));
+	json_object_object_add(mmap_args, "fildes", json_object_new_int(fildes));
+	json_object_object_add(mmap_args, "off", json_object_new_int64(off));
+	json_object_object_add(mmap_obj, "mmap_args", mmap_args);
+
+	json_object_object_add(mmap_obj, "buffer_address", json_object_new_uint64(buf_address));
+
+	write_json_object_to_json_file(mmap_obj);
+	json_object_put(mmap_obj);
+}
+
+json_object *trace_buffer(unsigned char *buffer_pointer, __u32 bytesused)
+{
+	char buf[5];
+	std::string s;
+	int byte_count_per_line = 0;
+	json_object *mem_array_obj = json_object_new_array();
+
+	for (__u32 i = 0; i < bytesused; i++) {
+		memset(buf, 0, sizeof(buf));
+		/*
+		 * Each byte e.g. D9 will write a string of two characters "D9".
+		 * The bytes are displayed with the most-significant bits first.
+		 */
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
+void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start)
+{
+	json_object *mem_obj = json_object_new_object();
+	json_object_object_add(mem_obj, "mem_dump", json_object_new_string(buftype2s(type).c_str()));
+	json_object_object_add(mem_obj, "fd", json_object_new_int(fd));
+	json_object_object_add(mem_obj, "offset", json_object_new_uint64(offset));
+	json_object_object_add(mem_obj, "type", json_object_new_uint64(type));
+	json_object_object_add(mem_obj, "index", json_object_new_int(index));
+	json_object_object_add(mem_obj, "bytesused", json_object_new_uint64(bytesused));
+	json_object_object_add(mem_obj, "address", json_object_new_uint64(start));
+
+	if ((type == V4L2_BUF_TYPE_VIDEO_OUTPUT || type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ||
+	    (option_is_set_write_decoded_data_to_json_file())) {
+		json_object *mem_array_obj = trace_buffer((unsigned char*) start, bytesused);
+		json_object_object_add(mem_obj, "mem_array", mem_array_obj);
+	}
+
+	if (option_is_set_pretty_print_mem())
+		write_json_object_to_json_file(mem_obj, JSON_C_TO_STRING_PRETTY);
+	else
+		write_json_object_to_json_file(mem_obj);
+
+	json_object_put(mem_obj);
+}
+
+void trace_mem_encoded(int fd, __u32 offset)
+{
+	int index;
+	__u32 type;
+	__u32 bytesused;
+	unsigned long start = get_buffer_address_trace(fd, offset);
+
+	if (!start)
+		return;
+
+	if (option_is_set_verbose())
+		fprintf(stderr, "%s\n", __func__);
+
+	bytesused = get_buffer_bytesused_trace(fd, offset);
+	type = get_buffer_type_trace(fd, offset);
+	index = get_buffer_index_trace(fd, offset);
+	trace_mem(fd, offset, type, index, bytesused, start);
+}
+
+void trace_vidioc_querycap(void *arg, json_object *ioctl_args)
+{
+	json_object *cap_obj = json_object_new_object();
+	struct v4l2_capability *cap = static_cast<struct v4l2_capability*>(arg);
+
+	json_object_object_add(cap_obj, "driver", json_object_new_string((const char *)cap->driver));
+	json_object_object_add(cap_obj, "card", json_object_new_string((const char *)cap->card));
+	json_object_object_add(cap_obj, "bus_info",
+	                       json_object_new_string((const char *)cap->bus_info));
+	json_object_object_add(cap_obj, "version",
+	                       json_object_new_string(ver2s(cap->version).c_str()));
+	json_object_object_add(cap_obj, "capabilities", json_object_new_int64(cap->capabilities));
+	json_object_object_add(cap_obj, "capabilities_str",
+		                       json_object_new_string(capabilities2s(cap->capabilities).c_str()));
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
+	json_object_object_add(fmtdesc_obj, "type_str",
+	                       json_object_new_string(buftype2s(fmtdesc->type).c_str()));
+	json_object_object_add(fmtdesc_obj, "type", json_object_new_uint64(fmtdesc->type));
+	json_object_object_add(fmtdesc_obj, "flags", json_object_new_uint64(fmtdesc->flags));
+	json_object_object_add(fmtdesc_obj, "description",
+	                       json_object_new_string((const char *)fmtdesc->description));
+	json_object_object_add(fmtdesc_obj, "pixelformat",
+	                       json_object_new_uint64(fmtdesc->pixelformat));
+	json_object_object_add(fmtdesc_obj, "mbus_code", json_object_new_uint64(fmtdesc->mbus_code));
+	json_object_object_add(ioctl_args, "v4l2_fmtdesc", fmtdesc_obj);
+}
+
+void trace_v4l2_plane_pix_format(json_object *pix_mp_obj, struct v4l2_plane_pix_format plane_fmt, int plane)
+{
+	json_object *plane_fmt_obj = json_object_new_object();
+
+	json_object_object_add(plane_fmt_obj, "sizeimage",
+	                       json_object_new_uint64(plane_fmt.sizeimage));
+	json_object_object_add(plane_fmt_obj, "bytesperline",
+	                       json_object_new_uint64(plane_fmt.bytesperline));
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
+	json_object_object_add(pix_mp_obj, "pixelformat_str",
+	                       json_object_new_string(pixfmt2s(pix_mp.pixelformat).c_str()));
+	json_object_object_add(pix_mp_obj, "fcc_str",
+	                       json_object_new_string(fcc2s(pix_mp.pixelformat).c_str()));
+	json_object_object_add(pix_mp_obj, "field", json_object_new_uint64(pix_mp.field));
+	json_object_object_add(pix_mp_obj, "field_str",
+	                       json_object_new_string(field2s(pix_mp.field).c_str()));
+	json_object_object_add(pix_mp_obj, "colorspace", json_object_new_uint64(pix_mp.colorspace));
+	json_object_object_add(pix_mp_obj, "colorspace_str",
+	                       json_object_new_string(colorspace2s(pix_mp.colorspace).c_str()));
+	json_object_object_add(pix_mp_obj, "num_planes", json_object_new_int(pix_mp.num_planes));
+	for (int i = 0; i < pix_mp.num_planes; i++)
+		trace_v4l2_plane_pix_format(pix_mp_obj, pix_mp.plane_fmt[i], i);
+
+	json_object_object_add(pix_mp_obj, "flags", json_object_new_int(pix_mp.flags));
+	json_object_object_add(pix_mp_obj, "flags_str",
+	                       json_object_new_string(pixflags2s(pix_mp.flags).c_str()));
+	json_object_object_add(pix_mp_obj, "ycbcr_enc", json_object_new_int(pix_mp.ycbcr_enc));
+	json_object_object_add(pix_mp_obj, "ycbcr_enc_str",
+	                       json_object_new_string(ycbcr_enc2s(pix_mp.ycbcr_enc).c_str()));
+	json_object_object_add(pix_mp_obj, "quantization", json_object_new_int(pix_mp.quantization));
+	json_object_object_add(pix_mp_obj, "quantization_str",
+	                       json_object_new_string(quantization2s(pix_mp.quantization).c_str()));
+	json_object_object_add(pix_mp_obj, "xfer_func", json_object_new_int(pix_mp.xfer_func));
+	json_object_object_add(pix_mp_obj, "xfer_func_str",
+	                       json_object_new_string(xfer_func2s(pix_mp.xfer_func).c_str()));
+
+	json_object_object_add(format_obj, "v4l2_pix_format_mplane", pix_mp_obj);
+}
+
+void trace_v4l2_pix_format(json_object *format_obj, struct v4l2_pix_format pix)
+{
+	json_object *pix_obj = json_object_new_object();
+
+	json_object_object_add(pix_obj, "width", json_object_new_uint64(pix.width));
+	json_object_object_add(pix_obj, "height", json_object_new_uint64(pix.height));
+	json_object_object_add(pix_obj, "pixelformat", json_object_new_uint64(pix.pixelformat));
+	json_object_object_add(pix_obj, "pixelformat_str",
+	                       json_object_new_string(pixfmt2s(pix.pixelformat).c_str()));
+	json_object_object_add(pix_obj, "fcc_str",
+	                       json_object_new_string(fcc2s(pix.pixelformat).c_str()));
+	json_object_object_add(pix_obj, "field", json_object_new_uint64(pix.field));
+	json_object_object_add(pix_obj, "bytesperline", json_object_new_uint64(pix.bytesperline));
+	json_object_object_add(pix_obj, "sizeimage", json_object_new_uint64(pix.sizeimage));
+	json_object_object_add(pix_obj, "colorspace", json_object_new_uint64(pix.colorspace));
+	json_object_object_add(pix_obj, "colorspace_str",
+	                       json_object_new_string(colorspace2s(pix.colorspace).c_str()));
+	json_object_object_add(pix_obj, "priv", json_object_new_uint64(pix.priv));
+
+	if (pix.priv == V4L2_PIX_FMT_PRIV_MAGIC) {
+		json_object_object_add(pix_obj, "priv_str",
+		                       json_object_new_string("V4L2_PIX_FMT_PRIV_MAGIC"));
+		json_object_object_add(pix_obj, "flags", json_object_new_uint64(pix.flags));
+		json_object_object_add(pix_obj, "flags_str",
+		                       json_object_new_string(pixflags2s(pix.flags).c_str()));
+		json_object_object_add(pix_obj, "ycbcr_enc", json_object_new_uint64(pix.ycbcr_enc));
+		json_object_object_add(pix_obj, "ycbcr_enc_str",
+		                       json_object_new_string(ycbcr_enc2s(pix.ycbcr_enc).c_str()));
+		json_object_object_add(pix_obj, "quantization", json_object_new_uint64(pix.quantization));
+		json_object_object_add(pix_obj, "quantization_str",
+		                       json_object_new_string(quantization2s(pix.quantization).c_str()));
+		json_object_object_add(pix_obj, "xfer_func", json_object_new_uint64(pix.xfer_func));
+		json_object_object_add(pix_obj, "xfer_func_str",
+		                       json_object_new_string(xfer_func2s(pix.xfer_func).c_str()));
+	}
+	json_object_object_add(format_obj, "v4l2_pix_format", pix_obj);
+}
+
+void trace_v4l2_format(void *arg, json_object *ioctl_args)
+{
+	json_object *format_obj = json_object_new_object();
+	struct v4l2_format *format = static_cast<struct v4l2_format*>(arg);
+
+	json_object_object_add(format_obj, "type", json_object_new_uint64(format->type));
+	json_object_object_add(format_obj, "type_str",
+	                       json_object_new_string(buftype2s(format->type).c_str()));
+
+	switch (format->type) {
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		trace_v4l2_pix_format(format_obj, format->fmt.pix);
+		break;
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
+	json_object_object_add(request_buffers_obj, "count",
+	                       json_object_new_uint64(request_buffers->count));
+	json_object_object_add(request_buffers_obj, "type",
+	                       json_object_new_uint64(request_buffers->type));
+	json_object_object_add(request_buffers_obj, "type_str",
+	                       json_object_new_string(buftype2s(request_buffers->type).c_str()));
+	json_object_object_add(request_buffers_obj, "memory",
+	                       json_object_new_uint64(request_buffers->memory));
+	json_object_object_add(request_buffers_obj, "memory_str",
+	                       json_object_new_string(v4l2_memory2s(request_buffers->memory).c_str()));
+	json_object_object_add(request_buffers_obj, "capabilities",
+	                       json_object_new_uint64(request_buffers->capabilities));
+	json_object_object_add(request_buffers_obj, "capabilities_str",
+	                       json_object_new_string(bufcap2s(request_buffers->capabilities).c_str()));
+	json_object_object_add(request_buffers_obj, "flags",
+	                       json_object_new_int(request_buffers->flags));
+	json_object_object_add(ioctl_args, "v4l2_requestbuffers", request_buffers_obj);
+}
+
+json_object *trace_v4l2_plane(struct v4l2_plane *p, __u32 memory)
+{
+	json_object *plane_obj = json_object_new_object();
+
+	json_object_object_add(plane_obj, "bytesused", json_object_new_uint64(p->bytesused));
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
+	json_object_object_add(timestamp_obj, "tv_usec",
+	                       json_object_new_int64(buf->timestamp.tv_usec));
+	json_object_object_add(buf_obj, "timestamp", timestamp_obj);
+	json_object_object_add(buf_obj, "timestamp_ns",
+	                       json_object_new_uint64(v4l2_timeval_to_ns(&buf->timestamp)));
+
+	json_object_object_add(buf_obj, "sequence", json_object_new_uint64(buf->sequence));
+	json_object_object_add(buf_obj, "memory", json_object_new_uint64(buf->memory));
+	json_object_object_add(buf_obj, "memory_str",
+	                       json_object_new_string(v4l2_memory2s(buf->memory).c_str()));
+
+	json_object *m_obj = json_object_new_object();
+	/* multi-planar API */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+
+		json_object *planes_obj = json_object_new_array();
+		/* TODO add planes > 0 */
+		json_object_array_add(planes_obj, trace_v4l2_plane(buf->m.planes, buf->memory));
+		json_object_object_add(m_obj, "planes", planes_obj);
+	}
+
+	/* single-planar API */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+
+		switch (buf->memory) {
+		case V4L2_MEMORY_MMAP:
+			json_object_object_add(m_obj, "offset", json_object_new_uint64(buf->m.offset));
+			break;
+		case V4L2_MEMORY_USERPTR:
+		case V4L2_MEMORY_DMABUF:
+			break;
+		}
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
+	json_object_object_add(ioctl_args, "buf_type_str",
+	                       json_object_new_string(buftype2s(buf_type).c_str()));
+}
+
+void trace_v4l2_ext_control(json_object *ext_controls_obj, struct v4l2_ext_control ctrl, __u32 control_idx)
+{
+	std::string unique_key_for_control;
+
+	json_object *ctrl_obj = json_object_new_object();
+	json_object_object_add(ctrl_obj, "id", json_object_new_uint64(ctrl.id));
+	json_object_object_add(ctrl_obj, "control_class_str",
+	                       json_object_new_string(ctrlclass2s(ctrl.id).c_str()));
+	json_object_object_add(ctrl_obj, "size", json_object_new_uint64(ctrl.size));
+
+	switch (ctrl.id) {
+	case V4L2_CID_STATELESS_VP8_FRAME:
+		trace_v4l2_ctrl_vp8_frame_gen(ctrl.p_vp8_frame, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_DECODE_MODE: {
+			json_object *h264_decode_mode_obj = json_object_new_object();
+			json_object_object_add(h264_decode_mode_obj, "value",
+			                       json_object_new_int(ctrl.value));
+			json_object_object_add(ctrl_obj, "V4L2_CID_STATELESS_H264_DECODE_MODE",
+			                       h264_decode_mode_obj);
+		break;
+	}
+	case V4L2_CID_STATELESS_H264_START_CODE: {
+		json_object *h264_start_code_obj = json_object_new_object();
+		json_object_object_add(h264_start_code_obj, "value", json_object_new_int(ctrl.value));
+		json_object_object_add(ctrl_obj, "V4L2_CID_STATELESS_H264_START_CODE", h264_start_code_obj);
+		break;
+	}
+	case V4L2_CID_STATELESS_H264_SPS:
+		trace_v4l2_ctrl_h264_sps_gen(ctrl.p_h264_sps, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PPS:
+		trace_v4l2_ctrl_h264_pps_gen(ctrl.p_h264_pps, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
+		trace_v4l2_ctrl_h264_scaling_matrix_gen(ctrl.p_h264_scaling_matrix, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
+		trace_v4l2_ctrl_h264_pred_weights_gen(ctrl.p_h264_pred_weights, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
+		trace_v4l2_ctrl_h264_slice_params_gen(ctrl.p_h264_slice_params, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
+		trace_v4l2_ctrl_h264_decode_params_gen(ctrl.p_h264_decode_params, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_FWHT_PARAMS:
+		trace_v4l2_ctrl_fwht_params_gen(ctrl.p_fwht_params, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_VP9_FRAME:
+		trace_v4l2_ctrl_vp9_frame_gen(ctrl.p_vp9_frame, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
+		trace_v4l2_ctrl_vp9_compressed_hdr_gen(ctrl.p_vp9_compressed_hdr_probs, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SPS:
+		trace_v4l2_ctrl_hevc_sps_gen(ctrl.p_hevc_sps, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_PPS:
+		trace_v4l2_ctrl_hevc_pps_gen(ctrl.p_hevc_pps, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:
+		trace_v4l2_ctrl_hevc_slice_params_gen(ctrl.p_hevc_slice_params, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:
+		trace_v4l2_ctrl_hevc_scaling_matrix_gen(ctrl.p_hevc_scaling_matrix, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
+		trace_v4l2_ctrl_hevc_decode_params_gen(ctrl.p_hevc_decode_params, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:
+		trace_v4l2_ctrl_mpeg2_sequence_gen(ctrl.p_mpeg2_sequence, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_PICTURE:
+		trace_v4l2_ctrl_mpeg2_picture_gen(ctrl.p_mpeg2_picture, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
+		trace_v4l2_ctrl_mpeg2_quantisation_gen(ctrl.p_mpeg2_quantisation, ctrl_obj);
+		break;
+	default:
+		json_object_object_add(ctrl_obj, "Trace warning",
+		                       json_object_new_string("Unknown control id."));
+		break;
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
+	json_object_object_add(ext_controls_obj, "which_str",
+	                       json_object_new_string(which2s(ext_controls->which).c_str()));
+	json_object_object_add(ext_controls_obj, "count", json_object_new_uint64(ext_controls->count));
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
+	json_object_object_add(query_ext_ctrl_obj, "control_class_str",
+	                       json_object_new_string(ctrlclass2s(queryextctrl->id).c_str()));
+	json_object_object_add(query_ext_ctrl_obj, "type", json_object_new_uint64(queryextctrl->type));
+	json_object_object_add(query_ext_ctrl_obj, "type_str",
+	                       json_object_new_string(ctrltype2s(queryextctrl->type).c_str()));
+	json_object_object_add(query_ext_ctrl_obj, "name", json_object_new_string(queryextctrl->name));
+	json_object_object_add(query_ext_ctrl_obj, "minimum",
+	                       json_object_new_int64(queryextctrl->minimum));
+	json_object_object_add(query_ext_ctrl_obj, "maximum",
+	                       json_object_new_int64(queryextctrl->maximum));
+	json_object_object_add(query_ext_ctrl_obj, "step", json_object_new_uint64(queryextctrl->step));
+	json_object_object_add(query_ext_ctrl_obj, "default_value",
+	                       json_object_new_int64(queryextctrl->default_value));
+	json_object_object_add(query_ext_ctrl_obj, "flags",
+	                       json_object_new_uint64(queryextctrl->flags));
+	json_object_object_add(query_ext_ctrl_obj, "flags_str",
+	                       json_object_new_string(ctrlflags2s(queryextctrl->flags).c_str()));
+	json_object_object_add(query_ext_ctrl_obj, "elem_size",
+	                       json_object_new_uint64(queryextctrl->elem_size));
+	json_object_object_add(query_ext_ctrl_obj, "elems",
+	                       json_object_new_uint64(queryextctrl->elems));
+	json_object_object_add(query_ext_ctrl_obj, "nr_of_dims",
+	                       json_object_new_uint64(queryextctrl->nr_of_dims));
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
+void trace_ioctl_video(unsigned long request, void *arg, json_object *ioctl_args, bool from_userspace)
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
+	json_object_object_add(ioctl_args, "dma_buf_sync", sync_obj);
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
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
new file mode 100644
index 00000000..c1b47c22
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer-common.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef V4L2_TRACER_COMMON_H
+#define V4L2_TRACER_COMMON_H
+
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <getopt.h>
+#include <pthread.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <list>
+#include <unordered_map>
+#include <algorithm> /* for std::find */
+#include <linux/dma-buf.h>
+#include <linux/videodev2.h>
+#include <linux/media.h>
+#include <json.h>
+#include "codec-fwht.h"
+#include "v4l2-info.h"
+
+enum LIBTRACER_SYSCALL {
+	LIBTRACER_SYSCALL_IOCTL,
+	LIBTRACER_SYSCALL_OPEN,
+	LIBTRACER_SYSCALL_OPEN64,
+	LIBTRACER_SYSCALL_CLOSE,
+	LIBTRACER_SYSCALL_MMAP,
+	LIBTRACER_SYSCALL_MMAP64,
+	LIBTRACER_SYSCALL_MUNMAP,
+};
+
+#endif
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
new file mode 100755
index 00000000..ca17d7e2
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -0,0 +1,359 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0-only */
+# Copyright 2022 Collabora Ltd.
+
+sub convert_type_to_json_type {
+	my $type = shift;
+	if ($type eq __u8 || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32) {
+		return "int";
+	}
+	if ($type eq __u32) {
+		return "int64";
+	}
+	if ($type eq __u64) {
+		return "uint64";
+	}
+	if ($type eq struct) {
+		return;
+	}
+	print "v4l2_tracer: error: couldn't convert $type to json_object type.\n";
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
+		($flag_func_name) = ($_) =~ /#define (\w+_)FLAG_.+/;
+		$flag_func_name = lc $flag_func_name;
+	}
+	printf $fh_trace_info_cpp "std::string %sflag2s(unsigned long flag)\n{\n", $flag_func_name;
+	printf $fh_trace_info_h "std::string %sflag2s(unsigned long flag);\n", $flag_func_name;
+	printf $fh_trace_info_cpp "\tstatic constexpr flag_def def[] = {\n";
+	($flag) = ($_) =~ /#define\s+(\w+)\s+.+/;
+	printf $fh_trace_info_cpp "\t\t{ $flag, \"$flag\" },\n";
+	while (<>) {
+		next if ($_ =~ /^\/?\s?\*.*/); #skip comments between flags if any
+		next if $_ =~ /^\s*$/; #skip blank lines between flags if any
+		last if ((grep {!/^#define\s+\w+_FL/} $_) && (grep {!/^#define V4L2_VP8_LF/} $_));
+		($flag) = ($_) =~ /#define\s+(\w+)\s+.+/;
+		printf $fh_trace_info_cpp "\t\t{ $flag, \"$flag\" },\n";
+	}
+	printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn flags2s(flag, def);\n}\n\n";
+}
+
+sub struct_gen {
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
+	printf $fh_retrace_cpp "\tif (!json_object_object_get_ex(ctrl_obj, \"%s\", &%s_obj))\n", $struct_name, $struct_name;
+	printf $fh_retrace_cpp "\t\t%s_obj = ctrl_obj;\n", $struct_name;
+
+	while ($line = <> ) {
+		chomp($line);
+		last if $line =~ /};/;
+		next if $line =~ /^\s*$/;  # ignore blank lines
+		next if $line =~ /\/\*/; # ignore comment lines
+		$line =~ s/^\s+//; # remove leading whitespace
+		$line =~ s/;$//; # remove semi-colon at the end
+		my @words = split /[\s\[]/, $line; # also split on '[' to avoid arrays
+		@words = grep  {/^\D/} @words; # remove values that start with digit from inside []
+		@words = grep  {!/\]/} @words; # remove values with brackets e.g. V4L2_H264_REF_LIST_LEN]
+
+		($type) = $words[0];
+		$json_type = convert_type_to_json_type($type);
+
+		($member) = $words[scalar @words - 1];
+		next if $member =~ /reserved/; # ignore reserved members, they will segfault on retracing
+
+		# generate members that are arrays
+		if ($line =~ /.*\[.*/) {
+			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line; #trace comment
+			printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_array();\n", $member;
+
+			printf $fh_retrace_cpp "\n\t\/\* %s \*\/\n", $line; #retrace comment
+
+			my @dimensions = ($line) =~ /\[(\w+)\]/g;
+			$dimensions_count = scalar @dimensions;
+
+			if ($dimensions_count > 1) {
+				printf $fh_retrace_cpp "\tint count_%s = 0;\n", $member;
+			}
+			printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $member;
+			printf $fh_retrace_cpp "\tjson_object_object_get_ex(%s_obj, \"%s\", &%s_obj);\n", $struct_name, $member, $member;
+
+			for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
+				$size = $dimensions[$idx];
+				$index_letter = get_index_letter($idx);
+				printf $fh_trace_cpp "\t" x ($idx + 1);
+				printf $fh_trace_cpp "for (size_t %s = 0; %s < %s\; %s++) {\n", $index_letter, $index_letter, $size, $index_letter;
+
+				printf $fh_retrace_cpp "\t" x ($idx + 1);
+				printf $fh_retrace_cpp "for (size_t %s = 0; %s < %s\; %s++) {\n", $index_letter, $index_letter, $size, $index_letter;
+			}
+			printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+			printf $fh_retrace_cpp "\t" x ($dimensions_count + 1);
+
+			# handle arrays of structs
+			if ($type =~ /struct/) {
+				my $struct_name_nested = @words[1];
+				printf $fh_trace_cpp "json_object *element_obj = json_object_new_object();\n";
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "trace_%s_gen(&(p->%s", $struct_name_nested, $member;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
+					printf $fh_trace_cpp "[%s]", get_index_letter($idx);
+				}
+				printf $fh_trace_cpp "), element_obj);\n";
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "json_object *element_no_key_obj;\n";
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "json_object_object_get_ex(element_obj, \"%s\", &element_no_key_obj);\n", $struct_name_nested;
+				printf $fh_trace_cpp "\t" x ($dimensions_count + 1);
+				printf $fh_trace_cpp "json_object_array_add(%s_obj, element_no_key_obj);\n", $member;
+
+				printf $fh_retrace_cpp "p->%s", $member;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1) {
+					printf $fh_retrace_cpp "[%s]", get_index_letter($idx);
+				}
+				printf $fh_retrace_cpp " = *retrace_%s_gen(json_object_array_get_idx(%s_obj, ", $struct_name_nested, $member;
+				if ($dimensions_count > 1) {
+					printf $fh_retrace_cpp "count_%s++", $member;
+				} else {
+					printf $fh_retrace_cpp "i";
+				}
+				printf $fh_retrace_cpp "));\n";
+			} else {
+				printf $fh_trace_cpp "json_object_array_add(%s_obj, json_object_new_%s(p->%s", $member, $json_type, $member;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
+					printf $fh_trace_cpp "[%s]", get_index_letter($idx);
+				}
+				printf $fh_trace_cpp "));\n";
+
+				printf $fh_retrace_cpp "p->%s", $member;
+				for (my $idx = 0; $idx < $dimensions_count; $idx = $idx + 1 ) {
+					printf $fh_retrace_cpp "[%s]", get_index_letter($idx);
+				}
+				printf $fh_retrace_cpp " = ($type) json_object_get_%s(json_object_array_get_idx(%s_obj, ", $json_type, $member;
+				if ($dimensions_count > 1) {
+					printf $fh_retrace_cpp "count_%s++", $member;
+				} else {
+					printf $fh_retrace_cpp "i";
+				}
+				printf $fh_retrace_cpp "));\n";
+			}
+			#closing brackets for all array types
+			for (my $idx = $dimensions_count - 1; $idx >= 0 ; $idx = $idx - 1) {
+				printf $fh_trace_cpp "\t" x ($idx + 1);
+				printf $fh_trace_cpp "}\n";
+
+				printf $fh_retrace_cpp "\t" x ($idx + 1);
+				printf $fh_retrace_cpp "}\n";
+			}
+			printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"%s\", %s_obj);\n\n", $struct_name, $member, $member;
+		} elsif ($type =~ /struct/) {
+			# member that is a struct but not an array of structs
+			my $struct_name_nested = @words[1];
+			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line;
+			printf $fh_trace_cpp "\ttrace_%s_gen(&(p->%s), %s_obj);\n", $struct_name_nested, $member, $struct_name;
+
+			printf $fh_retrace_cpp "\t\/\* %s \*\/\n", $line;
+			printf $fh_retrace_cpp "\tjson_object *%s_obj;\n", $member;
+			printf $fh_retrace_cpp "\tjson_object_object_get_ex(%s_obj, \"%s\", &%s_obj);\n", $struct_name, $struct_name_nested, $member;
+			printf $fh_retrace_cpp "\tp->%s = \*retrace_%s_gen(%s_obj);\n\n", $member, $struct_name_nested, $member;
+		} else {
+			# members that are integers
+			printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"%s\", json_object_new_%s(p->%s));\n", $struct_name, $member, $json_type, $member;
+			printf $fh_retrace_cpp "\n\tjson_object *%s_obj;\n", $member;
+			printf $fh_retrace_cpp "\tjson_object_object_get_ex(%s_obj, \"%s\", &%s_obj);\n", $struct_name, $member, $member;
+			printf $fh_retrace_cpp "\tp->%s = ($type) json_object_get_%s(%s_obj);\n", $member, $json_type, $member;
+
+			# add flag strings
+			if ($member =~ /^flags/) {
+				printf $fh_trace_cpp "\tjson_object_object_add(%s_obj, \"flags_str\", json_object_new_string(%sflag2s(p->flags).c_str()));\n", $struct_name, $flag_func_name;
+			}
+		}
+	}
+	printf $fh_trace_cpp "\tjson_object_object_add(parent_obj, \"%s\", %s_obj);\n", $struct_name, $struct_name;
+	printf $fh_trace_cpp "}\n\n";
+
+	printf $fh_retrace_cpp "\n\treturn p;\n";
+	printf $fh_retrace_cpp "}\n\n";
+}
+
+open($fh_trace_cpp, '>', 'trace-gen.cpp') or die "Could not open trace-gen.cpp for writing";
+printf $fh_trace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
+printf $fh_trace_cpp "#include \"v4l2-tracer-common.h\"\n#include \"trace-info-gen.h\"\n\n";
+
+open($fh_trace_h, '>', 'trace-gen.h') or die "Could not open trace-gen.h for writing";
+printf $fh_trace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
+printf $fh_trace_h "\#ifndef TRACE_GEN_H\n";
+printf $fh_trace_h "\#define TRACE_GEN_H\n\n";
+
+open($fh_retrace_cpp, '>', 'retrace-gen.cpp') or die "Could not open retrace-gen.cpp for writing";
+printf $fh_retrace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
+printf $fh_retrace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
+
+open($fh_retrace_h, '>', 'retrace-gen.h') or die "Could not open retrace-gen.h for writing";
+printf $fh_retrace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
+printf $fh_retrace_h "\#ifndef RETRACE_GEN_H\n";
+printf $fh_retrace_h "\#define RETRACE_GEN_H\n\n";
+
+open($fh_trace_info_cpp, '>', 'trace-info-gen.cpp') or die "Could not open trace-info-gen.cpp for writing";
+printf $fh_trace_info_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
+printf $fh_trace_info_cpp "#include \"v4l2-tracer-common.h\"\n#include \"trace-helper.h\"\n\n";
+
+open($fh_trace_info_h, '>', 'trace-info-gen.h') or die "Could not open trace-info-gen.h for writing";
+printf $fh_trace_info_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n */\n\n";
+printf $fh_trace_info_h "\#ifndef TRACE_INFO_GEN_H\n";
+printf $fh_trace_info_h "\#define TRACE_INFO_GEN_H\n\n";
+
+$in_v4l2_controls = true;
+
+while (<>) {
+	if (grep {/#define __LINUX_VIDEODEV2_H/} $_) {$in_v4l2_controls = false;}
+
+	# only generate flag and struct functions for v4l2-controls.h
+	if ($in_v4l2_controls eq true) {
+		if (grep {/^#define.+_FLAG_.+/} $_) {
+			flag_gen();
+		} elsif (grep {/^#define.+FWHT_FL_.+/} $_) {
+			flag_gen("fwht");
+		} elsif (grep {/^#define V4L2_VP8_LF.*/} $_) {
+			flag_gen("vp8_loop_filter");
+		}
+
+		if (grep {/^struct/} $_) {
+			struct_gen();
+		}
+	}
+
+	if (grep {/^\/\* Control classes \*\//} $_) {
+		printf $fh_trace_info_cpp "std::string ctrlclass2s(__u32 id)\n{\n";
+		printf $fh_trace_info_h "std::string ctrlclass2s(__u32 id);\n";
+		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
+
+		while (<>) {
+			last if $_ =~ /^\s*$/; #last if blank line
+			($ctrl_class) = ($_) =~ /#define\s*(\w+)\s+.*/;
+			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ctrl_class, $ctrl_class;
+		}
+		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(id & 0xff0000, defs);\n}\n\n";
+	}
+
+	if (grep {/^enum v4l2_memory/} $_) {
+		printf $fh_trace_info_cpp "std::string v4l2_memory2s(__u32 val)\n{\n";
+		printf $fh_trace_info_h "std::string v4l2_memory2s(__u32 val);\n";
+		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
+
+		while (<>) {
+			last if $_ =~ /};/;
+			($memory_type) = ($_) =~ /\s*(\w+)\s+.*/;
+			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $memory_type, $memory_type;
+		}
+		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(val, defs);\n}\n\n";
+	}
+
+	if (grep {/\/\* Values for 'capabilities' field \*\//} $_) {
+		printf $fh_trace_info_cpp "std::string capabilities2s(unsigned long flag)\n{\n";
+		printf $fh_trace_info_h "std::string capabilities2s(unsigned long flag);\n";
+
+		printf $fh_trace_info_cpp "\tstatic constexpr flag_def def[] = {\n";
+		while (<>) {
+			last if $_ =~ /.*V I D E O   I M A G E   F O R M A T.*/;
+			next if ($_ =~ /^\/?\s?\*.*/); #skip comments
+			next if $_ =~ /^\s*$/; #skip blank lines
+			($cap) = ($_) =~ /#define\s+(\w+)\s+.+/;
+			printf $fh_trace_info_cpp "\t\t{ $cap, \"$cap\" },\n"
+		}
+		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn flags2s(flag, def);\n}\n\n";
+	}
+
+	if (grep {/^enum v4l2_ctrl_type/} $_) {
+		printf $fh_trace_info_cpp "std::string ctrltype2s(__u32 val)\n{\n";
+		printf $fh_trace_info_h "std::string ctrltype2s(__u32 val);\n";
+		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
+
+		while (<>) {
+			next if ($_ =~ /^\s?\/?\s?\*.*/); #skip comments
+			next if $_ =~ /^\s*$/; #skip blank lines
+			last if $_ =~ /};/;
+			($ctrl_type) = ($_) =~ /\s*(\w+)\s+.*/;
+
+			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ctrl_type, $ctrl_type;
+		}
+		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(val, defs);\n}\n\n";
+	}
+
+	if (grep {/.*I O C T L   C O D E S   F O R   V I D E O   D E V I C E S.*/} $_) {
+		printf $fh_trace_info_cpp "std::string ioctl2s_video(unsigned long request)\n{\n";
+		printf $fh_trace_info_h "std::string ioctl2s_video(unsigned long request);\n";
+		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
+
+		while (<>) {
+			next if ($_ =~ /^\/?\s?\*.*/); #skip comments
+			next if $_ =~ /^\s*$/; #skip blank lines
+			next if $_ =~ /^\s+/; #skip lines that start with a space
+			last if $_ =~ /^#define BASE_VIDIOC_PRIVATE/;
+			($ioctl_name) = ($_) =~ /^#define\s*(\w+)\s*/;
+			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ioctl_name, $ioctl_name;
+		}
+		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(request, defs);\n}\n\n";
+	}
+
+	# from media.h
+	if (grep {/\/\* ioctls \*\//} $_) {
+		printf $fh_trace_info_cpp "std::string ioctl2s_media(unsigned long request)\n{\n";
+		printf $fh_trace_info_h "std::string ioctl2s_media(unsigned long request);\n";
+		printf $fh_trace_info_cpp "\tstatic constexpr definition defs[] = {\n";
+
+		while (<>) {
+			next if ($_ =~ /^\/?\s?\*.*/); #skip comments
+			next if $_ =~ /^\s*$/; #skip blank lines
+			next if $_ =~ /^\s+/; #skip lines that start with a space, comments
+			last if $_ =~ /^#define MEDIA_ENT_TYPE_SHIFT/;
+			($ioctl_name) = ($_) =~ /^#define\s*(\w+)\s*/;
+			printf $fh_trace_info_cpp "\t\t{ %s,\t\"%s\" },\n", $ioctl_name, $ioctl_name;
+		}
+		printf $fh_trace_info_cpp "\t\t{ 0, nullptr }\n\t};\n\treturn val2s(request, defs);\n}\n\n";
+	}
+}
+
+printf $fh_trace_h "\n#endif\n";
+close $fh_trace_h;
+close $fh_trace_cpp;
+
+printf $fh_retrace_h "\n#endif\n";
+close $fh_retrace_h;
+close $fh_retrace_cpp;
+
+printf $fh_trace_info_h "\n#endif\n";
+close $fh_trace_info_h;
+close $fh_trace_info_cpp;
diff --git a/utils/v4l2-tracer/v4l2-tracer.1.in b/utils/v4l2-tracer/v4l2-tracer.1.in
new file mode 100644
index 00000000..cd3d089b
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer.1.in
@@ -0,0 +1,104 @@
+.TH "V4L2-TRACER" "1" "October 2022" "v4l-utils @PACKAGE_VERSION@" "User Commands"
+.SH NAME
+v4l2-tracer - An application to trace and replay stateless video decoding.
+.SH SYNOPSIS
+\fBv4l2-tracer trace\fR [trace options] -- <\fItracee\fR>
+.RS
+.RE
+\fBv4l2-tracer retrace\fR [retrace options] -- <\fItrace_file\fR>\fB.json\fR
+.RS
+.RE
+
+.SH DESCRIPTION
+The v4l2-tracer utility traces, records and replays userspace applications
+that implement the v4l2 memory-to-memory stateless video decoder interface.
+The trace function intercepts and copies all system calls, stateless codec
+controls and encoded data to a json-formatted trace file. The retrace function
+independently reads and replays the json trace file. The json trace file can
+be retraced independently from its original userspace environment and can be
+edited to inject errors to test a driver's error handling abilities.
+
+.SH OPTIONS
+.SS Trace Options
+.TP
+\fB\-e\fR, \fB\-\-prettymem\fR
+Add whitespace in json file to improve readability of memory arrays.
+.TP
+\fB\-h\fR, \fB\-\-help\fR
+Display trace help.
+.TP
+\fB\-p\fR, \fB\-\-pretty\fR
+Add whitespace in json file to improve readability.
+.TP
+\fB\-r\fR, \fB\-\-raw\fR
+Write decoded data to json file.
+.TP
+\fB\-v\fR, \fB\-\-verbose\fR
+Turn on verbose reporting.
+.TP
+\fB\-y\fR, \fB\-\-yuv\fR
+Write decoded data to yuv file.
+
+.SS Retrace Options
+.TP
+\fB\-d\fR, \fB\-\-device\fR <\fIdev\fR>
+Use a different video device than specified in the trace file.
+.RS
+<\fIdev\fR> must be a digit corresponding to an existing /dev/video<\fIdev\fR>
+.RE
+.TP
+\fB\-h\fR, \fB\-\-help\fR
+Display retrace help.
+.TP
+\fB\-m\fR, \fB\-\-media\fR <\fIdev\fR>
+Use a different media device than specified in the trace file.
+.RS
+<\fIdev\fR> must be a digit corresponding to an existing /dev/media<\fIdev\fR>
+.RE
+.TP
+\fB\-v\fR, \fB\-\-verbose\fR
+Turn on verbose reporting.
+
+.SH EXIT STATUS
+On success, it returns 0. Otherwise, it will return 1 or an error code.
+
+.SH EXAMPLES
+Trace VP8 decoding:
+.TP
+.EX
+	v4l2-tracer trace -- gst-launch-1.0 -- filesrc location=test-25fps.vp8 ! parsebin ! v4l2slvp8dec ! videocodectestsink
+.EE
+.TP
+Trace H264 decoding:
+.TP
+.EX
+	v4l2-tracer trace -- gst-launch-1.0 -- filesrc location=test-25fps.h264 ! parsebin ! v4l2slh264dec ! videocodectestsink
+.EE
+.TP
+Trace FWHT decoding:
+.TP
+.EX
+	v4l2-tracer trace -- v4l2-ctl -d9 --stream-mmap --stream-out-mmap --stream-from-hdr test-25fps.fwht --stream-to out.yuv
+.EE
+.TP
+Retrace:
+.TP
+.EX
+	v4l2-tracer retrace 79568_trace.json
+.EE
+.TP
+Retrace using /dev/video6 and /dev/media3:
+.TP
+.EX
+	v4l2-tracer retrace -d 6 -m 3 79568_trace.json
+.EE
+.TP
+Self-trace:
+.TP
+.EX
+	v4l2-tracer trace -- v4l2-tracer retrace 79568_trace.json
+.EE
+
+.SH BUGS
+Bug reports or questions about this utility should be sent to the
+linux-media@vger.kernel.org mailinglist.
diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
new file mode 100644
index 00000000..71ac242a
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include <time.h>
+#include <dirent.h>
+#include <sys/wait.h>
+#include "v4l2-tracer-common.h"
+
+#define STR(x) #x
+#define STRING(x) STR(x)
+
+void print_help_retracer(void);
+int retracer(int argc, char *argv[]);
+
+enum Option_Tracer {
+    TracerOptPrettyPrintMemoryOnly = 'e',
+    TracerOptHelp = 'h',
+    TracerOptPrettyPrintAll = 'p',
+    TracerOptWriteDecodedToJsonFile = 'r',
+    TracerOptVerbose = 'v',
+    TracerOptWriteDecodedToYUVFile = 'y',
+};
+
+static struct option long_options_tracer[] = {
+	{ "prettymem", no_argument, nullptr, TracerOptPrettyPrintMemoryOnly },
+	{ "help", no_argument, nullptr, TracerOptHelp },
+	{ "pretty", no_argument, nullptr, TracerOptPrettyPrintAll },
+	{ "raw", no_argument, nullptr, TracerOptWriteDecodedToJsonFile },
+	{ "verbose", no_argument, nullptr, TracerOptVerbose },
+	{ "yuv", no_argument, nullptr, TracerOptWriteDecodedToYUVFile },
+	{ nullptr, 0, nullptr, 0 }
+};
+
+char short_options_tracer[] = {
+	TracerOptPrettyPrintMemoryOnly,
+	TracerOptHelp,
+	TracerOptPrettyPrintAll,
+	TracerOptWriteDecodedToJsonFile,
+	TracerOptVerbose,
+	TracerOptWriteDecodedToYUVFile
+};
+
+void print_help_tracer(void)
+{
+	fprintf(stderr, "v4l2-tracer trace [trace options] -- <tracee>\n"
+
+	        "\t-e, --prettymem   Add whitespace in json file to improve readability of memory arrays.\n"
+	        "\t-h, --help        Display trace help.\n"
+	        "\t-p, --pretty      Add whitespace in json file to improve readability.\n"
+	        "\t-r  --raw         Write decoded data to json file.\n"
+	        "\t-v, --verbose     Turn on verbose reporting.\n"
+	        "\t-y, --yuv         Write decoded data to yuv file.\n\n");
+}
+
+void print_usage(void)
+{
+	print_help_tracer();
+	print_help_retracer();
+}
+
+void get_options_trace(int argc, char *argv[])
+{
+	int ch;
+
+	do {
+		ch = getopt_long(argc, argv, short_options_tracer, long_options_tracer, NULL);
+		switch (ch){
+		case TracerOptPrettyPrintMemoryOnly:
+			setenv("TRACE_OPTION_PRETTY_PRINT_MEM", "true", 0);
+			break;
+		case TracerOptHelp:
+			break;
+		case TracerOptPrettyPrintAll:
+			setenv("TRACE_OPTION_PRETTY_PRINT_ALL", "true", 0);
+			break;
+		case TracerOptWriteDecodedToJsonFile:
+			setenv("TRACE_OPTION_WRITE_DECODED_TO_JSON_FILE", "true", 0);
+			break;
+		case TracerOptVerbose:
+			setenv("TRACE_OPTION_VERBOSE", "true", 0);
+			break;
+		case TracerOptWriteDecodedToYUVFile:
+			setenv("TRACE_OPTION_WRITE_DECODED_TO_YUV_FILE", "true", 0);
+			break;
+		}
+	} while (ch != -1);
+}
+
+int tracer(int argc, char *argv[])
+{
+	get_options_trace(argc, argv);
+
+	if (optind == argc) {
+		print_help_tracer();
+		return 1;
+	}
+
+	/* Get the application to be traced from the command line. */
+	int count = 0;
+	char *exec_array[argc];
+	while (optind < argc)
+		exec_array[count++] = argv[optind++];
+	exec_array[count] = nullptr;
+
+	/* Use a substring of the time to create a unique id for the trace. */
+	std::string trace_id = std::to_string(time(nullptr));
+	trace_id = trace_id.substr(5, trace_id.npos) + "_trace";
+	setenv("TRACE_ID", trace_id.c_str(), 0);
+
+	/* Create the trace file to hold the json-objects as a json array. */
+	std::string trace_filename = trace_id + ".json";
+	FILE *trace_file = fopen(trace_filename.c_str(), "w");
+	fputs("[\n", trace_file);
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
+	if (idx != program.npos) {
+		libv4l2tracer_path = program.replace(program.begin() + idx + 1, program.end(), ".libs");
+		DIR *dp = opendir(libv4l2tracer_path.c_str());
+		if (dp == nullptr)
+			libv4l2tracer_path = program.replace(program.begin() + idx, program.end(), "./.libs");
+		closedir(dp);
+	} else {
+		libv4l2tracer_path = STRING(LIBTRACER_PATH);
+	}
+	libv4l2tracer_path += "/libv4l2tracer.so";
+	fprintf(stderr, "Loading libv4l2tracer: %s\n", libv4l2tracer_path.c_str());
+	setenv("LD_PRELOAD", libv4l2tracer_path.c_str(), 0);
+
+	if (fork() == 0) {
+		execvpe(exec_array[0], exec_array, environ);
+		perror("Option -h for help.  Could not execute application to trace.");
+		return errno;
+	}
+
+	int tracee_result;
+	wait(&tracee_result);
+
+	if (WEXITSTATUS(tracee_result)) {
+		fprintf(stderr, "Trace error: %s\n", trace_filename.c_str());
+		exit(EXIT_FAILURE);
+	}
+
+	/* Close the json-array and the trace file. */
+	trace_file = fopen(trace_filename.c_str(), "a");
+	fseek(trace_file, 0L, SEEK_END);
+	fputs("\n]\n", trace_file);
+	fclose(trace_file);
+
+	fprintf(stderr, "Trace complete: ");
+	if (getenv("TRACE_OPTION_WRITE_DECODED_TO_YUV_FILE"))
+		fprintf(stderr, "%s, ", (trace_id + ".yuv").c_str());
+	fprintf(stderr, "%s", trace_filename.c_str());
+	fprintf(stderr, "\n");
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int ret = 1;
+
+	if (argc <= 1) {
+		print_usage();
+		return ret;
+	}
+
+	std::string command = argv[1];
+	optind = 2; /* start looking for options only after the trace/retrace command */
+	if (command == "trace")
+		ret = tracer(argc, argv);
+	else if (command == "retrace")
+		ret = retracer(argc, argv);
+	else
+		print_usage();
+
+	return ret;
+}
-- 
2.37.3

