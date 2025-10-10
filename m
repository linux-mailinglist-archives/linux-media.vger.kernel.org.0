Return-Path: <linux-media+bounces-44173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C78BBCCCA0
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 13:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93B304E2066
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A08285CBB;
	Fri, 10 Oct 2025 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spuL7DT/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D384414
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760096423; cv=none; b=jF3pOyARzNw+YKkHTXrsbihnjsRLuZbLvTHiTDd59EyNI0dNv0QHZ2PFYUcCYtSMl+Olb2qu1nHD/Tr3+LXJHhOKM14YnLzVGK4orOkHj0y16+kqIuBKWhq5eHwDGyj+R9NcmV//ChHlXaB/GyGoUIzBo/XTZUqctecQBAoC4k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760096423; c=relaxed/simple;
	bh=nn/GMVCScDY9xI1dC+YXskWOoLPwlMQ1KT/MboWQobM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=b5Iy9IcJQqgCuzp63/FByiS0SfbeB/y0x0aAcei7CixIPQykU5m3Ji0gAuk4o2ALBD4vIAW7C8vsvacM0Z8kRaaUZgeTVDFOEaw4LXw1dQZqtz6hnc+Nf0YvISvUzvV6XngYaXfQ/pxmMqpqJc0bmGbotqpIC8/Ed4smPDDz0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spuL7DT/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FFEC4CEF1;
	Fri, 10 Oct 2025 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760096423;
	bh=nn/GMVCScDY9xI1dC+YXskWOoLPwlMQ1KT/MboWQobM=;
	h=Date:From:Subject:To:Cc:From;
	b=spuL7DT/lFYeR7bNabzQe6rIqJDMv5EtSwlJouRA32BIUF/kyAkc4/jb4g2Y4i1Oq
	 ao4XXiQw84X6fwwfTcUb7i1HlzA1bUdmpIjk/YGgRWI/F4ReVI4hW79+mJ2p7NDfjI
	 zaMJl8fi6cq0wBPy4XFD44LP+cy//nN31/HD4f+/1oD88NtR7iN5oejdb8iuw/7vDQ
	 9zUZXUQcmAKL1QkJZ/Czqg9ZDlTlmlzo0n/PeZ2NySDEMC2QJQN9lki5rEsGHcqmNk
	 LicdMmICRA/Cb/WcsiQvRl7ukVuwS8CGgQOliRwhhAlH7Ac0boBJxpLQ37kZgbnmMK
	 i9AQQNy9Pc1mw==
Message-ID: <28645f94-f8ab-45bd-95d0-e65435fe99d6@kernel.org>
Date: Fri, 10 Oct 2025 13:40:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCHv2] v4l2-compliance: add event order test
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add a new vivid-specific test to verify the order in which control events
arrive and whether the correct sequence counters are reported.

This verifies the behavior of this kernel patch:

https://patchwork.linuxtv.org/project/linux-media/patch/d4319e94-15c5-43a6-9bab-b9eb1d6c0d7c@kernel.org/

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
Changes since v1: validate sequence counters in the events.
---
 utils/v4l2-compliance/v4l2-compliance.cpp    |  2 +
 utils/v4l2-compliance/v4l2-compliance.h      |  4 ++
 utils/v4l2-compliance/v4l2-test-controls.cpp | 62 ++++++++++++++++++++
 3 files changed, 68 insertions(+)

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
index 4a7af5f5..36b2f463 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -82,7 +82,10 @@ enum poll_mode {
 #define VIVID_CID_REQ_VALIDATE_ERROR	(VIVID_CID_VIVID_BASE + 72)

 #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
+#define VIVID_CID_BOOLEAN		(VIVID_CID_CUSTOM_BASE + 1)
+#define VIVID_CID_INTEGER		(VIVID_CID_CUSTOM_BASE + 2)
 #define VIVID_CID_INTEGER64		(VIVID_CID_CUSTOM_BASE + 3)
+#define VIVID_CID_MENU			(VIVID_CID_CUSTOM_BASE + 4)
 #define VIVID_CID_STRING		(VIVID_CID_CUSTOM_BASE + 5)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
@@ -355,6 +358,7 @@ int testQueryControls(struct node *node);
 int testSimpleControls(struct node *node);
 int testExtendedControls(struct node *node);
 int testEvents(struct node *node);
+int testVividEvents(struct node *node);
 int testVividDisconnect(struct node *node);
 int testJpegComp(struct node *node);

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e4925ca3..a115a00a 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -1218,6 +1218,68 @@ int testEvents(struct node *node)
 	return 0;
 }

+int testVividEvents(struct node *node)
+{
+	struct v4l2_control ctrl = {};
+	struct v4l2_event_subscription sub = {};
+	struct v4l2_event ev = {};
+	__u32 seq_1st;
+	int val_bool, val_int;
+
+	sub.type = V4L2_EVENT_CTRL;
+	sub.id = VIVID_CID_BOOLEAN;
+	sub.flags = V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK;
+	fail_on_test(doioctl(node, VIDIOC_SUBSCRIBE_EVENT, &sub));
+	sub.id = VIVID_CID_INTEGER;
+	fail_on_test(doioctl(node, VIDIOC_SUBSCRIBE_EVENT, &sub));
+	sub.id = VIVID_CID_MENU;
+	fail_on_test(doioctl(node, VIDIOC_SUBSCRIBE_EVENT, &sub));
+
+	ctrl.id = VIVID_CID_INTEGER;
+	fail_on_test(doioctl(node, VIDIOC_G_CTRL, &ctrl));
+	val_int = ctrl.value;
+	ctrl.value = val_int + 1;
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+	ctrl.id = VIVID_CID_BOOLEAN;
+	fail_on_test(doioctl(node, VIDIOC_G_CTRL, &ctrl));
+	val_bool = ctrl.value = !ctrl.value;
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+	ctrl.id = VIVID_CID_INTEGER;
+	fail_on_test(doioctl(node, VIDIOC_G_CTRL, &ctrl));
+	ctrl.value = val_int + 2;
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+	ctrl.id = VIVID_CID_MENU;
+	fail_on_test(doioctl(node, VIDIOC_G_CTRL, &ctrl));
+	ctrl.value = ctrl.value == 3 ? 2 : 3;
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+
+	fail_on_test(doioctl(node, VIDIOC_DQEVENT, &ev));
+	fail_on_test(ev.pending != 2);
+	fail_on_test(ev.type != V4L2_EVENT_CTRL);
+	fail_on_test(ev.id != VIVID_CID_INTEGER);
+	fail_on_test(ev.u.ctrl.value != val_int + 2);
+	seq_1st = ev.sequence;
+
+	fail_on_test(doioctl(node, VIDIOC_DQEVENT, &ev));
+	fail_on_test(ev.pending != 1);
+	fail_on_test(ev.type != V4L2_EVENT_CTRL);
+	fail_on_test(ev.id != VIVID_CID_BOOLEAN);
+	fail_on_test(ev.u.ctrl.value != val_bool);
+	fail_on_test(ev.sequence != seq_1st + 1);
+
+	fail_on_test(doioctl(node, VIDIOC_DQEVENT, &ev));
+	fail_on_test(ev.pending);
+	fail_on_test(ev.type != V4L2_EVENT_CTRL);
+	fail_on_test(ev.id != VIVID_CID_MENU);
+	fail_on_test(ev.u.ctrl.value != ctrl.value);
+	fail_on_test(ev.sequence != seq_1st + 3);
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


