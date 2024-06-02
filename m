Return-Path: <linux-media+bounces-12412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472408D7809
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 22:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A29E8B22001
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 20:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3B185C44;
	Sun,  2 Jun 2024 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="X/weH5KZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta56.mxroute.com (mail-108-mta56.mxroute.com [136.175.108.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D328593D
	for <linux-media@vger.kernel.org>; Sun,  2 Jun 2024 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717359655; cv=none; b=pqzHcBvHcscRMvUby6e3miIeI0kRM3zA3vcAgyiYpCf2meKuRr3vMgyIpCcQjxHuS//FQ4ADRrNwZulkFZcwV6QX218mc1Oj8Cc7p8TyIKA3/bUFmIe+56d+t8pvc8hE4TOfZScWwCu6hJQIN7aeUA431LrA0BKCz6aYvZnfXvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717359655; c=relaxed/simple;
	bh=dqyM9Z9VYN6ZFqUOEdi2X52oaA72CYezLlG4kpMzZnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pmg134KRdfk8zPr2sKHQS0OzGGHr/ZF4dUkqa43e2Aj9jsQUbuagFNzmOxj5/ZR/OhBVBFb9EdO4PXv9jCR18YN/af6Fdu4h2phYp8++XktLASkJ0ZBqMB+NAk2GZEvT7Xvi4cZSBUKUNJ4fOdVNaGnV5Pl1X/trCvLArjaqKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=X/weH5KZ; arc=none smtp.client-ip=136.175.108.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta56.mxroute.com (ZoneMTA) with ESMTPSA id 18fda97004d000e2b6.013
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Jun 2024 20:14:40 +0000
X-Zone-Loop: 9ad75901c48fe0152e1f0a5beb3c3964c5c0e3f5009f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4COuKPQHOipeJ03Bp2DqJuNGbhMNq4ef6Yfoeygk1Yg=; b=X/weH5KZgDfXUAB+/ltW3CxIER
	D2K54dVjZlm8OXDZuzROejiF2p+vH/f0SzbbcGYUVOeO789dSlXhxFKEmXvFUVIG6UZ6S/TSNtMSl
	ytdCziI75r0er5EXlmmvneXj2hPHUF8EmyLz3MDaFy1qImF6wdJ9vBX4FPGJK8i5xRMR73ivsBF3r
	ySMrUX+7QUdnFTwW7BwIIYM0bPu4JJu0N603jDskSYBX/3zcyOF4qw20/lbRRjIlPLkVcARl1X4GI
	JXi2BNTgOklVzUFy3HatfyLG8yhQzdqLr4BHJxTcHBL7n1+NX20ihGFu67WrX40LAg2tr4ogPFdgU
	NG4yR8Tw==;
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
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Ondrej Jirman <megous@megous.com>,
	Luis Garcia <git@luigi311.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v6 21/23] media: i2c: imx258: Add support for reset gpio
Date: Sun,  2 Jun 2024 14:13:43 -0600
Message-ID: <20240602201345.328737-22-git@luigi311.com>
In-Reply-To: <20240602201345.328737-1-git@luigi311.com>
References: <20240602201345.328737-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Ondrej Jirman <megi@xff.cz>

It was documented in DT, but not implemented.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/imx258.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index f043200e336e..671fe176c64c 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -698,6 +698,8 @@ struct imx258 {
 	unsigned int lane_mode_idx;
 	unsigned int csi2_flags;
 
+	struct gpio_desc *reset_gpio;
+
 	/*
 	 * Mutex for serialized access:
 	 * Protect sensor module set pad format and start/stop streaming safely.
@@ -1245,7 +1247,10 @@ static int imx258_power_on(struct device *dev)
 		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 	}
 
-	return ret;
+	gpiod_set_value_cansleep(imx258->reset_gpio, 0);
+	usleep_range(400, 500);
+
+	return 0;
 }
 
 static int imx258_power_off(struct device *dev)
@@ -1254,6 +1259,9 @@ static int imx258_power_off(struct device *dev)
 	struct imx258 *imx258 = to_imx258(sd);
 
 	clk_disable_unprepare(imx258->clk);
+
+	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
+
 	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
 	return 0;
@@ -1559,6 +1567,12 @@ static int imx258_probe(struct i2c_client *client)
 	if (!imx258->variant_cfg)
 		imx258->variant_cfg = &imx258_cfg;
 
+	/* request optional reset pin */
+	imx258->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx258->reset_gpio))
+		return PTR_ERR(imx258->reset_gpio);
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
-- 
2.44.0


