Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709B155C6CF
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345634AbiF1MOB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345373AbiF1MOA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:14:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16BF237CF
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:13:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 98C53B81DCF
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7F7C341CA;
        Tue, 28 Jun 2022 12:13:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] v4l2-compliance: check vivid pixel array control behavior
Date:   Tue, 28 Jun 2022 14:13:51 +0200
Message-Id: <20220628121352.2916813-3-hverkuil-cisco@xs4all.nl>
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

Changing the input will change the format, which will also change
the dimensions of the pixel array control, and reset the contents
of that array to the default value. Check that this is in fact
happening.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/v4l2-compliance/v4l2-compliance.h       |  1 +
 .../v4l2-test-input-output.cpp                | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index d9efe2cd..ef021ed2 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -89,6 +89,7 @@ enum poll_mode {
 #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
 #define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
+#define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 
 struct test_query_ext_ctrl: v4l2_query_ext_ctrl {
 	__u64 menu_mask;
diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
index 006e05ec..0b3be8db 100644
--- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
+++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
@@ -448,6 +448,44 @@ static int checkInput(struct node *node, const struct v4l2_input &descr, unsigne
 	return 0;
 }
 
+static int checkVividPixelArray(struct node *node)
+{
+	struct v4l2_query_ext_ctrl qextctrl = {
+		.id = VIVID_CID_U8_PIXEL_ARRAY
+	};
+	cv4l_fmt fmt;
+
+	fail_on_test(node->query_ext_ctrl(qextctrl));
+	fail_on_test(node->g_fmt(fmt));
+	fail_on_test(qextctrl.nr_of_dims != 2);
+	fail_on_test(qextctrl.dims[0] != fmt.g_width());
+	fail_on_test(qextctrl.dims[1] != fmt.g_height());
+	fail_on_test(qextctrl.minimum == qextctrl.default_value);
+
+	struct v4l2_ext_control ctrl = {
+		.id = VIVID_CID_U8_PIXEL_ARRAY
+	};
+	struct v4l2_ext_controls ctrls = {
+		.count = 1
+	};
+
+	ctrl.size = qextctrl.elems * qextctrl.elem_size;
+	ctrl.p_u8 = new unsigned char[ctrl.size];
+	ctrls.controls = &ctrl;
+	fail_on_test(node->g_ext_ctrls(ctrls));
+	for (unsigned i = 0; i < qextctrl.elems; i++) {
+		fail_on_test(ctrl.p_u8[i] != qextctrl.default_value);
+		ctrl.p_u8[i] = qextctrl.minimum;
+	}
+	fail_on_test(node->s_ext_ctrls(ctrls));
+	fail_on_test(node->g_ext_ctrls(ctrls));
+	for (unsigned i = 0; i < qextctrl.elems; i++) {
+		fail_on_test(ctrl.p_u8[i] != qextctrl.minimum);
+	}
+	delete [] ctrl.p_u8;
+	return 0;
+}
+
 int testInput(struct node *node)
 {
 	struct v4l2_input descr;
@@ -479,6 +517,14 @@ int testInput(struct node *node)
 		return fail("VIDIOC_G_INPUT didn't fill in the input\n");
 	if (node->is_radio)
 		return fail("radio can't have input support\n");
+	if (is_vivid && cur_input == 0) {
+		// for vivid start off with a different input than the
+		// current one. This ensures that the checkVividPixelArray()
+		// call later succeeds since switching to input 0 will reset
+		// that control to the default values.
+		input = 1;
+		doioctl(node, VIDIOC_S_INPUT, &input);
+	}
 	for (;;) {
 		memset(&descr, 0xff, sizeof(descr));
 		descr.index = i;
@@ -494,6 +540,8 @@ int testInput(struct node *node)
 			return fail("input set to %d, but becomes %d?!\n", i, input);
 		if (checkInput(node, descr, i))
 			return fail("invalid attributes for input %d\n", i);
+		if (is_vivid && node->is_video && checkVividPixelArray(node))
+			return fail("vivid pixel array control test failed\n");
 		node->inputs++;
 		i++;
 	}
-- 
2.35.1

