Return-Path: <linux-media+bounces-47619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C06B6C7E783
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 22:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F59C345CE3
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 21:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494992673B7;
	Sun, 23 Nov 2025 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jriF4r3C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD058261B98
	for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763931772; cv=none; b=BB33y1uT167yysplDghaG59w8HtUDdeAZQmoyxnRnS/92aqhynz7U520N7onMnKJ5RW8YPqhM98UHIEc9+gvg0PjyJ9Lea34AXmCY0in1JKsy92FCu4M++KN0B/yrYKDSzLfmqdm/wPCALWMGrk2b/ilvgPxdhrFvtQVYmmXHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763931772; c=relaxed/simple;
	bh=hxzufESahS48J9qe4RxDVYXwkRS/DsW5pdksDexMURk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lUDfayuuVouNsCEpM3ECV9p3O394fpYIzUERFR0eKD/LNOrYdI40JD2SzzcG7T0aDG1G3+0xGw/ajYL+xU9Q3cWXHW/NhSA8QRiq63IIuoeNL3nHrowtPaMOKlhTq8BtOWUw3pFQjXFaofrNdrt8JvAMdBSM8kI2Fu2esT1hYoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jriF4r3C; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-882475d8851so43958696d6.2
        for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763931770; x=1764536570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8HKGPqpWw+NLxCdwrDd7XfSCOsLWUXQfs0Wb0Ps6NI=;
        b=jriF4r3CKlWv/kF3hEmjmC+e1YkDDnejnOE8FSjcf0OSfAfuJVrBEEJSd7u75DOCDH
         4piQLWYezds17ayOPDMsvC4ijdVDeyOL7F6Ikk4Pc+bCoSulh8ZyKln3ijFKwqYSYYQW
         CHl3AVfKDzdxW+CmZgUcorFz4QJERF4RCI2i5xvcbe9mkb/+hzSAep63HylMDUeGNxd3
         6NuYN4XTDqLtOHzNWsEFsCXd1+oUMzqyV+umiW458GwZMS438lFFgqr3E7PoU8z5Kuio
         IKy65q52VI3pX9o7NXWCtq7jCzal58vtQB5h/fwjUYyA6dTVdA+NAhhue2wPO51OmICa
         oE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763931770; x=1764536570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8HKGPqpWw+NLxCdwrDd7XfSCOsLWUXQfs0Wb0Ps6NI=;
        b=KLG1/U8tb4KPkVdKYAEb8P1VGx2Bcq8/A9s6uh+xXwtGY/8d0+tJZkt8+PbcB7uk+6
         AyZG2lC4//AmI/S86s469lxh/OizuM6RmoXEcSlvNTdWtnxwEO7GY2OqQbPZnG+qtfq8
         QiGoye7ut+VBtVsmAc2bMPMpX8y9sD5/wV66LITPyZjsrZ9BWLnf+1zUGJdUqbN5Y3Gg
         85TbpkzZnFoh/gRsae5ClcU0BXDhJOAO/E2/oAcsm459Vwei6LB9wGvWwILaT2sLoKZr
         GOK3XK70DtIc8iC4MSa0TUciKUrcNIQU1+FtLcyRNEZLYGvJvek6+Vvgw9CtMwT4/Gc+
         0rdw==
X-Gm-Message-State: AOJu0Yz35bpupfCOd8MPHBwarjlp51e+WnsVDpV4u3xqwXvK0/wx+AXy
	SIF/sn5VV3XOKN5zlxvp9kfmyUF0i6dwmXDEzfREOH7NSk0mXDj46GcMlj6FEw==
X-Gm-Gg: ASbGncs2/Sj9i+MpUwDHQPDzXn4RmC4dQPjcdNW2ZAOzNoIHKcn5xs42IPUQs+OYb++
	sc/QZseREzrx80t7fQgkvJMRH7UFxwa3Ik0c8uuaYSz7Z/SOwwLa+ujrRPiVeqluy4X2gaeruLE
	QQRMxVI2NlbKN3ATxyKjBA8ulRQ8Qd6eTMqcqo1hgHvHPp6vFOvkf+6HWYzkqFcwRpA+i8yum7q
	0246U2P9EHlUvtuSE4GjRQyZ6IEQ5LnEXbMVqxkKYTjTM0i/cupJBguhgC9Tc3oEkQDj1EVAJay
	cxwb8o+l/CUSdeaqFnHPn8CQ8U2xsapd+y/fCv9Jhw4Qb8tq+XwexP2SWMX96zy9rQ+QV9DCAuK
	4iNWIHSz5XNV0mBn5HBYqBoA82KW6kvF4LNg/wIdrmZau4WgaHSovPDrFZAhbmt+HQT91
X-Google-Smtp-Source: AGHT+IEpruYS93dD/6AelRJMD+toaEG0rJhAEFwo2OA1w8gZU/cK+ApfXgVTCPEPafMqq0oY6kAP9Q==
X-Received: by 2002:a05:6214:5d0b:b0:880:42a7:772c with SMTP id 6a1803df08f44-8847c52d14bmr143173596d6.54.1763931769488;
        Sun, 23 Nov 2025 13:02:49 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54c84esm84549206d6.30.2025.11.23.13.02.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 13:02:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH] v4l2-tracer: unique_ptr conversions
Date: Sun, 23 Nov 2025 13:02:31 -0800
Message-ID: <20251123210231.11605-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to manually free.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-tracer/retrace.cpp | 84 +++++++++++++----------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index d65ecd3d..8419b2ce 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -5,6 +5,8 @@
 
 #include "retrace.h"
 
+#include <memory>
+
 extern struct retrace_context ctx_retrace;
 
 void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
@@ -226,9 +228,9 @@ struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memory)
 	return ptr;
 }
 
-struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
+std::unique_ptr<v4l2_buffer> retrace_v4l2_buffer(json_object *ioctl_args)
 {
-	struct v4l2_buffer *buf = (struct v4l2_buffer *) calloc(1, sizeof(struct v4l2_buffer));
+	std::unique_ptr<v4l2_buffer> buf(new v4l2_buffer{});
 
 	json_object *buf_obj;
 	json_object_object_get_ex(ioctl_args, "v4l2_buffer", &buf_obj);
@@ -311,9 +313,9 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
 
 void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
+	auto buf = retrace_v4l2_buffer(ioctl_args);
 
-	ioctl(fd_retrace, VIDIOC_QUERYBUF, buf);
+	ioctl(fd_retrace, VIDIOC_QUERYBUF, buf.get());
 
 	if (buf->memory == V4L2_MEMORY_MMAP) {
 		__u32 offset = 0;
@@ -342,15 +344,13 @@ void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args)
 		debug_line_info();
 		print_context();
 	}
-
-	free(buf);
 }
 
 void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *ptr = retrace_v4l2_buffer(ioctl_args);
+	auto ptr = retrace_v4l2_buffer(ioctl_args);
 
-	ioctl(fd_retrace, VIDIOC_QBUF, ptr);
+	ioctl(fd_retrace, VIDIOC_QBUF, ptr.get());
 
 	if (ptr->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 	    ptr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -367,13 +367,11 @@ void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args)
 		debug_line_info();
 		print_context();
 	}
-
-	free(ptr);
 }
 
 void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
+	auto buf = retrace_v4l2_buffer(ioctl_args);
 
 	const int poll_timeout_ms = 5000;
 	struct pollfd *pfds = (struct pollfd *) calloc(1, sizeof(struct pollfd));
@@ -393,7 +391,7 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args)
 		exit(EXIT_FAILURE);
 	}
 
-	ioctl(fd_retrace, VIDIOC_DQBUF, buf);
+	ioctl(fd_retrace, VIDIOC_DQBUF, buf.get());
 
 	if (is_verbose() || (errno != 0)) {
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
@@ -407,15 +405,13 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args)
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 			free(buf->m.planes);
-
-	free(buf);
 }
 
 void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
+	auto buf = retrace_v4l2_buffer(ioctl_args);
 
-	ioctl(fd_retrace, VIDIOC_PREPARE_BUF, buf);
+	ioctl(fd_retrace, VIDIOC_PREPARE_BUF, buf.get());
 
 	if (is_verbose() || (errno != 0)) {
 		fprintf(stderr, "%s, index: %d, fd: %d, ",
@@ -429,8 +425,6 @@ void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args)
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 			free(buf->m.planes);
-
-	free(buf);
 }
 
 void retrace_vidioc_create_bufs(int fd_retrace, json_object *ioctl_args)
@@ -541,9 +535,9 @@ void retrace_vidioc_s_fmt(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
-struct v4l2_streamparm *retrace_v4l2_streamparm(json_object *parent_obj, const std::string& key_name = "")
+std::unique_ptr<v4l2_streamparm> retrace_v4l2_streamparm(json_object *parent_obj, const std::string& key_name = "")
 {
-	struct v4l2_streamparm *ptr = (struct v4l2_streamparm *) calloc(1, sizeof(v4l2_streamparm));
+	std::unique_ptr<v4l2_streamparm> ptr(new v4l2_streamparm{});
 
 	json_object *v4l2_streamparm_obj;
 	json_object_object_get_ex(parent_obj, "v4l2_streamparm", &v4l2_streamparm_obj);
@@ -563,24 +557,20 @@ struct v4l2_streamparm *retrace_v4l2_streamparm(json_object *parent_obj, const s
 
 void retrace_vidioc_g_parm (int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_streamparm *ptr = retrace_v4l2_streamparm(ioctl_args);
-	ioctl(fd_retrace, VIDIOC_G_PARM, ptr);
+	auto ptr = retrace_v4l2_streamparm(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_PARM, ptr.get());
 
 	if (is_verbose() || (errno != 0))
 		perror("VIDIOC_G_PARM");
-
-	free(ptr);
 }
 
 void retrace_vidioc_s_parm (int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_streamparm *ptr = retrace_v4l2_streamparm(ioctl_args);
-	ioctl(fd_retrace, VIDIOC_S_PARM, ptr);
+	auto ptr = retrace_v4l2_streamparm(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_S_PARM, ptr.get());
 
 	if (is_verbose() || (errno != 0))
 		perror("VIDIOC_S_PARM");
-
-	free(ptr);
 }
 
 void retrace_vidioc_queryctrl(int fd_retrace, json_object *ioctl_args)
@@ -897,9 +887,9 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
 	return p;
 }
 
-struct v4l2_ext_controls *retrace_v4l2_ext_controls(json_object *parent_obj)
+std::unique_ptr<v4l2_ext_controls> retrace_v4l2_ext_controls(json_object *parent_obj)
 {
-	struct v4l2_ext_controls *ptr = (struct v4l2_ext_controls *) calloc(1, sizeof(v4l2_ext_controls));
+	std::unique_ptr<v4l2_ext_controls> ptr(new v4l2_ext_controls{});
 
 	json_object *v4l2_ext_controls_obj;
 	json_object_object_get_ex(parent_obj, "v4l2_ext_controls", &v4l2_ext_controls_obj);
@@ -948,10 +938,8 @@ struct v4l2_ext_controls *retrace_v4l2_ext_controls(json_object *parent_obj)
 
 void retrace_vidioc_try_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
-	ioctl(fd_retrace, VIDIOC_TRY_EXT_CTRLS, ptr);
-
-	free(ptr);
+	auto ptr = retrace_v4l2_ext_controls(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_TRY_EXT_CTRLS, ptr.get());
 
 	if (is_verbose() || (errno != 0))
 		perror("VIDIOC_TRY_EXT_CTRLS");
@@ -959,10 +947,8 @@ void retrace_vidioc_try_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 
 void retrace_vidioc_g_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
-	ioctl(fd_retrace, VIDIOC_G_EXT_CTRLS, ptr);
-
-	free(ptr);
+	auto ptr = retrace_v4l2_ext_controls(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_G_EXT_CTRLS, ptr.get());
 
 	if (is_verbose() || (errno != 0))
 		perror("VIDIOC_G_EXT_CTRLS");
@@ -970,10 +956,8 @@ void retrace_vidioc_g_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 
 void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
-	ioctl(fd_retrace, VIDIOC_S_EXT_CTRLS, ptr);
-
-	free(ptr);
+	auto ptr = retrace_v4l2_ext_controls(ioctl_args);
+	ioctl(fd_retrace, VIDIOC_S_EXT_CTRLS, ptr.get());
 
 	if (is_verbose() || (errno != 0)) {
 		perror("VIDIOC_S_EXT_CTRLS");
@@ -1056,9 +1040,9 @@ void retrace_vidioc_s_selection(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
-struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
+std::unique_ptr<v4l2_decoder_cmd> retrace_v4l2_decoder_cmd(json_object *parent_obj)
 {
-	struct v4l2_decoder_cmd *ptr = (struct v4l2_decoder_cmd *) calloc(1, sizeof(v4l2_decoder_cmd));
+	std::unique_ptr<v4l2_decoder_cmd> ptr(new v4l2_decoder_cmd{});
 
 	json_object *v4l2_decoder_cmd_obj;
 	json_object_object_get_ex(parent_obj, "v4l2_decoder_cmd", &v4l2_decoder_cmd_obj);
@@ -1121,14 +1105,12 @@ struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
 
 void retrace_vidioc_try_decoder_cmd(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_decoder_cmd *ptr = retrace_v4l2_decoder_cmd(ioctl_args);
+	auto ptr = retrace_v4l2_decoder_cmd(ioctl_args);
 
-	ioctl(fd_retrace, VIDIOC_TRY_DECODER_CMD, ptr);
+	ioctl(fd_retrace, VIDIOC_TRY_DECODER_CMD, ptr.get());
 
 	if (is_verbose() || (errno != 0))
 		perror("VIDIOC_TRY_DECODER_CMD");
-
-	free (ptr);
 }
 
 void retrace_vidioc_dqevent(int fd_retrace)
@@ -1188,14 +1170,12 @@ void retrace_vidioc_unsubscribe(int fd_retrace, json_object *ioctl_args)
 
 void retrace_vidioc_decoder_cmd(int fd_retrace, json_object *ioctl_args)
 {
-	struct v4l2_decoder_cmd *ptr = retrace_v4l2_decoder_cmd(ioctl_args);
+	auto ptr = retrace_v4l2_decoder_cmd(ioctl_args);
 
-	ioctl(fd_retrace, VIDIOC_DECODER_CMD, ptr);
+	ioctl(fd_retrace, VIDIOC_DECODER_CMD, ptr.get());
 
 	if (is_verbose() || (errno != 0))
 		perror("VIDIOC_DECODER_CMD");
-
-	free (ptr);
 }
 
 void retrace_vidioc_query_ext_ctrl(int fd_retrace, json_object *ioctl_args)
-- 
2.52.0


