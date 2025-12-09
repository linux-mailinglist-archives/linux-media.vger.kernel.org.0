Return-Path: <linux-media+bounces-48500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB06CB1555
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 23:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E12A9312E433
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 22:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFBA2F5A1A;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SU8k0VAI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8F2EC54A;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320292; cv=none; b=ZO8qhfo29KBFgg9Qx4NTFn9qldnE2fgaXeOME6LUpEzBNYG3yU6eNM281Oib7ZSvwluhv2jO/p78eeEk3wTIE5QHxCeg2MSKR62sk6w/C73h/QazZDgeCitiFUMfkOk92DAmCBwtGb/McyGXF8262yJnIsSvLVHhsZEJ4chtSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320292; c=relaxed/simple;
	bh=yRfk/k98fKVjF+oHG+UiWlyx+HP+Q2RBdionlRvUcH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wc05KEKj4zEFJJ9sAMB54JCGPnwqhRpr+4AVw/nNsUvqDSg+U+sv3W+LVTsIqgqmhnWnrittYpa4T481mxNT3dVgVdWWNnTjtMQ4e1bUD4+f7f66PwGiOrhjalTrBNvu7aBRkh024nLHmNeYTSAYpovWQq+1ZxjD5mDqeLxTS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SU8k0VAI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCA3AC19425;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1765320291; bh=yRfk/k98fKVjF+oHG+UiWlyx+HP+Q2RBdionlRvUcH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SU8k0VAI2O8jJjRDvllAX5pALhyxWIfOtuyXYInrnNKPm9+jbnvPLdgifETveLW+U
	 HB7nZufwtbGTMXRmoPibAe13KxVnO74j6Kok1VAI9DfSFFehL+oabSpTU/Wj3QYDtW
	 yIPrgSTIo/pRjxvRT8yM5UDeZcJGdmKTPM3MWZ4g=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F34D3B9AA;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 09 Dec 2025 23:44:38 +0100
Subject: [PATCH v10 3/8] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,STROBE_OE}
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251209-ov9282-flash-strobe-v10-3-0117cab82e2d@linux.dev>
References: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
In-Reply-To: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-a3fc8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765320290; l=3445;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=yRfk/k98fKVjF+oHG+UiWlyx+HP+Q2RBdionlRvUcH8=;
 b=uLLfwgOs6nP1LBJz2zpEUpNEu5VZGCQDQVavqwycYWwLJLm7XgfA0+ExEL2Im6fIIZv23oLMr
 4gF5voILNjiBRpREmO0SLRd6ZeQUlcTvOOn7B4Nzrq6pU5lzTM2bIGw
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add the new strobe duration and hardware strobe output enable to v4l
uAPI documentation. Additionally add labels for cross-referencing v4l
controls.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index d22c5efb806a1..7cf0d33e79ff0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
@@ -57,6 +57,8 @@ Flash Control IDs
 ``V4L2_CID_FLASH_CLASS (class)``
     The FLASH class descriptor.
 
+.. _v4l2-cid-flash-led-mode:
+
 ``V4L2_CID_FLASH_LED_MODE (menu)``
     Defines the mode of the flash LED, the high-power white LED attached
     to the flash controller. Setting this control may not be possible in
@@ -80,6 +82,8 @@ Flash Control IDs
 
 
 
+.. _v4l2-cid-flash-strobe-source:
+
 ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
     Defines the source of the flash LED strobe.
 
@@ -96,6 +100,12 @@ Flash Control IDs
       - The flash strobe is triggered by an external source. Typically
 	this is a sensor, which makes it possible to synchronise the
 	flash strobe start to exposure start.
+        This method of controlling flash LED strobe has two additional
+        prerequisites: the strobe source's :ref:`strobe output
+        <v4l2-cid-flash-strobe-oe>` must be enabled (if available)
+        and the flash controller's :ref:`flash LED mode
+        <v4l2-cid-flash-led-mode>` must be set to
+        ``V4L2_FLASH_LED_MODE_FLASH``.
 
 
 
@@ -186,3 +196,35 @@ Flash Control IDs
     charged before strobing. LED flashes often require a cooldown period
     after strobe during which another strobe will not be possible. This
     is a read-only control.
+
+.. _v4l2-cid-flash-duration:
+
+``V4L2_CID_FLASH_DURATION (integer)``
+    Duration of the flash strobe pulse generated by the strobe source, when
+    using external strobe. This control shall be implemented by the device
+    generating the hardware flash strobe signal, typically a camera sensor,
+    connected to a flash controller.
+
+    The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
+    must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
+    mode of operation. For more details please also take a look at the
+    documentation there.
+
+    The unit should be microseconds (µs) if possible.
+
+.. _v4l2-cid-flash-strobe-oe:
+
+``V4L2_CID_FLASH_STROBE_OE (boolean)``
+    Enables the output of a hardware strobe signal from the strobe source,
+    when using external strobe. This control shall be implemented by the device
+    generating the hardware flash strobe signal, typically a camera sensor,
+    connected to a flash controller.
+
+    Provided the signal generating device driver supports it, the length of the
+    strobe signal can be configured by adjusting its
+    :ref:`flash duration <v4l2-cid-flash-duration>`.
+
+    The flash controllers :ref:`strobe source <v4l2-cid-flash-strobe-source>`
+    must be configured to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL`` for this
+    mode of operation. For more details please also take a look at the
+    documentation there.

-- 
2.47.3



