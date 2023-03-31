Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115746D2861
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 21:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjCaTA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 15:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjCaTA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 15:00:26 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16D940C5
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 12:00:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C5DB06603197;
        Fri, 31 Mar 2023 20:00:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680289222;
        bh=cyvdwv45f/wUOxG/w78rWn7GNznEjocAs1o770jQMIU=;
        h=From:To:Cc:Subject:Date:From;
        b=T8ICx+PUeRxJQ8gZG68tE4N7nrXnKo2ExxQB5qQOPbKzP7R/JwxLoB+f1bIZfg85S
         9laTK1TLb8iqmdjQCMzPXMBbcxkDN8/yTAdkqlQ8LQm2KZBMqserHlbO9CEGM05TVa
         o5ykvtjwHUWYTYqBG8WyTSdoOi0oa2Ic31imffkWbe11IV70Jpo+IU0gUyAgGiezuk
         j8C/jZndeawVBH/0SPndzdCMWVeytbraWpVwcVqLUzMKMMfqskQ7/Y2NcKycY4XDUG
         bPfPH98X2rNmdOpH+6pTRlKJegoabGbncmcEH+XbWLnZ40JVaBsHiWPaZQYQQ8RL1o
         L2M4187cOJD5A==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] v4l2-tracer: use __FILE_NAME__ if available
Date:   Fri, 31 Mar 2023 11:59:58 -0700
Message-Id: <20230331185958.10111-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use __FILE_NAME__ if available to avoid printing the entire relative path
in verbose and debug messages, otherwise fall back to __FILE__.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/libv4l2tracer.cpp      | 12 +++---
 utils/v4l2-tracer/retrace-helper.cpp     | 16 ++++----
 utils/v4l2-tracer/retrace.cpp            | 52 ++++++++++++------------
 utils/v4l2-tracer/trace-helper.cpp       | 18 ++++----
 utils/v4l2-tracer/trace.cpp              |  4 +-
 utils/v4l2-tracer/v4l2-tracer-common.cpp |  4 +-
 utils/v4l2-tracer/v4l2-tracer-common.h   |  6 +++
 utils/v4l2-tracer/v4l2-tracer.cpp        | 28 ++++++-------
 8 files changed, 73 insertions(+), 67 deletions(-)

diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/libv4l2tracer.cpp
index a9f039c7..fc6f3939 100644
--- a/utils/v4l2-tracer/libv4l2tracer.cpp
+++ b/utils/v4l2-tracer/libv4l2tracer.cpp
@@ -69,7 +69,7 @@ int open(const char *path, int oflag, ...)
 	int fd = (*original_open)(path, oflag, mode);
 
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "fd: %d, path: %s\n", fd, path);
 	}
 
@@ -82,7 +82,7 @@ int open(const char *path, int oflag, ...)
 	}
 
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 		print_devices();
 	}
 
@@ -105,7 +105,7 @@ int open64(const char *path, int oflag, ...)
 	int fd = (*original_open64)(path, oflag, mode);
 
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "fd: %d, path: %s\n", fd, path);
 	}
 
@@ -118,7 +118,7 @@ int open64(const char *path, int oflag, ...)
 	}
 
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 		print_devices();
 	}
 
@@ -136,7 +136,7 @@ int close(int fd)
 
 	std::string path = get_device(fd);
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "fd: %d, path: %s\n", fd, path.c_str());
 	}
 
@@ -155,7 +155,7 @@ int close(int fd)
 	}
 
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 		print_devices();
 	}
 
diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
index 03b0466b..427e81ae 100644
--- a/utils/v4l2-tracer/retrace-helper.cpp
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -119,7 +119,7 @@ std::string get_path_retrace_from_path_trace(std::string path_trace, json_object
 	if (is_media && (getenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE") != nullptr)) {
 		path_media = getenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "Use path set by user: %s ", path_media.c_str());
 		}
 		return path_media;
@@ -127,7 +127,7 @@ std::string get_path_retrace_from_path_trace(std::string path_trace, json_object
 	if (is_video && (getenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE") != nullptr)) {
 		path_video = getenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "Use path set by user: %s ", path_video.c_str());
 		}
 		return path_video;
@@ -143,7 +143,7 @@ std::string get_path_retrace_from_path_trace(std::string path_trace, json_object
 
 	path_media = get_path_media(driver);
 	if (path_media.empty()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "warning: driver: %s not found\n", driver.c_str());
 		return "";
 	}
@@ -206,11 +206,11 @@ void write_to_output_buffer(unsigned char *buffer_pointer, int bytesused, json_o
 				i++;
 				byteswritten++;
 			} catch (std::invalid_argument& ia) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "\'%s\' is an invalid argument.\n",
 				        compressed_video_data.substr(i,2).c_str());
 			} catch (std::out_of_range& oor) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "\'%s\' is out of range.\n",
 				        compressed_video_data.substr(i,2).c_str());
 			}
@@ -218,7 +218,7 @@ void write_to_output_buffer(unsigned char *buffer_pointer, int bytesused, json_o
 	}
 
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "bytesused: %d, byteswritten: %d\n", bytesused, byteswritten);
 	}
 }
@@ -232,7 +232,7 @@ void compare_program_versions(json_object *v4l2_tracer_info_obj)
 		package_version_trace = json_object_get_string(package_version_obj);
 	std::string package_version_retrace = PACKAGE_VERSION;
 	if (package_version_trace != package_version_retrace) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "warning: trace package version \'%s\' does not match current: \'%s\':\n",
 		        package_version_trace.c_str(), package_version_retrace.c_str());
 		print_v4l2_tracer_info();
@@ -246,7 +246,7 @@ void compare_program_versions(json_object *v4l2_tracer_info_obj)
 		git_sha_trace = json_object_get_string(git_sha_obj);
 	std::string git_sha_retrace = (STRING(GIT_SHA));
 	if (git_sha_trace != git_sha_retrace) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "warning: sha in trace file \'%s\' does not match current sha: \'%s\'\n",
 		        git_sha_trace.c_str(),  git_sha_retrace.c_str());
 		print_v4l2_tracer_info();
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 8667826c..c5e6e9db 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -37,7 +37,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 
 	int fd_retrace = get_fd_retrace_from_fd_trace(fd_trace);
 	if (fd_retrace < 0) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "bad or missing file descriptor.\n");
 		return;
 	}
@@ -58,7 +58,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 		else
 			perror("mmap");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 		exit(EXIT_FAILURE);
@@ -81,7 +81,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 		else
 			perror("mmap");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -138,7 +138,7 @@ void retrace_open(json_object *jobj, bool is_open64)
 	 */
 	if (path_retrace.empty()) {
 		if (is_verbose()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "warning: can't find retrace device. Attempting to use: %s\n",
 			        path_trace.c_str());
 		}
@@ -161,7 +161,7 @@ void retrace_open(json_object *jobj, bool is_open64)
 		fd_retrace = open(path_retrace.c_str(), oflag, mode);
 
 	if (fd_retrace <= 0) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "cannot open: %s\n", path_retrace.c_str());
 		exit(fd_retrace);
 	}
@@ -175,7 +175,7 @@ void retrace_open(json_object *jobj, bool is_open64)
 		else
 			perror("open");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -198,7 +198,7 @@ void retrace_close(json_object *jobj)
 		fprintf(stderr, "fd: %d ", fd_retrace);
 		perror("close");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -315,7 +315,7 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
 		json_object_object_get_ex(buf_obj, "request_fd", &request_fd_obj);
 		buf->request_fd = (__s32) get_fd_retrace_from_fd_trace(json_object_get_int(request_fd_obj));
 		if (buf->request_fd < 0) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "bad or missing file descriptor\n");
 		}
 	}
@@ -353,7 +353,7 @@ void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args_user)
 		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
 		perror("VIDIOC_QUERYBUF");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -379,7 +379,7 @@ void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args_user)
 		        buftype2s((int) ptr->type).c_str(), ptr->index, fd_retrace);
 		perror("VIDIOC_QBUF");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -400,12 +400,12 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
 	int ret = poll(pfds, 1, poll_timeout_ms);
 	free(pfds);
 	if (ret == -1) {
-		fprintf(stderr, "%s:%s:%d: poll error: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: poll error: ", __FNAME__, __func__, __LINE__);
 		perror("");
 		exit(EXIT_FAILURE);
 	}
 	if (ret == 0) {
-		fprintf(stderr, "%s:%s:%d: poll timed out\n", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: poll timed out\n", __FNAME__, __func__, __LINE__);
 		exit(EXIT_FAILURE);
 	}
 
@@ -416,7 +416,7 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args_user)
 		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
 		perror("VIDIOC_DQBUF");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -439,7 +439,7 @@ void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args_user)
 		        buftype2s((int) buf->type).c_str(), buf->index, fd_retrace);
 		perror("VIDIOC_PREPARE_BUF");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -459,7 +459,7 @@ void retrace_vidioc_create_bufs(int fd_retrace, json_object *ioctl_args)
 	if (is_verbose() || (errno != 0)) {
 		perror("VIDIOC_CREATE_BUFS");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -744,7 +744,7 @@ __u32 *retrace_v4l2_dynamic_array(json_object *v4l2_ext_control_obj)
 
 	__u32 *ptr = static_cast<__u32 *>(calloc(elems, sizeof(__u32)));
 	if (ptr == nullptr) {
-		fprintf(stderr, "%s:%s:%d: memory allocation failed.\n", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: memory allocation failed.\n", __FNAME__, __func__, __LINE__);
 		return ptr;
 	}
 
@@ -875,7 +875,7 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
 		p->ptr = retrace_v4l2_ctrl_mpeg2_quantisation_gen(v4l2_ext_control_obj);
 		break;
 	default:
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "warning: cannot retrace control: %s\n",
 		        val2s(p->id, control_val_def).c_str());
 		break;
@@ -911,7 +911,7 @@ struct v4l2_ext_controls *retrace_v4l2_ext_controls(json_object *parent_obj)
 			int request_fd_trace = json_object_get_int(request_fd_obj);
 			int request_fd_retrace = get_fd_retrace_from_fd_trace(request_fd_trace);
 			if (request_fd_retrace < 0) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "bad file descriptor\n");
 				return ptr;
 			}
@@ -966,7 +966,7 @@ void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 	if (is_verbose() || (errno != 0)) {
 		perror("VIDIOC_S_EXT_CTRLS");
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_context();
 		}
 	}
@@ -1173,7 +1173,7 @@ void retrace_ioctl(json_object *syscall_obj)
 	json_object_object_get_ex(syscall_obj, "fd", &fd_trace_obj);
 	fd_retrace = get_fd_retrace_from_fd_trace(json_object_get_int(fd_trace_obj));
 	if (fd_retrace < 0) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "bad file descriptor\n");
 		return;
 	}
@@ -1310,7 +1310,7 @@ void retrace_ioctl(json_object *syscall_obj)
 		ioctl(fd_retrace, MEDIA_REQUEST_IOC_REINIT);
 		break;
 	default:
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "warning: cannot retrace ioctl");
 		if (json_object_get_string(cmd_obj) != nullptr)
 			fprintf(stderr, ": \'%s\'\n", json_object_get_string(cmd_obj));
@@ -1349,7 +1349,7 @@ void retrace_mem(json_object *mem_obj)
 		write_to_output_buffer(buffer_pointer, bytesused, mem_obj);
 
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "%s, bytesused: %d, offset: %d, addr: %ld\n",
 		        buftype2s(type).c_str(), bytesused, offset, buffer_address_retrace);
 		print_context();
@@ -1409,7 +1409,7 @@ void retrace_object(json_object *jobj)
 		return;
 	}
 
-	fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+	fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 	fprintf(stderr, "warning: unexpected JSON object in trace file.\n");
 }
 
@@ -1420,7 +1420,7 @@ void retrace_array(json_object *root_array_obj)
 	size_t json_objects_in_file = array_list_length(array_list_pointer);
 
 	if (json_objects_in_file < 3) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "warning: trace file may be empty.\n");
 	}
 
@@ -1434,7 +1434,7 @@ int retrace(std::string trace_filename)
 {
 	FILE *trace_file = fopen(trace_filename.c_str(), "r");
 	if (trace_file == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "Trace file error: \'%s\'\n", trace_filename.c_str());
 		return 1;
 	}
@@ -1445,7 +1445,7 @@ int retrace(std::string trace_filename)
 	json_object *root_array_obj = json_object_from_file(trace_filename.c_str());
 
 	if (root_array_obj == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "cannot get JSON-object from file: %s\n", trace_filename.c_str());
 		return 1;
 	}
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 0030272b..383a957f 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -20,7 +20,7 @@ bool is_video_or_media_device(const char *path)
 void add_device(int fd, std::string path)
 {
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "fd: %d, path: %s\n", fd, path.c_str());
 	}
 	std::pair<int, std::string> new_pair = std::make_pair(fd, path);
@@ -56,7 +56,7 @@ void print_decode_order(void)
 void set_decode_order(long decode_order)
 {
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "%ld\n", decode_order);
 	}
 
@@ -183,7 +183,7 @@ long get_buffer_bytesused_trace(int fd, __u32 offset)
 void set_buffer_display_order(int fd, __u32 offset, long display_order)
 {
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "%ld\n", display_order);
 	}
 	for (auto &b : ctx_trace.buffers) {
@@ -259,7 +259,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 		return;
 
 	if (is_debug())
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 
 	/*
 	 * Since userspace sends H264 frames out of order, get information
@@ -282,7 +282,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 			int pic_order_cnt_lsb = ctrl.p_h264_decode_params->pic_order_cnt_lsb;
 
 			if (is_debug()) {
-				fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "\tprev_pic_order_cnt_lsb: %d\n", prev_pic_order_cnt_lsb);
 				fprintf(stderr, "\tprev_pic_order_cnt_msb: %ld\n", prev_pic_order_cnt_msb);
 				fprintf(stderr, "\tpic_order_cnt_lsb: %d\n", pic_order_cnt_lsb);
@@ -314,7 +314,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 			}
 
 			if (is_debug()) {
-				fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "\tpic_order_cnt_msb: %ld\n", pic_order_cnt_msb);
 			}
 			ctx_trace.fmt.h264.pic_order_cnt_lsb = pic_order_cnt_lsb;
@@ -330,7 +330,7 @@ void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
 void qbuf_setup(struct v4l2_buffer *buf)
 {
 	if (is_debug()) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "%s, index: %d\n", buftype2s((int) buf->type).c_str(), buf->index);
 	}
 
@@ -366,7 +366,7 @@ void qbuf_setup(struct v4l2_buffer *buf)
 		set_buffer_display_order(buf_fd, buf_offset, get_decode_order());
 
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			print_decode_order();
 			print_buffers_trace();
 		}
@@ -377,7 +377,7 @@ void streamoff_cleanup(v4l2_buf_type buf_type)
 {
 
 	if (is_debug())
-		fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 	if (is_verbose() || (getenv("V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FILE") != nullptr)) {
 		fprintf(stderr, "VIDIOC_STREAMOFF: %s\n", buftype2s(buf_type).c_str());
 		fprintf(stderr, "%s, %s %s, width: %d, height: %d\n",
diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
index a393d0d4..138654af 100644
--- a/utils/v4l2-tracer/trace.cpp
+++ b/utils/v4l2-tracer/trace.cpp
@@ -182,7 +182,7 @@ void trace_mem_decoded(void)
 			if (it->bytesused < expected_length)
 				break;
 			if (is_debug()) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "displaying: %ld, %s, index: %d\n",
 				        it->display_order, buftype2s(it->type).c_str(), it->index);
 			}
@@ -418,7 +418,7 @@ void trace_v4l2_ext_control(void *arg, json_object *parent_obj, std::string key_
 		break;
 	default:
 		if (p->size) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "warning: cannot trace control: %s\n", val2s(p->id, control_val_def).c_str());
 		} else {
 			json_object_object_add(v4l2_ext_control_obj, "value", json_object_new_int(p->value));
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.cpp b/utils/v4l2-tracer/v4l2-tracer-common.cpp
index 869347a1..3f4609aa 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer-common.cpp
@@ -211,10 +211,10 @@ long s2number(const char *char_str)
 	try {
 		num = std::strtol(str.c_str(), nullptr, 0); /* base is auto-detected */
 	} catch (std::invalid_argument& ia) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "string \'%s\' is invalid\n", str.c_str());
 	} catch (std::out_of_range& oor) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "string \'%s\' is out of range\n", str.c_str());
 	}
 	return num;
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
index ab8b78e3..385cb1e9 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.h
+++ b/utils/v4l2-tracer/v4l2-tracer-common.h
@@ -39,6 +39,12 @@
 #define STRERR(x) strerror(x)
 #endif
 
+#ifndef __FILE_NAME__
+#define __FNAME__ __FILE__
+#else
+#define __FNAME__ __FILE_NAME__
+#endif
+
 struct val_def {
 	__s64 val;
 	const char *str;
diff --git a/utils/v4l2-tracer/v4l2-tracer.cpp b/utils/v4l2-tracer/v4l2-tracer.cpp
index e3f002a9..1c969510 100644
--- a/utils/v4l2-tracer/v4l2-tracer.cpp
+++ b/utils/v4l2-tracer/v4l2-tracer.cpp
@@ -14,7 +14,7 @@ pid_t tracee_pid = 0;
 
 void v4l2_tracer_sig_handler(int signum)
 {
-	fprintf(stderr, "%s:%s:%d: received: %d\n", __FILE__, __func__, __LINE__, signum);
+	fprintf(stderr, "%s:%s:%d: received: %d\n", __FNAME__, __func__, __LINE__, signum);
 	kill(tracee_pid, signum);
 	/* Wait for tracee to handle the signal first before v4l2-tracer exits. */
 	wait(nullptr);
@@ -80,7 +80,7 @@ int get_options(int argc, char *argv[])
 			try {
 				std::stoi(device_num, nullptr, 0);
 			} catch (std::exception& e) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "can't convert <dev> \'%s\' to integer\n", device_num.c_str());
 				return -1;
 			}
@@ -89,7 +89,7 @@ int get_options(int argc, char *argv[])
 				path_video += optarg;
 				setenv("V4L2_TRACER_OPTION_SET_VIDEO_DEVICE", path_video.c_str(), 0);
 			} else {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "cannot use device number\'%s\'\n", device_num.c_str());
 				return -1;
 			}
@@ -107,7 +107,7 @@ int get_options(int argc, char *argv[])
 			try {
 				std::stoi(device_num, nullptr, 0);
 			} catch (std::exception& e) {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "can't convert <dev> \'%s\' to integer\n", device_num.c_str());
 				return -1;
 			}
@@ -116,7 +116,7 @@ int get_options(int argc, char *argv[])
 				path_media += optarg;
 				setenv("V4L2_TRACER_OPTION_SET_MEDIA_DEVICE", path_media.c_str(), 0);
 			} else {
-				fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+				fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 				fprintf(stderr, "cannot use device number\'%s\'\n", device_num.c_str());
 				return -1;
 			}
@@ -150,7 +150,7 @@ int clean(std::string trace_filename)
 {
 	FILE *trace_file = fopen(trace_filename.c_str(), "r");
 	if (trace_file == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "cannot open \'%s\'\n", trace_filename.c_str());
 		return 1;
 	}
@@ -160,7 +160,7 @@ int clean(std::string trace_filename)
 	std::string clean_filename = "clean_" + trace_filename;
 	FILE *clean_file = fopen(clean_filename.c_str(), "w");
 	if (clean_file == nullptr) {
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "cannot open \'%s\'\n", clean_filename.c_str());
 		return 1;
 	}
@@ -215,7 +215,7 @@ int tracer(int argc, char *argv[], bool retrace)
 	if (retrace) {
 		std::string trace_file = argv[optind];
 		if (trace_file.find(".json") == std::string::npos) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "Trace file \'%s\' must have .json file extension\n",
 			        trace_file.c_str());
 			print_usage();
@@ -321,7 +321,7 @@ int tracer(int argc, char *argv[], bool retrace)
 	if (tracee_pid == 0) {
 
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "tracee: ");
 			for (int i = 0; i < exec_index; i++)
 				fprintf(stderr,"%s ", exec[i]);
@@ -330,7 +330,7 @@ int tracer(int argc, char *argv[], bool retrace)
 
 		execvpe(exec[0], (char* const*) exec, environ);
 
-		fprintf(stderr, "%s:%s:%d: ", __FILE__, __func__, __LINE__);
+		fprintf(stderr, "%s:%s:%d: ", __FNAME__, __func__, __LINE__);
 		fprintf(stderr, "could not execute application \'%s\'", exec[0]);
 		perror(" ");
 		return errno;
@@ -373,13 +373,13 @@ int main(int argc, char *argv[])
 
 	if (ret < 0) {
 		if (is_debug())
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 		return ret;
 	}
 
 	if (optind == argc) {
 		if (is_debug())
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 		print_usage();
 		return ret;
 	}
@@ -388,7 +388,7 @@ int main(int argc, char *argv[])
 
 	if (optind == argc) {
 		if (is_debug())
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 		print_usage();
 		return ret;
 	}
@@ -412,7 +412,7 @@ int main(int argc, char *argv[])
 		ret = clean (argv[optind]);
 	} else {
 		if (is_debug()) {
-			fprintf(stderr, "%s:%s:%d\n", __FILE__, __func__, __LINE__);
+			fprintf(stderr, "%s:%s:%d\n", __FNAME__, __func__, __LINE__);
 			fprintf(stderr, "tracee: ");
 			for (int i = 0; i < argc; i++)
 				fprintf(stderr,"%s ", argv[i]);
-- 
2.39.1

