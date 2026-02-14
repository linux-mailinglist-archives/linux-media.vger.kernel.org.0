Return-Path: <linux-media+bounces-52797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CELNAdjKj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:07:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF5B13A7D7
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57BC230D22A7
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5510822154F;
	Sat, 14 Feb 2026 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4gf8YrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD75194098;
	Sat, 14 Feb 2026 01:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031096; cv=none; b=QHtV2AGJgW7gsmIcTHwFjO5Bdy0Ex3RuGx0JlzkdF35FKyxPfLuUCL6BduCrUxBexU938OWiXNjQqrN1wyQ0Fz/4bR2swHYRHwkJZUyFxwPBml0vW3yDapfSww2QgHDYwpJNdeIlv487h9iLBe6A9XFCUhX2wfB6ozY/dRZ4AxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031096; c=relaxed/simple;
	bh=/TTtgSTYlHtOVL08vZ4dDy1Te2t2rTpZJILELC3treU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVLhdjAIgooCMq4CHrQMqQmfM7fZ/G+s9miTV10LqJfvDksji0ntvSMrLJE86FC/M9x0/P4MAZAbjClMKo1iibifbUP7IRb/l2mgSmIe3JWpdQYLGEUujIyma8t2YD8XtSZrtWzAxl7ygtJg+wagUZ2O+zbGZnNuqBBrgkmt8Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4gf8YrZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E65C116C6;
	Sat, 14 Feb 2026 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031096;
	bh=/TTtgSTYlHtOVL08vZ4dDy1Te2t2rTpZJILELC3treU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r4gf8YrZcyalJIPjRNJCGjgi9aO7+pKCU+v+tGlVmGSd7mL+6uNmaifoaTtDuFAQ5
	 8VDofcB841Lrs5rvUOeIG4h0OhqZAlxJy4+L0ueEyi5X+6PpxmcrSQIDZNmqb35HRP
	 cbRBbOwia56BrWDKnJPuOBWDQhkysFKZgeT2jD8gsEB4N0JqQit+7mTsGj8X4O8+g4
	 /KYlTlyvPOgC8JzvxXCrGSlWcRWB1oaYpmbXOKjTIt1a6Q33FBnCUUKo7vU9ug2O6J
	 J0VFsgDP9As47sNhXUbV80rUgP8VIztbyVj2pOeQy0Pw7Ul6HpiBwdxyzRqhlqdNUc
	 jEOMGgdU8cPdQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lili Orosz <lily@floofy.city>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	hansg@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] media: uvcvideo: Create an ID namespace for streaming output terminals
Date: Fri, 13 Feb 2026 19:59:00 -0500
Message-ID: <20260214010245.3671907-60-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52797-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,msgid.link:url,uvc_entity.id:url,chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9CF5B13A7D7
X-Rspamd-Action: no action

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 3d9f32e02c2ed85338be627de672e2b81b88a836 ]

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
Link: https://patch.msgid.link/20251113210400.28618-1-laurent.pinchart@ideasonboard.com
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

### Risk Assessment

**Benefits**:
- Fixes webcam functionality for devices with entity ID collisions
  (Grandstream GUV3100, LSK Meeting Eye, potentially others)
- Provides a cleaner, more robust solution than the heuristic approach
  in 758dbc756aad
- The approach is well-motivated by the UVC spec (streaming output
  terminals have no controls and are terminal nodes)

**Risks**:
- Medium complexity - it's not a trivial one-liner, but the logic is
  well-contained
- If 758dbc756aad is already in stable, this commit effectively replaces
  it, which is the intended behavior
- The namespace bit approach could theoretically break something if any
  code path uses entity IDs for streaming output terminals in unexpected
  ways, but the commit message and review argue convincingly this
  doesn't happen

**Dependencies**:
- This commit depends on `0e2ee70291e6` ("Mark invalid entities with id
  UVC_INVALID_ENTITY_ID") being present
- It also implicitly reverts `758dbc756aad` which was sent to stable
- Both of these are likely in recent stable trees given the `Cc: stable`
  tag on 758dbc756aad

### Conclusion

This commit fixes a real device compatibility bug that breaks webcam
functionality for specific hardware. The previous fix (758dbc756aad) was
already sent to stable with `Cc: stable`, and this commit is its proper
replacement. It's developed and reviewed by the UVC subsystem
maintainers, tested by users, and contained entirely within the UVC
driver. The approach is sound - leveraging the fact that streaming
output terminals have properties that make a separate ID namespace safe.
Since the heuristic fix (758dbc756aad) is likely already in stable trees
and this is the proper/robust replacement for it, it should also go to
stable.

**YES**

 drivers/media/usb/uvc/uvc_driver.c | 54 ++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h   |  3 +-
 2 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ee4f54d683496..aa3e8d295e0f5 100644
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
index ed7bad31f75ca..3f2e832025e71 100644
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
-- 
2.51.0


