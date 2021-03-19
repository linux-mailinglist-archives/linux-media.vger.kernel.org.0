Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CC83422E8
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhCSRJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbhCSRJR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:17 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C859C061760
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id j3so11602987edp.11
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k6XtuWSZV2cyj5K0GtrHJjfNWfnBd1fX/F8MzFHITjc=;
        b=V4diAboUR9u651Uq84ZsMNn/QZfW5SFjZHABvi+1i+YgyE8Ww/kMMY+AZRz510eF82
         Hc4qSY13LuE2jIqv/u4HClmkeOZdYeDCnCIeCADPjDx0w0Hne0NEh/dd6VPHE/I8V/QC
         2WtXUsJ5wYElb8yjSZ+SbUqNbyLo2FbrIw1D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k6XtuWSZV2cyj5K0GtrHJjfNWfnBd1fX/F8MzFHITjc=;
        b=PRtcSXNSCXZGfnN8p5O52nS+f0s26oROwvk6kq9Qbu5H8WofO58Fry6KHxGzrHvEtV
         W33984x7FdafmQ9oMQ58gJbCVJuIl54ZOwrQ2HRKygy3idEtsw5sU2BcJTfMBPLG+6N0
         pn0W4wgu1W4A/YX5XZE3x9IveJWQSwscJFy0nrpWoHCTA9uH0KfFTsWCJi3CpqA7ssFx
         xaBm5i+BjP6HJhdA/94KvROiuYwjjCXTjh8Xn1Ey6xB1f/HoBZZqLDOARNECRSbOFj3L
         19nk3rCFc6YZTFj2kg+0i/ErOTp1FSUiaEeoX9fZfrJRGHZKweHyUjtNB+fZz8Xo8zvB
         HHvA==
X-Gm-Message-State: AOAM530yyxPILBxQoQE3L22UfLkxEC+N4EevaMaSbtJD1/o4gFUcPeAI
        jzARoBQzHVb0RVL/Rn3lCmB+Gw==
X-Google-Smtp-Source: ABdhPJy9XwXHzjQQ7X1W89+1wQgUC3uAwJmXg6qY1oU2HR+5A3jF1BEnszbEwM8uSI+2h8HVM4/eWA==
X-Received: by 2002:aa7:db4f:: with SMTP id n15mr10710485edt.12.1616173756255;
        Fri, 19 Mar 2021 10:09:16 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.15
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
Subject: [PATCH v8 10/19] media: uvcvideo: Use dev->name for querycap()
Date:   Fri, 19 Mar 2021 18:08:57 +0100
Message-Id: <20210319170906.278238-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the device name for the card name instead of vdev->name.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 2 +-
 drivers/media/usb/uvc/uvc_v4l2.c     | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index b6279ad7ac84..82de7781f5b6 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -30,7 +30,7 @@ static int uvc_meta_v4l2_querycap(struct file *file, void *fh,
 	struct uvc_video_chain *chain = stream->chain;
 
 	strscpy(cap->driver, "uvcvideo", sizeof(cap->driver));
-	strscpy(cap->card, vfh->vdev->name, sizeof(cap->card));
+	strscpy(cap->card, stream->dev->name, sizeof(cap->card));
 	usb_make_path(stream->dev->udev, cap->bus_info, sizeof(cap->bus_info));
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
 			  | chain->caps;
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 1eeeb00280e4..9cdd30eff495 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,13 +617,12 @@ static int uvc_v4l2_release(struct file *file)
 static int uvc_ioctl_querycap(struct file *file, void *fh,
 			      struct v4l2_capability *cap)
 {
-	struct video_device *vdev = video_devdata(file);
 	struct uvc_fh *handle = file->private_data;
 	struct uvc_video_chain *chain = handle->chain;
 	struct uvc_streaming *stream = handle->stream;
 
 	strscpy(cap->driver, "uvcvideo", sizeof(cap->driver));
-	strscpy(cap->card, vdev->name, sizeof(cap->card));
+	strscpy(cap->card, handle->stream->dev->name, sizeof(cap->card));
 	usb_make_path(stream->dev->udev, cap->bus_info, sizeof(cap->bus_info));
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
 			  | chain->caps;
-- 
2.31.0.rc2.261.g7f71774620-goog

