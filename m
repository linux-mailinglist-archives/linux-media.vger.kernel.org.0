Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 074F27251FC
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 04:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240716AbjFGCMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 22:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240712AbjFGCMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 22:12:20 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F89B19B5
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 19:12:17 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B63DB6606EF0;
        Wed,  7 Jun 2023 03:12:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686103936;
        bh=Pg79s4yRL5U7Mdj11vuQq9Lg4CypiyOozpE+UK6pCAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cn6WHo7hMlSXHkb7xYBv0qXs1155sfqXnC7+Z+B8t0T1IZZFSyQHbi5QwchSWds9V
         9JJBO0AljMng5nvdDuGknQx5MpCoalsxfLJ7hZejbakjY5IeqtBp2Lb26QaLZlMb7B
         5nr8o310+TeJ+eaTK8ivpCRM639gyS72KXInY5ES66ejHWhqTjmlHNeFgskGOjSOAr
         VLJ4Q9/SwImUAv5+b/RV4cZ450Hf4Tw3h52LgjlCK+3ADCefwwReL4+8jgUskjFjE/
         Y0PczVHmTW9lXDIN+vV2bOoWrxF9XRsgWiO0t+qIYevWZwnjC60kLh1qgwxMmb2B4O
         qNiL7Dxttg9bQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 2/4] v4l2-tracer: add VIDIOC_ENUM_FRAMEINTERVALS
Date:   Tue,  6 Jun 2023 19:11:56 -0700
Message-Id: <5f240a99d963cb7e908bc6a9bfbf3acedd595480.1686102391.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686102391.git.deborah.brouwer@collabora.com>
References: <cover.1686102391.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add tracing and retracing for VIDIOC_ENUM_FRAMEINTERVALS ioctl.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp  |  1 +
 utils/v4l2-tracer/retrace.cpp        | 16 ++++++++++++++++
 utils/v4l2-tracer/trace.cpp          |  3 +++
 utils/v4l2-tracer/v4l2-tracer-gen.pl |  9 +++++++++
 4 files changed, 29 insertions(+)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 6edec7f4..58a02656 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -41,6 +41,7 @@ const std::list<unsigned long> ioctls = {
 	VIDIOC_S_EXT_CTRLS,
 	VIDIOC_TRY_EXT_CTRLS,
 	VIDIOC_ENUM_FRAMESIZES,
+	VIDIOC_ENUM_FRAMEINTERVALS,
 	VIDIOC_ENCODER_CMD,
 	VIDIOC_TRY_ENCODER_CMD,
 	VIDIOC_CREATE_BUFS,
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 7003ca70..28dc6afe 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -978,6 +978,19 @@ void retrace_vidioc_enum_framesizes(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
+void retrace_vidioc_enum_frameintervals(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_frmivalenum *ptr = retrace_v4l2_frmivalenum_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_ENUM_FRAMEINTERVALS, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_ENUM_FRAMEINTERVALS");
+
+	free(ptr);
+}
+
+
 void retrace_vidioc_try_encoder_cmd(int fd_retrace, json_object *ioctl_args)
 {
 	struct v4l2_encoder_cmd *ptr = retrace_v4l2_encoder_cmd_gen(ioctl_args);
@@ -1287,6 +1300,9 @@ void retrace_ioctl(json_object *syscall_obj)
 	case VIDIOC_ENUM_FRAMESIZES:
 		retrace_vidioc_enum_framesizes(fd_retrace, ioctl_args_user);
 		break;
+	case VIDIOC_ENUM_FRAMEINTERVALS:
+		retrace_vidioc_enum_frameintervals(fd_retrace, ioctl_args_user);
+		break;
 	case VIDIOC_TRY_ENCODER_CMD:
 		retrace_vidioc_try_encoder_cmd(fd_retrace, ioctl_args_user);
 		break;
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index 78db2554..5049a996 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -592,6 +592,9 @@ json_object *trace_ioctl_args(unsigned long cmd, void *arg)
 	case VIDIOC_ENUM_FRAMESIZES:
 		trace_v4l2_frmsizeenum_gen(arg, ioctl_args);
 		break;
+	case VIDIOC_ENUM_FRAMEINTERVALS:
+		trace_v4l2_frmivalenum_gen(arg, ioctl_args);
+		break;
 	case VIDIOC_TRY_ENCODER_CMD:
 	case VIDIOC_ENCODER_CMD:
 		trace_v4l2_encoder_cmd_gen(arg, ioctl_args);
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index aaa112c1..f3eb87bb 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -372,6 +372,15 @@ sub handle_union {
 		printf $fh_trace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
 	}
 
+	if ($struct_name eq "v4l2_frmivalenum") {
+		printf $fh_trace_cpp "\tswitch (p->type) {\n";
+		printf $fh_trace_cpp "\tcase V4L2_FRMIVAL_TYPE_DISCRETE:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_fract_gen(&p->discrete, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tcase V4L2_FRMIVAL_TYPE_STEPWISE:\n\tcase V4L2_FRMIVAL_TYPE_CONTINUOUS:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_frmival_stepwise_gen(&p->stepwise, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
+	}
+
 	return $suppress_union;
 }
 
-- 
2.40.1

