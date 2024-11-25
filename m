Return-Path: <linux-media+bounces-22050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A129D8D02
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 20:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD19028B80A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CE31C2454;
	Mon, 25 Nov 2024 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LonaoS9m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032A51CEEAE
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732564169; cv=none; b=JZUPr3BoYAmnvZPHkTMma1+iPVo7pHMAmZdiGc+9ls9KdoZnpHst1wdSSNfwEZJLHtAx9uoxIWAKcI6GLPi3oG7HM8LVQIVZC9aD/MYZEZK+Cbyp3NV4YQMAg+Ylmnfm+LXE8p58058Y44Mwm5jl+lqmMCWVBCnqqRoOja6JFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732564169; c=relaxed/simple;
	bh=cEG8q7JwIhfvSJZ4SLtfR3SIICXk8+dsAPReT7UVOHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8dDeckrDlekkaq8QzCwVteFe2dswSBU4E1FFmmtihHcDjJHL1RTSLx4R2gg/BKX98dKqtIdYSlsSUZ+ry3k33XT3K1dZJJSvUMaQwXJZClD+f5Pq9SM48bGEiAAG8b/03cwarSsKTReotPSd4qGGJlpbzFgZx7OOqyJ+eqUGn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LonaoS9m; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51533f41c94so354469e0c.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 11:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732564165; x=1733168965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yziQfukfCQ8tCuWUmt6FHkDaKYe54QyufD5J4OTJbE=;
        b=LonaoS9mJNf9HZmb5t/xbnLohI8N62UTwKaPUyhrpk/dIkASY/3bFpS0E8ryTwv//k
         ctDppn/CXRQHs5OE2CABJrREwfS6h8KeDiqINB+0Z0QCRiFSSKniJInAUzGuZwvFTxfy
         YHO6Tv0wlUbT5Pdt7dIbJgQbQtWR4y3h1wBc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564165; x=1733168965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yziQfukfCQ8tCuWUmt6FHkDaKYe54QyufD5J4OTJbE=;
        b=TxdVR6FM54F+NG3F1I1dYALXrtQgwVIEDBrnyMe/dCal48+ANyx50sQV9Pn/tzmwjK
         R7+f6cYVQ9TAfyxYJjQwV3aEGKmghrXyfydVXqDhzomtoo05FjgJUYbrgvI3Vt9ojRGi
         5tua9c8gxm+hDn80ywa3MNlcsJKSlpHVaVRXuKW64xhzUPgRcUqB2umojih+3Tg+8CIH
         2jNkaQ+T7sYdGYTsglGN0Ecc6lIbX4CESuBh9TkVYsM9pzZ708/smHnJjpsxGzodfvJX
         OA/LAZRabpcsa9B5u3KDpc23mlc8C8t0FqiY3nTEyBud3tqca97v0+WIaNjDEhaPyzey
         X6yA==
X-Forwarded-Encrypted: i=1; AJvYcCUALL/vd2iWaffA2d9zfY406rOFMkjRqdrZCkBGB7ZUFC9dSwlcg6hUl+mH6J1UZ9QOdBg+iBdqWKWluA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqk0SWWjXHXuReO+rDjNco5N1VEUF4MDRy0u7jXPUdUm017s7s
	D5e+Vkeu/wtL3QW51F3faSmk1ZOGny6VbhZFbWYTy4WoxmHxA2ipt8GaEAPD7w==
X-Gm-Gg: ASbGncvekcA5IKdAeidGU5zz6AsGDpQwabjk5SME7DAn0dBqXwifGPwwl8gVONSC6ci
	M8kkaX5ndV60kxpeCmgmTZ/2gzbpQz0YLzDuWuabWhqocjQKPYE1TiguaD001RgpXl+rTfezVrL
	Tm4ncCkFmc9a3dSvwYVtlEjRWMVijaHZ2UFuoXyCqwu1yjCcrFFL+f0CdBHgtCxu3x/fbeodPf1
	fCzuFW55P2jN1LJLeehBxH8lJIuNoAiAKj4Q11fZF2VtaqZUaVUWS1EistU4XinsQb9thG0SM+o
	nJUR83pAwtPRW7Wbf5kqamYy
X-Google-Smtp-Source: AGHT+IEgALvAdijAkIcRetk4zuNBzVe1drnMtsw5mI5v64sMgDPBNw61u2gMURnGyFwCjHjpcK36EQ==
X-Received: by 2002:a05:6102:522:b0:4a4:97d1:aea0 with SMTP id ada2fe7eead31-4addcbefa12mr12046094137.11.1732564164881;
        Mon, 25 Nov 2024 11:49:24 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af358d2f9asm75324137.23.2024.11.25.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:49:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Nov 2024 19:49:12 +0000
Subject: [PATCH v4 7/7] media: uvcvideo: Remove UVC_EXT_GPIO entity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-uvc-subdev-v4-7-51e040599f1a@chromium.org>
References: <20241125-uvc-subdev-v4-0-51e040599f1a@chromium.org>
In-Reply-To: <20241125-uvc-subdev-v4-0-51e040599f1a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The only implementation of this entity was the external privacy gpio,
which now does not require to emulate an entity.
Remove all the dead code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ----
 drivers/media/usb/uvc/uvc_entity.c |  1 -
 drivers/media/usb/uvc/uvcvideo.h   | 20 +++++++-------------
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ec07c74a5d26..936225c89182 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -769,7 +769,6 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 }
 
 static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
-static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
 static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
@@ -814,9 +813,6 @@ struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
 	 * is initialized by the caller.
 	 */
 	switch (type) {
-	case UVC_EXT_GPIO_UNIT:
-		memcpy(entity->guid, uvc_gpio_guid, 16);
-		break;
 	case UVC_ITT_CAMERA:
 		memcpy(entity->guid, uvc_camera_guid, 16);
 		break;
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index c1b69f9eaa56..36121b111ed5 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -111,7 +111,6 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_DISPLAY:
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
-		case UVC_EXT_GPIO_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 642449acce1c..5dd9ec1668e6 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -39,9 +39,6 @@
 	(UVC_ENTITY_IS_TERM(entity) && \
 	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
 
-#define UVC_EXT_GPIO_UNIT		0x7ffe
-#define UVC_EXT_GPIO_UNIT_ID		0x100
-
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
@@ -180,8 +177,7 @@ struct uvc_entity {
 
 	/*
 	 * Entities exposed by the UVC device use IDs 0-255, extra entities
-	 * implemented by the driver (such as the GPIO entity) use IDs 256 and
-	 * up.
+	 * implemented by the driver use IDs 256 and up.
 	 */
 	u16 id;
 	u16 type;
@@ -230,13 +226,6 @@ struct uvc_entity {
 			u8  *bmControls;
 			u8  *bmControlsType;
 		} extension;
-
-		struct uvc_gpio {
-			int irq;
-			bool initialized;
-			bool gpio_ready;
-			struct gpio_desc *gpio_privacy;
-		} gpio;
 	};
 
 	u8 bNrInPins;
@@ -596,7 +585,12 @@ struct uvc_device {
 		const void *data;
 	} async_ctrl;
 
-	struct uvc_gpio gpio_unit;
+	struct uvc_gpio {
+		int irq;
+		bool initialized;
+		bool gpio_ready;
+		struct gpio_desc *gpio_privacy;
+	} gpio_unit;
 };
 
 enum uvc_handle_state {

-- 
2.47.0.338.g60cca15819-goog


