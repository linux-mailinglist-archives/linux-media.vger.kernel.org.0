Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF3434A521
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhCZJ70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhCZJ6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:53 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED10C0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:53 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id l18so5603190edc.9
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NAt2Z25D9SYYUpw3Y+wmG0p1xTHdfyVY2RGY6L+Y0hI=;
        b=LrHEzGD9Ux0D8mtGSKfVkBZRLNoH2qNBpGR7qYHGhKS5Zme7q5MPI6ZZWz82JjhhAh
         gZQO9Xy2aAZzim5GW32rq0dkMWGU2yQaZrZMwv1wY6wGYsR7YHI1fymo68fRAwlmqKkM
         1i3+XVDpkOTk6i2u3QBWFnVIH7B136LEHLoAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NAt2Z25D9SYYUpw3Y+wmG0p1xTHdfyVY2RGY6L+Y0hI=;
        b=JomOXlwFMyciDjiE0c+DIacG8Wj65e7jzlwQknn5HUTcQGSEvg2NFSEhJLmJRdL+Wq
         nHj3z7FJSCIgt5RdombfauLMjKZiu6U8KcOo8xZ3B5kRurzg1dznLddZWTSYf6d7z9d3
         HO0Nhyzs80t3M6b4aa7FQ4HBWY+4RfBB5C+OjxnWURtN7rAw/BxOlA7aEFsjVzTiffls
         ptkZ3jPf4mv9cO++fl19GnJdwHM9dn5U6FkX3tdriDaBwAFdQSJQsnc+7VXm/e6UOfyF
         O+lttumykISq3kpnBPsz9Ik1R8Lt/2KIOJaKCfLxwT/xKnISYuaZv2jsjklpi/pPkN7p
         zkKg==
X-Gm-Message-State: AOAM533hLO22TQRQVZC19MHN2td/DtEJ1gKBhGA1W/lyQaFxKLbBz5o+
        OzMpsjjYFeHdN2gy/0JVzrcpX1C8WNwCW0SP
X-Google-Smtp-Source: ABdhPJyeic7XYW8exgiEgegNfx0tIOIllkPhddEzh/cMFXSwk9DliC5yF5YdlkgGjxwf5ngG4nmi2A==
X-Received: by 2002:aa7:c74a:: with SMTP id c10mr13749686eds.332.1616752731925;
        Fri, 26 Mar 2021 02:58:51 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:51 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 11/22] media: uvcvideo: Set unique vdev name based in type
Date:   Fri, 26 Mar 2021 10:58:29 +0100
Message-Id: <20210326095840.364424-12-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All the entities must have a unique name. We can have a descriptive and
unique name by appending the function and the entity->id.

This is even resilent to multi chain devices.

Fixes v4l2-compliance:
Media Controller ioctls:
                fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
        test MEDIA_IOC_G_TOPOLOGY: FAIL
                fail: v4l2-test-media.cpp(394): num_data_links != num_links
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 35873cf2773d..76ab6acecbc9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2163,6 +2163,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 			      const struct v4l2_ioctl_ops *ioctl_ops)
 {
 	int ret;
+	const char *name;
 
 	/* Initialize the video buffers queue. */
 	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
@@ -2190,16 +2191,20 @@ int uvc_register_video_device(struct uvc_device *dev,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	default:
 		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		name = "Video Capture";
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+		name = "Video Output";
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		name = "Metadata";
 		break;
 	}
 
-	strscpy(vdev->name, dev->name, sizeof(vdev->name));
+	snprintf(vdev->name, sizeof(vdev->name), "%s %u", name,
+		 stream->header.bTerminalLink);
 
 	/*
 	 * Set the driver data before calling video_register_device, otherwise
-- 
2.31.0.291.g576ba9dcdaf-goog

