Return-Path: <linux-media+bounces-22047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE329D8D00
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 20:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 852A7B256A2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3091CD215;
	Mon, 25 Nov 2024 19:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I7tFM6IJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490F71CBE8B
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732564160; cv=none; b=YCnHcSDGPjGglzCVI1spyae4tpNffeLsUMf0shutGG1VfYFVaCYeoSSMpJ+12OL1Ymwlkee6DOh9n6Kuuw2CAH56zaD5yhfjapaGex6gGn6Ltx681RrgbpuDWTRU6q6NSfJ3Jf6ab9iGeE6fFWTEtyX7newXTt5xT40F1FGUrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732564160; c=relaxed/simple;
	bh=vAAOYhnDuCS6QSDtHNvCZ/7V8wyms193hC/CkNF19gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERIGD+N/qdzDGzWhwTcJiEOu/nVXC1bapbQBaHRSJNxxmwcQit+LE7O6/loPWWt+1KdLruWctPCCSk2KRNs6Qlk2NuXjlLDR+qFBbPCp2ciaWc13y1Uc6z/Fag+NJgHRmgAzPpqgioeD6/mnG9KfG6D0oFSRzomJX/CQ7Zhm5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I7tFM6IJ; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4aefcb3242aso861029137.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 11:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732564158; x=1733168958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qew2lSt6MOHSZhwSkHfFr6COKD1ZhgAt7ezEOaoydpo=;
        b=I7tFM6IJ4z1ud9N0cp5ha0k3yRHi0XUjo7ipQ+LJEkd3nMkgkh83zlQHsJf5vRE1wZ
         W0oJA9i+AeZXj4JoqBcQFpUnvVdx5Ks7w1E+B29rhe2naPsasUVv4DyreQnrfhm9NS55
         d6P1xJxlK64LwCDEwQxB+Cya9JVKshX/zeW9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564158; x=1733168958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qew2lSt6MOHSZhwSkHfFr6COKD1ZhgAt7ezEOaoydpo=;
        b=YIgfpQeM0bBsj1wxDeOzg1XOZFLLqAHIl9Ybog8lqFOW8Sn3WNObDYLpQtx6vIIKDP
         HwjMMFitG1I5Y8bvuaLgt3YTmugaPiVUz/vqpFz8b3Rx+NKhtsfNtbbeMqXUV/wzNvET
         Wv7m5S8fsuqmTp8bo2dqUN2en8xf3k0J+m58fW7UPOjqL8u9xXUxjtiPKLrge6mCTrvG
         p3BaVrltC68D8AGTbR4ag5biQXM+YaCNq8pbj6VhiWybiu5x50gEDc4YspOnnv0FtM8H
         FBb9vmWCB+Vm4IMWQm++f5jCAuevuG0u4Wq9F81Dgj9g7g53YZ/mzjX/Pkwfsp+JW4Rg
         u4hA==
X-Forwarded-Encrypted: i=1; AJvYcCVQZovTFA2pMS07dto7bhhb+3o1p2pDNEbC1xVoDKz1gPtcdpMj/Bt0s1WHZjqkSwnMx4PhZEtkOwE+4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZtTniFEUvWM0+nnHu6WzhodcxUKi88hgMoxYpSp46BhzNiVTy
	cvq/gTtTxxItqHv8yrQrzkcBtcshruYrfGTsGTJ2IokYAHu5yPlnClyFBhgkCw==
X-Gm-Gg: ASbGncs/GGrFyAZw7+U7O3peUYW/UaCNrAOYXIanEqVa+Vd+Vy68rn2Py4ompg4+yhX
	vY41SG40ZHUFku3DXrnbx77jTqUxTKF4T/0lhr3gBSdKLP9h95r3uNDCkEvlsolJepo/AGKR2jb
	xh+04UieOVGldCWbJU1yhc+iPvtd5D4bCMQrJ/sv4Z2lkQotF0AIvv9DX+Q3VRZo8bSRhvX+rJl
	Br2i9a7PzkAb6KKEoGvzVxP8zQTeNrPavOVUHA5JCe0YwM/7V3JsADYxgLSFKhYpHWyjGaghX39
	cf7YYRPKOkGh6w1ivGdIaIEa
X-Google-Smtp-Source: AGHT+IEzOfjRUDJXkBH/ci9g+7icIZ8rpZbJ+DF/b16ADeDrCfZI2M6YFtGhhnhW1P+JjUvKqQBQpg==
X-Received: by 2002:a05:6102:3f44:b0:493:de37:b3ef with SMTP id ada2fe7eead31-4addcbe4e47mr15581878137.13.1732564158359;
        Mon, 25 Nov 2024 11:49:18 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af358d2f9asm75324137.23.2024.11.25.11.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:49:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Nov 2024 19:49:09 +0000
Subject: [PATCH v4 4/7] Revert "media: uvcvideo: Allow entity-defined
 get_info and get_cur"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-uvc-subdev-v4-4-51e040599f1a@chromium.org>
References: <20241125-uvc-subdev-v4-0-51e040599f1a@chromium.org>
In-Reply-To: <20241125-uvc-subdev-v4-0-51e040599f1a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

With the privacy gpio now handled as a evdev, there is no more need
for this.

This reverts commit 65900c581d014499f0f8ceabfc02c652e9a88771.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 20 +++++---------------
 drivers/media/usb/uvc/uvcvideo.h |  5 -----
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b98f4778d8aa..90bc2132d8d5 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1087,15 +1087,9 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 		return 0;
 	}
 
-	if (ctrl->entity->get_cur)
-		ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
-					    ctrl->info.selector, data,
-					    ctrl->info.size);
-	else
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				     ctrl->entity->id, chain->dev->intfnum,
-				     ctrl->info.selector, data,
-				     ctrl->info.size);
+	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector, data,
+			     ctrl->info.size);
 
 	if (ret < 0)
 		return ret;
@@ -2055,12 +2049,8 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	if (data == NULL)
 		return -ENOMEM;
 
-	if (ctrl->entity->get_info)
-		ret = ctrl->entity->get_info(dev, ctrl->entity,
-					     ctrl->info.selector, data);
-	else
-		ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
-				     dev->intfnum, info->selector, data, 1);
+	ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
+			     info->selector, data, 1);
 
 	if (!ret) {
 		info->flags &= ~(UVC_CTRL_FLAG_GET_CUR |
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 06c4d514d02c..6002f1c43b69 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -240,11 +240,6 @@ struct uvc_entity {
 	u8 bNrInPins;
 	u8 *baSourceID;
 
-	int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
-			u8 cs, u8 *caps);
-	int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
-		       u8 cs, void *data, u16 size);
-
 	unsigned int ncontrols;
 	struct uvc_control *controls;
 };

-- 
2.47.0.338.g60cca15819-goog


