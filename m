Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856A77D928E
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 10:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345555AbjJ0Irr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 04:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345526AbjJ0Irp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 04:47:45 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6A91B1
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 01:47:42 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:dbc0:3460:d466:3213])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F2286607323;
        Fri, 27 Oct 2023 09:47:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698396460;
        bh=k4/zDXxdjixxu0KdG6/i32m6c9v6+ezV2jMmBXNxNTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C/E33e43QNwx7jmmjop4rDU6Timv88pe1xBEwCcLuyYdyytUH+E6HwtOuKH/Jwx1z
         g5rQ42rmZDGlPK1H04R+Rfrc0y+utT0gS0XjMGPkfJelPe2fh7FrUxsr6/vPrwqocq
         UQtGKxZI7vNTlpAAFljEZFgb+YuwQvJ3tc2+MrGkZ6/xh7Hu2WfG/KPJtAct9rUDph
         /dWzfb6nrBzGxRuW18XDyWDk2fSiEkp1fu7qU9mWcwuZ+Dl3tSngtKvnMD418Ava28
         PfBHJmTQxg3Y8mJotTYJpMnMyqQmki0oGM5jtja11SJ8BK442w0oG/s9MH/bVwkvaC
         XhhRRFMe38Lrw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 1/4] v4l-utils: Add max_num_buffers field to v4l2_create_buffers struct
Date:   Fri, 27 Oct 2023 10:47:29 +0200
Message-Id: <20231027084732.17528-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027084732.17528-1-benjamin.gaignard@collabora.com>
References: <20231027084732.17528-1-benjamin.gaignard@collabora.com>
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

