Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C7833DBD9
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhCPSBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbhCPSAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:00:18 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50273C061756
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:14 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id bf3so22601845edb.6
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uql5w77wLpnV2YOZ1se1wNR76Twqh2llNjdWzvordg8=;
        b=cz1g4tJeNKq5CcfCkKPZiM4VI6PSB2mfgUlu/60S4qm1s+5wSwL6Is7oJ2SUBf/uLZ
         DnxT01IqNNiahMNiiPyI3K51ybwsRmT4TeYlcp9CIhpjIm8se8BR2lQoI+Mw7DNCvFyV
         Ubw1ODrdxtCEagRXcvzVEbTP0TSe8lT7uSHmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uql5w77wLpnV2YOZ1se1wNR76Twqh2llNjdWzvordg8=;
        b=gYcqtWKMtZJLdgQvmpvZydGXptgz+RLdUhBj7PmBM+VVMcC9mNJr9yC0Is0fmUwgrn
         U+qBgXrqkKRC2dz0ytPSbt+ugi5nBV9SZNnJWdEwsSOnssz+eNZJhVZI5Q3J8p3qFS2l
         kRYWXckn8pAXaIBixVbTAi+Bm4LMS5hk3abAa7W/oXi3EWLLTEFdrKN6QSt6UIxKiQJQ
         njfTPcQW813dB1Pk5ih0t3vva387GzSdNs9JvP04sgtoQQoz+ovti2e8rxrMwsEHtflX
         lKHRMPae7gD4pZIZJS2WRF4le0a4SJkpp/G1kZEw9sthPHCMmzIsI+nUGEyFhWd6Uo4f
         A2WA==
X-Gm-Message-State: AOAM531Ovj23QxidXGtM1SIgoWvhyR16Cj/nNp7KcAtb1seprFzmvvrt
        xRjiUw3UnFpP+GWUqkqqz7XuQA==
X-Google-Smtp-Source: ABdhPJyidFqGAtsSRIhb5eeZ2zyKtBnuaJ/1pdfjxhkunYfFNLYn7PsgoQPGWU+GTlxfhqyk3opEGg==
X-Received: by 2002:a50:fa92:: with SMTP id w18mr37217544edr.172.1615917612789;
        Tue, 16 Mar 2021 11:00:12 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id c19sm10953182edu.20.2021.03.16.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:00:12 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 09/13] media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
Date:   Tue, 16 Mar 2021 18:59:59 +0100
Message-Id: <20210316180004.1605727-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316180004.1605727-1-ribalda@chromium.org>
References: <20210316180004.1605727-1-ribalda@chromium.org>
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

