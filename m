Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFCB340F26
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhCRUaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbhCRU3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:37 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF366C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:36 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id jy13so6007625ejc.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VEHA0wDh2t06lBti+/CKy5TQQJ8gS0FLl9pl6QcZYKI=;
        b=FxrXiBUssxlUwHkM1ojnp77RrcpX0k720yrbNJ/G4W7mYnxn4xqxgdHrK03DizTT3t
         MRR5iSaoqal0SdR7j/g3LU9aBmng6Es3zQC1ttrjynHXzhQ2pm9y7+PrsIib0u178TCE
         GTtk+Q6SsfR/S5yr92v4EEO8QLP8IdLEoKz1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VEHA0wDh2t06lBti+/CKy5TQQJ8gS0FLl9pl6QcZYKI=;
        b=qBczUSy1o3RZfQycTqxpEK1I694K3lrst4uncGJxDVTumyVLkXj8odrvUUb5qqfsYE
         oCkk4ei8koTRAhTdA4cBBRUJT3b8BmpAJvH9bS1kAbCLsjXrc0S5dmGLXhJ3VkoT6VDT
         zv9DiZq8js00uUBYojhHBynGW+8TfDEKz7xCAs7i7n2Q2zAuL1tPmSGbgvaXTFEOysS4
         CtKBPfzROGxvWm6zsjJqcoxfAdwGA8yspmPx2eAgTTfpAtvF+0wjbg2cu0bM4/Z0MM+N
         zrQFaFSvJF4zuVpMBpw45zqJ5CRQ79bmzDBInWPkZKDOz/eZ7yVkx2yw6QB487r7w/gL
         qoZQ==
X-Gm-Message-State: AOAM533o2cqorqpYIcYU5qvq7Unw2IPvYMNKnRqgYFNHyfsyfscrnRmq
        5fidbSMLtInInf/ENoqAX2WX7A==
X-Google-Smtp-Source: ABdhPJwUsxb3W2/mPhn1NFAJjLETq6g7Dihth49d6TepEBPbmS07bEX2ykD8K43JD/LCq+ja2Vj/qg==
X-Received: by 2002:a17:907:aa2:: with SMTP id bz2mr397448ejc.239.1616099375761;
        Thu, 18 Mar 2021 13:29:35 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:35 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 09/17] media: uvcvideo: Set unique vdev name based in type
Date:   Thu, 18 Mar 2021 21:29:20 +0100
Message-Id: <20210318202928.166955-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
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

