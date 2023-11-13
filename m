Return-Path: <linux-media+bounces-293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96207EA43E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D8A0B20B51
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0436A24206;
	Mon, 13 Nov 2023 20:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="co9Zl0D3"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25CB22EEB
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:06:47 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB1F10A
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:46 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F6F96602F3A;
	Mon, 13 Nov 2023 20:06:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906005;
	bh=A1DGYlGxdSYHbzaP8KahmZaUttNmPjFzyltxk6oM6mk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=co9Zl0D3AS2D5lFDBOKW5aVviNjCOlyCZs/o4C0lqlPLFWv6YtpnyOcWFIieK+jWk
	 VrfTIoUc6UFghFG+BY2J8sQOgZ+WEmSI8pPXK6Z3uAREfujx7o4Fce+S/wJRh1xtM/
	 t8+QNxl9kyDujFBxpAhAUVHIjBacXPzy//I8Z4oamdQksQMLG1UhHGPLXiApIMmQ2H
	 /YowuvqgedKWF7VkFruKd+vLNbmfqYgXn0ecYXgH/q5PbrtIdrySm4+dkFwiLj22w3
	 /PWSymU5sKf7l36IPRa+eHAy79O8iKglPVGJlcusIVbBl6CmjUdOQxyDK8Ijvy/wll
	 S5jNIAsCZOt+g==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 1/8] v4l2-info/v4l2-tracer: add macro to mark the trace
Date: Mon, 13 Nov 2023 12:06:12 -0800
Message-ID: <f80a3f7f25f465034ce16262aa2952049242ee53.1699904350.git.deborah.brouwer@collabora.com>
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

Add a macro to write to /dev/null. A v4l-utils application that is being
traced can call this macro to inject a comment into the JSON trace file.
It is helpful for debugging.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/common/v4l2-info.h            |  7 +++++++
 utils/v4l2-tracer/libv4l2tracer.cpp | 22 ++++++++++++++++++++++
 utils/v4l2-tracer/retrace.cpp       |  3 +++
 3 files changed, 32 insertions(+)

diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index 6de5654c..2142952a 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -11,6 +11,13 @@
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 
+#define v4l2_tracer_info(fmt, args...)					\
+	do {								\
+		char msg[256];						\
+		snprintf(msg, sizeof(msg), "v4l2-tracer: " fmt, ##args);\
+		write(open("/dev/null", O_WRONLY), msg, strlen(msg));	\
+	} while (0)
+
 /*
  * The max value comes from a check in the kernel source code
  * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 7286f321..c6a74afb 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -88,6 +88,28 @@ int open(const char *path, int oflag, ...)
 	return fd;
 }
 
+ssize_t write(int fd, const void *buf, size_t count)
+{
+	ssize_t (*original_write)(int fd, const void *buf, size_t count) = nullptr;
+	original_write = (ssize_t (*)(int, const void *, size_t)) dlsym(RTLD_NEXT, "write");
+	ssize_t ret = (*original_write)(fd, buf, count);
+
+	/*
+	 * If the write message starts with "v4l2-tracer", then assume it came from the
+	 * v4l2_tracer_info macro and trace it.
+	 */
+	std::string buf_string(static_cast<const char*>(buf), count);
+	if (buf_string.find("v4l2-tracer") == 0) {
+
+		json_object *write_obj = json_object_new_object();
+		json_object_object_add(write_obj, "write", json_object_new_string((const char*)buf));
+		write_json_object_to_json_file(write_obj);
+		json_object_put(write_obj);
+	}
+
+	return ret;
+}
+
 #if defined(linux) && defined(__GLIBC__)
 int open64(const char *path, int oflag, ...)
 {
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 88e70ea9..14c42568 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -1507,6 +1507,9 @@ void retrace_object(json_object *jobj)
 	if (json_object_object_get_ex(jobj, "Trace", &temp_obj)) {
 		return;
 	}
+	if (json_object_object_get_ex(jobj, "write", &temp_obj)) {
+		return;
+	}
 	line_info("\n\tWarning: unexpected JSON object in trace file.");
 }
 
-- 
2.41.0


