Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633B82487EF
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHROlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:41:11 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51055 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726145AbgHROlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:41:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82nJkV9ypuuXO82nKkcg84; Tue, 18 Aug 2020 16:40:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761658; bh=tkjIK3vdppNsy29AoNRMfUnZGZc9sgOnf+1cA4uc0Rs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tHRzq7FKAcEX8Ou/oJ4ycsSgWHl3dE/+2ECQse0Z7/dE/yjZIAXVHHbwohIT2ijX1
         oipGRqZ4XNEs0UpWHlfV4fHlqjY9v9uSLYMl69AMKwKInK5dURkifm8U/z/yJcU55L
         SrZH5j2+9+wY5N+L8YQ8bM8DEdgzxVJ76ZIq/855/A4u9acjD6OT7p8dEm/Dov2hBa
         ONY1eOx3h9Grr06Bt7/3MzQVqjpie6B4dJxDjVc+TY4piwEFDBGQSxT7N4SdtovZo2
         eCSYrGvOyRx9hnhwiUJVXxoSaG9Eu6p5W6BzzQ0z8hKaoEg3d/UJd65iilj6JF8Hpm
         NzH+ANiMeuqkA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH] v4l-utils: add support for read-only requests
Message-ID: <c683aa8a-a756-819b-85bd-551d99c69616@xs4all.nl>
Date:   Tue, 18 Aug 2020 16:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEvkgLBGVYH2WUHwSJkSvShe8MtW/0mK+D2+g36AdpUNQ1VfsVOismD0NTg3f78IajweH03N20wi4y0EXOe0Ov+0ViqDeNHiC4DOxTHD+Lw3xxEDj+BK
 db6iJWgXgHnwU+jU/EVQM15uQOUamVA5ss+k12s5VRihp7muiyj2mAG2YWDU/ORX5HOycRcgjlzuLVCvs4EovzWE1Lg03lWkINRlJ1NfZPSbwLGUqHDs2Ueo
 6tl2G66yDXcaXYh+PllWJu/ZubN2o/Dr1BZtZ1OlMW/KiaC6qqkMUS8Cjj8bMe+4qd81DJaI/gc7YLSlRqJB+nYnWBVoQPMjOqpZGv3IRqDwa7VF4j+tW2uL
 3LBnN70j
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an RFC patch only, and will have to be split up in multiple patches before
it can be merged.

This adds support for read-only requests to v4l2-ctl and v4l2-compliance. It also
adds new v4l2-ctl options to report either all controls or only read-only controls
contained in a completed request.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index 4121ea0c..6d549530 100644
--- a/contrib/freebsd/include/linux/videodev2.h
+++ b/contrib/freebsd/include/linux/videodev2.h
@@ -974,6 +974,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS		(1 << 7)

 /**
  * struct v4l2_plane - plane info for multi-planar buffers
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 26b87f6d..50895990 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -940,6 +940,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS		(1 << 7)

 /**
  * struct v4l2_plane - plane info for multi-planar buffers
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 6295054a..7e2f2076 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -765,6 +765,30 @@ public:
 	{
 		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt, flags);
 	}
+	bool has_requests() const
+	{
+		return v4l_queue_has_requests(this);
+	}
+	int g_request_fd(unsigned index) const
+	{
+		return v4l_queue_g_request_fd(this, index);
+	}
+	int create_requests(int media_fd)
+	{
+		return v4l_queue_create_requests(this, media_fd);
+	}
+	void free_requests()
+	{
+		v4l_queue_free_requests(this);
+	}
+	int reinit_request(unsigned b)
+	{
+		return v4l_queue_reinit_request(this, b);
+	}
+	void free_request(unsigned b)
+	{
+		v4l_queue_free_request(this, b);
+	}
 	int mmap_bufs(cv4l_fd *fd, unsigned from = 0)
 	{
 		return v4l_queue_mmap_bufs(fd->g_v4l_fd(), this, from);
@@ -813,6 +837,10 @@ public:
 	{
 		v4l_queue_buffer_update(this, &buf, index);
 	}
+	int buffer_queue_request(cv4l_fd *fd, v4l_buffer &buf)
+	{
+		return v4l_queue_buffer_queue_request(fd->g_v4l_fd(), this, &buf);
+	}
 	int queue_all(cv4l_fd *fd);
 };

@@ -903,7 +931,7 @@ inline int cv4l_queue::queue_all(cv4l_fd *fd)

 	for (unsigned i = 0; i < g_buffers(); i++) {
 		buf.init(*this, i);
-		int ret = fd->qbuf(buf);
+		int ret = buffer_queue_request(fd, buf);
 		if (ret)
 			return ret;
 	}
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index e093e717..f614c31d 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -9,7 +9,6 @@
 #ifndef _V4L_HELPERS_H_
 #define _V4L_HELPERS_H_

-#include <linux/videodev2.h>
 #include <string.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -20,6 +19,8 @@
 #include <fcntl.h>
 #include <sys/mman.h>
 #include <errno.h>
+#include <linux/media.h>
+#include <linux/videodev2.h>

 #ifdef __cplusplus
 extern "C" {
@@ -1415,6 +1416,8 @@ struct v4l_queue {
 	void *mmappings[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
 	unsigned long userptrs[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
 	int fds[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
+	int request_fds[VIDEO_MAX_FRAME];
+	bool has_requests;
 };

 static inline void v4l_queue_init(struct v4l_queue *q,
@@ -1425,9 +1428,11 @@ static inline void v4l_queue_init(struct v4l_queue *q,
 	memset(q, 0, sizeof(*q));
 	q->type = type;
 	q->memory = memory;
-	for (i = 0; i < VIDEO_MAX_FRAME; i++)
+	for (i = 0; i < VIDEO_MAX_FRAME; i++) {
+		q->request_fds[i] = -1;
 		for (p = 0; p < VIDEO_MAX_PLANES; p++)
 			q->fds[i][p] = -1;
+	}
 }

 static inline unsigned v4l_queue_g_type(const struct v4l_queue *q) { return q->type; }
@@ -1571,6 +1576,60 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	return v4l_queue_querybufs(f, q, q->buffers - createbufs.count);
 }

+static inline int v4l_queue_g_request_fd(const struct v4l_queue *q, unsigned index)
+{
+	return q->request_fds[index];
+}
+
+static inline bool v4l_queue_has_requests(const struct v4l_queue *q)
+{
+	return q->has_requests;
+}
+
+static inline void v4l_queue_free_request(struct v4l_queue *q, unsigned index)
+{
+	if (index < v4l_queue_g_buffers(q) && q->request_fds[index] >= 0) {
+		close(q->request_fds[index]);
+		q->request_fds[index] = -1;
+	}
+}
+
+static inline void v4l_queue_free_requests(struct v4l_queue *q)
+{
+	unsigned b;
+
+	for (b = 0; b < v4l_queue_g_buffers(q) && q->request_fds[b] >= 0; b++) {
+		close(q->request_fds[b]);
+		q->request_fds[b] = -1;
+	}
+	q->has_requests = false;
+}
+
+static inline int v4l_queue_create_requests(struct v4l_queue *q, int media_fd)
+{
+	unsigned b;
+	int ret = 0;
+
+	for (b = 0; b < v4l_queue_g_buffers(q); b++) {
+		int ret = ioctl(media_fd, MEDIA_IOC_REQUEST_ALLOC, &q->request_fds[b]);
+
+		if (ret)
+			break;
+	}
+	if (ret)
+		v4l_queue_free_requests(q);
+	else
+		q->has_requests = true;
+	return ret;
+}
+
+static inline int v4l_queue_reinit_request(struct v4l_queue *q, unsigned b)
+{
+	if (q->request_fds[b] >= 0)
+		return ioctl(q->request_fds[b], MEDIA_REQUEST_IOC_REINIT, NULL);
+	return 0;
+}
+
 static inline int v4l_queue_mmap_bufs(struct v4l_fd *f,
 		struct v4l_queue *q, unsigned from)
 {
@@ -1732,6 +1791,7 @@ static inline void v4l_queue_free(struct v4l_fd *f, struct v4l_queue *q)
 {
 	v4l_ioctl(f, VIDIOC_STREAMOFF, &q->type);
 	v4l_queue_release_bufs(f, q, 0);
+	v4l_queue_free_requests(q);
 	v4l_queue_close_exported_fds(q);
 	v4l_queue_reqbufs(f, q, 0, 0);
 }
@@ -1767,7 +1827,23 @@ static inline void v4l_queue_buffer_init(const struct v4l_queue *q, struct v4l_b
 	v4l_queue_buffer_update(q, buf, index);
 }

-static inline int v4l_query_ext_ctrl(v4l_fd *f, struct v4l2_query_ext_ctrl *qec,
+static inline int v4l_queue_buffer_queue_request(struct v4l_fd *f, struct v4l_queue *q, struct v4l_buffer *buf)
+{
+	unsigned b = v4l_buffer_g_index(buf);
+	int req_fd = q->request_fds[b];
+	int ret;
+
+	if (req_fd >= 0) {
+		v4l_buffer_s_request_fd(buf, req_fd);
+		v4l_buffer_or_flags(buf, V4L2_BUF_FLAG_REQUEST_FD);
+	}
+	ret = v4l_buffer_qbuf(f, buf);
+	if (!ret && req_fd >= 0)
+		ret = ioctl(req_fd, MEDIA_REQUEST_IOC_QUEUE, NULL);
+	return ret;
+}
+
+static inline int v4l_query_ext_ctrl(struct v4l_fd *f, struct v4l2_query_ext_ctrl *qec,
 		bool next_ctrl, bool next_compound)
 {
 	struct v4l2_queryctrl qc;
@@ -1839,7 +1915,7 @@ static inline int v4l_query_ext_ctrl(v4l_fd *f, struct v4l2_query_ext_ctrl *qec,
 	return 0;
 }

-static inline int v4l_g_ext_ctrls(v4l_fd *f, struct v4l2_ext_controls *ec)
+static inline int v4l_g_ext_ctrls(struct v4l_fd *f, struct v4l2_ext_controls *ec)
 {
 	unsigned i;

@@ -1860,7 +1936,7 @@ static inline int v4l_g_ext_ctrls(v4l_fd *f, struct v4l2_ext_controls *ec)
 	return 0;
 }

-static inline int v4l_s_ext_ctrls(v4l_fd *f, struct v4l2_ext_controls *ec)
+static inline int v4l_s_ext_ctrls(struct v4l_fd *f, struct v4l2_ext_controls *ec)
 {
 	unsigned i;

@@ -1880,7 +1956,7 @@ static inline int v4l_s_ext_ctrls(v4l_fd *f, struct v4l2_ext_controls *ec)
 	return 0;
 }

-static inline int v4l_try_ext_ctrls(v4l_fd *f, struct v4l2_ext_controls *ec)
+static inline int v4l_try_ext_ctrls(struct v4l_fd *f, struct v4l2_ext_controls *ec)
 {
 	unsigned i;

@@ -1905,7 +1981,7 @@ static inline int v4l_try_ext_ctrls(v4l_fd *f, struct v4l2_ext_controls *ec)
 	return 0;
 }

-static inline int v4l_g_selection(v4l_fd *f, struct v4l2_selection *sel)
+static inline int v4l_g_selection(struct v4l_fd *f, struct v4l2_selection *sel)
 {
 	struct v4l2_cropcap cc;
 	struct v4l2_crop crop;
@@ -1951,7 +2027,7 @@ static inline int v4l_g_selection(v4l_fd *f, struct v4l2_selection *sel)
 	}
 }

-static inline int v4l_s_selection(v4l_fd *f, struct v4l2_selection *sel)
+static inline int v4l_s_selection(struct v4l_fd *f, struct v4l2_selection *sel)
 {
 	struct v4l2_crop crop;
 	int ret;
@@ -2003,7 +2079,7 @@ static inline void v4l_frame_selection(struct v4l2_selection *sel, bool to_frame
 	}
 }

-static inline int v4l_g_frame_selection(v4l_fd *f, struct v4l2_selection *sel, __u32 field)
+static inline int v4l_g_frame_selection(struct v4l_fd *f, struct v4l2_selection *sel, __u32 field)
 {
 	int ret = v4l_g_selection(f, sel);

@@ -2012,7 +2088,7 @@ static inline int v4l_g_frame_selection(v4l_fd *f, struct v4l2_selection *sel, _
 	return ret;
 }

-static inline int v4l_s_frame_selection(v4l_fd *f, struct v4l2_selection *sel, __u32 field)
+static inline int v4l_s_frame_selection(struct v4l_fd *f, struct v4l2_selection *sel, __u32 field)
 {
 	int ret;

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 16be409a..dc88c2f1 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -207,6 +207,7 @@ static const flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
+	{ V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS, "ro-requests" },
 	{ 0, NULL }
 };

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index fa941a14..57ad3068 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1269,7 +1269,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.has_enc_cap_frame_interval = false;
 		node.valid_buftypes = 0;
 		node.valid_memorytype = 0;
-		node.buf_caps = 0;
+		node.buf_caps[0] = 0;
+		node.buf_caps[1] = 0;
 		for (auto &buftype_pixfmt : node.buftype_pixfmts)
 			buftype_pixfmt.clear();

diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 38a4ded3..4a214b2d 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -135,7 +135,7 @@ struct base_node {
 	int frame_interval_pad;
 	int enum_frame_interval_pad;
 	__u32 fbuf_caps;
-	__u32 buf_caps;
+	__u32 buf_caps[2]; // [0] = capture, [1] = output buffer caps
 	const char *bus_info;
 	pixfmt_map buftype_pixfmts[V4L2_BUF_TYPE_LAST + 1];
 	frmsizes_set frmsizes;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 5df71b80..ccfe0715 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -580,7 +580,7 @@ int testReqBufs(struct node *node)
 		fail_on_test(ret && ret != EINVAL);
 		mmap_valid = !ret;
 		if (mmap_valid)
-			node->buf_caps = caps = q.g_capabilities();
+			node->buf_caps[V4L2_TYPE_IS_OUTPUT(i)] = caps = q.g_capabilities();
 		if (caps) {
 			fail_on_test(mmap_valid ^ !!(caps & V4L2_BUF_CAP_SUPPORTS_MMAP));
 			if (caps & V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS)
@@ -1962,8 +1962,10 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
 	return 0;
 }

-int testRequests(struct node *node, bool test_streaming)
+static int testRequestsType(struct node *node, bool test_streaming, int type)
 {
+	const unsigned int req_buf_caps = V4L2_BUF_CAP_SUPPORTS_REQUESTS |
+					  V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS;
 	filehandles fhs;
 	int media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
 	int req_fd;
@@ -1972,10 +1974,19 @@ int testRequests(struct node *node, bool test_streaming)
 	v4l2_ext_controls ctrls;
 	v4l2_ext_control ctrl;
 	bool have_controls;
+	bool is_output = V4L2_TYPE_IS_OUTPUT(type);
+	__u32 buf_caps = node->buf_caps[is_output];
+	__u32 inv_buf_caps = node->is_m2m ? node->buf_caps[!is_output] : 0;
+	bool supports_requests = buf_caps & req_buf_caps;
+	bool supports_ro_requests = buf_caps & V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS;
+	bool supports_inv_requests = inv_buf_caps & req_buf_caps;
 	int ret;

-	if (node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS)
+	if (supports_requests)
 		fail_on_test(media_fd < 0);
+	fail_on_test((buf_caps & req_buf_caps) == req_buf_caps);
+	fail_on_test((inv_buf_caps & req_buf_caps) == req_buf_caps);
+	fail_on_test(buf_caps & inv_buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);

 	memset(&valid_qctrl, 0, sizeof(valid_qctrl));
 	memset(&ctrls, 0, sizeof(ctrls));
@@ -1999,8 +2010,7 @@ int testRequests(struct node *node, bool test_streaming)

 	if (ctrl.id == 0) {
 		info("could not test the Request API, no suitable control found\n");
-		return (node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS) ?
-			0 : ENOTTY;
+		return supports_requests ? 0 : ENOTTY;
 	}

 	ctrls.which = V4L2_CTRL_WHICH_REQUEST_VAL;
@@ -2009,7 +2019,7 @@ int testRequests(struct node *node, bool test_streaming)
 	have_controls = ret != ENOTTY;

 	if (media_fd < 0 || ret == EBADR) {
-		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
+		fail_on_test(supports_requests);
 		return ENOTTY;
 	}
 	if (have_controls) {
@@ -2018,7 +2028,7 @@ int testRequests(struct node *node, bool test_streaming)
 	}
 	ret = doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &req_fd);
 	if (ret == ENOTTY) {
-		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
+		fail_on_test(supports_requests);
 		return ENOTTY;
 	}
 	fail_on_test(ret);
@@ -2069,9 +2079,6 @@ int testRequests(struct node *node, bool test_streaming)
 	fhs.del(media_fd);
 	node->reopen();

-	int type = node->g_type();
-	if (node->is_m2m)
-		type = v4l_type_invert(type);
 	if (v4l_type_is_vbi(type)) {
 		cv4l_fmt fmt;

@@ -2080,10 +2087,9 @@ int testRequests(struct node *node, bool test_streaming)
 	}

 	if (!(node->valid_buftypes & (1 << type))) {
-		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
+		fail_on_test(supports_requests);
 		return ENOTTY;
 	}
-	bool supports_requests = node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS;

 	buffer_info.clear();

@@ -2103,8 +2109,8 @@ int testRequests(struct node *node, bool test_streaming)

 	for (unsigned i = 0; i < num_requests; i++) {
 		fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &buf_req_fds[i]));
-		fhs.add(buf_req_fds[i]);
 		fail_on_test(buf_req_fds[i] < 0);
+		fhs.add(buf_req_fds[i]);
 		fail_on_test(!doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0));
 	}
 	fhs.del(media_fd);
@@ -2134,9 +2140,11 @@ int testRequests(struct node *node, bool test_streaming)
 		buffer buf(m2m_q);

 		fail_on_test(buf.querybuf(node, 0));
-		buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
-		buf.s_request_fd(buf_req_fds[0]);
-		fail_on_test(!buf.qbuf(node));
+		if (!supports_inv_requests) {
+			buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
+			buf.s_request_fd(buf_req_fds[0]);
+			fail_on_test(!buf.qbuf(node));
+		}
 		fail_on_test(node->streamoff(m2m_q.g_type()));
 		fail_on_test(m2m_q.reqbufs(node, 0));

@@ -2177,7 +2185,10 @@ int testRequests(struct node *node, bool test_streaming)
 			fail_on_test(!buf.qbuf(node));
 		} else {
 			fail_on_test(supports_requests);
-			fail_on_test(err != EBADR);
+			if (!is_output && (node->codec_mask & (STATEFUL_DECODER | STATEFUL_ENCODER)))
+				fail_on_test(err != EBADR && err != EPERM);
+			else
+				fail_on_test(err != EBADR);
 		}
 		if (err) {
 			fail_on_test(node->streamoff(q.g_type()));
@@ -2240,13 +2251,17 @@ int testRequests(struct node *node, bool test_streaming)
 			test_streaming = false;
 			break;
 		}
-		fail_on_test(ret);
-		fail_on_test(buf.querybuf(node, i));
-		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
-		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
-		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_QUEUED));
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, 0) != EBUSY);
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0) != EBUSY);
+		if (supports_ro_requests) {
+			fail_on_test(ret != EINVAL);
+		} else {
+			fail_on_test(ret);
+			fail_on_test(buf.querybuf(node, i));
+			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
+			fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
+			fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_QUEUED));
+			fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, 0) != EBUSY);
+			fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0) != EBUSY);
+		}
 		if (i >= min_bufs) {
 			close(buf_req_fds[i]);
 			buf_req_fds[i] = -1;
@@ -2312,6 +2327,24 @@ int testRequests(struct node *node, bool test_streaming)
 	return 0;
 }

+int testRequests(struct node *node, bool test_streaming)
+{
+	int type = node->g_type();
+	int ret, inv_ret = ENOTTY;
+
+	if (node->is_m2m)
+		type = v4l_type_invert(type);
+	ret = testRequestsType(node, test_streaming, type);
+	fail_on_test(ret && ret != ENOTTY);
+	if (node->is_m2m) {
+		node->reopen();
+		inv_ret = testRequestsType(node, false, node->g_type());
+		fail_on_test(inv_ret && inv_ret != ENOTTY);
+		if (!inv_ret)
+			ret = 0;
+	}
+	return ret;
+}

 /*
  * This class wraps a pthread in such a way that it simplifies passing
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index ed28a568..ed218864 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -977,7 +977,7 @@ void common_set(cv4l_fd &_fd)
 					break;
 				default:
 					fprintf(stderr, "%s: unsupported payload type\n",
-							qc.name);
+						qc.name);
 					break;
 				}
 			} else {
@@ -1112,8 +1112,7 @@ void common_print_control(v4l2_query_ext_ctrl &qc, v4l2_ext_control &ctrl)
 			       ctrl.p_area->height);
 			break;
 		default:
-			fprintf(stderr, "%s: unsupported payload type\n",
-				name.c_str());
+			printf("%s: unsupported payload type\n", name.c_str());
 			break;
 		}
 	} else if (qc.type == V4L2_CTRL_TYPE_INTEGER64) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index c936299f..fb016597 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1,6 +1,7 @@
 #include <algorithm>
 #include <cstdlib>
 #include <cstring>
+#include <vector>

 #include <unistd.h>
 #include <stdlib.h>
@@ -38,6 +39,10 @@ static __u32 memory = V4L2_MEMORY_MMAP;
 static __u32 out_memory = V4L2_MEMORY_MMAP;
 static int stream_sleep = -1;
 static bool stream_no_query;
+static bool stream_req_ctrls;
+static bool stream_req_ro_ctrls;
+static bool stream_out_req_ctrls;
+static bool stream_out_req_ro_ctrls;
 static unsigned stream_pat;
 static bool stream_loop;
 static bool stream_out_square;
@@ -91,7 +96,6 @@ static __u64 last_fwht_bf_ts;
 static fwht_cframe_hdr last_fwht_hdr;

 struct request_fwht {
-	int fd;
 	__u64 ts;
 	struct v4l2_ctrl_fwht_params params;
 };
@@ -286,6 +290,8 @@ void streaming_usage()
 #endif
 	       "  --stream-poll      use non-blocking mode and select() to stream.\n"
 	       "  --stream-buf-caps  show capture buffer capabilities\n"
+	       "  --stream-req-ctrls show all controls in a capture request\n"
+	       "  --stream-req-ro-ctrls show all read-only controls in a capture request\n"
 	       "  --stream-mmap <count>\n"
 	       "                     capture video using mmap() [VIDIOC_(D)QBUF]\n"
 	       "                     count: the number of buffers to allocate. The default is 3.\n"
@@ -335,6 +341,8 @@ void streaming_usage()
 	       "                     percentage of the frame to actually fill. The default is 100%%.\n"
 	       "  --stream-out-buf-caps\n"
 	       "                     show output buffer capabilities\n"
+	       "  --stream-out-req-ctrls show all controls in an output request\n"
+	       "  --stream-out-req-ro-ctrls show all read-only controls in an output request\n"
 	       "  --stream-out-mmap <count>\n"
 	       "                     output video using mmap() [VIDIOC_(D)QBUF]\n"
 	       "                     count: the number of buffers to allocate. The default is 4.\n"
@@ -668,6 +676,18 @@ void streaming_cmd(int ch, char *optarg)
 	case OptStreamLoop:
 		stream_loop = true;
 		break;
+	case OptStreamReqCtrls:
+		stream_req_ctrls = true;
+		break;
+	case OptStreamReqROCtrls:
+		stream_req_ro_ctrls = true;
+		break;
+	case OptStreamOutReqCtrls:
+		stream_out_req_ctrls = true;
+		break;
+	case OptStreamOutReqROCtrls:
+		stream_out_req_ro_ctrls = true;
+		break;
 	case OptStreamOutPattern:
 		stream_pat = strtoul(optarg, 0L, 0);
 		for (i = 0; tpg_pattern_strings[i]; i++) ;
@@ -839,20 +859,6 @@ static void set_fwht_stateless_params(struct v4l2_ctrl_fwht_params &fwht_params,
 		fwht_params.flags |= FWHT_FL_I_FRAME;
 }

-static int alloc_fwht_req(int media_fd, unsigned index)
-{
-	int rc = 0;
-
-	rc = ioctl(media_fd, MEDIA_IOC_REQUEST_ALLOC, &fwht_reqs[index]);
-	if (rc < 0) {
-		fprintf(stderr, "Unable to allocate media request: %s\n",
-			strerror(errno));
-		return rc;
-	}
-
-	return 0;
-}
-
 static void set_fwht_req_by_idx(unsigned idx, const struct fwht_cframe_hdr *hdr,
 				__u64 last_bf_ts, __u64 ts)
 {
@@ -873,23 +879,6 @@ static int get_fwht_req_by_ts(__u64 ts)
 	return -1;
 }

-static bool set_fwht_req_by_fd(const struct fwht_cframe_hdr *hdr,
-			       int req_fd, __u64 last_bf_ts, __u64 ts)
-{
-	struct v4l2_ctrl_fwht_params fwht_params;
-
-	set_fwht_stateless_params(fwht_params, hdr, last_bf_ts);
-
-	for (auto &fwht_req : fwht_reqs) {
-		if (fwht_req.fd == req_fd) {
-			fwht_req.ts = ts;
-			fwht_req.params = fwht_params;
-			return true;
-		}
-	}
-	return false;
-}
-
 static int set_fwht_ext_ctrl(cv4l_fd &fd, const struct fwht_cframe_hdr *hdr,
 			     __u64 last_bf_ts, int req_fd)
 {
@@ -1228,6 +1217,21 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			stream_out_refresh = true;
 	}

+	if (((q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS) &&
+	     (stream_out_req_ctrls || stream_out_req_ro_ctrls)) ||
+	    fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
+		int media_fd = mi_get_media_fd(fd.g_fd());
+
+		if (media_fd < 0) {
+			fprintf(stderr, "%s: mi_get_media_fd failed\n", __func__);
+			return QUEUE_ERROR;
+		}
+		int ret = q.create_requests(media_fd);
+		close(media_fd);
+		if (ret)
+			return QUEUE_ERROR;
+	}
+
 	for (unsigned i = 0; i < q.g_buffers(); i++) {
 		cv4l_buffer buf(q);

@@ -1259,20 +1263,8 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			return QUEUE_STOPPED;

 		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
-			int media_fd = mi_get_media_fd(fd.g_fd());
-
-			if (media_fd < 0) {
-				fprintf(stderr, "%s: mi_get_media_fd failed\n", __func__);
-				return media_fd;
-			}
-
-			if (alloc_fwht_req(media_fd, i))
-				return QUEUE_ERROR;
-			buf.s_request_fd(fwht_reqs[i].fd);
-			buf.or_flags(V4L2_BUF_FLAG_REQUEST_FD);
-
 			if (set_fwht_ext_ctrl(fd, &last_fwht_hdr, last_fwht_bf_ts,
-					      buf.g_request_fd())) {
+					      q.g_request_fd(i))) {
 				fprintf(stderr, "%s: set_fwht_ext_ctrl failed on %dth buf: %s\n",
 					__func__, i, strerror(errno));
 				return QUEUE_ERROR;
@@ -1282,7 +1274,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			fps_timestamps fps_ts;

 			set_time_stamp(buf);
-			if (fd.qbuf(buf))
+			if (q.buffer_queue_request(&fd, buf))
 				return QUEUE_ERROR;
 			tpg_update_mv_count(&tpg, V4L2_FIELD_HAS_T_OR_B(field));
 			if (!verbose)
@@ -1296,11 +1288,6 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			set_fwht_req_by_idx(i, &last_fwht_hdr,
 					    last_fwht_bf_ts, buf.g_timestamp_ns());
 			last_fwht_bf_ts = buf.g_timestamp_ns();
-			if (ioctl(buf.g_request_fd(), MEDIA_REQUEST_IOC_QUEUE) < 0) {
-				fprintf(stderr, "Unable to queue media request: %s\n",
-					strerror(errno));
-				return QUEUE_ERROR;
-			}
 		}
 	}
 	if (qbuf)
@@ -1382,6 +1369,81 @@ static void write_buffer_to_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &buf,
 #endif
 }

+static void log_ctrls(cv4l_fd &fd, int req_fd, bool read_only,
+		      const char *prefix)
+{
+	std::vector<v4l2_ext_control> ctrl_vec;
+	std::vector<v4l2_query_ext_ctrl> qec_vec;
+	v4l2_ext_controls ctrls = {};
+	v4l2_query_ext_ctrl qec = { 0 };
+	cv4l_disable_trace dt(fd);
+
+	while (!fd.query_ext_ctrl(qec, true, true)) {
+		if (read_only && !(qec.flags & V4L2_CTRL_FLAG_READ_ONLY))
+			continue;
+		if (qec.type == V4L2_CTRL_TYPE_CTRL_CLASS ||
+		    qec.type == V4L2_CTRL_TYPE_BUTTON)
+			continue;
+		v4l2_ext_control ctrl = { qec.id };
+		if (qec.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD) {
+			ctrl.size = qec.elems * qec.elem_size;
+			ctrl.ptr = malloc(ctrl.size);
+		}
+		ctrl_vec.push_back(ctrl);
+		qec_vec.push_back(qec);
+	}
+	if (ctrl_vec.empty())
+		return;
+	ctrls.count = ctrl_vec.size();
+	ctrls.controls = &ctrl_vec[0];
+	ctrls.which = V4L2_CTRL_WHICH_REQUEST_VAL;
+	ctrls.request_fd = req_fd;
+	ioctl(fd.g_fd(), VIDIOC_G_EXT_CTRLS, &ctrls);
+	printf("\n");
+	for (unsigned i = 0; i < ctrls.count; i++) {
+		printf("%s", prefix);
+		common_print_control(qec_vec[i], ctrl_vec[i]);
+	}
+	printf("\n");
+}
+
+static int wait_for_request(cv4l_fd &fd, cv4l_queue &q, unsigned index)
+{
+	if (!q.has_requests())
+		return 0;
+
+	int req_fd = q.g_request_fd(index);
+	fd_set exception_fds;
+	struct timeval tv = { 2, 0 };
+	int rc;
+
+	FD_ZERO(&exception_fds);
+	FD_SET(req_fd, &exception_fds);
+	rc = select(req_fd + 1, NULL, NULL, &exception_fds, &tv);
+
+	if (rc == 0) {
+		fprintf(stderr, "Timeout when waiting for media request\n");
+		return QUEUE_ERROR;
+	}
+	if (rc < 0) {
+		fprintf(stderr, "Unable to select media request: %s\n",
+			strerror(errno));
+		return QUEUE_ERROR;
+	}
+
+	bool show_ctrls = V4L2_TYPE_IS_CAPTURE(q.g_type()) ?
+		stream_req_ctrls || stream_req_ro_ctrls :
+		stream_out_req_ctrls || stream_out_req_ro_ctrls;
+	bool show_ro_ctrls = V4L2_TYPE_IS_CAPTURE(q.g_type()) ? stream_req_ro_ctrls :
+								stream_out_req_ro_ctrls;
+	char prefix[16];
+
+	sprintf(prefix, "%s[%u]: ", V4L2_TYPE_IS_CAPTURE(q.g_type()) ? "cap" : "out", index);
+	if (show_ctrls)
+		log_ctrls(fd, req_fd, show_ro_ctrls, prefix);
+	return 0;
+}
+
 static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 			 unsigned &count, fps_timestamps &fps_ts, cv4l_fmt &fmt,
 			 bool ignore_count_skip)
@@ -1400,6 +1462,8 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 			fprintf(stderr, "%s: failed: %s\n", "VIDIOC_DQBUF", strerror(errno));
 			return QUEUE_ERROR;
 		}
+		if (q.reinit_request(buf.g_index()))
+			return QUEUE_ERROR;
 		if (buf.g_flags() & V4L2_BUF_FLAG_LAST) {
 			last_buffer = true;
 			break;
@@ -1408,7 +1472,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 			break;
 		if (verbose)
 			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
-		if (fd.qbuf(buf))
+		if (q.buffer_queue_request(&fd, buf))
 			return QUEUE_ERROR;
 	}

@@ -1440,7 +1504,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 		 * has the size that fits the old resolution and might not
 		 * fit to the new one.
 		 */
-		if (fd.qbuf(buf) && errno != EINVAL) {
+		if (q.buffer_queue_request(&fd, buf) && errno != EINVAL) {
 			fprintf(stderr, "%s: qbuf error\n", __func__);
 			return QUEUE_ERROR;
 		}
@@ -1560,13 +1624,10 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
 	if (is_meta)
 		meta_fillbuffer(buf, fmt, q);

-	if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
-		if (ioctl(buf.g_request_fd(), MEDIA_REQUEST_IOC_REINIT, NULL)) {
-			fprintf(stderr, "Unable to reinit media request: %s\n",
-				strerror(errno));
-			return QUEUE_ERROR;
-		}
+	if (q.reinit_request(buf.g_index()))
+		return QUEUE_ERROR;

+	if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
 		if (set_fwht_ext_ctrl(fd, &last_fwht_hdr, last_fwht_bf_ts,
 				      buf.g_request_fd())) {
 			fprintf(stderr, "%s: set_fwht_ext_ctrl failed: %s\n",
@@ -1577,24 +1638,15 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap

 	set_time_stamp(buf);

-	if (fd.qbuf(buf)) {
-		fprintf(stderr, "%s: failed: %s\n", "VIDIOC_QBUF", strerror(errno));
-		return QUEUE_ERROR;
-	}
 	if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
-		if (!set_fwht_req_by_fd(&last_fwht_hdr, buf.g_request_fd(), last_fwht_bf_ts,
-					buf.g_timestamp_ns())) {
-			fprintf(stderr, "%s: request for fd %d does not exist\n",
-				__func__, buf.g_request_fd());
-			return QUEUE_ERROR;
-		}
-
+		set_fwht_req_by_idx(buf.g_index(), &last_fwht_hdr,
+				    last_fwht_bf_ts, buf.g_timestamp_ns());
 		last_fwht_bf_ts = buf.g_timestamp_ns();
-		if (ioctl(buf.g_request_fd(), MEDIA_REQUEST_IOC_QUEUE) < 0) {
-			fprintf(stderr, "Unable to queue media request: %s\n",
-				strerror(errno));
-			return QUEUE_ERROR;
-		}
+	}
+
+	if (q.buffer_queue_request(&fd, buf)) {
+		fprintf(stderr, "%s: failed: %s\n", "VIDIOC_QBUF", strerror(errno));
+		return QUEUE_ERROR;
 	}

 	tpg_update_mv_count(&tpg, V4L2_FIELD_HAS_T_OR_B(output_field));
@@ -1775,6 +1827,8 @@ static void streaming_set_cap(cv4l_fd &fd, cv4l_fd &exp_fd)
 	if (use_poll)
 		subscribe_event(fd, V4L2_EVENT_SOURCE_CHANGE);

+	int media_fd = mi_get_media_fd(fd.g_fd());
+
 recover:
 	eos = false;
 	source_change = false;
@@ -1821,6 +1875,11 @@ recover:
 	if (q.obtain_bufs(&fd))
 		goto done;

+	if ((q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS) &&
+	    (stream_req_ctrls || stream_req_ro_ctrls) &&
+	    q.create_requests(media_fd))
+		goto done;
+
 	if (q.queue_all(&fd))
 		goto done;

@@ -1904,8 +1963,10 @@ recover:
 		goto recover;

 done:
-	if (options[OptStreamDmaBuf])
-		exp_q.close_exported_fds();
+	q.free(&fd);
+	exp_q.free(&exp_fd);
+	close(media_fd);
+
 	if (fout && fout != stdout) {
 		if (host_fd_to >= 0)
 			write_u32(fout, V4L_STREAM_PACKET_END);
@@ -2162,12 +2223,11 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 	fcntl(fd.g_fd(), F_SETFL, fd_flags);
 	fprintf(stderr, "\n");

-	q.free(&fd);
 	tpg_free(&tpg);

 done:
-	if (options[OptStreamOutDmaBuf])
-		exp_q.close_exported_fds();
+	q.free(&fd);
+	exp_q.free(&fd);
 	if (fin && fin != stdin)
 		fclose(fin);
 }
@@ -2183,6 +2243,7 @@ static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt
 		fprintf(stderr, "%s: fd.streamoff error\n", __func__);
 		return -1;
 	}
+	in.free_requests();

 	/* release any buffer allocated */
 	if (in.reqbufs(&fd)) {
@@ -2214,10 +2275,25 @@ static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt

 	if (exp_fd && in.export_bufs(exp_fd, exp_fd->g_type()))
 		return -1;
-	if (in.obtain_bufs(&fd) || in.queue_all(&fd)) {
+	if ((in.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS) &&
+	    (stream_req_ctrls || stream_req_ro_ctrls)) {
+		int media_fd = mi_get_media_fd(fd.g_fd());
+
+		if (media_fd < 0)
+			return -1;
+		int ret = in.create_requests(media_fd);
+		close(media_fd);
+		if (ret)
+			return -1;
+	}
+	if (in.obtain_bufs(&fd)) {
 		fprintf(stderr, "%s: in.obtain_bufs error\n", __func__);
 		return -1;
 	}
+	if (in.queue_all(&fd)) {
+		fprintf(stderr, "%s: in.queue_all error\n", __func__);
+		return -1;
+	}

 	if (fd.streamon(in.g_type())) {
 		fprintf(stderr, "%s: fd.streamon error\n", __func__);
@@ -2434,6 +2510,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 	unsigned count[2] = { 0, 0 };
 	int fd_flags = fcntl(fd.g_fd(), F_GETFL);
 	bool stopped = false;
+	int media_fd = mi_get_media_fd(fd.g_fd());

 	if (out.reqbufs(&fd, reqbufs_count_out)) {
 		fprintf(stderr, "%s: out.reqbufs failed\n", __func__);
@@ -2453,6 +2530,11 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 		return;
 	}

+	if ((in.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS) &&
+	    (stream_req_ctrls || stream_req_ro_ctrls) &&
+	    in.create_requests(media_fd))
+		return;
+
 	if (do_setup_out_buffers(fd, out, fout, true, true) == QUEUE_ERROR) {
 		fprintf(stderr, "%s: do_setup_out_buffers failed\n", __func__);
 		return;
@@ -2473,45 +2555,38 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 		return;
 	}
 	int index = 0;
-	bool queue_lst_buf = false;
+	bool queue_last_buf = false;
 	cv4l_buffer last_in_buf;

 	fcntl(fd.g_fd(), F_SETFL, fd_flags | O_NONBLOCK);

 	while (true) {
-		fd_set except_fds;
-		int req_fd = fwht_reqs[index].fd;
-		struct timeval tv = { 2, 0 };
+		int buf_idx = -1;
+		int rc = 0;

-		if (req_fd < 0)
+		if (out.g_request_fd(index) < 0)
 			break;

-		FD_ZERO(&except_fds);
-		FD_SET(req_fd, &except_fds);
-
-		int rc = select(req_fd + 1, NULL, NULL, &except_fds, &tv);
-
-		if (rc == 0) {
-			fprintf(stderr, "Timeout when waiting for media request\n");
+		rc = wait_for_request(fd, out, index);
+		if (rc)
 			return;
-		}
-		if (rc < 0) {
-			fprintf(stderr, "Unable to select media request: %s\n",
-				strerror(errno));
-			return;
-		}
+
 		/*
 		 * it is safe to queue back last cap buffer only after
 		 * the following request is done so that the buffer
 		 * is not needed anymore as a reference frame
 		 */
-		if (queue_lst_buf) {
-			if (fd.qbuf(last_in_buf)) {
+		if (queue_last_buf) {
+			if (in.buffer_queue_request(&fd, last_in_buf)) {
 				fprintf(stderr, "%s: qbuf failed\n", __func__);
 				return;
 			}
 		}
-		int buf_idx = -1;
+
+		rc = wait_for_request(fd, in, index);
+		if (rc)
+			return;
+
 		/*
 		 * fin is not sent to do_handle_cap since the capture buf is
 		 * written to the file in current function
@@ -2522,6 +2597,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			fprintf(stderr, "%s: do_handle_cap err\n", __func__);
 			return;
 		}
+
 		/*
 		 * in case of an error in the frame, set last ts to 0 as a
 		 * means to recover so that next request will not use a
@@ -2536,7 +2612,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			if (fd.querybuf(cap_buf))
 				return;
 			last_in_buf = cap_buf;
-			queue_lst_buf = true;
+			queue_last_buf = true;
 			if (fin && cap_buf.g_bytesused(0) &&
 			    !(cap_buf.g_flags() & V4L2_BUF_FLAG_ERROR)) {
 				int idx = get_fwht_req_by_ts(cap_buf.g_timestamp_ns());
@@ -2562,8 +2638,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 				stopped = true;
 				if (rc != QUEUE_STOPPED)
 					fprintf(stderr, "%s: output stream ended\n", __func__);
-				close(req_fd);
-				fwht_reqs[index].fd = -1;
+				out.free_request(index);
 			}
 		}
 		index = (index + 1) % out.g_buffers();
@@ -2625,8 +2700,9 @@ static void streaming_set_m2m(cv4l_fd &fd, cv4l_fd &exp_fd)
 		stateful_m2m(fd, in, out, file[CAP], file[OUT], fmt[CAP], fmt[OUT], exp_fd_p);

 done:
-	if (options[OptStreamDmaBuf] || options[OptStreamOutDmaBuf])
-		exp_q.close_exported_fds();
+	in.free(&fd);
+	out.free(&fd);
+	exp_q.free(&exp_fd);

 	if (file[CAP] && file[CAP] != stdout)
 		fclose(file[CAP]);
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index a31b29f8..edfd2530 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -260,6 +260,8 @@ static struct option long_options[] = {
 	{"stream-to-host", required_argument, 0, OptStreamToHost},
 #endif
 	{"stream-buf-caps", no_argument, 0, OptStreamBufCaps},
+	{"stream-req-ctrls", no_argument, 0, OptStreamReqCtrls},
+	{"stream-req-ro-ctrls", no_argument, 0, OptStreamReqROCtrls},
 	{"stream-mmap", optional_argument, 0, OptStreamMmap},
 	{"stream-user", optional_argument, 0, OptStreamUser},
 	{"stream-dmabuf", no_argument, 0, OptStreamDmaBuf},
@@ -280,6 +282,8 @@ static struct option long_options[] = {
 	{"stream-out-vert-speed", required_argument, 0, OptStreamOutVertSpeed},
 	{"stream-out-perc-fill", required_argument, 0, OptStreamOutPercFill},
 	{"stream-out-buf-caps", no_argument, 0, OptStreamOutBufCaps},
+	{"stream-out-req-ctrls", no_argument, 0, OptStreamOutReqCtrls},
+	{"stream-out-req-ro-ctrls", no_argument, 0, OptStreamOutReqROCtrls},
 	{"stream-out-mmap", optional_argument, 0, OptStreamOutMmap},
 	{"stream-out-user", optional_argument, 0, OptStreamOutUser},
 	{"stream-out-dmabuf", no_argument, 0, OptStreamOutDmaBuf},
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 4acb4d51..0590289c 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -224,6 +224,8 @@ enum Option {
 	OptStreamToHost,
 	OptStreamLossless,
 	OptStreamBufCaps,
+	OptStreamReqCtrls,
+	OptStreamReqROCtrls,
 	OptStreamMmap,
 	OptStreamUser,
 	OptStreamDmaBuf,
@@ -244,6 +246,8 @@ enum Option {
 	OptStreamOutPixelAspect,
 	OptStreamOutVideoAspect,
 	OptStreamOutBufCaps,
+	OptStreamOutReqCtrls,
+	OptStreamOutReqROCtrls,
 	OptStreamOutMmap,
 	OptStreamOutUser,
 	OptStreamOutDmaBuf,
