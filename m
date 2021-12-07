Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DF746AF3D
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 01:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378520AbhLGAmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 19:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378481AbhLGAmN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 19:42:13 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E8FC061746
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 16:38:43 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id e3so50203484edu.4
        for <linux-media@vger.kernel.org>; Mon, 06 Dec 2021 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HW2THPIGQU7U7w3HiaVAhz55D3C1VtaWNt3sB9bzjBM=;
        b=VjISuCkRmkEwkw0aCS1nal12zxgwzdL/qVV7/oy2LMN5us+IIRXeJ0MtBPY6A0K8Aw
         7fWVRaG9P8Hj8xp5O5Z/23Cb+t+l20BBXq/yTsvUVnvvF8NLN1mi5BosriyM1F5Lg3Dt
         OWs7Ga5gOpgjQA3pxqD7RMpODEV4/xjyUKGcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HW2THPIGQU7U7w3HiaVAhz55D3C1VtaWNt3sB9bzjBM=;
        b=cmuAMbsK35ozFq3GDdAbF8R82Ss8jebQkp2RSNEdIGKyvVylHTUVEOVqn1HjTkZzmZ
         oS0aQTXY7Y88q3dNFrCpqKbGzdpPoHJSbbyVj66uNRCN11GWWpOjXKMBxKsM1e/ZO9N/
         RBUvbyUv8dmnXA9zEVFYlYNxTRA/srYSS6clqkGpDCIUkKhOzrXayGWjtMd7u9i3Dj95
         LXtrla8RqxAT05RnNATkAzAcH0SBUw5xFNKpkJ4dgJxvwQWe/EhZzGQas9tXikQV6ols
         zpzc+4veTsmMEDRlt24U3EQXdlWdWs8iDh+TZat9uJG0+afFgpFW0aUKtySEI9NWDfm+
         v4mg==
X-Gm-Message-State: AOAM533QKLrqdKjR9gNrYQFbxv/jatw0U8bj7LFVjKMK6uue38sr5+Tv
        nB0EVtEgJpDF+AK7opbreI88QmGFwMTCQxvo
X-Google-Smtp-Source: ABdhPJyq2gqJBj1sAf+6WXUmHXxg2S2oQ7eiYZl+6T0NnMOfBdTQ5l8aMhxHziByasPlso/1QbjJnA==
X-Received: by 2002:a17:906:1697:: with SMTP id s23mr50370251ejd.60.1638837522481;
        Mon, 06 Dec 2021 16:38:42 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hg19sm7422531ejc.1.2021.12.06.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 16:38:42 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH v2 1/4] Revert "media: uvcvideo: Set unique vdev name based in type"
Date:   Tue,  7 Dec 2021 01:38:37 +0100
Message-Id: <20211207003840.1212374-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211207003840.1212374-1-ribalda@chromium.org>
References: <20211207003840.1212374-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A lot of userspace depends on a descriptive name for vdev. Without this
patch, users have a hard time figuring out which camera shall they use
for their video conferencing.

This reverts commit e3f60e7e1a2b451f538f9926763432249bcf39c4.

Cc: <stable@vger.kernel.org>
Fixes: e3f60e7e1a2b ("media: uvcvideo: Set unique vdev name based in type")
Reported-by: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7c007426e082..058d28a0344b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2193,7 +2193,6 @@ int uvc_register_video_device(struct uvc_device *dev,
 			      const struct v4l2_file_operations *fops,
 			      const struct v4l2_ioctl_ops *ioctl_ops)
 {
-	const char *name;
 	int ret;
 
 	/* Initialize the video buffers queue. */
@@ -2222,20 +2221,16 @@ int uvc_register_video_device(struct uvc_device *dev,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	default:
 		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-		name = "Video Capture";
 		break;
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
-		name = "Video Output";
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
-		name = "Metadata";
 		break;
 	}
 
-	snprintf(vdev->name, sizeof(vdev->name), "%s %u", name,
-		 stream->header.bTerminalLink);
+	strscpy(vdev->name, dev->name, sizeof(vdev->name));
 
 	/*
 	 * Set the driver data before calling video_register_device, otherwise
-- 
2.34.1.400.ga245620fadb-goog

