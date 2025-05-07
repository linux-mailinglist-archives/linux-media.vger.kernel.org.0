Return-Path: <linux-media+bounces-31926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8883AAAD915
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F4AD1892A4A
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D534C2236F4;
	Wed,  7 May 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PGMt9oQO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A7221714;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=RKH7OJhaW/do5tUafbalobg+oSTFb01XHOuNxSQdGnmz3IIqLCKJym3+mQyALIDHK7PMLx2IY/JyMZaHJJ8mcO6U2NiabE6ZhfCh9LVY6rIbvDRr3vbxIH+/0kfmApmXRpKHXEwdYPxTHBXTPNXKEvyUIwmhLnzrYGAydQQYBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=8vJtoHTUTJrvONHO5vnxfREHXCoupGjqP9LZtMbdTp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mru9ZFJupZpu6+QBdIm246g/3YNEbFtVnKqIgYEP9jtLAZdn/qHcR0vTBXqSF4i9KeHF3IfBD4Ml05Gk4ODUGWGJYOwP00gQs7gVpwZ00uvVkDTY4Qu3V5A++u5nH5glzmEUz/6RjGC8eQ75aVVa/RgDRJ4/kSqODX96zJ9ccTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PGMt9oQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF1CC113D0;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604342; bh=8vJtoHTUTJrvONHO5vnxfREHXCoupGjqP9LZtMbdTp8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PGMt9oQOsYotDBMsn7k486+WMP5WTS84j7pDuFbS35v3uPj8uV46xVLj2tR5m/HEv
	 b+0exnAtZsjcAoy2RYIh3YZCJ+pFft3zIMjak4w4uSVuqV1vi77cRfz64nmwxwOYwL
	 SzouXkWG3jIhEc82XnGlrUKrabnewuRxwSi1FkjA=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8067C3ABC6;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 07 May 2025 09:51:38 +0200
Subject: [PATCH v4 09/10] media: i2c: ov9282: add strobe_source v4l2
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ov9282-flash-strobe-v4-9-72b299c1b7c9@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=1686;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=8vJtoHTUTJrvONHO5vnxfREHXCoupGjqP9LZtMbdTp8=;
 b=E2JTQ4G5ISf8J+ZKkw1SGv3NDaPKG+xpsxVH4/leWk99GZAKugTPnIkldfWZKDFoLfftzorYx
 /jPLVRjZTXrAG12ZOmNS/C2KL9YDeIDnIu8eITOyobyCMUpJsackX5D
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add read-only V4L2_CID_FLASH_STROBE_SOURCE control. Its value is fixed
to V4L2_FLASH_STROBE_SOURCE_EXTERNAL as the camera sensor triggers the
strobe based on its register settings.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 0bbdf08d7cda8f72e05fdc292aa69a4c821e4e03..09d522d5977ec6fb82028ddb6015f05c9328191d 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1368,11 +1368,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
 	const struct ov9282_mode *mode = ov9282->cur_mode;
 	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl *ctrl;
 	u32 hblank_min;
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
 	if (ret)
 		return ret;
 
@@ -1447,6 +1448,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
 			  0, 13900, 1, 8);
 
+	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
+				      V4L2_CID_FLASH_STROBE_SOURCE,
+				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL,
+				      ~(1 << V4L2_FLASH_STROBE_SOURCE_EXTERNAL),
+				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.2



