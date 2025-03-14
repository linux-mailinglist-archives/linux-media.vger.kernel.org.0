Return-Path: <linux-media+bounces-28184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A3A60C1E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF1FA17F723
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F2E1DE89E;
	Fri, 14 Mar 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="0WT5bSfo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D681C863D;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942205; cv=none; b=iewsSsHmVIk6KaNZLULBBqAdr6oj89Xohn55pLF0yJEGdX6sXU85JeO/a+ae4F2qo92Gg/ZfIHpudYOiULZwJPIZ2SuzHGuayaM+pfXnzgT4HRAChI/6tKH1WsWAn8m8c61ce+It6Kgx+U5eqIFTMTY50mZ20OaV8vNHBofdXqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942205; c=relaxed/simple;
	bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDmXU/5fRVjMha/0PFI3pDoLRZUss96gcykusbxNKc9KCsr82xtzgD3wKVRAp2xiy5Tg3b/hIBAkZczOXR1VKVbsYrwv+BTYvg0ttdFYTCbfRg/dfl6F21dZ8Xd86xlRI+yeli8r9Tjet/riRvo2rssEr+p3zeqXAPFIIteBY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=0WT5bSfo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 425CAC4CEF0;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741942205; bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=0WT5bSfoIWPxDCpD8kyeIwFBHlv3tMWwOFEOA0iIO5uWxI+iohSgbSmVDTKLdio9h
	 kukBAzBpJBpkiYv9veH4lYBVWur/QWHIk4/EJVlBHsNzxy9gfk+04zWnYMzmnILSzf
	 iKKNCM6tzUeSH6BFgnKkviNf9aihhhp+5sj6s6oc=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35601C28B2F;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Fri, 14 Mar 2025 09:49:57 +0100
Subject: [PATCH v2 3/8] media: v4l2-flash: fix flash_timeout comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-ov9282-flash-strobe-v2-3-14d7a281342d@linux.dev>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
In-Reply-To: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741942203; l=878;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
 b=YAuvxJYLMgYdFE3YQnHK45vsJdZYwF8OsncSzUcOKxHZc/FLTZYTLZbuGP4HTq9O/Qtl33kgB
 Iz7MZpZ+nkYA0ft1JRvYE1mV+pu+FJmThb9GuRjpxMwQBiybe4eMO3B
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



