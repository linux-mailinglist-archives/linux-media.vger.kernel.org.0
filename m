Return-Path: <linux-media+bounces-37405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB7B00AB5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785484E0C3C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84D12F49FE;
	Thu, 10 Jul 2025 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P6RmXl6E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0BA2F19AB
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169822; cv=none; b=CnVFwX0cRjU8aIRJk2qNL47PyloY3D5uHFfekncaFUMD9b2j/ha3MQpeoakt5xpQjnpcYzm2hQHReP1q+hJP44CPWf8XfeRvIRap+Y2TqFOArAGX5psBpNM1BYtdyEK8hXmIvfC0l2dDRVEFC5TaY59wcUypW2GYtkczZyHuFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169822; c=relaxed/simple;
	bh=ByTGV3/9I/lzWLe71iT6zgWiB6wqK2M6FSthq7nbFmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jH8WkQtGVoICA5l3yZjPC9lXcA24u5YecGKjsEcppRpCpQftzdaJoYoq/IOdBjQBKNp7IEToq9YTurSg/Qgq8Ys7DsgEKReySwUa6vdK09zGOkxKf2D7WV/0eNGQka6LkNGq4vRam2OO7mYkDqpsGKvhq+9dk7103ZE4flW8+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P6RmXl6E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5E5EC3DC;
	Thu, 10 Jul 2025 19:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169790;
	bh=ByTGV3/9I/lzWLe71iT6zgWiB6wqK2M6FSthq7nbFmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6RmXl6EMHPlzjwneT0JXiqh6fdcBp24tcrytdau4qSR3tddPNEj2rR5D4Fr2rQXX
	 ol3rStwI+w+dGA945bKiwzRHc0GKNkJeT3TL5Wb3FJrR4wGHPtCs17tveOmHfwMYoB
	 C3uefo1liBq1CyR3QjlWjXRmRn8fzK4hxtrN9wX0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH 62/72] media: i2c: imx290: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:47:58 +0300
Message-ID: <20250710174808.5361-63-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several camera sensor drivers access the "clock-frequency" property
directly to retrieve the external clock rate, or modify the clock rate
of the external clock programmatically. Both behaviours are valid on a
subset of ACPI platforms, but are considered deprecated on OF platforms,
and do not support ACPI platforms that implement MIPI DisCo for Imaging.
Implementing them manually in drivers is deprecated, as that can
encourage copying deprecated behaviour for OF platforms in new drivers,
and lead to differences in behaviour between drivers. Instead, drivers
that need to preserve the deprecated OF behaviour should use the
devm_v4l2_sensor_clk_get_legacy() helper.

This driver supports OF platforms only. The "clocks" and
"clock-frequency" properties were initially mandatory in the DT
bindings. The driver retrieves the clock, retrieves the clock rate from
the "clock-frequency" property, and sets the clock rate to the retrieved
rate. If the rate does not match one of the expected rates, the driver
fails probing. This is deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 81c0af959df4..8b11f5030220 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1425,14 +1425,14 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
 static int imx290_init_clk(struct imx290 *imx290)
 {
 	u32 xclk_freq;
-	int ret;
 
-	ret = device_property_read_u32(imx290->dev, "clock-frequency",
-				       &xclk_freq);
-	if (ret) {
-		dev_err(imx290->dev, "Could not get xclk frequency\n");
-		return ret;
-	}
+	imx290->xclk = devm_v4l2_sensor_clk_get_legacy(imx290->dev, "xclk",
+						       false, 0);
+	if (IS_ERR(imx290->xclk))
+		return dev_err_probe(imx290->dev, PTR_ERR(imx290->xclk),
+				     "Could not get xclk\n");
+
+	xclk_freq = clk_get_rate(imx290->xclk);
 
 	/* external clock must be 37.125 MHz or 74.25MHz */
 	switch (xclk_freq) {
@@ -1448,12 +1448,6 @@ static int imx290_init_clk(struct imx290 *imx290)
 		return -EINVAL;
 	}
 
-	ret = clk_set_rate(imx290->xclk, xclk_freq);
-	if (ret) {
-		dev_err(imx290->dev, "Could not set xclk frequency\n");
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -1599,11 +1593,6 @@ static int imx290_probe(struct i2c_client *client)
 		return ret;
 
 	/* Acquire resources. */
-	imx290->xclk = devm_v4l2_sensor_clk_get(dev, "xclk");
-	if (IS_ERR(imx290->xclk))
-		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
-				     "Could not get xclk\n");
-
 	ret = imx290_get_regulators(dev, imx290);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Cannot get regulators\n");
@@ -1614,7 +1603,7 @@ static int imx290_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx290->rst_gpio),
 				     "Cannot get reset gpio\n");
 
-	/* Initialize external clock frequency. */
+	/* Initialize external clock. */
 	ret = imx290_init_clk(imx290);
 	if (ret)
 		return ret;
-- 
Regards,

Laurent Pinchart


