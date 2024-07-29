Return-Path: <linux-media+bounces-15444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E0693F39C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FDB31C21C73
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ED6146A87;
	Mon, 29 Jul 2024 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JPnlZUPo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0FD146588;
	Mon, 29 Jul 2024 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251100; cv=none; b=vDs5brJXeWW1aFCghsuLCJnlkT879I7hxrVY8OUbBSBwySydXg9CpMsNt4i29UD6b65rQoXyKONYuGWPTXZWvfvHeNTRAl223lpychHDk55f8zG9QhfMjbzrZYqnDvS9XJEqzPeT14zCqCE6U4iJF4oASjZlYwtVYuIohon+RSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251100; c=relaxed/simple;
	bh=s6ZiWKZZjxUZoA1u4oZ8Pk6olyRRMFuO9oT+4utb0J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpXAfuRctjJPkKfUP98V/l0Zl1sLLq3RFvF34IWu08h4tcVZZe/fTVj/vL+If5I7mh2rVHuYaTaQhcc7p+NuyKWl8KQb9yEWfKoQ9kyNnKbBtc9Emz9KecR58mnRDpk/kiDEUZ6CQryi11bbKigHSPp6rPdZBEPGHjwwHg6pOZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JPnlZUPo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF4EE63F;
	Mon, 29 Jul 2024 13:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722251050;
	bh=s6ZiWKZZjxUZoA1u4oZ8Pk6olyRRMFuO9oT+4utb0J0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPnlZUPouze5PqoWSo50X2de78Usdq+fYiQ4tCCE93cSBlKRDy7fvs1gzHjmi5P9J
	 dxDMpegngE1k1Iw1oxQzA7vVZorRKuwqusIJ3Dq9lJIY1/dYS+Pzf0LV52QoO52qYc
	 f2QUsbwUEdnGGCf3JB5mOugF2/F+pv/Dq2kXVD+8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
Date: Mon, 29 Jul 2024 16:34:37 +0530
Message-ID: <20240729110437.199428-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240729110437.199428-1-umang.jain@ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rectify the logical value of reset-gpio so that it is set to
0 (disabled) during power-on and to 1 (enabled) during power-off.

Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
time to make sure it starts off in reset.

Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index cd150606a8a9..7241fc87ef84 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1057,7 +1057,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 
 	/* Request optional reset pin */
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
 		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
 			PTR_ERR(imx335->reset_gpio));
@@ -1171,7 +1171,7 @@ static int imx335_power_on(struct device *dev)
 	usleep_range(500, 550); /* Tlow */
 
 	/* Set XCLR */
-	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
 
 	ret = clk_prepare_enable(imx335->inclk);
 	if (ret) {
@@ -1184,7 +1184,7 @@ static int imx335_power_on(struct device *dev)
 	return 0;
 
 error_reset:
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 
 	return ret;
@@ -1201,7 +1201,7 @@ static int imx335_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx335 *imx335 = to_imx335(sd);
 
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	clk_disable_unprepare(imx335->inclk);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 
-- 
2.45.0


