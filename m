Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF7256EE7
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 17:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgH3PFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 11:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgH3PE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 11:04:57 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75339C06123A;
        Sun, 30 Aug 2020 08:04:57 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id j7so4987008oij.9;
        Sun, 30 Aug 2020 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZkNcNHVU6ZdU0VSPf8SeudCLMA4dEM0Dg2KzNaFvtGE=;
        b=UpO3YKI6UQgD7Xdn2rcCT/uQz+L2twkbkTjDy+RojmAPSG+Gp4QIzNuK+DvVrIDVOJ
         eSo0BabTjvvpoWIgIGg3zxLBQ41gPRLZJXZ2MnzKWwp8S2DyMdnz5fmSb/0/d0alctqy
         rDJ2fMioRGlUtb7qkJInnbBD0CBQDIdkJt5sf4bU3E+94eQkP4gxDw9RCWFiyilego5D
         uikWnuZyngSfMiLP4XfFpx4/jJ3kNdxhjUNU9KylWY2aLlIZwFz0NS0qtS140N/Oa2ja
         x5+9MpHYWuSMtu0+5wAdfP3x7PWDZk1xs37OHDYgk4H4/aKHwpbeguwRaGOhMlnosBXd
         O1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ZkNcNHVU6ZdU0VSPf8SeudCLMA4dEM0Dg2KzNaFvtGE=;
        b=tBYgxEGMfM33cDWIT5sEgNKLsmuLiWfpIRrzDoIeZFfwxW+W63HKTSK2OHbIgXFEP0
         CIxClmnBITwi9uO1xdkY/X34DJo8A0/fGn396QYvY7wnNl2ZcKLWAg8if0lO4XTQYUH4
         v3bLcpbIvfNhh4SD8ziFpmwEwTS1MaXm2f6spB7QO8o4Bv4ztntY5iOKUoudIoCtCrCl
         LCd7doDMRkENYYD194YGIhU4jq8FXUZxfrJ7Dr9BOfBLgC+WMbVCKA6rE4CpzBQ5BKZi
         nzVLPArBzVjFIfsuznpSZ3pr7nupYgeGluDV79WqNmbYSo1TkD9XR1ECwuyGDUFkXce9
         Y3Bw==
X-Gm-Message-State: AOAM531ESF2iH5/fAN24nFOAkV6glMz3zR6BA2/gXD8z8VROIk+PEsQD
        qBH7cF+TMWwf6LWYTp1hBxLvHaOuCVE=
X-Google-Smtp-Source: ABdhPJwpwH5meTO8EaihTTnsgJ8Qc+B2Ncdt52ZwH/k3pp5avUFLREigtVwA9WXPHX1mCx7ZpeWqxQ==
X-Received: by 2002:aca:4a13:: with SMTP id x19mr1474406oia.17.1598799894300;
        Sun, 30 Aug 2020 08:04:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 111sm1192674otc.15.2020.08.30.08.04.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 08:04:53 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/5] media: uvcvideo: Protect uvc queue file operations against disconnect
Date:   Sun, 30 Aug 2020 08:04:42 -0700
Message-Id: <20200830150443.167286-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830150443.167286-1-linux@roeck-us.net>
References: <20200830150443.167286-1-linux@roeck-us.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

uvc queue file operations have no mutex protection against USB
disconnect. This is questionable at least for the poll operation,
which has to wait for the uvc queue mutex. By the time that mutex
has been acquired, is it possible that the video device has been
unregistered.

Protect all file operations by using the queue mutex to avoid
possible race conditions. After acquiring the mutex, check if
the video device is still registered, and bail out if not.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/media/usb/uvc/uvc_queue.c | 32 +++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index cd60c6c1749e..c7964177a99d 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -358,24 +358,52 @@ int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 
 int uvc_queue_mmap(struct uvc_video_queue *queue, struct vm_area_struct *vma)
 {
-	return vb2_mmap(&queue->queue, vma);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
+	int ret;
+
+	mutex_lock(&queue->mutex);
+	if (!video_is_registered(&stream->vdev)) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+	ret = vb2_mmap(&queue->queue, vma);
+unlock:
+	mutex_unlock(&queue->mutex);
+	return ret;
 }
 
 #ifndef CONFIG_MMU
 unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
 		unsigned long pgoff)
 {
-	return vb2_get_unmapped_area(&queue->queue, 0, 0, pgoff, 0);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
+	unsigned long ret;
+
+	mutex_lock(&queue->mutex);
+	if (!video_is_registered(&stream->vdev)) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+	ret = vb2_get_unmapped_area(&queue->queue, 0, 0, pgoff, 0);
+unlock:
+	mutex_unlock(&queue->mutex);
+	return ret;
 }
 #endif
 
 __poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
 			    poll_table *wait)
 {
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
 	__poll_t ret;
 
 	mutex_lock(&queue->mutex);
+	if (!video_is_registered(&stream->vdev)) {
+		ret = -ENODEV;
+		goto unlock;
+	}
 	ret = vb2_poll(&queue->queue, file, wait);
+unlock:
 	mutex_unlock(&queue->mutex);
 
 	return ret;
-- 
2.17.1

