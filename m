Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82B83A2A73
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhFJLlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:41:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49581 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230033AbhFJLk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:40:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rJ1Xl7lm1hqltrJ1alXk18; Thu, 10 Jun 2021 13:39:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623325142; bh=TydwBCX+Whg3uu+64Alty1DwcWNO8oFrCrx9tqVxhiU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qY+79/2ucUoh9fhj6/FwBGYt/2e3n9oYi0j1XpxZ/dpPWXu5mB6LaZ9gx3u75CH79
         szculljCIjq8O+GGlXAJ3cP4O8OpLkEsxASaHBv2vxTXMKxVdMQTkxlSvpZSY7Nzqj
         gMEws/h3b/lKCvh2zc6tv5pjOIqWZW0yMnaBIGi35fOM32uPbOECKJKVZEtqRfSFZU
         s3ch5H8v2kjAezqa5OSad+v5ZgBLy9uTIbnw3qrXreMDrQMoAYYiqqEXzzEGwdv20/
         g9xipamplbB7TW9Xh1WwbHmLojdui5oQpcngqOj+5xdeSBnpDmjZJXFXGfi/XyIjIC
         rvu4R49ZN7jBg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH 2/2] v4l-utils: add support for read-only requests
Message-ID: <794a0757-d36b-a5c2-5a45-044b8cefd1f4@xs4all.nl>
Date:   Thu, 10 Jun 2021 13:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDpK6bIPgSam82Hm3LciMBF7tnwYeGDPu/O37vM+NMjtprNQsIUYNCVOkWehCGT1aAqzpyoYoY/1Y2KnnjEJTB4qvE9wanLaUwqyT4mjkvSDCtIFAsSn
 9hgLhIH4t34jzdA30TFXXHDMMjijlIzOLGQwDhIzPMd+OAJa9miM4CY0joZbK468n1PvZmsr7pg1xDWFR7YxTjSviNtnHg4qQPD2fJqoUPvTADnFH6ZftwHk
 Z41feQ3t/+W6iU0lAWOe1MPq4Y2RQEYGmowP7kHVhWU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for read-only requests.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 contrib/freebsd/include/linux/videodev2.h   |   1 +
 include/linux/videodev2.h                   |   1 +
 utils/common/cv4l-helpers.h                 |  30 ++-
 utils/common/v4l-helpers.h                  |  96 +++++++-
 utils/common/v4l2-info.cpp                  |   1 +
 utils/v4l2-compliance/v4l2-compliance.cpp   |   3 +-
 utils/v4l2-compliance/v4l2-compliance.h     |   2 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp |  98 +++++---
 utils/v4l2-ctl/v4l2-ctl-common.cpp          |  40 +++-
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp       | 252 +++++++++++---------
 utils/v4l2-ctl/v4l2-ctl.cpp                 |   4 +
 utils/v4l2-ctl/v4l2-ctl.h                   |   6 +
 12 files changed, 380 insertions(+), 154 deletions(-)

diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index c8a61dfd..13425d24 100644
--- a/contrib/freebsd/include/linux/videodev2.h
+++ b/contrib/freebsd/include/linux/videodev2.h
@@ -975,6 +975,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS		(1 << 7)

 /**
  * struct v4l2_plane - plane info for multi-planar buffers
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 4cf0ec25..c4238254 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -941,6 +941,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS		(1 << 7)

 /**
  * struct v4l2_plane - plane info for multi-planar buffers
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 712efde6..5943b329 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -766,6 +766,30 @@ public:
 	{
 		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt);
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
@@ -814,6 +838,10 @@ public:
 	{
 		v4l_queue_buffer_update(this, &buf, index);
 	}
+	int buffer_queue_request(cv4l_fd *fd, v4l_buffer &buf)
+	{
+		return v4l_queue_buffer_queue_request(fd->g_v4l_fd(), this, &buf);
+	}
 	int queue_all(cv4l_fd *fd);
 };

@@ -904,7 +932,7 @@ inline int cv4l_queue::queue_all(cv4l_fd *fd)

 	for (unsigned i = 0; i < g_buffers(); i++) {
 		buf.init(*this, i);
-		int ret = fd->qbuf(buf);
+		int ret = buffer_queue_request(fd, buf);
 		if (ret)
 			return ret;
 	}
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index f96b3c38..baf18749 100644
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
@@ -1417,6 +1418,8 @@ struct v4l_queue {
 	void *mmappings[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
 	unsigned long userptrs[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
 	int fds[VIDEO_MAX_FRAME][VIDEO_MAX_PLANES];
+	int request_fds[VIDEO_MAX_FRAME];
+	bool has_requests;
 };

 static inline void v4l_queue_init(struct v4l_queue *q,
@@ -1427,9 +1430,11 @@ static inline void v4l_queue_init(struct v4l_queue *q,
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
 	v4l_queue_reqbufs(f, q, 0);
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
index 00a5fada..0e0966dc 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -209,6 +209,7 @@ static constexpr flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS, "mmap-cache-hints" },
+	{ V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS, "ro-requests" },
 	{ 0, nullptr }
 };

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index a450d487..c41873bc 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1271,7 +1271,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.has_enc_cap_frame_interval = false;
 		node.valid_buftypes = 0;
 		node.valid_memorytype = 0;
-		node.buf_caps = 0;
+		node.buf_caps[0] = 0;
+		node.buf_caps[1] = 0;
 		for (auto &buftype_pixfmt : node.buftype_pixfmts)
 			buftype_pixfmt.clear();

diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index af5efe62..5d8ebc00 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -143,7 +143,7 @@ struct base_node {
 	int frame_interval_pad;
 	int enum_frame_interval_pad;
 	__u32 fbuf_caps;
-	__u32 buf_caps;
+	__u32 buf_caps[2]; // [0] = capture, [1] = output buffer caps
 	const char *bus_info;
 	pixfmt_map buftype_pixfmts[V4L2_BUF_TYPE_LAST + 1];
 	frmsizes_set frmsizes;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 02457636..19457635 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -573,7 +573,7 @@ int testReqBufs(struct node *node)
 		fail_on_test(ret && ret != EINVAL);
 		mmap_valid = !ret;
 		if (mmap_valid)
-			node->buf_caps = caps = q.g_capabilities();
+			node->buf_caps[V4L2_TYPE_IS_OUTPUT(i)] = caps = q.g_capabilities();
 		if (caps) {
 			fail_on_test(mmap_valid ^ !!(caps & V4L2_BUF_CAP_SUPPORTS_MMAP));
 			if (caps & V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS)
@@ -1941,8 +1941,10 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
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
@@ -1983,11 +1985,20 @@ int testRequests(struct node *node, bool test_streaming)
 		.controls = &vivid_dyn_array_ctrl,
 	};
 	bool have_controls;
+	bool is_output = V4L2_TYPE_IS_OUTPUT(type);
+	__u32 buf_caps = node->buf_caps[is_output];
+	__u32 inv_buf_caps = node->is_m2m ? node->buf_caps[!is_output] : 0;
+	bool supports_requests = buf_caps & req_buf_caps;
+	bool supports_ro_requests = buf_caps & V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS;
+	bool supports_inv_requests = inv_buf_caps & req_buf_caps;
 	int ret;

 	// If requests are supported, then there must be a media device
-	if (node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS)
+	if (supports_requests)
 		fail_on_test(media_fd < 0);
+	fail_on_test((buf_caps & req_buf_caps) == req_buf_caps);
+	fail_on_test((inv_buf_caps & req_buf_caps) == req_buf_caps);
+	fail_on_test(buf_caps & inv_buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);

 	// Check if the driver has controls that can be used to test requests
 	memset(&valid_qctrl, 0, sizeof(valid_qctrl));
@@ -2012,8 +2023,7 @@ int testRequests(struct node *node, bool test_streaming)

 	if (ctrl.id == 0) {
 		info("could not test the Request API, no suitable control found\n");
-		return (node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS) ?
-			0 : ENOTTY;
+		return supports_requests ? 0 : ENOTTY;
 	}

 	// Test if V4L2_CTRL_WHICH_REQUEST_VAL is supported
@@ -2024,7 +2034,7 @@ int testRequests(struct node *node, bool test_streaming)

 	if (media_fd < 0 || ret == EBADR) {
 		// Should not happen if requests are supported
-		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
+		fail_on_test(supports_requests);
 		return ENOTTY;
 	}
 	if (have_controls) {
@@ -2036,7 +2046,7 @@ int testRequests(struct node *node, bool test_streaming)
 	ret = doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &req_fd);
 	if (ret == ENOTTY) {
 		// Should not happen if requests are supported
-		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
+		fail_on_test(supports_requests);
 		return ENOTTY;
 	}
 	// Check that a request was allocated with a valid fd
@@ -2104,13 +2114,6 @@ int testRequests(struct node *node, bool test_streaming)
 	fhs.del(media_fd);
 	node->reopen();

-	int type = node->g_type();
-	// For m2m devices g_type() will return the capture type, so
-	// we need to invert it to get the output type.
-	// At the moment only the output type of an m2m device can use
-	// requests.
-	if (node->is_m2m)
-		type = v4l_type_invert(type);
 	if (v4l_type_is_vbi(type)) {
 		cv4l_fmt fmt;

@@ -2121,10 +2124,9 @@ int testRequests(struct node *node, bool test_streaming)
 	if (!(node->valid_buftypes & (1 << type))) {
 		// If the type is not supported, then check that requests
 		// are also not supported.
-		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
+		fail_on_test(supports_requests);
 		return ENOTTY;
 	}
-	bool supports_requests = node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS;

 	buffer_info.clear();

@@ -2147,8 +2149,8 @@ int testRequests(struct node *node, bool test_streaming)
 	// Allocate the requests
 	for (unsigned i = 0; i < num_requests; i++) {
 		fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &buf_req_fds[i]));
-		fhs.add(buf_req_fds[i]);
 		fail_on_test(buf_req_fds[i] < 0);
+		fhs.add(buf_req_fds[i]);
 		// Check that empty requests can't be queued
 		fail_on_test(!doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr));
 	}
@@ -2189,12 +2191,14 @@ int testRequests(struct node *node, bool test_streaming)
 		buffer buf(m2m_q);

 		fail_on_test(buf.querybuf(node, 0));
-		buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
-		buf.s_request_fd(buf_req_fds[0]);
-		// Only the output queue can support requests,
-		// so if the capture queue also supports requests,
-		// then something is wrong.
-		fail_on_test(!buf.qbuf(node));
+		if (!supports_inv_requests) {
+			buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
+			buf.s_request_fd(buf_req_fds[0]);
+			// Only the output queue can support requests,
+			// so if the capture queue also supports requests,
+			// then something is wrong.
+			fail_on_test(!buf.qbuf(node));
+		}
 		fail_on_test(node->streamoff(m2m_q.g_type()));
 		fail_on_test(m2m_q.reqbufs(node, 0));

@@ -2245,7 +2249,10 @@ int testRequests(struct node *node, bool test_streaming)
 			// Can only fail if requests are not supported
 			fail_on_test(supports_requests);
 			// and should fail with EBADR in that case
-			fail_on_test(err != EBADR);
+			if (!is_output && (node->codec_mask & (STATEFUL_DECODER | STATEFUL_ENCODER)))
+				fail_on_test(err != EBADR && err != EPERM);
+			else
+				fail_on_test(err != EBADR);
 		}
 		if (err) {
 			// Requests are not supported, so clean up and return
@@ -2370,15 +2377,22 @@ int testRequests(struct node *node, bool test_streaming)
 			test_streaming = false;
 			break;
 		}
-		fail_on_test(ret);
-		fail_on_test(buf.querybuf(node, i));
-		// Check that the buffer is now queued up
-		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
-		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
-		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_QUEUED));
-		// Re-initing or requeuing the request is no longer possible
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr) != EBUSY);
-		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr) != EBUSY);
+		if (supports_ro_requests) {
+			if (i % 3 < 2)
+				fail_on_test(ret != EINVAL);
+			else
+				fail_on_test(ret);
+		} else {
+			fail_on_test(ret);
+			fail_on_test(buf.querybuf(node, i));
+			// Check that the buffer is now queued up
+			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
+			fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
+			fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_QUEUED));
+			// Re-initing or requeuing the request is no longer possible
+			fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, 0) != EBUSY);
+			fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0) != EBUSY);
+		}
 		if (i >= min_bufs) {
 			// Close some of the request fds to check that this
 			// is safe to do
@@ -2528,6 +2542,24 @@ int testRequests(struct node *node, bool test_streaming)
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
index 9b378211..26dd26ca 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -840,6 +840,44 @@ static void find_controls(cv4l_fd &_fd)
 	}
 }

+void common_log_ctrls(cv4l_fd &fd, int req_fd, bool read_only,
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
+		printf("%s%s: ", prefix, qec_vec[i].name);
+		print_value(fd.g_fd(), qec_vec[i], ctrl_vec[i], true, false);
+	}
+	printf("\n");
+}
+
 int common_find_ctrl_id(const char *name)
 {
 	if (ctrl_str2q.find(name) == ctrl_str2q.end())
@@ -1128,7 +1166,7 @@ void common_set(cv4l_fd &_fd)
 					break;
 				default:
 					fprintf(stderr, "%s: unsupported payload type\n",
-							qc.name);
+						qc.name);
 					break;
 				}
 			} else {
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 62424e4c..d5997c45 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1,4 +1,5 @@
 #include <cstring>
+#include <vector>

 #include <netdb.h>
 #include <sys/types.h>
@@ -20,6 +21,10 @@ static __u32 memory = V4L2_MEMORY_MMAP;
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
@@ -73,7 +78,6 @@ static __u64 last_fwht_bf_ts;
 static fwht_cframe_hdr last_fwht_hdr;

 struct request_fwht {
-	int fd;
 	__u64 ts;
 	struct v4l2_ctrl_fwht_params params;
 };
@@ -268,6 +272,8 @@ void streaming_usage()
 #endif
 	       "  --stream-poll      use non-blocking mode and select() to stream.\n"
 	       "  --stream-buf-caps  show capture buffer capabilities\n"
+	       "  --stream-req-ctrls show all controls in a capture request\n"
+	       "  --stream-req-ro-ctrls show all read-only controls in a capture request\n"
 	       "  --stream-show-delta-now\n"
 	       "                     output the difference between the buffer timestamp and current\n"
 	       "                     clock, if the buffer timestamp source is the monotonic clock.\n"
@@ -321,6 +327,8 @@ void streaming_usage()
 	       "                     percentage of the frame to actually fill. The default is 100%%.\n"
 	       "  --stream-out-buf-caps\n"
 	       "                     show output buffer capabilities\n"
+	       "  --stream-out-req-ctrls show all controls in an output request\n"
+	       "  --stream-out-req-ro-ctrls show all read-only controls in an output request\n"
 	       "  --stream-out-mmap <count>\n"
 	       "                     output video using mmap() [VIDIOC_(D)QBUF]\n"
 	       "                     count: the number of buffers to allocate. The default is 4.\n"
@@ -663,6 +671,18 @@ void streaming_cmd(int ch, char *optarg)
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
 		stream_pat = strtoul(optarg, nullptr, 0);
 		for (i = 0; tpg_pattern_strings[i]; i++) ;
@@ -834,20 +854,6 @@ static void set_fwht_stateless_params(struct v4l2_ctrl_fwht_params &fwht_params,
 		fwht_params.flags |= V4L2_FWHT_FL_I_FRAME;
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
@@ -868,23 +874,6 @@ static int get_fwht_req_by_ts(__u64 ts)
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
@@ -1223,6 +1212,21 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
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

@@ -1254,20 +1258,8 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
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
@@ -1277,7 +1269,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 			fps_timestamps fps_ts;

 			set_time_stamp(buf);
-			if (fd.qbuf(buf))
+			if (q.buffer_queue_request(&fd, buf))
 				return QUEUE_ERROR;
 			tpg_update_mv_count(&tpg, V4L2_FIELD_HAS_T_OR_B(field));
 			if (!verbose)
@@ -1291,11 +1283,6 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
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
@@ -1377,6 +1364,43 @@ static void write_buffer_to_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &buf,
 #endif
 }

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
+		common_log_ctrls(fd, req_fd, show_ro_ctrls, prefix);
+	return 0;
+}
+
 static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 			 unsigned &count, fps_timestamps &fps_ts, cv4l_fmt &fmt,
 			 bool ignore_count_skip)
@@ -1395,6 +1419,8 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 			fprintf(stderr, "%s: failed: %s\n", "VIDIOC_DQBUF", strerror(errno));
 			return QUEUE_ERROR;
 		}
+		if (q.reinit_request(buf.g_index()))
+			return QUEUE_ERROR;
 		if (buf.g_flags() & V4L2_BUF_FLAG_LAST) {
 			last_buffer = true;
 			break;
@@ -1403,7 +1429,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 			break;
 		if (verbose)
 			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
-		if (fd.qbuf(buf))
+		if (q.buffer_queue_request(&fd, buf))
 			return QUEUE_ERROR;
 	}

@@ -1435,7 +1461,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
 		 * has the size that fits the old resolution and might not
 		 * fit to the new one.
 		 */
-		if (fd.qbuf(buf) && errno != EINVAL) {
+		if (q.buffer_queue_request(&fd, buf) && errno != EINVAL) {
 			fprintf(stderr, "%s: qbuf error\n", __func__);
 			return QUEUE_ERROR;
 		}
@@ -1555,13 +1581,10 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
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
@@ -1572,24 +1595,15 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap

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
@@ -1770,6 +1784,8 @@ static void streaming_set_cap(cv4l_fd &fd, cv4l_fd &exp_fd)
 	if (use_poll)
 		subscribe_event(fd, V4L2_EVENT_SOURCE_CHANGE);

+	int media_fd = mi_get_media_fd(fd.g_fd());
+
 recover:
 	eos = false;
 	source_change = false;
@@ -1816,6 +1832,11 @@ recover:
 	if (q.obtain_bufs(&fd))
 		goto done;

+	if ((q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS) &&
+	    (stream_req_ctrls || stream_req_ro_ctrls) &&
+	    q.create_requests(media_fd))
+		goto done;
+
 	if (q.queue_all(&fd))
 		goto done;

@@ -1899,8 +1920,10 @@ recover:
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
@@ -2157,12 +2180,11 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
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
@@ -2178,6 +2200,7 @@ static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt
 		fprintf(stderr, "%s: fd.streamoff error\n", __func__);
 		return -1;
 	}
+	in.free_requests();

 	/* release any buffer allocated */
 	if (in.reqbufs(&fd)) {
@@ -2209,10 +2232,25 @@ static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt

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
@@ -2429,6 +2467,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 	unsigned count[2] = { 0, 0 };
 	int fd_flags = fcntl(fd.g_fd(), F_GETFL);
 	bool stopped = false;
+	int media_fd = mi_get_media_fd(fd.g_fd());

 	if (out.reqbufs(&fd, reqbufs_count_out)) {
 		fprintf(stderr, "%s: out.reqbufs failed\n", __func__);
@@ -2448,6 +2487,11 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
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
@@ -2468,45 +2512,38 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
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
-		int rc = select(req_fd + 1, nullptr, nullptr, &except_fds, &tv);
-
-		if (rc == 0) {
-			fprintf(stderr, "Timeout when waiting for media request\n");
-			return;
-		}
-		if (rc < 0) {
-			fprintf(stderr, "Unable to select media request: %s\n",
-				strerror(errno));
+		rc = wait_for_request(fd, out, index);
+		if (rc)
 			return;
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
@@ -2517,6 +2554,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			fprintf(stderr, "%s: do_handle_cap err\n", __func__);
 			return;
 		}
+
 		/*
 		 * in case of an error in the frame, set last ts to 0 as a
 		 * means to recover so that next request will not use a
@@ -2531,7 +2569,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			if (fd.querybuf(cap_buf))
 				return;
 			last_in_buf = cap_buf;
-			queue_lst_buf = true;
+			queue_last_buf = true;
 			if (fin && cap_buf.g_bytesused(0) &&
 			    !(cap_buf.g_flags() & V4L2_BUF_FLAG_ERROR)) {
 				int idx = get_fwht_req_by_ts(cap_buf.g_timestamp_ns());
@@ -2557,8 +2595,7 @@ static void stateless_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 				stopped = true;
 				if (rc != QUEUE_STOPPED)
 					fprintf(stderr, "%s: output stream ended\n", __func__);
-				close(req_fd);
-				fwht_reqs[index].fd = -1;
+				out.free_request(index);
 			}
 		}
 		index = (index + 1) % out.g_buffers();
@@ -2620,8 +2657,9 @@ static void streaming_set_m2m(cv4l_fd &fd, cv4l_fd &exp_fd)
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
index 95b8a2e7..30842b65 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -243,6 +243,8 @@ static struct option long_options[] = {
 	{"stream-to-host", required_argument, nullptr, OptStreamToHost},
 #endif
 	{"stream-buf-caps", no_argument, nullptr, OptStreamBufCaps},
+	{"stream-req-ctrls", no_argument, 0, OptStreamReqCtrls},
+	{"stream-req-ro-ctrls", no_argument, 0, OptStreamReqROCtrls},
 	{"stream-show-delta-now", no_argument, nullptr, OptStreamShowDeltaNow},
 	{"stream-mmap", optional_argument, nullptr, OptStreamMmap},
 	{"stream-user", optional_argument, nullptr, OptStreamUser},
@@ -264,6 +266,8 @@ static struct option long_options[] = {
 	{"stream-out-vert-speed", required_argument, nullptr, OptStreamOutVertSpeed},
 	{"stream-out-perc-fill", required_argument, nullptr, OptStreamOutPercFill},
 	{"stream-out-buf-caps", no_argument, nullptr, OptStreamOutBufCaps},
+	{"stream-out-req-ctrls", no_argument, 0, OptStreamOutReqCtrls},
+	{"stream-out-req-ro-ctrls", no_argument, 0, OptStreamOutReqROCtrls},
 	{"stream-out-mmap", optional_argument, nullptr, OptStreamOutMmap},
 	{"stream-out-user", optional_argument, nullptr, OptStreamOutUser},
 	{"stream-out-dmabuf", no_argument, nullptr, OptStreamOutDmaBuf},
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 24eee3d7..79bece6c 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -224,6 +224,8 @@ enum Option {
 	OptStreamLossless,
 	OptStreamShowDeltaNow,
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
@@ -341,6 +345,8 @@ void common_list(cv4l_fd &fd);
 void common_process_controls(cv4l_fd &fd);
 void common_control_event(const struct v4l2_event *ev);
 int common_find_ctrl_id(const char *name);
+void common_log_ctrls(cv4l_fd &fd, int req_fd, bool read_only,
+		      const char *prefix);

 // v4l2-ctl-tuner.cpp
 void tuner_usage(void);
-- 
2.29.2

