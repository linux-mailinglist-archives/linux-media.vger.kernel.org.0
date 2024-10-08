Return-Path: <linux-media+bounces-19204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E800199406D
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 10:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942091F2447E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67211FA27D;
	Tue,  8 Oct 2024 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GDxwj+ci"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C41FA255
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728371184; cv=none; b=TQh/6bvZ3cHKolBjs5CKVUluuiuODg4a5rtkYBCxgMkBp67aC1Nc+eH++XJc/qBYqaeRA0krA5k4uXRgTVFYDJOvExGLNNmmxomPePmHIcl8QQCAPbzATuheiNgDv3kGCZemzAYPGOlj1x5kRtP0mJ2NYC0La9Lhc64RIY79s9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728371184; c=relaxed/simple;
	bh=npkZZo7HZp404cjl+XlR7zlTgrfhIHuTn3dDOSGYTbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPeitIVze/ywRSkJupQLxaEBJbkY5i556P+MGtv+TlsHgKN9y3oUHwwIZBI5EZ8wh7vNGCztFGPwADaa5G7qjvINYsarLTererb/Xe3U8yW+y0TlSUyQlF/fCcCAbN9Wrc4yrq2aFy9GQZ3RsEof4czagBNNqxPq41ioPb3ct0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GDxwj+ci; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-45effbc3348so1678651cf.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 00:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728371182; x=1728975982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7J2ZIlNlOvxIZibX4IzDzB3bM7/Wb+XFb3DNRyUIUM=;
        b=GDxwj+ciELk+F50ciYUz5po8c8HD2wm8dmy79+LUjtgQQBdRejLdVtSBoL/i4kC9WP
         3XeeP/u4DQuTclMdrV3N34TyAfAfPdTQhQ3UGggPZV6enJ73/D3Skl79nF5+ycwIdSyT
         DUa9uwhbH6J9k4VTnvVjSI4OBIj3owhmQK2e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728371182; x=1728975982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7J2ZIlNlOvxIZibX4IzDzB3bM7/Wb+XFb3DNRyUIUM=;
        b=lokVYYCiLyxnctEgCmCzrBMAjIibA6MQ2XLlN8xKQgp3AJKxN85CjKFhmo4VJWQ4p3
         PVmPaSCfLCOHZXxnpRJ2siWzHiq0U0ZoC8ZapgvyPOYSHmAt2qVpZZli7tCo3vFcHW+u
         RGLeeIR1CZMNrQChNWIIF08rGH8ResbM1qsJ+GkMoHdIDLHbqkxG9YuiViWmegVaIFIY
         Q3a0kWw+f5cKg3ieDFxkXy/hXJOJZkq1oYaaUuRbDtMZH65rppJ3vsBotSRC6QN0thD3
         zbWJmYHjJBObPkBFcF028nGez9LYg/Jq7LjKbFVxjCDYJkOIS4fpfD1/LQH1Sv0kxFB5
         pfKg==
X-Gm-Message-State: AOJu0YzZx3VLUifAPnv5G2pmbop1gIAbFeJ5ZEOnVvczqRTAuZHcsQEu
	y+QbzRgVbQ0jWBp8q4WkJLqxmZfHvhajQG+FsHChUqhckWPtbdmV+qAZuaanuEJWpYHwjYf/xVc
	=
X-Google-Smtp-Source: AGHT+IECQvqe+eitCmgIDnr0my9kUWAR7/3iHpD0qKi18vFvdGQnrYimF/N6FJPphFRr8SvzBZaE6Q==
X-Received: by 2002:a05:622a:1445:b0:45e:ff0b:8b0b with SMTP id d75a77b69052e-45eff0b8cf3mr8821071cf.35.1728371181735;
        Tue, 08 Oct 2024 00:06:21 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da764043esm33801921cf.88.2024.10.08.00.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:06:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 08 Oct 2024 07:06:15 +0000
Subject: [PATCH 2/3] media: uvcvideo: Refactor uvc_query_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-uvc-readless-v1-2-042ac4581f44@chromium.org>
References: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
In-Reply-To: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Move the query control error logic to its own function.
There is no functional change introduced by this patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 45 ++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 853dfb7b5f7b..a57272a2c9e1 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -67,30 +67,12 @@ static const char *uvc_query_name(u8 query)
 	}
 }
 
-int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
-			u8 intfnum, u8 cs, void *data, u16 size)
+static int uvc_query_ctrl_error(struct uvc_device *dev, u8 intfnum, void *data)
 {
 	int ret;
 	u8 error;
 	u8 tmp;
 
-	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
-				UVC_CTRL_CONTROL_TIMEOUT);
-	if (likely(ret == size))
-		return 0;
-
-	if (ret > 0 && ret < size) {
-		memset(data + ret, 0, size - ret);
-		return 0;
-	}
-
-	if (ret != -EPIPE) {
-		dev_err(&dev->udev->dev,
-			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
-			uvc_query_name(query), cs, unit, ret, size);
-		return ret ? ret : -EPIPE;
-	}
-
 	/* Reuse data[0] to request the error code. */
 	tmp = *(u8 *)data;
 
@@ -135,6 +117,31 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	return -EPIPE;
 }
 
+int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
+		   u8 intfnum, u8 cs, void *data, u16 size)
+{
+	int ret;
+
+	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
+			       UVC_CTRL_CONTROL_TIMEOUT);
+	if (likely(ret == size))
+		return 0;
+
+	if (ret == -EPIPE)
+		return uvc_query_ctrl_error(dev, intfnum, data);
+
+	dev_err(&dev->udev->dev,
+		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
+		uvc_query_name(query), cs, unit, ret, size);
+
+	if (ret > 0 && ret < size) {
+		memset(data + ret, 0, size - ret);
+		return 0;
+	}
+
+	return ret ? ret : -EPIPE;
+}
+
 static const struct usb_device_id elgato_cam_link_4k = {
 	USB_DEVICE(0x0fd9, 0x0066)
 };

-- 
2.47.0.rc0.187.ge670bccf7e-goog


