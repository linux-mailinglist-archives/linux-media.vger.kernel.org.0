Return-Path: <linux-media+bounces-45606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885AC0BB55
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 03:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A5A8A34A827
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 02:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB632224B0D;
	Mon, 27 Oct 2025 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wphd/FDn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9858C1553AA
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761533219; cv=none; b=sVLVKPWVTkXJRIxtk0ph3rdo49RyHQSJZA9J8Bk1dKzUmM9oHB+L04TGYaEeOnNWUWBRU1Pto7IpEV18B6zlIcrST9kbF98PlX73dyCVetfHRSV3RbUIrloBg48LIN8LH1/zj+XCIvw/HNvToDs51RM4e13qmzVA9OqAx5H1x6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761533219; c=relaxed/simple;
	bh=qFTrPn90mvKs9U2IAbWRu+cruiJhLFD6xtDe2w2FiQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PDxx4RrMSCNxecr9q+f57MY7eHDH5I/nCejcYZsoEXwxC0zQbCUyA/weykF64v0Od0WKjpOF/xp4wUnfJSFLVf10VJgSb+xl/vcXTZsR+5Mq2XakgGwQSo7mqLxOPV1oUCkPzWkK/EJ5g7+dR4mhkgOrRKD3vMpWXTMzJVUhHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wphd/FDn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 18E291122;
	Mon, 27 Oct 2025 03:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761533108;
	bh=qFTrPn90mvKs9U2IAbWRu+cruiJhLFD6xtDe2w2FiQk=;
	h=From:To:Cc:Subject:Date:From;
	b=wphd/FDnjTRCXx+fCHq9sLrkSVyJlPZyr3rQIRyE/UyFc92VR8ckTv+DY+5ScTIph
	 bru+U25EiTMFTsEKoKU/zk91Qry9ia9xn9UV8DJiqmKfeysyhL0vWwnK44crhCDoLb
	 YGcFCf5mxyBoJxrlVgfzTDB03bYK4rpxPBA7GaXg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH] media: uvcvideo: Create an ID namespace for streaming output terminals
Date: Mon, 27 Oct 2025 04:46:40 +0200
Message-ID: <20251027024640.7205-1-laurent.pinchart@ideasonboard.com>
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

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch should be merged on top of a revert of commit 758dbc756aad
("media: uvcvideo: Use heuristic to find stream entity"), once that
commit is merged in the -next branch of the media tree.

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
 drivers/media/usb/uvc/uvc_driver.c | 39 ++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h   |  3 ++-
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fb6afb8e84f0..aa3e8d295e0f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -165,8 +165,10 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
 	return NULL;
 }
 
-static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
+static struct uvc_streaming *uvc_stream_for_terminal(struct uvc_device *dev,
+						     struct uvc_entity *term)
 {
+	u16 id = UVC_HARDWARE_ENTITY_ID(term->id);
 	struct uvc_streaming *stream;
 
 	list_for_each_entry(stream, &dev->streams, list) {
@@ -810,10 +812,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
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
@@ -969,6 +973,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 	struct usb_host_interface *alts = dev->intf->cur_altsetting;
 	unsigned int i, n, p, len;
 	const char *type_name;
+	unsigned int id;
 	u16 type;
 
 	switch (buffer[2]) {
@@ -1107,8 +1112,28 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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
 
@@ -2105,8 +2130,8 @@ static int uvc_register_terms(struct uvc_device *dev,
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

base-commit: ea299a2164262ff787c9d33f46049acccd120672
-- 
Regards,

Laurent Pinchart


