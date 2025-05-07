Return-Path: <linux-media+bounces-31925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE6AAD90E
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6267C1BA2004
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF95221FAA;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B1vmsQRK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D167221291;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=mIEy2SQb0/Y6CVYjq4rlXnARp2/JoiX/pbFIUaf6tBTkCyNy5yquf/g5n4OAh62rD99G3oWHqIW09oveBxcVDfAPK0p0xS62sG4+pcf5zvSmIY4J9WcMQx2llGKp1rXW1HYiLU2H7tIpFM1QM+AvfR3lyQan5+MNGsX/eyrAzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ut+k9vFeI3iTtaIvpxzXAaeoqHeLq3XsLNIzH7+uUbjfPqgAPmt6rGoi+sFr749gBA0maDwvNZkvZE1FgQAlFKoF96t5zbvB1aRrxwfqT3tk8m74SQyU+nGFhQ8Tvln+UAYsXOg/Kp0G3eJ2GLYLL52QlMui4FBubMlnhT8H1NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B1vmsQRK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7EA8C4CEF1;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604341; bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B1vmsQRKT5UJb1lRFC1PRFDgDduKUgj9imFffCj9TTmmrFXPfUlehLJC0z8VStTcC
	 HRsh2EBLX90MQCJHmOTjIysEOwR3KSO5oT9Nmk/XAwAgC5EY4B5C0ATyLLOg/cc2xX
	 9gSTG6Usd+KkgAXJzOYNdD/2scKHQHYAS8tcyKxQ=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3F5C3ABC6;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 07 May 2025 09:51:33 +0200
Subject: [PATCH v4 04/10] media: v4l2-flash: fix flash_timeout comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ov9282-flash-strobe-v4-4-72b299c1b7c9@linux.dev>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
In-Reply-To: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=878;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
 b=b2Nu8Rc5xjROLfjqidwVk6M111UQMbP4ju6/jmlZi4aCroekRypMRf54JGKcAOzlwN4LmC0a2
 R5aMxYdUac9DWdDxNqwee9VzCOlRqZlcvZpxX+OWOdpW9qrwepzz0bX
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



