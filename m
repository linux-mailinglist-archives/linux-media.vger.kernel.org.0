Return-Path: <linux-media+bounces-41450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6931FB3E891
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4204F44804C
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECFA34AB1C;
	Mon,  1 Sep 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N5tD7WOt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071283451AF;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739147; cv=none; b=YGwv0xX7Tj4H/thLZ+Pdzl9J/0CivG2CcfcuAG2nOWTtEHmxLXAT66GVmliDn0LAl+BLPgz3W+UPwjMpJS0QrrBGprmptRkzgJvePodDviWF9WrjNAgW6wxuZrzsqWER0kTES5YrwtzLSaxF+kmoUyKiPuxLVuCbZbDmfzb+Dn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739147; c=relaxed/simple;
	bh=7gQgghgArSKAOenBb3HDylNmZEFi8UoXEoVb822GcB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhgtOkZigjkMjNypRJlNQ62tM+6iP+LBZXPEP1wnocvl1kev39P6N11b5982vJ+MlgX6DxKqIlDcnh6XxykUu4XjSKieTy/XJNSz40XP7ObnG9iq6U+Mq8Rq8Q+gwpxydvMmJK4+xkSZR0Ei451k4Ikyc7FeRsEQzIG8Y3nlyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N5tD7WOt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B82C9C4CEFC;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1756739146; bh=7gQgghgArSKAOenBb3HDylNmZEFi8UoXEoVb822GcB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N5tD7WOt2HLiGVypFiA5Kq0R/l5/dHnupfrp0CzY+aivDGvW8/uL4eQSg9c67D1FS
	 0RIUjt/wXMx97KgIpRdtn+VyCEWjbBh8EYrInufXQdjyeN8G6hNnB/xTJDkYhzyU7e
	 XBY63T7lDcyfX/pTjRmy03qS+R9z8u5cZMJ8CcwQ=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03F2CA100A;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 01 Sep 2025 17:05:09 +0200
Subject: [PATCH v7 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250901-ov9282-flash-strobe-v7-4-d58d5a694afc@linux.dev>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
In-Reply-To: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756739145; l=2808;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=7gQgghgArSKAOenBb3HDylNmZEFi8UoXEoVb822GcB8=;
 b=QiZKbRQCY/y7P1uLBfJKJQwuefOTmX/uyFOBUDr8tA8D+aBoLRhiO3DvI8crM9Jo3aDs7Tchs
 I/RXLojlh+tC3oCRSTmrqebkAYQn8Fh5PtCw37IcB8FEUScS/B6UrOd
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add the new strobe duration and hardware strobe signal control to v4l
uAPI documentation. Additionally add labels for cross-referencing v4l
controls.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index d22c5efb806a183a3ad67ec3e6550b002a51659a..6254420a8ca95929d23ffdc65f40a6e53e30a635 100644
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
 
@@ -186,3 +190,28 @@ Flash Control IDs
     charged before strobing. LED flashes often require a cooldown period
     after strobe during which another strobe will not be possible. This
     is a read-only control.
+
+.. _v4l2-cid-flash-duration:
+
+``V4L2_CID_FLASH_DURATION (integer)``
+    Duration of the flash strobe pulse generated by the strobe source,
+    typically a camera sensor. This method of controlling flash LED strobe
+    duration has three prerequisites: the strobe source's
+    :ref:`hardware strobe signal <v4l2-cid-flash-hw-strobe-signal>` must be
+    enabled, the flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
+    must be set to ``V4L2_FLASH_LED_MODE_FLASH``, and the
+    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be configured to
+    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
+    if possible.
+
+.. _v4l2-cid-flash-hw-strobe-signal:
+
+``V4L2_CID_FLASH_HW_STROBE_SIGNAL (boolean)``
+    Enables the output of a hardware strobe signal from the strobe source,
+    typically a camera sensor. To control a flash LED driver connected to this
+    hardware signal, the :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
+    must be set to ``V4L2_FLASH_LED_MODE_FLASH`` and the
+    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be set to
+    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. Provided the flash LED driver
+    supports it, the length of the strobe signal can be configured by
+    adjusting its :ref:`flash duration <v4l2-cid-flash-duration>`.

-- 
2.47.2



