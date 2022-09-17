Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBE45BB591
	for <lists+linux-media@lfdr.de>; Sat, 17 Sep 2022 04:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiIQC3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 22:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiIQC3m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 22:29:42 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD15C1114A
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 19:29:36 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 961196601FC1;
        Sat, 17 Sep 2022 03:29:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663381774;
        bh=f2fS5yo1QKFsovJTOCPpIXCKjWDC3ttI5AkNk4rjHOc=;
        h=From:To:Cc:Subject:Date:From;
        b=XrvvIs8RKKHBa4SaisAj8EeeQE++HOVJrscxeqFFepslGxukaIsVvailyKkJLUP/K
         NMFa6zZnegWCCLMV15iW4qOHAVTTxNVv5S++lcBAcM6VFe+TcJCM5ptsoTl867LtSi
         uQg6VjS1Uz1Bdcg9ncwlGmtwaGwgwkwezP02Q2te+Ihsk39k8VTczChxOFTTMVtW75
         oYIUWlQLYRa6WPduN/ejX4vB9Oa2B73kc10EP0jfWXRodHWzrAgr+Td8mLCH8KbYGv
         8BH9rRioCsUE5uB/vdLUHoWfSVXg7yhGOd2bOkCmJc7rHvJk5ySUrfI7c54ndFQR4i
         G7+lqSJXuXM7Q==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] utils: add v4l2-tracer utility
Date:   Fri, 16 Sep 2022 19:29:47 -0700
Message-Id: <20220917022947.141330-1-deborah.brouwer@collabora.com>
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
interface. The trace function intercepts and copies all system calls,
stateless codec controls and encoded data to a json-formatted trace file.
The retrace function independently reads and replays the json trace file.
The json trace file can be retraced independently from its original
userspace environment and can be edited to inject errors to test a
driver's error handling abilities.

The v4l2-tracer currently supports VP8, H264 and FWHT formats.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
This patch supercedes:
[RFC,1/2] utils: add stateless tracer utility
[RFC,2/2] utils: add stateless retracer utility

Changes since RFC:
- combined tracer/retracer into one utility
- added h264 and fwht formats
- removed hard-coded link to shared library
- added help options and man page
- reduced json-c version requirements to 0.15

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

Retrace:
  v4l2-tracer retrace 79568_trace.json

 configure.ac                         |   12 +
 utils/Makefile.am                    |    5 +
 utils/common/v4l2-info.cpp           |    7 +-
 utils/common/v4l2-info.h             |    8 +
 utils/v4l2-tracer/.gitignore         |   12 +
 utils/v4l2-tracer/Makefile.am        |   23 +
 utils/v4l2-tracer/libtracer.cpp      |  209 +++++
 utils/v4l2-tracer/libtracer.h        |   35 +
 utils/v4l2-tracer/retrace-fwht.cpp   |   54 ++
 utils/v4l2-tracer/retrace-fwht.h     |   11 +
 utils/v4l2-tracer/retrace-h264.cpp   |  446 +++++++++
 utils/v4l2-tracer/retrace-h264.h     |   16 +
 utils/v4l2-tracer/retrace-helper.cpp |  157 ++++
 utils/v4l2-tracer/retrace-helper.h   |   44 +
 utils/v4l2-tracer/retrace-vp8.cpp    |  288 ++++++
 utils/v4l2-tracer/retrace-vp8.h      |   11 +
 utils/v4l2-tracer/retracer.cpp       | 1281 ++++++++++++++++++++++++++
 utils/v4l2-tracer/trace-fwht.cpp     |   24 +
 utils/v4l2-tracer/trace-fwht.h       |   11 +
 utils/v4l2-tracer/trace-h264.cpp     |  281 ++++++
 utils/v4l2-tracer/trace-h264.h       |   18 +
 utils/v4l2-tracer/trace-helper.cpp   |  667 ++++++++++++++
 utils/v4l2-tracer/trace-helper.h     |   81 ++
 utils/v4l2-tracer/trace-info.cpp     |  460 +++++++++
 utils/v4l2-tracer/trace-info.h       |   93 ++
 utils/v4l2-tracer/trace-vp8.cpp      |  183 ++++
 utils/v4l2-tracer/trace-vp8.h        |   11 +
 utils/v4l2-tracer/trace.cpp          |  582 ++++++++++++
 utils/v4l2-tracer/trace.h            |   17 +
 utils/v4l2-tracer/v4l2-tracer.1.in   |  109 +++
 utils/v4l2-tracer/v4l2-tracer.cpp    |  181 ++++
 utils/v4l2-tracer/v4l2-tracer.h      |   39 +
 32 files changed, 5370 insertions(+), 6 deletions(-)
 create mode 100644 utils/v4l2-tracer/.gitignore
 create mode 100644 utils/v4l2-tracer/Makefile.am
 create mode 100644 utils/v4l2-tracer/libtracer.cpp
 create mode 100644 utils/v4l2-tracer/libtracer.h
 create mode 100644 utils/v4l2-tracer/retrace-fwht.cpp
 create mode 100644 utils/v4l2-tracer/retrace-fwht.h
 create mode 100644 utils/v4l2-tracer/retrace-h264.cpp
 create mode 100644 utils/v4l2-tracer/retrace-h264.h
 create mode 100644 utils/v4l2-tracer/retrace-helper.cpp
 create mode 100644 utils/v4l2-tracer/retrace-helper.h
 create mode 100644 utils/v4l2-tracer/retrace-vp8.cpp
 create mode 100644 utils/v4l2-tracer/retrace-vp8.h
 create mode 100644 utils/v4l2-tracer/retracer.cpp
 create mode 100644 utils/v4l2-tracer/trace-fwht.cpp
 create mode 100644 utils/v4l2-tracer/trace-fwht.h
 create mode 100644 utils/v4l2-tracer/trace-h264.cpp
 create mode 100644 utils/v4l2-tracer/trace-h264.h
 create mode 100644 utils/v4l2-tracer/trace-helper.cpp
 create mode 100644 utils/v4l2-tracer/trace-helper.h
 create mode 100644 utils/v4l2-tracer/trace-info.cpp
 create mode 100644 utils/v4l2-tracer/trace-info.h
 create mode 100644 utils/v4l2-tracer/trace-vp8.cpp
 create mode 100644 utils/v4l2-tracer/trace-vp8.h
 create mode 100644 utils/v4l2-tracer/trace.cpp
 create mode 100644 utils/v4l2-tracer/trace.h
 create mode 100644 utils/v4l2-tracer/v4l2-tracer.1.in
 create mode 100644 utils/v4l2-tracer/v4l2-tracer.cpp
 create mode 100644 utils/v4l2-tracer/v4l2-tracer.h

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
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index c4dbb14e..98122b8b 100644
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
diff --git a/utils/v4l2-tracer/.gitignore b/utils/v4l2-tracer/.gitignore
new file mode 100644
index 00000000..b9e273a7
--- /dev/null
+++ b/utils/v4l2-tracer/.gitignore
@@ -0,0 +1,12 @@
+*.json
+*.yuv
+*.webm
+*.h264
+*.ivf
+*.vp8
+*.vp9
+*.fwht
+*.mp4
+v4l2-tracer
+.clang-tidy
+v4l2-tracer.1
diff --git a/utils/v4l2-tracer/Makefile.am b/utils/v4l2-tracer/Makefile.am
new file mode 100644
index 00000000..d37558a5
--- /dev/null
+++ b/utils/v4l2-tracer/Makefile.am
@@ -0,0 +1,23 @@
+if HAVE_JSONC
+
+lib_LTLIBRARIES = libtracer.la
+libtracer_la_SOURCES = libtracer.cpp trace.cpp trace-vp8.cpp trace-h264.cpp trace-fwht.cpp \
+trace-helper.cpp trace-info.cpp $(top_srcdir)/utils/common/v4l2-info.cpp \
+$(top_srcdir)/utils/common/media-info.cpp
+
+libtracer_la_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
+libtracer_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -ldl $(JSONC_LIBS)
+libtracer_la_LIBTOOLFLAGS = --tag=disable-static
+
+bin_PROGRAMS = v4l2-tracer
+man_MANS = v4l2-tracer.1
+
+v4l2_tracer_SOURCES = v4l2-tracer.cpp retracer.cpp trace-info.cpp retrace-helper.cpp retrace-vp8.cpp \
+retrace-h264.cpp retrace-fwht.cpp  $(top_srcdir)/utils/common/v4l2-info.cpp
+
+v4l2_tracer_CPPFLAGS = -I$(top_srcdir)/utils/common -DLIBTRACER_PATH=$(libdir) $(JSONC_CFLAGS)
+v4l2_tracer_LDFLAGS = -lrt -lpthread $(JSONC_LIBS)
+
+EXTRA_DIST = v4l2-tracer.1
+
+endif
diff --git a/utils/v4l2-tracer/libtracer.cpp b/utils/v4l2-tracer/libtracer.cpp
new file mode 100644
index 00000000..38b7cbc6
--- /dev/null
+++ b/utils/v4l2-tracer/libtracer.cpp
@@ -0,0 +1,209 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
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
+		if(!count_devices())
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
+	if((request == VIDIOC_S_EXT_CTRLS) && (_IOC_TYPE(request) == 'V'))
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
+	json_object_object_add(ioctl_obj, "request_str", json_object_new_string(get_ioctl_request_str(request).c_str()));
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
+		expbuf_setup(fd, static_cast<struct v4l2_exportbuffer*>(arg));
+
+	if ((request == VIDIOC_QUERYBUF) && (_IOC_TYPE(request) == 'V'))
+		querybuf_setup(fd, static_cast<struct v4l2_buffer*>(arg));
+
+	return ret;
+}
diff --git a/utils/v4l2-tracer/libtracer.h b/utils/v4l2-tracer/libtracer.h
new file mode 100644
index 00000000..f528fa8f
--- /dev/null
+++ b/utils/v4l2-tracer/libtracer.h
@@ -0,0 +1,35 @@
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
+#include <math.h> /* for pow */
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <dirent.h>
+#include <config.h>
+#include <pthread.h>
+#include <unistd.h> /* for close */
+#include <linux/dma-buf.h>
+#include <json-c/json.h>
+#include <unordered_map>
+#include <algorithm> /* for std::find */
+#include <list>
+#include <v4l2-info.h>
+#include "trace.h"
+#include "trace-info.h"
+#include "trace-helper.h"
+#include "trace-vp8.h"
+#include "trace-h264.h"
+#include "trace-fwht.h"
+
+#endif
diff --git a/utils/v4l2-tracer/retrace-fwht.cpp b/utils/v4l2-tracer/retrace-fwht.cpp
new file mode 100644
index 00000000..000b8ba3
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-fwht.cpp
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer.h"
+
+struct v4l2_ctrl_fwht_params *retrace_v4l2_ctrl_fwht_params(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_fwht_params *fwht_params;
+	fwht_params = (struct v4l2_ctrl_fwht_params *) malloc(sizeof(v4l2_ctrl_fwht_params));
+	memset(fwht_params, 0, sizeof(v4l2_ctrl_fwht_params));
+
+	json_object *fwht_params_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_fwht_params", &fwht_params_obj);
+
+	json_object *backward_ref_ts_obj;
+	json_object_object_get_ex(fwht_params_obj, "backward_ref_ts", &backward_ref_ts_obj);
+	fwht_params->backward_ref_ts = json_object_get_uint64(backward_ref_ts_obj);
+
+	json_object *version_obj;
+	json_object_object_get_ex(fwht_params_obj, "version", &version_obj);
+	fwht_params->version = json_object_get_int(version_obj);
+
+	json_object *width_obj;
+	json_object_object_get_ex(fwht_params_obj, "width", &width_obj);
+	fwht_params->width = json_object_get_int(width_obj);
+
+	json_object *height_obj;
+	json_object_object_get_ex(fwht_params_obj, "height", &height_obj);
+	fwht_params->height = json_object_get_int(height_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(fwht_params_obj, "flags", &flags_obj);
+	fwht_params->flags = json_object_get_int(flags_obj);
+
+	json_object *colorspace_obj;
+	json_object_object_get_ex(fwht_params_obj, "colorspace", &colorspace_obj);
+	fwht_params->colorspace = json_object_get_int(colorspace_obj);
+
+	json_object *xfer_func_obj;
+	json_object_object_get_ex(fwht_params_obj, "xfer_func", &xfer_func_obj);
+	fwht_params->xfer_func = json_object_get_int(xfer_func_obj);
+
+	json_object *ycbcr_enc_obj;
+	json_object_object_get_ex(fwht_params_obj, "ycbcr_enc", &ycbcr_enc_obj);
+	fwht_params->ycbcr_enc = json_object_get_int(ycbcr_enc_obj);
+
+	json_object *quantization_obj;
+	json_object_object_get_ex(fwht_params_obj, "quantization", &quantization_obj);
+	fwht_params->quantization = json_object_get_int(quantization_obj);
+
+	return fwht_params;
+}
diff --git a/utils/v4l2-tracer/retrace-fwht.h b/utils/v4l2-tracer/retrace-fwht.h
new file mode 100644
index 00000000..db814f03
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-fwht.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef RETRACE_FWHT_H
+#define RETRACE_FWHT_H
+
+struct v4l2_ctrl_fwht_params *retrace_v4l2_ctrl_fwht_params(json_object *ctrl_obj);
+
+#endif
diff --git a/utils/v4l2-tracer/retrace-h264.cpp b/utils/v4l2-tracer/retrace-h264.cpp
new file mode 100644
index 00000000..cb766d34
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-h264.cpp
@@ -0,0 +1,446 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer.h"
+
+struct v4l2_ctrl_h264_sps *retrace_v4l2_ctrl_h264_sps_pointer(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_sps *h264_sps;
+	h264_sps = (struct v4l2_ctrl_h264_sps *) malloc(sizeof(v4l2_ctrl_h264_sps));
+	memset(h264_sps, 0, sizeof(v4l2_ctrl_h264_sps));
+
+	json_object *h264_sps_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_h264_sps", &h264_sps_obj);
+
+	json_object *profile_idc;
+	json_object_object_get_ex(h264_sps_obj, "profile_idc", &profile_idc);
+	h264_sps->profile_idc = json_object_get_int(profile_idc);
+
+	json_object *constraint_set_flags;
+	json_object_object_get_ex(h264_sps_obj, "constraint_set_flags", &constraint_set_flags);
+	h264_sps->constraint_set_flags = json_object_get_int(constraint_set_flags);
+
+	json_object *level_idc;
+	json_object_object_get_ex(h264_sps_obj, "level_idc", &level_idc);
+	h264_sps->level_idc = json_object_get_int(level_idc);
+
+	json_object *seq_parameter_set_id;
+	json_object_object_get_ex(h264_sps_obj, "seq_parameter_set_id", &seq_parameter_set_id);
+	h264_sps->seq_parameter_set_id = json_object_get_int(seq_parameter_set_id);
+
+	json_object *chroma_format_idc;
+	json_object_object_get_ex(h264_sps_obj, "chroma_format_idc", &chroma_format_idc);
+	h264_sps->chroma_format_idc = json_object_get_int(chroma_format_idc);
+
+	json_object *bit_depth_luma_minus8;
+	json_object_object_get_ex(h264_sps_obj, "bit_depth_luma_minus8", &bit_depth_luma_minus8);
+	h264_sps->bit_depth_luma_minus8 = json_object_get_int(bit_depth_luma_minus8);
+
+	json_object *bit_depth_chroma_minus8;
+	json_object_object_get_ex(h264_sps_obj, "bit_depth_chroma_minus8", &bit_depth_chroma_minus8);
+	h264_sps->bit_depth_chroma_minus8 = json_object_get_int(bit_depth_chroma_minus8);
+
+	json_object *log2_max_frame_num_minus4;
+	json_object_object_get_ex(h264_sps_obj, "log2_max_frame_num_minus4", &log2_max_frame_num_minus4);
+	h264_sps->log2_max_frame_num_minus4 = json_object_get_int(log2_max_frame_num_minus4);
+
+	json_object *pic_order_cnt_type;
+	json_object_object_get_ex(h264_sps_obj, "pic_order_cnt_type", &pic_order_cnt_type);
+	h264_sps->pic_order_cnt_type = json_object_get_int(pic_order_cnt_type);
+
+	json_object *log2_max_pic_order_cnt_lsb_minus4;
+	json_object_object_get_ex(h264_sps_obj, "log2_max_pic_order_cnt_lsb_minus4", &log2_max_pic_order_cnt_lsb_minus4);
+	h264_sps->log2_max_pic_order_cnt_lsb_minus4 = json_object_get_int(log2_max_pic_order_cnt_lsb_minus4);
+
+	json_object *max_num_ref_frames;
+	json_object_object_get_ex(h264_sps_obj, "max_num_ref_frames", &max_num_ref_frames);
+	h264_sps->max_num_ref_frames = json_object_get_int(max_num_ref_frames);
+
+	json_object *num_ref_frames_in_pic_order_cnt_cycle;
+	json_object_object_get_ex(h264_sps_obj, "num_ref_frames_in_pic_order_cnt_cycle", &num_ref_frames_in_pic_order_cnt_cycle);
+	h264_sps->num_ref_frames_in_pic_order_cnt_cycle = json_object_get_int(num_ref_frames_in_pic_order_cnt_cycle);
+
+	/* 	__s32 offset_for_ref_frame[255] */
+	json_object *offset_for_ref_frame;
+	json_object_object_get_ex(h264_sps_obj, "offset_for_ref_frame", &offset_for_ref_frame);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_sps->offset_for_ref_frame); i++)
+		h264_sps->offset_for_ref_frame[i] = json_object_get_int(json_object_array_get_idx(offset_for_ref_frame, i));
+
+	json_object *offset_for_non_ref_pic;
+	json_object_object_get_ex(h264_sps_obj, "offset_for_non_ref_pic", &offset_for_non_ref_pic);
+	h264_sps->offset_for_non_ref_pic = json_object_get_int(offset_for_non_ref_pic);
+
+	json_object *offset_for_top_to_bottom_field;
+	json_object_object_get_ex(h264_sps_obj, "offset_for_top_to_bottom_field", &offset_for_top_to_bottom_field);
+	h264_sps->offset_for_top_to_bottom_field = json_object_get_int(offset_for_top_to_bottom_field);
+
+	json_object *pic_width_in_mbs_minus1;
+	json_object_object_get_ex(h264_sps_obj, "pic_width_in_mbs_minus1", &pic_width_in_mbs_minus1);
+	h264_sps->pic_width_in_mbs_minus1 = json_object_get_int(pic_width_in_mbs_minus1);
+
+	json_object *pic_height_in_map_units_minus1;
+	json_object_object_get_ex(h264_sps_obj, "pic_height_in_map_units_minus1", &pic_height_in_map_units_minus1);
+	h264_sps->pic_height_in_map_units_minus1 = json_object_get_int(pic_height_in_map_units_minus1);
+
+	json_object *flags;
+	json_object_object_get_ex(h264_sps_obj, "flags", &flags);
+	h264_sps->flags = json_object_get_int(flags);
+
+	return h264_sps;
+}
+
+struct v4l2_ctrl_h264_pps *retrace_v4l2_ctrl_h264_pps_pointer(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_pps *h264_pps;
+	h264_pps = (struct v4l2_ctrl_h264_pps *) malloc(sizeof(v4l2_ctrl_h264_pps));
+	memset(h264_pps, 0, sizeof(v4l2_ctrl_h264_pps));
+
+	json_object *h264_pps_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_h264_pps", &h264_pps_obj);
+
+	json_object *pic_parameter_set_id;
+	json_object_object_get_ex(h264_pps_obj, "pic_parameter_set_id", &pic_parameter_set_id);
+	h264_pps->pic_parameter_set_id = json_object_get_int(pic_parameter_set_id);
+
+	json_object *seq_parameter_set_id;
+	json_object_object_get_ex(h264_pps_obj, "seq_parameter_set_id", &seq_parameter_set_id);
+	h264_pps->seq_parameter_set_id = json_object_get_int(seq_parameter_set_id);
+
+	json_object *num_slice_groups_minus1;
+	json_object_object_get_ex(h264_pps_obj, "num_slice_groups_minus1", &num_slice_groups_minus1);
+	h264_pps->num_slice_groups_minus1 = json_object_get_int(num_slice_groups_minus1);
+
+	json_object *num_ref_idx_l0_default_active_minus1;
+	json_object_object_get_ex(h264_pps_obj, "num_ref_idx_l0_default_active_minus1", &num_ref_idx_l0_default_active_minus1);
+	h264_pps->num_ref_idx_l0_default_active_minus1 = json_object_get_int(num_ref_idx_l0_default_active_minus1);
+
+	json_object *num_ref_idx_l1_default_active_minus1;
+	json_object_object_get_ex(h264_pps_obj, "num_ref_idx_l1_default_active_minus1", &num_ref_idx_l1_default_active_minus1);
+	h264_pps->num_ref_idx_l1_default_active_minus1 = json_object_get_int(num_ref_idx_l1_default_active_minus1);
+
+	json_object *weighted_bipred_idc;
+	json_object_object_get_ex(h264_pps_obj, "weighted_bipred_idc", &weighted_bipred_idc);
+	h264_pps->weighted_bipred_idc = json_object_get_int(weighted_bipred_idc);
+
+	json_object *pic_init_qp_minus26;
+	json_object_object_get_ex(h264_pps_obj, "pic_init_qp_minus26", &pic_init_qp_minus26);
+	h264_pps->pic_init_qp_minus26 = json_object_get_int(pic_init_qp_minus26);
+
+	json_object *pic_init_qs_minus26;
+	json_object_object_get_ex(h264_pps_obj, "pic_init_qs_minus26", &pic_init_qs_minus26);
+	h264_pps->pic_init_qs_minus26 = json_object_get_int(pic_init_qs_minus26);
+
+	json_object *chroma_qp_index_offset;
+	json_object_object_get_ex(h264_pps_obj, "chroma_qp_index_offset", &chroma_qp_index_offset);
+	h264_pps->chroma_qp_index_offset = json_object_get_int(chroma_qp_index_offset);
+
+	json_object *second_chroma_qp_index_offset;
+	json_object_object_get_ex(h264_pps_obj, "second_chroma_qp_index_offset", &second_chroma_qp_index_offset);
+	h264_pps->second_chroma_qp_index_offset = json_object_get_int(second_chroma_qp_index_offset);
+
+	json_object *flags;
+	json_object_object_get_ex(h264_pps_obj, "flags", &flags);
+	h264_pps->flags = json_object_get_int(flags);
+
+	return h264_pps;
+}
+
+struct v4l2_ctrl_h264_scaling_matrix *retrace_v4l2_ctrl_h264_scaling_matrix_pointer(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_scaling_matrix *h264_scaling_matrix;
+	h264_scaling_matrix = (struct v4l2_ctrl_h264_scaling_matrix *) malloc(sizeof(v4l2_ctrl_h264_scaling_matrix));
+	memset(h264_scaling_matrix, 0, sizeof(v4l2_ctrl_h264_scaling_matrix));
+
+	json_object *h264_scaling_matrix_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_h264_scaling_matrix", &h264_scaling_matrix_obj);
+
+	int count = 0;
+
+	/* __u8 scaling_list_4x4[6][16] */
+	json_object *scaling_list_4x4;
+	json_object_object_get_ex(h264_scaling_matrix_obj, "scaling_list_4x4", &scaling_list_4x4);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_scaling_matrix->scaling_list_4x4); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(h264_scaling_matrix->scaling_list_4x4[0]); j++)
+			h264_scaling_matrix->scaling_list_4x4[i][j] = json_object_get_int(json_object_array_get_idx(scaling_list_4x4, count++));
+
+	/* __u8 scaling_list_8x8[6][64] */
+	count = 0;
+	json_object *scaling_list_8x8;
+	json_object_object_get_ex(h264_scaling_matrix_obj, "scaling_list_8x8", &scaling_list_8x8);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_scaling_matrix->scaling_list_8x8); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(h264_scaling_matrix->scaling_list_8x8[0]); j++)
+			h264_scaling_matrix->scaling_list_8x8[i][j] = json_object_get_int(json_object_array_get_idx(scaling_list_8x8, count++));
+
+	return h264_scaling_matrix;
+}
+
+struct v4l2_h264_weight_factors retrace_v4l2_h264_weight_factors(json_object *h264_weight_factors_obj)
+{
+	struct v4l2_h264_weight_factors h264_weight_factors;
+	memset(&h264_weight_factors, 0, sizeof(h264_weight_factors));
+
+	json_object *luma_weight;
+	json_object_object_get_ex(h264_weight_factors_obj, "luma_weight", &luma_weight);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_weight_factors.luma_weight); i++)
+		h264_weight_factors.luma_weight[i] = json_object_get_int(json_object_array_get_idx(luma_weight, i));
+
+	json_object *luma_offset;
+	json_object_object_get_ex(h264_weight_factors_obj, "luma_offset", &luma_offset);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_weight_factors.luma_offset); i++)
+		h264_weight_factors.luma_offset[i] = json_object_get_int(json_object_array_get_idx(luma_offset, i));
+
+	int count = 0;
+	/* __s16 chroma_weight[32][2] */
+	json_object *chroma_weight;
+	json_object_object_get_ex(h264_weight_factors_obj, "chroma_weight", &chroma_weight);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_weight_factors.chroma_weight); i++) {
+		for (size_t j = 0; j < ARRAY_SIZE(h264_weight_factors.chroma_weight[0]); j++) {
+			int value = json_object_get_int(json_object_array_get_idx(chroma_weight, count++));
+			h264_weight_factors.chroma_weight[i][j] = (__s16) value;
+		}
+	}
+
+	/* __s16 chroma_offset[32][2] */
+	count = 0;
+	json_object *chroma_offset;
+	json_object_object_get_ex(h264_weight_factors_obj, "chroma_offset", &chroma_offset);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_weight_factors.chroma_offset); i++) {
+		for (size_t j = 0; j < ARRAY_SIZE(h264_weight_factors.chroma_offset[0]); j++) {
+			int value = json_object_get_int(json_object_array_get_idx(chroma_offset, count++));
+			h264_weight_factors.chroma_offset[i][j] = (__s16) value;
+		}
+	}
+
+	return h264_weight_factors;
+}
+
+struct v4l2_ctrl_h264_pred_weights *retrace_v4l2_ctrl_h264_pred_weights_pointer(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_pred_weights *h264_pred_weights;
+	h264_pred_weights = (struct v4l2_ctrl_h264_pred_weights *) malloc(sizeof(v4l2_ctrl_h264_pred_weights));
+	memset(h264_pred_weights, 0, sizeof(v4l2_ctrl_h264_pred_weights));
+
+	json_object *h264_pred_weights_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_h264_pred_weights", &h264_pred_weights_obj);
+
+	json_object *luma_log2_weight_denom;
+	json_object_object_get_ex(h264_pred_weights_obj, "luma_log2_weight_denom", &luma_log2_weight_denom);
+	h264_pred_weights->luma_log2_weight_denom = json_object_get_int(luma_log2_weight_denom);
+
+	json_object *chroma_log2_weight_denom;
+	json_object_object_get_ex(h264_pred_weights_obj, "chroma_log2_weight_denom", &chroma_log2_weight_denom);
+	h264_pred_weights->chroma_log2_weight_denom = json_object_get_int(chroma_log2_weight_denom);
+
+	json_object *weight_factors;
+	json_object_object_get_ex(h264_pred_weights_obj, "weight_factors", &weight_factors);
+
+	/* struct v4l2_h264_weight_factors weight_factors[2] */
+	for (size_t i = 0; i < ARRAY_SIZE(h264_pred_weights->weight_factors); i++)
+		h264_pred_weights->weight_factors[i] = retrace_v4l2_h264_weight_factors(json_object_array_get_idx(weight_factors, i));
+
+	return h264_pred_weights;
+}
+
+struct v4l2_h264_reference retrace_v4l2_h264_reference(json_object *h264_reference_obj)
+{
+	struct v4l2_h264_reference h264_reference;
+	memset(&h264_reference, 0, sizeof(v4l2_h264_reference));
+
+	json_object *fields_obj;
+	json_object_object_get_ex(h264_reference_obj, "fields", &fields_obj);
+	h264_reference.fields = json_object_get_int(fields_obj);
+
+	json_object *index_obj;
+	json_object_object_get_ex(h264_reference_obj, "index", &index_obj);
+	h264_reference.index = json_object_get_int(index_obj);
+
+	return h264_reference;
+}
+
+struct v4l2_ctrl_h264_slice_params *retrace_v4l2_ctrl_h264_slice_params_pointer(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_slice_params *h264_slice_params;
+	h264_slice_params = (struct v4l2_ctrl_h264_slice_params *) malloc(sizeof(v4l2_ctrl_h264_slice_params));
+	memset(h264_slice_params, 0, sizeof(v4l2_ctrl_h264_slice_params));
+
+	json_object *h264_slice_params_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_h264_slice_params", &h264_slice_params_obj);
+
+	json_object *header_bit_size_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "header_bit_size", &header_bit_size_obj);
+	h264_slice_params->header_bit_size = json_object_get_int(header_bit_size_obj);
+
+	json_object *first_mb_in_slice_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "first_mb_in_slice", &first_mb_in_slice_obj);
+	h264_slice_params->first_mb_in_slice = json_object_get_int(first_mb_in_slice_obj);
+
+	json_object *slice_type_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "slice_type", &slice_type_obj);
+	h264_slice_params->slice_type = json_object_get_int(slice_type_obj);
+
+	json_object *colour_plane_id_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "colour_plane_id", &colour_plane_id_obj);
+	h264_slice_params->colour_plane_id = json_object_get_int(colour_plane_id_obj);
+
+	json_object *redundant_pic_cnt_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "redundant_pic_cnt", &redundant_pic_cnt_obj);
+	h264_slice_params->redundant_pic_cnt = json_object_get_int(redundant_pic_cnt_obj);
+
+	json_object *cabac_init_idc_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "cabac_init_idc", &cabac_init_idc_obj);
+	h264_slice_params->cabac_init_idc = json_object_get_int(cabac_init_idc_obj);
+
+	json_object *slice_qp_delta_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "slice_qp_delta", &slice_qp_delta_obj);
+	h264_slice_params->slice_qp_delta = json_object_get_int(slice_qp_delta_obj);
+
+	json_object *slice_qs_delta_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "slice_qs_delta", &slice_qs_delta_obj);
+	h264_slice_params->slice_qs_delta = json_object_get_int(slice_qs_delta_obj);
+
+	json_object *disable_deblocking_filter_idc_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "disable_deblocking_filter_idc", &disable_deblocking_filter_idc_obj);
+	h264_slice_params->disable_deblocking_filter_idc = json_object_get_int(disable_deblocking_filter_idc_obj);
+
+	json_object *slice_alpha_c0_offset_div2_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "slice_alpha_c0_offset_div2", &slice_alpha_c0_offset_div2_obj);
+	h264_slice_params->slice_alpha_c0_offset_div2 = json_object_get_int(slice_alpha_c0_offset_div2_obj);
+
+	json_object *slice_beta_offset_div2_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "slice_beta_offset_div2", &slice_beta_offset_div2_obj);
+	h264_slice_params->slice_beta_offset_div2 = json_object_get_int(slice_beta_offset_div2_obj);
+
+	json_object *num_ref_idx_l0_active_minus1_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "num_ref_idx_l0_active_minus1", &num_ref_idx_l0_active_minus1_obj);
+	h264_slice_params->num_ref_idx_l0_active_minus1 = json_object_get_int(num_ref_idx_l0_active_minus1_obj);
+
+	json_object *num_ref_idx_l1_active_minus1_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "num_ref_idx_l1_active_minus1", &num_ref_idx_l1_active_minus1_obj);
+	h264_slice_params->num_ref_idx_l1_active_minus1 = json_object_get_int(num_ref_idx_l1_active_minus1_obj);
+
+	/*	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN] */
+	json_object *ref_pic_list0_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "ref_pic_list0", &ref_pic_list0_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_slice_params->ref_pic_list0); i++)
+		h264_slice_params->ref_pic_list0[i] = retrace_v4l2_h264_reference(json_object_array_get_idx(ref_pic_list0_obj, i));
+
+	/* struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN] */
+	json_object *ref_pic_list1_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "ref_pic_list1", &ref_pic_list1_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_slice_params->ref_pic_list1); i++)
+		h264_slice_params->ref_pic_list1[i] = retrace_v4l2_h264_reference(json_object_array_get_idx(ref_pic_list1_obj, i));
+
+	json_object *flags_obj;
+	json_object_object_get_ex(h264_slice_params_obj, "flags", &flags_obj);
+	h264_slice_params->flags = json_object_get_int(flags_obj);
+
+	return h264_slice_params;
+}
+
+struct v4l2_h264_dpb_entry retrace_h264_dpb_entry(json_object *h264_dpb_entry_obj)
+{
+	struct v4l2_h264_dpb_entry entry;
+	memset(&entry, 0, sizeof(v4l2_h264_dpb_entry));
+
+	json_object *reference_ts_obj;
+	json_object_object_get_ex(h264_dpb_entry_obj, "reference_ts", &reference_ts_obj);
+	entry.reference_ts = json_object_get_int(reference_ts_obj);
+
+	json_object *pic_num_obj;
+	json_object_object_get_ex(h264_dpb_entry_obj, "pic_num", &pic_num_obj);
+	entry.pic_num = json_object_get_int(pic_num_obj);
+
+	json_object *frame_num_obj;
+	json_object_object_get_ex(h264_dpb_entry_obj, "frame_num", &frame_num_obj);
+	entry.frame_num = json_object_get_int(frame_num_obj);
+
+	json_object *fields_obj;
+	json_object_object_get_ex(h264_dpb_entry_obj, "fields", &fields_obj);
+	entry.fields = json_object_get_int(fields_obj);
+
+	json_object *top_field_order_cnt_obj;
+	json_object_object_get_ex(h264_dpb_entry_obj, "top_field_order_cnt", &top_field_order_cnt_obj);
+	entry.top_field_order_cnt = json_object_get_int(top_field_order_cnt_obj);
+
+	json_object *bottom_field_order_cnt_obj;
+	json_object_object_get_ex(h264_dpb_entry_obj, "bottom_field_order_cnt", &bottom_field_order_cnt_obj);
+	entry.bottom_field_order_cnt = json_object_get_int(bottom_field_order_cnt_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(h264_dpb_entry_obj, "flags", &flags_obj);
+	entry.flags = json_object_get_int(flags_obj);
+
+	return entry;
+}
+
+struct v4l2_ctrl_h264_decode_params *retrace_v4l2_ctrl_h264_decode_params(json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_decode_params *h264_decode_params;
+	h264_decode_params = (struct v4l2_ctrl_h264_decode_params *) malloc(sizeof(v4l2_ctrl_h264_decode_params));
+	memset(h264_decode_params, 0, sizeof(v4l2_ctrl_h264_decode_params));
+
+	json_object *h264_decode_params_obj;
+	json_object_object_get_ex(ctrl_obj, "v4l2_ctrl_h264_decode_params", &h264_decode_params_obj);
+
+	/* struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]; */
+	json_object *dpb_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "dpb", &dpb_obj);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_decode_params->dpb); i++)
+		h264_decode_params->dpb[i] = retrace_h264_dpb_entry(json_object_array_get_idx(dpb_obj, i));
+
+	json_object *nal_ref_idc_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "nal_ref_idc", &nal_ref_idc_obj);
+	h264_decode_params->nal_ref_idc = json_object_get_int(nal_ref_idc_obj);
+
+	json_object *frame_num_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "frame_num", &frame_num_obj);
+	h264_decode_params->frame_num = json_object_get_int(frame_num_obj);
+
+	json_object *top_field_order_cnt_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "top_field_order_cnt", &top_field_order_cnt_obj);
+	h264_decode_params->top_field_order_cnt = json_object_get_int(top_field_order_cnt_obj);
+
+	json_object *bottom_field_order_cnt_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "bottom_field_order_cnt", &bottom_field_order_cnt_obj);
+	h264_decode_params->bottom_field_order_cnt = json_object_get_int(bottom_field_order_cnt_obj);
+
+	json_object *idr_pic_id_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "idr_pic_id", &idr_pic_id_obj);
+	h264_decode_params->idr_pic_id = json_object_get_int(idr_pic_id_obj);
+
+	json_object *pic_order_cnt_lsb_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "pic_order_cnt_lsb", &pic_order_cnt_lsb_obj);
+	h264_decode_params->pic_order_cnt_lsb = json_object_get_int(pic_order_cnt_lsb_obj);
+
+	json_object *delta_pic_order_cnt_bottom_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "delta_pic_order_cnt_bottom", &delta_pic_order_cnt_bottom_obj);
+	h264_decode_params->delta_pic_order_cnt_bottom = json_object_get_int(delta_pic_order_cnt_bottom_obj);
+
+	json_object *delta_pic_order_cnt0_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "delta_pic_order_cnt0", &delta_pic_order_cnt0_obj);
+	h264_decode_params->delta_pic_order_cnt0 = json_object_get_int(delta_pic_order_cnt0_obj);
+
+	json_object *delta_pic_order_cnt1_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "delta_pic_order_cnt1", &delta_pic_order_cnt1_obj);
+	h264_decode_params->delta_pic_order_cnt1 = json_object_get_int(delta_pic_order_cnt1_obj);
+
+	json_object *dec_ref_pic_marking_bit_size_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "dec_ref_pic_marking_bit_size", &dec_ref_pic_marking_bit_size_obj);
+	h264_decode_params->dec_ref_pic_marking_bit_size = json_object_get_int(dec_ref_pic_marking_bit_size_obj);
+
+	json_object *pic_order_cnt_bit_size_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "pic_order_cnt_bit_size", &pic_order_cnt_bit_size_obj);
+	h264_decode_params->pic_order_cnt_bit_size = json_object_get_int(pic_order_cnt_bit_size_obj);
+
+	json_object *slice_group_change_cycle_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "slice_group_change_cycle", &slice_group_change_cycle_obj);
+	h264_decode_params->slice_group_change_cycle = json_object_get_int(slice_group_change_cycle_obj);
+
+	json_object *flags_obj;
+	json_object_object_get_ex(h264_decode_params_obj, "flags", &flags_obj);
+	h264_decode_params->flags = json_object_get_int(flags_obj);
+
+	return h264_decode_params;
+}
diff --git a/utils/v4l2-tracer/retrace-h264.h b/utils/v4l2-tracer/retrace-h264.h
new file mode 100644
index 00000000..37dbdd87
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-h264.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef RETRACE_H264_H
+#define RETRACE_H264_H
+
+struct v4l2_ctrl_h264_sps *retrace_v4l2_ctrl_h264_sps_pointer(json_object *ctrl_obj);
+struct v4l2_ctrl_h264_pps *retrace_v4l2_ctrl_h264_pps_pointer(json_object *ctrl_obj);
+struct v4l2_ctrl_h264_scaling_matrix *retrace_v4l2_ctrl_h264_scaling_matrix_pointer(json_object *ctrl_obj);
+struct v4l2_ctrl_h264_pred_weights *retrace_v4l2_ctrl_h264_pred_weights_pointer(json_object *ctrl_obj);
+struct v4l2_ctrl_h264_slice_params *retrace_v4l2_ctrl_h264_slice_params_pointer(json_object *h264_weight_factors_obj);
+struct v4l2_ctrl_h264_decode_params *retrace_v4l2_ctrl_h264_decode_params(json_object *ctrl_obj);
+
+#endif
diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
new file mode 100644
index 00000000..48c6bb67
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer.h"
+
+static struct retrace_context ctx_retrace = {
+	.lock = PTHREAD_MUTEX_INITIALIZER
+};
+
+bool buffer_in_retrace_context(int fd, __u32 offset)
+{
+	bool buffer_in_retrace_context = false;
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto it = ctx_retrace.buffers.begin(); it != ctx_retrace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			buffer_in_retrace_context = true;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+	return buffer_in_retrace_context;
+}
+
+void add_buffer_retrace(int fd, __u32 offset)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	struct buffer_retrace buf;
+	memset(&buf, 0, sizeof(buffer_retrace));
+	buf.fd = fd;
+	buf.offset = offset;
+	ctx_retrace.buffers.push_front(buf);
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace)
+{
+	pthread_mutex_lock(&ctx_retrace.lock);
+	for (auto it = ctx_retrace.buffers.begin(); it != ctx_retrace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			it->address_trace = address_trace;
+			it->address_retrace = address_retrace;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_retrace.lock);
+}
+
+long get_retrace_address_from_trace_address(long address_trace)
+{
+	long address_retrace = 0;
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
+		fprintf(stderr, "fd: %d, offset: %d, address_trace:%ld, address_retrace:%ld\n",
+		        it->fd, it->offset, it->address_trace, it->address_retrace);
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
+	unsigned width;
+	unsigned height;
+	unsigned pixelformat;
+	unsigned expected_length;
+
+	pthread_mutex_lock(&ctx_retrace.lock);
+	width = ctx_retrace.width;
+	height = ctx_retrace.height;
+	pixelformat = ctx_retrace.pixelformat;
+	pthread_mutex_unlock(&ctx_retrace.lock);
+
+	expected_length = width * height;
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
diff --git a/utils/v4l2-tracer/retrace-helper.h b/utils/v4l2-tracer/retrace-helper.h
new file mode 100644
index 00000000..0507f4eb
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-helper.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef RETRACE_HELPER_H
+#define RETRACE_HELPER_H
+
+struct buffer_retrace {
+	int fd;
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
+
+	/* Key is a file descriptor from the trace, value is the corresponding fd in the retrace context. */
+	std::unordered_map<int, int> retrace_fds;
+
+	/* List of output and capture buffers being retraced. */
+	std::list<struct buffer_retrace> buffers;
+};
+
+bool buffer_in_retrace_context(int fd, __u32 offset = 0);
+void add_buffer_retrace(int fd, __u32 offset = 0);
+
+void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace);
+long get_retrace_address_from_trace_address(long address_trace);
+
+void add_fd(int fd_trace, int fd_retrace);
+int get_fd_retrace_from_fd_trace(int fd_trace);
+void remove_fd(int fd_trace);
+
+void set_pixelformat_retrace(__u32 width, __u32 height, __u32 pixelformat);
+unsigned get_expected_length_retrace(void);
+
+void print_context(void);
+
+#endif
diff --git a/utils/v4l2-tracer/retrace-vp8.cpp b/utils/v4l2-tracer/retrace-vp8.cpp
new file mode 100644
index 00000000..efb8b243
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-vp8.cpp
@@ -0,0 +1,288 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer.h"
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
diff --git a/utils/v4l2-tracer/retrace-vp8.h b/utils/v4l2-tracer/retrace-vp8.h
new file mode 100644
index 00000000..a5bea25e
--- /dev/null
+++ b/utils/v4l2-tracer/retrace-vp8.h
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
diff --git a/utils/v4l2-tracer/retracer.cpp b/utils/v4l2-tracer/retracer.cpp
new file mode 100644
index 00000000..0f179710
--- /dev/null
+++ b/utils/v4l2-tracer/retracer.cpp
@@ -0,0 +1,1281 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer.h"
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
+	set_buffer_address_retrace(fd_retrace, off, buf_address_trace, (long) buf_address_retrace_pointer);
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
+	/* If a device is provided on the command line, use it instead of the device from the trace file. */
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
+	struct timeval tv;
+	memset(&tv, 0, sizeof(timeval));
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
+		json_object *plane_obj = json_object_array_get_idx(planes_obj, 0); /* TODO add planes > 0 */
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
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE || buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (buf->m.planes != nullptr) {
+			free(buf->m.planes);
+		}
+	}
+
+	/*
+	 * For single-planar API, use QUERYBUF as an opportunity
+	 * to store the buffer in the retrace context for future access.
+	 */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE || buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		switch (buf->memory) {
+		case V4L2_MEMORY_MMAP: {
+			if (!buffer_in_retrace_context(fd_retrace, buf->m.offset))
+				add_buffer_retrace(fd_retrace, buf->m.offset);
+			break;
+		}
+		case V4L2_MEMORY_USERPTR:
+		case V4L2_MEMORY_DMABUF:
+		default:
+			break;
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
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE || buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
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
+
+	int buf_fd_retrace = export_buffer.fd;
+
+	/*
+	 * For multi-planar API use EXPBUF as an opportunity
+	 * to store the buffer in the retrace context for future access.
+	 */
+	if ((export_buffer.type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) ||
+	    (export_buffer.type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)) {
+			if (!buffer_in_retrace_context(buf_fd_retrace))
+				add_buffer_retrace(buf_fd_retrace);
+	}
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
+	if (format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		set_pixelformat_retrace(format.fmt.pix.width, format.fmt.pix.height, format.fmt.pix.pixelformat);
+	if (format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		set_pixelformat_retrace(format.fmt.pix_mp.width, format.fmt.pix_mp.height, format.fmt.pix_mp.pixelformat);
+
+	if (verbose || (errno != 0))
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
+	ctrl.id = json_object_get_int64(id_obj);
+
+	json_object *size_obj;
+	json_object_object_get_ex(ctrl_obj, "size", &size_obj);
+	ctrl.size = json_object_get_int64(size_obj);
+
+	if ((ctrl.id & V4L2_CID_CODEC_STATELESS_BASE) == V4L2_CID_CODEC_STATELESS_BASE) {
+		switch (ctrl.id) {
+		case V4L2_CID_STATELESS_VP8_FRAME:
+			ctrl.ptr = retrace_v4l2_ctrl_vp8_frame_pointer(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_DECODE_MODE:
+		case V4L2_CID_STATELESS_H264_START_CODE:
+			ctrl.value = retrace_v4l2_ext_control_value(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_SPS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_sps_pointer(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_PPS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_pps_pointer(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_scaling_matrix_pointer(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_pred_weights_pointer(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_slice_params_pointer(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_h264_decode_params(ctrl_obj);
+			break;
+		case V4L2_CID_STATELESS_FWHT_PARAMS:
+			ctrl.ptr = retrace_v4l2_ctrl_fwht_params(ctrl_obj);
+		default:
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
+	struct v4l2_query_ext_ctrl query_ext_ctrl;
+	memset(&query_ext_ctrl, 0, sizeof(v4l2_query_ext_ctrl));
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
+	struct v4l2_capability argp;
+	memset(&argp, 0, sizeof(v4l2_capability));
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
+		struct media_v2_topology top;
+		memset(&top, 0, sizeof(media_v2_topology));
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
+		fprintf(stderr, "%s, bytesused: %d, offset: %d, buffer_address_retrace: %ld\n", buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
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
+	/* Discard any previous retrace with same name. */
+	fclose(fopen(retrace_filename.c_str(), "w"));
+
+	json_object *root_array_obj = json_object_from_file(trace_filename.c_str());
+	retrace_array(root_array_obj);
+	json_object_put(root_array_obj);
+
+	fprintf(stderr, "Retracing complete in %s\n", retrace_filename.c_str());
+
+	return 0;
+}
diff --git a/utils/v4l2-tracer/trace-fwht.cpp b/utils/v4l2-tracer/trace-fwht.cpp
new file mode 100644
index 00000000..4d31df51
--- /dev/null
+++ b/utils/v4l2-tracer/trace-fwht.cpp
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
+
+void trace_v4l2_ctrl_fwht_params(void *p_fwht_params, json_object *ctrl_obj)
+{
+	json_object *fwht_params_obj = json_object_new_object();
+	struct v4l2_ctrl_fwht_params *fwht_params = static_cast<struct v4l2_ctrl_fwht_params*>(p_fwht_params);
+
+	json_object_object_add(fwht_params_obj, "backward_ref_ts", json_object_new_uint64(fwht_params->backward_ref_ts));
+	json_object_object_add(fwht_params_obj, "version", json_object_new_int64(fwht_params->version));
+	json_object_object_add(fwht_params_obj, "width", json_object_new_int64(fwht_params->width));
+	json_object_object_add(fwht_params_obj, "height", json_object_new_int64(fwht_params->height));
+	json_object_object_add(fwht_params_obj, "flags", json_object_new_int64(fwht_params->flags));
+	json_object_object_add(fwht_params_obj, "colorspace", json_object_new_int64(fwht_params->colorspace));
+	json_object_object_add(fwht_params_obj, "xfer_func", json_object_new_int64(fwht_params->xfer_func));
+	json_object_object_add(fwht_params_obj, "ycbcr_enc", json_object_new_int64(fwht_params->ycbcr_enc));
+	json_object_object_add(fwht_params_obj, "quantization", json_object_new_int64(fwht_params->quantization));
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_fwht_params", fwht_params_obj);
+}
diff --git a/utils/v4l2-tracer/trace-fwht.h b/utils/v4l2-tracer/trace-fwht.h
new file mode 100644
index 00000000..566a3eca
--- /dev/null
+++ b/utils/v4l2-tracer/trace-fwht.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_FWHT_H
+#define TRACE_FWHT_H
+
+void trace_v4l2_ctrl_fwht_params(void *p_fwht_params, json_object *ctrl_obj);
+
+#endif
diff --git a/utils/v4l2-tracer/trace-h264.cpp b/utils/v4l2-tracer/trace-h264.cpp
new file mode 100644
index 00000000..d2465e0e
--- /dev/null
+++ b/utils/v4l2-tracer/trace-h264.cpp
@@ -0,0 +1,281 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
+
+void trace_v4l2_ctrl_h264_decode_mode(struct v4l2_ext_control ctrl, json_object *ctrl_obj)
+{
+	json_object *h264_decode_mode_obj = json_object_new_object();
+	json_object_object_add(h264_decode_mode_obj, "value", json_object_new_int(ctrl.value));
+	json_object_object_add(h264_decode_mode_obj, "value_str", json_object_new_string(h264_decode_mode2s(ctrl.value).c_str()));
+	json_object_object_add(ctrl_obj, "V4L2_CID_STATELESS_H264_DECODE_MODE", h264_decode_mode_obj);
+}
+
+void trace_v4l2_ctrl_h264_start_code(struct v4l2_ext_control ctrl, json_object *ctrl_obj)
+{
+	json_object *h264_start_code_obj = json_object_new_object();
+	json_object_object_add(h264_start_code_obj, "value", json_object_new_int(ctrl.value));
+	json_object_object_add(h264_start_code_obj, "value_str", json_object_new_string(h264_start_code2s(ctrl.value).c_str()));
+	json_object_object_add(ctrl_obj, "V4L2_CID_STATELESS_H264_START_CODE", h264_start_code_obj);
+}
+
+void trace_v4l2_ctrl_h264_sps(void *p_h264_sps, json_object *ctrl_obj)
+{
+	json_object *h264_sps_obj = json_object_new_object();
+	struct v4l2_ctrl_h264_sps *h264_sps = static_cast<struct v4l2_ctrl_h264_sps*>(p_h264_sps);
+
+	json_object_object_add(h264_sps_obj, "profile_idc", json_object_new_int(h264_sps->profile_idc));
+	json_object_object_add(h264_sps_obj, "constraint_set_flags", json_object_new_int(h264_sps->constraint_set_flags));
+	json_object_object_add(h264_sps_obj, "level_idc", json_object_new_int(h264_sps->level_idc));
+	json_object_object_add(h264_sps_obj, "seq_parameter_set_id", json_object_new_int(h264_sps->seq_parameter_set_id));
+	json_object_object_add(h264_sps_obj, "chroma_format_idc", json_object_new_int(h264_sps->chroma_format_idc));
+	json_object_object_add(h264_sps_obj, "bit_depth_luma_minus8", json_object_new_int(h264_sps->bit_depth_luma_minus8));
+	json_object_object_add(h264_sps_obj, "bit_depth_chroma_minus8", json_object_new_int(h264_sps->bit_depth_chroma_minus8));
+	json_object_object_add(h264_sps_obj, "log2_max_frame_num_minus4", json_object_new_int(h264_sps->log2_max_frame_num_minus4));
+	json_object_object_add(h264_sps_obj, "pic_order_cnt_type", json_object_new_int(h264_sps->pic_order_cnt_type));
+	json_object_object_add(h264_sps_obj, "log2_max_pic_order_cnt_lsb_minus4", json_object_new_int(h264_sps->log2_max_pic_order_cnt_lsb_minus4));
+	json_object_object_add(h264_sps_obj, "max_num_ref_frames", json_object_new_int(h264_sps->max_num_ref_frames));
+	json_object_object_add(h264_sps_obj, "num_ref_frames_in_pic_order_cnt_cycle", json_object_new_int(h264_sps->num_ref_frames_in_pic_order_cnt_cycle));
+
+	/* 	__s32 offset_for_ref_frame[255] */
+	json_object *offset_for_ref_frame_obj =  json_object_new_array_ext(255);
+	for (size_t index = 0; index < ARRAY_SIZE(h264_sps->offset_for_ref_frame); index++)
+		json_object_array_add(offset_for_ref_frame_obj, json_object_new_int(h264_sps->offset_for_ref_frame[index]));
+
+	json_object_object_add(h264_sps_obj, "offset_for_ref_frame", offset_for_ref_frame_obj);
+	json_object_object_add(h264_sps_obj, "offset_for_non_ref_pic", json_object_new_int(h264_sps->offset_for_non_ref_pic));
+	json_object_object_add(h264_sps_obj, "offset_for_top_to_bottom_field", json_object_new_int(h264_sps->offset_for_top_to_bottom_field));
+	json_object_object_add(h264_sps_obj, "pic_width_in_mbs_minus1", json_object_new_int(h264_sps->pic_width_in_mbs_minus1));
+	json_object_object_add(h264_sps_obj, "pic_height_in_map_units_minus1", json_object_new_int(h264_sps->pic_height_in_map_units_minus1));
+	json_object_object_add(h264_sps_obj, "flags", json_object_new_uint64(h264_sps->flags));
+	json_object_object_add(h264_sps_obj, "flags_str", json_object_new_string(h264_sps_flag2s(h264_sps->flags).c_str()));
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_h264_sps", h264_sps_obj);
+}
+
+void trace_v4l2_ctrl_h264_pps(void *p_h264_pps, json_object *ctrl_obj)
+{
+	json_object *h264_pps_obj = json_object_new_object();
+	struct v4l2_ctrl_h264_pps *h264_pps = static_cast<struct v4l2_ctrl_h264_pps*>(p_h264_pps);
+
+	json_object_object_add(h264_pps_obj, "pic_parameter_set_id", json_object_new_int(h264_pps->pic_parameter_set_id));
+	json_object_object_add(h264_pps_obj, "seq_parameter_set_id", json_object_new_int(h264_pps->seq_parameter_set_id));
+	json_object_object_add(h264_pps_obj, "num_slice_groups_minus1", json_object_new_int(h264_pps->num_slice_groups_minus1));
+	json_object_object_add(h264_pps_obj, "num_ref_idx_l0_default_active_minus1", json_object_new_int(h264_pps->num_ref_idx_l0_default_active_minus1));
+	json_object_object_add(h264_pps_obj, "num_ref_idx_l1_default_active_minus1", json_object_new_int(h264_pps->num_ref_idx_l1_default_active_minus1));
+	json_object_object_add(h264_pps_obj, "weighted_bipred_idc", json_object_new_int(h264_pps->weighted_bipred_idc));
+	json_object_object_add(h264_pps_obj, "pic_init_qp_minus26", json_object_new_int(h264_pps->pic_init_qp_minus26));
+	json_object_object_add(h264_pps_obj, "pic_init_qs_minus26", json_object_new_int(h264_pps->pic_init_qs_minus26));
+	json_object_object_add(h264_pps_obj, "chroma_qp_index_offset", json_object_new_int(h264_pps->chroma_qp_index_offset));
+	json_object_object_add(h264_pps_obj, "second_chroma_qp_index_offset", json_object_new_int(h264_pps->second_chroma_qp_index_offset));
+	json_object_object_add(h264_pps_obj, "flags", json_object_new_int(h264_pps->flags));
+	json_object_object_add(h264_pps_obj, "flags_str", json_object_new_string(h264_pps_flag2s(h264_pps->flags).c_str()));
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_h264_pps", h264_pps_obj);
+}
+
+void trace_v4l2_ctrl_h264_scaling_matrix(void *p_h264_scaling_matrix, json_object *ctrl_obj)
+{
+	json_object *h264_scaling_matrix_obj = json_object_new_object();
+	struct v4l2_ctrl_h264_scaling_matrix *h264_scaling_matrix;
+	h264_scaling_matrix = static_cast<struct v4l2_ctrl_h264_scaling_matrix*>(p_h264_scaling_matrix);
+
+	/*__u8 scaling_list_4x4[6][16] */
+	json_object *scaling_list_4x4_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(h264_scaling_matrix->scaling_list_4x4); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(h264_scaling_matrix->scaling_list_4x4[0]); j++)
+			json_object_array_add(scaling_list_4x4_obj, json_object_new_int(h264_scaling_matrix->scaling_list_4x4[i][j]));
+
+	json_object_object_add(h264_scaling_matrix_obj, "scaling_list_4x4", scaling_list_4x4_obj);
+
+	/*	__u8 scaling_list_8x8[6][64] */
+	json_object *scaling_list_8x8_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(h264_scaling_matrix->scaling_list_8x8); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(h264_scaling_matrix->scaling_list_8x8[0]); j++)
+			json_object_array_add(scaling_list_8x8_obj, json_object_new_int(h264_scaling_matrix->scaling_list_8x8[i][j]));
+
+	json_object_object_add(h264_scaling_matrix_obj, "scaling_list_8x8", scaling_list_8x8_obj);
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_h264_scaling_matrix", h264_scaling_matrix_obj);
+}
+
+json_object *trace_v4l2_h264_weight_factors(struct v4l2_h264_weight_factors wf)
+{
+	json_object *weight_factors_obj = json_object_new_object();
+
+	/*__s16 luma_weight[32] */
+	json_object *luma_weight_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(wf.luma_weight); i++)
+			json_object_array_add(luma_weight_obj, json_object_new_int(wf.luma_weight[i]));
+	json_object_object_add(weight_factors_obj, "luma_weight", luma_weight_obj);
+
+	/* __s16 luma_offset[32] */
+	json_object *luma_offset_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(wf.luma_offset); i++)
+			json_object_array_add(luma_offset_obj, json_object_new_int(wf.luma_offset[i]));
+	json_object_object_add(weight_factors_obj, "luma_offset", luma_offset_obj);
+
+	/* __s16 chroma_weight[32][2] */
+	json_object *chroma_weight_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(wf.chroma_weight); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(wf.chroma_weight[0]); j++)
+			json_object_array_add(chroma_weight_obj, json_object_new_int(wf.chroma_weight[i][j]));
+	json_object_object_add(weight_factors_obj, "chroma_weight", chroma_weight_obj);
+
+	/* __s16 chroma_offset[32][2] */
+	json_object *chroma_offset_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(wf.chroma_offset); i++)
+		for (size_t j = 0; j < ARRAY_SIZE(wf.chroma_offset[0]); j++)
+				json_object_array_add(chroma_offset_obj, json_object_new_int(wf.chroma_offset[i][j]));
+	json_object_object_add(weight_factors_obj, "chroma_offset", chroma_offset_obj);
+
+	return weight_factors_obj;
+}
+
+void trace_v4l2_ctrl_h264_pred_weights(void *p_h264_pred_weights, json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_pred_weights *h264_pred_weights;
+	h264_pred_weights = static_cast<struct v4l2_ctrl_h264_pred_weights*>(p_h264_pred_weights);
+
+	json_object *h264_pred_weights_obj = json_object_new_object();
+
+	json_object_object_add(h264_pred_weights_obj, "luma_log2_weight_denom",
+	                       json_object_new_int(h264_pred_weights->luma_log2_weight_denom));
+
+	json_object_object_add(h264_pred_weights_obj, "chroma_log2_weight_denom",
+	                       json_object_new_int(h264_pred_weights->chroma_log2_weight_denom));
+
+	/* struct v4l2_h264_weight_factors weight_factors[2] */
+	json_object *weight_factors_array_obj = json_object_new_array_ext(2);
+	for (size_t i = 0; i < ARRAY_SIZE(h264_pred_weights->weight_factors); i++) {
+		json_object *wf = trace_v4l2_h264_weight_factors(h264_pred_weights->weight_factors[i]);
+		json_object_array_add(weight_factors_array_obj, wf);
+	}
+	json_object_object_add(h264_pred_weights_obj, "weight_factors", weight_factors_array_obj);
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_h264_pred_weights", h264_pred_weights_obj);
+}
+
+json_object *trace_v4l2_h264_reference(struct v4l2_h264_reference ref)
+{
+	json_object *h264_reference_obj = json_object_new_object();
+
+	json_object_object_add(h264_reference_obj, "fields", json_object_new_int(ref.fields));
+	json_object_object_add(h264_reference_obj, "index", json_object_new_int(ref.index));
+
+	return h264_reference_obj;
+}
+
+void trace_v4l2_ctrl_h264_slice_params(void *p_h264_slice_params, json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_slice_params *h264_slice_params;
+	h264_slice_params = static_cast<struct v4l2_ctrl_h264_slice_params*>(p_h264_slice_params);
+
+	json_object *h264_slice_params_obj = json_object_new_object();
+
+	json_object_object_add(h264_slice_params_obj, "header_bit_size",
+	                       json_object_new_uint64(h264_slice_params->header_bit_size));
+	json_object_object_add(h264_slice_params_obj, "first_mb_in_slice",
+	                       json_object_new_uint64(h264_slice_params->first_mb_in_slice));
+	json_object_object_add(h264_slice_params_obj, "slice_type",
+	                       json_object_new_int(h264_slice_params->slice_type));
+	json_object_object_add(h264_slice_params_obj, "colour_plane_id",
+	                       json_object_new_int(h264_slice_params->colour_plane_id));
+	json_object_object_add(h264_slice_params_obj, "redundant_pic_cnt",
+	                       json_object_new_int(h264_slice_params->redundant_pic_cnt));
+	json_object_object_add(h264_slice_params_obj, "cabac_init_idc",
+	                       json_object_new_int(h264_slice_params->cabac_init_idc));
+	json_object_object_add(h264_slice_params_obj, "slice_qp_delta",
+	                       json_object_new_int(h264_slice_params->slice_qp_delta));
+	json_object_object_add(h264_slice_params_obj, "slice_qs_delta",
+	                       json_object_new_int(h264_slice_params->slice_qs_delta));
+	json_object_object_add(h264_slice_params_obj, "disable_deblocking_filter_idc",
+	                       json_object_new_int(h264_slice_params->disable_deblocking_filter_idc));
+	json_object_object_add(h264_slice_params_obj, "slice_alpha_c0_offset_div2",
+	                       json_object_new_int(h264_slice_params->slice_alpha_c0_offset_div2));
+	json_object_object_add(h264_slice_params_obj, "slice_beta_offset_div2",
+	                       json_object_new_int(h264_slice_params->slice_beta_offset_div2));
+	json_object_object_add(h264_slice_params_obj, "num_ref_idx_l0_active_minus1",
+	                       json_object_new_int(h264_slice_params->num_ref_idx_l0_active_minus1));
+	json_object_object_add(h264_slice_params_obj, "num_ref_idx_l1_active_minus1",
+	                       json_object_new_int(h264_slice_params->num_ref_idx_l1_active_minus1));
+
+	/* 	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN] */
+	json_object *ref_pic_list0_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(h264_slice_params->ref_pic_list0); i++)
+		json_object_array_add(ref_pic_list0_obj, trace_v4l2_h264_reference(h264_slice_params->ref_pic_list0[i]));
+	json_object_object_add(h264_slice_params_obj, "ref_pic_list0", ref_pic_list0_obj);
+
+	/* 	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN] */
+	json_object *ref_pic_list1_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(h264_slice_params->ref_pic_list1); i++) {
+		json_object_array_add(ref_pic_list1_obj, trace_v4l2_h264_reference(h264_slice_params->ref_pic_list1[i]));
+	}
+	json_object_object_add(h264_slice_params_obj, "ref_pic_list1", ref_pic_list1_obj);
+
+	json_object_object_add(h264_slice_params_obj, "flags", json_object_new_uint64(h264_slice_params->flags));
+	json_object_object_add(h264_slice_params_obj, "flags_str", json_object_new_string(h264_slice_flag2s(h264_slice_params->flags).c_str()));
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_h264_slice_params", h264_slice_params_obj);
+}
+
+json_object *trace_v4l2_h264_dpb_entry(struct v4l2_h264_dpb_entry entry)
+{
+	json_object *h264_dpb_entry_obj = json_object_new_object();
+
+	json_object_object_add(h264_dpb_entry_obj, "reference_ts", json_object_new_uint64(entry.reference_ts));
+	json_object_object_add(h264_dpb_entry_obj, "pic_num", json_object_new_uint64(entry.pic_num));
+	json_object_object_add(h264_dpb_entry_obj, "frame_num", json_object_new_int(entry.frame_num));
+	json_object_object_add(h264_dpb_entry_obj, "fields", json_object_new_int(entry.fields));
+	json_object_object_add(h264_dpb_entry_obj, "top_field_order_cnt", json_object_new_int(entry.top_field_order_cnt));
+	json_object_object_add(h264_dpb_entry_obj, "bottom_field_order_cnt", json_object_new_int(entry.bottom_field_order_cnt));
+	json_object_object_add(h264_dpb_entry_obj, "flags", json_object_new_uint64(entry.flags));
+	json_object_object_add(h264_dpb_entry_obj, "flags_str", json_object_new_string(h264_dpb_entry_flag2s(entry.flags).c_str()));
+
+	return h264_dpb_entry_obj;
+}
+
+void trace_v4l2_ctrl_h264_decode_params(void *p_h264_decode_params, json_object *ctrl_obj)
+{
+	struct v4l2_ctrl_h264_decode_params *h264_decode_params;
+	h264_decode_params = static_cast<struct v4l2_ctrl_h264_decode_params*>(p_h264_decode_params);
+
+	json_object *h264_decode_params_obj = json_object_new_object();
+
+	/* 	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES] */
+	json_object *dpb_obj = json_object_new_array();
+	for (int i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++)
+		json_object_array_add(dpb_obj, trace_v4l2_h264_dpb_entry(h264_decode_params->dpb[i]));
+	json_object_object_add(h264_decode_params_obj, "dpb", dpb_obj);
+
+	json_object_object_add(h264_decode_params_obj, "nal_ref_idc",
+	                       json_object_new_int(h264_decode_params->nal_ref_idc));
+	json_object_object_add(h264_decode_params_obj, "frame_num",
+	                       json_object_new_int(h264_decode_params->frame_num));
+	json_object_object_add(h264_decode_params_obj, "top_field_order_cnt",
+	                       json_object_new_int(h264_decode_params->top_field_order_cnt));
+	json_object_object_add(h264_decode_params_obj, "bottom_field_order_cnt",
+	                       json_object_new_int(h264_decode_params->bottom_field_order_cnt));
+	json_object_object_add(h264_decode_params_obj, "idr_pic_id",
+	                       json_object_new_int(h264_decode_params->idr_pic_id));
+	json_object_object_add(h264_decode_params_obj, "pic_order_cnt_lsb",
+	                       json_object_new_int(h264_decode_params->pic_order_cnt_lsb));
+	json_object_object_add(h264_decode_params_obj, "delta_pic_order_cnt_bottom",
+	                       json_object_new_int(h264_decode_params->delta_pic_order_cnt_bottom));
+	json_object_object_add(h264_decode_params_obj, "delta_pic_order_cnt0",
+	                       json_object_new_int(h264_decode_params->delta_pic_order_cnt0));
+	json_object_object_add(h264_decode_params_obj, "delta_pic_order_cnt1",
+	                       json_object_new_int(h264_decode_params->delta_pic_order_cnt1));
+	json_object_object_add(h264_decode_params_obj, "dec_ref_pic_marking_bit_size",
+	                       json_object_new_uint64(h264_decode_params->dec_ref_pic_marking_bit_size));
+	json_object_object_add(h264_decode_params_obj, "pic_order_cnt_bit_size",
+	                       json_object_new_uint64(h264_decode_params->pic_order_cnt_bit_size));
+	json_object_object_add(h264_decode_params_obj, "slice_group_change_cycle",
+	                       json_object_new_uint64(h264_decode_params->slice_group_change_cycle));
+	json_object_object_add(h264_decode_params_obj, "flags", json_object_new_uint64(h264_decode_params->flags));
+	json_object_object_add(h264_decode_params_obj, "flags_str",
+						   json_object_new_string(h264_decode_params_flag2s(h264_decode_params->flags).c_str()));
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_h264_decode_params", h264_decode_params_obj);
+}
diff --git a/utils/v4l2-tracer/trace-h264.h b/utils/v4l2-tracer/trace-h264.h
new file mode 100644
index 00000000..fea0f598
--- /dev/null
+++ b/utils/v4l2-tracer/trace-h264.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_H264_H
+#define TRACE_H264_H
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
+#endif
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
new file mode 100644
index 00000000..06595529
--- /dev/null
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -0,0 +1,667 @@
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
+void set_decode_order(long decode_order)
+{
+	std::list<long>::iterator it;
+	pthread_mutex_lock(&ctx_trace.lock);
+	it = find(ctx_trace.decode_order.begin(), ctx_trace.decode_order.end(), decode_order);
+	if (it == ctx_trace.decode_order.end())
+		ctx_trace.decode_order.push_front(decode_order);
+	pthread_mutex_unlock(&ctx_trace.lock);
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
+void set_pic_order_ctn_lsb(int pic_order_ctn_lsb)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	ctx_trace.pic_order_ctn_lsb = pic_order_ctn_lsb;
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+int get_pic_order_ctn_lsb(void)
+{
+	int pic_order_ctn_lsb = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	pic_order_ctn_lsb = ctx_trace.pic_order_ctn_lsb;
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return pic_order_ctn_lsb;
+}
+
+void add_buffer_trace(int fd, __u32 type, __u32 index, __u32 offset)
+{
+	struct buffer_trace buf;
+	memset(&buf, 0, sizeof(buffer_trace));
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
+bool buffer_in_trace_context(int fd, __u32 offset)
+{
+	bool buffer_in_trace_context = false;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
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
+__u32 get_buffer_type_trace(int fd, __u32 offset)
+{
+	__u32 type = 0;
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			type = it->type;
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
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			index = it->index;
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
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->type == type) && (it->index == index)) {
+			offset = it->offset;
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
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			it->bytesused = bytesused;
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
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			bytesused = it->bytesused;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+	return bytesused;
+}
+
+void set_buffer_display_order(int fd, __u32 offset, long display_order)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			it->display_order = display_order;
+			break;
+		}
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+void set_buffer_address_trace(int fd, __u32 offset, unsigned long address)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			it->address = address;
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
+	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
+		if ((it->fd == fd) && (it->offset == offset)) {
+			address = it->address;
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
+	 * TODO: this is a bare-minimum implementation, it assumes that the stride is equal to the real
+	 * width and that the padding follows the end of the chroma plane. It could be improved by
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
+
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
+				fprintf(stderr, "Displaying: %ld, %s, index: %d\n",
+				        it->display_order, buftype2s(it->type).c_str(), it->index);
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
+	for (__u32 i = 0; i < ext_controls->count; i++) {
+		struct v4l2_ext_control ctrl = ext_controls->controls[i];
+
+		switch (ctrl.id) {
+		case V4L2_CID_STATELESS_H264_SPS: {
+			set_max_pic_order_cnt_lsb(pow(2, ctrl.p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 + 4));
+			break;
+		}
+		case V4L2_CID_STATELESS_H264_DECODE_PARAMS: {
+			long pic_order_ctn_msb;
+			int max = get_max_pic_order_cnt_lsb();
+			long prev_pic_order_ctn_msb = get_decode_order();
+			int prev_pic_order_ctn_lsb = get_pic_order_ctn_lsb();
+			int pic_order_cnt_lsb = ctrl.p_h264_decode_params->pic_order_cnt_lsb;
+
+			if (prev_pic_order_ctn_msb == 0)
+				pic_order_ctn_msb = 0;
+
+			/*
+			 * When pic_order_cnt_lsb wraps around to zero, adjust the total count using
+			 * max to keep the correct display order. From H264 specification 8.2.1.1.
+			 */
+			if ((pic_order_cnt_lsb < prev_pic_order_ctn_lsb) &&
+				((prev_pic_order_ctn_lsb - pic_order_cnt_lsb) >= (max / 2))) {
+				pic_order_ctn_msb = prev_pic_order_ctn_msb + max;
+			} else if ((pic_order_cnt_lsb > prev_pic_order_ctn_lsb) &&
+				((pic_order_cnt_lsb - prev_pic_order_ctn_lsb) > (max / 2))) {
+				pic_order_ctn_msb = prev_pic_order_ctn_msb - max;
+			} else {
+				pic_order_ctn_msb = prev_pic_order_ctn_msb + (pic_order_cnt_lsb - prev_pic_order_ctn_lsb);
+			}
+			set_pic_order_ctn_lsb(pic_order_cnt_lsb);
+			set_decode_order(pic_order_ctn_msb);
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
+		fprintf(stderr, "\nQBUF: %s, index: %d\n", buftype2s(buf->type).c_str(), buf->index);
+
+	int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
+	__u32 buf_offset = get_buffer_offset_trace(buf->type, buf->index);
+
+	__u32 bytesused = 0;
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE || buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		bytesused = buf->m.planes[0].bytesused;
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT || buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		bytesused = buf->bytesused;
+	set_buffer_bytesused_trace(buf_fd, buf_offset, bytesused);
+
+	/* The output buffer should have compressed data just before it is queued, so trace it. */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE || buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		trace_mem_encoded(buf_fd, buf_offset);
+		set_compressed_frame_count(get_compressed_frame_count() + 1);
+	}
+
+	/*
+	 * The first time the capture buffer is queued, it won't have decoded data to trace, but
+	 * it will set a default display order that the controls can override.  If the capture
+	 * buffer is subsequently queued for reuse, trace it before it is reused.
+	 */
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE || buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		if (get_compressed_frame_count())
+			trace_mem_decoded();
+
+		/* H264 sets display order in controls, otherwise the default display order is the queued order. */
+		if (get_compression_format() != V4L2_PIX_FMT_H264_SLICE)
+			set_decode_order(get_decode_order() + 1);
+
+		set_buffer_display_order(buf_fd, buf_offset, get_decode_order());
+	}
+
+	if (option_is_set_verbose()) {
+		print_buffers_trace();
+		print_decode_order();
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
+	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE || buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		if (get_compressed_frame_count())
+			trace_mem_decoded();
+	}
+}
+
+void g_fmt_setup_trace(struct v4l2_format *format)
+{
+	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		set_pixelformat_trace(format->fmt.pix.width, format->fmt.pix.height, format->fmt.pix.pixelformat);
+	if (format->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		set_pixelformat_trace(format->fmt.pix_mp.width, format->fmt.pix_mp.height, format->fmt.pix_mp.pixelformat);
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
+void expbuf_setup(int fd, struct v4l2_exportbuffer *export_buffer)
+{
+	if ((export_buffer->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) ||
+	    (export_buffer->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)) {
+
+		if (!buffer_in_trace_context(fd))
+			add_buffer_trace(export_buffer->fd, export_buffer->type, export_buffer->index);
+	}
+}
+
+void querybuf_setup(int fd, struct v4l2_buffer *buf)
+{
+	if ((buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) || (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)) {
+		switch (buf->memory) {
+		case V4L2_MEMORY_MMAP: {
+			if (!get_buffer_type_trace(fd, buf->m.offset))
+				add_buffer_trace(fd, buf->type, buf->index, buf->m.offset);
+			break;
+		}
+		case V4L2_MEMORY_USERPTR:
+		case V4L2_MEMORY_DMABUF:
+		default:
+			break;
+		}
+	}
+}
+
+void print_decode_order(void)
+{
+	pthread_mutex_lock(&ctx_trace.lock);
+	fprintf(stderr, "Decode order: ");
+	for (auto it = ctx_trace.decode_order.cbegin(); it != ctx_trace.decode_order.cend(); it++)
+		fprintf(stderr, "%ld, ",  *it);
+	fprintf(stderr, ".\n");
+	pthread_mutex_unlock(&ctx_trace.lock);
+}
+
+void print_buffers_trace(void)
+{
+	pthread_mutex_unlock(&ctx_trace.lock);
+	for (auto it = ctx_trace.buffers.cbegin(); it != ctx_trace.buffers.cend(); ++it) {
+		fprintf(stderr, "fd: %d, %s, index: %d, display_order: %ld, bytesused: %d, ",
+		        it->fd, buftype2s(it->type).c_str(), it->index, it->display_order, it->bytesused);
+		fprintf(stderr, "address: %lu, offset: %d \n",  it->address, it->offset);
+	}
+	pthread_mutex_unlock(&ctx_trace.lock);
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
index 00000000..b8cb196a
--- /dev/null
+++ b/utils/v4l2-tracer/trace-helper.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_HELPER_H
+#define TRACE_HELPER_H
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
+	int pic_order_ctn_lsb;
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
+void add_buffer_trace(int fd, __u32 type, __u32 index, __u32 offset = 0);
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
+void expbuf_setup(int fd, struct v4l2_exportbuffer *export_buffer);
+void querybuf_setup(int fd, struct v4l2_buffer *buf);
+
+void print_decode_order(void);
+void print_buffers_trace(void);
+
+void write_json_object_to_json_file(json_object *jobj, int flags = JSON_C_TO_STRING_PLAIN);
+void close_json_file(void);
+
+#endif
diff --git a/utils/v4l2-tracer/trace-info.cpp b/utils/v4l2-tracer/trace-info.cpp
new file mode 100644
index 00000000..dccfe6a2
--- /dev/null
+++ b/utils/v4l2-tracer/trace-info.cpp
@@ -0,0 +1,460 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
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
+
+std::string h264_slice_flag2s(unsigned long flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED, "V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED" },
+		{ V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH, "V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string h264_dpb_entry_flag2s(unsigned long flag)
+{
+	static constexpr flag_def def[] = {
+
+		{ V4L2_H264_DPB_ENTRY_FLAG_VALID, "V4L2_H264_DPB_ENTRY_FLAG_VALID" },
+		{ V4L2_H264_DPB_ENTRY_FLAG_ACTIVE, "V4L2_H264_DPB_ENTRY_FLAG_ACTIVE" },
+		{ V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM, "V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM" },
+		{ V4L2_H264_DPB_ENTRY_FLAG_FIELD, "V4L2_H264_DPB_ENTRY_FLAG_FIELD" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string h264_decode_params_flag2s(unsigned long flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC, "V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC" },
+		{ V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC, "V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC" },
+		{ V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD, "V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD" },
+		{ V4L2_H264_DECODE_PARAM_FLAG_PFRAME, "V4L2_H264_DECODE_PARAM_FLAG_PFRAME" },
+		{ V4L2_H264_DECODE_PARAM_FLAG_BFRAME, "V4L2_H264_DECODE_PARAM_FLAG_BFRAME" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string h264_decode_mode2s(int mode)
+{
+	std::string s = "unknown";
+
+	switch (mode) {
+	case V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED:
+		s = "V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED";
+		break;
+	case V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED:
+		s= "V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED";
+		break;
+	default:
+		break;
+	}
+
+	return s;
+}
+
+std::string h264_start_code2s(int code)
+{
+	std::string s = "unknown";
+
+	switch (code) {
+	case V4L2_STATELESS_H264_START_CODE_NONE:
+		s = "V4L2_STATELESS_H264_START_CODE_NONE";
+		break;
+	case V4L2_STATELESS_H264_START_CODE_ANNEX_B:
+		s= "V4L2_STATELESS_H264_START_CODE_ANNEX_B";
+		break;
+	default:
+		break;
+	}
+
+	return s;
+}
+
+std::string h264_sps_flag2s(unsigned int flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE, "V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE" },
+		{ V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS, "V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS" },
+		{ V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO, "V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO" },
+		{ V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED, "V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED" },
+		{ V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY, "V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY" },
+		{ V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD, "V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD" },
+		{ V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE, "V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE" },
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
+
+std::string h264_pps_flag2s(unsigned int flag)
+{
+	static constexpr flag_def def[] = {
+		{ V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE, "V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE"},
+		{ V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT, "V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT"},
+		{ V4L2_H264_PPS_FLAG_WEIGHTED_PRED, "V4L2_H264_PPS_FLAG_WEIGHTED_PRED"},
+		{ V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT"},
+		{ V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED, "V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED"},
+		{ V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT, "V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT"},
+		{ V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE, "V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE"},
+		{ V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT, "V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT"},
+		{ 0, nullptr }
+	};
+	return flags2s(flag, def);
+}
diff --git a/utils/v4l2-tracer/trace-info.h b/utils/v4l2-tracer/trace-info.h
new file mode 100644
index 00000000..946e2334
--- /dev/null
+++ b/utils/v4l2-tracer/trace-info.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_INFO_H
+#define TRACE_INFO_H
+
+#include <string.h>
+#include <linux/videodev2.h>
+#include <linux/media.h>
+#include <linux/dma-buf.h>
+#include "v4l2-info.h"
+
+#define ARRAY_SIZE(array)	(sizeof(array) / sizeof((array)[0]))
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
+/* Convert enum v4l2_stateless_h264_decode_mode to string. */
+std::string h264_decode_mode2s(int mode);
+
+/* Convert enum v4l2_stateless_h264_start_code to string. */
+std::string h264_start_code2s(int code);
+
+/* Convert h264_sps flag type to string. */
+std::string h264_sps_flag2s(unsigned int flag);
+
+/* Convert h264_pps flag type to string. */
+std::string h264_pps_flag2s(unsigned int flag);
+
+/* Convert v4l2_ctrl_h264_slice flags to string. */
+std::string h264_slice_flag2s(unsigned long flag);
+
+/* Convert v4l2_h264_dpb_entry flags to string. */
+std::string h264_dpb_entry_flag2s(unsigned long flag);
+
+/* Convert v4l2_ctrl_h264_decode_params flags to string. */
+std::string h264_decode_params_flag2s(unsigned long flag);
+
+#endif
diff --git a/utils/v4l2-tracer/trace-vp8.cpp b/utils/v4l2-tracer/trace-vp8.cpp
new file mode 100644
index 00000000..11741134
--- /dev/null
+++ b/utils/v4l2-tracer/trace-vp8.cpp
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
+	json_object_object_add(vp8_segment_obj, "flags", json_object_new_uint64(segment.flags));
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
+		json_object_array_add(ref_frm_delta_obj, json_object_new_uint64(lf.ref_frm_delta[i]));
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
+	json_object_object_add(vp8_loop_filter_obj, "flags", json_object_new_uint64(lf.flags));
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
+	json_object_object_add(vp8_frame_obj, "first_part_size", json_object_new_uint64(vp8_frame->first_part_size));
+	json_object_object_add(vp8_frame_obj, "first_part_header_bits", json_object_new_uint64(vp8_frame->first_part_header_bits));
+
+	/* __u32 dct_part_sizes[8] */
+	json_object *dct_part_sizes_obj = json_object_new_array();
+	for (size_t i = 0; i < ARRAY_SIZE(vp8_frame->dct_part_sizes); i++)
+		json_object_array_add(dct_part_sizes_obj, json_object_new_uint64(vp8_frame->dct_part_sizes[i]));
+	json_object_object_add(vp8_frame_obj, "dct_part_sizes", dct_part_sizes_obj);
+
+	json_object_object_add(vp8_frame_obj, "last_frame_ts", json_object_new_uint64(vp8_frame->last_frame_ts));
+	json_object_object_add(vp8_frame_obj, "golden_frame_ts", json_object_new_uint64(vp8_frame->golden_frame_ts));
+	json_object_object_add(vp8_frame_obj, "alt_frame_ts", json_object_new_uint64(vp8_frame->alt_frame_ts));
+	json_object_object_add(vp8_frame_obj, "flags", json_object_new_uint64(vp8_frame->flags));
+	json_object_object_add(vp8_frame_obj, "flags_str", json_object_new_string(vp8_frame_flag2s(vp8_frame->flags).c_str()));
+
+	json_object_object_add(ctrl_obj, "v4l2_ctrl_vp8_frame", vp8_frame_obj);
+}
diff --git a/utils/v4l2-tracer/trace-vp8.h b/utils/v4l2-tracer/trace-vp8.h
new file mode 100644
index 00000000..96187eea
--- /dev/null
+++ b/utils/v4l2-tracer/trace-vp8.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_VP8_H
+#define TRACE_VP8_H
+
+void trace_v4l2_ctrl_vp8_frame(void *p_vp8_frame, json_object *ctrl_obj);
+
+#endif
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
new file mode 100644
index 00000000..0e478a13
--- /dev/null
+++ b/utils/v4l2-tracer/trace.cpp
@@ -0,0 +1,582 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "libtracer.h"
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
+	json_object_object_add(pix_mp_obj, "pixelformat_str", json_object_new_string(pixfmt2s(pix_mp.pixelformat).c_str()));
+	json_object_object_add(pix_mp_obj, "fcc_str", json_object_new_string(fcc2s(pix_mp.pixelformat).c_str()));
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
+void trace_v4l2_pix_format(json_object *format_obj, struct v4l2_pix_format pix)
+{
+	json_object *pix_obj = json_object_new_object();
+
+	json_object_object_add(pix_obj, "width", json_object_new_uint64(pix.width));
+	json_object_object_add(pix_obj, "height", json_object_new_uint64(pix.height));
+	json_object_object_add(pix_obj, "pixelformat", json_object_new_uint64(pix.pixelformat));
+	json_object_object_add(pix_obj, "pixelformat_str", json_object_new_string(pixfmt2s(pix.pixelformat).c_str()));
+	json_object_object_add(pix_obj, "fcc_str", json_object_new_string(fcc2s(pix.pixelformat).c_str()));
+	json_object_object_add(pix_obj, "field", json_object_new_uint64(pix.field));
+	json_object_object_add(pix_obj, "bytesperline", json_object_new_uint64(pix.bytesperline));
+	json_object_object_add(pix_obj, "sizeimage", json_object_new_uint64(pix.sizeimage));
+	json_object_object_add(pix_obj, "colorspace", json_object_new_uint64(pix.colorspace));
+	json_object_object_add(pix_obj, "colorspace_str", json_object_new_string(colorspace2s(pix.colorspace).c_str()));
+	json_object_object_add(pix_obj, "priv", json_object_new_uint64(pix.priv));
+
+	if (pix.priv == V4L2_PIX_FMT_PRIV_MAGIC) {
+		json_object_object_add(pix_obj, "priv_str", json_object_new_string("V4L2_PIX_FMT_PRIV_MAGIC"));
+		json_object_object_add(pix_obj, "flags", json_object_new_uint64(pix.flags));
+		json_object_object_add(pix_obj, "flags_str", json_object_new_string(pixflags2s(pix.flags).c_str()));
+		json_object_object_add(pix_obj, "ycbcr_enc", json_object_new_uint64(pix.ycbcr_enc));
+		json_object_object_add(pix_obj, "ycbcr_enc_str", json_object_new_string(ycbcr_enc2s(pix.ycbcr_enc).c_str()));
+		json_object_object_add(pix_obj, "quantization", json_object_new_uint64(pix.quantization));
+		json_object_object_add(pix_obj, "quantization_str", json_object_new_string(quantization2s(pix.quantization).c_str()));
+		json_object_object_add(pix_obj, "xfer_func", json_object_new_uint64(pix.xfer_func));
+		json_object_object_add(pix_obj, "xfer_func_str", json_object_new_string(xfer_func2s(pix.xfer_func).c_str()));
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
+	json_object_object_add(format_obj, "type_str", json_object_new_string(buftype2s(format->type).c_str()));
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
+	json_object_object_add(timestamp_obj, "tv_usec", json_object_new_int64(buf->timestamp.tv_usec));
+	json_object_object_add(buf_obj, "timestamp", timestamp_obj);
+	json_object_object_add(buf_obj, "timestamp_ns", json_object_new_uint64(v4l2_timeval_to_ns(&buf->timestamp)));
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
+	switch (ctrl.id) {
+	case V4L2_CID_STATELESS_VP8_FRAME:
+		trace_v4l2_ctrl_vp8_frame(ctrl.p_vp8_frame, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_DECODE_MODE:
+		trace_v4l2_ctrl_h264_decode_mode(ctrl, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_START_CODE:
+		trace_v4l2_ctrl_h264_start_code(ctrl, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SPS:
+		trace_v4l2_ctrl_h264_sps(ctrl.p_h264_sps, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PPS:
+		trace_v4l2_ctrl_h264_pps(ctrl.p_h264_pps, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
+		trace_v4l2_ctrl_h264_scaling_matrix(ctrl.p_h264_scaling_matrix, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
+		trace_v4l2_ctrl_h264_pred_weights(ctrl.p_h264_pred_weights, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
+		trace_v4l2_ctrl_h264_slice_params(ctrl.p_h264_slice_params, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
+		trace_v4l2_ctrl_h264_decode_params(ctrl.p_h264_decode_params, ctrl_obj);
+		break;
+	case V4L2_CID_STATELESS_FWHT_PARAMS:
+		trace_v4l2_ctrl_fwht_params(ctrl.p_fwht_params, ctrl_obj);
+		break;
+	default:
+		json_object_object_add(ctrl_obj, "Trace warning", json_object_new_string("Unknown control id."));
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
+	json_object_object_add(sync_obj, "flags_str", json_object_new_string(bufsyncflag2s(sync->flags).c_str()));
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
diff --git a/utils/v4l2-tracer/trace.h b/utils/v4l2-tracer/trace.h
new file mode 100644
index 00000000..9b431fea
--- /dev/null
+++ b/utils/v4l2-tracer/trace.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef TRACE_H
+#define TRACE_H
+
+void trace_open(int fd, const char *path, int oflag, mode_t mode, bool is_open64);
+void trace_mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t off, unsigned long buf_address, bool is_mmap64);
+void trace_mem(int fd, __u32 offset, __u32 type, int index, __u32 bytesused, unsigned long start);
+void trace_mem_encoded(int fd, __u32 offset);
+
+std::string get_ioctl_request_str(unsigned long request);
+json_object *trace_ioctl_args(int fd, unsigned long request, void *arg, bool from_userspace = true);
+
+#endif
diff --git a/utils/v4l2-tracer/v4l2-tracer.1.in b/utils/v4l2-tracer/v4l2-tracer.1.in
new file mode 100644
index 00000000..a287fb09
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer.1.in
@@ -0,0 +1,109 @@
+.TH "V4L2-TRACER" "1" "September 2022" "v4l-utils @PACKAGE_VERSION@" "User Commands"
+.SH NAME
+v4l2-tracer - An application to trace and replay stateless video decoding.
+.SH SYNOPSIS
+\fBv4l2-tracer \fR{\fBtrace\fR|\fBretrace\fR}
+.RS
+.RE
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
+.TP
+The v4l2-tracer currently supports VP8, H264 and FWHT formats.
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
index 00000000..05c7c7d0
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#include "v4l2-tracer.h"
+
+#define STR(x) #x
+#define STRING(x) STR(x)
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
+	fprintf(stderr, "v4l2-tracer usage:\n\tv4l2-tracer {trace|retrace}\n");
+	fprintf(stderr, "\tv4l2-tracer trace [trace options] -- <tracee>\n");
+	fprintf(stderr, "\tv4l2-tracer retrace [retrace options] -- <trace_file>.json\n");
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
+	 * Preload the libtracer library. If the program is installed, load the library
+	 * from its installed location, otherwise load it locally.
+	 */
+	std::string libtracer_path;
+	std::string program = argv[0];
+	std::size_t idx = program.rfind("/v4l2-tracer");
+	if (idx != program.npos) {
+		libtracer_path = program.replace(program.begin() + idx + 1, program.end(), ".libs");
+		DIR *dp = opendir(libtracer_path.c_str());
+		if (dp == nullptr)
+			libtracer_path = program.replace(program.begin() + idx, program.end(), "./.libs");
+		closedir(dp);
+	} else {
+		libtracer_path = STRING(LIBTRACER_PATH);
+	}
+	libtracer_path += "/libtracer.so";
+	fprintf(stderr, "Loading libtracer: %s\n", libtracer_path.c_str());
+	setenv("LD_PRELOAD", libtracer_path.c_str(), 0);
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
diff --git a/utils/v4l2-tracer/v4l2-tracer.h b/utils/v4l2-tracer/v4l2-tracer.h
new file mode 100644
index 00000000..7b280b4f
--- /dev/null
+++ b/utils/v4l2-tracer/v4l2-tracer.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Collabora Ltd.
+ */
+
+#ifndef V4L2_TRACER_H
+#define V4L2_TRACER_H
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <cstring>
+#include <string>
+#include <fcntl.h>
+#include <unistd.h>
+#include <pthread.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <dirent.h>
+#include <poll.h>
+#include <unordered_map>
+#include <stdexcept>
+#include <list>
+#include <json.h>
+#include <v4l2-info.h>
+#include "trace-info.h"
+#include "retrace-vp8.h"
+#include "retrace-h264.h"
+#include "retrace-fwht.h"
+#include "retrace-helper.h"
+
+void print_help_retracer(void);
+int retracer(int argc, char *argv[]);
+
+#endif
-- 
2.37.3

