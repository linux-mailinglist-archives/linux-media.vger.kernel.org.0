Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66F833C466
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236392AbhCORgl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236201AbhCORgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:17 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61304C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id u4so18312760edv.9
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1MckosJzUu2CQ3qgCveRtXT5Fl+1KQo++LPrJvuljw=;
        b=axm/2YCstp+BXtdXpUb2XbtOyIVKPk9CpRa4p6uJWBdOkQMMiUDAbRh63DpKyhaVMS
         kf2uw4Pj5MPykfKyoCpWmCpJXhAp+rUaBa96C7twwxPpKxIUc54nTx9OrgIzSx9eb2Rf
         Ih2Fcyk7QP1JDaCHeu0/FEUQfhAi903kfhrXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1MckosJzUu2CQ3qgCveRtXT5Fl+1KQo++LPrJvuljw=;
        b=FtiIIuievIPXdqb1f8p4x37jr8wTdWVYjB8rUZawpOSNHtuIHu3HfpoZjtV8oZN1E+
         P8CLDxlafpSXYZO6HZC1oHBJFPBCjB6emE3KK9w92f3F3+LOCzQq7c9HyRH/bxeQMQ0L
         a9V7DP/+UmVzDsDNHy9RkHJArv1CNBa7d69YY7UHLfN8g3LHgtsZnSK+7NwAuxYB6Ucz
         UXDxR0jN08oLtKbv9JCuZknzG8o/oWfo2HXECuG0S3GVHsOgv7spQC9xk0MbtV3abkoc
         o3MGw5ymzB7NmGoPnE8E0nUx4kvuWzXZB0nb+p5LYN4+UXOOXHvBmR5VICN0+livk0kg
         MA8w==
X-Gm-Message-State: AOAM532Ey/0mbTrCKPShmC/2w4BZVDnFdKy0tUXf1O0meiFn5eZEYRMI
        yiJEoP6+QxI7wRD/8kGlUeZekE2ksgltpqE/7Lw=
X-Google-Smtp-Source: ABdhPJzFRRDSiPs8VxbfEgQYAhB/5oJ/AuMUCFtBungtYrTzobl0TDtRZTdlEvDd+aql57jpbvGG5g==
X-Received: by 2002:aa7:cd64:: with SMTP id ca4mr5164326edb.334.1615829776180;
        Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 08/11] media: uvcvideo: Set unique vdev name based in type
Date:   Mon, 15 Mar 2021 18:36:06 +0100
Message-Id: <20210315173609.1547857-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315173609.1547857-1-ribalda@chromium.org>
References: <20210315173609.1547857-1-ribalda@chromium.org>
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
---
 drivers/media/usb/uvc/uvc_driver.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 35873cf2773d..73ab30891845 100644
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
+		name = "Video capture";
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+		name = "Video output";
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

