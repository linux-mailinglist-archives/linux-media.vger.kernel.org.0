Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7242933F5E7
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 17:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhCQQpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 12:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbhCQQpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 12:45:22 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14CBC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:21 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id jt13so3723437ejb.0
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9aWeCfV8UxlF8kOZZJF1BajdZK+SGKrtPDXzvwvjlk0=;
        b=CarKUWJRLjMtruMjeF0IEiNqqyXLcGquCxnbZconfbwk+VI+4R2TWbTAKLH8d1i4r3
         RIuijYo7HuRH2Tat9bDMo5F+JE1WIqxnPf5FRYkfa8dKvZBfqVzT1ajpHCCobT2FPtVE
         /7qe9Ky3Tufx1kvNaqufoyIFGOQeRBrKVGYMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9aWeCfV8UxlF8kOZZJF1BajdZK+SGKrtPDXzvwvjlk0=;
        b=bT2gxAGi9DGf7qoiTUKFi2y17Zk4Wi53fpjUBvwk8Y57mPuMwdztLJC9gL+bLXNL4j
         WeIdDIavo1VrV04CxBVXmdcvGoh8eRY6bEMF8R18lLF/ER2ZSdsUU/ILLtMDsOwVYok7
         HYlP8HkCLjKULTf5GkOIyzm9sY26TZlSvAirMRfFjjegP4oo3S8ouBvl3Dix93VXJ6D2
         mS1MY27yKwmZngNIjhrA1Am15rc9CuuA3kdT30TFjk8qvNlKSS+XynwNcfhqFGeLHBFa
         qF1J2U3PK5W6j83yuh4kLpGRtQOWbI7UpzDZqlGSC99dYnalAlftagupzTuVFF0K0V0C
         JM7Q==
X-Gm-Message-State: AOAM533hVPisNSHK+GXafzntOYo9TxEnnEJZm5XTHitd1FPEbuEWBOiX
        wCQu/6sp83S5E8g7ZTdjPHcQPw==
X-Google-Smtp-Source: ABdhPJzlkvg8lHS0Wq/Qi5Kr/d+2z7V9eTDJEPi9neHOhgQ2YJReRabHUG/norN+btgZYj+cB8w2kw==
X-Received: by 2002:a17:906:eb89:: with SMTP id mh9mr37073869ejb.122.1615999520732;
        Wed, 17 Mar 2021 09:45:20 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hy25sm12088128ejc.119.2021.03.17.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:45:20 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 11/17] media: uvcvideo: Use dev->name for querycap()
Date:   Wed, 17 Mar 2021 17:45:05 +0100
Message-Id: <20210317164511.39967-12-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210317164511.39967-1-ribalda@chromium.org>
References: <20210317164511.39967-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the device name for the card name instead of vdev->name.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 397217171bbb..dd10cb9361fa 100644
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

