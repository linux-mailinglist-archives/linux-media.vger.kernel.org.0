Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4035D33C467
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhCORgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235971AbhCORgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:17 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F93C06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id ci14so67521230ejc.7
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=soZrX7bZGsiX5k9H3diOg1AsKg7GoSGDwOafVa3bJcc=;
        b=hwmJINQF7BWP64sbdUotGVEehJ3UEFxD6qJgj/lsR+fUa6zttiqQjRIXop01F38E5w
         /QhVdjEE8c/n5l0/rSHESvPKMj1ZkPogErGYzNecsIx8kNMPFjvND4W6ZwTZzZkXssA9
         y6fSs78tXd5FbqzxSs3aUpAZSCkN0fXjJJRAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=soZrX7bZGsiX5k9H3diOg1AsKg7GoSGDwOafVa3bJcc=;
        b=Y4zz3pPX4Z4iX3BURdALTXmA25wnrWVf3+47eONO8WrC7H0Oz1+1VR51DIQTECAtSg
         FS0AJVh3Dm9P81x4OhX1LsduIIB3sYxGATYRpeHFMg+8RJ1Co5Qrj9XgAsiJhqiiK9Bx
         jaDgs8pCkaUFVPBJ5DuOKI2NvTvsjnSUDKXaQf9QCq/smvebGUwa4YlHKul7E4aP9O14
         NVVM6lS3vWvwIY5ycnLTSUIpotFR/9E73ybz+XFr5Gg41s2wUwss5HiHwTf3os8A838P
         b7qIxyoekg1OLKCs1jRFms7iUxzq9QRRYaw2XUlmNza/ym1H8plil0s5m1WmgC3US3XF
         xSqA==
X-Gm-Message-State: AOAM5319wkGpffF2UF2a5NJzxd7uu7gCSyyvVyU+hqSdm0Z6vDpKG4qG
        3k1/S51xTuLeWdpd+Uxuw5BZXQ==
X-Google-Smtp-Source: ABdhPJxCh52nkgCVDHtDPbJLaRJrEli0yWNDksq5LHcrE+89cBJRk/HvM9pDZTNZm9AdxeSj2P6Xvg==
X-Received: by 2002:a17:906:2404:: with SMTP id z4mr24600130eja.14.1615829775599;
        Mon, 15 Mar 2021 10:36:15 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:15 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 07/11] media: uvcvideo: Use dev->name for querycap()
Date:   Mon, 15 Mar 2021 18:36:05 +0100
Message-Id: <20210315173609.1547857-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315173609.1547857-1-ribalda@chromium.org>
References: <20210315173609.1547857-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the device name for the card name instead of cap->card.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 36eb48622d48..6c1b037a751b 100644
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

