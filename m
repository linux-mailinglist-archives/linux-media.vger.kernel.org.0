Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B14365CC63
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 05:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbjADEfl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 23:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbjADEfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 23:35:39 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFB01707C
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 20:35:37 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E94266602D02;
        Wed,  4 Jan 2023 04:35:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1672806935;
        bh=QMgPT94KwAV+9MPdJRAEvvT8Lk1YISGRbugZ3M+uvaQ=;
        h=From:To:Cc:Subject:Date:From;
        b=QQYvEPReZRtQB5tUGf8oBra0YoamqHx5qQ406QZKs0Y/lRxTQJQaX1I6lpzeae4Cd
         8FqwPdp8uyS3eAvfG42z1A+vFbqJle2TFCsQoutB4q3xDAPuGHKFKPgkGTef7kU6Xb
         GfmMm+Ax6a4r5iNWPPzIz9O6GOZkXN/PbajX16smdqfxNgv0vgU7A2QsBSJ3uuZFFR
         OPRgXFekq+KA55AffdngtlI8Em5etpTdTca+VK8Gwkmlq5BHN0AynOmwqB+SVb7IbK
         1O0MnN1fVWavE2trePgJQpUpAQwS1IXFLCiym29Of1ZBy/EeQPnY7H3OnCauASlcCK
         T1yYcK12WsTOA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] v4l2-tracer: check for strerrorname_np()
Date:   Tue,  3 Jan 2023 20:36:41 -0800
Message-Id: <20230104043641.230165-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.38.1
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

The v4l2-tracer converts the errno integer to a string using
strerrorname_np().  Check if this function is available and,
if not, use strerror() instead.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 configure.ac                           | 2 ++
 utils/v4l2-tracer/libv4l2tracer.cpp    | 6 +++---
 utils/v4l2-tracer/trace.cpp            | 2 +-
 utils/v4l2-tracer/v4l2-tracer-common.h | 6 ++++++
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/configure.ac b/configure.ac
index 2b26e3dd..dc9c4af7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -323,6 +323,8 @@ if test "x$jsonc_pkgconfig" = "xno"; then
     AC_MSG_WARN(json-c $JSONC_VERSION_REQUIRED or higher required for v4l2-tracer)
 fi
 
+AC_CHECK_FUNCS([strerrorname_np], AC_DEFINE([HAVE_STRERRORNAME_NP],[1],[glibc has function strerrorname_np]))
+
 # Check for pthread
 
 AS_IF([test x$enable_shared != xno],
diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 090a43d7..6b438628 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -201,7 +201,7 @@ int munmap(void *start, size_t length)
 	json_object *munmap_obj = json_object_new_object();
 
 	if (errno)
-		json_object_object_add(munmap_obj, "errno", json_object_new_string(strerrorname_np(errno)));
+		json_object_object_add(munmap_obj, "errno", json_object_new_string(STRERR(errno)));
 
 	json_object *munmap_args = json_object_new_object();
 	json_object_object_add(munmap_args, "start", json_object_new_int64((int64_t)start));
@@ -242,7 +242,7 @@ int ioctl(int fd, unsigned long cmd, ...)
 		int ret = (*original_ioctl)(fd, cmd, arg);
 		if (errno)
 			json_object_object_add(ioctl_obj, "errno",
-			                       json_object_new_string(strerrorname_np(errno)));
+			                       json_object_new_string(STRERR(errno)));
 		write_json_object_to_json_file(ioctl_obj);
 		json_object_put(ioctl_obj);
 		return ret;
@@ -270,7 +270,7 @@ int ioctl(int fd, unsigned long cmd, ...)
 	int ret = (*original_ioctl)(fd, cmd, arg);
 
 	if (errno)
-		json_object_object_add(ioctl_obj, "errno", json_object_new_string(strerrorname_np(errno)));
+		json_object_object_add(ioctl_obj, "errno", json_object_new_string(STRERR(errno)));
 
 	/* Trace driver arguments if userspace will be reading them i.e. _IOR or _IOWR ioctls */
 	if ((cmd & IOC_OUT) != 0U) {
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index d5a09ad7..4896751b 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -71,7 +71,7 @@ void trace_mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t o
 	json_object *mmap_obj = json_object_new_object();
 
 	if (errno)
-		json_object_object_add(mmap_obj, "errno", json_object_new_string(strerrorname_np(errno)));
+		json_object_object_add(mmap_obj, "errno", json_object_new_string(STRERR(errno)));
 
 	json_object *mmap_args = json_object_new_object();
 	json_object_object_add(mmap_args, "addr", json_object_new_int64((int64_t)addr));
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
index 362a7ba6..0bdb125d 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.h
+++ b/utils/v4l2-tracer/v4l2-tracer-common.h
@@ -34,6 +34,12 @@
 #define STR(x) #x
 #define STRING(x) STR(x)
 
+#ifdef HAVE_STRERRORNAME_NP
+#define STRERR(x) strerrorname_np(x)
+#else
+#define STRERR(x) strerror(x)
+#endif
+
 struct val_def {
 	long val;
 	const char *str;
-- 
2.38.1

