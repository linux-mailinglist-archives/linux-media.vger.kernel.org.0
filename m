Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724DF26D12B
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 04:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgIQCdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 22:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIQCdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 22:33:05 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0231DC061797;
        Wed, 16 Sep 2020 19:26:05 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id a2so481505otr.11;
        Wed, 16 Sep 2020 19:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ljdmjxdKqEuBlgltC6/Q3uw8AjHFikdpknr0TkuRy0A=;
        b=YHFubGF31fKSw5FJtZqFQQbWWzTmPO4L7HyCUWSEw7HpOARjJfH1pdbHGg3fskJMN9
         SJXpz7AZBuSkbz56d2pPj+fjmNjm+mi4F5a1ZWqoSvUNsycvxASJid+KEiMQOflzRC6z
         SHiWlZOp8+NaHPmjDuOAt0yd65ncxNbtmGJFdS2YW23ifhrrTlEBBKgAclwFgVuaXxZx
         ssGCl/6/74rm05R53imZOke/NCf0sIOCxQ84Ma0cKHE8U30EXYYO3vwcAvx+/Vem+5Qx
         vsV52yGOF7s8BxZ3HINY8zdRUBHVW9+rIHrYXq1Re2fQ5r87vxMr5NbGi/2OnuIs7xbW
         q9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ljdmjxdKqEuBlgltC6/Q3uw8AjHFikdpknr0TkuRy0A=;
        b=cwMRPOzP1kWsjM3OXwWgQmJC5gfEbq5oDiz2ZeC+QUBhMki9Blo2ikaB3Pu8FFWaJf
         ujvytjYJs3xOdczc95v3IfwjEJ7lQfKas4FpKcAM54gesFW9yqisAuojnC2nZJysMkth
         YHyl/c9rVDEoLS3fj6Li1nV2X1YIZjdYFtEjQXNZHsiVGuw4Dw7f0jJjPLmRaHfLakfx
         +TSVOl2uwTdRg5Uy+R1RVMPT/iTPaTFkmnK7Sx6wbWeGx2Xb5jzYExclm1SjQ5EiOmfE
         6xD3mkWKV9iq6plDg1plGBX74KHncwuYaK1zuqi+8g2ySlWGfnYsF7nvR6pxMqu53ch9
         KldQ==
X-Gm-Message-State: AOAM533sT561o4sBLpSDyiZTtUJcBXdRtVm5KAiJ/5MKu95vwF5s4v2O
        vVjm/oy39jJHByeEAcdrgJ8=
X-Google-Smtp-Source: ABdhPJzDl9ZZfD8ZSxUVlnOikRRv4WS+mkf73k0l4N5ta56eofyQlT8SAN949r9jTu6TBH6XzUYH2w==
X-Received: by 2002:a05:6830:20d8:: with SMTP id z24mr18418697otq.3.1600309564443;
        Wed, 16 Sep 2020 19:26:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c25sm12286685oot.42.2020.09.16.19.26.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 19:26:04 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH RESEND v3 5/5] media: uvcvideo: Abort uvc_v4l2_open if video device is unregistered
Date:   Wed, 16 Sep 2020 19:25:47 -0700
Message-Id: <20200917022547.198090-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917022547.198090-1-linux@roeck-us.net>
References: <20200917022547.198090-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

uvc_v4l2_open() acquires the uvc device mutex. After doing so,
it does not check if the video device is still registered. This may
result in race conditions and can result in an attempt to submit an urb
to a disconnected USB interface (from uvc_status_start).

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
 drivers/media/usb/uvc/uvc_v4l2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7e5e583dae5e..8073eae5d879 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -548,6 +548,12 @@ static int uvc_v4l2_open(struct file *file)
 	}
 
 	mutex_lock(&stream->dev->lock);
+	if (!video_is_registered(&stream->vdev)) {
+		mutex_unlock(&stream->dev->lock);
+		usb_autopm_put_interface(stream->dev->intf);
+		kfree(handle);
+		return -ENODEV;
+	}
 	if (stream->dev->users == 0) {
 		ret = uvc_status_start(stream->dev, GFP_KERNEL);
 		if (ret < 0) {
@@ -590,7 +596,7 @@ static int uvc_v4l2_release(struct file *file)
 	file->private_data = NULL;
 
 	mutex_lock(&stream->dev->lock);
-	if (--stream->dev->users == 0)
+	if (--stream->dev->users == 0 && video_is_registered(&stream->vdev))
 		uvc_status_stop(stream->dev);
 	mutex_unlock(&stream->dev->lock);
 
-- 
2.17.1

