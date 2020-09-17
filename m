Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD31426D131
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 04:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIQCdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 22:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIQCdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 22:33:08 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6ACC06178B;
        Wed, 16 Sep 2020 19:26:03 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e23so499034otk.7;
        Wed, 16 Sep 2020 19:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/A6QIUaW6dlUrLIR6jblGA3Qz+aguMCDfamOgN/GW2I=;
        b=rXF1ktbsVWvCNRHAereegMKhwrjFhW8bsgVCjuOt1bHlGZ73432oT0ENfpoEZHiKC1
         UcFm9/UdGlJR1QgMWJyJNQo51AcV/TmDl4ri1TkiiNyxBxIl6hEjY7ruHf/giqw/m3Cc
         aJiOivu1MLpuIf9roq9HB3hB6NsRSyTwSTXtEd9rC+BMACv3Q/yGSIX/jCpQgKkTLzL9
         cTfFjRnEV3374ShZ1EZUs7+3XnzFqGKTQRbMdmagIaavKO6gv7aGsJ3jDdXvNtL4o4us
         Jpe4QtjbDTUCbvJM9iIZ/3yV616BOH89wZGrOsb20m4OyHXc9DYQJu0hp2h+B1F+CSgo
         GxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=/A6QIUaW6dlUrLIR6jblGA3Qz+aguMCDfamOgN/GW2I=;
        b=XK71hGl2rkuZKfdrGg6QkK157h79B+2RAru5mIVa9QOrx9bjIksDx7x1bPhjTGtnD+
         d93bIrSJ3vOygkXzkoe8HH436L1q+9MWfkH1dZfnc4cvr2ddFXMQ1TqyofSX/q9GWVDz
         fronI3twc8g6h3KlMT4GcNuYLKKO+T552hZJqtgg3bGxARbvsftIF6dWoQ7cwdcsze/k
         E/Um5QWurFpxsiioOjv4H2Pvo5PO6ZT2IPMjZNDq9+x0nIkD9EbEcIg1UlRdryonXUzJ
         BwyZgjOE/GFnZiYK1hOVzQ0NMLcMZiPK0fjRrE4VTywrO5Sq3vLvMr7xPqxbnfcZMVa0
         c54Q==
X-Gm-Message-State: AOAM533N2JpqzRrQ5idCetIRXmW7jatfjjXHzJP+ZuRV2M4243itGuKy
        buiXKlAjaJ8y7dCokDlutyg=
X-Google-Smtp-Source: ABdhPJw/Uh3+Ji2abPEMqgJxGbyg9IDcfaxS248kkZAyODqJoAftiP27qHhrvS5zUWrLqjXsHK0Yjg==
X-Received: by 2002:a9d:ee2:: with SMTP id 89mr19056795otj.194.1600309562877;
        Wed, 16 Sep 2020 19:26:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 187sm10756368oie.42.2020.09.16.19.26.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 19:26:02 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH RESEND v3 4/5] media: uvcvideo: Protect uvc queue file operations against disconnect
Date:   Wed, 16 Sep 2020 19:25:46 -0700
Message-Id: <20200917022547.198090-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917022547.198090-1-linux@roeck-us.net>
References: <20200917022547.198090-1-linux@roeck-us.net>
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

