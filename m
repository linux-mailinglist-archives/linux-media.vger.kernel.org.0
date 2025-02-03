Return-Path: <linux-media+bounces-25565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D09A258B2
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274163A39A6
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91462046BB;
	Mon,  3 Feb 2025 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hGgf67z1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD902045BD
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583753; cv=none; b=YqEw9pkBHqbigE9mPOus7qZdWLe3xN42ktTeFobHP8wFZEF9IiFFYaxLWAkVoXD7oUxJdIDoBPJR0x5LUBlubqshjFARDWx6CqKhL4RDP0W8aOGYv4i7rZO3ctOLY4hJ4uXOesiILEkYfK4hEjKRt0T+8EjJHv0+SgwPltlW1iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583753; c=relaxed/simple;
	bh=Ildx3KkSONLWLTB6UMs2mXOT6GNaL5EUqHnIiYn9Ecc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQGYj7khi8FtbmKuyZOQ7Fx6jWtaS0JykqYjAdqxuqnvE4ta/3c8ayMHxidCliTddEVqVqxGhaQcs/K7zeNInUPO6iiMw7K+ivaRj2XVmCJH/IYpZOPvYdhf4jDutY9VrUq0vWrFodzqjkp+cZHGALigqrb9oAzfc6iw09Mu/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hGgf67z1; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afdf8520c2so1323626137.2
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583750; x=1739188550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ptj+WXBBaeCFw/qOAiMyPpprCB8Gn1wdtebwngGkHqk=;
        b=hGgf67z1tcImMkj6CNvJqm2i34EAJR/icrFPaowSZW9B4W+Y+NtH/xKlit4P4G4IQI
         2PBpDoZOzhKgCxxEVGkLzmKDSp68pNPsFTv6zt4AMq30lGAbLI7AEAiv1iZriq2E16R+
         NJ1fDfylhG5csweIAp+t/ixlcU6wgTgVpRSMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583750; x=1739188550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ptj+WXBBaeCFw/qOAiMyPpprCB8Gn1wdtebwngGkHqk=;
        b=NOSmJOEXyooLc8pa0/L0egaJJiDTT8qXZpLaD8VPcE+i5x7/pEd5gH2wiNx85kcizP
         CY8SucS4IXzEKo7HVo4KcdmnKaj5WgSbQQkccuMX/T9WKn2JrMWkSqXtFfk6NtokV6Bl
         5KUw8U8IGOJ4aLq1svUEGXOaPz3+V/fhJHP97BMLSmAfzXIhccpUf9oEaHV+yt0+OHRA
         DSKwyVV7TOQywgBKLwnOoPe5gP3BQhRYi+v2BK2cVLnPkNEs+SUmyIY24RHbE0sEuTa6
         dAu8FMa3kDywZFyUs+HQOIC1KV4rqoBFk+PCkTRxYdsCOZ/gWKhA6PejKJavrdg9EW0Y
         fhiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeeAGjy3gYooh6tMs3/BhWspulNHNzzj+89GKIdQXRZ5bhjY107xSVk14IcTLPyDxK3Rm8F/ePweiGuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNopSdu5ezdIlJVqpkN461o78yenMVj1NpddG0B3x6UV9Ept7m
	LuwYAaGCNueX+sMPilqK/QIAHbwSoT3llnT3Hj8EcRzzcKoGfl/DBjChASHNNQ==
X-Gm-Gg: ASbGncvPqfiLhQ3VnJkUb8QmSbFatEH1y9TDGlDr9A8Ah9wupjSMPchlWAFNzUkFIji
	ANBJaOtUZ9o7b0WbN5oNtt09Q0mNikhERWhpkK4vfB7hRQ1D35I9DeMffrOrN4/0QCtTPtMB3o/
	aYLZmqVh6nG9uj1GHKxwxSETem45xTIjCgdzV/YalimTUnwKHkjc5RSdN58hNlyzM4koWsIE7QJ
	PnNoXC4dvWBQVCLxD9HRyR6ipIUju6VRmlk8vPSYEgmHz+ESlzyRmAtP20MUJn4tzi5oL8VDZFN
	U/U3JTJhxJRejdSwqAxl51bSc2kEEYxT1fAObIC/QHjNlLcqXAPLz0JNTFhyfkIhQw==
X-Google-Smtp-Source: AGHT+IE0oR19UI2fh0jS+KCqQj/7FevOYUabIUBz5ZuDo6iKNX0yQhxcUpph4fxitp3pua3X6v/6wg==
X-Received: by 2002:a05:6102:5e8b:b0:4af:f740:c1b8 with SMTP id ada2fe7eead31-4b9a5270cf3mr17240868137.24.1738583750154;
        Mon, 03 Feb 2025 03:55:50 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:55:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:40 +0000
Subject: [PATCH v17 04/17] media: uvcvideo: Handle uvc menu translation
 inside uvc_get_le_value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-4-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

map->get() gets a value from an uvc_control in "UVC format" and converts
it to a value that can be consumed by v4l2.

Instead of using a special get function for V4L2_CTRL_TYPE_MENU, we
were converting from uvc_get_le_value in two different places.

Move the conversion to uvc_get_le_value().

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 77 +++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..4a55cf78ec52 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -862,6 +862,25 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 	data[bit >> 3] &= ~(1 << (bit & 7));
 }
 
+static s32 uvc_menu_to_v4l2_menu(struct uvc_control_mapping *mapping, s32 val)
+{
+	unsigned int i;
+
+	for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
+		u32 menu_value;
+
+		if (!test_bit(i, &mapping->menu_mask))
+			continue;
+
+		menu_value = uvc_mapping_get_menu_value(mapping, i);
+
+		if (menu_value == val)
+			return i;
+	}
+
+	return val;
+}
+
 /*
  * Extract the bit string specified by mapping->offset and mapping->size
  * from the little-endian data stored at 'data' and return the result as
@@ -896,6 +915,16 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
 		value |= -(value & (1 << (mapping->size - 1)));
 
+	/* If it is a menu, convert from uvc to v4l2. */
+	if (mapping->v4l2_type != V4L2_CTRL_TYPE_MENU)
+		return value;
+
+	switch (query) {
+	case UVC_GET_CUR:
+	case UVC_GET_DEF:
+		return uvc_menu_to_v4l2_menu(mapping, value);
+	}
+
 	return value;
 }
 
@@ -1060,32 +1089,6 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
 	return 0;
 }
 
-static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
-				const u8 *data)
-{
-	s32 value = mapping->get(mapping, UVC_GET_CUR, data);
-
-	if (mapping->v4l2_type == V4L2_CTRL_TYPE_MENU) {
-		unsigned int i;
-
-		for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
-			u32 menu_value;
-
-			if (!test_bit(i, &mapping->menu_mask))
-				continue;
-
-			menu_value = uvc_mapping_get_menu_value(mapping, i);
-
-			if (menu_value == value) {
-				value = i;
-				break;
-			}
-		}
-	}
-
-	return value;
-}
-
 static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 			       struct uvc_control *ctrl)
 {
@@ -1136,8 +1139,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ret < 0)
 		return ret;
 
-	*value = __uvc_ctrl_get_value(mapping,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	*value = mapping->get(mapping, UVC_GET_CUR,
+			      uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	return 0;
 }
@@ -1287,7 +1290,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 {
 	struct uvc_control_mapping *master_map = NULL;
 	struct uvc_control *master_ctrl = NULL;
-	unsigned int i;
 
 	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
 	v4l2_ctrl->id = mapping->id;
@@ -1330,21 +1332,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->minimum = ffs(mapping->menu_mask) - 1;
 		v4l2_ctrl->maximum = fls(mapping->menu_mask) - 1;
 		v4l2_ctrl->step = 1;
-
-		for (i = 0; BIT(i) <= mapping->menu_mask; ++i) {
-			u32 menu_value;
-
-			if (!test_bit(i, &mapping->menu_mask))
-				continue;
-
-			menu_value = uvc_mapping_get_menu_value(mapping, i);
-
-			if (menu_value == v4l2_ctrl->default_value) {
-				v4l2_ctrl->default_value = i;
-				break;
-			}
-		}
-
 		return 0;
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
@@ -1630,7 +1617,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 		uvc_ctrl_set_handle(handle, ctrl, NULL);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
-		s32 value = __uvc_ctrl_get_value(mapping, data);
+		s32 value = mapping->get(mapping, UVC_GET_CUR, data);
 
 		/*
 		 * handle may be NULL here if the device sends auto-update

-- 
2.48.1.362.g079036d154-goog


