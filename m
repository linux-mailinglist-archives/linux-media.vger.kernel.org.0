Return-Path: <linux-media+bounces-31315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D65AA0C84
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BDB6484F1C
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804BA2D29C7;
	Tue, 29 Apr 2025 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IO9CMbZJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826AE2D0291;
	Tue, 29 Apr 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931557; cv=none; b=iMFi/6BUk6XR1Jbmy84LUV0qMKT7Ff1Kf6vjDGw2PW9MYzfOnjhAa+nowqlLB6IP+zOcUDcQfLMhfh4YmOlc+4kDfbVDk3/pIuHv/ukRW+buxoLjUqXOtxTNWi949Cy1kacEYbaLiH2IKbuTwmv5Xv7ZrlZZZj1aFQgWTDo00Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931557; c=relaxed/simple;
	bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsUDxYxYbN9F/AMQ8jmBm8ucCaeCw7F83NHKmRDE07jlBHUqeOz8SZkpxfQ8kd4LF3dC5SrdzPg86Ip5Vft7AMHN3auYXZ4uWcreqELPcb/aT619od7n2loxy7OAcbb8gMQJWhFRcdARLmlrzdGRsgdYHKjCr2D7uno8WL9BCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IO9CMbZJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70CD8C113D0;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1745931556; bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IO9CMbZJhk2C+zZaHkRnoUfv64mmmJJWv/w5SnS2Dsv7nF+vzxf2p6jy7ElPizJfp
	 R4br8lWuwtYkkz/dP+pO3m6o8QjhSws1a7OchYXH5GXZQjENRO+2brN7VJDPeauoW1
	 c792UomRuYVRILHsOvzDR03zW5rm4uWzWPvfRcOE=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63503C3ABB3;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 29 Apr 2025 14:59:09 +0200
Subject: [PATCH v3 4/9] media: v4l2-flash: fix flash_timeout comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ov9282-flash-strobe-v3-4-2105ce179952@linux.dev>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
In-Reply-To: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931554; l=878;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
 b=Vq8RYyKXTeDizbDIP7IUbAZFqHkLZBZKwFKb49hINPfxPyE8rYPfI2bTUFxoo8MoEliN3pWnG
 Fft5ZyMMDSPCKz+khm2gLoRnlV+FYf4fxgAgaVv5IJgEzrmHfWYSa9S
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

The comment for the flash_timeout setter mentioned it is the "flash
duration". Fix this by changing it to "flash timeout".

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 include/linux/led-class-flash.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21ec856c36bc67decda46aa8ff1c040ffdcf1181..775a96217518936633541c7a5d394502dbf04f83 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -197,7 +197,7 @@ int led_update_flash_brightness(struct led_classdev_flash *fled_cdev);
  * @fled_cdev: the flash LED to set
  * @timeout: the flash timeout to set it to
  *
- * Set the flash strobe duration.
+ * Set the flash strobe timeout.
  *
  * Returns: 0 on success or negative error value on failure
  */

-- 
2.47.2



