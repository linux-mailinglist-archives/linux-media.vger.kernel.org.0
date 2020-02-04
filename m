Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5682151464
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbgBDC5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:57:24 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35388 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgBDC5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:57:22 -0500
Received: by mail-pf1-f193.google.com with SMTP id y73so8683987pfg.2
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=raQvSM5V/uMvgqOsdMStTvPP8E1jqsk9wa9DPg9FZM8=;
        b=FHz9qg9vqBt1VTVoYCNd2qaYaNJG/29qmMaSm30O/XXyzEZe4S/DF7cLRmDUeCoytY
         UikEMN5nN/TsyisDq8bLb9d3/9TkBMebeVUnBNtqg3gnJ/FMhrsZvYtni0l134SO5H76
         VYfoFzJW5VGyyJ+wGiX0LjKbVeKPI+Dgvb93A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=raQvSM5V/uMvgqOsdMStTvPP8E1jqsk9wa9DPg9FZM8=;
        b=n4Ix2hGYZWmTmQGlzDUyApYZ7IJOlLP+E3NnKavXJ6H0ZrDVpBLoRDmzHHUfc7ccEv
         Ubl+ye4u5MyPnZi+k1FJ9qLgDG7nDf0wHljlIMcvGrZfl4dPMy5OqKa50QPgdzKyKhVD
         drbDGnk/DOJr490JFO4znk6MxtbMJu/pvRxG3vJwSLQ9tWsG/FSTmsp/hXozg36dqCh/
         t2ZUlBconshbk4y8XH9ngNnoUHtbLiZ7oMnuUXpqxKvURhG1c88et+zOzxXf9eB3oIw+
         jmC/XXbozsUbZEXNiWegRnOghxIvugj5NNP0oFU1vA7pYF978RfhONQEIVGL0BzANYia
         vlFQ==
X-Gm-Message-State: APjAAAW3RcvhXOo7VxGgwuNge+8CC3nyWsksAlM1q/HWRNbbOBsS9LvW
        bTY1/Ofsrafh0BzetrTy/BDYOw==
X-Google-Smtp-Source: APXvYqyniqRgXTBNCmKcTESug8rjHaeK7Uxfak70Cz/Vrue0dxlUhVtDJIqEBQzy/JDyESeD9UdZ0w==
X-Received: by 2002:a62:be0a:: with SMTP id l10mr29348868pff.110.1580785041112;
        Mon, 03 Feb 2020 18:57:21 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:57:20 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCHv2 09/12] videobuf2: let user-space know if driver supports cache hints
Date:   Tue,  4 Feb 2020 11:56:38 +0900
Message-Id: <20200204025641.218376-10-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS to fill_buf_caps(), which
is set when queue supports user-space cache management hints.

Change-Id: Ieac93f3726c61fd3b88e02c36980c1f3c7a82ecc
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/media/uapi/v4l/vidioc-reqbufs.rst | 7 +++++++
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 2 ++
 include/uapi/linux/videodev2.h                  | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index 9741dac0d5b3..80603f57eb8a 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -165,6 +165,13 @@ aborting or finishing any DMA in progress, an implicit
       - Only valid for stateless decoders. If set, then userspace can set the
         ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
 	capture buffer until the OUTPUT timestamp changes.
+    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
+      - 0x00000040
+      - Set when the queue/buffer support memory consistency and cache
+        management hints. See :ref:`V4L2_FLAG_MEMORY_NON_CONSISTENT`,
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN`.
+
 
 Return Value
 ============
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index eb5d1306cb03..22ae0ff64684 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -698,6 +698,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
 	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+	if (q->allow_cache_hints)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 169a8cf345ed..12b1bd220347 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -951,6 +951,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
+#define V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS		(1 << 6)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.25.0.341.g760bfbb309-goog

