Return-Path: <linux-media+bounces-17195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9061896576D
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48397283AB7
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15D215442F;
	Fri, 30 Aug 2024 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s4/sHg8A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0935314D44F;
	Fri, 30 Aug 2024 06:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724998338; cv=none; b=qnAIeMwPM4MJlc1UbUX2JvfJx8CEv/M9OpAgRIz9ZmhHNPI4aL0ncJTJ/sYviq0oex2xa2CKUqf5iJJMO6WtsVgNsza7+jrGRJ9Nob5YyILLZYsaqPNGHAV3ghRdYwXKScVTWurFgfijkyPBOc6oQcij4NaGbwcwcc6tB5YAlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724998338; c=relaxed/simple;
	bh=RS94icNT3Eg1ti5P4VHowp58hHjlEiQghewC7c9ZRdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4dqTAt2gQYyQcQ9FjtcR2aBFHK9gU9ATmHSqZHrGSYUl0iM4Cem8ADrGkGRP2iPzfaPe6MdMecxJsiQy0g76zonWTWTffMBFRvArVFIcWqN1BUwPffdTSjk4N5XzrKp2jZ/M3kmSn+nQ9ZozvYvr37yKWdw9mdHs0ikbcrH8PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s4/sHg8A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C059AAD8;
	Fri, 30 Aug 2024 08:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724998266;
	bh=RS94icNT3Eg1ti5P4VHowp58hHjlEiQghewC7c9ZRdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s4/sHg8ALwJUHm5ZOWL54xlfL0miILM7yRdGp8SIFrYZk9gIqMrChE8nFIghJt2Sj
	 6vMCCV+PnOhBrcSIpiawk6l3b1Wj2vuw+CUepu00LqfzxRB8um52J3UxKj9u3cGn6C
	 fL3WFQRB1Hf/Nn1FP9/GLUNrx0bcq/ZD/1tcohfw=
From: Umang Jain <umang.jain@ideasonboard.com>
Date: Fri, 30 Aug 2024 11:41:52 +0530
Subject: [PATCH v4 2/2] media: imx335: Fix reset-gpio handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-imx335-vflip-v4-2-cb9f20fc7b87@ideasonboard.com>
References: <20240830-imx335-vflip-v4-0-cb9f20fc7b87@ideasonboard.com>
In-Reply-To: <20240830-imx335-vflip-v4-0-cb9f20fc7b87@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Martina Krasteva <martinax.krasteva@intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724998323; l=4046;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=RS94icNT3Eg1ti5P4VHowp58hHjlEiQghewC7c9ZRdY=;
 b=WS3Iz29bSo0Je4ynMwl7AtWMEvgu1kXD2Vj39Q3XQoJvlK12wlS4WynKSj2FSGR1XrSLK0I1r
 oTr5rI22EBFDNJcjICZjBu0skjOJ8Qr7EeCK5ZZKmwFgTil6Z+Hhg5+
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

Rectify the logical value of reset-gpio so that it is set to
0 (disabled) during power-on and to 1 (enabled) during power-off.

Set the reset-gpio to GPIO_OUT_HIGH at initialization time to make
sure it starts off in reset. Also drop the "Set XCLR" comment which
is not-so-informative.

The existing usage of imx335 had reset-gpios polarity inverted
(GPIO_ACTIVE_HIGH) in their device-tree sources. With this patch
included, those DTS will not be able to stream imx335 anymore. The
reset-gpio polarity will need to be rectified in the device-tree
sources as shown in [1] example, in order to get imx335 functional
again (as it remains in reset prior to this fix).

Cc: stable@vger.kernel.org
Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/linux-media/20240729110437.199428-1-umang.jain@ideasonboard.com/
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Following conclusions has been observed and discussed [2]:

- Original driver was reviewed [3] but, the improper handling of
  reset-gpios was missed in review.
- Commit fea91ee73b7c ("media: i2c: imx335: Enable regulator supplies")
  shows the driver didn't had regulator enablement support. The driver
  would have only worked for cases when the supplies were always-on.
- Commit 14a60786d72e ("media: imx335: Set reserved register to default value")
  reflects that the imx335 driver was un-usable due to a reserved
  register not been set to default.
- The original author is no longer using the driver nor it is used for its
  original purpose any more (confirmed by Sakari Ailus).
- It's extremely unlikely the driver has been or continues to be in
  use on ACPI based systems (comment by Sakari Ailus).

The above discussion points in a direction that driver does not cater
to a large user-base. Nonetheless, the breakage will be noticed by a few
users (if at all) hence, this explanation would help resolve the breakage
as soon as noticed (by using correct reset-gpio polarity as mentioned
in [1]).

[1]: Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
[2]: https://lore.kernel.org/linux-media/20240729110437.199428-1-umang.jain@ideasonboard.com/
[3]: https://lore.kernel.org/all/20210527142145.173-3-martinax.krasteva@linux.intel.com/
---
---
 drivers/media/i2c/imx335.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 990d74214cc2..54a1de53d497 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -997,7 +997,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 
 	/* Request optional reset pin */
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
 		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
 			PTR_ERR(imx335->reset_gpio));
@@ -1110,8 +1110,7 @@ static int imx335_power_on(struct device *dev)
 
 	usleep_range(500, 550); /* Tlow */
 
-	/* Set XCLR */
-	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
 
 	ret = clk_prepare_enable(imx335->inclk);
 	if (ret) {
@@ -1124,7 +1123,7 @@ static int imx335_power_on(struct device *dev)
 	return 0;
 
 error_reset:
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 
 	return ret;
@@ -1141,7 +1140,7 @@ static int imx335_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx335 *imx335 = to_imx335(sd);
 
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	clk_disable_unprepare(imx335->inclk);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 

-- 
2.45.0


