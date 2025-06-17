Return-Path: <linux-media+bounces-35028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4DADC35D
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D4EC7A68C4
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D556C290D8C;
	Tue, 17 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UARdv7I/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725F6273D7B;
	Tue, 17 Jun 2025 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145503; cv=none; b=mDuuyL51OKUOeSDBKQrPkwchL8EbD3GZ9F0BztBvSoWUoPvTEtTbUR1+TXoyc3wHVTA+wKDKpGkiQPzVpndpRBiNijWeNCReAN4iC8fQdL4xycQyLGyNhbOatrRmvKWmXwwk1X1DrMHWbgCMBiQc6+AffFVjybyUFehRsDtOB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145503; c=relaxed/simple;
	bh=UWUot8+GzH895q5xNuCz1v5OHUINGbiHBZ3BD3ADYX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0e6cfUgk0qg+bOqcNEdLwF8xAaI8oJ6K8VK9JFfBcuKbXrW6Ebq91A0ckvny6ub1f8dB7I9AgBhK6k45EPYNc5kHsNLf08r7iWTXJxqUykadeSPZ4Pyu29MCMSghs/MbotXctcslk4ZlUrFVYQjkeH5c3zayMz+lS/8JjbyUoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UARdv7I/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 313DDC4CEF2;
	Tue, 17 Jun 2025 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1750145503; bh=UWUot8+GzH895q5xNuCz1v5OHUINGbiHBZ3BD3ADYX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UARdv7I/4Cy3lX75c/r+cKTu/Lsy/s5V6FHoCzpAA+WiQqB9b2/bCNwhAtfhhWHx8
	 ujZjq1BB0V3AoQGm+CtNG0LHu845wtZrHSih7k5Ko8AF3f1w0MGqeC0wVlnR1FQYE4
	 sOJgeKXmiY3dmz/cKDQRt8oAn+2sBVNnjx1BlxD8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2946AC71157;
	Tue, 17 Jun 2025 07:31:43 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 17 Jun 2025 09:31:42 +0200
Subject: [PATCH v5 08/10] media: i2c: ov9282: add strobe_source v4l2
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-ov9282-flash-strobe-v5-8-9762da74d065@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750145501; l=1686;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=UWUot8+GzH895q5xNuCz1v5OHUINGbiHBZ3BD3ADYX4=;
 b=bpEuNPOqTYYT+fcLwGMXZjghWxiPYLrLi73EcKzRLU5ASu8f6ar0V8AC+nHaGIyKnpr7IIxG9
 jAa1lH+mK6MCneclEgl6k/tR9Yn8dEiXLLG3mDllUqRMCrYCvmOM5UV
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
index 871cd7e796531c1f958790eba733290d39e99f0c..2d77b9108bcd2499a40418919e260e7d53a9a64e 100644
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



