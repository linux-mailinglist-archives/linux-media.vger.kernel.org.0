Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBAB55E0DC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345636AbiF1MOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345633AbiF1MOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:14:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDC7237C9
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:13:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BFF3FB81D2C
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D87EC341CB;
        Tue, 28 Jun 2022 12:13:55 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] v4l2-compliance/ctl: add dynamic array support
Date:   Tue, 28 Jun 2022 14:13:50 +0200
Message-Id: <20220628121352.2916813-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628121352.2916813-1-hverkuil-cisco@xs4all.nl>
References: <20220628121352.2916813-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for dynamic array controls, including vivid-specific
compliance tests.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/linux/videodev2.h                    |   1 +
 utils/common/v4l2-info.cpp                   |   1 +
 utils/v4l2-compliance/v4l2-compliance.h      |   1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp  |  90 ++++++++++++
 utils/v4l2-compliance/v4l2-test-controls.cpp | 147 +++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-common.cpp           |   7 +
 6 files changed, 247 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 5cf38d7c..b01d8d4d 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -1857,6 +1857,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
+#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index b8f2c865..00a5fada 100644
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
index 507187eb..d9efe2cd 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -88,6 +88,7 @@ enum poll_mode {
 
 #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
 
 struct test_query_ext_ctrl: v4l2_query_ext_ctrl {
 	__u64 menu_mask;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index b8de7afc..f2d2ee75 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2007,6 +2007,30 @@ int testRequests(struct node *node, bool test_streaming)
 		.id = VIVID_CID_RO_INTEGER,
 	};
 	v4l2_ext_controls vivid_ro_ctrls = {};
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
 
@@ -2318,6 +2342,34 @@ int testRequests(struct node *node, bool test_streaming)
 		ctrls.request_fd = buf_req_fds[i];
 		if (i % 3 < 2)
 			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
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
 		// Re-init the unqueued request
 		fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_REINIT, nullptr));
 
@@ -2330,6 +2382,15 @@ int testRequests(struct node *node, bool test_streaming)
 		ctrls.request_fd = buf_req_fds[i];
 		if (i % 3 < 2)
 			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+		if (is_vivid && i % 3 < 2) {
+			// Set the dynamic array control again
+			vivid_dyn_array_ctrls.request_fd = buf_req_fds[i];
+			vivid_dyn_array_ctrl.size = (2 + 2 * (i % 8)) * elem_size;
+			memcpy(vivid_dyn_array, vivid_dyn_array_init,
+			       sizeof(vivid_dyn_array_init));
+			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS,
+					     &vivid_dyn_array_ctrls));
+		}
 
 		// After the re-init the buffer is no longer marked for
 		// a request. If a request has been queued before (hence
@@ -2436,6 +2497,20 @@ int testRequests(struct node *node, bool test_streaming)
 			    vivid_ro_ctrl.value != (int)i)
 				warn_once("vivid_ro_ctrl.value (%d) != i (%u)\n",
 					  vivid_ro_ctrl.value, i);
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
 		}
 		fail_on_test(buf.querybuf(node, i));
 		// Check that all the buffers of the stopped stream are
@@ -2486,6 +2561,21 @@ int testRequests(struct node *node, bool test_streaming)
 			    vivid_ro_ctrl.value != (int)(num_bufs - 1))
 				warn("vivid_ro_ctrl.value (%d) != num_bufs - 1 (%d)\n",
 				     vivid_ro_ctrl.value, num_bufs - 1);
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
 		}
 	}
 
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 8731c9eb..999dbcd7 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -627,6 +627,150 @@ static int checkExtendedCtrl(const struct v4l2_ext_control &ctrl, const struct t
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
+	// Check that the end of the buffer isn't overwritten
+	fail_on_test(ctrl.p_u32[max_elems] != 0xdeadbeef);
+
+	ctrl.size = qctrl.elem_size;
+	ctrls.which = V4L2_CTRL_WHICH_DEF_VAL;
+	// Check that ENOSPC is returned if the size is too small
+	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls) != ENOSPC);
+	// And updated to the actual required size
+	fail_on_test(ctrl.size != max_size);
+	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+	for (unsigned i = 0; i < max_elems; i++)
+		fail_on_test(ctrl.p_u32[i] != 50);
+	// Check that the end of the buffer isn't overwritten
+	fail_on_test(ctrl.p_u32[max_elems] != 0xdeadbeef);
+
+	ctrls.which = 0;
+	ctrl.size = qctrl.elem_size;
+	ctrl.p_u32[0] = (qctrl.minimum + qctrl.maximum) / 2;
+	// Back to just one element
+	fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
+	fail_on_test(doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qextctrl));
+	// Check this.
+	fail_on_test(qextctrl.elems != 1);
+
+	ctrl.size = max_size;
+	ctrls.which = V4L2_CTRL_WHICH_DEF_VAL;
+	memset(ctrl.string, 0xff, max_size);
+	// And updated to the actual required size
+	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+	fail_on_test(ctrl.size != qctrl.elem_size);
+	fail_on_test(ctrl.p_u32[0] != 50);
+	fail_on_test(ctrl.p_u32[1] != 0xffffffff);
+
 	return 0;
 }
 
@@ -751,6 +895,9 @@ int testExtendedControls(struct node *node)
 				return fail("s_ext_ctrls returned invalid control contents (%08x)\n", qctrl.id);
 		}
 
+		if (is_vivid && ctrl.id == VIVID_CID_U32_DYN_ARRAY &&
+		    checkVividDynArray(node, ctrl, qctrl))
+			return fail("dynamic array tests failed\n");
 		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD)
 			delete [] ctrl.string;
 		ctrl.string = nullptr;
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 89a9553d..ea46faf2 100644
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
@@ -650,6 +655,8 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 		printf(" value=");
 		print_value(fd, qc, ctrl, false, false);
 	} else {
+		if (qc.flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY)
+			printf(" elems=%u", qc.elems);
 		printf(" dims=");
 		for (i = 0; i < qc.nr_of_dims; i++)
 			printf("[%u]", qc.dims[i]);
-- 
2.35.1

