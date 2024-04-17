Return-Path: <linux-media+bounces-9661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A228A7FB0
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 11:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532331F22637
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 09:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00CB12F59F;
	Wed, 17 Apr 2024 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CSuNGWiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF466A8BA
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713346282; cv=none; b=E9ptoHOVzkqX1giJUA4oarr2X5CjPYFl7Vvax2tcYUbLtdHgGtHc/AXjqek8UoNT/hZnOrQr0WWeoexDxbZrjq3Tta2qV/bSKdLF4jW2sUEsfCoq5/9OcSJ59wAD45A4BMeI8yvtFY4OjXogtFYZy6DJlvVGYWJbPJQKNuEGnbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713346282; c=relaxed/simple;
	bh=u0XQj99zkIHtKROfuXX/dRHh9d84VE1IBbIGuaFbA8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cdCVOl/N7WMMnS/Z6IKXueNa44nfvYb3RhX43FNh2q5e5gCb04YUFXSPAsF+62d06TqUBSWSC4QEyQCIBteB6Dqe6AnMmiED76mB0CMgnU/kEtzFdQ+pazjSzhi9aUxLfC9QbM1sR3hFqyM1UAxX4OW1vJuMTIUQNfctcQoCVNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CSuNGWiq; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78ecd752a7cso329760985a.0
        for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 02:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713346280; x=1713951080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puEUjgI6EA8zJrZJiDmfalQPrpdvz5g//cazRcg9wgw=;
        b=CSuNGWiq5eT6191UvejqretEZpLIHGiBbUJw1Cb7Bvc39uigoclnbM3rsNX+g8PQJX
         +Q3aFn33fJlar3wi2W+Mn2Xh9CZfza1IbTdLyvQh0qgbu47T8udMZ4sCf1yKSUoyMh9E
         avykLXeFuKewRk0T0FpjJAqA9HHzp6K3ZDTq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713346280; x=1713951080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puEUjgI6EA8zJrZJiDmfalQPrpdvz5g//cazRcg9wgw=;
        b=h3jxCJdMRu+tHaaTVBZTTf0E1/8S2gJe2ZRsxSLG1z/XUAjjOuV/NFLO9lpd7qUvzc
         jAq0ndMaHvjVnmiY1O4mk1OxaBgaBG1nYZvcYjfVpMHVKcWWIXuDRltmbX1lTwCuvVPx
         j34itZrhvo7D3qfrEHQXsvAYuF8LkqbbUYTi/+3Yo6W7aXzeupmJcgQYJNcUpkpMVSa8
         UhqOV5/a3olDFrToLn7CusHVs1Je8YR4gUxRoD8/mdrDtJ+3TsEP6qsLlWQeRfqq1sNy
         AmvirhpDnlDqXmc/+vtqIV510rfagBFyoRM7yP9rd1gs/V4wLpIvyMLCYDDQYoqQuUo4
         xJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp2S3m9o5OHwAbBbpGLH/bm2YAsUfXLE3sJkuxRKB7+PaA6MMmRMhqwxi/TOOYBpuk1JKxjG99aVtxvSRyUgl8/KEg72oevNvWE1A=
X-Gm-Message-State: AOJu0YwGkwVKTwSbTPpLfFVk/4YRDlWMsqkhE3W5l2DGUhCsJlIkxhtj
	RruYcYU3xl0wn17aOfiBfZUHV7uXm12pTFxanJEfBaAADsjiRO2fx0wN3kKaBA==
X-Google-Smtp-Source: AGHT+IG/HbqcqmDQSuOu8nbhDdLqMtbvRhBr9nyFu6i+3IJ6PaE8XICGEW5mhv1K0HrcB2Qas8CXlA==
X-Received: by 2002:a05:620a:4710:b0:78e:f263:27c0 with SMTP id bs16-20020a05620a471000b0078ef26327c0mr6872784qkb.25.1713346279633;
        Wed, 17 Apr 2024 02:31:19 -0700 (PDT)
Received: from denia.c.googlers.com.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id d15-20020a05620a158f00b0078d54363075sm8253075qkk.40.2024.04.17.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 02:31:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] v4l2-compliance: Make vivid_ro_ctrl tests more reliable
Date: Wed, 17 Apr 2024 09:30:56 +0000
Message-ID: <20240417093115.2335113-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequence number produced by vivid it is not warrantied to increase
one by one. It will "skip" frames if they cannot be produced on time.

In our tests, we were assuming that there was no frame skipped by vivid,
and this caused a series of flakes.

Fix this, by saving the actual sequence number during captureBufs() and
using it as reference for vivid_ro_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 26 ++++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 1db6f4e9..58e01266 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1028,7 +1028,7 @@ static int setupM2M(struct node *node, cv4l_queue &q, bool init = true)
 
 static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_queue &q,
 		cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
-		unsigned &capture_count)
+		unsigned &capture_count, unsigned *sequences)
 {
 	static constexpr const char *pollmode_str[] = {
 		"",
@@ -1185,6 +1185,8 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 				       field2s(buf.g_field()).c_str(), buf.g_bytesused(),
 				       bufferflags2s(buf.g_flags()).c_str(),
 				       static_cast<__u64>(buf.g_timestamp().tv_sec),  static_cast<__u64>(buf.g_timestamp().tv_usec));
+			if (sequences)
+				sequences[frame_count - count] = buf.g_sequence();
 			for (unsigned p = 0; p < buf.g_num_planes(); p++) {
 				if (max_bytesused[p] < buf.g_bytesused(p))
 					max_bytesused[p] = buf.g_bytesused(p);
@@ -1603,7 +1605,7 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 		}
 
 		fail_on_test(captureBufs(node, node_m2m_cap, q, m2m_q, frame_count,
-					 pollmode, capture_count));
+					 pollmode, capture_count, NULL));
 		fail_on_test(node->streamoff(q.g_type()));
 		fail_on_test(node->streamoff(q.g_type()));
 		if (node->is_m2m)
@@ -1914,7 +1916,7 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 			fail_on_test(setupM2M(node_m2m_cap, m2m_q));
 		}
 		fail_on_test(captureBufs(node, node_m2m_cap, q, m2m_q, frame_count,
-					 pollmode, capture_count));
+					 pollmode, capture_count, NULL));
 		fail_on_test(node->streamoff(q.g_type()));
 		fail_on_test(node->streamoff(q.g_type()));
 		if (node->is_m2m) {
@@ -2127,7 +2129,7 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
 			fail_on_test(setupM2M(node_m2m_cap, m2m_q));
 		}
 		fail_on_test(captureBufs(node, node_m2m_cap, q, m2m_q, frame_count,
-					 pollmode, capture_count));
+					 pollmode, capture_count, NULL));
 		fail_on_test(node->streamoff(q.g_type()));
 		fail_on_test(node->streamoff(q.g_type()));
 		if (node->supports_orphaned_bufs) {
@@ -2376,6 +2378,7 @@ int testRequests(struct node *node, bool test_streaming)
 	unsigned num_bufs = q.g_buffers();
 	// Create twice as many requests as there are buffers
 	unsigned num_requests = 2 * num_bufs;
+	unsigned sequences[num_requests];
 	last_seq.init();
 
 	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
@@ -2664,7 +2667,7 @@ int testRequests(struct node *node, bool test_streaming)
 		// min_bufs buffers we need to add min_bufs to the frame_count.
 		fail_on_test(captureBufs(node, node, q, m2m_q,
 					 num_bufs + (node->is_m2m ? min_bufs : 0),
-					 POLL_MODE_SELECT, capture_count));
+					 POLL_MODE_SELECT, capture_count, sequences));
 	}
 	fail_on_test(node->streamoff(q.g_type()));
 
@@ -2692,8 +2695,11 @@ int testRequests(struct node *node, bool test_streaming)
 			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_ro_ctrls));
 			if (node->is_video && !node->can_output &&
 			    vivid_ro_ctrl.value != (int)i)
-				warn_once("vivid_ro_ctrl.value (%d) != i (%u)\n",
-					  vivid_ro_ctrl.value, i);
+				info("vivid_ro_ctrl.value (%d) != i (%u)\n",
+				     vivid_ro_ctrl.value, i);
+
+			if (node->is_video && !node->can_output)
+				fail_on_test(sequences[i] != (__u32) vivid_ro_ctrl.value);
 
 			// Check that the dynamic control array is set as
 			// expected and with the correct values.
@@ -2769,9 +2775,11 @@ int testRequests(struct node *node, bool test_streaming)
 			vivid_ro_ctrls.which = 0;
 			fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &vivid_ro_ctrls));
 			if (node->is_video && !node->can_output &&
-			    vivid_ro_ctrl.value != (int)(num_bufs - 1))
-				warn("vivid_ro_ctrl.value (%d) != num_bufs - 1 (%d)\n",
+			    vivid_ro_ctrl.value != (int)(num_bufs - 1)) {
+				fail_on_test(vivid_ro_ctrl.value < (int)(num_bufs - 1));
+				info("vivid_ro_ctrl.value (%d) != num_bufs - 1 (%d)\n",
 				     vivid_ro_ctrl.value, num_bufs - 1);
+			}
 
 			// the final dynamic array value,
 			v4l2_query_ext_ctrl q_dyn_array = {
-- 
2.44.0.683.g7961c838ac-goog


