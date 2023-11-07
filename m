Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1D407E3A29
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 11:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234202AbjKGKnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 05:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234203AbjKGKns (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 05:43:48 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445F611A
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 02:43:45 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id ACEED6607447;
        Tue,  7 Nov 2023 10:43:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699353824;
        bh=c7sHDpUD8KDZ/igbZBf8X/yhmzecELmuq/1rc3G8Zsk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J/L0P81p+8WSes9IpkuCkupiPa6jmAzti9MJtNMJOZgi+Uft/XXw+DPU/V6csiS/I
         6scaRyYaGCymZgziFsHFqj6tH1rBIkkw/fd3LyI743ub0a5r7/GoGwh7B+KFm4cCnr
         0rFhHMkABXvFdt8rSTs1zME4axvXm5cC+08MetC5AtOWATj9zInZdBzea8q4PcLgcU
         TR4T5+IUM/P3nNyitz2aLdxOfgtnnV3xX5U0E8y6mVk+9+AV4nBGTQ9jfPQS7uk6oU
         zc/ftkP7k5Ai4gX9Hp3nbQXuFu6LqvCvmYo9RNDqljCChRLrePiXw9IQ7zxKlOe3J/
         rNG68zWoqio7g==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 3/4] v4l2-utils: Add VIDIOC_DELETE_BUFS ioctl
Date:   Tue,  7 Nov 2023 11:41:31 +0100
Message-Id: <20231107104132.445705-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107104132.445705-1-benjamin.gaignard@collabora.com>
References: <20231107104132.445705-1-benjamin.gaignard@collabora.com>
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

Add VIDIOC_DELETE_BUFS ioctl and it associated structure.
Define V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS to signal that queue support
feature.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/linux/videodev2.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index e7312cfb..25690223 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -992,6 +992,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
+#define V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS		(1 << 8)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2562,6 +2563,20 @@ struct v4l2_create_buffers {
 	__u32			reserved[5];
 };
 
+/**
+ * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
+ * @index:	the first buffer to be deleted
+ * @count:	number of buffers to delete
+ * @type:	enum v4l2_buf_type
+ * @reserved:	future extensions
+ */
+struct v4l2_delete_buffers {
+	__u32			index;
+	__u32			count;
+	__u32			type;
+	__u32			reserved[13];
+};
+
 /*
  *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
  *
@@ -2661,6 +2676,7 @@ struct v4l2_create_buffers {
 #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
+#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
 
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
-- 
2.39.2

