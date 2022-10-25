Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB5F60D3EE
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 20:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiJYSsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 14:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbiJYSr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 14:47:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D216467154
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 11:47:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-12-207-nat.elisa-mobile.fi [85.76.12.207])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A35868A9;
        Tue, 25 Oct 2022 20:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666723672;
        bh=DmoEg6gZyscs3PXB7xexErOFXNGzj5HJ0evMoz2iOA0=;
        h=From:To:Cc:Subject:Date:From;
        b=X8lHGQZiMIQ0rJnYvrpUIvIQW2QrM8gW+uOZ7nQMF1utEtdHb/+gguZY2rPbIAgcv
         WB7U/V9WGs1FMuQnAqLBtvedsDJQ8lnAjZYMimkKw5DJrAmX3X5vlmsGRXztLHcGv6
         1aP0s93xUEzFlqArjjyPoNZp9yy5T2mvUofdzGZg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] media: uvcvideo: Factor out usb_string() calls
Date:   Tue, 25 Oct 2022 21:47:24 +0300
Message-Id: <20221025184724.6170-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When parsing UVC descriptors to instantiate entity, the driver calls
usb_string() to retrieve the entity name from the device, and falls back
to a default name if the string can't be retrieved. This code pattern
occurs multiple times. Factor it out to a separate helper function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Ricardo, Guenter, this applies on top of "media: uvcvideo: Handle errors
from calls to usb_string". Any opinion ?
---
 drivers/media/usb/uvc/uvc_driver.c | 59 ++++++++++++++++++------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bd3716a359b0..6eb011f452e5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -813,6 +813,27 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 	return entity;
 }
 
+static void uvc_entity_set_name(struct uvc_device *dev, struct uvc_entity *entity,
+				const char *type_name, u8 string_id)
+{
+	int ret;
+
+	/*
+	 * First attempt to read the entity name from the device. If the entity
+	 * has no associated string, or if reading the string fails (most
+	 * likely due to a buggy firmware), fall back to default names based on
+	 * the entity type.
+	 */
+	if (string_id) {
+		ret = usb_string(dev->udev, string_id, entity->name,
+				 sizeof(entity->name));
+		if (!ret)
+			return;
+	}
+
+	sprintf(entity->name, "%s %u", type_name, entity->id);
+}
+
 /* Parse vendor-specific extensions. */
 static int uvc_parse_vendor_control(struct uvc_device *dev,
 	const unsigned char *buffer, int buflen)
@@ -879,9 +900,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
 					       + n;
 		memcpy(unit->extension.bmControls, &buffer[23+p], 2*n);
 
-		if (buffer[24+p+2*n] == 0 ||
-		    usb_string(udev, buffer[24+p+2*n], unit->name, sizeof(unit->name)) < 0)
-			sprintf(unit->name, "Extension %u", buffer[3]);
+		uvc_entity_set_name(dev, unit, "Extension", buffer[24+p+2*n]);
 
 		list_add_tail(&unit->list, &dev->entities);
 		handled = 1;
@@ -899,6 +918,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 	struct usb_interface *intf;
 	struct usb_host_interface *alts = dev->intf->cur_altsetting;
 	unsigned int i, n, p, len;
+	const char *type_name;
 	u16 type;
 
 	switch (buffer[2]) {
@@ -1004,15 +1024,14 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			memcpy(term->media.bmTransportModes, &buffer[10+n], p);
 		}
 
-		if (buffer[7] == 0 ||
-		    usb_string(udev, buffer[7], term->name, sizeof(term->name)) < 0) {
-			if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA)
-				sprintf(term->name, "Camera %u", buffer[3]);
-			if (UVC_ENTITY_TYPE(term) == UVC_ITT_MEDIA_TRANSPORT_INPUT)
-				sprintf(term->name, "Media %u", buffer[3]);
-			else
-				sprintf(term->name, "Input %u", buffer[3]);
-		}
+		if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA)
+			type_name = "Camera";
+		else if (UVC_ENTITY_TYPE(term) == UVC_ITT_MEDIA_TRANSPORT_INPUT)
+			type_name = "Media";
+		else
+			type_name = "Input";
+
+		uvc_entity_set_name(dev, term, type_name, buffer[7]);
 
 		list_add_tail(&term->list, &dev->entities);
 		break;
@@ -1045,9 +1064,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 
 		memcpy(term->baSourceID, &buffer[7], 1);
 
-		if (buffer[8] == 0 ||
-		    usb_string(udev, buffer[8], term->name, sizeof(term->name)) < 0)
-			sprintf(term->name, "Output %u", buffer[3]);
+		uvc_entity_set_name(dev, term, "Output", buffer[8]);
 
 		list_add_tail(&term->list, &dev->entities);
 		break;
@@ -1068,9 +1085,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 
 		memcpy(unit->baSourceID, &buffer[5], p);
 
-		if (buffer[5+p] == 0 ||
-		    usb_string(udev, buffer[5+p], unit->name, sizeof(unit->name)) < 0)
-			sprintf(unit->name, "Selector %u", buffer[3]);
+		uvc_entity_set_name(dev, unit, "Selector", buffer[5+p]);
 
 		list_add_tail(&unit->list, &dev->entities);
 		break;
@@ -1099,9 +1114,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		if (dev->uvc_version >= 0x0110)
 			unit->processing.bmVideoStandards = buffer[9+n];
 
-		if (buffer[8+n] == 0 ||
-		    usb_string(udev, buffer[8+n], unit->name, sizeof(unit->name)) < 0)
-			sprintf(unit->name, "Processing %u", buffer[3]);
+		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
 
 		list_add_tail(&unit->list, &dev->entities);
 		break;
@@ -1128,9 +1141,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		unit->extension.bmControls = (u8 *)unit + sizeof(*unit);
 		memcpy(unit->extension.bmControls, &buffer[23+p], n);
 
-		if (buffer[23+p+n] == 0 ||
-		    usb_string(udev, buffer[23+p+n], unit->name, sizeof(unit->name)) < 0)
-			sprintf(unit->name, "Extension %u", buffer[3]);
+		uvc_entity_set_name(dev, unit, "Extension", buffer[23+p+n]);
 
 		list_add_tail(&unit->list, &dev->entities);
 		break;
-- 
Regards,

Laurent Pinchart

