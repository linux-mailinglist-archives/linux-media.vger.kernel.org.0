Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4AFE3ACADF
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhFRMbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbhFRMbq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:46 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48C1C06124C
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t3so8392470edc.7
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VY+MwtTzjVqKCPnuwcTEoHPw94xFL8xuvnf0e6wvu50=;
        b=lBocezO2BT8O8bEg7CpGfoRO9e0Y2ghW2/CcOMigIOVVRmMDDOCq1FaS7YufMoL6z2
         r+TCL1cj+B/PGgJUckP62QOv02+K9ylForK1dBE4VfVnW2AsJzlG57w2pqUD8qEMEnQf
         YeMRWN+wYPZEKyJ/GpB9EazE/gM9AELbYhMGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VY+MwtTzjVqKCPnuwcTEoHPw94xFL8xuvnf0e6wvu50=;
        b=lPebLR7zG/Eea+iVHqA6JiXP0iFW8+j0Yb6+wohpd0YHogpgn721aI+8YtvgsCTMhA
         iBVXgp4OkmDhLlf0S4DvjgbSNhe1A4Hnx3vJS3+TIXfSTsSiA5TFCI5OwhlDoOOiwpQB
         VWkDg+OGKguX+8jWjJd8+Jaro7UYJAQ9/FF4NYIaHpM8NwcU6zYrkE7kAauNU4HZpCOd
         CqexqKC6UGwfX7gimeOpmnStdo67az75bUuoQhvoX+44FVe6/cBqvL5mC/KC4U2KqjR0
         8Qh3CMHSJ2q8NDhG3yfCLC/4+EPHaTeJ1pQBoaCPdKm1PooiGMhOeEOP4F8zEYPZDngM
         ry+A==
X-Gm-Message-State: AOAM531zYhmy4FHC2RSutXVW5bRHfku+SOC2eKieWltVQBlUExiCEepy
        QschqHarnzOHxMGYXv/a/wY6efthgqHWVQ==
X-Google-Smtp-Source: ABdhPJz7c28cJb1pvAHztCDTs9UtUKkk+ht96mYbjKBEnMuNXSA4zLSH69uqwtYYRKVscnWgm9ovEQ==
X-Received: by 2002:a05:6402:144d:: with SMTP id d13mr4477012edx.288.1624019372532;
        Fri, 18 Jun 2021 05:29:32 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:32 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v10 10/21] media: uvcvideo: Use dev->name for querycap()
Date:   Fri, 18 Jun 2021 14:29:12 +0200
Message-Id: <20210618122923.385938-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the device name for the card name instead of vdev->name. That way
all the devices have a different name instead of the common vdev->name.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.32.0.288.g62a8d224e6-goog

