Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA2E708C96
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 02:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjESADM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 20:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjESADL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 20:03:11 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DD0E7A
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 17:03:10 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CE5E6605941;
        Fri, 19 May 2023 01:03:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684454589;
        bh=5+vLnWfECFQQbDZrTyB5dhzEXhBXmOvlAhl6z9yCoEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GbDHRYc2GHc97n12CLKfoTskTdv2kfbcJgQeQOIDM0E+ULI0pTpCRXiFxrnDJZ7GE
         XktC36DZNAhzgOJrjhJ+J2w45me+3GLh/APgnzdvu4qVn+AycvHOkczWJCxG57QzJC
         T+4eapbQp3HGee1RnCbdl69DH0Q76IcWwA/UQZcdtk9uM5YmnN9RiWz6Kdfv1oDHBh
         lI0cA0tvULfoA1a8p1bv25yXyEW7gLeFynTaAZK5SNgzgwol1xtEFa01NDhjENc4/J
         O/ErDtYgWwimn7eVUkJf6URWoVwm7dQ4fjioChMijltvyzWzTQMlpl2Gl9olOfTXPH
         vg0UvLUZkHUuA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 2/2] v4l2-tracer: add G/S TUNER ioctls
Date:   Thu, 18 May 2023 17:02:48 -0700
Message-Id: <2e818fa5c03aabe9ddb43b4ca69adfee92796e80.1684453027.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1684453027.git.deborah.brouwer@collabora.com>
References: <cover.1684453027.git.deborah.brouwer@collabora.com>
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

Add tracing and retracing for VIDIOC_G_TUNER and VIDIOC_S_TUNER.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp  |  2 ++
 utils/v4l2-tracer/retrace.cpp        | 28 ++++++++++++++++++++++++++++
 utils/v4l2-tracer/trace.cpp          |  4 ++++
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 26 ++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index a9f039c7..5ab493e8 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -26,6 +26,8 @@ const std::list<unsigned long> ioctls = {
 	VIDIOC_ENUMINPUT,
 	VIDIOC_G_CTRL,
 	VIDIOC_S_CTRL,
+	VIDIOC_G_TUNER,
+	VIDIOC_S_TUNER,
 	VIDIOC_QUERYCTRL,
 	VIDIOC_G_INPUT,
 	VIDIOC_S_INPUT,
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 8667826c..b2d7c4b3 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -647,6 +647,28 @@ void retrace_vidioc_s_control(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
+void retrace_vidioc_g_tuner(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_tuner *ptr = retrace_v4l2_tuner_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_TUNER, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_TUNER");
+
+	free(ptr);
+}
+
+void retrace_vidioc_s_tuner(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_tuner *ptr = retrace_v4l2_tuner_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_S_TUNER, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_S_TUNER");
+
+	free(ptr);
+}
+
 void retrace_vidioc_g_input(int fd_retrace, json_object *ioctl_args)
 {
 	int input = 0;
@@ -1240,6 +1262,12 @@ void retrace_ioctl(json_object *syscall_obj)
 	case VIDIOC_S_CTRL:
 		retrace_vidioc_s_control(fd_retrace, ioctl_args_user);
 		break;
+	case VIDIOC_G_TUNER:
+		retrace_vidioc_g_tuner(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_TUNER:
+		retrace_vidioc_s_tuner(fd_retrace, ioctl_args_user);
+		break;
 	case VIDIOC_QUERYCTRL:
 		retrace_vidioc_queryctrl(fd_retrace, ioctl_args_user);
 		break;
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index a393d0d4..ed8e94a0 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -563,6 +563,10 @@ json_object *trace_ioctl_args(unsigned long cmd, void *arg)
 	case VIDIOC_S_CTRL:
 		trace_v4l2_control_gen(arg, ioctl_args);
 		break;
+	case VIDIOC_G_TUNER:
+	case VIDIOC_S_TUNER:
+		trace_v4l2_tuner_gen(arg, ioctl_args);
+		break;
 	case VIDIOC_QUERYCTRL:
 		trace_v4l2_queryctrl_gen(arg, ioctl_args);
 		break;
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index d10be6a8..8c6f7cb5 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -162,6 +162,7 @@ sub get_val_def_name {
 	                                     v4l2_exportbuffer v4l2_cropcap v4l2_selection
 	                                     v4l2_sliced_vbi_cap v4l2_format v4l2_streamparm);
 	@structs_that_use_v4l2_ctrl_type = qw(v4l2_queryctrl v4l2_query_ext_ctrl);
+	@structs_that_use_v4l2_tuner_type = qw(v4l2_tuner v4l2_frequency);
 	if ($member eq "type") {
 		foreach (@structs_that_use_v4l2_buf_type) {
 			if ($struct_name eq $_) {
@@ -242,6 +243,9 @@ sub get_val_def_name {
 	if (($member eq "status") && ($struct_name eq "v4l2_input")) {
 		$val_def_name = "input_field_val_def";
 	}
+	if ($member eq "audmode") {
+		return "tuner_audmode_val_def";
+	}
 	return "";
 }
 
@@ -276,6 +280,12 @@ sub get_flag_def_name {
 		if ($struct_name =~ /capability$/) {
 			return "v4l2_cap_flag_def";
 		}
+		if ($struct_name eq "v4l2_tuner") {
+			return "tuner_cap_flag_def";
+		}
+	}
+	if ($member eq "rxsubchans") {
+		return "tuner_rxsub_flag_def";
 	}
 	return "";
 }
@@ -908,6 +918,22 @@ while (<>) {
 		flag_def_gen("V4L2_OUT_CAP_NATIVE_SIZE");
 		next
 	}
+	if (grep {/^#define V4L2_TUNER_CAP_LOW\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def tuner_cap_flag_def[] = {\n";
+		flag_def_gen("V4L2_TUNER_CAP_1HZ");
+		next
+	}
+	if (grep {/^#define V4L2_TUNER_SUB_MONO\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def tuner_rxsub_flag_def[] = {\n";
+		flag_def_gen("V4L2_TUNER_SUB_RDS");
+		next
+	}
+	if (grep {/^#define V4L2_TUNER_MODE_MONO\s+/} $_) {
+		printf $fh_common_info_h "constexpr val_def tuner_audmode_val_def[] = {\n";
+		val_def_gen("V4L2_TUNER_MODE_LANG1_LANG2");
+		next
+	}
+
 	if (grep {/^#define V4L2_ENC_CMD_START\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def encoder_cmd_val_def[] = {\n";
 		val_def_gen("V4L2_ENC_CMD_RESUME");
-- 
2.40.1

