Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BBD261E13
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732467AbgIHTqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731941AbgIHTqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 15:46:10 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5D3C061573;
        Tue,  8 Sep 2020 12:46:09 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id y5so255943otg.5;
        Tue, 08 Sep 2020 12:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ppa+VFlA0URsOyfSfA/7zkYsruytaIg7Y/lMhDsaJoU=;
        b=eKu/N0u39OquTX3D0Rgot+H8qc5szZqDlLFTyc4nK3vUUd8pr6x2qm3jQL/X/viA0t
         0iZ+KXureb+iNlUdW/u6Iyq1PW/BflC85aHLXV4MDeQtZuvdU4p1Tnn4ocV6YJfXly68
         YltOIb5Hjnth3FAvlb/JUxV6WJkkKPM33MQu/B3dGs9+h3reiqzH8ixsHAaJex1PI4kP
         WQ5IPRyhWWdoaLgIGxxkqCL6m1udEAV36KLfV+2yomWGGsCJiDjFOFoBf+3xxT97nXjZ
         IK22HxxA0sMR6xD6MgN5x153onZ8+7nKr8bL72u0TX3dN19SNIBUUTMTzvZIH9lJFI69
         Rj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Ppa+VFlA0URsOyfSfA/7zkYsruytaIg7Y/lMhDsaJoU=;
        b=jKbP9e1WVKkR5ooyMV+wS1i2BMUcjlaF/F/KIPSk6QL/y4/VPJoBgRC74pDBScc1io
         RTJ6W4fB0hssKO5kMMuC3uxtbRwdcV1kk2HGGN0/eyB16zvR2foo6vthhztgQ5to99Gg
         itRnlHISpFzqvVXyA9hQ7+CgBCbHLJgVWvkVtnwUZ+LoUtkQQUzLOxJwLJf/Qh0HzjBk
         6o+d4Dloq8h+p2nqG3vJrmqPhwhKJbGbXf0umberNf3yF0mIi6CQCv9nWTqUJlhAcEOH
         2TQzj1VOdOr+xNaOOCSZBkhzPc21jc3UFHBCtt1uD80B5VEE83OGc4M2owJULoi/WvsM
         rgAQ==
X-Gm-Message-State: AOAM533Mo3afKOHuVRZWiCZqAhh2vo5+x5oYxpwJoL1XwSi4iEon9gNA
        nfBXlRy55LwnoGGv9udXcVs=
X-Google-Smtp-Source: ABdhPJyEpajpIfdBDo4ccv6sfhyDIcoUR1YDEdSFH0ObeXczmyOux4lumesGfNl663FjvCdM+TS1Ew==
X-Received: by 2002:a9d:850:: with SMTP id 74mr501171oty.29.1599594369252;
        Tue, 08 Sep 2020 12:46:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 92sm31995ota.38.2020.09.08.12.46.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 12:46:08 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 4/5] media: uvcvideo: Protect uvc queue file operations against disconnect
Date:   Tue,  8 Sep 2020 12:45:56 -0700
Message-Id: <20200908194557.198335-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908194557.198335-1-linux@roeck-us.net>
References: <20200908194557.198335-1-linux@roeck-us.net>
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
v2: Return EPOLLERR instead of -ENODEV on poll errors

 drivers/media/usb/uvc/uvc_queue.c | 32 +++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index cd60c6c1749e..b2c59ce38008 100644
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
+		ret = EPOLLERR;
+		goto unlock;
+	}
 	ret = vb2_poll(&queue->queue, file, wait);
+unlock:
 	mutex_unlock(&queue->mutex);
 
 	return ret;
-- 
2.17.1

