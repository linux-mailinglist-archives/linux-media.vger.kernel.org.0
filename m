Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1CA340F27
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbhCRUaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbhCRU3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:37 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFBAC061760
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o19so8301687edc.3
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LCfiO2M8eBv1nSfw6SX3LELyYme5LYmWED/jUeSNqLo=;
        b=aOIHn6w8I7Ce+5Zit+a6016P4K1j5BkH/IPWiDjGhBYNmy/sOAYVgqc4ppQxKjtgac
         dWBpYndGA7o8jC5sNw47W382yb1vINxptENpQpqvHq+bozYexflcqZ6lLy+4htl46fEZ
         TAukQQYZdjieafGPqZ01cg8dahNmfda1nIarA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LCfiO2M8eBv1nSfw6SX3LELyYme5LYmWED/jUeSNqLo=;
        b=tjN0lYInXFt41ybfTUhsIS9484FNZpapPu5vS+INTdCsioV02XB+CritpLh66jRyhl
         PgtUgHNzUTVgRo7BwEKXvVuydsyqnjiNcvt604NpuPVgoHmRXi9juaZqDtMAujiurbSB
         Pp3t/yyeMgvFoeIan+6Ght39DYvMm5QcS/lGKIZ3sPqIpPGi70we1EaxxgMrNXHYJLaH
         5dzd6/apLf5NXwTIDvLgY8IFbdwkfpsXBQ48lcOYMBcWQohXlYcFg7H7SLpDx4xPuyXj
         4d36c9MDB7YtqQOTkH3nMciF3enx8R38sS3lDLy0XeD2WJwfF34m/EvNuw8HzSZXPPbF
         BwSQ==
X-Gm-Message-State: AOAM532ThyUEE9lAduBSbxUmOdj1ojJzakybaDnLMA3g7jrrJ++WGhP9
        8UjeyckQhDiLZHaHdnq+QOjZ0A==
X-Google-Smtp-Source: ABdhPJxXKL5mZjzeYZPocRLQKw01z2Ci7qSpmItvB8c5D+r1H12CJTZKpHfwvMT+vJu4tBSlyFFUFQ==
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr6066463edp.41.1616099376253;
        Thu, 18 Mar 2021 13:29:36 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:36 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 10/17] media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
Date:   Thu, 18 Mar 2021 21:29:21 +0100
Message-Id: <20210318202928.166955-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans has discovered that in his test device, for the H264 format
bytesused goes up to about 570, for YUYV it will actually go up
to a bit over 5000 bytes, and for MJPG up to about 2706 bytes.

We should also, according to V4L2_META_FMT_UVC docs, drop headers when
the buffer is full.

Credit-to: Hans Verkuil <hverkuil@xs4all.nl>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 8 +++++---
 drivers/media/usb/uvc/uvcvideo.h  | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 25fd8aa23529..ea2903dc3252 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1244,11 +1244,13 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (!meta_buf || length == 2)
 		return;
 
+	/*
+	 * According to V4L2_META_FMT_UVC docs, we should drop headers when
+	 * the buffer is full.
+	 */
 	if (meta_buf->length - meta_buf->bytesused <
-	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
-		meta_buf->error = 1;
+	    length + sizeof(meta->ns) + sizeof(meta->sof))
 		return;
-	}
 
 	has_pts = mem[1] & UVC_STREAM_PTS;
 	has_scr = mem[1] & UVC_STREAM_SCR;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b81d3f65e52e..a26bbec8d37b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -527,7 +527,7 @@ struct uvc_stats_stream {
 	unsigned int max_sof;		/* Maximum STC.SOF value */
 };
 
-#define UVC_METADATA_BUF_SIZE 1024
+#define UVC_METADATA_BUF_SIZE 10240
 
 /**
  * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
-- 
2.31.0.rc2.261.g7f71774620-goog

