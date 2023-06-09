Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F8D728D4D
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 03:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238023AbjFIBwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 21:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238017AbjFIBwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 21:52:30 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9F62D7C
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 18:52:29 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A53106606F25;
        Fri,  9 Jun 2023 02:52:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686275547;
        bh=yVfv+W8fF0C+NSbHedI7krlCkZ5hw5VyatqbGGgFndw=;
        h=From:To:Cc:Subject:Date:From;
        b=NVUkcLasT1n7vmMFU/DbQkB7qf5JOwj+g1OZBszrEfoap+7y4YzdiJbqfoI6qnNxb
         lcsbtfU/3QGl6Vve5Fa1f+PTUCuDmNOZ/eA1viyOXMZewnEGjv8DoKOfTruBLBq/HZ
         OHWtl9Xupjo0vIJxtSpvY6jTVRfrmPp6E8iQsW+kDfwyigHGll3F1geB1zXnFpdmUD
         x0vEGnrBJCJa5duE7qNj9OgaTAcx/1r+H00TK68+TfZrXsmFekNlbAlJXHnEwx1CdF
         e2v0DYqq1IIQO34RgVeS+5g7ddsoARFGmYN7r0v0tZswYPIvWgKgjkNZmEs7L2jIvf
         JUidHGHxGowbw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] v4l2-compliance: call select before dequeuing event
Date:   Thu,  8 Jun 2023 18:52:04 -0700
Message-Id: <20230609015204.24481-1-deborah.brouwer@collabora.com>
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
Changes since v1:
  Restore the file descriptor flags to remove non-blocking mode.

 utils/v4l2-compliance/v4l2-test-buffers.cpp | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index a097a0ff..6d592c9b 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1746,9 +1746,19 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
 
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
+				fcntl(node->g_fd(), F_SETFL, fd_flags);
 				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
 				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
 			}
@@ -1949,9 +1959,19 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
 
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
+				fcntl(node->g_fd(), F_SETFL, fd_flags);
 				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
 				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
 			}
-- 
2.40.1

