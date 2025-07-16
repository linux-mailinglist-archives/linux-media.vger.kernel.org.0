Return-Path: <linux-media+bounces-37848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A98B0712F
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 858DA16E99B
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00462F272D;
	Wed, 16 Jul 2025 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e+UQZq50"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1C2F0043;
	Wed, 16 Jul 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656849; cv=none; b=KVPPLAIi91TQpN/OB4bg1pIo9ftQBHAJX22Le0I0tzrMk1gZg5H15vYctY8Q5UsWEhuGsHXjwOPZIPG5rzAiC+h9mOg2CUNY5W2/k4ldYZXwZ9hsYY8cVhoG/AIS/O7cnj0R6AH64LQmFf1K/vdQQRgunfMysX+44y0JSVSFrEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656849; c=relaxed/simple;
	bh=lJUA/HTTIB5OPd67y2vtLKCQ0ts0kps9jsdTJGZwJyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMDM0Y69t1aBHrMfLeMSm/Y26fs8AtgIPbyQ/EeRSRQjcMbNnnY/fszZ2ZohUND3iR3js6cUQn/bIu1hXucMi8lZLkGHHf8cSatdyLCSsqJc1/95rShk/p75cKd19H7pIY+wIiQbZqj4QgY4fIu+bt+SGBfNxQYpc4SsZMth72w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e+UQZq50; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B79C6C113D0;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1752656848; bh=lJUA/HTTIB5OPd67y2vtLKCQ0ts0kps9jsdTJGZwJyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e+UQZq503SrHrerIHJeO14RQVxMPFxeSfQ+OMMBuOAsoHn5NlQvMxWjWwVktagrRU
	 cg+ztK8a6GevrOZgviSJT3++n5ayUY+O7WOSafrP67geUvhiyVXDEzTD9iK3qXLis8
	 OWz/cx+puPPJhhkjKP4QL7ByPrtYX9vidKZBES9g=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA34C83F35;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 16 Jul 2025 11:06:55 +0200
Subject: [PATCH v6 05/11] Documentation: uAPI: media: add
 V4L2_CID_FLASH_HW_STROBE_SIGNAL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250716-ov9282-flash-strobe-v6-5-934f12aeff33@linux.dev>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
In-Reply-To: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656846; l=1182;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=lJUA/HTTIB5OPd67y2vtLKCQ0ts0kps9jsdTJGZwJyk=;
 b=fgleXUKtAWZqXdfokkA0eBdArbpobxJ1udxoGb1AqOJYHsBbOpTldfB36V1u4A7tSEODoDGeR
 OxvfJ0g4Z9wCGcPDWTfYitJ/ReFtGYA6NMO3BnyPiGb3R1j8VzgoVDJ
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add new hardware strobe signal control to v4l uAPI documentation.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index 03a58ef94be7c870f55d5a9bb09503995dbfb402..af43e7329cb77cf952b8996cd8c5384eae08c3fc 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
@@ -191,3 +191,9 @@ Flash Control IDs
     Duration the flash should be on when the flash LED is in flash mode
     (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (µs)
     if possible.
+
+``V4L2_CID_FLASH_HW_STROBE_SIGNAL (boolean)``
+    Enable or disable the output of a hardware strobe signal. This is typically
+    set on a sensor that provides a hardware strobe output which is connected
+    to a flash device/LEDs. The flash device should then be configured to use
+    an external strobe source (V4L2_FLASH_STROBE_SOURCE_EXTERNAL).

-- 
2.47.2



