Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51AEE7DD07E
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 16:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344814AbjJaP1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 11:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344783AbjJaP1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 11:27:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DDFE4
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 08:27:32 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C27E66073A3;
        Tue, 31 Oct 2023 15:27:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698766050;
        bh=k4/zDXxdjixxu0KdG6/i32m6c9v6+ezV2jMmBXNxNTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V0TIUat3eymdL2rFCTa8sqSmC8Z56W4S9QCsdUJ2Ixei7X09ouqoIJ3Aw3/5zho2S
         s0nPRoHugtbc37n3W2/Fa8hkrb693f8uNylMiRtWkURfwqfw7TOc9A7XRNgJhOWeM4
         /k57klwglhKaj+4PL+gXHu2VdWjYcDXTkwzpsnqa82+t1SRNUOv3kcUeiSJi5fO9xY
         xJunakdgBKof8p5o7OuvNM0ItMWNCSEMDP7+i9g27pky0JB1sU24hAIDrn8gMws6Sm
         wbzzMPQ3cOkiJ8Sf6sMMmIU35iAbWXoBbsfotAsCm34ckKMdUPZ44q8mlXIi8IJ9p0
         eVmMAiWjcNKIg==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 1/4] v4l-utils: Add max_num_buffers field to v4l2_create_buffers struct
Date:   Tue, 31 Oct 2023 16:27:19 +0100
Message-Id: <20231031152722.84444-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031152722.84444-1-benjamin.gaignard@collabora.com>
References: <20231031152722.84444-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add 'max_num_buffers' field to 'struct v4l2_create_buffers' and
define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 27680a39..e7312cfb 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -991,6 +991,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2545,6 +2546,9 @@ struct v4l2_dbg_chip_info {
  * @flags:	additional buffer management attributes (ignored unless the
  *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
  *		and configured for MMAP streaming I/O).
+ * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability flag is set
+ *		this field indicate the maximum possible number of buffers
+ *		for this queue.
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
@@ -2554,7 +2558,8 @@ struct v4l2_create_buffers {
 	struct v4l2_format	format;
 	__u32			capabilities;
 	__u32			flags;
-	__u32			reserved[6];
+	__u32			max_num_buffers;
+	__u32			reserved[5];
 };
 
 /*
-- 
2.39.2

