Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474253422EF
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhCSRJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhCSRJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:19 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DB0C06174A
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:18 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id k10so10892458ejg.0
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VEHA0wDh2t06lBti+/CKy5TQQJ8gS0FLl9pl6QcZYKI=;
        b=klWXVuR8O1Vy0VInrrZJzfEK7Dyb/ZVFAXvREjrGP2AzreuOcJH6CP8Nkx+kzTOpwF
         dyoBUbm7rsFHianFatx1CBzC/PQEaYQ/X1z27rjWiEalg7uito9Ll/W8j4DiqnC94z84
         +vCjWfO9GTpNFBJ3KGxf2St4zT7hsyuU3NE3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VEHA0wDh2t06lBti+/CKy5TQQJ8gS0FLl9pl6QcZYKI=;
        b=A73rf3y0nUuaLeOgj1HIPOadM2rtCLQ1OwlasbgBfSTWSjFVFfGkmKlLo9e5d/097s
         4/exYBW/RYdlOWICjqPBpn1bIy0mq5SeJLZQdydCBKh98vh0NJBmAWiCfNYwx2xi8hzc
         cTVbkRw/vP1uSJkU9pIWrySE82mr4XzDRZ291Fvzc6XMrkzJ3ffvvB0NcE+LFhIrryDV
         OKoVcSWMrx0k8aC15gzanSx4o8trzIB232ob6MpAqP9UNAbe7ypVVoFHcl6bf3YTA6SQ
         J+YSVd8EfFu1+IRFrrkWYdWUBJgYhFY7zlatnocrkXLWY+31U9eY74Im1S8YZxE5LyMB
         682Q==
X-Gm-Message-State: AOAM530LqCe4SAcXggDrTYdLjOphv2jrUW0oR+d9hhsdispHgxKFeNqK
        HiWSwCb1IcFE8oftc0Snn24Vjw==
X-Google-Smtp-Source: ABdhPJw1ILzYRAUxjyqz7ZokXkN2d+Mx2gK9UjQXDOWBwtzQfv6aAN9JVK9oE3gOv5I4PepmwvPt/Q==
X-Received: by 2002:a17:906:f953:: with SMTP id ld19mr5400744ejb.164.1616173757580;
        Fri, 19 Mar 2021 10:09:17 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:09:16 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 11/19] media: uvcvideo: Set unique vdev name based in type
Date:   Fri, 19 Mar 2021 18:08:58 +0100
Message-Id: <20210319170906.278238-12-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
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
2.31.0.rc2.261.g7f71774620-goog

