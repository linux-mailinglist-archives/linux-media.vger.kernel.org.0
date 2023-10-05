Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52CE17B9A06
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 04:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbjJECok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 22:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjJECoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 22:44:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D007C0
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 19:44:33 -0700 (PDT)
Received: from db550.lan (node-1w7jr9sszvrs12j3t2c4roop6.ipv6.telus.net [IPv6:2001:569:be8a:cf00:b266:6d88:df5a:5e0a])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A66266072F6;
        Thu,  5 Oct 2023 03:44:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1696473871;
        bh=qxQnfyCyu3V2VHGVoJTesyavvJg5fSRdPWwVuq8iv0s=;
        h=From:To:Cc:Subject:Date:From;
        b=cGdME8cOVGRU4Z0T435PIoO/sOxHjeDymZQtlMCTK/+2QfjPnFVk9a6aZbVcRTzKb
         ZQiYZ6DF1KDLTel2jfkzpkYqGGQhTdhu7dDWGxVT5jsWo2nftb02PIE4WktghU5RT+
         u+10f/oja7vCwxouf0z/oK7b8b+k7gU1mow2DGmlSj7HJPQc1+qW/QdJhKBy0UYQ7U
         82V6ZKrOzNMS/ghdzqI+U1JYQOFGNZUZ4ramqlCfaCD/HgtVdFT4wOadx7N+whcZ3f
         TsKPyXCz1T0kAvYmfc6KH5xv68GA4n41emG8zaBTDSLz730vu126viZZcHXNIFhroQ
         lixHDmK8mr8rQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        sebastian.fricke@collabora.com, nas.chung@chipsnmedia.com,
        jackson.lee@chipsnmedia.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] v4l2-compliance: check errors returned by CREATE_BUFS
Date:   Wed,  4 Oct 2023 19:44:15 -0700
Message-Id: <20231005024415.20212-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If VIDIOC_CREATE_BUFS is not supported by a driver, it should return
ENOTTY on all queues; so add a test to fail if ENOTTY is returned on only
one queue.

If  VIDIOC_CREATE_BUFS is supported, asymmetrically, on only one queue and
not another, then the driver should return EOPNOTSUPP for only that queue.
Fail if the driver returns EOPNOTSUPP on both queues.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes since v1:
- add the ENOTTY test
- use a count instead of bool to keep track of error codes

On the wave5 driver, v4l2-compliance -d0 -v shows:
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


 utils/v4l2-compliance/v4l2-test-buffers.cpp | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 6d592c9b..632da7f8 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -540,6 +540,9 @@ int testReqBufs(struct node *node)
 	bool dmabuf_valid;
 	int ret;
 	unsigned i, m;
+	int crbufs_ok_cnt = 0;
+	int crbufs_enotty_cnt = 0;
+	int crbufs_eopnotsupp_cnt = 0;
 
 	node->reopen();
 
@@ -690,9 +693,21 @@ int testReqBufs(struct node *node)
 
 			ret = q.create_bufs(node, 0);
 			if (ret == ENOTTY) {
+				/* VIDIOC_CREATE_BUFS is not supported at all. */
+				crbufs_enotty_cnt++;
+				fail_on_test(crbufs_enotty_cnt && (crbufs_eopnotsupp_cnt + crbufs_ok_cnt));
 				warn("VIDIOC_CREATE_BUFS not supported\n");
 				break;
 			}
+			if (ret == EOPNOTSUPP) {
+				/* VIDIOC_CREATE_BUFS is supported on one queue but not the other. */
+				fail_on_test(crbufs_eopnotsupp_cnt && !crbufs_ok_cnt);
+				crbufs_eopnotsupp_cnt++;
+				info("VIDIOC_CREATE_BUFS not supported for %s\n",
+				     buftype2s(q.g_type()).c_str());
+				break;
+			}
+			crbufs_ok_cnt++;
 
 			memset(&crbufs, 0xff, sizeof(crbufs));
 			node->g_fmt(crbufs.format, i);
-- 
2.40.1

