Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4661C122289
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfLQDVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:21:19 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44642 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfLQDVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:21:18 -0500
Received: by mail-pg1-f195.google.com with SMTP id x7so4835898pgl.11
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9bAWCFHMKxSYudc9xD0mtxl2wph3ZizEkb+ltF/fPnw=;
        b=BBtVGsMs2whxo8gii2bpcI+p/QNQAnqcFhqYz4KHXqpr6gixuGZiqazsuOXfgEd31W
         0NACv8eevYTpBfRxG02yAOShCwGqI1Fs7roWvTYQMUNAMPa7DdFMaiUBKE5W0hF59KCn
         BH5JRiI0Dn6x4z3XKFHNHyJK8pL5xFO50IW3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bAWCFHMKxSYudc9xD0mtxl2wph3ZizEkb+ltF/fPnw=;
        b=bbstkyWo8m0CtCeaDMufoEAO1DwueWSBAdt0HeD2qXpBSzomDjrJNUhrntvmS0b7VD
         dYbun0ELnojo07fi6V/u6DOxzWBu+d4RIb8HF0mYI0AsZZz7QXwiupEwTsLgWKFi6XR0
         MRv5HpxlmIeWi3LkxXcZpu5LU33ZF8w3RaFWpZYbMH2Y1SjfpZ5Vkw/7SLxuojLDgGXu
         5g0MmQgCKJSSJNMlkwLMZJ8gEqyYoOnOOj4Hvmbc32/l2BUp3uJ1f3R67AouWQ2mU3Q7
         ZoBCynqBqSjdgVtsRyxtwFkPKWiDmZZeH1jXzCeSCwp+M+4pFF4YRyEB4tOpz4mq4UQp
         EMPA==
X-Gm-Message-State: APjAAAXeCE/V1jGkwxSKGA1WZtFe/Ld3gG9Waf8/e+bHiu4r7ytV9jz9
        uEHyv04BkOm3kF0RTVPaqUHYXQ==
X-Google-Smtp-Source: APXvYqyZLTtmMRSnUha4K7/FcPhyMSiJtduh+2WvfTUf+qckUNomryze1L6EP3IgVb1v2AShg3jObQ==
X-Received: by 2002:a65:58ce:: with SMTP id e14mr22577119pgu.153.1576552878016;
        Mon, 16 Dec 2019 19:21:18 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:21:17 -0800 (PST)
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
Subject: [RFC][PATCH 10/15] videobuf2: let user-space know when driver supports cache hints
Date:   Tue, 17 Dec 2019 12:20:29 +0900
Message-Id: <20191217032034.54897-11-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS to fill_buf_caps(), which
is set when queue supports user-space cache management hints.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/media/uapi/v4l/vidioc-reqbufs.rst | 5 +++++
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 2 ++
 include/uapi/linux/videodev2.h                  | 1 +
 3 files changed, 8 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index 9b69a61d9fd4..13eab807fdfb 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -166,6 +166,11 @@ aborting or finishing any DMA in progress, an implicit
       - Only valid for stateless decoders. If set, then userspace can set the
         ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
 	capture buffer until the OUTPUT timestamp changes.
+    * - ``V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS``
+      - 0x00000040
+      - This buffer supports :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE` and
+        :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN` user-space cache hints.
+
 
 Return Value
 ============
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 48d123a1ac2a..1762849288ae 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -684,6 +684,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
 	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+	if (q->allow_cache_hints)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 82e2ded5a136..b5d6b8d4ae93 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -932,6 +932,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
+#define V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS		(1 << 6)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.24.1.735.g03f4e72817-goog

