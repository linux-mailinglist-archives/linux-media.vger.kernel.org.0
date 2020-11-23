Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFB652C0EAC
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 16:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389492AbgKWPTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389474AbgKWPTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:19:06 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0582CC0613CF
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 07:19:06 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 62so14522818pgg.12
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 07:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FkrDdKMycY94g90HXImki+9w+tAdECD1Gg/6dr67Fmc=;
        b=Ux3MrT2GFrxcNk3WONtlIx6usd4hIhnwr/J+QjZMT9Vzpv0367wnHAngtfq3Evz+Bo
         O9O4tHBvSvhloWUSsklCfdzyPjCI6FnuZ7AQGwviCNQJqu2lqUWASJVadq1wA60eZAyx
         uZ4BvD26LrD+fOypf0PxDshO1vLS/4zM8cpFK8RK0Wnqge7GWUPQdqkqcv/Ma8+tUv2Y
         gxkSqN1LWYLwxQkg0y3Xbkv7wzWakfbZepU+RHXirvR9MwAa2PHARD4G2p79SUBF/5kK
         rCCEuTCfyNscJuALEeFieAXJnt8O4UlUyx9l7iuOv36uMIxkFr/h8pUg//lhDpP4JWfl
         bK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FkrDdKMycY94g90HXImki+9w+tAdECD1Gg/6dr67Fmc=;
        b=XO0QF2T9ST3JwrpmFcSOtFBX4J8bi9RIQuGPThfyzZxeHwrnvgkzjMENd4+qO/3g7w
         EfpNeEtSTh7pBGicIFlF1/IvP6d1FREo1DbrkoZlz7lKSvjt8yLjKb6wRJQhjy/+8UtQ
         HMVUw2M8cZoMpZo29ONIDMA5GAfoe1NivxGA3Hu00EHcp//I32sJMCD4H38LiQrVCatK
         ofu33OYOdDqdU2rqSCEo+6oflpGPTN5r3mslUmcaCKZZb+gsPnfWrJUR7iPgibjWZg7n
         bRRZDjcAfBVQuuKbFz3kqvk2ymQpBbpWdyjet1LNrtIp+htNdFh6zRnPgbq6g/fJ4kp8
         1wGA==
X-Gm-Message-State: AOAM532UYsNVNBWyuXpYQbCcgvRNRMFTOCPqWA1T27tTiQ3q4mh45ylA
        dkSmDJQiwo05PBTsjCV7EJs=
X-Google-Smtp-Source: ABdhPJzNaVrB1/RTIoKJGxifPujhsh1AJCnH7sqPCHSBQKHG9N7nNcvhtLguSPfOXcEDcaLLKSmr+g==
X-Received: by 2002:a63:283:: with SMTP id 125mr292pgc.282.1606144745288;
        Mon, 23 Nov 2020 07:19:05 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id z12sm12524088pfg.123.2020.11.23.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 07:19:04 -0800 (PST)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH] v4l2-compliance: test for vb2/m2m poll kernel bug
Date:   Tue, 24 Nov 2020 00:18:56 +0900
Message-Id: <20201123151856.798307-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A bug has been discovered in the vb2 and m2m implementations of poll
where EPOLLIN and EPOLLOUT events are never signaled to epoll_wait()
unless at least one of them is included in the initial epoll_ctl() call.

The presence of this bug can be detected by setting an initial empty set
of events with EPOLL_CTL_ADD, then setting the events we are interested
in using EPOLL_CTL_MOD. epoll_wait() will then invariably timeout even
if there is a queue-related event pending.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
This is the follow-up patch for the discussion on
https://www.spinics.net/lists/linux-media/msg179618.html. I have tested
it with vivid and vicodec, and got the expected result with both (epoll
streaming tests fails without the kernel fix, passes with it).

 utils/v4l2-compliance/v4l2-test-buffers.cpp | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 8000db23..291019c7 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -903,6 +903,17 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 		epollfd = epoll_create1(0);
 
 		fail_on_test(epollfd < 0);
+
+		/*
+		 * Many older versions of the vb2 and m2m have a bug where
+		 * EPOLLIN and EPOLLOUT events are never signaled unless they
+		 * are part of the initial EPOLL_CTL_ADD. We set an initial
+		 * empty set of events, which we then modify with EPOLL_CTL_MOD,
+		 * in order to detect that condition.
+		 */
+		ev.events = 0;
+		fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_ADD, node->g_fd(), &ev));
+
 		if (node->is_m2m)
 			ev.events = EPOLLIN | EPOLLOUT | EPOLLPRI;
 		else if (v4l_type_is_output(q.g_type()))
@@ -910,7 +921,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 		else
 			ev.events = EPOLLIN;
 		ev.data.fd = node->g_fd();
-		fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_ADD, node->g_fd(), &ev));
+		fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_MOD, node->g_fd(), &ev));
 	}
 
 	if (pollmode)
@@ -944,6 +955,10 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
 			can_read = FD_ISSET(node->g_fd(), &rfds);
 			have_event = FD_ISSET(node->g_fd(), &efds);
 		} else if (pollmode == POLL_MODE_EPOLL) {
+			/*
+			 * This can fail with a timeout on older kernels for
+			 * drivers using vb2_core_poll() v4l2_m2m_poll().
+			 */
 			ret = epoll_wait(epollfd, &ev, 1, 2000);
 			fail_on_test(ret == 0);
 			fail_on_test(ret < 0);
-- 
2.29.2

