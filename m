Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFF536D5DC
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239510AbhD1KjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:39:02 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48053 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229772AbhD1KjB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:39:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bha8lUv3dk1MGbhaBlO3Cd; Wed, 28 Apr 2021 12:38:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619606295; bh=cskIwSSgwPb7aSYe9XXxcAGAXBltCKjhmaCVd0Mtb/c=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NtE9YuNODXU98/LwY1TsTPoYPkIt/+afozcu5IPeA62GqpVBltFTWASDhAMMhHd2V
         7T2GfuB2Q4kAu0UKVdxRP1b7DjkQ39GQ+FDkIDjbzvKg8bY+XxN6Grnf2GjPer4bMO
         V1Nxvpxwd5od4vD+oI9wRlm79bqc3CQHmAHvHG8bffeCIvM0loac+riIix4YfC6pL3
         4G/QDu4an58RqsTsBw90BYL2gzw9DSVkrSCJKNEc8y2Zfn9SdSvelh/0BtN/fQKLnc
         G/eg5z2ekbxQOT/AUa8ulchrOwbQtuFgKTXvu460SRZKaKbP7uo+ARE+eHsCwYlqgT
         iBOKeNebq7KUg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH] v4l2-compliance: add tests for dynamic array controls
Message-ID: <438e4d9f-a0ef-9e0b-72f6-764d83a01c4c@xs4all.nl>
Date:   Wed, 28 Apr 2021 12:38:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPwwneEOeyhDYmpWRtHneErPMrVfw4iW0MM45sdN2j5Xr1aAxDm1MIX5QYUkrsay2HU23awIbcZ6bS7fnsofQYr5mjTV6nHveBFJnii1LCeQJ6p8HY7Y
 A3MkcPpnIDfwp8igicseToHCZRNEOyibzcFJvPr5ykbFYm9AmaEmc0eRQ2g649tmiQ/8qu7zvFw1lLHMFFOACWEGrdDiSpb6UwgCW1YV5Xtgut2hiBXxUdGr
 KR8m7WfIVs05i17+RLnQSUbDSPsiQq+bQfUeP6CNGtERgCvBI/JavVIXDm7us7QZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for dynamic array control tests, but it also
improves testing of controls in requests in general.

It also adds a lot of comments to testRequests() since that was getting
hard to understand.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 31d1747e..3026e56e 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -1814,6 +1814,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
+#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800

 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index cb3cb91f..db44c6d6 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -531,6 +531,7 @@ std::string ctrlflags2s(__u32 flags)
 		{ V4L2_CTRL_FLAG_HAS_PAYLOAD,"has-payload" },
 		{ V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, "execute-on-write" },
 		{ V4L2_CTRL_FLAG_MODIFY_LAYOUT, "modify-layout" },
+		{ V4L2_CTRL_FLAG_DYNAMIC_ARRAY, "dynamic-array" },
 		{ 0, nullptr }
 	};
 	return flags2s(flags, def);
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index c2835d95..a23e013d 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -80,6 +80,10 @@ enum poll_mode {
 #define VIVID_CID_QUEUE_ERROR		(VIVID_CID_VIVID_BASE + 70)
 #define VIVID_CID_REQ_VALIDATE_ERROR	(VIVID_CID_VIVID_BASE + 72)

+#define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
+#define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
+
 struct test_query_ext_ctrl: v4l2_query_ext_ctrl {
 	__u64 menu_mask;
 };
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 045f8d54..bef7fe9d 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1950,12 +1950,46 @@ int testRequests(struct node *node, bool test_streaming)
 	struct test_query_ext_ctrl valid_qctrl;
 	v4l2_ext_controls ctrls;
 	v4l2_ext_control ctrl;
+	v4l2_ext_control vivid_ro_ctrl = {
+		.id = VIVID_CID_RO_INTEGER,
+	};
+	v4l2_ext_controls vivid_ro_ctrls = {
+		.which = V4L2_CTRL_WHICH_REQUEST_VAL,
+		.count = 1,
+		.controls = &vivid_ro_ctrl,
+	};
+	// Note: the vivid dynamic array has range 10-90
+	// and the maximum number of elements is 100.
+	__u32 vivid_dyn_array[101] = {};
+	// Initialize with these values
+	static const __u32 vivid_dyn_array_init[16] = {
+		 6, 12, 18, 24, 30, 36, 42, 48,
+		54, 60, 66, 72, 78, 84, 90, 96
+	};
+	// This is the clamped version to compare against
+	static const __u32 vivid_dyn_array_clamped[16] = {
+		10, 12, 18, 24, 30, 36, 42, 48,
+		54, 60, 66, 72, 78, 84, 90, 90
+	};
+	const unsigned elem_size = sizeof(vivid_dyn_array[0]);
+	v4l2_ext_control vivid_dyn_array_ctrl = {
+		.id = VIVID_CID_U32_DYN_ARRAY,
+		.size = elem_size,
+		.p_u32 = vivid_dyn_array,
+	};
+	v4l2_ext_controls vivid_dyn_array_ctrls = {
+		.which = V4L2_CTRL_WHICH_REQUEST_VAL,
+		.count = 1,
+		.controls = &vivid_dyn_array_ctrl,
+	};
 	bool have_controls;
 	int ret;

+	// If requests are supported, then there must be a media device
 	if (node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS)
 		fail_on_test(media_fd < 0);

+	// Check if the driver has controls that can be used to test requests
 	memset(&valid_qctrl, 0, sizeof(valid_qctrl));
 	memset(&ctrls, 0, sizeof(ctrls));
 	memset(&ctrl, 0, sizeof(ctrl));
@@ -1982,42 +2016,57 @@ int testRequests(struct node *node, bool test_streaming)
 			0 : ENOTTY;
 	}

+	// Test if V4L2_CTRL_WHICH_REQUEST_VAL is supported
 	ctrls.which = V4L2_CTRL_WHICH_REQUEST_VAL;
 	ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
 	fail_on_test(ret != EINVAL && ret != EBADR && ret != ENOTTY);
 	have_controls = ret != ENOTTY;

 	if (media_fd < 0 || ret == EBADR) {
+		// Should not happen if requests are supported
 		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
 		return ENOTTY;
 	}
 	if (have_controls) {
 		ctrls.request_fd = 10;
+		// Test that querying controls with an invalid request_fd
+		// returns EINVAL
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != EINVAL);
 	}
 	ret = doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &req_fd);
 	if (ret == ENOTTY) {
+		// Should not happen if requests are supported
 		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
 		return ENOTTY;
 	}
+	// Check that a request was allocated with a valid fd
 	fail_on_test(ret);
-	fhs.add(req_fd);
 	fail_on_test(req_fd < 0);
+	fhs.add(req_fd);
 	if (have_controls) {
 		ctrls.request_fd = req_fd;
+		// The request is in unqueued state, so this should return EACCES
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != EACCES);
 	}
+	// You cannot queue a request that has no buffer
 	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, nullptr) != ENOENT);
+	// REINIT must work for an unqueued request
 	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr));
+	// Close media_fd
 	fhs.del(media_fd);
+	// This should have no effect on req_fd
 	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, nullptr) != ENOENT);
 	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr));
+	// Close req_fd
 	fhs.del(req_fd);
+	// G_EXT_CTRLS must now return EINVAL for req_fd since it no longer exists
 	if (have_controls)
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != EINVAL);
+	// And the media request ioctls now must return EBADF
 	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, nullptr) != EBADF);
 	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr) != EBADF);

+	// Open media_fd and alloc a request again
 	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
 	fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &req_fd));
 	fhs.add(req_fd);
@@ -2026,29 +2075,40 @@ int testRequests(struct node *node, bool test_streaming)
 	if (have_controls) {
 		ctrl.value = valid_qctrl.minimum;
 		ctrls.which = 0;
+		// Set control without requests
 		fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 		ctrl.value = valid_qctrl.maximum;
 		ctrls.which = V4L2_CTRL_WHICH_REQUEST_VAL;
 		ctrls.request_fd = req_fd;
+		// Set control for a request
 		fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 		ctrl.value = valid_qctrl.minimum;
 		ctrls.request_fd = req_fd;
+		// But you cannot get the value of an unqueued request
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != EACCES);
 		ctrls.which = 0;
+		// But you can without a request
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
 		fail_on_test(ctrl.value != valid_qctrl.minimum);
 		ctrls.request_fd = req_fd;
 		ctrls.which = V4L2_CTRL_WHICH_REQUEST_VAL;
 		ctrl.id = 1;
+		// Setting an invalid control in a request must fail
 		fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+		// And also when trying to read an invalid control of a request
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != EACCES);
 	}
 	ctrl.id = valid_qctrl.id;
+	// Close req_fd and media_fd and reopen device node
 	fhs.del(req_fd);
 	fhs.del(media_fd);
 	node->reopen();

 	int type = node->g_type();
+	// For m2m devices g_type() will return the capture type, so
+	// we need to invert it to get the output type.
+	// At the moment only the output type of an m2m device can use
+	// requests.
 	if (node->is_m2m)
 		type = v4l_type_invert(type);
 	if (v4l_type_is_vbi(type)) {
@@ -2059,6 +2119,8 @@ int testRequests(struct node *node, bool test_streaming)
 	}

 	if (!(node->valid_buftypes & (1 << type))) {
+		// If the type is not supported, then check that requests
+		// are also not supported.
 		fail_on_test(node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS);
 		return ENOTTY;
 	}
@@ -2067,46 +2129,60 @@ int testRequests(struct node *node, bool test_streaming)
 	buffer_info.clear();

 	cv4l_queue q(type, V4L2_MEMORY_MMAP);
+	// For m2m devices q is the output queue and m2m_q is the capture queue
 	cv4l_queue m2m_q(v4l_type_invert(type));

 	q.init(type, V4L2_MEMORY_MMAP);
-	fail_on_test(q.reqbufs(node, 2));
+	fail_on_test(q.reqbufs(node, 15));

 	unsigned min_bufs = q.g_buffers();
-	fail_on_test(q.reqbufs(node, min_bufs + 4));
+	fail_on_test(q.reqbufs(node, min_bufs + 6));
 	unsigned num_bufs = q.g_buffers();
+	// Create twice as many requests as there are buffers
 	unsigned num_requests = 2 * num_bufs;
 	last_seq.init();

 	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));

+	// Allocate the requests
 	for (unsigned i = 0; i < num_requests; i++) {
 		fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &buf_req_fds[i]));
 		fhs.add(buf_req_fds[i]);
 		fail_on_test(buf_req_fds[i] < 0);
+		// Check that empty requests can't be queued
 		fail_on_test(!doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr));
 	}
+	// close the media fd, should not be needed anymore
 	fhs.del(media_fd);

 	buffer buf(q);

 	fail_on_test(buf.querybuf(node, 0));
+	// Queue a buffer without using requests
 	ret = buf.qbuf(node);
+	// If this fails, then that can only happen if the queue
+	// requires requests. In that case EBADR is returned.
 	fail_on_test(ret && ret != EBADR);
 	fail_on_test(buf.querybuf(node, 1));
+	// Now try to queue the buffer to the request
 	buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
 	buf.s_request_fd(buf_req_fds[1]);
+	// If requests are required, then this must now work
+	// If requests are optional, then this must now fail since the
+	// queue in is non-request mode.
 	if (ret == EBADR)
 		fail_on_test(buf.qbuf(node));
 	else
 		fail_on_test(!buf.qbuf(node));

+	// Reopen device node, clearing any pending requests
 	node->reopen();

 	q.init(type, V4L2_MEMORY_MMAP);
 	fail_on_test(q.reqbufs(node, num_bufs));

 	if (node->is_m2m) {
+		// Setup the capture queue
 		fail_on_test(m2m_q.reqbufs(node, 2));
 		fail_on_test(node->streamon(m2m_q.g_type()));

@@ -2115,6 +2191,9 @@ int testRequests(struct node *node, bool test_streaming)
 		fail_on_test(buf.querybuf(node, 0));
 		buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
 		buf.s_request_fd(buf_req_fds[0]);
+		// Only the output queue can support requests,
+		// so if the capture queue also supports requests,
+		// then something is wrong.
 		fail_on_test(!buf.qbuf(node));
 		fail_on_test(node->streamoff(m2m_q.g_type()));
 		fail_on_test(m2m_q.reqbufs(node, 0));
@@ -2128,10 +2207,12 @@ int testRequests(struct node *node, bool test_streaming)
 		buffer buf(q);

 		fail_on_test(buf.querybuf(node, i));
+		// No request was set, so this should return 0
 		fail_on_test(buf.g_request_fd());
 		buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
 		if (i == 0) {
 			buf.s_request_fd(-1);
+			// Can't queue to an invalid request fd
 			fail_on_test(!buf.qbuf(node));
 			buf.s_request_fd(0xdead);
 			fail_on_test(!buf.qbuf(node));
@@ -2140,25 +2221,34 @@ int testRequests(struct node *node, bool test_streaming)
 		if (v4l_type_is_video(buf.g_type()))
 			buf.s_field(V4L2_FIELD_ANY);
 		if (!(i & 1)) {
+			// VIDIOC_PREPARE_BUF is incompatible with requests
 			fail_on_test(buf.prepare_buf(node) != EINVAL);
 			buf.s_flags(0);
+			// Test vivid error injection
 			if (node->inject_error(VIVID_CID_BUF_PREPARE_ERROR))
 				fail_on_test(buf.prepare_buf(node) != EINVAL);
 			fail_on_test(buf.prepare_buf(node));
 			fail_on_test(buf.querybuf(node, i));
+			// Check that the buffer was prepared
 			fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_PREPARED));
 			buf.s_flags(buf.g_flags() | V4L2_BUF_FLAG_REQUEST_FD);
 			buf.s_request_fd(buf_req_fds[i]);
 		}
+		// Queue the buffer to the request
 		int err = buf.qbuf(node);
 		if (!err) {
+			// If requests are not supported, this should fail
 			fail_on_test(!supports_requests);
+			// You can't queue the same buffer again
 			fail_on_test(!buf.qbuf(node));
 		} else {
+			// Can only fail if requests are not supported
 			fail_on_test(supports_requests);
+			// and should fail with EBADR in that case
 			fail_on_test(err != EBADR);
 		}
 		if (err) {
+			// Requests are not supported, so clean up and return
 			fail_on_test(node->streamoff(q.g_type()));
 			fail_on_test(q.reqbufs(node, 0));
 			if (node->is_m2m) {
@@ -2169,11 +2259,14 @@ int testRequests(struct node *node, bool test_streaming)
 			node->reopen();
 			return ENOTTY;
 		}
+		// Check flags and request fd
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST));
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
 		fail_on_test(buf.g_request_fd() < 0);
+		// Query the buffer again
 		fail_on_test(buf.querybuf(node, i));
+		// Check returned flags and request fd
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST));
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
@@ -2182,55 +2275,118 @@ int testRequests(struct node *node, bool test_streaming)
 			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_PREPARED);
 		else
 			fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_PREPARED));
+		// Check that you can't queue it again
 		buf.s_request_fd(buf_req_fds[i]);
 		fail_on_test(!buf.qbuf(node));

+		// Set a control in the request, except for every third request.
 		ctrl.value = (i & 1) ? valid_qctrl.maximum : valid_qctrl.minimum;
 		ctrls.request_fd = buf_req_fds[i];
-		fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+		if (i % 3 < 2)
+			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+		if (is_vivid) {
+			// For vivid, check dynamic array support:
+			vivid_dyn_array_ctrls.request_fd = buf_req_fds[i];
+			vivid_dyn_array_ctrl.size = sizeof(vivid_dyn_array);
+			memset(vivid_dyn_array, 0xff, sizeof(vivid_dyn_array));
+			// vivid_dyn_array_ctrl.size is too large, must return ENOSPC
+			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS,
+					     &vivid_dyn_array_ctrls) != ENOSPC);
+			// and size is set at 100 elems
+			fail_on_test(vivid_dyn_array_ctrl.size != 100 * elem_size);
+			// Check that the array is not overwritten
+			fail_on_test(vivid_dyn_array[0] != 0xffffffff);
+			if (i % 3 < 2) {
+				unsigned size = (2 + 2 * (i % 8)) * elem_size;
+
+				// Set proper size, varies per request
+				vivid_dyn_array_ctrl.size = size;
+				memcpy(vivid_dyn_array, vivid_dyn_array_init, size);
+				fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS,
+						     &vivid_dyn_array_ctrls));
+				// check that the size is as expected
+				fail_on_test(vivid_dyn_array_ctrl.size != size);
+				// and the array values are correctly clamped
+				fail_on_test(memcmp(vivid_dyn_array, vivid_dyn_array_clamped, size));
+				// and the end of the array is not overwritten
+				fail_on_test(vivid_dyn_array[size / elem_size] != 0xffffffff);
+			}
+		}
+		// Re-init the unqueued request
 		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr));

+		// Make sure that the buffer is no longer in a request
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD);

+		// Set the control again
 		ctrls.request_fd = buf_req_fds[i];
-		fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
-
+		if (i % 3 < 2)
+			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+		if (is_vivid && i % 3 < 2) {
+			// Set the dynamic array control again
+			vivid_dyn_array_ctrls.request_fd = buf_req_fds[i];
+			vivid_dyn_array_ctrl.size = (2 + 2 * (i % 8)) * elem_size;
+			memcpy(vivid_dyn_array, vivid_dyn_array_init,
+			       sizeof(vivid_dyn_array_init));
+			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS,
+					     &vivid_dyn_array_ctrls));
+		}
+
+		// After the re-init the buffer is no longer marked for
+		// a request. If a request has been queued before (hence
+		// the 'if (i)' check), then queuing the buffer without
+		// a request must fail since you can't mix the two streamining
+		// models.
 		if (i)
 			fail_on_test(!buf.qbuf(node));
 		buf.s_flags(buf.g_flags() | V4L2_BUF_FLAG_REQUEST_FD);
 		buf.s_request_fd(buf_req_fds[i]);
 		buf.s_field(V4L2_FIELD_ANY);
+		// Queue the buffer for the request
 		fail_on_test(buf.qbuf(node));
+		// Verify that drivers will replace FIELD_ANY for video output queues
 		if (v4l_type_is_video(buf.g_type()) && v4l_type_is_output(buf.g_type()))
 			fail_on_test(buf.g_field() == V4L2_FIELD_ANY);
+		// Query buffer and check that it is marked as being part of a request
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST));
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
+		// Use vivid to check buffer prepare or request validation error injection
 		if ((i & 1) && node->inject_error(i > num_bufs / 2 ?
 						  VIVID_CID_BUF_PREPARE_ERROR :
 						  VIVID_CID_REQ_VALIDATE_ERROR))
 			fail_on_test(doioctl_fd(buf_req_fds[i],
 						MEDIA_REQUEST_IOC_QUEUE, nullptr) != EINVAL);
+		// Queue the request
 		ret = doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr);
 		if (node->codec_mask & STATELESS_DECODER) {
+			// Stateless decoders might require that certain
+			// controls are present in the request. In that
+			// case they return ENOENT and we just stop testing
+			// since we don't know what those controls are.
 			fail_on_test(ret != ENOENT);
 			test_streaming = false;
 			break;
 		}
 		fail_on_test(ret);
 		fail_on_test(buf.querybuf(node, i));
+		// Check that the buffer is now queued up
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_IN_REQUEST);
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD));
 		fail_on_test(!(buf.g_flags() & V4L2_BUF_FLAG_QUEUED));
+		// Re-initing or requeuing the request is no longer possible
 		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr) != EBUSY);
 		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr) != EBUSY);
 		if (i >= min_bufs) {
+			// Close some of the request fds to check that this
+			// is safe to do
 			close(buf_req_fds[i]);
 			buf_req_fds[i] = -1;
 		}
 		if (i == min_bufs - 1) {
+			// Check vivid STREAMON error injection
 			if (node->inject_error(VIVID_CID_START_STR_ERROR))
 				fail_on_test(!node->streamon(q.g_type()));
 			fail_on_test(node->streamon(q.g_type()));
@@ -2242,45 +2398,126 @@ int testRequests(struct node *node, bool test_streaming)
 	if (test_streaming) {
 		unsigned capture_count;

-		fail_on_test(captureBufs(node, node, q, m2m_q, num_bufs,
+		// Continue streaming
+		// For m2m devices captureBufs() behaves a bit odd: you pass
+		// in the total number of output buffers that you want to
+		// stream, but since there are already q.g_buffers() output
+		// buffers queued up (see previous loop), the captureBufs()
+		// function will subtract that from frame_count, so it will
+		// only queue frame_count - q.g_buffers() output buffers.
+		// In order to ensure we captured at least
+		// min_bufs buffers we need to add min_bufs to the frame_count.
+		fail_on_test(captureBufs(node, node, q, m2m_q,
+					 num_bufs + (node->is_m2m ? min_bufs : 0),
 					 POLL_MODE_SELECT, capture_count));
 	}
 	fail_on_test(node->streamoff(q.g_type()));

+	// Note that requests min_bufs...2*min_bufs-1 close their filehandles,
+	// so here we just go through the first half of the requests.
 	for (unsigned i = 0; test_streaming && i < min_bufs; i++) {
 		buffer buf(q);

+		// Get the control
 		ctrls.request_fd = buf_req_fds[i];
 		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
-		fail_on_test(ctrl.value != ((i & 1) ? valid_qctrl.maximum :
+		bool is_max = i & 1;
+		// Since the control was not set for every third request,
+		// the value will actually be that of the previous request.
+		if (i % 3 == 2)
+			is_max = !is_max;
+		// Check that the value is as expected
+		fail_on_test(ctrl.value != (is_max ? valid_qctrl.maximum :
 			     valid_qctrl.minimum));
+		if (is_vivid) {
+			// vivid specific: check that the read-only control
+			// of the completed request has the expected value
+			// (sequence number & 0xff).
+			vivid_ro_ctrls.request_fd = buf_req_fds[i];
+			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_ro_ctrls));
+			if (node->is_video && !node->can_output)
+				fail_on_test(vivid_ro_ctrl.value != (int)i);
+
+			// Check that the dynamic control array is set as
+			// expected and with the correct values.
+			vivid_dyn_array_ctrls.request_fd = buf_req_fds[i];
+			memset(vivid_dyn_array, 0xff, sizeof(vivid_dyn_array));
+			vivid_dyn_array_ctrl.size = sizeof(vivid_dyn_array);
+			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_dyn_array_ctrls));
+			unsigned size = (2 + 2 * (i % 8)) * elem_size;
+			if (i % 3 == 2)
+				size = (2 + 2 * ((i - 1) % 8)) * elem_size;
+			fail_on_test(vivid_dyn_array_ctrl.size != size);
+			fail_on_test(memcmp(vivid_dyn_array, vivid_dyn_array_clamped,
+					    vivid_dyn_array_ctrl.size));
+			fail_on_test(vivid_dyn_array[size / elem_size] != 0xffffffff);
+		}
 		fail_on_test(buf.querybuf(node, i));
+		// Check that all the buffers of the stopped stream are
+		// no longer marked as belonging to a request.
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD);
 		fail_on_test(buf.g_request_fd());
 		struct pollfd pfd = {
 			buf_req_fds[i],
 			POLLPRI, 0
 		};
+		// Check that polling the request fd will immediately return,
+		// indicating that the request has completed.
 		fail_on_test(poll(&pfd, 1, 100) != 1);
+		// Requeuing the request must fail
 		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, nullptr) != EBUSY);
+		// But reinit must succeed.
 		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr));
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD);
 		fail_on_test(buf.g_request_fd());
-		fhs.del(buf_req_fds[i]);
 		ctrls.request_fd = buf_req_fds[i];
+		// Check that getting controls from a reinited request fails
 		fail_on_test(!doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+		// Close the request fd
+		fhs.del(buf_req_fds[i]);
+		buf_req_fds[i] = -1;
 	}
+	// Close any remaining open request fds
 	for (unsigned i = 0; i < num_requests; i++)
 		if (buf_req_fds[i] >= 0)
 			fhs.del(buf_req_fds[i]);

+	// Getting the current control value must work
 	ctrls.which = 0;
 	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
-	if (test_streaming)
-		fail_on_test(ctrl.value != (((num_bufs - 1) & 1) ? valid_qctrl.maximum :
+	// Check the final control value
+	if (test_streaming) {
+		bool is_max = (num_bufs - 1) & 1;
+		if ((num_bufs - 1) % 3 == 2)
+			is_max = !is_max;
+		fail_on_test(ctrl.value != (is_max ? valid_qctrl.maximum :
 					    valid_qctrl.minimum));
-
+		if (is_vivid) {
+			// For vivid check the final read-only value
+			vivid_ro_ctrls.which = 0;
+			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_ro_ctrls));
+			if (node->is_video && !node->can_output)
+				fail_on_test(vivid_ro_ctrl.value != (int)(num_bufs - 1));
+
+			// and the final dynamic array value
+			v4l2_query_ext_ctrl q_dyn_array = {
+				.id = VIVID_CID_U32_DYN_ARRAY,
+			};
+			fail_on_test(doioctl(node, VIDIOC_QUERY_EXT_CTRL, &q_dyn_array));
+			unsigned elems = 2 + 2 * ((num_bufs - 1) % 8);
+			if ((num_bufs - 1) % 3 == 2)
+				elems = 2 + 2 * ((num_bufs - 2) % 8);
+			fail_on_test(q_dyn_array.elems != elems);
+			vivid_dyn_array_ctrls.which = 0;
+			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_dyn_array_ctrls));
+			fail_on_test(vivid_dyn_array_ctrl.size != elems * elem_size);
+			fail_on_test(memcmp(vivid_dyn_array, vivid_dyn_array_clamped,
+					    vivid_dyn_array_ctrl.size));
+		}
+	}
+
+	// Cleanup
 	fail_on_test(q.reqbufs(node, 0));
 	if (node->is_m2m) {
 		fail_on_test(node->streamoff(m2m_q.g_type()));
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 4be2f61c..33bc6a43 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -617,6 +617,128 @@ static int checkExtendedCtrl(const struct v4l2_ext_control &ctrl, const struct t
 	default:
 		break;
 	}
+	if (qctrl.flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) {
+		fail_on_test(qctrl.nr_of_dims != 1);
+		unsigned tot_elems = qctrl.dims[0];
+		fail_on_test(qctrl.elems > tot_elems);
+		fail_on_test(!qctrl.elems);
+	}
+	return 0;
+}
+
+static int checkVividDynArray(struct node *node,
+			      struct v4l2_ext_control &ctrl,
+			      const struct test_query_ext_ctrl &qctrl)
+{
+	struct v4l2_query_ext_ctrl qextctrl = {};
+	unsigned max_elems = qctrl.dims[0];
+	unsigned max_size = qctrl.elem_size * max_elems;
+
+	delete [] ctrl.string;
+	// Allocate a buffer that's one element more than the max
+	ctrl.string = new char[max_size + qctrl.elem_size];
+	ctrl.size = qctrl.elem_size;
+	ctrl.p_u32[0] = (qctrl.minimum + qctrl.maximum) / 2;
+	// Set the last element + 1, must never be overwritten
+	ctrl.p_u32[max_elems] = 0xdeadbeef;
+
+	struct v4l2_ext_controls ctrls = {};
+	ctrls.count = 1;
+	ctrls.controls = &ctrl;
+	// Set the array to a single element
+	fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+
+	qextctrl.id = ctrl.id;
+	// Check that only one element is reported
+	fail_on_test(doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qextctrl));
+	fail_on_test(qextctrl.elems != 1);
+
+	// If the size is less than elem_size, the ioctl must return -EFAULT
+	ctrl.size = 0;
+	fail_on_test(doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls) != EFAULT);
+	ctrl.size = qctrl.elem_size - 1;
+	fail_on_test(doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls) != EFAULT);
+	ctrl.size = max_size + qctrl.elem_size;
+	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+	// Check that ctrl.size is reset to the current size of the array (1 element)
+	fail_on_test(ctrl.size != qctrl.elem_size);
+	ctrl.size = max_size + qctrl.elem_size;
+	// Attempting to set more than max_elems must result in -ENOSPC
+	fail_on_test(doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls) != ENOSPC);
+	fail_on_test(ctrl.size != max_size);
+	ctrl.size = max_size + qctrl.elem_size;
+	fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls) != ENOSPC);
+	fail_on_test(ctrl.size != max_size);
+	fail_on_test(doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qextctrl));
+	// Verify that the number of elements is still 1
+	fail_on_test(qextctrl.elems != 1);
+
+	ctrl.size = max_size;
+	for (unsigned i = 0; i < max_elems; i++)
+		ctrl.p_u32[i] = i;
+	// Try the max number of elements
+	fail_on_test(doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
+	// Check that the values are clamped
+	for (unsigned i = 0; i < max_elems; i++) {
+		unsigned j = i;
+		if (j < qctrl.minimum)
+			j = qctrl.minimum;
+		else if (j > qctrl.maximum)
+			j = qctrl.maximum;
+		fail_on_test(ctrl.p_u32[i] != j);
+	}
+	fail_on_test(ctrl.size != max_size);
+	fail_on_test(doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qextctrl));
+	// Verify that the number of elements is still 1
+	fail_on_test(qextctrl.elems != 1);
+	memset(ctrl.string, 0xff, max_size);
+	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+	// Check that there is still just one element returned.
+	fail_on_test(ctrl.size != qctrl.elem_size);
+	fail_on_test(ctrl.p_u32[0] != (qctrl.minimum + qctrl.maximum) / 2);
+
+	ctrl.size = max_size;
+	for (unsigned i = 0; i < max_elems; i++)
+		ctrl.p_u32[i] = i;
+	// Set the max number of elements
+	fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	for (unsigned i = 0; i < max_elems; i++) {
+		unsigned j = i;
+		if (j < qctrl.minimum)
+			j = qctrl.minimum;
+		else if (j > qctrl.maximum)
+			j = qctrl.maximum;
+		fail_on_test(ctrl.p_u32[i] != j);
+	}
+	fail_on_test(doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qextctrl));
+	// Check that it is updated
+	fail_on_test(qextctrl.elems != max_elems);
+	memset(ctrl.string, 0xff, max_size);
+	ctrl.size = qctrl.elem_size;
+	// Check that ENOSPC is returned if the size is too small
+	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != ENOSPC);
+	// And updated to the actual required size
+	fail_on_test(ctrl.size != max_size);
+	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+	for (unsigned i = 0; i < max_elems; i++) {
+		unsigned j = i;
+		if (j < qctrl.minimum)
+			j = qctrl.minimum;
+		else if (j > qctrl.maximum)
+			j = qctrl.maximum;
+		fail_on_test(ctrl.p_u32[i] != j);
+	}
+	ctrl.size = qctrl.elem_size;
+	ctrl.p_u32[0] = (qctrl.minimum + qctrl.maximum) / 2;
+	// Back to just one element
+	fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qextctrl));
+	// Check this.
+	fail_on_test(qextctrl.elems != 1);
+
+	// Check that the end of the buffer isn't overwritten
+	fail_on_test(ctrl.p_u32[max_elems] != 0xdeadbeef);
+
 	return 0;
 }

@@ -738,7 +860,11 @@ int testExtendedControls(struct node *node)
 			if (checkExtendedCtrl(ctrl, qctrl))
 				return fail("s_ext_ctrls returned invalid control contents (%08x)\n", qctrl.id);
 		}
-		if (qctrl.type == V4L2_CTRL_TYPE_STRING)
+
+		if (is_vivid && ctrl.id == VIVID_CID_U32_DYN_ARRAY &&
+		    checkVividDynArray(node, ctrl, qctrl))
+			return fail("dynamic array tests failed\n");
+		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD)
 			delete [] ctrl.string;
 		ctrl.string = nullptr;
 	}
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 17ad488d..32f67193 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -390,6 +390,9 @@ static bool fill_subset(const struct v4l2_query_ext_ctrl &qc, ctrl_subset &subse
 		subset.size[d] = qc.dims[d];
 	}

+	if (qc.flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY)
+		subset.size[0] = qc.elems;
+
 	std::string s = name2var(qc.name);

 	if (ctrl_subsets.find(s) != ctrl_subsets.end()) {
@@ -489,6 +492,8 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
 			memset(&subset, 0, sizeof(subset));
 			for (unsigned i = 0; i < qc.nr_of_dims; i++)
 				subset.size[i] = qc.dims[i];
+			if (qc.flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY)
+				subset.size[0] = qc.elems;
 		}
 		print_array(qc, ctrl, subset);
 		return;
@@ -629,6 +634,8 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 		printf(" value=");
 		print_value(fd, qc, ctrl, false, false);
 	} else {
+		if (qc.flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY)
+			printf(" elems=%u", qc.elems);
 		printf(" dims=");
 		for (i = 0; i < qc.nr_of_dims; i++)
 			printf("[%u]", qc.dims[i]);
