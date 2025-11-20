Return-Path: <linux-media+bounces-47502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4976C74936
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 15:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81DE74F08F4
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498B5349B18;
	Thu, 20 Nov 2025 14:23:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308B034889E
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648608; cv=none; b=SAR/cYDj35m67WYO+PeWNzUag/R3xIUVxT9CKsy373B6KLpbWDHeeOHwmaQHmb8q8IYgJdpwmCt3YOQjckI25G2YzNfEik48GI++Hewl3UpXrNUDP8zA3Sz3LRkB5cKYHvvFypkeMoRXEsUFxpgfhzMt46tsh8VeUBpFXxvqrMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648608; c=relaxed/simple;
	bh=mU5bmU5Kv9Wew4r9yUlqgz0rahavdarKuOurro+crQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmkalLdMFhSBgObkv/PiTmNT5T8LdKMRHYG97PeOfCszWb+1N6g7boZB3fQZGj5ZG5oJiuoprz5xEKBCZWUFN+g90JlrGJjRo7TxmKar7S+zOC8iQlWftFqBI0c94cadkEvhh4DCVPHwZVwB1nGVBoIr9nF8KaH2Hh66BEu3gDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM5Z9-0004us-EV; Thu, 20 Nov 2025 15:23:19 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 20 Nov 2025 15:22:56 +0100
Subject: [PATCH v3 4/4] media: adv7180: fix frame interval in progressive
 mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-b4-adv7180-vpp-sub-device-v3-4-c9d80661e7d9@pengutronix.de>
References: <20251120-b4-adv7180-vpp-sub-device-v3-0-c9d80661e7d9@pengutronix.de>
In-Reply-To: <20251120-b4-adv7180-vpp-sub-device-v3-0-c9d80661e7d9@pengutronix.de>
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
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
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


