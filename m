Return-Path: <linux-media+bounces-47706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC53C856D8
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 15:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9CDE835072E
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 14:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BF732692E;
	Tue, 25 Nov 2025 14:30:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133532571B
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081028; cv=none; b=ibjadlnKiP709m3UvDix3CrubwR3R7DLsnPEj3GGNdnr2lQxySoWqOHJpbvxGd5fJCFMKA/mAMk9n/CkdNQMzNXh891oYUA2kLU5cWReK3sZ+IW3yrsY2vvNUSt4s1bgQPBlKViwgO5Qo8wnAg3SRGHrR/XzN+87L/jX5AAWHNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081028; c=relaxed/simple;
	bh=Umdo3RJi4L6w+G2xY9NjVlD1A3EK54i5RJzkSuzPqyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTtD9IHZbyBXouUJlDSDgFt1mOkDNgnQTcTtyU//3Q3jMvNN40+Bz8yTIOxQlEFCSiHqgmC/TNkkbY+50bSbI1zc5pl8UAIERulknThMJSp0h3fysTVQdcsJFUbJr+7dLXHaJL0iK2i4sWH9wcDHw9wXn1sr+8nYlcBxchMAGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vNu3d-0003eq-Rc; Tue, 25 Nov 2025 15:30:17 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Tue, 25 Nov 2025 15:29:57 +0100
Subject: [PATCH v4 4/4] media: adv7180: fix frame interval in progressive
 mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251125-b4-adv7180-vpp-sub-device-v4-4-c772b9a80916@pengutronix.de>
References: <20251125-b4-adv7180-vpp-sub-device-v4-0-c772b9a80916@pengutronix.de>
In-Reply-To: <20251125-b4-adv7180-vpp-sub-device-v4-0-c772b9a80916@pengutronix.de>
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

The ADV7280-M may internally convert interlaced video input to
progressive video. If this mode is enabled, the ADV7280-M delivers
progressive video frames at the field rate of 50 fields per second (PAL)
or 60 fields per second (NTSC).

Fix the reported frame interval if progressive video is enabled.

Signed-off-by: Thorsten Schmelzer <tschmelzer@topcon.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- Simplify and document calculation of frame interval
---
 drivers/media/i2c/adv7180.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index d289cbc2eefd..669b0b3165b1 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -507,6 +507,13 @@ static int adv7180_get_frame_interval(struct v4l2_subdev *sd,
 		fi->interval.denominator = 25;
 	}
 
+	/*
+	 * If the de-interlacer is active, the chip produces full video frames
+	 * at the field rate.
+	 */
+	if (state->field == V4L2_FIELD_NONE)
+		fi->interval.denominator *= 2;
+
 	return 0;
 }
 

-- 
2.47.3


