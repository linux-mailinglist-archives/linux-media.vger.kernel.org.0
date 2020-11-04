Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372B42A6C67
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 19:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732255AbgKDSHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 13:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732204AbgKDSHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 13:07:50 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16713C0613D4
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 10:07:49 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k18so3190353wmj.5
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=09aDl4ZmShm7ZTcFx/xGgLsr6c/hfG/TYOh2Eo8wu1E=;
        b=ZK73jgWMRs9RG//Hq3zS8gfLp23l99spVZhcpaaoAXOjTW+xZ8wZjyZcUxU4kXftJe
         JSqMUJizqIo9rK/tcCf5qBDuIpvM40+seOC6/Bd38VSbwb3AfZHWiqvsOYcLamrh67io
         pfMl7ZXyWX+9ybint8oh1Owvz1ikKCh+4IC2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=09aDl4ZmShm7ZTcFx/xGgLsr6c/hfG/TYOh2Eo8wu1E=;
        b=TiB3R/UYglFlJeFmebvYNTQZAFjqbTHGg64d1VIz0iqC582fZzfIhDjaawMPmGOtxk
         cdMjqrastNwgAH2Vc03CMm2dUDZ1Pi/Tl9vWSTlLndf7osKduquLUDS6NCKBI/Qacj9e
         BjWBSkEDEu7MGTJGsny3zzBmFG8GkQV9LgnDF86mlM+CH4s+syCwImuwKpfHFeqFanCS
         y+NprcYtChfvVXnSwnUSLkxLaRldnHn/jSs9Irajnr8+5/TYthEeQZP8gHk8kaDh8wAT
         7u6xzbXq2D4ZHHWZDTJ9IZf3R1YpQJ0+idWUpyXSRd8Y/hHZva7wLH3MZZUnQ+qk9BhC
         0h0w==
X-Gm-Message-State: AOAM530znLV1LiiK0biHWuJHk1TLHtaOog4FygdhfbrltdXaeeKE59Eg
        oaIIOJVl4m+7xMjioss8FLkaPA==
X-Google-Smtp-Source: ABdhPJzufMPX2mGMtpxpxncJqaX/J71zkjGVYhYI2ZnRmXcsLl80pCF7ixko3HUzhQbKqT8p0EoYOQ==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr5794857wmi.122.1604513267660;
        Wed, 04 Nov 2020 10:07:47 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y10sm3801841wru.94.2020.11.04.10.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:07:47 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 2/7] media: uvcvideo: Move guid to entity
Date:   Wed,  4 Nov 2020 19:07:29 +0100
Message-Id: <20201104180734.286789-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104180734.286789-1-ribalda@chromium.org>
References: <20201104180734.286789-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of having multiple copies of the entity guid on the code, move
it to the entity structure.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 30 ++++--------------------------
 drivers/media/usb/uvc/uvc_driver.c | 21 +++++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h   |  2 +-
 3 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index f479d8971dfb..0e480b75e724 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -826,31 +826,10 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
  * Terminal and unit management
  */
 
-static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
-static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
-static const u8 uvc_media_transport_input_guid[16] =
-	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
-
 static int uvc_entity_match_guid(const struct uvc_entity *entity,
-	const u8 guid[16])
+				 const u8 guid[16])
 {
-	switch (UVC_ENTITY_TYPE(entity)) {
-	case UVC_ITT_CAMERA:
-		return memcmp(uvc_camera_guid, guid, 16) == 0;
-
-	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
-		return memcmp(uvc_media_transport_input_guid, guid, 16) == 0;
-
-	case UVC_VC_PROCESSING_UNIT:
-		return memcmp(uvc_processing_guid, guid, 16) == 0;
-
-	case UVC_VC_EXTENSION_UNIT:
-		return memcmp(entity->extension.guidExtensionCode,
-			      guid, 16) == 0;
-
-	default:
-		return 0;
-	}
+	return memcmp(entity->guid, guid, sizeof(entity->guid)) == 0;
 }
 
 /* ------------------------------------------------------------------------
@@ -1776,8 +1755,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 	if (data == NULL)
 		return -ENOMEM;
 
-	memcpy(info->entity, ctrl->entity->extension.guidExtensionCode,
-	       sizeof(info->entity));
+	memcpy(info->entity, ctrl->entity->guid, sizeof(info->entity));
 	info->index = ctrl->index;
 	info->selector = ctrl->index + 1;
 
@@ -1883,7 +1861,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 
 	if (!found) {
 		uvc_trace(UVC_TRACE_CONTROL, "Control %pUl/%u not found.\n",
-			entity->extension.guidExtensionCode, xqry->selector);
+			entity->guid, xqry->selector);
 		return -ENOENT;
 	}
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9fc0b600eab1..77fea26faa9a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1019,6 +1019,11 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	return ret;
 }
 
+static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
+static const u8 uvc_media_transport_input_guid[16] =
+	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
+static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
+
 static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
 		unsigned int num_pads, unsigned int extra_size)
 {
@@ -1038,6 +1043,18 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
 	entity->id = id;
 	entity->type = type;
 
+	switch (type) {
+	case UVC_ITT_CAMERA:
+		memcpy(entity->guid, uvc_camera_guid, 16);
+		break;
+	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
+		memcpy(entity->guid, uvc_media_transport_input_guid, 16);
+		break;
+	case UVC_VC_PROCESSING_UNIT:
+		memcpy(entity->guid, uvc_processing_guid, 16);
+		break;
+	}
+
 	entity->num_links = 0;
 	entity->num_pads = num_pads;
 	entity->pads = ((void *)(entity + 1)) + extra_size;
@@ -1109,7 +1126,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
 		if (unit == NULL)
 			return -ENOMEM;
 
-		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
+		memcpy(unit->guid, &buffer[4], 16);
 		unit->extension.bNumControls = buffer[20];
 		memcpy(unit->baSourceID, &buffer[22], p);
 		unit->extension.bControlSize = buffer[22+p];
@@ -1368,7 +1385,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		if (unit == NULL)
 			return -ENOMEM;
 
-		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
+		memcpy(unit->guid, &buffer[4], 16);
 		unit->extension.bNumControls = buffer[20];
 		memcpy(unit->baSourceID, &buffer[22], p);
 		unit->extension.bControlSize = buffer[22+p];
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a3dfacf069c4..df7bf2d104a3 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -304,6 +304,7 @@ struct uvc_entity {
 	u8 id;
 	u16 type;
 	char name[64];
+	u8 guid[16];
 
 	/* Media controller-related fields. */
 	struct video_device *vdev;
@@ -342,7 +343,6 @@ struct uvc_entity {
 		} selector;
 
 		struct {
-			u8  guidExtensionCode[16];
 			u8  bNumControls;
 			u8  bControlSize;
 			u8  *bmControls;
-- 
2.29.1.341.ge80a0c044ae-goog

