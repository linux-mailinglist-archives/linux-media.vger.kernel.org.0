Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4E2456567
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 23:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbhKRWMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 17:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbhKRWMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 17:12:22 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB23C061756
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:21 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id u18so14360483wrg.5
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 14:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sdfkD+pc9t2E2FEHTAc3AOL1hp4T3RviKzD3tWxDWuY=;
        b=Wsv+nYWPG4GTqK5mzDyVvFOEVrw3P6vfchULBBRKIZbcnusLZmW+cqeeqdYbpu8F7I
         An86uNKk1PhYDnBfrRXTCl2xEALAY2ZeLK3/udtX1sHMtrQwpNfgGkE60bY6mBanGP6p
         MOHOGW0DJnAv9GxX2VjFmW3FbhGphkZfsFacA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sdfkD+pc9t2E2FEHTAc3AOL1hp4T3RviKzD3tWxDWuY=;
        b=oE7WU6N4ZeKYXAxb54Q8sTQrqAtQYbpyBeKYTyiweVmqpcQkeOjyiU/+BuzmQk3N8c
         k6xDVCp6hStXgpqyHQCVWD1jVZOSIO5gA/OSUm/P6Vo+MAAvHQFklpqiL81osGz5OviD
         e45KEknZP7tCf5k1FkVxNCHEuZilJf88nzH57o41M5cDXu25kpkImWPpjS2KVWS+Ls17
         k+8jJP7Kq8ZM29QTYA7zSpNCwBLA73kqfm+qKKvyZreVjQlERbJ48qfRWtWSRDgCJeR+
         eAqATSRKHjko3osUx2FZ8EZ/c/XHQ8d2wZ3tyhH2hj5hrtr666c2yfSit8ikZ+quCkt6
         a9CQ==
X-Gm-Message-State: AOAM533CONuXxJYcaOA1jGLVloX2rVd79ghFyAvtttngaxEd6/KMSAcU
        FHcszSL1OXTSy2cO7NqaGPLyow==
X-Google-Smtp-Source: ABdhPJz2RoHtxyGv6FbSqLMmrieezZ4R20FtFZHAMwg813Fh0N++MHzcu8KsuC3P8yGmz+GxNob+rQ==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr1073512wru.108.1637273360242;
        Thu, 18 Nov 2021 14:09:20 -0800 (PST)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id f7sm13305180wmg.6.2021.11.18.14.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:09:20 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "hn . chen" <hn.chen@sunplusit.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 8/8] media: uvcvideo: Fix hw timestampt handling for slow FPS
Date:   Thu, 18 Nov 2021 22:09:13 +0000
Message-Id: <20211118220913.299978-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211118220913.299978-1-ribalda@chromium.org>
References: <20211118220913.299978-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In UVC 1.5, when working with FPS under 32, there is a chance that the
circular buffer contains two dev_sof overflows, but the clock interpolator
is only capable of handle a single overflow.

Remove all the samples from the circular buffer that are two overflows
old.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 15 +++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index d18bafd824a5d..56ed9ff6719a8 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -466,6 +466,20 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
 
 	spin_lock_irqsave(&clock->lock, flags);
 
+	/* Delete last overflows */
+	if (clock->head == clock->last_sof_overflow)
+		clock->last_sof_overflow = -1;
+
+	/* Handle overflows */
+	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
+		/* Remove data from the last^2 overflows */
+		if (clock->last_sof_overflow != -1)
+			clock->count = (clock->head - clock->last_sof_overflow)
+								% clock->count;
+		clock->last_sof_overflow = clock->head;
+	}
+
+	/* Add sample */
 	memcpy(&clock->samples[clock->head], sample, sizeof(*sample));
 	clock->last_sof = sample->dev_sof;
 	clock->head = (clock->head + 1) % clock->size;
@@ -586,6 +600,7 @@ static void uvc_video_clock_reset(struct uvc_clock *clock)
 	clock->head = 0;
 	clock->count = 0;
 	clock->last_sof = -1;
+	clock->last_sof_overflow = -1;
 	clock->sof_offset = -1;
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index edc9a34cacdb2..5bfe3d1619c21 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -643,6 +643,7 @@ struct uvc_streaming {
 		unsigned int head;
 		unsigned int count;
 		unsigned int size;
+		unsigned int last_sof_overflow;
 
 		u16 last_sof;
 		u16 sof_offset;
-- 
2.34.0.rc2.393.gf8c9666880-goog

