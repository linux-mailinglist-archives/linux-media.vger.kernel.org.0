Return-Path: <linux-media+bounces-298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 966597EA443
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8D061C209CE
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D8C24219;
	Mon, 13 Nov 2023 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OvFClsqr"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4B24200
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:06:59 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5413710CE
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:56 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 602A96602F3B;
	Mon, 13 Nov 2023 20:06:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906015;
	bh=epIoe/ma7eNj1yFMynO++yghYl6/zy5WM5oNM+/YtU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OvFClsqr2yPn++pYOREKZLmtwQlQoJje+NNU0NqFmVBtW0RO2T4FOyn+l/Se71AZZ
	 YL33oJde7IYBjIC6Pm9XVodEth8sFLnykyLJw5mzZtuTLaHXq+ETRZNPWyG03hoduM
	 z0eMYMiJVpbI6xIzF2UA7Nq0HIZYmIApQFt0IJp5Q8oSNZj3oFu0vrcwp8/y8QHMwg
	 EkcOLX4HVb308yxDzY3jNsVQkIG0gaChbsoa/wMy7LKs40RddW/yaePdVogSANjX+B
	 hC4xFzHoNFrVTfGER6k79tbBWbaUTpGIO598zBaCA7r+9GYvkNkg9l/a81zO5WzEj8
	 uRHOGpC+HRMPA==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 6/8] v4l2-tracer: create an option to trace userspace args
Date: Mon, 13 Nov 2023 12:06:17 -0800
Message-ID: <649cdd4c53a806a574cfb4b0d849ec12202ba0b9.1699904350.git.deborah.brouwer@collabora.com>
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

Currently all userspace arguments are traced and used in retracing. But
this add unnecessary duplication to the trace file since the driver
arguments are also traced. Stop tracing userspace arguments unless they
are necessary for retracing, but add an option to include all userspace
arguments.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp      |   9 +-
 utils/v4l2-tracer/retrace.cpp            | 123 +++++++++++------------
 utils/v4l2-tracer/v4l2-tracer-common.cpp |   1 +
 utils/v4l2-tracer/v4l2-tracer.cpp        |   6 ++
 4 files changed, 75 insertions(+), 64 deletions(-)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index 7618f554..7335ee6b 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -271,8 +271,13 @@ int ioctl(int fd, unsigned long cmd, ...)
 	if (cmd == VIDIOC_STREAMOFF)
 		streamoff_cleanup(*(static_cast<v4l2_buf_type*>(arg)));
 
-	/* Trace userspace arguments if driver will be reading them i.e. _IOW or _IOWR ioctls */
-	if ((cmd & IOC_IN) != 0U) {
+	/*
+	 * To avoid cluttering the trace file, only trace userspace arguments when necessary
+	 * or if the option to trace them is selected.
+	 */
+	if (((cmd & IOC_INOUT) == IOC_IN) ||
+		(getenv("V4L2_TRACER_OPTION_TRACE_USERSPACE_ARG") != nullptr) ||
+		(cmd == VIDIOC_QBUF)) {
 		json_object *ioctl_args_userspace = trace_ioctl_args(cmd, arg);
 		/* Some ioctls won't have arguments to trace e.g. MEDIA_REQUEST_IOC_QUEUE. */
 		if (json_object_object_length(ioctl_args_userspace))
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index b2b4afbf..d2f6a6e7 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -309,9 +309,9 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
 	return buf;
 }
 
-void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
+void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
 
 	ioctl(fd_retrace, VIDIOC_QUERYBUF, buf);
 
@@ -346,9 +346,9 @@ void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
 	free(buf);
 }
 
-void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
+void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *ptr = retrace_v4l2_buffer(ioctl_args_user);
+	struct v4l2_buffer *ptr = retrace_v4l2_buffer(ioctl_args);
 
 	ioctl(fd_retrace, VIDIOC_QBUF, ptr);
 
@@ -371,9 +371,9 @@ void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
 	free(ptr);
 }
 
-void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
+void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
 
 	const int poll_timeout_ms = 5000;
 	struct pollfd *pfds = (struct pollfd *) calloc(1, sizeof(struct pollfd));
@@ -411,9 +411,9 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
 	free(buf);
 }
 
-void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args_user)
+void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args_user);
+	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
 
 	ioctl(fd_retrace, VIDIOC_PREPARE_BUF, buf);
 
@@ -447,9 +447,9 @@ void retrace_vidioc_create_bufs(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
-void retrace_vidioc_expbuf(int fd_retrace, json_object *ioctl_args_user, json_object *ioctl_args_driver)
+void retrace_vidioc_expbuf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_exportbuffer *ptr = retrace_v4l2_exportbuffer_gen(ioctl_args_user);
+	struct v4l2_exportbuffer *ptr = retrace_v4l2_exportbuffer_gen(ioctl_args);
 	ioctl(fd_retrace, VIDIOC_EXPBUF, ptr);
 
 	int buf_fd_retrace = ptr->fd;
@@ -466,7 +466,7 @@ void retrace_vidioc_expbuf(int fd_retrace, json_object *ioctl_args_user, json_ob
 
 	/* Retrace again to associate the original fd with the current buffer fd. */
 	memset(ptr, 0, sizeof(v4l2_exportbuffer));
-	ptr = retrace_v4l2_exportbuffer_gen(ioctl_args_driver);
+	ptr = retrace_v4l2_exportbuffer_gen(ioctl_args);
 	int buf_fd_trace = ptr->fd;
 	add_fd(buf_fd_trace, buf_fd_retrace);
 
@@ -528,9 +528,9 @@ void retrace_vidioc_g_fmt(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
-void retrace_vidioc_s_fmt(int fd_retrace, json_object *ioctl_args_user)
+void retrace_vidioc_s_fmt(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_format *ptr = retrace_v4l2_format_gen(ioctl_args_user);
+	struct v4l2_format *ptr = retrace_v4l2_format_gen(ioctl_args);
 
 	ioctl(fd_retrace, VIDIOC_S_FMT, ptr);
 
@@ -1265,129 +1265,128 @@ void retrace_ioctl(json_object *syscall_obj)
 		return;
 	}
 
-	json_object *ioctl_args_user;
-	json_object_object_get_ex(syscall_obj, "from_userspace", &ioctl_args_user);
-
-	json_object *ioctl_args_driver;
-	json_object_object_get_ex(syscall_obj, "from_driver", &ioctl_args_driver);
+	/* If available, use the ioctl arguments from userspace, otherwise use the driver arguments. */
+	json_object *ioctl_args;
+	if (json_object_object_get_ex(syscall_obj, "from_userspace", &ioctl_args) == false)
+		json_object_object_get_ex(syscall_obj, "from_driver", &ioctl_args);
 
 	switch (cmd) {
 	case VIDIOC_QUERYCAP:
-		retrace_vidioc_querycap(fd_retrace, ioctl_args_user);
+		retrace_vidioc_querycap(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_ENUM_FMT:
-		retrace_vidioc_enum_fmt(fd_retrace, ioctl_args_user);
+		retrace_vidioc_enum_fmt(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_TRY_FMT:
-		retrace_vidioc_try_fmt(fd_retrace, ioctl_args_user);
+		retrace_vidioc_try_fmt(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_FMT:
-		retrace_vidioc_g_fmt(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_fmt(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_FMT:
-		retrace_vidioc_s_fmt(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_fmt(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_REQBUFS:
-		retrace_vidioc_reqbufs(fd_retrace, ioctl_args_user);
+		retrace_vidioc_reqbufs(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_QUERYBUF:
-		retrace_vidioc_querybuf(fd_retrace, ioctl_args_user);
+		retrace_vidioc_querybuf(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_QBUF:
-		retrace_vidioc_qbuf(fd_retrace, ioctl_args_user);
+		retrace_vidioc_qbuf(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_EXPBUF:
-		retrace_vidioc_expbuf(fd_retrace, ioctl_args_user, ioctl_args_driver);
+		retrace_vidioc_expbuf(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_DQBUF:
-		retrace_vidioc_dqbuf(fd_retrace, ioctl_args_user);
+		retrace_vidioc_dqbuf(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_STREAMON:
-		retrace_vidioc_streamon(fd_retrace, ioctl_args_user);
+		retrace_vidioc_streamon(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_STREAMOFF:
-		retrace_vidioc_streamoff(fd_retrace, ioctl_args_user);
+		retrace_vidioc_streamoff(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_PARM:
-		retrace_vidioc_g_parm(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_parm(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_PARM:
-		retrace_vidioc_s_parm(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_parm(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_ENUMINPUT:
-		retrace_vidioc_enuminput(fd_retrace, ioctl_args_user);
+		retrace_vidioc_enuminput(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_CTRL:
-		retrace_vidioc_g_control(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_control(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_CTRL:
-		retrace_vidioc_s_control(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_control(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_TUNER:
-		retrace_vidioc_g_tuner(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_tuner(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_TUNER:
-		retrace_vidioc_s_tuner(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_tuner(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_QUERYCTRL:
-		retrace_vidioc_queryctrl(fd_retrace, ioctl_args_user);
+		retrace_vidioc_queryctrl(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_INPUT:
-		retrace_vidioc_g_input(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_input(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_INPUT:
-		retrace_vidioc_s_input(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_input(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_OUTPUT:
-		retrace_vidioc_g_output(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_output(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_OUTPUT:
-		retrace_vidioc_s_output(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_output(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_ENUMOUTPUT:
-		retrace_vidioc_enumoutput(fd_retrace, ioctl_args_user);
+		retrace_vidioc_enumoutput(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_CROP:
-		retrace_vidioc_g_crop(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_crop(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_CROP:
-		retrace_vidioc_s_crop(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_crop(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_EXT_CTRLS:
-		retrace_vidioc_g_ext_ctrls(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_ext_ctrls(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_TRY_EXT_CTRLS:
-		retrace_vidioc_try_ext_ctrls(fd_retrace, ioctl_args_user);
+		retrace_vidioc_try_ext_ctrls(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_EXT_CTRLS:
-		retrace_vidioc_s_ext_ctrls(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_ext_ctrls(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_ENUM_FRAMESIZES:
-		retrace_vidioc_enum_framesizes(fd_retrace, ioctl_args_user);
+		retrace_vidioc_enum_framesizes(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_ENUM_FRAMEINTERVALS:
-		retrace_vidioc_enum_frameintervals(fd_retrace, ioctl_args_user);
+		retrace_vidioc_enum_frameintervals(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_TRY_ENCODER_CMD:
-		retrace_vidioc_try_encoder_cmd(fd_retrace, ioctl_args_user);
+		retrace_vidioc_try_encoder_cmd(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_ENCODER_CMD:
-		retrace_vidioc_encoder_cmd(fd_retrace, ioctl_args_user);
+		retrace_vidioc_encoder_cmd(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_CREATE_BUFS:
-		retrace_vidioc_create_bufs(fd_retrace, ioctl_args_user);
+		retrace_vidioc_create_bufs(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_G_SELECTION:
-		retrace_vidioc_g_selection(fd_retrace, ioctl_args_user);
+		retrace_vidioc_g_selection(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_S_SELECTION:
-		retrace_vidioc_s_selection(fd_retrace, ioctl_args_user);
+		retrace_vidioc_s_selection(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_PREPARE_BUF:
-		retrace_vidioc_prepare_buf(fd_retrace, ioctl_args_user);
+		retrace_vidioc_prepare_buf(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_TRY_DECODER_CMD:
-		retrace_vidioc_try_decoder_cmd(fd_retrace, ioctl_args_user);
+		retrace_vidioc_try_decoder_cmd(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_DQEVENT:
 		/* Don't retrace a timed-out DQEVENT */
@@ -1396,19 +1395,19 @@ void retrace_ioctl(json_object *syscall_obj)
 		retrace_vidioc_dqevent(fd_retrace);
 		break;
 	case VIDIOC_SUBSCRIBE_EVENT:
-		retrace_vidioc_subscribe_event(fd_retrace, ioctl_args_user);
+		retrace_vidioc_subscribe_event(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_UNSUBSCRIBE_EVENT:
-		retrace_vidioc_unsubscribe(fd_retrace, ioctl_args_user);
+		retrace_vidioc_unsubscribe(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_DECODER_CMD:
-		retrace_vidioc_decoder_cmd(fd_retrace, ioctl_args_user);
+		retrace_vidioc_decoder_cmd(fd_retrace, ioctl_args);
 		break;
 	case VIDIOC_QUERY_EXT_CTRL:
-		retrace_vidioc_query_ext_ctrl(fd_retrace, ioctl_args_user);
+		retrace_vidioc_query_ext_ctrl(fd_retrace, ioctl_args);
 		break;
 	case MEDIA_IOC_REQUEST_ALLOC:
-		retrace_media_ioc_request_alloc(fd_retrace, ioctl_args_driver);
+		retrace_media_ioc_request_alloc(fd_retrace, ioctl_args);
 		break;
 	case MEDIA_REQUEST_IOC_QUEUE:
 		ioctl(fd_retrace, MEDIA_REQUEST_IOC_QUEUE);
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.cpp b/utils/v4l2-tracer/v4l2-tracer-common.cpp
index 1b0ab2af..62f62ada 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer-common.cpp
@@ -37,6 +37,7 @@ void print_usage(void)
 	        "\t\t-g, --debug       Turn on verbose reporting plus additional debug info.\n"
 	        "\t\t-h, --help        Display this message.\n"
 	        "\t\t-r  --raw         Write decoded video frame data to JSON file.\n"
+	        "\t\t-u  --userspace   Trace userspace arguments.\n"
 	        "\t\t-v, --verbose     Turn on verbose reporting.\n"
 	        "\t\t-y, --yuv         Write decoded video frame data to yuv file.\n\n"
 
diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index 9fd5eae0..a039f528 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -28,6 +28,7 @@ enum Options {
 	V4l2TracerOptHelp = 'h',
 	V4l2TracerOptSetMediaDevice = 'm',
 	V4l2TracerOptWriteDecodedToJson = 'r',
+	V4l2TracerOptTraceUserspaceArg = 'u',
 	V4l2TracerOptVerbose = 'v',
 	V4l2TracerOptWriteDecodedToYUVFile = 'y',
 };
@@ -39,6 +40,7 @@ const static struct option long_options[] = {
 	{ "help", no_argument, nullptr, V4l2TracerOptHelp },
 	{ "media_device", required_argument, nullptr, V4l2TracerOptSetMediaDevice },
 	{ "raw", no_argument, nullptr, V4l2TracerOptWriteDecodedToJson },
+	{ "userspace", no_argument, nullptr, V4l2TracerOptTraceUserspaceArg},
 	{ "verbose", no_argument, nullptr, V4l2TracerOptVerbose },
 	{ "yuv", no_argument, nullptr, V4l2TracerOptWriteDecodedToYUVFile },
 	{ nullptr, 0, nullptr, 0 }
@@ -51,6 +53,7 @@ const char short_options[] = {
 	V4l2TracerOptHelp,
 	V4l2TracerOptSetMediaDevice, ':',
 	V4l2TracerOptWriteDecodedToJson,
+	V4l2TracerOptTraceUserspaceArg,
 	V4l2TracerOptVerbose,
 	V4l2TracerOptWriteDecodedToYUVFile
 };
@@ -122,6 +125,9 @@ int get_options(int argc, char *argv[])
 		case V4l2TracerOptWriteDecodedToJson:
 			setenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_JSON_FILE", "true", 0);
 			break;
+		case V4l2TracerOptTraceUserspaceArg:
+			setenv("V4L2_TRACER_OPTION_TRACE_USERSPACE_ARG", "true", 0);
+			break;
 		case V4l2TracerOptVerbose:
 			setenv("V4L2_TRACER_OPTION_VERBOSE", "true", 0);
 			break;
-- 
2.41.0


