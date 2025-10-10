Return-Path: <linux-media+bounces-44159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9FBCC6FB
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8191A65DFB
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C962ED168;
	Fri, 10 Oct 2025 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LE1D/fi1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679020A5EA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089855; cv=none; b=WFLPo8TgNsW905W1ujgE+PRPAEzcWYScJUMakn4/NLA+vwQKfSMSnmnSSKKnUi2y7cHSW3PBMCwnvafnTnPhehMb3kjohkClinCVIgGKqD4l4h4vsY8SNT6IKiU90AfYBB9inpOfRJw9TaQnnilwkAoun4fqOLR8UHZtmltLZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089855; c=relaxed/simple;
	bh=jAB6DRYfA4RrEveOH0ZvXkBfot+EiiccbIiihtjpHQA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=eV1UInQm+ZGaKiHfmqtYyABnOVHRq744tmdAaQ/ZakPm6eGZG8JECKC+iqx5I11wtd1HSHLO2so79exReyyEmcFMUwjkAufmTTudsDfDjLLA8MuYvRO6lSawdSuEgwYi6r1nXq9NBnIBkrWlwMJCgVAbyBIf7Xoc+fvUbx8uw6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LE1D/fi1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CE5C4CEF1
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760089855;
	bh=jAB6DRYfA4RrEveOH0ZvXkBfot+EiiccbIiihtjpHQA=;
	h=Date:From:Subject:To:From;
	b=LE1D/fi1Dxn34WBhKuKaqbuULFnxyZvG8WcRjfNQNPk2oCyp5lEJ/8sMEHtl9BEvM
	 emKz1LPTUtftGbUUPxMqTyGPtmArwmwE8bX97pn1EUHNFPSSNvjf+P7ivy5c1EU0eL
	 xKQHXNCK2XwqaGuqxJ5tQbGId6lvcKx0KQNXcKy/sWd2wwk/M9QSiwcqwBGVM/PWCp
	 MI7IokRgaJcKpqDq1HnokzCijxWLcAWLxh3O5HltkKqZVk2fEO+JObbxs2EzkOrH8x
	 IsI1IMBZGnVGrGSPhinr5z73cgwzHD7pkN2ZssNH0PHiSxbwQlEOjlNyYA1ObqGZBB
	 RuQ2MpeiYq/2Q==
Message-ID: <19a1fecf-ff88-4a9f-aa69-0957a6f18162@kernel.org>
Date: Fri, 10 Oct 2025 11:50:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] v4l2-compliance: add event order test
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add a new vivid-specific test to verify the order in which control events
arrive. This verifies the behavior of this kernel patch:

https://patchwork.linuxtv.org/project/linux-media/patch/063bd6f7-e9c0-4dfa-babe-cd004cfc4552@kernel.org/

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 utils/v4l2-compliance/v4l2-compliance.cpp    |  2 +
 utils/v4l2-compliance/v4l2-compliance.h      |  3 ++
 utils/v4l2-compliance/v4l2-test-controls.cpp | 48 ++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b82d7dad..cdb30e4d 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1440,6 +1440,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("\ttest VIDIOC_G/S_CTRL: %s\n", ok(testSimpleControls(&node)));
 		printf("\ttest VIDIOC_G/S/TRY_EXT_CTRLS: %s\n", ok(testExtendedControls(&node)));
 		printf("\ttest VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: %s\n", ok(testEvents(&node)));
+		if (is_vivid)
+			printf("\ttest Control Events: %s\n", ok(testVividEvents(&node)));
 		printf("\ttest VIDIOC_G/S_JPEGCOMP: %s\n", ok(testJpegComp(&node)));
 		printf("\tStandard Controls: %d Private Controls: %d\n",
 		       node.std_controls - node.std_compound_controls,
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4a7af5f5..5586c3f7 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -82,6 +82,8 @@ enum poll_mode {
 #define VIVID_CID_REQ_VALIDATE_ERROR	(VIVID_CID_VIVID_BASE + 72)

 #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
+#define VIVID_CID_BOOLEAN		(VIVID_CID_CUSTOM_BASE + 1)
+#define VIVID_CID_INTEGER		(VIVID_CID_CUSTOM_BASE + 2)
 #define VIVID_CID_INTEGER64		(VIVID_CID_CUSTOM_BASE + 3)
 #define VIVID_CID_STRING		(VIVID_CID_CUSTOM_BASE + 5)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
@@ -355,6 +357,7 @@ int testQueryControls(struct node *node);
 int testSimpleControls(struct node *node);
 int testExtendedControls(struct node *node);
 int testEvents(struct node *node);
+int testVividEvents(struct node *node);
 int testVividDisconnect(struct node *node);
 int testJpegComp(struct node *node);

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e4925ca3..ab4b24dd 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -1218,6 +1218,54 @@ int testEvents(struct node *node)
 	return 0;
 }

+int testVividEvents(struct node *node)
+{
+	struct v4l2_control ctrl = {};
+	struct v4l2_event_subscription sub = {};
+	struct v4l2_event ev = {};
+	__u32 seq_1st;
+	int val_bool;
+
+	sub.type = V4L2_EVENT_CTRL;
+	sub.id = VIVID_CID_BOOLEAN;
+	sub.flags = V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK;
+	fail_on_test(doioctl(node, VIDIOC_SUBSCRIBE_EVENT, &sub));
+	sub.id = VIVID_CID_INTEGER;
+	fail_on_test(doioctl(node, VIDIOC_SUBSCRIBE_EVENT, &sub));
+
+	ctrl.id = VIVID_CID_INTEGER;
+	fail_on_test(doioctl(node, VIDIOC_G_CTRL, &ctrl));
+	ctrl.value++;
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+	ctrl.id = VIVID_CID_BOOLEAN;
+	fail_on_test(doioctl(node, VIDIOC_G_CTRL, &ctrl));
+	val_bool = ctrl.value = !ctrl.value;
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+	ctrl.id = VIVID_CID_INTEGER;
+	fail_on_test(doioctl(node, VIDIOC_G_CTRL, &ctrl));
+	ctrl.value++;
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+
+	fail_on_test(doioctl(node, VIDIOC_DQEVENT, &ev));
+	fail_on_test(ev.pending != 1);
+	fail_on_test(ev.type != V4L2_EVENT_CTRL);
+	fail_on_test(ev.id != VIVID_CID_INTEGER);
+	fail_on_test(ev.u.ctrl.value != ctrl.value);
+	seq_1st = ev.sequence;
+
+	fail_on_test(doioctl(node, VIDIOC_DQEVENT, &ev));
+	fail_on_test(ev.pending);
+	fail_on_test(ev.type != V4L2_EVENT_CTRL);
+	fail_on_test(ev.id != VIVID_CID_BOOLEAN);
+	fail_on_test(ev.u.ctrl.value != val_bool);
+	fail_on_test(ev.sequence != seq_1st + 1);
+
+	sub.type = V4L2_EVENT_ALL;
+	sub.id = 0;
+	fail_on_test(doioctl(node, VIDIOC_UNSUBSCRIBE_EVENT, &sub));
+	return 0;
+}
+
 int testVividDisconnect(struct node *node)
 {
 	// Test that disconnecting a device will wake up any processes
-- 
2.51.0


