Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD48034A517
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhCZJ7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhCZJ6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:52 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A526C0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:52 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w18so5690586edc.0
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=neLiXa2Mi6CDcIfMH5ROa7xzDK4SNK6Agg6TL5Pdv3o=;
        b=MNmPEK9lIQNgbpBYhPsqp2edjQg+xONrsRZIssar5j4aaFrDqaurTJfP1xgfLSK0WN
         5y/10UcuCCAaLgzms8MSu1El17SUFkSZWcWHZ7IHI5Y9jf6ePA5IIBK//jFX/7TSJoMs
         Za58Cbu69jOLbFTSAH3gzY4Mu1n5pkfxBaTCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neLiXa2Mi6CDcIfMH5ROa7xzDK4SNK6Agg6TL5Pdv3o=;
        b=B64NOYugpd3mWXjrWAqXdQoytoqB8FyeAzbN+NJ7YOJOnHv+vN0V/FTPPkeJkCEAiO
         G52zzwTAyY3ahh1CLObyf6C0hDCFz6XGUloG1AIPI9OicVHugZ1EulckycmRQWUgMpom
         DWqbAjcXEp1jwSYWUCGkfzlLVsm7D81TDpsDBf7AgiDlvN5vROsC7Eq4DV9gFyAXyBm9
         6D+wt4Gg271Ag4SV9ZX1EeeljkAqwnyvlzxbO4HYwMfVQeD2N+o/s7vhDDFa6j3SgzEC
         BDecgka9G7p4eWYoCyRQKVg0V9knpIdaqoSw2JSu4mQirE1JfE6bi6meO0pyOjLdFvnw
         DygQ==
X-Gm-Message-State: AOAM531Oz1bWjxl8c0Mm7XzocV/2HF6Kq95N0D4c9okspLbeZgDOfqJU
        a2OdCSCCyJVA0xKccdQyyvTLRw==
X-Google-Smtp-Source: ABdhPJyY86L134zDeIC7L+s0ilnz4gVN2MQoMfUvKiVniAtbV8Gs0lxjGIPY6ZiLrM4Hi7NK2/vJqw==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr13899340eds.261.1616752731083;
        Fri, 26 Mar 2021 02:58:51 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:50 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 10/22] media: uvcvideo: Use dev->name for querycap()
Date:   Fri, 26 Mar 2021 10:58:28 +0100
Message-Id: <20210326095840.364424-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
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
2.31.0.291.g576ba9dcdaf-goog

