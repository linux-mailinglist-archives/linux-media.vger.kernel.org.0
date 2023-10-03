Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDCF37B743B
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 00:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjJCWqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 18:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjJCWqI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 18:46:08 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6440AB
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 15:46:03 -0700 (PDT)
Received: from db550.lan (node-1w7jr9sszvrrzruovovr1tjll.ipv6.telus.net [IPv6:2001:569:be8a:cf00:5d23:b71:6055:e579])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0E0C9660731D;
        Tue,  3 Oct 2023 23:46:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1696373162;
        bh=uOQxbTgP3lCx/3PFH3qKmATRjKes6Z/k+HmO58NnGFQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Vg69YwS3m3UeMCS1xj+kWY7/i8gRGVr2oUbvZVvKk8joaP8ejzBLdrEXB6LKXHCDZ
         bANgzypWj2MK5KRdEQwMWpx9/cg6iZhGrn5lGWSgIuVQLC+DpaWb8RcCMS4KODDmhO
         HWtQngdYVO+ZXFf/67qvnFzgHd1rVmi0wTGiBq+2NTQBvP7HwFWoCwiazKRrOPxL1V
         bs57YTBcYVLG2uDxQ43E00Kt8k8+aNVSdxjW31YnIYNBw/yPDmWsc6uEq2zftqn59z
         7ogeO/Lrwe6GwRGtNg48ftUemvQ0dgNahCmhSyGViDAZDlZ1jlpI3ld05J4NbuoI8k
         VnK3n1kf08XuQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        sebastian.fricke@collabora.com, nas.chung@chipsnmedia.com,
        jackson.lee@chipsnmedia.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] v4l2-compliance: add EOPNOTSUPP for create_bufs
Date:   Tue,  3 Oct 2023 15:45:36 -0700
Message-Id: <20231003224536.13199-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If VIDIOC_CREATE_BUFS is supported on one queue but not the other, then
the driver should return EOPNOTSUPP for the unsupported queue only.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
On the wave5 driver, v4l2-compliance -d0 -v now shows:
<snip>
Buffer ioctls:
        info: test buftype Video Capture Multiplanar
        info: VIDIOC_CREATE_BUFS not supported for Video Capture Multiplanar
        info: test buftype Video Output Multiplanar
    test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
    test VIDIOC_EXPBUF: OK
        info: could not test the Request API, no suitable control found
    test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

 utils/v4l2-compliance/v4l2-compliance.h     | 1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 7caf254b..99c98916 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -165,6 +165,7 @@ struct base_node {
 	bool supports_orphaned_bufs;
 	// support for this was introduced in 5.9
 	bool might_support_cache_hints;
+	bool create_bufs_on_one_queue_only;
 };
 
 struct node : public base_node, public cv4l_fd {
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 6d592c9b..e709580b 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -693,6 +693,14 @@ int testReqBufs(struct node *node)
 				warn("VIDIOC_CREATE_BUFS not supported\n");
 				break;
 			}
+			if (ret == EOPNOTSUPP) {
+				/* VIDIOC_CREATE_BUFS is supported on one queue but not the other. */
+				fail_on_test(node->create_bufs_on_one_queue_only);
+				node->create_bufs_on_one_queue_only = true;
+				info("VIDIOC_CREATE_BUFS not supported for %s\n",
+				     buftype2s(q.g_type()).c_str());
+				break;
+			}
 
 			memset(&crbufs, 0xff, sizeof(crbufs));
 			node->g_fmt(crbufs.format, i);
-- 
2.40.1

