Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7871D7251FE
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 04:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240710AbjFGCMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 22:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240715AbjFGCMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 22:12:23 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B21E1990
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 19:12:22 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A2A306606EF6;
        Wed,  7 Jun 2023 03:12:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686103940;
        bh=IwPSWQ1Lk9vTxCJMpMtfnR17lQ+rgg4RtgrM5SUMjMo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T4bjFs+hpB0gCFGoudmcF1rQ13kAg/WP6f44PpsyF02D/R7Aq6Db5NjsWzvFRZvaO
         uGJNMcrx+Vcwep8z/oJoPKMrpZtwFxN+rB36dQ4+GExkEZzk1xmO5bUhhJi985oC2S
         jNuwrJ08X+Q19K+8sebXYHY2C6GzZ12wQcUuQVwPYhq5icvmHiw6ou7mj4Jlfifvna
         7fDLz8Zn/UzKbD2+FtUVXajYY2Mnutxlw9wBJ1rra6LmwxiTH6NUUHBnOPzZF/bflg
         sJ01fAvAsWshYCXIG7aUBRG9XaTOIbVFGZvPFPR8BiJq61KCevSuVEsvq4Z/gQCr+I
         ZrNUgQO/0cRJg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 4/4] v4l2-tracer: add event tracing/retracing
Date:   Tue,  6 Jun 2023 19:11:58 -0700
Message-Id: <3494ac2254d29947897a2a4173a2ced0da725160.1686102391.git.deborah.brouwer@collabora.com>
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

Add tracing and retracing for VIDIOC_DQEVENT, VIDIOC_SUBSCRIBE_EVENT,
and VIDIOC_UNSUBSCRIBE_EVENT ioctls.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp  |  3 ++
 utils/v4l2-tracer/retrace.cpp        | 81 ++++++++++++++++++++++++++--
 utils/v4l2-tracer/trace.cpp          |  7 +++
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 45 +++++++++++++---
 4 files changed, 126 insertions(+), 10 deletions(-)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 58a02656..7286f321 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -44,6 +44,9 @@ const std::list<unsigned long> ioctls = {
 	VIDIOC_ENUM_FRAMEINTERVALS,
 	VIDIOC_ENCODER_CMD,
 	VIDIOC_TRY_ENCODER_CMD,
+	VIDIOC_DQEVENT,
+	VIDIOC_SUBSCRIBE_EVENT,
+	VIDIOC_UNSUBSCRIBE_EVENT,
 	VIDIOC_CREATE_BUFS,
 	VIDIOC_PREPARE_BUF,
 	VIDIOC_G_SELECTION,
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 28dc6afe..88e70ea9 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -1120,6 +1120,61 @@ void retrace_vidioc_try_decoder_cmd(int fd_retrace, json_object *ioctl_args)
 	free (ptr);
 }
 
+void retrace_vidioc_dqevent(int fd_retrace)
+{
+	const int poll_timeout_ms = 200;
+	struct pollfd *pfds = (struct pollfd *) calloc(1, sizeof(struct pollfd));
+	if (pfds == nullptr)
+		exit(EXIT_FAILURE);
+	pfds[0].fd = fd_retrace;
+	pfds[0].events = POLLIN | POLLPRI;
+	int ret = poll(pfds, 1, poll_timeout_ms);
+
+	if (ret == -1) {
+		line_info("\n\tPoll error.");
+		perror("");
+		free(pfds);
+		exit(EXIT_FAILURE);
+	}
+	if (ret == 0) {
+		line_info("\n\tPoll timed out.");
+		free(pfds);
+		exit(EXIT_FAILURE);
+	}
+
+	struct v4l2_event event = {};
+	ioctl(fd_retrace, VIDIOC_DQEVENT, &event);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_DQEVENT");
+
+	free(pfds);
+}
+
+void retrace_vidioc_subscribe_event(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_event_subscription *ptr = retrace_v4l2_event_subscription_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_SUBSCRIBE_EVENT, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_SUBSCRIBE_EVENT");
+
+	free (ptr);
+}
+
+void retrace_vidioc_unsubscribe(int fd_retrace, json_object *ioctl_args)
+{
+	struct v4l2_event_subscription *ptr = retrace_v4l2_event_subscription_gen(ioctl_args);
+
+	ioctl(fd_retrace, VIDIOC_UNSUBSCRIBE_EVENT, ptr);
+
+	if (is_verbose() || (errno != 0))
+		perror("VIDIOC_UNSUBSCRIBE_EVENT");
+
+	free (ptr);
+}
+
 void retrace_vidioc_decoder_cmd(int fd_retrace, json_object *ioctl_args)
 {
 	struct v4l2_decoder_cmd *ptr = retrace_v4l2_decoder_cmd(ioctl_args);
@@ -1187,19 +1242,25 @@ void retrace_ioctl(json_object *syscall_obj)
 {
 	__s64 cmd = 0;
 	int fd_retrace = 0;
+	bool ioctl_error = false;
 
 	json_object *fd_trace_obj;
 	json_object_object_get_ex(syscall_obj, "fd", &fd_trace_obj);
 	fd_retrace = get_fd_retrace_from_fd_trace(json_object_get_int(fd_trace_obj));
-	if (fd_retrace < 0) {
-		line_info("\n\tBad file descriptor.");
-		return;
-	}
 
 	json_object *cmd_obj;
 	json_object_object_get_ex(syscall_obj, "ioctl", &cmd_obj);
 	cmd = s2val(json_object_get_string(cmd_obj), ioctl_val_def);
 
+	json_object *errno_obj;
+	if (json_object_object_get_ex(syscall_obj, "errno", &errno_obj))
+		ioctl_error = true;
+
+	if (fd_retrace < 0) {
+		line_info("\n\tBad file descriptor on %s\n", json_object_get_string(cmd_obj));
+		return;
+	}
+
 	json_object *ioctl_args_user;
 	json_object_object_get_ex(syscall_obj, "from_userspace", &ioctl_args_user);
 
@@ -1324,6 +1385,18 @@ void retrace_ioctl(json_object *syscall_obj)
 	case VIDIOC_TRY_DECODER_CMD:
 		retrace_vidioc_try_decoder_cmd(fd_retrace, ioctl_args_user);
 		break;
+	case VIDIOC_DQEVENT:
+		/* Don't retrace a timed-out DQEVENT */
+		if (ioctl_error)
+			break;
+		retrace_vidioc_dqevent(fd_retrace);
+		break;
+	case VIDIOC_SUBSCRIBE_EVENT:
+		retrace_vidioc_subscribe_event(fd_retrace, ioctl_args_user);
+		break;
+	case VIDIOC_UNSUBSCRIBE_EVENT:
+		retrace_vidioc_unsubscribe(fd_retrace, ioctl_args_user);
+		break;
 	case VIDIOC_DECODER_CMD:
 		retrace_vidioc_decoder_cmd(fd_retrace, ioctl_args_user);
 		break;
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index 5049a996..0e8531ff 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -599,6 +599,13 @@ json_object *trace_ioctl_args(unsigned long cmd, void *arg)
 	case VIDIOC_ENCODER_CMD:
 		trace_v4l2_encoder_cmd_gen(arg, ioctl_args);
 		break;
+	case VIDIOC_DQEVENT:
+		trace_v4l2_event_gen(arg, ioctl_args);
+		break;
+	case VIDIOC_SUBSCRIBE_EVENT:
+	case VIDIOC_UNSUBSCRIBE_EVENT:
+		trace_v4l2_event_subscription_gen(arg, ioctl_args);
+		break;
 	case VIDIOC_CREATE_BUFS:
 		trace_v4l2_create_buffers_gen(arg, ioctl_args);
 		break;
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index 4db204e3..cbfdfbe0 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -161,7 +161,7 @@ sub get_val_def_name {
 	@structs_that_use_v4l2_buf_type = qw(v4l2_fmtdesc v4l2_requestbuffers v4l2_buffer v4l2_crop
 	                                     v4l2_exportbuffer v4l2_cropcap v4l2_selection
 	                                     v4l2_sliced_vbi_cap v4l2_format v4l2_streamparm);
-	@structs_that_use_v4l2_ctrl_type = qw(v4l2_queryctrl v4l2_query_ext_ctrl);
+	@structs_that_use_v4l2_ctrl_type = qw(v4l2_queryctrl v4l2_query_ext_ctrl v4l2_event_ctrl);
 	@structs_that_use_v4l2_tuner_type = qw(v4l2_tuner v4l2_frequency);
 	if ($member eq "type") {
 		foreach (@structs_that_use_v4l2_buf_type) {
@@ -191,6 +191,9 @@ sub get_val_def_name {
 		if ($struct_name eq "v4l2_output") {
 			return $val_def_name = "output_type_val_def";
 		}
+		if ($struct_name eq "v4l2_event" || $struct_name eq "v4l2_event_subscription") {
+			return $val_def_name = "event_val_def";
+		}
 		return "nullptr"; # will print as hex string
 	}
 	if ($member eq "pixelformat" || $member eq "pixel_format") {
@@ -270,7 +273,10 @@ sub get_flag_def_name {
 		if ($struct_name =~ /.*selection$/) {
 			return "v4l2_sel_flag_def";
 		}
-			return "nullptr";
+		if ($struct_name eq "v4l2_event_subscription") {
+			return "v4l2_event_sub_flag_def";
+		}
+		return "nullptr";
 	}
 
 	if ($member =~ /.*cap.*/) {
@@ -289,6 +295,11 @@ sub get_flag_def_name {
 	if ($member eq "rxsubchans") {
 		return "tuner_rxsub_flag_def";
 	}
+	if ($member eq "changes") {
+		if ($struct_name eq "v4l2_event_ctrl") {
+			return "v4l2_event_ctrl_ch_flag_def";
+		}
+	}
 	return "";
 }
 
@@ -383,6 +394,21 @@ sub handle_union {
 		printf $fh_trace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
 	}
 
+	if ($struct_name eq "v4l2_event") {
+		printf $fh_trace_cpp "\tswitch (p->type) {\n";
+		printf $fh_trace_cpp "\tcase V4L2_EVENT_VSYNC:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_event_vsync_gen(&p->u, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tcase V4L2_EVENT_CTRL:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_event_ctrl_gen(&p->u, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tcase V4L2_EVENT_FRAME_SYNC:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_event_frame_sync_gen(&p->u, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tcase V4L2_EVENT_SOURCE_CHANGE:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_event_src_change_gen(&p->u, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tcase V4L2_EVENT_MOTION_DET:\n";
+		printf $fh_trace_cpp "\t\ttrace_v4l2_event_motion_det_gen(&p->u, %s_obj);\n\t\tbreak;\n", $struct_name;
+		printf $fh_trace_cpp "\tdefault:\n\t\tbreak;\n\t}\n";
+	}
+
 	return $suppress_union;
 }
 
@@ -854,17 +880,15 @@ while (<>) {
 	if (grep {/#define __LINUX_VIDEODEV2_H/} $_) {
 		$in_v4l2_controls = false;
 	}
-
 	if (grep {/^#define.+FWHT_FL_.+/} $_) {
 		flag_gen("fwht");
 	} elsif (grep {/^#define V4L2_VP8_LF.*/} $_) {
 		flag_gen("vp8_loop_filter");
-	} elsif (grep {/^#define.+_FL_.+/} $_) {  #use to get media flags
+	} elsif (grep {/^#define.+_FL_.+/} $_) {
 		flag_gen();
 	} elsif (grep {/^#define.+_FLAG_.+/} $_) {
 		flag_gen();
 	}
-
 	if ($in_v4l2_controls eq true) {
 		if (grep {/^struct/} $_) {
 			struct_gen_ctrl();
@@ -964,7 +988,16 @@ while (<>) {
 		val_def_gen("V4L2_DEC_CMD_FLUSH");
 		next;
 	}
-
+	if (grep {/^#define V4L2_EVENT_ALL\s+/} $_) {
+		printf $fh_common_info_h "constexpr val_def event_val_def[] = {\n";
+		val_def_gen("V4L2_EVENT_PRIVATE_START");
+		next;
+	}
+	if (grep {/^#define V4L2_EVENT_CTRL_CH_VALUE\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def v4l2_event_ctrl_ch_flag_def[] = {\n";
+		flag_def_gen("V4L2_EVENT_CTRL_CH_DIMENSIONS");
+		next
+	}
 	if (grep {/^#define\s+(VIDIOC_\w*)\s*.*/} $_) {
 		push (@ioctls, $_);
 	}
-- 
2.40.1

