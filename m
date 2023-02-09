Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9937A69002E
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 07:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjBIGFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 01:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBIGFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 01:05:18 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD481B307
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 22:05:14 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 24ED966020BA;
        Thu,  9 Feb 2023 06:05:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675922713;
        bh=73dFSuKGhQu4GYEu3CukceFOy3tunqP3C0yH3adZMjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mwg5neOVG3ERRYRAil8dydfRePsmc6LigkFzvG15tB+3syXxJkCpj+Taq67EilaJ3
         K0ebkKd+UQuCGAdonZc5TEtoi97E39hjgYB9j2SckoBZC6PF98t5erj+OqYBShsldF
         SZNohC1cz3EIbaGl5byYkpMovU4CvBNaj3wntd142p0K/U97Ni7USOtnyzqLBxZ5qk
         d0M7p2kgZVdJittRo7NMvDcpOa8BKYf72E7RzSy77CsCRXEL7bNT0ecQvJyY9uxDex
         NkFc+uS0919CYISBj54MGf+Da07aBEbhaemxe8lI+tf1IxtQNs0gFyaFhXtk72MPNj
         iM4dti+UHZ1Pg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 5/5] v4l2-tracer: add INPUT and OUTPUT ioctls
Date:   Wed,  8 Feb 2023 22:06:25 -0800
Message-Id: <b1e6257acf95d18ca43396b7f9cef79a20661d4d.1675920064.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675920064.git.deborah.brouwer@collabora.com>
References: <cover.1675920064.git.deborah.brouwer@collabora.com>
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

Add tracing and retracing for: VIDIOC_ENUMINPUT, VIDIOC_ENUMOUTPUT,
VIDIOC_G_INPUT, VIDIOC_S_INPUT, VIDIOC_G_OUTPUT, VIDIOC_S_OUTPUT.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp  |  6 ++
 utils/v4l2-tracer/retrace.cpp        | 84 ++++++++++++++++++++++++++++
 utils/v4l2-tracer/trace.cpp          | 18 ++++++
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 39 +++++++++++++
 4 files changed, 147 insertions(+)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 6b438628..5d0817b2 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -24,9 +24,15 @@ const std::list<unsigned long> ioctls = {
 	VIDIOC_DQBUF,
 	VIDIOC_G_PARM,
 	VIDIOC_S_PARM,
+	VIDIOC_ENUMINPUT,
 	VIDIOC_G_CTRL,
 	VIDIOC_S_CTRL,
 	VIDIOC_QUERYCTRL,
+	VIDIOC_G_INPUT,
+	VIDIOC_S_INPUT,
+	VIDIOC_G_OUTPUT,
+	VIDIOC_S_OUTPUT,
+	VIDIOC_ENUMOUTPUT,
 	VIDIOC_G_CROP,
 	VIDIOC_S_CROP,
 	VIDIOC_TRY_FMT,
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 36a218d3..29ac4a38 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -614,6 +614,17 @@ void retrace_vidioc_queryctrl(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
+void retrace_vidioc_enuminput(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_input *ptr = retrace_v4l2_input_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_ENUMINPUT, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_ENUMINPUT");
+
+	free(ptr);
+}
+
 void retrace_vidioc_g_control(int fd_retrace, json_object *ioctl_args)
 {
 	struct v4l2_control *ptr = retrace_v4l2_control_gen(ioctl_args);
@@ -636,6 +647,61 @@ void retrace_vidioc_s_control(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
+void retrace_vidioc_g_input(int fd_retrace, json_object *ioctl_args)
+{
+	int input = 0;
+	ioctl(fd_retrace, VIDIOC_G_INPUT, &input);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_INPUT");
+}
+
+void retrace_vidioc_s_input(int fd_retrace, json_object *ioctl_args)
+{
+	int input = 0;
+	json_object *input_obj;
+	if (json_object_object_get_ex(ioctl_args, "input", &input_obj))
+		input = json_object_get_int(input_obj);
+
+	ioctl(fd_retrace, VIDIOC_S_INPUT, &input);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_S_INPUT");
+}
+
+void retrace_vidioc_g_output(int fd_retrace, json_object *ioctl_args)
+{
+	int output = 0;
+	ioctl(fd_retrace, VIDIOC_G_OUTPUT, &output);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_G_OUTPUT");
+}
+
+void retrace_vidioc_s_output(int fd_retrace, json_object *ioctl_args)
+{
+	int output = 0;
+	json_object *output_obj;
+	if (json_object_object_get_ex(ioctl_args, "output", &output_obj))
+		output = json_object_get_int(output_obj);
+
+	ioctl(fd_retrace, VIDIOC_S_OUTPUT, &output);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_S_OUTPUT");
+}
+
+void retrace_vidioc_enumoutput(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_output *ptr = retrace_v4l2_output_gen(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_ENUMOUTPUT, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_ENUMOUTPUT");
+
+	free(ptr);
+}
+
 void retrace_vidioc_g_crop(int fd_retrace, json_object *ioctl_args)
 {
 	struct v4l2_crop *ptr = retrace_v4l2_crop_gen(ioctl_args);
@@ -1165,6 +1231,9 @@ void retrace_ioctl(json_object *syscall_obj)
 	case VIDIOC_S_PARM:
 		retrace_vidioc_s_parm(fd_retrace, ioctl_args_user);
 		break;
+	case VIDIOC_ENUMINPUT:
+		retrace_vidioc_enuminput(fd_retrace, ioctl_args_user);
+		break;
 	case VIDIOC_G_CTRL:
 		retrace_vidioc_g_control(fd_retrace, ioctl_args_user);
 		break;
@@ -1174,6 +1243,21 @@ void retrace_ioctl(json_object *syscall_obj)
 	case VIDIOC_QUERYCTRL:
 		retrace_vidioc_queryctrl(fd_retrace, ioctl_args_user);
 		break;
+	case VIDIOC_G_INPUT:
+		retrace_vidioc_g_input(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_INPUT:
+		retrace_vidioc_s_input(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_G_OUTPUT:
+		retrace_vidioc_g_output(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_S_OUTPUT:
+		retrace_vidioc_s_output(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_ENUMOUTPUT:
+		retrace_vidioc_enumoutput(fd_retrace, ioctl_args_user);
+		break;
 	case VIDIOC_G_CROP:
 		retrace_vidioc_g_crop(fd_retrace, ioctl_args_user);
 		break;
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index 4896751b..a393d0d4 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -556,6 +556,9 @@ json_object *trace_ioctl_args(unsigned long cmd, void *arg)
 	case VIDIOC_S_PARM:
 		trace_v4l2_streamparm(arg, ioctl_args);
 		break;
+	case VIDIOC_ENUMINPUT:
+		trace_v4l2_input_gen(arg, ioctl_args);
+		break;
 	case VIDIOC_G_CTRL:
 	case VIDIOC_S_CTRL:
 		trace_v4l2_control_gen(arg, ioctl_args);
@@ -563,6 +566,21 @@ json_object *trace_ioctl_args(unsigned long cmd, void *arg)
 	case VIDIOC_QUERYCTRL:
 		trace_v4l2_queryctrl_gen(arg, ioctl_args);
 		break;
+	case VIDIOC_G_INPUT:
+	case VIDIOC_S_INPUT: {
+		int *input = static_cast<int*>(arg);
+		json_object_object_add(ioctl_args, "input", json_object_new_int(*input));
+		break;
+	}
+	case VIDIOC_G_OUTPUT:
+	case VIDIOC_S_OUTPUT: {
+		int *output = static_cast<int*>(arg);
+		json_object_object_add(ioctl_args, "output", json_object_new_int(*output));
+		break;
+	}
+	case VIDIOC_ENUMOUTPUT:
+		trace_v4l2_output_gen(arg, ioctl_args);
+		break;
 	case VIDIOC_G_CROP:
 	case VIDIOC_S_CROP:
 		trace_v4l2_crop_gen(arg, ioctl_args);
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index 66d46f0c..7a47f116 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -156,6 +156,12 @@ sub get_val_def_name {
 		if ($struct_name eq "v4l2_frmivalenum") {
 			return "v4l2_frmivaltypes_val_def";
 		}
+		if ($struct_name eq "v4l2_input") {
+			return $val_def_name = "input_type_val_def";
+		}
+		if ($struct_name eq "v4l2_output") {
+			return $val_def_name = "output_type_val_def";
+		}
 		return "nullptr"; # will print as hex string
 	}
 	# special treatment for struct v4l2_input which has members named both "tuner" and "type"
@@ -209,6 +215,9 @@ sub get_val_def_name {
 	if ($member =~ /xfer_func/) {
 		return "v4l2_xfer_func_val_def";
 	}
+	if (($member eq "status") && ($struct_name eq "v4l2_input")) {
+		$val_def_name = "input_field_val_def";
+	}
 	return "";
 }
 
@@ -824,11 +833,41 @@ while (<>) {
 		flag_def_gen("V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS");
 		next;
 	}
+	if (grep {/^#define V4L2_STD_PAL_B\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def std_flag_def[] = {\n";
+		flag_def_gen("V4L2_STD_ALL");
+		next
+	}
 	if (grep {/^#define V4L2_MODE_HIGHQUALITY\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def streamparm_val_def[] = {\n";
 		val_def_gen("V4L2_CAP_TIMEPERFRAME");
 		next;
 	}
+	if (grep {/^#define V4L2_INPUT_TYPE_TUNER\s+/} $_) {
+		printf $fh_common_info_h "constexpr val_def input_type_val_def[] = {\n";
+		val_def_gen("V4L2_INPUT_TYPE_TOUCH");
+		next
+	}
+	if (grep {/^#define V4L2_IN_ST_NO_POWER\s+/} $_) {
+		printf $fh_common_info_h "constexpr val_def input_field_val_def[] = {\n";
+		val_def_gen("V4L2_IN_ST_VTR");
+		next
+	}
+	if (grep {/^#define V4L2_IN_CAP_DV_TIMINGS\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def input_cap_flag_def[] = {\n";
+		flag_def_gen("V4L2_IN_CAP_NATIVE_SIZE");
+		next
+	}
+	if (grep {/^#define V4L2_OUTPUT_TYPE_MODULATOR\s+/} $_) {
+		printf $fh_common_info_h "constexpr val_def output_type_val_def[] = {\n";
+		val_def_gen("V4L2_OUTPUT_TYPE_ANALOGVGAOVERLAY");
+		next
+	}
+	if (grep {/^#define V4L2_OUT_CAP_DV_TIMINGS\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def output_cap_flag_def[] = {\n";
+		flag_def_gen("V4L2_OUT_CAP_NATIVE_SIZE");
+		next
+	}
 	if (grep {/^#define V4L2_ENC_CMD_START\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def encoder_cmd_val_def[] = {\n";
 		val_def_gen("V4L2_ENC_CMD_RESUME");
-- 
2.39.0

