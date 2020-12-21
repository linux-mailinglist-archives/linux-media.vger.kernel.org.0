Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2232E003D
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgLUSow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgLUSow (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:44:52 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEACCC0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:44:11 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id a6so10819862wmc.2
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GxBnprDCZ8ETALSrcjDqUFKJ+dolK5Q6ES1f8OyDC/c=;
        b=k47fzwJ+SznvdDchmWl8VBBQjY/aTV8bTbun1m6WOVRcSSDMMY2P4+QRjnsFQkKob9
         8EUUMKsCYQybpMvywk2fqC8pkmFJ1mrN+DBAxlgWXWaxREYoiZrLbmXvhjjxi1ISJ3Au
         LL9yUVxkC2ZhDB0dXQrsfijaUc32zNJ/MSsUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GxBnprDCZ8ETALSrcjDqUFKJ+dolK5Q6ES1f8OyDC/c=;
        b=EXxAVBf+5YXjAVs8LzkK9lZJ85HfwDCiOXPxpJZb5VFYmNVqcUtA/XX1xUEbr+GZou
         jEjmRQEbrsAvrV0/XEkTLvE9GtbcHnqyq+xz4LZkhKeGKkh/rxKBfKAZGwLHn4tglD1a
         H1zC/CWEYnbyzKQh8nIL2itiBN6+KBpb1jru5h59L223v8oqkFGRIs4euEK1T3Z63tn4
         yZuehpeor6c9aLSG+Fxp/AOu5eJcQmQH76M3FJURMKfm9FTx2ZI7MgtEN3TaWyIGIqme
         x34PNpNPKYsJRH5G/Ft10MRGTFrjFooZMXtUZa7DfoAiJ9hAueJXyhLSVdpsJEEtCLKf
         GhJQ==
X-Gm-Message-State: AOAM532DrsULoIU2yyQ4vq4QfUmqp/Kb4kKLEuTTjXc2KMqEr+0IQm/3
        tTWSvwqygviY2ImkyFHmE9+YAzIYyJBLcn0vBgQ=
X-Google-Smtp-Source: ABdhPJwt4yprCw7ncEO6VOVLMfCJOU0nOn068+ce9e6P21H7n6qS9VJJxAaHfvSf88dhnmcHVwQ4VA==
X-Received: by 2002:a1c:8d:: with SMTP id 135mr17419177wma.177.1608569304346;
        Mon, 21 Dec 2020 08:48:24 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:23 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 03/12] media: uvcvideo: Move guid to entity
Date:   Mon, 21 Dec 2020 17:48:10 +0100
Message-Id: <20201221164819.792019-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of having multiple copies of the entity guid on the code, move
it to the entity structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 30 ++++--------------------------
 drivers/media/usb/uvc/uvc_driver.c | 25 +++++++++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h   |  2 +-
 3 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 69b2fc6ce12c..d7ccd0fcd88d 100644
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
@@ -1805,8 +1784,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 	if (data == NULL)
 		return -ENOMEM;
 
-	memcpy(info->entity, ctrl->entity->extension.guidExtensionCode,
-	       sizeof(info->entity));
+	memcpy(info->entity, ctrl->entity->guid, sizeof(info->entity));
 	info->index = ctrl->index;
 	info->selector = ctrl->index + 1;
 
@@ -1912,7 +1890,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 
 	if (!found) {
 		uvc_trace(UVC_TRACE_CONTROL, "Control %pUl/%u not found.\n",
-			entity->extension.guidExtensionCode, xqry->selector);
+			entity->guid, xqry->selector);
 		return -ENOENT;
 	}
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ddb9eaa11be7..bfbc5a4d4ca6 100644
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
@@ -1038,6 +1043,22 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
 	entity->id = id;
 	entity->type = type;
 
+	/*
+	 * Set the GUID for standard entity types. For extension units, the GUID
+	 * is initialized by the caller.
+	 */
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
@@ -1109,7 +1130,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
 		if (unit == NULL)
 			return -ENOMEM;
 
-		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
+		memcpy(unit->guid, &buffer[4], 16);
 		unit->extension.bNumControls = buffer[20];
 		memcpy(unit->baSourceID, &buffer[22], p);
 		unit->extension.bControlSize = buffer[22+p];
@@ -1368,7 +1389,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		if (unit == NULL)
 			return -ENOMEM;
 
-		memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
+		memcpy(unit->guid, &buffer[4], 16);
 		unit->extension.bNumControls = buffer[20];
 		memcpy(unit->baSourceID, &buffer[22], p);
 		unit->extension.bControlSize = buffer[22+p];
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index afcaf49fad1a..0a3404091665 100644
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
2.29.2.684.gfbc64c5ab5-goog

