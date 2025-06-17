Return-Path: <linux-media+bounces-35026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 900FBADC35E
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B811C3B961A
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B62828FA93;
	Tue, 17 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PL9s16Jj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D631DF269;
	Tue, 17 Jun 2025 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145503; cv=none; b=l8/or2e0SSTNq+0bb8X5tzI9nmU/AsZzmZlabnijfvi+JrwscYBwropb7uC/Rx8FNURKooNr3jdp9/qsMZlxbdFYTSzjjvGmltlBWyjNvIYwWQR8c0YE/H2YJc1LCzbSU+EW9HgX42wOB5Y/MzsMF4SGT81L9Wnt2SaM2PURMC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145503; c=relaxed/simple;
	bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgqQw9wyIQoKpz45eYMxibWGAVt0fV3/OMKVUfDVhsGf/I+zT3IfMfRZY/Hwtq4IPh7sx/+7pikWhlfq7mMwiyKT6rrYZNGC/BBO4vsiqKdUYgnDqnTCXq0DyZ79jzNxzfzd7H1wGvOQpxKVesKAohfYGbhTP0mdRtLNPFxL1eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PL9s16Jj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1744C4CEF0;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1750145502; bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PL9s16JjyRvKIYWjase40Bs4Ka11Fm5EgK28szx2xE+e8KLno+2E5XiCx1W60ogRo
	 4NKwALHMGsq9W0k4iUZAVdlH/dtX2DAQrP/+GiQfpEAZgl5u+Giv0secRCH5FTj5J9
	 /Mvtl06RKApT1DA0qb5VmkQAwNKT6JMA7FB9gt+s=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28BEC71136;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 17 Jun 2025 09:31:37 +0200
Subject: [PATCH v5 03/10] media: v4l2-flash: fix flash_timeout comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-ov9282-flash-strobe-v5-3-9762da74d065@linux.dev>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
In-Reply-To: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750145501; l=878;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=8XoXfLI3glbsttjIv49MTkNU8w73Ts/XjbKrGmMzkd0=;
 b=nPouAY8N5zq1XIMQ6rZ1Q6GzebMfWi0D9HB7LZ8Xg6r4imr5Qm6mrjxTs9/UdOwDbDXkp1HJu
 W2Ze+5AQ3w7Ax3ibt1oJ/EgVjSr7MfgqeyTvsYMveLRaGLiDCNQ1LyF
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



