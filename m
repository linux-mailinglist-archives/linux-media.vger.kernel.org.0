Return-Path: <linux-media+bounces-8020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8C88F2BF
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 00:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0EAD297CFA
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1481553AC;
	Wed, 27 Mar 2024 23:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="CQZa0O3P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta225.mxroute.com (mail-108-mta225.mxroute.com [136.175.108.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0E155398
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 23:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581497; cv=none; b=t/gcRXsnbU8uH4jmniOPGJkbnYv5pdQnfEurTmoYb1QQyc7m0ZUBgad1gtdDOA2bXyLRtmREp0+FL6/ECZEZnWz+OOhaDDApC+NILmCCEedPYhsIs4rPtjmAG/IFpMq7RotNzfF8u7VlcKosC7y+Pu7AB/oylnipc2DpOnUgzqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581497; c=relaxed/simple;
	bh=0vPk/AhRfa0eJWWuR2HM/VywuaD7+XD66XjsHchVAAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adnQaXQzxMRCxmhhABqfW7wIw8C5pjQ6VQknv3reTXtU8h5a7coWA0F0a9KD0fgORnAPlMpQMCcJDF2jZ/S+jP22Bh/DTwb1/jVp4iDtdLvfxSHCX5cwEwiLTuqCXmCaUrK2KCHmd2SBbOLK3BA9QuhdcKSs7ks6fnykIWTFX04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=CQZa0O3P; arc=none smtp.client-ip=136.175.108.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta225.mxroute.com (ZoneMTA) with ESMTPSA id 18e8234c8880003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:18:01 +0000
X-Zone-Loop: ce528b36b9e4b9d629d5df1f2890d97c880a638cf828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bZsei1tpRAidGrbzZBEBrMkrAWAYUFFFPXs9zNhTnjM=; b=CQZa0O3PSCbFR1uiO7kH14OhAl
	MRIrBoW588+LBeFTMgqoC9m6Q6QhFF9QJXofPkO5Y608wcdb0mwdS6uG971ktGYzOVPFDlYRrMxT5
	IdUr7FImKuxuMA+r9BaBdB+OKEHWTAGM2a1CpTzW/dkctGnYYIiOghw5joJ7TBgpxNhMvXDT9KF+5
	+tx2NWcH66UGXEkkA8Sv+WMKabdhX1UQ6i5zz7Zu8XnkY2SXNq6/B+3VvboiVrKMTNrmjlSlcQiDT
	nACFUSO4pwvsJzaOX+uq8qWVO65/VB4hXQnNfhxEKxrgq/aDrjIKRVHJ34Zf6krUjS6W9wFpMESaN
	3sPxq0kg==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Luigi311 <git@luigi311.com>,
	Ondrej Jirman <megi@xff.cz>
Subject: [PATCH 22/23] drivers: media: i2c: imx258: Add support for powerdown gpio
Date: Wed, 27 Mar 2024 17:17:08 -0600
Message-ID: <20240327231710.53188-23-git@luigi311.com>
In-Reply-To: <20240327231710.53188-1-git@luigi311.com>
References: <20240327231710.53188-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luigi311 <git@luigi311.com>

On some boards powerdown signal needs to be deasserted for this
sensor to be enabled.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 .../devicetree/bindings/media/i2c/sony,imx258.yaml  |  4 ++++
 drivers/media/i2c/imx258.c                          | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c7856de15ba3..0414085bf22f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -35,6 +35,10 @@ properties:
   reg:
     maxItems: 1
 
+  powerdown-gpios:
+    description: |-
+      Reference to the GPIO connected to the PWDN pin, if any.
+
   reset-gpios:
     description: |-
       Reference to the GPIO connected to the XCLR pin, if any.
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index c559a06bf180..d8c51d5f04e0 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -686,6 +686,8 @@ struct imx258 {
 	unsigned int lane_mode_idx;
 	unsigned int csi2_flags;
 
+	struct gpio_desc *powerdown_gpio;
+
 	/*
 	 * Mutex for serialized access:
 	 * Protect sensor module set pad format and start/stop streaming safely.
@@ -1220,6 +1222,8 @@ static int imx258_power_on(struct device *dev)
 	struct imx258 *imx258 = to_imx258(sd);
 	int ret;
 
+	gpiod_set_value_cansleep(imx258->powerdown_gpio, 0);
+
 	ret = regulator_bulk_enable(IMX258_NUM_SUPPLIES,
 				    imx258->supplies);
 	if (ret) {
@@ -1231,6 +1235,7 @@ static int imx258_power_on(struct device *dev)
 	ret = clk_prepare_enable(imx258->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clock\n");
+		gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
 		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 	}
 
@@ -1245,6 +1250,8 @@ static int imx258_power_off(struct device *dev)
 	clk_disable_unprepare(imx258->clk);
 	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
+	gpiod_set_value_cansleep(imx258->powerdown_gpio, 1);
+
 	return 0;
 }
 
@@ -1548,6 +1555,12 @@ static int imx258_probe(struct i2c_client *client)
 	if (!imx258->variant_cfg)
 		imx258->variant_cfg = &imx258_cfg;
 
+	/* request optional power down pin */
+	imx258->powerdown_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(imx258->powerdown_gpio))
+		return PTR_ERR(imx258->powerdown_gpio);
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
-- 
2.42.0


