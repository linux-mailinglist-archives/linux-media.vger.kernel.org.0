Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7683ACAE4
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbhFRMb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhFRMbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:47 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE2EC061574
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:35 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r7so8348737edv.12
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FYQeTeHkMO1lg+JXQIr1N50/CYiSvDCsf947MiSMJw=;
        b=EgJzXbxsfx11+8LzIFTQ0AMWnXl9IlJOQqHojWXCFfWHYgzsnTYmuJ/a8lQy1cX0eE
         8f1nfUoAAf1IFItWCA1jYnQv59sy/y/tGT6BeTv3Yj5ZXgs1e3UJ/3EizNtPJue19xa3
         ANe0+m+FDR32kPhakA5RU1yYFKUh5TPFkXhRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FYQeTeHkMO1lg+JXQIr1N50/CYiSvDCsf947MiSMJw=;
        b=Drxx8mwkJ8AXIHoOp15sWLH2pAbELPO8NI/3U+rDJDVy7d2/z6LvP5eSwFhLt2x4B9
         2sdSgVh2yJYACkoGURFaaO37Esz9eAdb16YQFOcgLhjG+vEDMlKiE0vFn2OjZLLh/pZi
         6ZaWkMpV8hT68eAXuh3xFS8z707bt+I8YMOdLvCLOeqgpgxhKG+/756KtIyDRLXlFIiH
         wQFUbynyaq2CfvXyEboWYIpRiKyublkBCgTAz4nQZVnxX+Awru2oTZS6o7PlF/cTzDOj
         zRLg3GFSwNtLozrGkanzEa4Tu3q7nB1Wnw11Zy6CGFokBJzBdKn+i1YXKztQN4JJlqwz
         WuqQ==
X-Gm-Message-State: AOAM532VHTMeV9uzP0zYCH0eLpojfc2GU21j156XIjX6V7EBK39GA0OL
        bmu9z8ZThsychz+fdpCz+/qclw==
X-Google-Smtp-Source: ABdhPJzfR1lEyuOO6p4dhDy0NTy1gNS16DAJpvlxyxQLFBBih8YtuNOJ+OjwLMxqsLoFJYx0Hr+nJQ==
X-Received: by 2002:a50:a447:: with SMTP id v7mr4640633edb.183.1624019374138;
        Fri, 18 Jun 2021 05:29:34 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:33 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v10 13/21] media: uvcvideo: Use control names from framework
Date:   Fri, 18 Jun 2021 14:29:15 +0200
Message-Id: <20210618122923.385938-14-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already contains a map of IDs to names, lets use it when
possible.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 57 ++++++++++++--------------------
 drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++-
 drivers/media/usb/uvc/uvcvideo.h |  2 +-
 3 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 7c1d71782281..2cc2ff0d0cae 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -432,7 +432,6 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	{
 		.id		= V4L2_CID_BRIGHTNESS,
-		.name		= "Brightness",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
 		.size		= 16,
@@ -442,7 +441,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_CONTRAST,
-		.name		= "Contrast",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_CONTRAST_CONTROL,
 		.size		= 16,
@@ -452,7 +450,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_HUE,
-		.name		= "Hue",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_CONTROL,
 		.size		= 16,
@@ -464,7 +461,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_SATURATION,
-		.name		= "Saturation",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SATURATION_CONTROL,
 		.size		= 16,
@@ -474,7 +470,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_SHARPNESS,
-		.name		= "Sharpness",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SHARPNESS_CONTROL,
 		.size		= 16,
@@ -484,7 +479,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_GAMMA,
-		.name		= "Gamma",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAMMA_CONTROL,
 		.size		= 16,
@@ -494,7 +488,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
-		.name		= "Backlight Compensation",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
 		.size		= 16,
@@ -504,7 +497,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_GAIN,
-		.name		= "Gain",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAIN_CONTROL,
 		.size		= 16,
@@ -514,7 +506,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-		.name		= "Power Line Frequency",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
 		.size		= 2,
@@ -526,7 +517,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_HUE_AUTO,
-		.name		= "Hue, Auto",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_AUTO_CONTROL,
 		.size		= 1,
@@ -537,7 +527,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_EXPOSURE_AUTO,
-		.name		= "Exposure, Auto",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_MODE_CONTROL,
 		.size		= 4,
@@ -550,7 +539,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
-		.name		= "Exposure, Auto Priority",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
 		.size		= 1,
@@ -560,7 +548,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
-		.name		= "Exposure (Absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
 		.size		= 32,
@@ -572,7 +559,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
-		.name		= "White Balance Temperature, Auto",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
 		.size		= 1,
@@ -583,7 +569,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
-		.name		= "White Balance Temperature",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
 		.size		= 16,
@@ -595,7 +580,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
-		.name		= "White Balance Component, Auto",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
 		.size		= 1,
@@ -607,7 +591,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_BLUE_BALANCE,
-		.name		= "White Balance Blue Component",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
 		.size		= 16,
@@ -619,7 +602,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_RED_BALANCE,
-		.name		= "White Balance Red Component",
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
 		.size		= 16,
@@ -631,7 +613,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_FOCUS_ABSOLUTE,
-		.name		= "Focus (absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
 		.size		= 16,
@@ -643,7 +624,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_FOCUS_AUTO,
-		.name		= "Focus, Auto",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
 		.size		= 1,
@@ -654,7 +634,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_IRIS_ABSOLUTE,
-		.name		= "Iris, Absolute",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
 		.size		= 16,
@@ -664,7 +643,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_IRIS_RELATIVE,
-		.name		= "Iris, Relative",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
 		.size		= 8,
@@ -674,7 +652,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_ZOOM_ABSOLUTE,
-		.name		= "Zoom, Absolute",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
 		.size		= 16,
@@ -684,7 +661,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_ZOOM_CONTINUOUS,
-		.name		= "Zoom, Continuous",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
 		.size		= 0,
@@ -696,7 +672,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PAN_ABSOLUTE,
-		.name		= "Pan (Absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
 		.size		= 32,
@@ -706,7 +681,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_TILT_ABSOLUTE,
-		.name		= "Tilt (Absolute)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
 		.size		= 32,
@@ -716,7 +690,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PAN_SPEED,
-		.name		= "Pan (Speed)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
 		.size		= 16,
@@ -728,7 +701,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_TILT_SPEED,
-		.name		= "Tilt (Speed)",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
 		.size		= 16,
@@ -740,7 +712,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PRIVACY,
-		.name		= "Privacy",
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
 		.size		= 1,
@@ -750,7 +721,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 	{
 		.id		= V4L2_CID_PRIVACY,
-		.name		= "Privacy",
 		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
 		.size		= 1,
@@ -1072,6 +1042,20 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
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
@@ -1085,7 +1069,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
 	v4l2_ctrl->id = mapping->id;
 	v4l2_ctrl->type = mapping->v4l2_type;
-	strscpy(v4l2_ctrl->name, mapping->name, sizeof(v4l2_ctrl->name));
+	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
+		sizeof(v4l2_ctrl->name));
 	v4l2_ctrl->flags = 0;
 
 	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
@@ -2177,7 +2162,8 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 
 	list_add_tail(&map->list, &ctrl->info.mappings);
 	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
-		map->name, ctrl->info.entity, ctrl->info.selector);
+		uvc_map_get_name(map), ctrl->info.entity,
+		ctrl->info.selector);
 
 	return 0;
 }
@@ -2195,7 +2181,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	if (mapping->id & ~V4L2_CTRL_ID_MASK) {
 		uvc_dbg(dev, CONTROL,
 			"Can't add mapping '%s', control id 0x%08x is invalid\n",
-			mapping->name, mapping->id);
+			uvc_map_get_name(mapping), mapping->id);
 		return -EINVAL;
 	}
 
@@ -2242,7 +2228,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		if (mapping->id == map->id) {
 			uvc_dbg(dev, CONTROL,
 				"Can't add mapping '%s', control id 0x%08x already exists\n",
-				mapping->name, mapping->id);
+				uvc_map_get_name(mapping), mapping->id);
 			ret = -EEXIST;
 			goto done;
 		}
@@ -2253,7 +2239,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		atomic_dec(&dev->nmappings);
 		uvc_dbg(dev, CONTROL,
 			"Can't add mapping '%s', maximum mappings count (%u) exceeded\n",
-			mapping->name, UVC_MAX_CONTROL_MAPPINGS);
+			uvc_map_get_name(mapping), UVC_MAX_CONTROL_MAPPINGS);
 		ret = -ENOMEM;
 		goto done;
 	}
@@ -2462,6 +2448,7 @@ static void uvc_ctrl_cleanup_mappings(struct uvc_device *dev,
 	list_for_each_entry_safe(mapping, nm, &ctrl->info.mappings, list) {
 		list_del(&mapping->list);
 		kfree(mapping->menu_info);
+		kfree(mapping->name);
 		kfree(mapping);
 	}
 }
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 9cdd30eff495..28ccaa8b9e42 100644
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
index 37a092d717cf..b044d9455b2c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -241,7 +241,7 @@ struct uvc_control_mapping {
 	struct list_head ev_subs;
 
 	u32 id;
-	u8 name[32];
+	char *name;
 	u8 entity[16];
 	u8 selector;
 
-- 
2.32.0.288.g62a8d224e6-goog

