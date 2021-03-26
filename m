Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F14A34A52C
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhCZJ7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhCZJ7A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:59:00 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BDEC0613B2
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:59 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id j3so5580268edp.11
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AsfUq8egj8BlQuh51pL/zTHndFh4URF1DvrGOxKo66o=;
        b=DAealO1uTP/4I6yw97+XqRu5ow7AcB7wdKoKXHCWIbaXmdr5U81We2MB575RVVtWMn
         H8DbmtWRhu9jf3UgAWSNeYdzR0rGHkT9UENIIEzOWU9P4rkHRM+ahXnEyIpg9jYrzlpc
         NBEUW9hdLBUhWidc43SlfjTGgLBxuOw534zNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AsfUq8egj8BlQuh51pL/zTHndFh4URF1DvrGOxKo66o=;
        b=BnLBLyfNRM3wooUmGHUB+Oo76LmJtYktYC2YTw0wSRWKoTzMGhA9TRGQl/wrBKDMFJ
         KIqTM8uZJ50JTbkV0i6JznFYey/3YlWo1EN8WMzquPJpxQ2B/xZGL9dfl8L0IG+j6KBE
         AuC2EG2DLvHRa/AEDcZLsMh6BMUhB4n4Tc9LW0KqQxm/3TvppWpCLAijZWQYO5l7ToaP
         aE9FSW+4NMGnSNTYrmEEfUOeHU56rNw/BgIZkuzBENoiVNA2W6QrEdxuRLj1/jE4daLg
         sVwan3UvALlgyoj4+JsYQqc5h49ta0uigyQK0KdA8Xber3YuYNihDvvL36SQah8yCgCW
         xkeQ==
X-Gm-Message-State: AOAM533Biljyd6Kq0+5eQ6L6GdnXvPML0bZezNP+8eLqbL85UR0IV3A0
        owpyG4sbWzPYVEe1QkBcaVvzEQ==
X-Google-Smtp-Source: ABdhPJw68cNvp2+qKDXKIUvnE5QBmHlpxA5HVxeMR/ep6ivHhqV1cbQHnf921Rlks8a68z5lIMIifw==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr13899760eds.261.1616752738701;
        Fri, 26 Mar 2021 02:58:58 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:58 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v9 20/22] uvcvideo: improve error handling in uvc_query_ctrl()
Date:   Fri, 26 Mar 2021 10:58:38 +0100
Message-Id: <20210326095840.364424-21-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

- If __uvc_query_ctrl() failed with a non-EPIPE error, then
  report that with dev_err. If an error code is obtained, then
  report that with dev_dbg.

- For error 2 (Wrong state) return -EACCES instead of -EILSEQ.
  EACCES is a much more appropriate error code. EILSEQ will return
  "Invalid or incomplete multibyte or wide character." in strerror(),
  which is a *very* confusing message.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---

I have changed a bit the patch from the original version.

drivers/media/usb/uvc/uvc_video.c | 38 +++++++++++++++++--------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index b63c073ec30e..1c3a94d91724 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -76,35 +76,31 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	if (likely(ret == size))
 		return 0;
 
-	dev_dbg(&dev->udev->dev,
-		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
-		uvc_query_name(query), cs, unit, ret, size);
-
-	if (ret != -EPIPE)
-		return ret;
+	if (ret < 0 && ret != -EPIPE)
+		goto err;
 
+	// reuse data[0] for request the error code.
 	tmp = *(u8 *)data;
-
 	ret = __uvc_query_ctrl(dev, UVC_GET_CUR, 0, intfnum,
 			       UVC_VC_REQUEST_ERROR_CODE_CONTROL, data, 1,
 			       UVC_CTRL_CONTROL_TIMEOUT);
-
 	error = *(u8 *)data;
 	*(u8 *)data = tmp;
 
-	if (ret != 1)
-		return ret < 0 ? ret : -EPIPE;
+	if (ret != 1) {
+		ret = ret < 0 ? ret : -EPIPE;
+		goto err;
+	}
 
-	uvc_dbg(dev, CONTROL, "Control error %u\n", error);
+	dev_dbg(&dev->udev->dev,
+		"Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
+		uvc_query_name(query), cs, unit, error);
 
 	switch (error) {
-	case 0:
-		/* Cannot happen - we received a STALL */
-		return -EPIPE;
 	case 1: /* Not ready */
 		return -EBUSY;
 	case 2: /* Wrong state */
-		return -EILSEQ;
+		return -EACCES;
 	case 3: /* Power */
 		return -EREMOTE;
 	case 4: /* Out of range */
@@ -120,10 +116,18 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	case 8: /* Invalid value within range */
 		return -EINVAL;
 	default: /* reserved or unknown */
-		break;
+		dev_err(&dev->udev->dev,
+			"Failed to query (%s) UVC control %u on unit %u: got error %u.\n",
+			uvc_query_name(query), cs, unit, error);
+		return -EPIPE;
 	}
 
-	return -EPIPE;
+err:
+	dev_err(&dev->udev->dev,
+		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
+		uvc_query_name(query), cs, unit, ret, size);
+
+	return ret;
 }
 
 static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
-- 
2.31.0.291.g576ba9dcdaf-goog

