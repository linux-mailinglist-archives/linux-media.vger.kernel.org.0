Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3D5340F29
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbhCRUaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbhCRU3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:38 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38612C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:38 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id hq27so6019503ejc.9
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njjchYj7qcv+WzT/+OCj/y0fOxvfa83NzAeCaxNCMs8=;
        b=ebRAk1EzTfPWxw4QC+8LXdsvqs/gs/H2QxPTzwYAYKA2IxfPrisZ/DKDKC4+YLviSb
         Y3HyWdBVpINy0lGQL7u6xEcKS6pIcq03IYuPS0WpgCnEUoQNFBF3KGyFfGKn66e89UKR
         WgNsqBhxtirctQvOgDSi9mZLy5xRjBfXy/t9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njjchYj7qcv+WzT/+OCj/y0fOxvfa83NzAeCaxNCMs8=;
        b=CCiow2mMD0WHKBWDDdHFaUNlf8hShlPuoJfYQ+9gpeYqTXf2u+/iTQYZ9LDeQVCoPO
         UuuAqBTBVJX+4xJgJE87gKhYdb/xtBLJFAkoxbwecWllq6NRb2oOl5eT27EkSpiC0iAp
         zpQV3g+pGiYGbjRiQUoNcL5i5VGaO3kZ0jIIisqOkocckZ+Axaq9+nquD08zzhPF4JMg
         tvZvFTIncc5RuICUSe/7tCe/CS/o+2Z0paC4CR0UqZymq78Jbxr2kfDESCnhP1aEBq12
         rlDASPwuKEQmad/UZDea4GxoAgc+Spvv6MkgMtBdHdfkpgTpKt+vW2Jvc0a/xxuEGKvm
         RkZQ==
X-Gm-Message-State: AOAM531lrbxGWI7+Vl2W4fXlhqDS8V5OlXeMqUyV84wy/H27RjKqiINs
        NqcaZD4+hII9TtJgrLskyiVt1A==
X-Google-Smtp-Source: ABdhPJyRJMg223qZL9mgByK2Cfy+adQda1FaaIhfPYyJblH1E1deMs6ewtAYgsMMdK/H9dCj2gw8qg==
X-Received: by 2002:a17:907:971a:: with SMTP id jg26mr398597ejc.317.1616099376915;
        Thu, 18 Mar 2021 13:29:36 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:36 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v7 11/17] media: uvcvideo: Use control names from framework
Date:   Thu, 18 Mar 2021 21:29:22 +0100
Message-Id: <20210318202928.166955-12-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already contains a map of IDs to names, lets use it when
possible.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 57 ++++++++++++--------------------
 drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++-
 drivers/media/usb/uvc/uvcvideo.h |  2 +-
 3 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index ba14733db757..929e70dff11a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -436,7 +436,6 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.id		= V4L2_CID_BRIGHTNESS,
-		.name		= "Brightness",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
 		.size		= 16,
@@ -446,7 +445,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_CONTRAST,
-		.name		= "Contrast",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_CONTRAST_CONTROL,
 		.size		= 16,
@@ -456,7 +454,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_HUE,
-		.name		= "Hue",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_CONTROL,
 		.size		= 16,
@@ -468,7 +465,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_SATURATION,
-		.name		= "Saturation",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SATURATION_CONTROL,
 		.size		= 16,
@@ -478,7 +474,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_SHARPNESS,
-		.name		= "Sharpness",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SHARPNESS_CONTROL,
 		.size		= 16,
@@ -488,7 +483,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_GAMMA,
-		.name		= "Gamma",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAMMA_CONTROL,
 		.size		= 16,
@@ -498,7 +492,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
-		.name		= "Backlight Compensation",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
 		.size		= 16,
@@ -508,7 +501,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_GAIN,
-		.name		= "Gain",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAIN_CONTROL,
 		.size		= 16,
@@ -518,7 +510,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-		.name		= "Power Line Frequency",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
 		.size		= 2,
@@ -530,7 +521,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_HUE_AUTO,
-		.name		= "Hue, Auto",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_AUTO_CONTROL,
 		.size		= 1,
@@ -541,7 +531,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_EXPOSURE_AUTO,
-		.name		= "Exposure, Auto",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_MODE_CONTROL,
 		.size		= 4,
@@ -554,7 +543,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
-		.name		= "Exposure, Auto Priority",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
 		.size		= 1,
@@ -564,7 +552,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
-		.name		= "Exposure (Absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
 		.size		= 32,
@@ -576,7 +563,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
-		.name		= "White Balance Temperature, Auto",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
 		.size		= 1,
@@ -587,7 +573,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
-		.name		= "White Balance Temperature",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
 		.size		= 16,
@@ -599,7 +584,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
-		.name		= "White Balance Component, Auto",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
 		.size		= 1,
@@ -611,7 +595,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_BLUE_BALANCE,
-		.name		= "White Balance Blue Component",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
 		.size		= 16,
@@ -623,7 +606,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_RED_BALANCE,
-		.name		= "White Balance Red Component",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
 		.size		= 16,
@@ -635,7 +617,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_FOCUS_ABSOLUTE,
-		.name		= "Focus (absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
 		.size		= 16,
@@ -647,7 +628,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_FOCUS_AUTO,
-		.name		= "Focus, Auto",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
 		.size		= 1,
@@ -658,7 +638,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_IRIS_ABSOLUTE,
-		.name		= "Iris, Absolute",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
 		.size		= 16,
@@ -668,7 +647,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_IRIS_RELATIVE,
-		.name		= "Iris, Relative",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
 		.size		= 8,
@@ -678,7 +656,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_ZOOM_ABSOLUTE,
-		.name		= "Zoom, Absolute",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
 		.size		= 16,
@@ -688,7 +665,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_ZOOM_CONTINUOUS,
-		.name		= "Zoom, Continuous",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
 		.size		= 0,
@@ -700,7 +676,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PAN_ABSOLUTE,
-		.name		= "Pan (Absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
 		.size		= 32,
@@ -710,7 +685,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_TILT_ABSOLUTE,
-		.name		= "Tilt (Absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
 		.size		= 32,
@@ -720,7 +694,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PAN_SPEED,
-		.name		= "Pan (Speed)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
 		.size		= 16,
@@ -732,7 +705,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_TILT_SPEED,
-		.name		= "Tilt (Speed)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
 		.size		= 16,
@@ -744,7 +716,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PRIVACY,
-		.name		= "Privacy",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
 		.size		= 1,
@@ -754,7 +725,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PRIVACY,
-		.name		= "Privacy",
 		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
 		.size		= 1,
@@ -1076,6 +1046,20 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
 	return 0;
 }
 
+static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
+{
+	const char *name;
+
+	if (map->name)
+		return map->name;
+
+	name = v4l2_ctrl_get_name(map->id);
+	if (name)
+		return name;
+
+	return "Unknown Control";
+}
+
 static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl,
 	struct uvc_control_mapping *mapping,
@@ -1089,7 +1073,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
 	v4l2_ctrl->id = mapping->id;
 	v4l2_ctrl->type = mapping->v4l2_type;
-	strscpy(v4l2_ctrl->name, mapping->name, sizeof(v4l2_ctrl->name));
+	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
+		sizeof(v4l2_ctrl->name));
 	v4l2_ctrl->flags = 0;
 
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
@@ -2181,7 +2166,8 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 
 	list_add_tail(&map->list, &ctrl->info.mappings);
 	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
-		map->name, ctrl->info.entity, ctrl->info.selector);
+		uvc_map_get_name(map), ctrl->info.entity,
+		ctrl->info.selector);
 
 	return 0;
 }
@@ -2199,7 +2185,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	if (mapping->id & ~V4L2_CTRL_ID_MASK) {
 		uvc_dbg(dev, CONTROL,
 			"Can't add mapping '%s', control id 0x%08x is invalid\n",
-			mapping->name, mapping->id);
+			uvc_map_get_name(mapping), mapping->id);
 		return -EINVAL;
 	}
 
@@ -2246,7 +2232,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		if (mapping->id == map->id) {
 			uvc_dbg(dev, CONTROL,
 				"Can't add mapping '%s', control id 0x%08x already exists\n",
-				mapping->name, mapping->id);
+				uvc_map_get_name(mapping), mapping->id);
 			ret = -EEXIST;
 			goto done;
 		}
@@ -2257,7 +2243,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		atomic_dec(&dev->nmappings);
 		uvc_dbg(dev, CONTROL,
 			"Can't add mapping '%s', maximum mappings count (%u) exceeded\n",
-			mapping->name, UVC_MAX_CONTROL_MAPPINGS);
+			uvc_map_get_name(mapping), UVC_MAX_CONTROL_MAPPINGS);
 		ret = -ENOMEM;
 		goto done;
 	}
@@ -2466,6 +2452,7 @@ static void uvc_ctrl_cleanup_mappings(struct uvc_device *dev,
 	list_for_each_entry_safe(mapping, nm, &ctrl->info.mappings, list) {
 		list_del(&mapping->list);
 		kfree(mapping->menu_info);
+		kfree(mapping->name);
 		kfree(mapping);
 	}
 }
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index dd10cb9361fa..ed262f61e6a6 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -40,7 +40,13 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 		return -ENOMEM;
 
 	map->id = xmap->id;
-	memcpy(map->name, xmap->name, sizeof(map->name));
+	/* Non standard control id. */
+	if (v4l2_ctrl_get_name(map->id) == NULL) {
+		map->name = kmemdup(xmap->name, sizeof(xmap->name),
+				    GFP_KERNEL);
+		if (!map->name)
+			return -ENOMEM;
+	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
 	map->size = xmap->size;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a26bbec8d37b..dc20021f7ee0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -240,7 +240,7 @@ struct uvc_control_mapping {
 	struct list_head ev_subs;
 
 	u32 id;
-	u8 name[32];
+	char *name;
 	u8 entity[16];
 	u8 selector;
 
-- 
2.31.0.rc2.261.g7f71774620-goog

