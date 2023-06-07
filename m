Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4FD7251FB
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 04:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240711AbjFGCMS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 22:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240679AbjFGCMR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 22:12:17 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A873819BD
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 19:12:14 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DEE06606EF4;
        Wed,  7 Jun 2023 03:12:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686103933;
        bh=vCBNCkojbiic9vYkJ7j+sSyAE/A+/WePmQbM1GaHCpA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DBVJKKVemm4Q3MKEkC8SVr2CsCPvSTbf2Om9E2XM5tXfol9q8e3lKEgjNIEuaHAql
         AFVOEZCZEIEpT/OE9oUNJkO+NagDbTFCrPLtBNbTOJBYvnpw13z4aDm7bJhL0+JfQF
         hegxfbWcMZuT7kdcNlw3fPx1KbOkRgd1GK9OB2GtXaC3tnh+4+tuUu6DohHiA8SpNt
         zNPsFraZNkMCqrjki1jgYsHVkM350Fh53LiG1oG0R2XROjd6J7HxI50vGN3n72KXqX
         0JJEP5QoI/vFCFnLiuoNf/rSu6dDIkE+eCFaw3qNHVNEiVnZDM1NBr8ooS+NzA++nV
         s+m4u5huL2gxQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 1/4] v4l2-tracer: add VIDIOC_ENUM_FRAMESIZES
Date:   Tue,  6 Jun 2023 19:11:55 -0700
Message-Id: <c1c3471986bf570ee866cfd6666efc4bc6644b2d.1686102391.git.deborah.brouwer@collabora.com>
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

Add tracing and retracing for VIDIOC_ENUM_FRAMESIZES ioctl.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp  |  1 +
 utils/v4l2-tracer/retrace.cpp        | 15 +++++++++++++++
 utils/v4l2-tracer/trace.cpp          |  3 +++
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 11 ++++++++++-
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 63c1812e..6edec7f4 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -40,6 +40,7 @@ const std::list<unsigned long> ioctls = {
 	VIDIOC_G_EXT_CTRLS,
 	VIDIOC_S_EXT_CTRLS,
 	VIDIOC_TRY_EXT_CTRLS,
+	VIDIOC_ENUM_FRAMESIZES,
 	VIDIOC_ENCODER_CMD,
 	VIDIOC_TRY_ENCODER_CMD,
 	VIDIOC_CREATE_BUFS,
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 51c8ad37..7003ca70 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -966,6 +966,18 @@ void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 	}
 }
 
+void retrace_vidioc_enum_framesizes(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_frmsizeenum *ptr = retrace_v4l2_frmsizeenum_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_ENUM_FRAMESIZES, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_ENUM_FRAMESIZES");
+
+	free(ptr);
+}
+
 void retrace_vidioc_try_encoder_cmd(int fd_retrace, json_object *ioctl_args)
 {
 	struct v4l2_encoder_cmd *ptr = retrace_v4l2_encoder_cmd_gen(ioctl_args);
@@ -1272,6 +1284,9 @@ void retrace_ioctl(json_object *syscall_obj)
 	case VIDIOC_S_EXT_CTRLS:
 		retrace_vidioc_s_ext_ctrls(fd_retrace, ioctl_args_user);
 		break;
+	case VIDIOC_ENUM_FRAMESIZES:
+		retrace_vidioc_enum_framesizes(fd_retrace, ioctl_args_user);
+		break;
 	case VIDIOC_TRY_ENCODER_CMD:
 		retrace_vidioc_try_encoder_cmd(fd_retrace, ioctl_args_user);
 		break;
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index acf4cc98..78db2554 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -589,6 +589,9 @@ json_object *trace_ioctl_args(unsigned long cmd, void *arg)
 	case VIDIOC_S_EXT_CTRLS:
 		trace_v4l2_ext_controls(arg, ioctl_args);
 		break;
+	case VIDIOC_ENUM_FRAMESIZES:
+		trace_v4l2_frmsizeenum_gen(arg, ioctl_args);
+		break;
 	case VIDIOC_TRY_ENCODER_CMD:
 	case VIDIOC_ENCODER_CMD:
 		trace_v4l2_encoder_cmd_gen(arg, ioctl_args);
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index 8c6f7cb5..aaa112c1 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -193,7 +193,7 @@ sub get_val_def_name {
 		}
 		return "nullptr"; # will print as hex string
 	}
-	if ($member =~ /pixelformat/) {
+	if ($member eq "pixelformat" || $member eq "pixel_format") {
 		return "v4l2_pix_fmt_val_def";
 	}
 	if ($member =~ /cmd/) {
@@ -363,6 +363,15 @@ sub handle_union {
 		printf $fh_retrace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
 	}
 
+	if ($struct_name eq "v4l2_frmsizeenum") {
+		printf $fh_trace_cpp "\tswitch (p->type) {\n";
+		printf $fh_trace_cpp "\tcase V4L2_FRMSIZE_TYPE_DISCRETE:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_frmsize_discrete_gen(&p->discrete, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tcase V4L2_FRMSIZE_TYPE_STEPWISE:\n\tcase V4L2_FRMSIZE_TYPE_CONTINUOUS:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_frmsize_stepwise_gen(&p->stepwise, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
+	}
+
 	return $suppress_union;
 }
 
-- 
2.40.1

