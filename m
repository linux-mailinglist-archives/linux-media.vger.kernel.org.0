Return-Path: <linux-media+bounces-295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC27EA440
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 21:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBCB9280F3D
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 20:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EC624207;
	Mon, 13 Nov 2023 20:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Mcf38vjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE54241E8
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 20:06:51 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8231ED79
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:06:50 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 910AB6602F3A;
	Mon, 13 Nov 2023 20:06:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699906009;
	bh=148OhClNazZ0HMUSCDg7M4JBnQ3/Oq+Q8DDM6a9gn7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mcf38vjZTIcFw8+D4A7nVhsJ0Z9OjsfYsYV62qee/xbiRnq2po46yY9INWjHKulHe
	 MisOOfw/CCaztQ+Age8r4BGhJYeGwsUZlDyxYaCGjEu0S0sQVibct/27+IvOlf/rH2
	 55m/iovZtaAS6xJsLRa+POfsUexGhlxN50y77vBrZelYNY76+f8VByDvO+9NA74U6g
	 /f5HcHETWOj7+d6tWrHi5w9ynPANerVaiApPnw0Ftf4ggOGtUuKb3sP5JxCdPRMM7b
	 bNi0h7+2pfkniRIOtHLjOxunEaoLXHgwYFbrK9wen7f71vPRgHbrCVKHodZ7hiA/8K
	 foOpO1VFN+8uw==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 3/8] v4l2-tracer: remove buffers by type and index
Date: Mon, 13 Nov 2023 12:06:14 -0800
Message-ID: <bc3c68c1eb8c76f7435feb01a94cb01d98069fcb.1699904350.git.deborah.brouwer@collabora.com>
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

Currently duplicate buffers are identified for removal by file descriptor,
but if the buffers were added by QUERYBUF then they will all have the same
file descriptor and the wrong buffer might be removed. So, instead,
identify duplicate buffers for removal by type and index.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/retrace-helper.cpp | 4 ++--
 utils/v4l2-tracer/retrace.cpp        | 2 +-
 utils/v4l2-tracer/retrace.h          | 2 +-
 utils/v4l2-tracer/trace-helper.cpp   | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/utils/v4l2-tracer/retrace-helper.cpp b/utils/v4l2-tracer/retrace-helper.cpp
index 3c68986f..db24c667 100644
--- a/utils/v4l2-tracer/retrace-helper.cpp
+++ b/utils/v4l2-tracer/retrace-helper.cpp
@@ -41,10 +41,10 @@ void add_buffer_retrace(int fd, __u32 type, __u32 index, __u32 offset)
 	ctx_retrace.buffers.push_front(buf);
 }
 
-void remove_buffer_retrace(int fd)
+void remove_buffer_retrace(__u32 type, __u32 index)
 {
 	for (auto it = ctx_retrace.buffers.begin(); it != ctx_retrace.buffers.end(); ++it) {
-		if (it->fd == fd) {
+		if ((it->type == type) && (it->index == index)) {
 			ctx_retrace.buffers.erase(it);
 			break;
 		}
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 1bec635d..b2b4afbf 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -460,7 +460,7 @@ void retrace_vidioc_expbuf(int fd_retrace, json_object *ioctl_args_user, json_ob
 	 */
 	int fd_found_in_retrace_context = get_buffer_fd_retrace(ptr->type, ptr->index);
 	if (fd_found_in_retrace_context != -1)
-		remove_buffer_retrace(fd_found_in_retrace_context);
+		remove_buffer_retrace(ptr->type, ptr->index);
 
 	add_buffer_retrace(buf_fd_retrace, ptr->type, ptr->index);
 
diff --git a/utils/v4l2-tracer/retrace.h b/utils/v4l2-tracer/retrace.h
index 01157336..87a0417e 100644
--- a/utils/v4l2-tracer/retrace.h
+++ b/utils/v4l2-tracer/retrace.h
@@ -30,7 +30,7 @@ int retrace(std::string trace_filename);
 bool buffer_in_retrace_context(int fd, __u32 offset = 0);
 int get_buffer_fd_retrace(__u32 type, __u32 index);
 void add_buffer_retrace(int fd, __u32 type, __u32 index, __u32 offset = 0);
-void remove_buffer_retrace(int fd);
+void remove_buffer_retrace(__u32 type, __u32 index);
 void set_buffer_address_retrace(int fd, __u32 offset, long address_trace, long address_retrace);
 long get_retrace_address_from_trace_address(long address_trace);
 void add_fd(int fd_trace, int fd_retrace);
diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index a1e83a44..b6336313 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -85,10 +85,10 @@ void add_buffer_trace(int fd, __u32 type, __u32 index, __u32 offset = 0)
 	ctx_trace.buffers.push_front(buf);
 }
 
-void remove_buffer_trace(int fd)
+void remove_buffer_trace(__u32 type, __u32 index)
 {
 	for (auto it = ctx_trace.buffers.begin(); it != ctx_trace.buffers.end(); ++it) {
-		if (it->fd == fd) {
+		if ((it->type == type) && (it->index == index)) {
 			ctx_trace.buffers.erase(it);
 			break;
 		}
@@ -420,7 +420,7 @@ void expbuf_setup(struct v4l2_exportbuffer *export_buffer)
 	 * file descriptor, replace the video fd with the more specific buffer fd from EXPBUF.
 	 */
 	if (fd_found_in_trace_context != 0)
-		remove_buffer_trace(fd_found_in_trace_context);
+		remove_buffer_trace(type, index);
 
 	add_buffer_trace(export_buffer->fd, type, index);
 }
-- 
2.41.0


