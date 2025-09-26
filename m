Return-Path: <linux-media+bounces-43263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988CEBA3D32
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A3017932B
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F223009DF;
	Fri, 26 Sep 2025 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ND6vetiw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F426CE1A
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892306; cv=none; b=f93Qd+C0Mj1p9boWQTuBxXbZb4AVPRachkbWju67P6bboZm62TJq6j8K/y97aEREhK/u39WgE9taZ7y9gZeVI0aI1OuXrcKn0+t+wlXXgeU/3Y3FfBzhwcbN49gGLK52afgxfz90Y5K9K11hQ1MgKL392b60ftlVmWwxEslCcCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892306; c=relaxed/simple;
	bh=U08jW+ROLINfuVWgmwe8cpKgwKy+8J4DAE40SSartDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVMPNxLz1/QDU815hz4nuKe/EmSoNcS3uPDINBFwZyIwE7/n7RAE2T/nZc3PUMnfCALbxSLG+Vs8WG/gKFPoLgBJKZ963S4bfebdmLNINns5dKaOsCtqbfjdbXrOS7FAsf9N2Dr5hGUe/+unttbsnLAfdso7VtLUhqaSyB6ZscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ND6vetiw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5797c8612b4so2957350e87.2
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892297; x=1759497097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APb3UWCYeewnPsuy/XgWoHvego/0/pU0ggvZnaK9xZ8=;
        b=ND6vetiwvc8HvV+F8PpwSZeponpTkVOf5zU0YmtnnUUCP8C66nPIBYxDAYak2CQeVm
         cl48LslOyRdc1AONC6xSc3VxuztWKnr8TSXJ+sjOj02XNsqa9dgtaQ26E3xdR79Sx5Vt
         VpGuRohS9CbTcMn6aNlChnvA4ez7OdXXhTo4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892297; x=1759497097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APb3UWCYeewnPsuy/XgWoHvego/0/pU0ggvZnaK9xZ8=;
        b=mkQXFBYLaMl5rJVjxl6faOX3B/otbGgRy+8AMPsgpJuWagrIUC6LxuHU/kdye1UF1+
         Te2YSrtTlxP3ms1t2ZMv8AqlgMrfWXvPsBjmLYZ7LZ2pgYNjiTMxJMKYOe4idbpof8Xw
         h5WSXza+TIu6KI4VK/hIlNBOpe3T/Vnfrf0AGjRXhXaPOnBsyPcLBYvwtDrdsfM1GoL3
         liXn3wenPJIiLetrFK9MkviF9UjGQhaqP1qu6doYpbpKkLEBhdxValSVFUmy7PeB2XmR
         PktL2nmDyV4bU8nqNTuJ9PNXzePDgoXJ+GiUtDlBbIuOVgIJ3CrARjxfI1+UEtflNRhH
         hO+A==
X-Gm-Message-State: AOJu0Yz16u2lPbBcwhHQF9YVGCkWewN+1fIMnIwRD8XONTzhV4J1mlEQ
	xVlFA4BUnGuGH0xFXX+lENfV6mfVvdRqPVFCgIaP/efvsl/JgFRnYDm1pkXTnN/Q021Zyv1Z/a2
	uBP19BQ==
X-Gm-Gg: ASbGnct07N7U6mdETqprVtlLDYeGfhLaF50qD9kj+MI22WjlldcdJmxww3MnpkM7rYO
	+D92rt4sd6ozHsXIbV1hSbdBvf5OJCrHEpZfLwdKXED48PdX4F10i1K0z8x+1M+UpsqrplaGirJ
	lBPDezfXCNOA/uOChQ+TfJOgRzdoThEBU5WPuA8wCf49dTQIwxrm6IPM3haV+mYim2WD4TARUwR
	WxonwTi/Ss9A70OiSeFD2sOWyrSqp1KmDF0cIZlW6l5GdL69sxPXwuVZiTAvmIBKWluFh3/98Ka
	nnA9vopgytV81E0TeTDOcX7bvEtxk+tMSq6KHbaHLmDO5YZD0ShbJ5mYybW3FeZPYwhADGymN7u
	+902mz3+AhB9JkAyoYCUUPxpnQKHN3MQJXYeJ2q6JXCr6bhof7TGNVenhPHS9qWBcD6GTMT4neO
	9UeA==
X-Google-Smtp-Source: AGHT+IG13LZH3qyc8t2QDs0MQunt54awluMMidrJtB7qriVpX4diWPLucIbGRhyJDMPwZ0BJ1XUdKg==
X-Received: by 2002:a05:6512:3b20:b0:57a:8738:4d80 with SMTP id 2adb3069b0e04-582d0c2a62fmr2064511e87.21.1758892296980;
        Fri, 26 Sep 2025 06:11:36 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:36 +0000
Subject: [PATCH v3 12/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ROTATION
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-12-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Fetch the rotation from the fwnode and map it into a control.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c     | 22 ++++++++++++++++---
 drivers/media/usb/uvc/uvc_swentity.c | 41 +++++++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h     |  5 +++++
 3 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e99fdf4bafbea662556798fe345a48b9ffd8467b..99bae519ded8910a37ad2f2112fbcbfdcac671af 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -387,11 +387,18 @@ static const struct uvc_control_info uvc_ctrls[] = {
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
+		.flags		= UVC_CTRL_FLAG_GET_CUR,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -1049,7 +1056,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.id		= V4L2_CID_CAMERA_ORIENTATION,
 		.entity		= UVC_GUID_SWENTITY,
-		.selector	= 0,
+		.selector	= UVC_SWENTITY_ORIENTATION,
 		.size		= 8,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
@@ -1057,6 +1064,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
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
index eefc5d08e370515181f74590f2f38189770b01b2..e180568efa802fb348dbf165da62417631ff16fd 100644
--- a/drivers/media/usb/uvc/uvc_swentity.c
+++ b/drivers/media/usb/uvc/uvc_swentity.c
@@ -12,10 +12,11 @@
 
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
@@ -32,6 +33,31 @@ static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entit
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
@@ -44,6 +70,7 @@ int uvc_swentity_init(struct uvc_device *dev)
 	static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
 	struct v4l2_fwnode_device_properties props;
 	struct uvc_entity *unit;
+	u8 controls = 0;
 	int ret;
 
 	ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
@@ -51,7 +78,11 @@ int uvc_swentity_init(struct uvc_device *dev)
 		return dev_err_probe(&dev->intf->dev, ret,
 				     "Can't parse fwnode\n");
 
-	if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
+	if (props.orientation != V4L2_FWNODE_PROPERTY_UNSET)
+		controls |= BIT(UVC_SWENTITY_ORIENTATION);
+	if (props.rotation != V4L2_FWNODE_PROPERTY_UNSET)
+		controls |= BIT(UVC_SWENTITY_ROTATION);
+	if (!controls)
 		return 0;
 
 	unit = uvc_alloc_new_entity(dev, UVC_SWENTITY_UNIT,
@@ -63,7 +94,7 @@ int uvc_swentity_init(struct uvc_device *dev)
 	unit->swentity.props = props;
 	unit->swentity.bControlSize = 1;
 	unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
-	unit->swentity.bmControls[0] = 1;
+	unit->swentity.bmControls[0] = controls;
 	unit->get_cur = uvc_swentity_get_cur;
 	unit->get_info = uvc_swentity_get_info;
 	strscpy(unit->name, "SWENTITY", sizeof(unit->name));
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 04ca5dcce11d902dbfdf32f2a962159ba7940a39..64c9a597cc533ebf3a305060294c7045e32f72b0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -47,6 +47,11 @@
 
 #define UVC_INVALID_ENTITY_ID          0xffff
 
+enum {
+	UVC_SWENTITY_ORIENTATION,
+	UVC_SWENTITY_ROTATION
+};
+
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */

-- 
2.51.0.536.g15c5d4f767-goog


