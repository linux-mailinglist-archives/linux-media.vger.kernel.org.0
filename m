Return-Path: <linux-media+bounces-47506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCC8C74887
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 15:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 729C2354749
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F763348477;
	Thu, 20 Nov 2025 14:23:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860A132D0E5
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648610; cv=none; b=CJvIVd/HKNefMxBM7zFdlNbkNtAzamLyB/TcEqNjZqu/d2Ehv74UCe5tHhORgTKZYwM/JQccX59mjY2U9hRLL0x2W99bCXDIwUTp3ETmuUj3sYcghMKGbmtA6Hn8anjhkPmvAfRMVsZTWJVgoSD3wyTQYhqQNLiCKYV4fAQlw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648610; c=relaxed/simple;
	bh=r7mLc3KHPv7p4Rv7ztLwFO9ubBmCS7q/cP/7DHEAMQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7FK4exBgWI/Z9nLw6zD1Kw2RqAJPPxJBlKznUYwNmC46Zm/4qD7brYWm3OJhXNvMwGV9nlRW1uGjnn0OxtnVLmAsJLLkHbCJN+v/57han2yOpruOL6/KPRUiXn+f2Rw1sHMyiM8tg0uUUDEJKsqaBNV0FIOdbnrWi70gkGGOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM5Z9-0004us-Bt; Thu, 20 Nov 2025 15:23:19 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 20 Nov 2025 15:22:54 +0100
Subject: [PATCH v3 2/4] media: adv7180: add support for ancillary devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-b4-adv7180-vpp-sub-device-v3-2-c9d80661e7d9@pengutronix.de>
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

Depending on other devices on the i2c bus, using a non-default address
for the CSI and VPP devices may be necessary.

Replace calls to i2c_new_dummy_device with i2c_new_ancillary_device,
which can directly use an i2c address from the device tree.

Program the actual addresses of the sub-devices when configuring the
chip.

Signed-off-by: Thorsten Schmelzer <tschmelzer@topcon.com>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v3:
- None
Changes in v2:
- None
---
 drivers/media/i2c/adv7180.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 378f4e6af12c..4152f2049a6d 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1066,13 +1066,13 @@ static int adv7180_select_input(struct adv7180_state *state, unsigned int input)
 
 static int adv7182_init(struct adv7180_state *state)
 {
-	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2)
+	if (state->csi_client)
 		adv7180_write(state, ADV7180_REG_CSI_SLAVE_ADDR,
-			ADV7180_DEFAULT_CSI_I2C_ADDR << 1);
+			      state->csi_client->addr << 1);
 
-	if (state->chip_info->flags & ADV7180_FLAG_I2P)
+	if (state->vpp_client)
 		adv7180_write(state, ADV7180_REG_VPP_SLAVE_ADDR,
-			ADV7180_DEFAULT_VPP_I2C_ADDR << 1);
+			      state->vpp_client->addr << 1);
 
 	if (state->chip_info->flags & ADV7180_FLAG_V2) {
 		/* ADI recommended writes for improved video quality */
@@ -1443,15 +1443,17 @@ static int adv7180_probe(struct i2c_client *client)
 		state->force_bt656_4 = true;
 
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
-		state->csi_client = i2c_new_dummy_device(client->adapter,
-				ADV7180_DEFAULT_CSI_I2C_ADDR);
+		state->csi_client =
+			i2c_new_ancillary_device(client, "csi",
+						 ADV7180_DEFAULT_CSI_I2C_ADDR);
 		if (IS_ERR(state->csi_client))
 			return PTR_ERR(state->csi_client);
 	}
 
 	if (state->chip_info->flags & ADV7180_FLAG_I2P) {
-		state->vpp_client = i2c_new_dummy_device(client->adapter,
-				ADV7180_DEFAULT_VPP_I2C_ADDR);
+		state->vpp_client =
+			i2c_new_ancillary_device(client, "vpp",
+						 ADV7180_DEFAULT_VPP_I2C_ADDR);
 		if (IS_ERR(state->vpp_client)) {
 			ret = PTR_ERR(state->vpp_client);
 			goto err_unregister_csi_client;

-- 
2.47.3


