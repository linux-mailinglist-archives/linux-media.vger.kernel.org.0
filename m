Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18606DE60F
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 22:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjDKUzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 16:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjDKUzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 16:55:38 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3601618E
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 13:55:35 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D57BB66031FB;
        Tue, 11 Apr 2023 21:55:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681246534;
        bh=dBOu9Mgpn1UMkhZjtEGOjwZQFPY3mmQ3aqhL4QQ5p/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NIKPXKsGpDcaJT6hl2N99SJR5R3LXB3KLxT/0lWRTxNOfqLWz4saCpTrdSRTMk+ZN
         PU/vT58Qnvkyj+KjiTqpDwSQGKgdlQ4TpcMmqK83CZQZinRW/GDJqMSd45kQFly0B1
         JVt1gYvjTrCih/ke6Xu68PF0yS5qOT8molCR6eItdFInY3T9RGynJdInioUlb9b2NJ
         UWpnupajSXAjPTILrYH9Qp1fxUWreQ640kPCcbLStbQVXflLljPGHhoBitY/qhd8Gd
         aWq7dJadxfKZQQ7LmJyqgbB1VUIUEOwHWuoo66zzbXRPQKqhkx7ZIQh+/53fwGax1S
         ZExLpf2pkIdFA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 2/2] v4l2-tracer: add macros to print debug info
Date:   Tue, 11 Apr 2023 13:54:58 -0700
Message-Id: <755860b06bb0c56b452e27245a32e948ef99910d.1681245372.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1681245372.git.deborah.brouwer@collabora.com>
References: <cover.1681245372.git.deborah.brouwer@collabora.com>
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

Instead of repeating the same code to print file, function and line info,
replace it with a macro so that it is easier to read and maintain. Use the
line_info() macro if the information should always be printed, otherwise
use debug_line_info() to print only when the debug option is set.

Use __FILE_NAME__ (if available) instead of __FILE__ to avoid printing the
entire relative path of the file location.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp      |  29 +-----
 utils/v4l2-tracer/retrace-helper.cpp     |  39 +++------
 utils/v4l2-tracer/retrace.cpp            | 107 +++++++----------------
 utils/v4l2-tracer/trace-helper.cpp       |  39 ++-------
 utils/v4l2-tracer/trace.cpp              |  15 ++--
 utils/v4l2-tracer/v4l2-tracer-common.cpp |   6 +-
 utils/v4l2-tracer/v4l2-tracer-common.h   |  16 ++++
 utils/v4l2-tracer/v4l2-tracer.cpp        |  45 ++++------
 8 files changed, 96 insertions(+), 200 deletions(-)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index cc7d5657..2ab2fbe4 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -67,11 +67,7 @@ int open(const char *path, int oflag, ...)
 	int (*original_open)(const char *path, int oflag, ...) = nullptr;
 	original_open = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open");
 	int fd = (*original_open)(path, oflag, mode);
-
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "fd: %d, path: %s\n", fd, path);
-	}
+	debug_line_info("\n\tfd: %d, path: %s", fd, path);
 
 	if (getenv("V4L2_TRACER_PAUSE_TRACE") != nullptr)
 		return fd;
@@ -80,10 +76,6 @@ int open(const char *path, int oflag, ...)
 		trace_open(fd, path, oflag, mode, false);
 		add_device(fd, path);
 	}
-
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-	}
 	print_devices();
 
 	return fd;
@@ -103,11 +95,7 @@ int open64(const char *path, int oflag, ...)
 	int (*original_open64)(const char *path, int oflag, ...) = nullptr;
 	original_open64 = (int (*)(const char*, int, ...)) dlsym(RTLD_NEXT, "open64");
 	int fd = (*original_open64)(path, oflag, mode);
-
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "fd: %d, path: %s\n", fd, path);
-	}
+	debug_line_info("\n\tfd: %d, path: %s", fd, path);
 
 	if (getenv("V4L2_TRACER_PAUSE_TRACE") != nullptr)
 		return fd;
@@ -116,10 +104,6 @@ int open64(const char *path, int oflag, ...)
 		add_device(fd, path);
 		trace_open(fd, path, oflag, mode, true);
 	}
-
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-	}
 	print_devices();
 
 	return fd;
@@ -135,10 +119,7 @@ int close(int fd)
 		return (*original_close)(fd);
 
 	std::string path = get_device(fd);
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "fd: %d, path: %s\n", fd, path.c_str());
-	}
+	debug_line_info("\n\tfd: %d, path: %s", fd, path.c_str());
 
 	/* Only trace the close if a corresponding open was also traced. */
 	if (!path.empty()) {
@@ -153,10 +134,6 @@ int close(int fd)
 		if (!ctx_trace.devices.size())
 			close_json_file();
 	}
-
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-	}
 	print_devices();
 
 	return (*original_close)(fd);
diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
index f58987ac..3c68986f 100644
--- a/utils/v4l2-tracer/retrace-helper.cpp
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -118,18 +118,12 @@ std::string get_path_retrace_from_path_trace(std::string path_trace, json_object
 	/* If user set the media or video path just return that path. */
 	if (is_media && (getenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE") != nullptr)) {
 		path_media = getenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "Use path set by user: %s ", path_media.c_str());
-		}
+		debug_line_info("\n\tUse path set by user: %s", path_media.c_str());
 		return path_media;
 	}
 	if (is_video && (getenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE") != nullptr)) {
 		path_video = getenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "Use path set by user: %s ", path_video.c_str());
-		}
+		debug_line_info("\n\tUse path set by user: %s", path_video.c_str());
 		return path_video;
 	}
 
@@ -143,8 +137,7 @@ std::string get_path_retrace_from_path_trace(std::string path_trace, json_object
 
 	path_media = get_path_media(driver);
 	if (path_media.empty()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: driver: %s not found\n", driver.c_str());
+		line_info("\n\tWarning: driver: \'%s\' not found.", driver.c_str());
 		return "";
 	}
 
@@ -206,21 +199,15 @@ void write_to_output_buffer(unsigned char *buffer_pointer, int bytesused, json_o
 				i++;
 				byteswritten++;
 			} catch (std::invalid_argument& ia) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "\'%s\' is an invalid argument.\n",
-				        compressed_video_data.substr(i,2).c_str());
+				line_info("\n\t\'%s\' is an invalid argument.\n",
+				          compressed_video_data.substr(i,2).c_str());
 			} catch (std::out_of_range& oor) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "\'%s\' is out of range.\n",
-				        compressed_video_data.substr(i,2).c_str());
+				line_info("\n\t\'%s\' is out of range.\n",
+				          compressed_video_data.substr(i,2).c_str());
 			}
 		}
 	}
-
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "bytesused: %d, byteswritten: %d\n", bytesused, byteswritten);
-	}
+	debug_line_info("\n\tbytesused: %d, byteswritten: %d", bytesused, byteswritten);
 }
 
 void compare_program_versions(json_object *v4l2_tracer_info_obj)
@@ -232,9 +219,8 @@ void compare_program_versions(json_object *v4l2_tracer_info_obj)
 		package_version_trace = json_object_get_string(package_version_obj);
 	std::string package_version_retrace = PACKAGE_VERSION;
 	if (package_version_trace != package_version_retrace) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: trace package version \'%s\' does not match current: \'%s\':\n",
-		        package_version_trace.c_str(), package_version_retrace.c_str());
+		line_info("\n\tWarning: trace package version \'%s\' does not match current: \'%s\'",
+		          package_version_trace.c_str(), package_version_retrace.c_str());
 		print_v4l2_tracer_info();
 		return;
 	}
@@ -246,9 +232,8 @@ void compare_program_versions(json_object *v4l2_tracer_info_obj)
 		git_sha_trace = json_object_get_string(git_sha_obj);
 	std::string git_sha_retrace = (STRING(GIT_SHA));
 	if (git_sha_trace != git_sha_retrace) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: sha in trace file \'%s\' does not match current sha: \'%s\'\n",
-		        git_sha_trace.c_str(),  git_sha_retrace.c_str());
+		line_info("\n\tWarning: sha in trace file \'%s\' does not match current sha: \'%s\'",
+		          git_sha_trace.c_str(),  git_sha_retrace.c_str());
 		print_v4l2_tracer_info();
 		return;
 	}
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 0e6600da..c11a7bd0 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -37,8 +37,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 
 	int fd_retrace = get_fd_retrace_from_fd_trace(fd_trace);
 	if (fd_retrace < 0) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "bad or missing file descriptor.\n");
+		line_info("\n\tBad or missing file descriptor.");
 		return;
 	}
 
@@ -57,9 +56,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 			perror("mmap64");
 		else
 			perror("mmap");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 		exit(EXIT_FAILURE);
 	}
@@ -80,9 +77,8 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 			perror("mmap64");
 		else
 			perror("mmap");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+
+		debug_line_info();
 		print_context();
 	}
 }
@@ -137,11 +133,8 @@ void retrace_open(json_object *jobj, bool is_open64)
 	 * Try using the same path as in the trace file.
 	 */
 	if (path_retrace.empty()) {
-		if (is_verbose()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "warning: can't find retrace device. Attempting to use: %s\n",
-			        path_trace.c_str());
-		}
+		line_info("\n\tWarning: can't find retrace device.\
+		          \n\tAttempting to use: %s", path_trace.c_str());
 		path_retrace = path_trace;
 	}
 
@@ -161,8 +154,7 @@ void retrace_open(json_object *jobj, bool is_open64)
 		fd_retrace = open(path_retrace.c_str(), oflag, mode);
 
 	if (fd_retrace <= 0) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "cannot open: %s\n", path_retrace.c_str());
+		line_info("\n\tCan't open: %s", path_retrace.c_str());
 		exit(fd_retrace);
 	}
 
@@ -174,9 +166,7 @@ void retrace_open(json_object *jobj, bool is_open64)
 			perror("open64");
 		else
 			perror("open");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 }
@@ -197,9 +187,7 @@ void retrace_close(json_object *jobj)
 	if (is_verbose() || (errno != 0)) {
 		fprintf(stderr, "fd: %d ", fd_retrace);
 		perror("close");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 }
@@ -314,10 +302,8 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
 		json_object *request_fd_obj;
 		json_object_object_get_ex(buf_obj, "request_fd", &request_fd_obj);
 		buf->request_fd = (__s32) get_fd_retrace_from_fd_trace(json_object_get_int(request_fd_obj));
-		if (buf->request_fd < 0) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "bad or missing file descriptor\n");
-		}
+		if (buf->request_fd < 0)
+			line_info("\n\tBad or missing file descriptor.\n");
 	}
 
 	return buf;
@@ -352,9 +338,7 @@ void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
 		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
 		perror("VIDIOC_QUERYBUF");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 
@@ -378,9 +362,7 @@ void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
 		        buftype2s((int) ptr->type).c_str(), ptr->index, fd_retrace);
 		perror("VIDIOC_QBUF");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 
@@ -400,12 +382,12 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
 	int ret = poll(pfds, 1, poll_timeout_ms);
 	free(pfds);
 	if (ret == -1) {
-		fprintf(stderr, "%s:%s:%d: poll error: ", __FILE__, __func__, __LINE__);
+		line_info("\n\tPoll error.");
 		perror("");
 		exit(EXIT_FAILURE);
 	}
 	if (ret == 0) {
-		fprintf(stderr, "%s:%s:%d: poll timed out\n", __FILE__, __func__, __LINE__);
+		line_info("\n\tPoll timed out.");
 		exit(EXIT_FAILURE);
 	}
 
@@ -415,9 +397,7 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
 		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
 		perror("VIDIOC_DQBUF");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 
@@ -438,9 +418,7 @@ void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args_user)
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
 		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
 		perror("VIDIOC_PREPARE_BUF");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 
@@ -458,9 +436,7 @@ void retrace_vidioc_create_bufs(int fd_retrace, json_object *ioctl_args)
 
 	if (is_verbose() || (errno != 0)) {
 		perror("VIDIOC_CREATE_BUFS");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 
@@ -744,7 +720,7 @@ __u32 *retrace_v4l2_dynamic_array(json_object *v4l2_ext_control_obj)
 
 	__u32 *ptr = static_cast<__u32 *>(calloc(elems, sizeof(__u32)));
 	if (ptr == nullptr) {
-		fprintf(stderr, "%s:%s:%d: memory allocation failed.\n", __FILE__, __func__, __LINE__);
+		line_info("\n\tMemory allocation failed.");
 		return ptr;
 	}
 
@@ -875,9 +851,8 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
 		p->ptr = retrace_v4l2_ctrl_mpeg2_quantisation_gen(v4l2_ext_control_obj);
 		break;
 	default:
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: cannot retrace control: %s\n",
-		        val2s(p->id, control_val_def).c_str());
+		line_info("\n\tWarning: cannot retrace control: %s",
+		          val2s(p->id, control_val_def).c_str());
 		break;
 	}
 
@@ -911,8 +886,7 @@ struct v4l2_ext_controls *retrace_v4l2_ext_controls(json_object *parent_obj)
 			int request_fd_trace = json_object_get_int(request_fd_obj);
 			int request_fd_retrace = get_fd_retrace_from_fd_trace(request_fd_trace);
 			if (request_fd_retrace < 0) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "bad file descriptor\n");
+				line_info("\n\tBad file descriptor.");
 				return ptr;
 			}
 			ptr->request_fd = (__s32) request_fd_retrace;
@@ -965,9 +939,7 @@ void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 
 	if (is_verbose() || (errno != 0)) {
 		perror("VIDIOC_S_EXT_CTRLS");
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
+		debug_line_info();
 		print_context();
 	}
 }
@@ -1173,8 +1145,7 @@ void retrace_ioctl(json_object *syscall_obj)
 	json_object_object_get_ex(syscall_obj, "fd", &fd_trace_obj);
 	fd_retrace = get_fd_retrace_from_fd_trace(json_object_get_int(fd_trace_obj));
 	if (fd_retrace < 0) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "bad file descriptor\n");
+		line_info("\n\tBad file descriptor.");
 		return;
 	}
 
@@ -1310,12 +1281,11 @@ void retrace_ioctl(json_object *syscall_obj)
 		ioctl(fd_retrace, MEDIA_REQUEST_IOC_REINIT);
 		break;
 	default:
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: cannot retrace ioctl");
 		if (json_object_get_string(cmd_obj) != nullptr)
-			fprintf(stderr, ": \'%s\'\n", json_object_get_string(cmd_obj));
+			line_info("\n\tWarning: cannot retrace ioctl: \'%s\'\n",
+			          json_object_get_string(cmd_obj));
 		else
-			fprintf(stderr, "\n");
+			line_info("\n\tWarning: cannot retrace ioctl.");
 		break;
 	}
 }
@@ -1348,11 +1318,8 @@ void retrace_mem(json_object *mem_obj)
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE || type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		write_to_output_buffer(buffer_pointer, bytesused, mem_obj);
 
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "%s, bytesused: %d, offset: %d, addr: %ld\n",
-		        buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
-	}
+	debug_line_info("\n\t%s, bytesused: %d, offset: %d, addr: %ld",
+	                buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
 	print_context();
 }
 
@@ -1408,9 +1375,7 @@ void retrace_object(json_object *jobj)
 	if (json_object_object_get_ex(jobj, "Trace", &temp_obj)) {
 		return;
 	}
-
-	fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-	fprintf(stderr, "warning: unexpected JSON object in trace file.\n");
+	line_info("\n\tWarning: unexpected JSON object in trace file.");
 }
 
 void retrace_array(json_object *root_array_obj)
@@ -1419,10 +1384,8 @@ void retrace_array(json_object *root_array_obj)
 	struct array_list *array_list_pointer = json_object_get_array(root_array_obj);
 	size_t json_objects_in_file = array_list_length(array_list_pointer);
 
-	if (json_objects_in_file < 3) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "warning: trace file may be empty.\n");
-	}
+	if (json_objects_in_file < 3)
+		line_info("\n\tWarning: trace file may be empty.");
 
 	for (size_t i = 0; i < json_objects_in_file; i++) {
 		jobj = (json_object *) array_list_get_idx(array_list_pointer, i);
@@ -1434,8 +1397,7 @@ int retrace(std::string trace_filename)
 {
 	FILE *trace_file = fopen(trace_filename.c_str(), "r");
 	if (trace_file == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "Trace file error: \'%s\'\n", trace_filename.c_str());
+		line_info("\n\tTrace file error: \'%s\'", trace_filename.c_str());
 		return 1;
 	}
 	fclose(trace_file);
@@ -1445,8 +1407,7 @@ int retrace(std::string trace_filename)
 	json_object *root_array_obj = json_object_from_file(trace_filename.c_str());
 
 	if (root_array_obj == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "cannot get JSON-object from file: %s\n", trace_filename.c_str());
+		line_info("\n\tCan't get JSON-object from file: %s", trace_filename.c_str());
 		return 1;
 	}
 
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 0b6382ee..e5094b67 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -19,10 +19,7 @@ bool is_video_or_media_device(const char *path)
 
 void add_device(int fd, std::string path)
 {
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "fd: %d, path: %s\n", fd, path.c_str());
-	}
+	debug_line_info("\n\tfd: %d, path: %s", fd, path.c_str());
 	std::pair<int, std::string> new_pair = std::make_pair(fd, path);
 	ctx_trace.devices.insert(new_pair);
 }
@@ -59,10 +56,7 @@ void print_decode_order(void)
 
 void set_decode_order(long decode_order)
 {
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "%ld\n", decode_order);
-	}
+	debug_line_info("\n\t%ld", decode_order);
 
 	std::list<long>::iterator it;
 	it = find(ctx_trace.decode_order.begin(), ctx_trace.decode_order.end(), decode_order);
@@ -185,10 +179,7 @@ long get_buffer_bytesused_trace(int fd, __u32 offset)
 
 void set_buffer_display_order(int fd, __u32 offset, long display_order)
 {
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "%ld\n", display_order);
-	}
+	debug_line_info("\n\t%ld", display_order);
 	for (auto &b : ctx_trace.buffers) {
 		if ((b.fd == fd) && (b.offset == offset)) {
 			b.display_order = display_order;
@@ -263,9 +254,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 	if (ext_controls->which != V4L2_CTRL_WHICH_REQUEST_VAL)
 		return;
 
-	if (is_debug())
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-
+	debug_line_info();
 	/*
 	 * Since userspace sends H264 frames out of order, get information
 	 * about the correct display order of each frame so that v4l2-tracer
@@ -287,7 +276,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 			int pic_order_cnt_lsb = ctrl.p_h264_decode_params->pic_order_cnt_lsb;
 
 			if (is_debug()) {
-				fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+				line_info();
 				fprintf(stderr, "\tprev_pic_order_cnt_lsb: %d\n", prev_pic_order_cnt_lsb);
 				fprintf(stderr, "\tprev_pic_order_cnt_msb: %ld\n", prev_pic_order_cnt_msb);
 				fprintf(stderr, "\tpic_order_cnt_lsb: %d\n", pic_order_cnt_lsb);
@@ -318,10 +307,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 				pic_order_cnt_msb = prev_pic_order_cnt_msb + (pic_order_cnt_lsb - prev_pic_order_cnt_lsb);
 			}
 
-			if (is_debug()) {
-				fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "\tpic_order_cnt_msb: %ld\n", pic_order_cnt_msb);
-			}
+			debug_line_info("\n\tpic_order_cnt_msb: %ld", pic_order_cnt_msb);
 			ctx_trace.fmt.h264.pic_order_cnt_lsb = pic_order_cnt_lsb;
 			set_decode_order(pic_order_cnt_msb);
 			break;
@@ -334,10 +320,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 
 void qbuf_setup(struct v4l2_buffer *buf)
 {
-	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "%s, index: %d\n", buftype2s((int) buf->type).c_str(), buf->index);
-	}
+	debug_line_info("\n\t%s, index: %d", buftype2s((int) buf->type).c_str(), buf->index);
 
 	int buf_fd = get_buffer_fd_trace(buf->type, buf->index);
 	__u32 buf_offset = get_buffer_offset_trace(buf->type, buf->index);
@@ -369,10 +352,6 @@ void qbuf_setup(struct v4l2_buffer *buf)
 			set_decode_order(get_decode_order() + 1);
 
 		set_buffer_display_order(buf_fd, buf_offset, get_decode_order());
-
-		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-		}
 		print_decode_order();
 		print_buffers_trace();
 	}
@@ -380,9 +359,7 @@ void qbuf_setup(struct v4l2_buffer *buf)
 
 void streamoff_cleanup(v4l2_buf_type buf_type)
 {
-
-	if (is_debug())
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+	debug_line_info();
 	if (is_verbose() || (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE") != nullptr)) {
 		fprintf(stderr, "VIDIOC_STREAMOFF: %s\n", buftype2s(buf_type).c_str());
 		fprintf(stderr, "%s, %s %s, width: %d, height: %d\n",
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index a393d0d4..4c7062ab 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -181,11 +181,8 @@ void trace_mem_decoded(void)
 			 */
 			if (it->bytesused < expected_length)
 				break;
-			if (is_debug()) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "displaying: %ld, %s, index: %d\n",
-				        it->display_order, buftype2s(it->type).c_str(), it->index);
-			}
+			debug_line_info("\n\tDisplaying: %ld, %s, index: %d",
+			                it->display_order, buftype2s(it->type).c_str(), it->index);
 			displayed_count++;
 
 			if (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE") != nullptr) {
@@ -417,12 +414,10 @@ void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_
 		json_object_object_add(v4l2_ext_control_obj, "value64", json_object_new_int64(p->value64));
 		break;
 	default:
-		if (p->size) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
-		} else {
+		if (p->size)
+			line_info("\n\tWarning: cannot trace control: %s", val2s(p->id, control_val_def).c_str());
+		else
 			json_object_object_add(v4l2_ext_control_obj, "value", json_object_new_int(p->value));
-		}
 		break;
 	}
 
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.cpp b/utils/v4l2-tracer/v4l2-tracer-common.cpp
index 869347a1..1b0ab2af 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer-common.cpp
@@ -211,11 +211,9 @@ long s2number(const char *char_str)
 	try {
 		num = std::strtol(str.c_str(), nullptr, 0); /* base is auto-detected */
 	} catch (std::invalid_argument& ia) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "string \'%s\' is invalid\n", str.c_str());
+		line_info("\n\tString \'%s\' is invalid.", str.c_str());
 	} catch (std::out_of_range& oor) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "string \'%s\' is out of range\n", str.c_str());
+		line_info("\n\tString \'%s\' is out of range.", str.c_str());
 	}
 	return num;
 }
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
index ab8b78e3..c8b5dbd4 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.h
+++ b/utils/v4l2-tracer/v4l2-tracer-common.h
@@ -39,6 +39,22 @@
 #define STRERR(x) strerror(x)
 #endif
 
+#ifndef __FILE_NAME__
+#define __FILE_NAME__ __FILE__
+#endif
+
+#define line_info(fmt, args...)					\
+	do {								\
+		fprintf(stderr, "%s:%s:%d " fmt "\n",			\
+		        __FILE_NAME__, __func__, __LINE__, ##args);	\
+	} while (0)							\
+
+#define debug_line_info(fmt, args...)		\
+	do {					\
+		if (is_debug())			\
+			line_info(fmt, ##args);	\
+	} while (0)				\
+
 struct val_def {
 	__s64 val;
 	const char *str;
diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index e3f002a9..980d3951 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -14,7 +14,7 @@ pid_t tracee_pid = 0;
 
 void v4l2_tracer_sig_handler(int signum)
 {
-	fprintf(stderr, "%s:%s:%d: received: %d\n", __FILE__, __func__, __LINE__, signum);
+	line_info("\n\tReceived signum: %d", signum);
 	kill(tracee_pid, signum);
 	/* Wait for tracee to handle the signal first before v4l2-tracer exits. */
 	wait(nullptr);
@@ -80,8 +80,7 @@ int get_options(int argc, char *argv[])
 			try {
 				std::stoi(device_num, nullptr, 0);
 			} catch (std::exception& e) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "can't convert <dev> \'%s\' to integer\n", device_num.c_str());
+				line_info("\n\tCan't convert <dev> \'%s\' to integer.", device_num.c_str());
 				return -1;
 			}
 			if (device_num[0] >= '0' && device_num[0] <= '9' && device_num.length() <= 3) {
@@ -89,8 +88,7 @@ int get_options(int argc, char *argv[])
 				path_video += optarg;
 				setenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE", path_video.c_str(), 0);
 			} else {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "cannot use device number\'%s\'\n", device_num.c_str());
+				line_info("\n\tCan't use device number\'%s\'", device_num.c_str());
 				return -1;
 			}
 			break;
@@ -107,8 +105,7 @@ int get_options(int argc, char *argv[])
 			try {
 				std::stoi(device_num, nullptr, 0);
 			} catch (std::exception& e) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "can't convert <dev> \'%s\' to integer\n", device_num.c_str());
+				line_info("\n\tCan't convert <dev> \'%s\' to integer.", device_num.c_str());
 				return -1;
 			}
 			if (device_num[0] >= '0' && device_num[0] <= '9' && device_num.length() <= 3) {
@@ -116,8 +113,7 @@ int get_options(int argc, char *argv[])
 				path_media += optarg;
 				setenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE", path_media.c_str(), 0);
 			} else {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-				fprintf(stderr, "cannot use device number\'%s\'\n", device_num.c_str());
+				line_info("\n\tCan't use device number\'%s\'", device_num.c_str());
 				return -1;
 			}
 			break;
@@ -150,8 +146,7 @@ int clean(std::string trace_filename)
 {
 	FILE *trace_file = fopen(trace_filename.c_str(), "r");
 	if (trace_file == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "cannot open \'%s\'\n", trace_filename.c_str());
+		line_info("\n\tCan't open \'%s\'", trace_filename.c_str());
 		return 1;
 	}
 
@@ -160,8 +155,7 @@ int clean(std::string trace_filename)
 	std::string clean_filename = "clean_" + trace_filename;
 	FILE *clean_file = fopen(clean_filename.c_str(), "w");
 	if (clean_file == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "cannot open \'%s\'\n", clean_filename.c_str());
+		line_info("\n\tCan't open \'%s\'", clean_filename.c_str());
 		return 1;
 	}
 
@@ -215,9 +209,8 @@ int tracer(int argc, char *argv[], bool retrace)
 	if (retrace) {
 		std::string trace_file = argv[optind];
 		if (trace_file.find(".json") == std::string::npos) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "Trace file \'%s\' must have .json file extension\n",
-			        trace_file.c_str());
+			line_info("\n\tTrace file \'%s\' must have .json file extension",
+			          trace_file.c_str());
 			print_usage();
 			return -1;
 		}
@@ -321,17 +314,15 @@ int tracer(int argc, char *argv[], bool retrace)
 	if (tracee_pid == 0) {
 
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "tracee: ");
+			line_info();
+			fprintf(stderr, "\ttracee: ");
 			for (int i = 0; i < exec_index; i++)
 				fprintf(stderr,"%s ", exec[i]);
 			fprintf(stderr, "\n");
 		}
 
 		execvpe(exec[0], (char* const*) exec, environ);
-
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
-		fprintf(stderr, "could not execute application \'%s\'", exec[0]);
+		line_info("\n\tCould not execute application \'%s\'", exec[0]);
 		perror(" ");
 		return errno;
 	}
@@ -372,14 +363,12 @@ int main(int argc, char *argv[])
 	ret = get_options(argc, argv);
 
 	if (ret < 0) {
-		if (is_debug())
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		debug_line_info();
 		return ret;
 	}
 
 	if (optind == argc) {
-		if (is_debug())
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		debug_line_info();
 		print_usage();
 		return ret;
 	}
@@ -387,8 +376,7 @@ int main(int argc, char *argv[])
 	std::string command = argv[optind++];
 
 	if (optind == argc) {
-		if (is_debug())
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		debug_line_info();
 		print_usage();
 		return ret;
 	}
@@ -412,8 +400,7 @@ int main(int argc, char *argv[])
 		ret = clean (argv[optind]);
 	} else {
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
-			fprintf(stderr, "tracee: ");
+			line_info("Invalid command");
 			for (int i = 0; i < argc; i++)
 				fprintf(stderr,"%s ", argv[i]);
 			fprintf(stderr, "\n");
-- 
2.39.1

