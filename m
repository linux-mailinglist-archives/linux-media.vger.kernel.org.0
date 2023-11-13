Return-Path: <linux-media+bounces-300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD97EA446
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A32D7B209FC
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1782421E;
	Mon, 13 Nov 2023 20:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ax4APb+9"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1C24207
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:07:02 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD02BD79
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:07:00 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C5BA36602F41;
	Mon, 13 Nov 2023 20:06:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906019;
	bh=LBjEvFBslLRw+inw87jS8i8lG/OiiOs+lr8ZLuITskw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ax4APb+9VXXLXUebb7yrHzz7Kca+nSWv59F1n54d2Ybs10o3KOrLwxr4yjIM/8S7K
	 4md/e1fs/kOFVmJ+ZV/6eyzGU7dSIKpnt/iCGXcoesX58WbUDNPWjlABgU/QtrIl8l
	 0FwQOddDlMrDS2Bn6wdSsj7Nmtw4rEivqRyEIJ1+gzwiy3Sfw4hoM24B1dBLuzubRt
	 DEvNPXq/uxEM8CHL25gTICpzI6UIfbBHsNXJoH9ev90pY9eMzRzTLC7jmE8W5N6+pf
	 a4bz4ftDJUYcWl4fziadh16aVG3BpZHTaECceQrigs2IxBE57umXte4HBp0QeZ4fTv
	 oGRXF7VM7DR7g==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 8/8] v4l2-tracer: auto generate flags for DECODER_CMD
Date: Mon, 13 Nov 2023 12:06:19 -0800
Message-ID: <3bc061be5dc073a4b3f5dd950a9959ca3a7333c4.1699904350.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699904350.git.deborah.brouwer@collabora.com>
References: <cover.1699904350.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The flags for V4L2_DEC_CMD_START STOP, and PAUSE aren’t being traced
correctly because unknown flags aren’t traced as hex values and only one
flag is traced per command. Auto generate the possible flags and use the
standard helper functions to trace and retrace them.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/retrace.cpp        | 15 ++++++---------
 utils/v4l2-tracer/trace.cpp          | 15 +++------------
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 21 +++++++++++++++++++++
 3 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index d251180e..03fe13f8 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -1064,8 +1064,7 @@ struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
 
 	switch (ptr->cmd) {
 	case V4L2_DEC_CMD_START: {
-		if (flags == "V4L2_DEC_CMD_START_MUTE_AUDIO")
-			ptr->flags = V4L2_DEC_CMD_START_MUTE_AUDIO;
+		ptr->flags = s2flags(flags.c_str(), v4l2_decoder_cmd_start_flag_def);
 
 		json_object *start_obj;
 		json_object_object_get_ex(v4l2_decoder_cmd_obj, "start", &start_obj);
@@ -1087,10 +1086,7 @@ struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
 		break;
 	}
 	case V4L2_DEC_CMD_STOP: {
-		if (flags == "V4L2_DEC_CMD_STOP_TO_BLACK")
-			ptr->flags = V4L2_DEC_CMD_STOP_TO_BLACK;
-		else if (flags == "V4L2_DEC_CMD_STOP_IMMEDIATELY")
-			ptr->flags = V4L2_DEC_CMD_STOP_IMMEDIATELY;
+		ptr->flags = s2flags(flags.c_str(), v4l2_decoder_cmd_stop_flag_def);
 
 		json_object *stop_obj;
 		json_object_object_get_ex(v4l2_decoder_cmd_obj, "stop", &stop_obj);
@@ -1101,8 +1097,7 @@ struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
 		break;
 	}
 	case V4L2_DEC_CMD_PAUSE: {
-		if (flags == "V4L2_DEC_CMD_PAUSE_TO_BLACK")
-			ptr->flags = V4L2_DEC_CMD_PAUSE_TO_BLACK;
+		ptr->flags = s2flags(flags.c_str(), v4l2_decoder_cmd_pause_flag_def);
 		break;
 	}
 	default:
@@ -1542,7 +1537,9 @@ int retrace(std::string trace_filename)
 	json_object *root_array_obj = json_object_from_file(trace_filename.c_str());
 
 	if (root_array_obj == nullptr) {
-		line_info("\n\tCan't get JSON-object from file: %s", trace_filename.c_str());
+		line_info("\n\t%s\tCan't get JSON-object from file: %s",
+			  json_util_get_last_err(),
+			  trace_filename.c_str());
 		return 1;
 	}
 
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index 31447f24..c4fc1584 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -466,10 +466,7 @@ void trace_v4l2_decoder_cmd(void *arg, json_object *ioctl_args)
 
 	switch (ptr->cmd) {
 	case V4L2_DEC_CMD_START: {
-		/*  This command has one flag: V4L2_DEC_CMD_START_MUTE_AUDIO. */
-		if (ptr->flags == V4L2_DEC_CMD_START_MUTE_AUDIO)
-			flags = "V4L2_DEC_CMD_START_MUTE_AUDIO";
-
+		flags = fl2s(ptr->flags, v4l2_decoder_cmd_start_flag_def);
 		/* struct start */
 		json_object *start_obj = json_object_new_object();
 		json_object_object_add(start_obj, "speed", json_object_new_int(ptr->start.speed));
@@ -486,12 +483,7 @@ void trace_v4l2_decoder_cmd(void *arg, json_object *ioctl_args)
 		break;
 	}
 	case V4L2_DEC_CMD_STOP: {
-		/*  This command has two flags */
-		if (ptr->flags == V4L2_DEC_CMD_STOP_TO_BLACK)
-			flags = "V4L2_DEC_CMD_STOP_TO_BLACK";
-		else if (ptr->flags == V4L2_DEC_CMD_STOP_IMMEDIATELY)
-			flags = "V4L2_DEC_CMD_STOP_IMMEDIATELY";
-
+		flags = fl2s(ptr->flags, v4l2_decoder_cmd_stop_flag_def);
 		json_object *stop_obj = json_object_new_object();
 		json_object_object_add(stop_obj, "pts", json_object_new_uint64(ptr->stop.pts));
 
@@ -500,8 +492,7 @@ void trace_v4l2_decoder_cmd(void *arg, json_object *ioctl_args)
 	}
 
 	case V4L2_DEC_CMD_PAUSE: {
-		if (ptr->flags == V4L2_DEC_CMD_PAUSE_TO_BLACK)
-			flags = "V4L2_DEC_CMD_PAUSE_TO_BLACK";
+		flags = fl2s(ptr->flags, v4l2_decoder_cmd_pause_flag_def);
 		break;
 	}
 	case V4L2_DEC_CMD_RESUME:
diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index e8f9d71e..cb9c3ab5 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -123,6 +123,12 @@ sub val_def_gen {
 	}
 	($val) = ($_) =~ /^#define\s*(\w+)\s*/;
 	printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $val, $val;
+
+	# in case there is only one value e.g. flags for V4L2_DEC_CMD_START
+	if ($val eq $last_val) {
+		printf $fh_common_info_h "\t{ $sentinel, \"\" }\n};\n\n";
+		return;
+	}
 	while (<>) {
 		next if ($_ =~ /^\s*\/?\s?\*.*/); # skip comments
 		next if ($_ =~ /^\s*$/);  # skip blank lines
@@ -1000,6 +1006,21 @@ while (<>) {
 		val_def_gen("V4L2_DEC_CMD_FLUSH");
 		next;
 	}
+	if (grep {/^#define V4L2_DEC_CMD_START_MUTE_AUDIO\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def v4l2_decoder_cmd_start_flag_def[] = {\n";
+		flag_def_gen("V4L2_DEC_CMD_START_MUTE_AUDIO");
+		next;
+	}
+	if (grep {/^#define V4L2_DEC_CMD_PAUSE_TO_BLACK\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def v4l2_decoder_cmd_pause_flag_def[] = {\n";
+		flag_def_gen("V4L2_DEC_CMD_PAUSE_TO_BLACK");
+		next;
+	}
+	if (grep {/^#define V4L2_DEC_CMD_STOP_TO_BLACK\s+/} $_) {
+		printf $fh_common_info_h "constexpr flag_def v4l2_decoder_cmd_stop_flag_def[] = {\n";
+		flag_def_gen("V4L2_DEC_CMD_STOP_IMMEDIATELY");
+		next;
+	}
 	if (grep {/^#define V4L2_EVENT_ALL\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def event_val_def[] = {\n";
 		val_def_gen("V4L2_EVENT_PRIVATE_START");
-- 
2.41.0


