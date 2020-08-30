Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2F8256EEA
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 17:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgH3PFz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 11:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgH3PE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 11:04:56 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB05C061239;
        Sun, 30 Aug 2020 08:04:56 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t7so3297445otp.0;
        Sun, 30 Aug 2020 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Es4kZEIMvRU2zV/gMiYhHOsFVc+QsyIoOtUdccLtNdo=;
        b=MEaZJ54kn8cL89PvsI0AHlm+W5xJuRyQGLHXQJBrL4I3fuaJXmCbyZ6nZhjAW/rVVl
         ioztRcHskqevxCjpaGAy3vwF1LnJUUzrRJJGpWzAWW3w/eTle3LELOI8LrqBdzGPKHXo
         Z3oxCGg05PS088Jdi3J0thU5UPNJTPYI9LPOw41SgdwRZDtz5utlHAbcjF9NCX/cLJMU
         VZzdmibml4IJSpqRye+BN/PwYXl0q1Eut8+eeLC8IqB1DvW7VH72pF56b0hOP5WnKVMn
         TgrojcB2EPTt4s3uON8pytz3MsQu1SYqihc0dZKGjc4PnRP33oaqMJX//MoHX1bDAvHp
         gVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Es4kZEIMvRU2zV/gMiYhHOsFVc+QsyIoOtUdccLtNdo=;
        b=uX8nDeostAwKPdeRVgG7qUDiz58l8sx7ctkXd4XgG83igEvyXnEkIFGyxFNj0hNRIJ
         RFAa04+ftcZ48+n7OwPHZlerS5jVp4fQPZnJTzpnt6GpnjHOjY/8oFirKn1+ICozyduL
         gr+wrHyOyEiJ3uWTvwER7j2cJVAV6BSwPvhIxw16D+jWyQxYpiU2jAEqVcNI9njikpJ5
         XTV3hjcD8BSEmEPE8QwbKM+cQz4NxVkapcW2cctGFiIZlW+toJR+5OGja5uj5u/qMSas
         UZi0HXuniCpMjvLX0HAnzl7IhbDhe4V1H0mh1UH2suTSCv7+fNtp/7ruLr4/7++uIZhE
         5geg==
X-Gm-Message-State: AOAM530AUhe+uRkBzwI7SgwUDYJc060C51P9/OYA/wHJva+FQ3owGoRS
        jXTn5Rm98HA/JMAfm5jVFfU=
X-Google-Smtp-Source: ABdhPJzR6UopvhKv4I7vbbBAESp6f/cDqIX8GkcmhOErrU7gTQXke3+AEaBRjNvgANgCyyRAvjgugA==
X-Received: by 2002:a9d:5e0c:: with SMTP id d12mr4761399oti.239.1598799895933;
        Sun, 30 Aug 2020 08:04:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c15sm1101354oiy.13.2020.08.30.08.04.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 08:04:55 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/5] media: uvcvideo: In uvc_v4l2_open, check if video device is registered
Date:   Sun, 30 Aug 2020 08:04:43 -0700
Message-Id: <20200830150443.167286-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830150443.167286-1-linux@roeck-us.net>
References: <20200830150443.167286-1-linux@roeck-us.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

uvc_v4l2_open() acquires the uvc device mutex. After doing so,
it does not check if the video device is still registered. This may
result in race conditions and can result in an attempt to submit an urb
to a disconnected USB interface (from uvc_v4l2_open).

The problem was observed after adding a call to msleep() just before
acquiring the mutex and disconnecting the camera during the sleep.

Check if the video device is still registered after acquiring the mutex
to avoid the problem. In the release function, only call uvc_status_stop()
if the video device is still registered. If the video device has been
unregistered, the urb associated with uvc status has already been killed
in uvc_status_unregister(). Trying to kill it again won't do any good
and might have unexpected side effects.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7e5e583dae5e..1f7d454557b9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -548,6 +548,10 @@ static int uvc_v4l2_open(struct file *file)
 	}
 
 	mutex_lock(&stream->dev->lock);
+	if (!video_is_registered(&stream->vdev)) {
+		mutex_unlock(&stream->dev->lock);
+		return -ENODEV;
+	}
 	if (stream->dev->users == 0) {
 		ret = uvc_status_start(stream->dev, GFP_KERNEL);
 		if (ret < 0) {
@@ -590,7 +594,7 @@ static int uvc_v4l2_release(struct file *file)
 	file->private_data = NULL;
 
 	mutex_lock(&stream->dev->lock);
-	if (--stream->dev->users == 0)
+	if (--stream->dev->users == 0 && video_is_registered(&stream->vdev))
 		uvc_status_stop(stream->dev);
 	mutex_unlock(&stream->dev->lock);
 
-- 
2.17.1

