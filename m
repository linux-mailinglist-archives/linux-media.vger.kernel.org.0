Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2777251F7
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 04:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240671AbjFGCKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 22:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbjFGCKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 22:10:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6849D19AC
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 19:10:49 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A70056606EF0;
        Wed,  7 Jun 2023 03:10:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686103847;
        bh=yy3MXPnOCbxGS79WTm22lpX6NtXIkO7vx7148A3ljZQ=;
        h=From:To:Cc:Subject:Date:From;
        b=MO8Laz+zSH4aYSmzM3t6j+VVTkdvHD2drLCAjVdL1qTld2E/o+qGKPZ7gwnVmzX63
         9/xsmENO6AGetqksVShUrkWiQxwdK61OeH9DvlApQxeDehLtYUgh45Yn2NRLIekL9A
         4PXUrenIv333JcjpUt8jYc6fH98Qicq/8WrPPQddQHJS7Gh8XPOMO7aY/yrY1cfK86
         jmgBqATPQ263DzcrGtm1lmh2CRbLrJhw8IAcFbP7pj6V8QP9EQCXPCo2z++uNAMNF2
         BMUBwI4TtYGf55+M+vq6WQvF8l6V7E8zg+TaXSxEHS5JqWzF67PEhtF1FE76nTYUUh
         NROi167SdKkNA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] v4l2-compliance: call select before dequeuing event
Date:   Tue,  6 Jun 2023 19:10:29 -0700
Message-Id: <20230607021029.30466-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the streaming option is called with a stateful decoder,
testUserPtr() and testDmaBuf() will hang indefinitely when attempting to
dequeue a source change event. To prevent this call select() with a
timeout.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
It looks like this was the same issue that was previously fixed for testMmap()
in commit f0a5b17d9 ("v4l2-compliance: add timeout when waiting for event").

 utils/v4l2-compliance/v4l2-test-buffers.cpp | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index a097a0ff..0396e17e 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1746,8 +1746,17 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 
 		if (node->is_m2m) {
 			if (node->codec_mask & STATEFUL_DECODER) {
+				int fd_flags = fcntl(node->g_fd(), F_GETFL);
+				struct timeval tv = { 1, 0 };
+				fd_set efds;
 				v4l2_event ev;
 
+				fcntl(node->g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
+				FD_ZERO(&efds);
+				FD_SET(node->g_fd(), &efds);
+				ret = select(node->g_fd() + 1, nullptr, nullptr, &efds, &tv);
+				fail_on_test_val(ret < 0, ret);
+				fail_on_test(ret == 0);
 				fail_on_test(node->dqevent(ev));
 				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
 				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
@@ -1949,8 +1958,17 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
 
 		if (node->is_m2m) {
 			if (node->codec_mask & STATEFUL_DECODER) {
+				int fd_flags = fcntl(node->g_fd(), F_GETFL);
+				struct timeval tv = { 1, 0 };
+				fd_set efds;
 				v4l2_event ev;
 
+				fcntl(node->g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
+				FD_ZERO(&efds);
+				FD_SET(node->g_fd(), &efds);
+				ret = select(node->g_fd() + 1, nullptr, nullptr, &efds, &tv);
+				fail_on_test_val(ret < 0, ret);
+				fail_on_test(ret == 0);
 				fail_on_test(node->dqevent(ev));
 				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
 				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
-- 
2.40.1

