Return-Path: <linux-media+bounces-47019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A6647C5A0E1
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 22:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E94D0356752
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 21:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38962F6582;
	Thu, 13 Nov 2025 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R4xiIsZd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2372F5311
	for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 21:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763067859; cv=none; b=T9PaVxSWHE9smqSg1C3wlUSu/HD8vlqDXgbE6A/RhVjGC6jjHMthiGik4gu7KzNN6peJigGuviTUKV4rvrceOyuJoe++hqJ5ZYDeJvO3rrFr7f+15QPlloEPsBGagc4OrKxmX9kxrkDm9w56jr3hY6yzqjYkT/RLu5RHHZJytD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763067859; c=relaxed/simple;
	bh=6AVYao2iwJafhgW7lrO+gPL0uztrCDncIErDM5/MKyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VK1y82V6kpu1q7/J0ipyCaYUec++aly1J07aBWk84dZmpT5O7CcLQh336hf1RF4Iq4YUlZtY8IUhgsg/Cz/tPndg2W9qG+rDMtBzecMs2GyJhZxB4TIY3QBGzBFnL7w0B5vaRYaj3aPnYEQuAHLsG+WDuktjTfwAHbhYWxQznhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R4xiIsZd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D8558C67;
	Thu, 13 Nov 2025 22:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763067732;
	bh=6AVYao2iwJafhgW7lrO+gPL0uztrCDncIErDM5/MKyE=;
	h=From:To:Cc:Subject:Date:From;
	b=R4xiIsZdJ1iibjY1XO/5YKyCcvgEjUAeQNCl2UoybnggbijFKuX0HJeIlgYSsTDCA
	 CiMzeZK4mIq1bJ4dn/cUEu7oboKKKUySd0U7mJp669lkWY5VrjJFgJVhvviaMhWOI2
	 KhT4NqhPd0CD3dhHBRg090JsMcEMaC+Tm/PjSewQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Hans de Goede <hansg@kernel.org>,
	Lili Orosz <lily@floofy.city>
Subject: [PATCH v4] media: uvcvideo: Create an ID namespace for streaming output terminals
Date: Thu, 13 Nov 2025 23:04:00 +0200
Message-ID: <20251113210400.28618-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

Some devices, such as the Grandstream GUV3100 and the LSK Meeting Eye
for Business & Home, exhibit entity ID collisions between units and
streaming output terminals.

The UVC specification requires unit and terminal IDs to be unique, and
uses the ID to reference entities:

- In control requests, to identify the target entity
- In the UVC units and terminals descriptors' bSourceID field, to
  identify source entities
- In the UVC input header descriptor's bTerminalLink, to identify the
  terminal associated with a streaming interface

Entity ID collisions break accessing controls and make the graph
description in the UVC descriptors ambiguous. However, collisions where
one of the entities is a streaming output terminal and the other entity
is not a streaming terminal are less severe. Streaming output terminals
have no controls, and, as they are the final entity in pipelines, they
are never referenced in descriptors as source entities. They are
referenced by ID only from innput header descriptors, which by
definition only reference streaming terminals.

For these reasons, we can work around the collision by giving streaming
output terminals their own ID namespace. Do so by setting bit
UVC_TERM_OUTPUT (15) in the uvc_entity.id field, which is normally never
set as the ID is a 8-bit value.

This ID change doesn't affect the entity name in the media controller
graph as the name isn't constructed from the ID, so there should not be
any impact on the uAPI.

Although this change handles some ID collisions automagically, keep
printing an error in uvc_alloc_new_entity() when a camera has invalid
descriptors. Hopefully this message will help vendors fix their invalid
descriptors.

This new method of handling ID collisions includes a revert of commit
758dbc756aad ("media: uvcvideo: Use heuristic to find stream entity")
that attempted to fix the problem urgently due to regression reports.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Lili Orosz <lily@floofy.city>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Squash with revert of commit 758dbc756aad ("media: uvcvideo: Use
  heuristic to find stream entity")

Changes since v2:

- Improve commit message and comment block

Changes in v2:

- Change Macro name
- Apply quirk only to TT_STEAMING
- Add missing suggested by
- uvc_stream_for_terminal
- Note, v2 has not been tested yet in real hardware, only v1.
- Link to v1: https://lore.kernel.org/r/20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org
---
 drivers/media/usb/uvc/uvc_driver.c | 54 ++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h   |  3 +-
 2 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ee4f54d68349..aa3e8d295e0f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -165,28 +165,17 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
 	return NULL;
 }
 
-static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
+static struct uvc_streaming *uvc_stream_for_terminal(struct uvc_device *dev,
+						     struct uvc_entity *term)
 {
-	struct uvc_streaming *stream, *last_stream;
-	unsigned int count = 0;
+	u16 id = UVC_HARDWARE_ENTITY_ID(term->id);
+	struct uvc_streaming *stream;
 
 	list_for_each_entry(stream, &dev->streams, list) {
-		count += 1;
-		last_stream = stream;
 		if (stream->header.bTerminalLink == id)
 			return stream;
 	}
 
-	/*
-	 * If the streaming entity is referenced by an invalid ID, notify the
-	 * user and use heuristics to guess the correct entity.
-	 */
-	if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
-		dev_warn(&dev->intf->dev,
-			 "UVC non compliance: Invalid USB header. The streaming entity has an invalid ID, guessing the correct one.");
-		return last_stream;
-	}
-
 	return NULL;
 }
 
@@ -823,10 +812,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
 	}
 
 	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
-	if (uvc_entity_by_id(dev, id)) {
-		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
+	if (uvc_entity_by_id(dev, UVC_HARDWARE_ENTITY_ID(id)))
+		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
+			UVC_HARDWARE_ENTITY_ID(id));
+
+	if (uvc_entity_by_id(dev, id))
 		id = UVC_INVALID_ENTITY_ID;
-	}
 
 	extra_size = roundup(extra_size, sizeof(*entity->pads));
 	if (num_pads)
@@ -982,6 +973,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 	struct usb_host_interface *alts = dev->intf->cur_altsetting;
 	unsigned int i, n, p, len;
 	const char *type_name;
+	unsigned int id;
 	u16 type;
 
 	switch (buffer[2]) {
@@ -1120,8 +1112,28 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return 0;
 		}
 
+		id = buffer[3];
+
+		/*
+		 * Some devices, such as the Grandstream GUV3100, exhibit entity
+		 * ID collisions between units and streaming output terminals.
+		 * Move streaming output terminals to their own ID namespace by
+		 * setting bit UVC_TERM_OUTPUT (15), above the ID's 8-bit value.
+		 * The bit is ignored in uvc_stream_for_terminal() when looking
+		 * up the streaming interface for the terminal.
+		 *
+		 * This hack is safe to enable unconditionally, as the ID is not
+		 * used for any other purpose (streaming output terminals have
+		 * no controls and are never referenced as sources in UVC
+		 * descriptors). Other types output terminals can have controls,
+		 * so limit usage of this separate namespace to streaming output
+		 * terminals.
+		 */
+		if (type & UVC_TT_STREAMING)
+			id |= UVC_TERM_OUTPUT;
+
 		term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
-					    buffer[3], 1, 0);
+					    id, 1, 0);
 		if (IS_ERR(term))
 			return PTR_ERR(term);
 
@@ -2118,8 +2130,8 @@ static int uvc_register_terms(struct uvc_device *dev,
 		if (UVC_ENTITY_TYPE(term) != UVC_TT_STREAMING)
 			continue;
 
-		stream = uvc_stream_by_id(dev, term->id);
-		if (stream == NULL) {
+		stream = uvc_stream_for_terminal(dev, term);
+		if (!stream) {
 			dev_info(&dev->intf->dev,
 				 "No streaming interface found for terminal %u.",
 				 term->id);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ed7bad31f75c..3f2e832025e7 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -41,7 +41,8 @@
 #define UVC_EXT_GPIO_UNIT		0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID		0x100
 
-#define UVC_INVALID_ENTITY_ID          0xffff
+#define UVC_HARDWARE_ENTITY_ID(id)	((id) & 0xff)
+#define UVC_INVALID_ENTITY_ID		0xffff
 
 /* ------------------------------------------------------------------------
  * Driver specific constants.

base-commit: d363bdfa0ec6b19a4f40b572cec70430d5b13ad6
-- 
Regards,

Laurent Pinchart


