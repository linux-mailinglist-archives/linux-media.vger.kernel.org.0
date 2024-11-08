Return-Path: <linux-media+bounces-21199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29F9C2680
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 21:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3655F1F22FD7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 20:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D729D1F666F;
	Fri,  8 Nov 2024 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F1KQArwS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC171F26C1
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 20:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097556; cv=none; b=r0uge4UzjbZx4WSs+m1K5grHuQumYdHUbjU9EzY/pxgKVfyFC1B+icXJ24T5Tt+q16diZEtZ8OspLdut23DCxhXQshnehqSYG20vyL6FDHSlPdn440SaM/XPCvkLkEUpfcoGZ2GQxdDcQy9B1nPA5B9VkJBx60917CEziYopKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097556; c=relaxed/simple;
	bh=wJ4SvwiZLr0JP4Er3WjpeseQ8Gxn6OdzVEJCX2ygyPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2yQmYTaQN+9mGa/EW0YB07jeUCNuehZ2KlSti8BH98/QGxFREokGXSimIuY130LCST0RPPaQKySqf80DafYNmuSIfurBMRox/qmyZqp0tWJd5Eo+5UCOYb3OD+buAvRxlwEMGzemARh89heLkc+O4MqplrUqTS/qzp2eIN6ZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F1KQArwS; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-460c0f9c13eso23396981cf.0
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 12:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731097553; x=1731702353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4ryCzSSqUh6W4Bx23m71ZTRER6+5bh5JI0THw5U6f0=;
        b=F1KQArwSfaVUXVhZEZnMoeyAY6FWt6c2NPbAUuHkFFJ9UG3cbyv+Sq7YeEPoyoYJyL
         9aWK53/jdfmKcs5L970gLE3Jnbinxqs9vMxWoPz4SVsSF5XFWM6+/EH2LIE6u/6BSAvg
         HWk/FWSFnfw2PIVmbWT3/URDd4tZLf4WfViLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097553; x=1731702353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4ryCzSSqUh6W4Bx23m71ZTRER6+5bh5JI0THw5U6f0=;
        b=u125ymVLw7+ljWvZBYTFWR8VOarxDYxLBZMMingWPlYGkzGyTleON1nsMWkhemHg60
         nRe74Yxhm+IhubD1SO+SO0REYHvA3f09lhUwbdlno8DTQf2mZMQy0JefkP0baSPReUMQ
         lGjUUXrdhC64wwvnODz4R8/dbqZBWxhg97h06vDbYh/R7v97Vqv5t6Z1pDij0DNoyOI8
         fc/H0P+VZO96XdxgOdWpfX/iumOkrbYtq+NUeSPPZ+uHoH0GQoFi/LAacyT6aaY0Mt3d
         V/L/BUtbDeZSadeT+sJCall4qcQauIo9bwwlAIAu8l6v45nvqXhyaW9lVkrXb8yDauUB
         5wiw==
X-Forwarded-Encrypted: i=1; AJvYcCW7YdNgX4AZGOruDdeJ6UA4dBhlHjbqjWiDK31LCIa75AvoeuFH86wZyGJjzbCCNqn5kLPeuxUZS1KfSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTgZIIs54xIPler7hkuk2J/6H1ShKlZR6PRXaeoaIfP+hMbc+
	W7oy5BC6PN3/3Vm7hvUyCETQX4JlKqzgmcBJy1m5NkDHVeFulUThKft+Cp6GHg==
X-Google-Smtp-Source: AGHT+IFixwVIvN4lcC0mBS5tbL30BusGxQLhgQLUnjLVIHxthBgA/ZZCylmDmjUXtm7iFY7s12f0uw==
X-Received: by 2002:a05:622a:2594:b0:45d:7416:1636 with SMTP id d75a77b69052e-463085b7e3emr87548681cf.2.1731097553392;
        Fri, 08 Nov 2024 12:25:53 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d440sm24207341cf.52.2024.11.08.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:52 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 08 Nov 2024 20:25:47 +0000
Subject: [PATCH v2 3/6] Revert "media: uvcvideo: Allow entity-defined
 get_info and get_cur"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-uvc-subdev-v2-3-85d8a051a3d3@chromium.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
In-Reply-To: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

With the privacy gpio now handled as a subdevice, there is no more need
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
index 4a06db329aa9..1eeef2c12fbe 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -244,11 +244,6 @@ struct uvc_entity {
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
2.47.0.277.g8800431eea-goog


