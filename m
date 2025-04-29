Return-Path: <linux-media+bounces-31312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB47AA0C79
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2331B654DE
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDB52D1935;
	Tue, 29 Apr 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I8Zlxolk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA32C2ACB;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931557; cv=none; b=jNK00nGcxG/DwO9N1oxedV3Nxa7OQAhWD+GSBqBW/jA8C/zjzT+RhCw5jCULlBO7m2yWvowAdI59ufLoeDNqKMrz7oQC6d6wmTOOHUyKR4qlX/fqSn/II94zHIrrQXQ6Wb8+HqbOBh6wyhlyZ3DAnhxPY7KkxZbT8q2hcbDx+6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931557; c=relaxed/simple;
	bh=bHa9DyU5pY4KwqBVVlo7OhSDU5Z0nzs/MOBy8JAQCk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boNxrzcWmcbSrKGiRNN5VRc+fK4cc2OvRz9tn3cnq394emldX2PPelbJaEhSQlaf/dncb4Z0JV2acsqchjbszpQkhwQyjEhFfa376XAF3iJvLkodMEDN5BCHBiteTeyCGMcdY/k5H3IoUmgr+JKnONBGNuS3HF/WdC744XcassU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I8Zlxolk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64F5FC4CEE3;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1745931556; bh=bHa9DyU5pY4KwqBVVlo7OhSDU5Z0nzs/MOBy8JAQCk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I8ZlxolkPmnlRxzBImS4gkvuuZmnKUH3pwE+WkEhyPd77vJKJ4p5ugmwxZRnItG5U
	 qsnXgP8KZQZtRZa4PaSa6YrjLzSj0xVl5QgD8t3wp3GAQ3YCzkYVVxxFDhv/9hIauo
	 NWb8NEuCJmcPZX9RMGgCbWzX9ECU97snYSq720ro=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56723C3ABAF;
	Tue, 29 Apr 2025 12:59:16 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 29 Apr 2025 14:59:08 +0200
Subject: [PATCH v3 3/9] media: v4l2-flash: add support for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ov9282-flash-strobe-v3-3-2105ce179952@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931554; l=1581;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=bHa9DyU5pY4KwqBVVlo7OhSDU5Z0nzs/MOBy8JAQCk8=;
 b=hVLXrCC7H/khQgUUmgEY6fKTLCw2sfgTBSOK7fv5eNAhyCFTkDCcubJY6AF75MdxFRtdzZy2o
 yzE9BVZM+BTDwY3RokFPA6JAstT7f+XTi0dkNf5jgv//PoSkhrv764I
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
flash led class.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-flash-led-class.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 355595a0fefac72c2f6941a30fa430d37dbdccfe..963b549480f6eb3b9eb0d80696a764de7ffcc1a2 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -298,6 +298,12 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
 		 * microamperes for flash intensity units.
 		 */
 		return led_set_flash_brightness(fled_cdev, c->val);
+	case V4L2_CID_FLASH_DURATION:
+		/*
+		 * No conversion is needed as LED Flash class also uses
+		 * microseconds for flash duration units.
+		 */
+		return led_set_flash_duration(fled_cdev, c->val);
 	}
 
 	return -EINVAL;
@@ -424,6 +430,13 @@ static void __fill_ctrl_init_data(struct v4l2_flash *v4l2_flash,
 		ctrl_cfg->flags = V4L2_CTRL_FLAG_VOLATILE |
 				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	}
+
+	/* Init FLASH_DURATION ctrl data */
+	if (has_flash_op(fled_cdev, timeout_set)) {
+		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
+		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
+		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
+		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;
 }
 
 static int v4l2_flash_init_controls(struct v4l2_flash *v4l2_flash,

-- 
2.47.2



