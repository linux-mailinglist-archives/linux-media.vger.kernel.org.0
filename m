Return-Path: <linux-media+bounces-34156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F1ACF5ED
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 19:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 816327A726F
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 17:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D9927FB37;
	Thu,  5 Jun 2025 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oywg+k5E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A960727C179
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145995; cv=none; b=efZER6PSpT32wVnjraKmUY4oYOSZO81a2Gw6QhxvWtd1Wh5W2rmg13qxeGmGPnpPGRoMGFMNTDQJpadRDkN3G53BEYjN9lL+8Y03nEeN7T9NDrU3P6puqt2DLB4ge3Bg+kWRdjL3DqBgxnw9GWBF9zoRkmw4T5A7ZuRNIPqYmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145995; c=relaxed/simple;
	bh=7MKTDlXdmTzEBoZknQKsTqh+wgws17pHYpyBR/S4V4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwemnYz0wqJScB6SHrDwRqmq0KM2OSRUYWJMes8rRq3aWXnUh2q9wDn1hnO1ZKBUep04ICKQv+kQWcbk0CXirgDbLCkG0vLcbNxTFcrCzQ5gGJ++ViNooEWc6RaiK/6w5eFDdLcYFhMTJbmAqWYWY5GcbvG15u4bioGtUy2zxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oywg+k5E; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1511265e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145989; x=1749750789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl8ssGy20WIwQ9oJ9UugxpfMo+m1ppVl8PDiVTX1sSc=;
        b=Oywg+k5EBVEHy3LHmGFUNavNA7GwdFWc1vz6M5mpc/7YMcA0QBSVYfrhbclqESCxur
         J9IfISe7u56op8zhaCm0PCXm74qTf5+i1Htx3Fq+OkNAm2lfRqc3bb+4LfIrj+sR71pZ
         rRkgSmbWLLqlwYYhse4psHCe9ECJqMEuCj2j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145989; x=1749750789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl8ssGy20WIwQ9oJ9UugxpfMo+m1ppVl8PDiVTX1sSc=;
        b=M1c21tHtedoMKqUvy18NEmAFaolf1Bx83AF3M7m4YdRgytOXY61CC6mNovWoG4rSuQ
         yaJhG+GhsWyFooJddscdBSpVzUHOVHAeYUWTB21ohqXvXV/SvmbjngVlIKgMn8RWP3bB
         /tAqRW6Z8rZgFF3d3+4gC6s6UMHaWrap/3S0KW7xR5IHDq9JYCq1fBkyBopG/LuvaFIn
         Uhr3NQ5e8BVAEWAIH8c/DgHJAUAxKHrI7C80/N02bESlvLczvlyId7VV32n1zAHINpLd
         RqgMJGNHWUOyxVUJp6uG9iyfIU+16KuXR0L3vYli1d6+KQ7jxz5B3/u4DuBx/yOEJ4DR
         EeWg==
X-Gm-Message-State: AOJu0YwXHDO3NBnPyLF2Ij6AYpvO6oLHgK6z3C0BSsxglPi2Ac1p0Tuv
	BvVy1ADWFa+c+jbKYTDkHqPSEc9EfK1pJSStQPVBsuRPIaHUcOJv5eTpWSMlkTVnhg==
X-Gm-Gg: ASbGncsrh8RVhxUQtSbXq2MjAhFkaVrF6H6J+hHhTturu/Vp1FYuhWBQxyqwTqCERyW
	3Il9yuuNtJO+5bDVb+1vAs7ZpjjfQj5IitVxYsHjXFNyoVGoGnxBgHdmBk/wADVpX2sfUVhkGTr
	pv16GYBlqVoULwSL4fry/OUq8aCQLR8WCzVuFn7qIlTktCDtEB5lCIln+rZqFVP7Kgfx11ArghA
	Vdx9HHdbL7qapOC8RUrQGykiMGlPtLUwra0cimjcf3twfcjkdzEIRBwpKTJ8bVD3NZBL/Ty42zA
	+G102ShanFQVjCqDKzhB32DcWIYuD3tJSYZbHnQ22RakDiAx5cL3WKhio/1LsUqe53nCDY4RbCE
	69JGalluPnfPrISzj0jaG1L7H2w==
X-Google-Smtp-Source: AGHT+IFlq5ht3uZf7ciRLQmdAPYFGASf3iU3YYzwLzFJOAeEkyQ6j/O5YV23vNe1kOHNJm+t25D9ag==
X-Received: by 2002:a05:6512:b94:b0:553:20f2:2e57 with SMTP id 2adb3069b0e04-55366be0c0emr26440e87.17.1749145988776;
        Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:04 +0000
Subject: [PATCH v2 11/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ROTATION
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-11-5710f9d030aa@chromium.org>
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

Fetch the rotation from the fwnode and map it into a control.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c     | 22 +++++++++++++--
 drivers/media/usb/uvc/uvc_swentity.c | 55 ++++++++++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h     |  5 ++++
 3 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 59be62ae24a4219fa9d7aacf2ae7382c95362178..5788f0c0f6604da06a7bca1b9999d0957817e75e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -378,11 +378,18 @@ static const struct uvc_control_info uvc_ctrls[] = {
 	},
 	{
 		.entity		= UVC_GUID_SWENTITY,
-		.selector	= 0,
-		.index		= 0,
+		.selector	= UVC_SWENTITY_ORIENTATION,
+		.index		= UVC_SWENTITY_ORIENTATION,
 		.size		= 1,
 		.flags		= UVC_CTRL_FLAG_GET_CUR,
 	},
+	{
+		.entity		= UVC_GUID_SWENTITY,
+		.selector	= UVC_SWENTITY_ROTATION,
+		.index		= UVC_SWENTITY_ROTATION,
+		.size		= 2,
+		.flags		= UVC_CTRL_FLAG_GET_RANGE,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -1025,7 +1032,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.id		= V4L2_CID_CAMERA_ORIENTATION,
 		.entity		= UVC_GUID_SWENTITY,
-		.selector	= 0,
+		.selector	= UVC_SWENTITY_ORIENTATION,
 		.size		= 8,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
@@ -1033,6 +1040,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.menu_mask	= GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
 					  V4L2_CAMERA_ORIENTATION_FRONT),
 	},
+	{
+		.id		= V4L2_CID_CAMERA_SENSOR_ROTATION,
+		.entity		= UVC_GUID_SWENTITY,
+		.selector	= UVC_SWENTITY_ROTATION,
+		.size		= 16,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
+		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
+	},
 };
 
 /* ------------------------------------------------------------------------
diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
index 702a2c26e029a0655dade177ed2a9b88d7a4136d..60f3166addbeb7d2e431d107b23034d2d11a1812 100644
--- a/drivers/media/usb/uvc/uvc_swentity.c
+++ b/drivers/media/usb/uvc/uvc_swentity.c
@@ -10,10 +10,11 @@
 #include <media/v4l2-fwnode.h>
 #include "uvcvideo.h"
 
-static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
-				u8 cs, void *data, u16 size)
+static int uvc_swentity_get_orientation(struct uvc_device *dev,
+					struct uvc_entity *entity, u8 cs,
+					void *data, u16 size)
 {
-	if (size < 1)
+	if (cs != UVC_SWENTITY_ORIENTATION || size != 1)
 		return -EINVAL;
 
 	switch (entity->swentity.props.orientation) {
@@ -30,6 +31,31 @@ static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entit
 	return 0;
 }
 
+static int uvc_swentity_get_rotation(struct uvc_device *dev,
+				     struct uvc_entity *entity, u8 cs, void *data,
+				     u16 size)
+{
+	if (cs != UVC_SWENTITY_ROTATION || size != 2)
+		return -EINVAL;
+
+	((u8 *)data)[0] = entity->swentity.props.rotation;
+	((u8 *)data)[1] = entity->swentity.props.rotation >> 8;
+
+	return 0;
+}
+
+static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
+				u8 cs, void *data, u16 size)
+{
+	switch (cs) {
+	case UVC_SWENTITY_ORIENTATION:
+		return uvc_swentity_get_orientation(dev, entity, cs, data, size);
+	case UVC_SWENTITY_ROTATION:
+		return uvc_swentity_get_rotation(dev, entity, cs, data, size);
+	}
+	return -EINVAL;
+}
+
 static int uvc_swentity_get_info(struct uvc_device *dev,
 				 struct uvc_entity *entity, u8 cs, u8 *caps)
 {
@@ -37,11 +63,22 @@ static int uvc_swentity_get_info(struct uvc_device *dev,
 	return 0;
 }
 
+static int uvc_swentity_get_res(struct uvc_device *dev, struct uvc_entity *entity,
+				u8 cs, void *res, u16 size)
+{
+	if (size == 0)
+		return -EINVAL;
+	((u8 *)res)[0] = 1;
+	memset(res + 1, 0, size - 1);
+	return 0;
+}
+
 int uvc_swentity_init(struct uvc_device *dev)
 {
 	static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
 	struct v4l2_fwnode_device_properties props;
 	struct uvc_entity *unit;
+	u8 controls = 0;
 	int ret;
 
 	ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
@@ -49,7 +86,11 @@ int uvc_swentity_init(struct uvc_device *dev)
 		return dev_err_probe(&dev->intf->dev, ret,
 				     "Can't parse fwnode\n");
 
-	if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
+	if (props.orientation != V4L2_FWNODE_PROPERTY_UNSET)
+		controls |= BIT(UVC_SWENTITY_ORIENTATION);
+	if (props.rotation != V4L2_FWNODE_PROPERTY_UNSET)
+		controls |= BIT(UVC_SWENTITY_ROTATION);
+	if (!controls)
 		return 0;
 
 	unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
@@ -60,9 +101,13 @@ int uvc_swentity_init(struct uvc_device *dev)
 	unit->swentity.props = props;
 	unit->swentity.bControlSize = 1;
 	unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
-	unit->swentity.bmControls[0] = 1;
+	unit->swentity.bmControls[0] = controls;
 	unit->get_cur = uvc_swentity_get_cur;
 	unit->get_info = uvc_swentity_get_info;
+	unit->get_res = uvc_swentity_get_res;
+	unit->get_def = uvc_swentity_get_rotation;
+	unit->get_min = uvc_swentity_get_rotation;
+	unit->get_max = uvc_swentity_get_rotation;
 	strscpy(unit->name, "SWENTITY", sizeof(unit->name));
 
 	list_add_tail(&unit->list, &dev->entities);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index d6da8ed3ad4cf3377df49923e051fe04d83d2e38..7cca0dc75d11f6a13bc4f09676a5a00e80cb38f7 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -45,6 +45,11 @@
 #define UVC_SWENTITY_UNIT		0x7ffd
 #define UVC_SWENTITY_UNIT_ID		0x101
 
+enum {
+	UVC_SWENTITY_ORIENTATION,
+	UVC_SWENTITY_ROTATION
+};
+
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */

-- 
2.50.0.rc0.642.g800a2b2222-goog


