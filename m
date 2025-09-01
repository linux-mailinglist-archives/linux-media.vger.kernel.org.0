Return-Path: <linux-media+bounces-41455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2675B3E8A1
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D22B1A87703
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DA735085A;
	Mon,  1 Sep 2025 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BSa17T9r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AFB34A33E;
	Mon,  1 Sep 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739147; cv=none; b=tO2fBGerS9VBk2gXc5XL+U25nIzjBxV2OO5Jiv5+WNYyE7jTrwTLNAedqIzf3HzXLhKEbhNDAYkLNJp4evSfNNZMhxj8XA4WxppsCL5E2YJxCTdnYPacHs06bEUTZqKi7epF8BCEfJVzhJ85TcWY/JCWoQxUkAp4lvaKTsE1kHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739147; c=relaxed/simple;
	bh=2+Ajed5E1fXJz3nZ8NS8d6YJI4WoVgJl21IHABX6Yk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eq6t3GF8YcigamJSbQFzAKNT1ARybeH7Pe9ehKfHPtwLTdr8QG+Qgqk6PhInA4yP2ZEN5yGqRLyxSmCBqhzwuJgjr/o3fOiQbSvl9RzjY1/ER8EX1ZDUGtpaMv6Jfue86a7FctIPjp/ynDObRJ0PyN4fryUXrHoWmE8OLlB1QeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BSa17T9r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EACCEC19421;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1756739147; bh=2+Ajed5E1fXJz3nZ8NS8d6YJI4WoVgJl21IHABX6Yk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BSa17T9rYYkWiL0uWAaRAiiDcWIrspdRe7SoBWhpkVX8B5X4no2fkdz4CjMv/Rh0x
	 pjnENJfu+ROFE6BYUwZ5Ju+pXxSfjwy/TZeD2BPacdrdPN7Ku+iB2tUW6SYmeU5a1f
	 HuvqTNvJAGEyXnftupvXe4+2QY27D3tW+lwHMUM4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B43CA1007;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 01 Sep 2025 17:05:13 +0200
Subject: [PATCH v7 08/10] media: i2c: ov9282: add strobe_source v4l2
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-ov9282-flash-strobe-v7-8-d58d5a694afc@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756739145; l=1686;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=2+Ajed5E1fXJz3nZ8NS8d6YJI4WoVgJl21IHABX6Yk4=;
 b=8OHsE22R2cOPgWq3x0l1CfnNzun/KyfadK8N9dqtfPAy9BPhJwFcG3TI2RlZUE+FeJGvRe98H
 tmsICNYjHadCohKKUclKZBtCYU65z9X+ZzjjCfMwdnUE9djwmUetSDs
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
index c405e3411daf37cf98d5af3535702f8321394af5..9efc82a1929a76c6fb245e7dbfb5276a133d1c5d 100644
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
 
@@ -1443,6 +1444,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
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



