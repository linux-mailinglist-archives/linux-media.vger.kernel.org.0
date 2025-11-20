Return-Path: <linux-media+bounces-47520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C68C75920
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 18:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 165E54E360A
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5884036E576;
	Thu, 20 Nov 2025 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xDwB1pAz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B636C5B8;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658270; cv=none; b=QcCMxZL6amNMDFhfnvAxrLd2rkGNE8pe0NpgpToTbDOyjHQRjDCX3VuNFV2f4y83IKCOQmYX6NIU1DvlWuFkEqjlJZXNbb3GCMCzKQbP651gPIQGLLiDA3ab65ukB3RaIV0lr2bdnlBzP2FV+OWs90z8SDJso7h6QZN8SBQauDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658270; c=relaxed/simple;
	bh=tBekpthiQ63+sVQeAxYqbIcCsnnV2MHwSMvelKk34hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSaHQl/9A8vX00rNiw+VCrTF5MmmQyxoaxYQ2a9Y7Qzm6igEsABst2euQ6TcHxaExDnlF8aU65TvR9FrNXUicsvAwE5pp5eWEKvCsghQWuQpuhz6IzhXbzFm3JT3zXl2TVG1ydGon+vV5QfnDEooAOk1qSZTLb8WyMctsdJy27A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xDwB1pAz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 015DAC19423;
	Thu, 20 Nov 2025 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1763658270; bh=tBekpthiQ63+sVQeAxYqbIcCsnnV2MHwSMvelKk34hk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=xDwB1pAzVWOp0Iu3B26ifqSwOlL1Tn7cLp/JJTKwapRsuqVC7Ggx/BSwpsHSFMD5S
	 LRfY2j2JUDN31fwmjvw6LUG/PR3vznsg9IUzl3WYT63pnD8GomYVTwlPhTbzOxOepE
	 7ZhGqMehkjqgLsK2NT25FH6bllYRXI0ksLTKRp00=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D9CCF9C67;
	Thu, 20 Nov 2025 17:04:29 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Thu, 20 Nov 2025 18:04:23 +0100
Subject: [PATCH v9 3/8] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,STROBE_OE}
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-ov9282-flash-strobe-v9-3-6c9e3a4301d7@linux.dev>
References: <20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev>
In-Reply-To: <20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-a3fc8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763658268; l=3443;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=tBekpthiQ63+sVQeAxYqbIcCsnnV2MHwSMvelKk34hk=;
 b=PrF3n1h9n7HI1En9GXwytLNh/GG8DiYMLV9mlLVe8MGCr3t0l5rPgsFe6WiYT1je1/pATjoQo
 rMADjuvZ4L+AiKM9fcNjuIUr+xssPToHDu7ZY04ydl7RyqDiphXC88J
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
index d22c5efb806a..7cf0d33e79ff 100644
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



