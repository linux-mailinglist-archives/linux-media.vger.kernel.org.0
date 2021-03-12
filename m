Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999FA338D73
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhCLMtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhCLMsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:48:39 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0485FC061763
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:39 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y6so7755775eds.1
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iC9T3W49phx9ycGNLm19YZIp4bDw565l4vS57RSLJ3A=;
        b=B8/IHQDOhfTCK114HvgEuKojb44oCTUygtCe8n1/aaD6wJG80mZqATJDHKt7cjq4LH
         VWb2bJj+9NxgK5RzBoAJ81ixoycj0UGAgNympZ5LJtLV2EwD0rIeLWoWnDCPJ5wkbqBI
         r3ukm0kL3sPICNa8dsZMyh1JQ5XXY/DSFmS+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iC9T3W49phx9ycGNLm19YZIp4bDw565l4vS57RSLJ3A=;
        b=kl/T7Z5qiXFWNJtOIR3qeWmzEYL4OfRP3X4kfPViKFyF+LI6dsEynxC1oTaGgrrSWK
         GinDhzOGNIqZoY9SVmejsXgrPx6VXccAHs67ebR7/nZxsGFppKec9nM+jGYinEDcRSQN
         V1i4cdLHNC0EBTHmswvSxYx+eD6j9y2BiZyZOkvO8PoUNrhjA5fjUzybYzKn7tCGtZTN
         a129+hsiEKX21Z/YfxerH08dndWM5/X5dHSoXQvIPsemVZTo8PN8qlikXNOlZXph67kf
         mHxbwtEZDLPNV0+E8baSWNBaTN7/hBFlQdWRQxkOeXClIa0qX0UTPmBNCX5xpSnO3GEB
         7OQQ==
X-Gm-Message-State: AOAM532J0tPjaJLUdmHYksEASJAQO+Azc9BAf4SjYvcAkbUlFGzAE2cj
        TG6h1vXgXwWHM3v7uamgpjv+Fg==
X-Google-Smtp-Source: ABdhPJxGp19R+/m0/2NU4mKcjrhxSctt+nZcz6ANt2xwYlWEnA8gWZk7fNnQtYzh0y+jnRNKvPijfw==
X-Received: by 2002:a50:f9c8:: with SMTP id a8mr14087886edq.270.1615553317778;
        Fri, 12 Mar 2021 04:48:37 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t6sm2924402edq.48.2021.03.12.04.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:48:37 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 7/8] media: uvcvideo: Set a different name for the metadata entity
Date:   Fri, 12 Mar 2021 13:48:29 +0100
Message-Id: <20210312124830.1344255-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210312124830.1344255-1-ribalda@chromium.org>
References: <20210312124830.1344255-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All the entities must have a unique name. And now that we are at it, we
append the entity->id to the name to avoid collisions on multi-chain
devices.

Fixes v4l2-compliance:
Media Controller ioctls:
                fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
        test MEDIA_IOC_G_TOPOLOGY: FAIL
                fail: v4l2-test-media.cpp(394): num_data_links != num_links
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 35873cf2773d..6c928e708615 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2154,6 +2154,18 @@ static void uvc_unregister_video(struct uvc_device *dev)
 #endif
 }
 
+static int uvc_oterm_id(struct uvc_video_chain *chain)
+{
+	struct uvc_entity *entity;
+
+	list_for_each_entry(entity, &chain->entities, chain) {
+		if (UVC_ENTITY_IS_OTERM(entity))
+			return entity->id;
+	}
+
+	return -1;
+}
+
 int uvc_register_video_device(struct uvc_device *dev,
 			      struct uvc_streaming *stream,
 			      struct video_device *vdev,
@@ -2162,6 +2174,8 @@ int uvc_register_video_device(struct uvc_device *dev,
 			      const struct v4l2_file_operations *fops,
 			      const struct v4l2_ioctl_ops *ioctl_ops)
 {
+	char prefix[sizeof(vdev->name) - 9];
+	const char *suffix;
 	int ret;
 
 	/* Initialize the video buffers queue. */
@@ -2190,16 +2204,21 @@ int uvc_register_video_device(struct uvc_device *dev,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	default:
 		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		suffix = "video";
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+		suffix = "out";
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		suffix = "meta";
 		break;
 	}
 
-	strscpy(vdev->name, dev->name, sizeof(vdev->name));
+	strscpy(prefix, dev->name, sizeof(prefix));
+	snprintf(vdev->name, sizeof(vdev->name), "%s-%d %s", prefix,
+		 uvc_oterm_id(stream->chain), suffix);
 
 	/*
 	 * Set the driver data before calling video_register_device, otherwise
-- 
2.31.0.rc2.261.g7f71774620-goog

