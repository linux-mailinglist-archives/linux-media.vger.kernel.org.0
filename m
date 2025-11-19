Return-Path: <linux-media+bounces-47395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9FC702A1
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 17:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45FF03A8D54
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 16:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B5636C0C3;
	Wed, 19 Nov 2025 16:26:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DF025D546
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569569; cv=none; b=GC0/s9pGhJqhA3R9FI5fBB/8DQUBXFptF73ES6BU+axN0tXH+v3c2IUSB9ogkUEq0TAvZJM03/6hmTb2CYi8ZieI2FaEINMOUKLCtHGflIxp5eNoHcjmLsssKN82OSgf6zbujyHC296BhdEKtzWI6NcHPHHEpdZf4ab9q9lIge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569569; c=relaxed/simple;
	bh=XbJldmTxcgOfioNkF9c7u8P3Zg65XfkU6nJShBamrEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRQD/r3A6Ex9EfwMjRikcCPsBT9fzz26qgQr4jFHMq9CkukGLvyUlCL3hj0H34DCpQlS8Y9YwphNtCStyFj3KxnxOoXlu+A7B1aaNi4Bg2sXu9hhddaeCpVERTkBy1ph8SgtVww5XwCT20BduybKFuZghjqpIGSAwog/i4oNDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vLl0L-0000aE-8m; Wed, 19 Nov 2025 17:26:01 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Wed, 19 Nov 2025 17:25:53 +0100
Subject: [PATCH v2 3/4] media: adv7180: implement g_register and s_register
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-b4-adv7180-vpp-sub-device-v2-3-86a7790b63ab@pengutronix.de>
References: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
In-Reply-To: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>, 
 Thorsten Schmelzer <tschmelzer@topcon.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

From: Thorsten Schmelzer <tschmelzer@topcon.com>

The g_register and s_register callbacks are useful for debugging the
adv7180.

Implement the callbacks to expose the register debugging to userspace.

Signed-off-by: Thorsten Schmelzer <tschmelzer@topcon.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- None
---
 drivers/media/i2c/adv7180.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 4152f2049a6d..d289cbc2eefd 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -969,6 +969,32 @@ static int adv7180_subscribe_event(struct v4l2_subdev *sd,
 	}
 }
 
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static int adv7180_g_register(struct v4l2_subdev *sd,
+			      struct v4l2_dbg_register *reg)
+{
+	struct adv7180_state *state = to_state(sd);
+	int ret;
+
+	ret = adv7180_read(state, reg->reg);
+	if (ret < 0)
+		return ret;
+
+	reg->val = ret;
+	reg->size = 1;
+
+	return 0;
+}
+
+static int adv7180_s_register(struct v4l2_subdev *sd,
+			      const struct v4l2_dbg_register *reg)
+{
+	struct adv7180_state *state = to_state(sd);
+
+	return adv7180_write(state, reg->reg, reg->val);
+}
+#endif
+
 static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 	.s_std = adv7180_s_std,
 	.g_std = adv7180_g_std,
@@ -982,6 +1008,10 @@ static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 static const struct v4l2_subdev_core_ops adv7180_core_ops = {
 	.subscribe_event = adv7180_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register = adv7180_g_register,
+	.s_register = adv7180_s_register,
+#endif
 };
 
 static const struct v4l2_subdev_pad_ops adv7180_pad_ops = {

-- 
2.47.3


