Return-Path: <linux-media+bounces-16473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564A9569D7
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B100F2848BA
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4522916B38B;
	Mon, 19 Aug 2024 11:47:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5716A95B
	for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068074; cv=none; b=MvdxYGdMQSXkO4jXLCoUT0xzWJqgEYyCc4D8bmxfoO4mSbcLspShpsZWTXSCtaxEkvAiqiRSm/IjiVVllU4/x3PUiy+4qL1CGQ7HS3C/Y9bN04yqBjPm9iH6GzX/i+8EPsMahK7uJ0yrXumSgRS/5mw5lAXf2XAWZ3Tm61SdSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068074; c=relaxed/simple;
	bh=19gBCHVY74JSGZLM3S0kA4tTI+cdT8MVIWwK/UfBhQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIC42Hv/2sTg587t6utZUqyI8fcdwwllKjOhSAUkFC+VsK6y2Ac7ei7Gj1OjhPfO3gNoVtLG0bvF7aAlcLsIkDmlaH/uWS6cLLkCaC+sThaiqSqBPiMGc2vQ+4WMbOwuQ36bjEXCBWHnckQEtQ0W9ahkY9i9vHuyeSpcE3SMJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91F7C4AF09;
	Mon, 19 Aug 2024 11:47:53 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] v4l2-compliance: add support for V4L2_CAP_EDID
Date: Mon, 19 Aug 2024 13:45:44 +0200
Message-ID: <f4142c49c8bee0c4e7bc9af652fd1913e47fd9ae.1724067944.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724067944.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724067944.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests for devices that only support G/S_EDID and
ENUM/G/S_INPUT or OUTPUT.

Co-developed-by: Erling Ljunggren <hljunggr@cisco.com>
Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/v4l2-compliance/v4l2-compliance.cpp     | 17 ++++++++++++++---
 utils/v4l2-compliance/v4l2-test-io-config.cpp |  4 +++-
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 144f9618..c2832401 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -645,6 +645,7 @@ static int testCap(struct node *node)
 		V4L2_CAP_VIDEO_M2M_MPLANE;
 	const __u32 splane_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT |
 		V4L2_CAP_VIDEO_M2M;
+	const __u32 edid_caps = V4L2_CAP_EDID;
 
 	memset(&vcap, 0xff, sizeof(vcap));
 	fail_on_test(doioctl(node, VIDIOC_QUERYCAP, &vcap));
@@ -663,6 +664,7 @@ static int testCap(struct node *node)
 	    memcmp(vcap.bus_info, "platform:", 9) &&
 	    memcmp(vcap.bus_info, "rmi4:", 5) &&
 	    memcmp(vcap.bus_info, "libcamera:", 10) &&
+	    memcmp(vcap.bus_info, "serio:", 6) &&
 	    memcmp(vcap.bus_info, "gadget.", 7))
 		return fail("missing bus_info prefix ('%s')\n", vcap.bus_info);
 	if (!node->media_bus_info.empty() &&
@@ -685,7 +687,7 @@ static int testCap(struct node *node)
 	// for a modern driver for both caps and dcaps
 	fail_on_test(!(caps & V4L2_CAP_EXT_PIX_FORMAT));
 	//fail_on_test(!(dcaps & V4L2_CAP_EXT_PIX_FORMAT));
-	fail_on_test(node->is_video && !(dcaps & video_caps));
+	fail_on_test(node->is_video && !(dcaps & video_caps || dcaps & edid_caps));
 	fail_on_test(node->is_radio && !(dcaps & radio_caps));
 	// V4L2_CAP_AUDIO is invalid for radio and sdr
 	fail_on_test(node->is_radio && (dcaps & V4L2_CAP_AUDIO));
@@ -1034,6 +1036,14 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 			 V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_SLICED_VBI_OUTPUT |
 			 V4L2_CAP_META_OUTPUT))
 		node.has_outputs = true;
+	if (node.g_caps() & V4L2_CAP_EDID) {
+		int tmp;
+
+		if (!ioctl(node.g_fd(), VIDIOC_G_INPUT, &tmp))
+			node.has_inputs = true;
+		else if (!ioctl(node.g_fd(), VIDIOC_G_OUTPUT, &tmp))
+			node.has_outputs = true;
+	}
 	if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
 			 V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_VIDEO_M2M_MPLANE |
 			 V4L2_CAP_VIDEO_M2M | V4L2_CAP_SLICED_VBI_CAPTURE |
@@ -1400,20 +1410,21 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.valid_buftypes = 0;
 		node.valid_memorytype = 0;
 		node.buf_caps = 0;
+		node.cur_io_caps = 0;
 		for (auto &buftype_pixfmt : node.buftype_pixfmts)
 			buftype_pixfmt.clear();
 
 		if (max_io) {
 			sprintf(suffix, " (%s %u)",
 				node.can_capture ? "Input" : "Output", io);
-			if (node.can_capture) {
+			if (node.has_inputs) {
 				struct v4l2_input descr;
 
 				doioctl(&node, VIDIOC_S_INPUT, &io);
 				descr.index = io;
 				doioctl(&node, VIDIOC_ENUMINPUT, &descr);
 				node.cur_io_caps = descr.capabilities;
-			} else {
+			} else if (node.has_outputs) {
 				struct v4l2_output descr;
 
 				doioctl(&node, VIDIOC_S_OUTPUT, &io);
diff --git a/utils/v4l2-compliance/v4l2-test-io-config.cpp b/utils/v4l2-compliance/v4l2-test-io-config.cpp
index dcab40b8..48eabe04 100644
--- a/utils/v4l2-compliance/v4l2-test-io-config.cpp
+++ b/utils/v4l2-compliance/v4l2-test-io-config.cpp
@@ -513,8 +513,10 @@ static int checkEdid(struct node *node, unsigned pad, bool is_input)
 		fail_on_test(doioctl(node, VIDIOC_S_EDID, &edid) != ENOTTY);
 		return ENOTTY;
 	}
+	if (!is_input && ret == ENODATA)
+		return 0;
 	has_edid = ret == 0;
-	fail_on_test(ret && ret != EINVAL);
+	fail_on_test_val(ret && ret != EINVAL, ret);
 	fail_on_test(!ret && check_0(edid.reserved, sizeof(edid.reserved)));
 	fail_on_test(edid.start_block);
 	fail_on_test(edid.blocks > 256);
-- 
2.43.0


