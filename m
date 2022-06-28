Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A7B55DCDA
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345637AbiF1MOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345635AbiF1MOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:14:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9562317D
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:14:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D29BDB81DCD
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC013C3411D;
        Tue, 28 Jun 2022 12:13:57 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] v4l2-compliance: test of vivid's pixel array in requests
Date:   Tue, 28 Jun 2022 14:13:52 +0200
Message-Id: <20220628121352.2916813-4-hverkuil-cisco@xs4all.nl>
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

Verify that using an array control in a request works fine.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 61 ++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index f2d2ee75..bc9050c8 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2031,6 +2031,15 @@ int testRequests(struct node *node, bool test_streaming)
 		.count = 1,
 		.controls = &vivid_dyn_array_ctrl,
 	};
+	unsigned vivid_pixel_array_size = 0;
+	v4l2_ext_control vivid_pixel_array_ctrl = {
+		.id = VIVID_CID_U8_PIXEL_ARRAY,
+	};
+	v4l2_ext_controls vivid_pixel_array_ctrls = {
+		.which = V4L2_CTRL_WHICH_REQUEST_VAL,
+		.count = 1,
+		.controls = &vivid_pixel_array_ctrl,
+	};
 	bool have_controls;
 	int ret;
 
@@ -2042,6 +2051,16 @@ int testRequests(struct node *node, bool test_streaming)
 	vivid_ro_ctrls.count = 1;
 	vivid_ro_ctrls.controls = &vivid_ro_ctrl;
 
+	if (is_vivid) {
+		v4l2_query_ext_ctrl qec = { .id = VIVID_CID_U8_PIXEL_ARRAY };
+		node->query_ext_ctrl(qec);
+		vivid_pixel_array_size = qec.elems;
+	}
+	__u8 vivid_pixel_array[vivid_pixel_array_size + 1];
+	vivid_pixel_array[vivid_pixel_array_size] = 0xff;
+	vivid_pixel_array_ctrl.size = vivid_pixel_array_size;
+	vivid_pixel_array_ctrl.p_u8 = vivid_pixel_array;
+
 	// If requests are supported, then there must be a media device
 	if (node->buf_caps & V4L2_BUF_CAP_SUPPORTS_REQUESTS)
 		fail_on_test(media_fd < 0);
@@ -2343,6 +2362,13 @@ int testRequests(struct node *node, bool test_streaming)
 		if (i % 3 < 2)
 			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 		if (is_vivid) {
+			// For vivid, check modifiable array support
+			memset(vivid_pixel_array, i, vivid_pixel_array_size);
+			vivid_pixel_array_ctrls.request_fd = buf_req_fds[i];
+			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS,
+					     &vivid_pixel_array_ctrls));
+			fail_on_test(vivid_pixel_array[vivid_pixel_array_size] != 0xff);
+
 			// For vivid, check dynamic array support:
 			vivid_dyn_array_ctrls.request_fd = buf_req_fds[i];
 			vivid_dyn_array_ctrl.size = sizeof(vivid_dyn_array);
@@ -2383,6 +2409,11 @@ int testRequests(struct node *node, bool test_streaming)
 		if (i % 3 < 2)
 			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 		if (is_vivid && i % 3 < 2) {
+			// Set the pixel array control again
+			memset(vivid_pixel_array, i, vivid_pixel_array_size);
+			vivid_pixel_array_ctrls.request_fd = buf_req_fds[i];
+			fail_on_test(doioctl(node, VIDIOC_S_EXT_CTRLS,
+					     &vivid_pixel_array_ctrls));
 			// Set the dynamic array control again
 			vivid_dyn_array_ctrls.request_fd = buf_req_fds[i];
 			vivid_dyn_array_ctrl.size = (2 + 2 * (i % 8)) * elem_size;
@@ -2511,6 +2542,20 @@ int testRequests(struct node *node, bool test_streaming)
 			fail_on_test(memcmp(vivid_dyn_array, vivid_dyn_array_clamped,
 					    vivid_dyn_array_ctrl.size));
 			fail_on_test(vivid_dyn_array[size / elem_size] != 0xffffffff);
+			// Check that the pixel array control is set as
+			// expected and with the correct values.
+			vivid_pixel_array_ctrls.request_fd = buf_req_fds[i];
+			memset(vivid_pixel_array, 0xfe, vivid_pixel_array_size);
+			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_pixel_array_ctrls));
+			bool ok = true;
+			__u8 expected = (i % 3 == 2) ? i - 1 : i;
+			for (unsigned j = 0; j < vivid_pixel_array_size; j++)
+				if (vivid_pixel_array[j] != expected) {
+					ok = false;
+					break;
+				}
+			fail_on_test(!ok);
+			fail_on_test(vivid_pixel_array[vivid_pixel_array_size] != 0xff);
 		}
 		fail_on_test(buf.querybuf(node, i));
 		// Check that all the buffers of the stopped stream are
@@ -2554,7 +2599,7 @@ int testRequests(struct node *node, bool test_streaming)
 		fail_on_test(ctrl.value != (is_max ? valid_qctrl.maximum :
 					    valid_qctrl.minimum));
 		if (is_vivid) {
-			// For vivid check the final read-only value
+			// For vivid check the final read-only value,
 			vivid_ro_ctrls.which = 0;
 			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_ro_ctrls));
 			if (node->is_video && !node->can_output &&
@@ -2562,7 +2607,7 @@ int testRequests(struct node *node, bool test_streaming)
 				warn("vivid_ro_ctrl.value (%d) != num_bufs - 1 (%d)\n",
 				     vivid_ro_ctrl.value, num_bufs - 1);
 
-			// and the final dynamic array value
+			// the final dynamic array value,
 			v4l2_query_ext_ctrl q_dyn_array = {
 				.id = VIVID_CID_U32_DYN_ARRAY,
 			};
@@ -2576,6 +2621,18 @@ int testRequests(struct node *node, bool test_streaming)
 			fail_on_test(vivid_dyn_array_ctrl.size != elems * elem_size);
 			fail_on_test(memcmp(vivid_dyn_array, vivid_dyn_array_clamped,
 					    vivid_dyn_array_ctrl.size));
+
+			// and the final pixel array value.
+			vivid_pixel_array_ctrls.which = 0;
+			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_pixel_array_ctrls));
+			bool ok = true;
+			__u8 expected = (num_bufs - 1) % 3 == 2 ? num_bufs - 2 : num_bufs - 1;
+			for (unsigned j = 0; j < vivid_pixel_array_size; j++)
+				if (vivid_pixel_array[j] != expected) {
+					ok = false;
+					break;
+				}
+			fail_on_test(!ok);
 		}
 	}
 
-- 
2.35.1

