Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE303422EC
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhCSRJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhCSRJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5B8C06175F
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:19 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id bf3so11649633edb.6
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LCfiO2M8eBv1nSfw6SX3LELyYme5LYmWED/jUeSNqLo=;
        b=kjr9tZbznaeFl6HWz/rwMdKT2ISc0FR/LpL3NwSr7swGHdqmzOgwQBIDhqCmmUkLrj
         CmvZIgdbkiaZTgqDGNvmvSn9vCGl8ozcGRbByuLl32hG5boArbav4LXZ7ZKbXdH5NgbG
         P3EzkNDI9IVgf9iNiF1e47aWlV//b1smLgSI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LCfiO2M8eBv1nSfw6SX3LELyYme5LYmWED/jUeSNqLo=;
        b=gFYF/2bjvYQgs81U1w8diueVCuiYAV2EH7zmoCYz6o4FAh4T+mX8s7sHvElQZsM6Lo
         sD61Lx5YgbmfWpLs1XeL3SPq2KEo4Vyt1mdnMV7ouqOcG1Gz0lhooUCFbRfhcoppFXVU
         YF+RRSjEp2SdrvZVtnUpE2sFPGknP4OJWMdXqT/EDGntMWGWN+0lvtdhOkjbA3pe4JZh
         xk2uBYaguBEBaXNfA7jS6woU5fGeaCSvc7nuKgrQhGKIMA2KTe9rLR8t7LxZ01L7lM6O
         2+JkMPNVadpL2DgJC0XqhsdMn+avQUl7M2coJIDI+mK1ESgRpBxZitPJfZvqTIfxpxxu
         LOuw==
X-Gm-Message-State: AOAM533aaR+6cW/wvhXUD7UwrYTcPswOQ49ImNZQq/pybsxscVddOvaj
        u9h52+PMNPlt/sMcEJ60PqtLMQ==
X-Google-Smtp-Source: ABdhPJy1KayEIWB+qOiq33IQWAhlr3+ZFlraJR0i1ckjD+zyzwGLO0K62nuC2V0OHHuNMtAz9ZOZfg==
X-Received: by 2002:aa7:d987:: with SMTP id u7mr10621016eds.326.1616173758425;
        Fri, 19 Mar 2021 10:09:18 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:09:17 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 12/19] media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
Date:   Fri, 19 Mar 2021 18:08:59 +0100
Message-Id: <20210319170906.278238-13-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
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

