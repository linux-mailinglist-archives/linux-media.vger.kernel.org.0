Return-Path: <linux-media+bounces-34157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18847ACF5F3
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 19:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9E0D1720CF
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 17:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F9527FD56;
	Thu,  5 Jun 2025 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V+0C9v+d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F027C84B
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145995; cv=none; b=ERwY24mt7zRGQ0nKrZaTbduPaNiLYBV8uxq+y7tHelJE+oIbUMKer0jKzibZO+Ykrx3iFVZRtlw8wO8yxoM1g7aLxy6Olwta4ZDADhlQ6MLFsl0U8Cq+VL6WHTH+gLlrwMUaySlHOpC7dbqqvU3Ktr3TaCx1E2I3iBwmrO7uhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145995; c=relaxed/simple;
	bh=R4NuKjk4LUn+NcJI1dWp1KbkF6gjPs2+DtnjDwx4z/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hiVlqEWzmfUsdABi4uypzBosWFzayBMybQpDay0BoMGitkMrsysxQwKHCSdUun9j0W75kxdwJ4uofL9nxbcG1e1ltvwBnml0+1kjdiRdhw+x7IcxdVGedCWDGvyGq8L+N068AElZRMGmu3epwaHrUgo6c6z9eQax/LqeG8220KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V+0C9v+d; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5535e35b059so1205517e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145988; x=1749750788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKykJ86GJEjKAZ51EtUiBvhJS0VRnpbfEH3e5dzBR4w=;
        b=V+0C9v+d+sPzo+NIIu+xX4SgvhbNXZT1rIU/lO+otk7ArMDYMkCKVfP/HyVr7Gv7g2
         XgyTjdgtyNzyK8o98HyCCx7QsCFysvih4WgTvrcoVgdg2gXBC6HxPmrIL7x35V4oByyB
         Zw5erXMKN13T3/kcFHyctTALxIvFQWaJtsGdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145988; x=1749750788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKykJ86GJEjKAZ51EtUiBvhJS0VRnpbfEH3e5dzBR4w=;
        b=ggFACiC4DSmL6d7613WIHTuY8tJCbWUHghnKPHc3Nna9DUrHRD7HTB9nsq1pKkLpv8
         FblC9Sq7PLGsQIJCIrjy214woHoVNN0aOLEHOsj6BUcXqkV9A2HJwagurYD4ZWwsjizz
         z19of8urwvwlJvUxpwb/j8/TI1vBrCfnYyoKShpi9tKoLp//BRcXUII70kEVyl3Y0QaT
         mOgAc5yFHp8V0bsOF4zVby9wkbX6mXQRbP1F8vLBv5aAqY+CU1ppZsnJDw5cd23weq1K
         C4pkuVnsQUFL2WlG6RbIAulXzT8nREnofWpb97bpCFNxFGx2Pbo/MzIYI/p8xNIyGKbh
         8U6g==
X-Gm-Message-State: AOJu0Yw2vVLZeWP8YEGU6RtP1HERf1/PFrxD2a4p3Y1+2WpdttZycSi2
	Nq/9kB1oxNMqzgXFUpucg71XQEMJYaNN8ziooXs67nPkUu542dzU+8uCXbgecHZIiQ==
X-Gm-Gg: ASbGncvKY77UW7Rl5cn354L2Y8vUkAxPveh2yd1Vu+14j9Wgs/Guuxs/2E1UspO3TS9
	s8MoXuWYuwaCDKfoUJjhxfNc/RMwRcvOKq5SL6vxkLX255M/3CfTc8xlEeAh2yW+Lk+JlOz1mby
	1eZzUoHTAHEY4YJf4HakH6XswU72sjf+UAHsMTydCTCZiQMjJK35l+aj1AUMr24NoDQT0hAEtxg
	TxlTmpuJUfAqRkfKXq/NtQjrdVlCGDYG7RwiPKsU+6KIKXPTny5eEhC9CVCx1ZcvzN+mjDZRK0G
	345LXxJ1WJRaP9aNowaZ9d0erWCCdK6WGeEpg4w35VLCVhOEK9gP6BUkaDOzA92K9/FFW283B7K
	e9fKWWxeNGNi71xToLkYdzb/Ieg==
X-Google-Smtp-Source: AGHT+IHp+xpg2FO63nkT7Lh5wy4seP/EyKn6xsYU+/2Jg59TJvy9YvZlmgC6AlIASMeTxBqC41J75A==
X-Received: by 2002:a05:6512:239d:b0:553:35bb:f7ba with SMTP id 2adb3069b0e04-55366bf08b7mr21355e87.11.1749145988208;
        Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:03 +0000
Subject: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to
 uvc_entity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Virtual entities need to provide more values than get_cur and get_cur
for their controls. Add support for get_def, get_min, get_max and
get_res.

This is a preparation patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
 drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
 	if (query == UVC_GET_CUR && ctrl->entity->get_cur)
 		return ctrl->entity->get_cur(dev, ctrl->entity,
 					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_DEF && ctrl->entity->get_def)
+		return ctrl->entity->get_def(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_MIN && ctrl->entity->get_min)
+		return ctrl->entity->get_min(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_MAX && ctrl->entity->get_max)
+		return ctrl->entity->get_max(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_RES && ctrl->entity->get_res)
+		return ctrl->entity->get_res(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
 	if (query == UVC_GET_INFO && ctrl->entity->get_info)
 		return ctrl->entity->get_info(dev, ctrl->entity,
 					      ctrl->info.selector, data);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -261,6 +261,14 @@ struct uvc_entity {
 			u8 cs, u8 *caps);
 	int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
 		       u8 cs, void *data, u16 size);
+	int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
 
 	unsigned int ncontrols;
 	struct uvc_control *controls;

-- 
2.50.0.rc0.642.g800a2b2222-goog


